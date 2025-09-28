********************************************************************************

```
 ██████╗ ██╗████████╗    ███████╗ ██████╗███╗   ███╗
██╔════╝ ██║╚══██╔══╝    ██╔════╝██╔════╝████╗ ████║
██║  ███╗██║   ██║       ███████╗██║     ██╔████╔██║
██║   ██║██║   ██║       ╚════██║██║     ██║╚██╔╝██║
╚██████╔╝██║   ██║       ███████║╚██████╗██║ ╚═╝ ██║
 ╚═════╝ ╚═╝   ╚═╝       ╚══════╝ ╚═════╝╚═╝     ╚═╝
```

Keywords: Git, SCM, Source Control, Commit Message, Code Blocks, ASCII

********************************************************************************

**Role:**
Act as an seasoned lead Android Engineer with years of knowledge and experience in the financial services industry, specializing in mobile Point-of-Sale secure solution design.

**Prompt:**
Create a new `.md` Markdown file that summarize the changes I've got staged in git and provide a clean and concise Commit Message that I can copy and use; Be sure to include a "Test Plan" so that Reviewers of my Pull Request can validate that our changes did not break any existing functionality. Be sure to also include reference terminal commands that can be executed to validate app integrity and unit test coverage (shell scripts, `gradlew, flutter, dart`, etc). Avoid special unicode characters and emojis - git commit messages should generally be pure ASCII. Keep the number of lines for this commit message at LINE_COUNT lines or less, and, preferably wrap the lines at the 90-characters column, for readability within a CLI terminal window. Below are the files I've changed:
```
  modified:   app/src/main/java/com/app/ui/settings/SettingsActivity.java
  modified:   app/src/main/java/com/app/ui/settings/SettingsViewModel.kt
  modified:   app/src/test/java/com/app/ui/settings/SettingsViewModelTest.kt

  [REPLACE ALL THIS WITH YOUR GIT STATUS CONSOLE OUTPUT]
```

**Requirements:**
- Create your Markdown file within the `FOLDER/` directory.

********************************************************************************

# Purpose:
Generate detailed commit messages with a Summary, Test Plan, Validation Commands and Testing Considerations.

## How to Use:
- Replace [LINE_COUNT] with the maximum number of lines for your desired commit message.
- Run `git status` and copy the added / modified / deleted / renamed file outputs and paste them into the code block section.

------------------------------    PROMPT BELOW    ------------------------------

Copilot Context Instructions:
- Wrap your entire output with triple-backticks for Markdown-style output.
- Do not surround "Code Blocks" with triple-backticks notation, because it will cause the Copilot Chat window output to become malformed.

Summarize the changes I've got staged in git and provide a clean and concise Commit Message that I can copy and use; Be sure to include a "Test Plan" so that Reviewers of my Pull Request can validate that our changes did not break any existing functionality. Be sure to also include reference terminal commands that can be executed to validate app integrity and unit test coverage (shell scripts, `gradlew, flutter, dart`, etc). Make sure you use the triple-backticks format for your output, because git commit messages need to be pure ASCII. Keep the number of lines for this commit message at [LINE_COUNT] lines or less, and, preferably wrap the lines at the 90-characters column, for readability within a CLI terminal window. Below are the files I've changed:
```
  modified:   app/src/main/java/com/app/ui/settings/SettingsActivity.java
  modified:   app/src/main/java/com/app/ui/settings/SettingsViewModel.kt
  modified:   app/src/test/java/com/app/ui/settings/SettingsViewModelTest.kt

  [REPLACE ALL THIS WITH YOUR GIT STATUS CONSOLE OUTPUT]
```

********************************************************************************

Copilot Context Instructions:
- Wrap your entire output with triple-backticks for Markdown-style output.
- Do not surround "Code Blocks" with triple-backticks notation.

Summarize the changes I've got staged in git and provide a clean and concise Commit Message that I can copy and use; Be sure to include a "Test Plan" so that Reviewers of my Pull Request can validate that our changes did not break any existing functionality. Be sure to also include reference terminal commands that can be executed to validate app integrity and unit test coverage (shell scripts, `gradlew, flutter, dart`, etc). Make sure you use the triple-backticks format for your output, because git commit messages need to be pure ASCII. Keep the number of lines for this commit message at 80 lines or less, and, preferably wrap the lines at the 90-characters column, for readability within a CLI terminal window. Below are the files I've changed:
```
   modified:   app/src/main/java/com/app/ui/settings/SettingsActivity.java
   modified:   app/src/main/java/com/app/ui/settings/SettingsViewModel.kt
   modified:   app/src/test/java/com/app/ui/settings/SettingsViewModelTest.kt
```

********************************************************************************
