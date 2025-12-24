# Git Branch Cleanup Guide

When working in repositories with high velocity, your local machine can accumulate hundreds of "stale" branches—local branches that track a remote branch that has already been merged and deleted on the server.

Use the following commands to identify and clean up these branches.

## 1. Prune Remote References
First, update your local repository's knowledge of the remote. This removes local references (`origin/branch-name`) for branches that no longer exist on the remote.

```bash
git fetch --prune
```

## 2. List "Gone" Branches
To see which local branches are now tracking a missing remote branch (marked as `[gone]`), run:

```bash
git branch -vv | grep ': gone]' | awk '{print $1}'
```

## 3. Delete All Stale Branches
**⚠️ Warning:** This command uses `-D` (force delete). It will delete the branches listed in step 2 regardless of whether Git thinks they are fully merged. Ensure you have pushed any work you want to keep before running this.

```bash
git fetch --prune && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D
```
