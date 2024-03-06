# What is nix?

Let us assume that you are a developer. I think I will go for a "Javascript" developer since that is what most people these days are anyways. And let us assume that you use npm for managing packages.

How would you go about installing a dependency?

`npm install is-thirteen`

OK, do you know what that does to your repo? (No you don't, because you only think about yourself). Let me show you.

First thing that it does is modify your package.json file. `is-thirteen` gets added to the dependencies list.

```bash
diff --git a/package.json b/package.json
index 6ef6e28..d059850 100644
--- a/package.json
+++ b/package.json
@@ -8,5 +8,7 @@
   },
   "author": "Abin Simon <mail@meain.io>",
   "license": "MIT",
-  "dependencies": {}
+  "dependencies": {
+    "is-thirteen": "^2.0.0"
+  }
 }
```

What this specifies is "we need a version of is-thirteen which is above 2.0.0 and below 3.0.0". 

While that is useful, one thing that we all have learnt is that we cannot relay on people to bump versions properly. So we need to say what exactly is the version that we are depending on. That is where the package-lock.json file comes in

```bash
diff --git a/package-lock.json b/package-lock.json
index e5ab36e..e293cdd 100644
--- a/package-lock.json
+++ b/package-lock.json
@@ -1,5 +1,21 @@
 {
   "name": "nixblog",
   "version": "1.0.0",
-  "lockfileVersion": 1
+  "lockfileVersion": 1,
+  "requires": true,
+  "dependencies": {
+    "is-thirteen": {
+      "version": "2.0.0",
+      "resolved": "https://registry.npmjs.org/is-thirteen/-/is-thirteen-2.0.0.tgz",
+      "integrity": "sha1-otvQ9at+EKTQGG6aCyQmMiTT+bE=",
+      "requires": {
+        "noop3": "^13.7.2"
+      }
+    },
+    "noop3": {
+      "version": "13.8.1",
+      "resolved": "https://registry.npmjs.org/noop3/-/noop3-13.8.1.tgz",
+      "integrity": "sha1-CuZBS21947bYUFXNKpIMGg1hrW4="
+    }
+  }
 }
 ```

 If you see above, we have a specific version of is-thirteen. We also do this for any of the dependencies of is-thirteen. We pin the dependency noop3 to 13.8.1. This gets done all the way down the stack. What this means is that we can know exactly what version of everything we were using. But the dependency pinning stops at noop3. 
 
 But what about the node version we are using?
 What about the compiler used to build node? What about the kernel? What about any extra env variables/flags used while building the kernel?

 That is exactly where nix comes in, it lets you pin everything all the way down. At least that is what the idea of nix is in general. Nix can easily produce replicabable environments that are consistent across machines.

 ## Nix In Action

 **Build**

 `nix build "nixpkgs#bat"`
 
 **Run**

 `echo "Hello Nix" | nix run "nixpkgs#ponysay"`

 **Develop**

 `nix develop "github:DeterminateSystems/zero-to-nix#javascript"`

**Search**

`nix search nixpkgs cargo`