********************************************************************************

```
██████╗ ███████╗ █████╗  ██████╗████████╗              ███╗   ██╗ █████╗ ████████╗██╗██╗   ██╗███████╗
██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝              ████╗  ██║██╔══██╗╚══██╔══╝██║██║   ██║██╔════╝
██████╔╝█████╗  ███████║██║        ██║       █████╗    ██╔██╗ ██║███████║   ██║   ██║██║   ██║█████╗  
██╔══██╗██╔══╝  ██╔══██║██║        ██║       ╚════╝    ██║╚██╗██║██╔══██║   ██║   ██║╚██╗ ██╔╝██╔══╝  
██║  ██║███████╗██║  ██║╚██████╗   ██║                 ██║ ╚████║██║  ██║   ██║   ██║ ╚████╔╝ ███████╗
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝                 ╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝  ╚══════╝
```

Copilot Context Instructions:
- Do not make changes to directories outside of `ReactNativeApps/` without my express approval.

Our senior technology leadership wants the engineering team to build an application powered by React-Native. I'm new to the React JS programming language and the general React Native ecosystem, and I don't know where to start. The `ReactNativeApps/` repository is intended to host a variety of sample app projects, that the rest of my team will use as a point-of-reference for developing large-scale enterprise applications. 

Leadership also wants you to perform research and write a detailed technical "Quick Start" guide in the `ReactNativeApps/README.md` for the developers on our team to install a React Native development environment on their macOS and Windows workstations. Our developers use Homebrew on macOS, and Chocolatey on Windows. The documentation needs to include links to important website resources and CLI commands that are recommended to be run to set up the environment. The documentation also needs to include important details about the Go language for our developers that are new to the language and its ecosystem.

********************************************************************************

Copilot Context Instructions:
- Do not make changes to directories outside of `ReactNativeApps/` without my express approval.

Our senior technology leadership wants the engineering team to build an application powered by React-Native. I'm new to the React JS programming language and the general React Native ecosystem, and I don't know where to start. The `ReactNativeApps/` repository is intended to host a variety of sample app projects, that the rest of my team will use as a point-of-reference for developing large-scale enterprise applications. 

Help me build a starter "Login Screen" application, that follows some of the React-Native "Best Practices". You can refer to the `mattermost/` and `reactotron/` repositories in my VS Code workspace for a solid reference of React Native application architecture. Remember that the `ReactNativeApps/` repo is intended to host several small proof-of-concept applications using the Go infrastructure. Let's get started.

********************************************************************************

I have run the command `npm run android` and it spawns a new Terminal instance that says "Welcome to Metro", and I also have an Android Emulator running. I see console output that says: 
```
info Opening app on Android...
info A dev server is already running for this project on port 8081.
```

And I also see this error output:
```
[20:20:59] schanzke:LoginScreenApp git:(master*) $ npm run android

> login-screen-app@1.0.0 android
> react-native run-android

(node:91866) [DEP0040] DeprecationWarning: The `punycode` module is deprecated. Please use a userland alternative instead.
(Use `node --trace-deprecation ...` to show where the warning was created)
error Android project not found. Are you sure this is a React Native project? If your Android files are located in a non-standard location (e.g. not inside 'android' folder), consider setting `project.android.sourceDir` option to point to a new location.
```

What am I missing? (I don't think our project has the suggested 'android' folder - will we need to create that in a subsequent step?)

What is the quickest path to validating that the project compiles and deploys "an app" successfully - through a Web Browser?

********************************************************************************
