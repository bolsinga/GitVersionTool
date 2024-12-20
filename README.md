# GitVersionTool
This will write out a `git` version variable for Swift code. It prefers to use the current tag as the version. If that does not exist, it will use the branch name. If somehow that does not exist, it will use the current git commit-ish. If there are local changes, it will be appended with `-local`.

Example:

`GitVersionTool --git-directory <git-path> --variable LibraryVersion`

emits:

`public let LibraryVersion = main`

And:

`GitVersionTool  --git-directory <git-path>`

emits:

`main`

Heavily inspired by https://github.com/DimaRU/PackageBuildInfo. I just wanted to use Swift, write it myself, and use my [GitLibrary](https://github.com/bolsinga/GitLibrary) code.
