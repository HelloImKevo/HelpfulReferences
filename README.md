# Helpful References
A collection of helpful references ranging from git tips and tricks to shell scripting examples.

# Git Command References

## Git Resources
An excellent, free, open-source difftool: **GitHub Desktop**  
https://github.com/desktop/desktop

## Git: CRUD (Create, Read, Update, Delete)
```
# Create a New Branch, based off Current Branch
git checkout -b <name-of-new-branch>

# Create new remote branch
git checkout -b feature-branch-name
git push -u origin feature-branch-name

# Delete a remote branch
git push origin --delete pr-merged-feature
git push origin :pr-merged-feature

# Fetch remote branches and prune deleted remote branches
git fetch origin --prune
```

## Git: Standard Stuff
```
# Get current branch / changes status
git status
git log
git branch

# Show remote URL / filepath
git remote show origin
git branch -a
git config -l
git branch --remote

# Show all local branches with very verbose output, which includes
# the associated remote origin branch, and whether it still exists.
git branch -vv

# Checkout and pull an origin branch
git checkout develop && git pull

# Synchronizing your Local Branch with a Source Branch
git checkout develop-my-feature && git rebase develop

# Rebasing Dependent Branches using rebase onto
# retrieve your old branch after committing... (noted in arcanist land output)
# ex: git checkout -b dev-old-branch 622b869755986e198dfaac5534b6e7a7394f65a0
git checkout my-feature-branch
git rebase --onto dev-old-branch develop

# Modifying your Local Branch
git add <projectdir/src/com/ui/SomeCoolActivity.java>
git commit -a -m "Custom Title Message"

# See how many lines of code you changed
git diff --shortstat

# Showing file Differences between Branches
git diff --shortstat develop..master
git diff --name-status develop..master

# Un-commit and stage changes from most recent commit
git reset --soft HEAD~1

# Remove all Deleted files
git rm $(git ls-files --deleted)

# Remove files marked as 'Deleted by them' during a nasty merge
git rm $(git diff --name-only --diff-filter=U)

# Special git remove stuff
git rm -r directory_to_remove
git rm '*.txt' (Remove all text files)
git commit -m "Message describing commit"

# Remove a GitIgnored File that is being Tracked
git rm -r --cached .
git add .

# Restore the state of any file from a remote branch
git checkout origin/master /Users/person/GitProjects/app/Android/Activity.java

# Search history for a specific keyword
git log --all --grep='keyword'
```


## Git: Re-Sync Local Branch with Existing Remote Branch
```
# Useful when you need to delete your local branch, create a new local
# branch, and then point it to an existing remote branch.
git branch --set-upstream-to=origin/task/kevo/JIRA-123-Integrate-KMP-MTM-Client-Into-Core
```


## Git: The Stash
```
# Stash your local changes
git add .
git stash
git stash save "temporarily add new bluetooth SDK v0.9.8"
git stash apply stash^{/temporarily add}
git stash apply stash@{0}

# Apply stashed changes & remove the stash
git stash pop stash@{5}

# Delete a stash
git stash drop stash@{12}

# Preview your stashed changes
git stash list
git stash show -p
git stash show -p stash@{2}

# Roll back a local commit and put it in the stash, so it can
# be applied to several branches.
git reset --soft HEAD~1
git add . && git stash save "Changes I want to use on multiple branches"
```

## Git: Config
```
# Check what the current remote repository URL is
git config --get remote.origin.url

# Show your user email address for this specific repository
git config --get user.email

# Set your user email address for this specific repository
git config user.email "JohnSmith@gmail.com"

# List all git config settings
git config --list

# List only the global git config settings
git config --global -l
```

## Git: Cool Tricks
```
# Count how many commits in a range
git rev-list newer_hash ^older_hash --count
```


## Git: Diff, Show & Log Tricks
```
# Show the list of files that were changed with the most recent commit in `HEAD`
git show --name-only --oneline HEAD
```


## Git: Logging and Viewing History
```
# Show commits by author before a specific date
git log --oneline -10 --author kevo --before "Oct 30 2019"

git log --oneline --graph --all --decorate --abbrev-commit
git log --oneline --decorate
git log develop --oneline --graph --decorate --abbrev-commit
git log feature-x --oneline --graph --decorate --abbrev-commit
git log release-pro-6.22.0 --oneline --graph --decorate --abbrev-commit
git log develop --pretty=format:'%C(yellow)%h;%Cred%ad;%Cblue%an;%Creset%s' --date=short | column -ts ';' | less -r
git log develop --author="Smith" --pretty=format:'%C(yellow)%h;%Cred%ad;%Cblue%an;%Creset%s' --date=short | column -ts ';' | less -r
git log new-feature --author="John" --pretty=format:'%C(yellow)%h;%Cred%ad;%Cblue%an;%Creset%s' --date=short | column -ts ';' | less -r

git log qa --oneline --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an : %Creset%s' --date=short f1cefdf9205f 3a8406a31b2c
git log --oneline --merges --all --decorate
git log qa --merges --pretty=format:'%C(yellow)%h;%Cred%ad;%Cblue%an;%Creset%s' --date=short | column -ts ';' | less -r
git log qa --oneline --graph --all --decorate --abbrev-commit --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an : %Creset%s' --date=short

####################################################################
# Formats the git log output to include the commit hash, the date,
# author, and title, with the "Bash Less" navigation mechanism 
# (press 'q' to quit).
#
# See also: https://git-scm.com/docs/pretty-formats
####################################################################
git log master --pretty=format:'%C(yellow)%h=%Cred%ad=%Cblue%an=%Creset%s' --date=short | column -ts '=' | less -r

# Total changes for specific author
git log --author="_Your_Name_Here_" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -

# Rough estimate of contributions by all authors
git log --shortstat --pretty="%cE" | sed 's/\(.*\)@.*/\1/' | grep -v "^$" | awk 'BEGIN { line=""; } !/^ / { if (line=="" || !match(line, $0)) {line = $0 "," line }} /^ / { print line " # " $0; line=""}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\1 0 insertions\(+\), \2/;s/\(\+\)$/\(\+\), 0 deletions\(-\)/;s/insertions?\(\+\), //;s/ deletions?\(-\)//' | awk 'BEGIN {name=""; files=0; insertions=0; deletions=0;} {if ($1 != name && name != "") { print name ": " files " files changed, " insertions " insertions(+), " deletions " deletions(-), " insertions-deletions " net"; files=0; insertions=0; deletions=0; name=$1; } name=$1; files+=$2; insertions+=$3; deletions+=$4} END {print name ": " files " files changed, " insertions " insertions(+), " deletions " deletions(-), " insertions-deletions " net";}'
```

## Git: Live Dangerously
```
############################################
#                                          #
#  Merging / Rewriting Git Branch History  #
#                                          #
############################################
git checkout master

# Use this when you know that all contents from source branch should be accepted.
git merge -X theirs develop

# Checks any remaining differences from the branch, into the current branch.
git checkout develop .

# If the previous step introduced more changes, usually they should be amended
# to the "merge" commit (this keeps the history cleaner).
git commit --amend

# Compares the branches; if there are differences, something went wrong.
# The contents of the branches should be identical when merging down. 
git difftool develop

############################################
#                                          #
#  Force Push to Fix Broken Remote Branch  #
#                                          #
############################################
# Force Push to Fix a Broken or Diverged Remote Branch
git checkout develop

# Push your local branch to another local branch
git push --force . develop:stage
git checkout stage

# Confirm that the branches are identical;
# it is likely that the branch is diverged from origin.
git diff --shortstat develop..stage

# This command requires repo "Dangerous Change Protection" to be disabled.
git push --force origin stage

############################################
#                                          #
#       Permanently Erasing History        #
#                                          #
############################################
git checkout develop
git reset --hard 3cd5022c

# Deletes the remote branch entirely
git push origin :develop

# Pushes all commits in the life of the branch to the remote repo
git push origin develop
```

# Maintaining a Clean Git History
Over the course of my career, I constantly refer to this 2014 writeup by Chris Beams that describes best practices for Git commits: https://chris.beams.io/posts/git-commit/  

## Introduction: Why good commit messages matter
If you browse the log of any random Git repository, you will probably find its commit messages are more or less a mess. For example, take a look at these gems from my early days committing to Spring:
```
$ git log --oneline -5 --author cbeams --before "Fri Mar 26 2009"

e5f4b49 Re-adding ConfigurationPostProcessorTests after its brief removal in r814. @Ignore-ing the testCglibClassesAreLoadedJustInTimeForEnhancement() method as it turns out this was one of the culprits in the recent build breakage. The classloader hacking causes subtle downstream effects, breaking unrelated tests. The test method is still useful, but should only be run on a manual basis to ensure CGLIB is not prematurely classloaded, and should not be run as part of the automated build.
2db0f12 fixed two build-breaking issues: + reverted ClassMetadataReadingVisitor to revision 794 + eliminated ConfigurationPostProcessorTests until further investigation determines why it causes downstream tests to fail (such as the seemingly unrelated ClassPathXmlApplicationContextTests)
147709f Tweaks to package-info.java files
22b25e0 Consolidated Util and MutableAnnotationUtils classes into existing AsmUtils
7f96f57 polishing
```

Yikes. Compare that with these more recent commits from the same repository:
```
$ git log --oneline -5 --author pwebb --before "Sat Aug 30 2014"

5ba3db6 Fix failing CompositePropertySourceTests
84564a0 Rework @PropertySource early parsing logic
e142fd1 Add tests for ImportSelector meta-data
887815f Update docbook dependency and generate epub
ac8326d Polish mockito usage
```

Which would you rather read?  

The former varies in length and form; the latter is concise and consistent.  
The former is what happens by default; the latter never happens by accident.  

## The seven rules of a great Git commit message
1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain what and why vs. how

For example:
```
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789
```

# Examples of Well-Organized Git Repositories
* Android mobile app with localized strings: https://github.com/google/iosched  
* Complex, but well-organized: https://github.com/libra/libra  

# Git Workflow: Forking & Pull Requests

## GitHub Standard Fork & Pull Request Workflow  
* Github pull request reviews documentation: https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-request-reviews  
* Useful link about project forks: https://gist.github.com/Chaser324/ce0505fbed06b947d962  
* Great YouTube video tutorial "Creating a Simple Github Pull Request" by Jake Vanderplas: https://www.youtube.com/watch?v=rgbCcBNZcdQ  

```
# Show which Git branches are tracking remote and upstream (source repo forked from)
git branch -vv

# Keeping a fork up-to-date
git remote add upstream git://github.com/ORIGINAL-USERNAME/FORKED-PROJECT.git
git fetch upstream
git pull upstream master

# List all remote pull requests
git ls-remote origin 'pull/*/head'

# Fetch a specific pull request into a local branch and with a custom name
git fetch origin pull/50/head:pr-new-feature

# Fetch a pull request from a fork repo and patch it as a local branch
git fetch git@github.com:username/ForkedProject.git refs/pull/50/head:pr-forked-feature
```

# Git Workflow: Mirror Copies of Repositories
```
# Initializing new local Repo on Windows file system
cd ~/OneDrive/GitRepos
mkdir NewProject
cd NewProject
git init
cd ~/GitProjects/

# Note that this will automatically create the 'NewProject' Directory
git clone C:/Users/John/OneDrive/GitRepos/NewProject/.git
```

# Linux / Unix Utilities
```
# Show the differences between two files. Pipes indicate the lines are different.
diff -y -W 180 foo1.json foo2.json | less
```

# Android

## JADX
jadx - Dex to Java decompiler: Command line and GUI tools for producing Java 
source code from Android Dex and Apk files:  
https://github.com/skylot/jadx  

```shell
jadx-gui /Users/johnny/Documents/DecompilerSandbox/AndroidApp_4.1.0.apk
```

## Apktool
Reverse-engineering with Apktool:  
https://apktool.org/  
https://github.com/iBotPeaches/Apktool  

```shell
java -jar apktool_2.9.2.jar decode AndroidApp_4.1.0.apk

java -jar apktool_2.9.2.jar build AndroidApp_4.1.0.apk
```

It is a tool for reverse engineering 3rd party, closed, binary Android apps. 
It can decode resources to nearly original form and rebuild them after making 
some modifications; it makes possible to debug **smali** code step by step.

## ProGuard
You can use `retrace.sh` from the Android SDK tools to use a mapping file
to de-obfuscate a stack trace; example:
```shell
$ANDROID_SDK/tools/proguard/bin/

retrace.sh mapping.txt stacktrace.txt
```

## Bugreport
A bug report contains device logs, stack traces, and other diagnostic 
information to help you find and fix bugs in your app. To capture a bug report 
from your device, use the Take bug report developer option on the device, the 
Android Emulator menu, or the adb bugreport command on your development machine.  
https://developer.android.com/studio/debug/bug-report
```shell
# MacOS
adb bugreport ~/Desktop/galaxy-bugreport.zip

# Windows
adb bugreport C:\Users\johnny\Desktop\galaxy-bugreport.zip
```

## Scrcpy
Using the `-m` option usually fixes the "green bars" (screen burn-in) during
recording on some devices:
```shell
scrcpy -m 1280 --record ~/Desktop/my-recording.mp4
```

To show Screen Taps during a demo recording, use the `--show-touches` arg:
```shell
scrcpy -m 1024 --show-touches --record ~/Desktop/my-recording-with-taps.mp4
```

### How to Grab a Screenshot from the Secondary Display
You can get the "Display ID" using:
```shell
adb shell dumpsys display
```
And then look for a display labeled like "HDMI Screen". The Display ID is the
numeric value of the `uniqueId` property in most cases:
```
DisplayDeviceInfo{"HDMI Screen": uniqueId="local:1", 1280 x 800, modeId 2, 
defaultModeId 2, supportedModes [{id=2, width=1280, height=800, fps=60.000004}], 
colorMode 0, supportedColorModes [0], HdrCapabilities android.view.Display$HdrCapabilities@40f16308, 
density 237, 237.0 x 237.0 dpi, appVsyncOff 1000000, presDeadline 16666666, 
touch EXTERNAL, rotation 0, type HDMI, address {port=1}, state ON, 
FLAG_SECURE, FLAG_SUPPORTS_PROTECTED_BUFFERS, FLAG_PRESENTATION}
```

Then you use the `-d` option in `adb shell screencap`:
```shell
adb shell screencap -d 1 /sdcard/screen-01.png && adb pull /sdcard/screen-01.png ~/Desktop/
```
