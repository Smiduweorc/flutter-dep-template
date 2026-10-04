#!/usr/bin/env bash
#
# Rejects a commit message whose first line is not a Conventional Commit. The
# accepted types are the ones @commitlint/config-conventional allows, and each
# one has a group in cliff.toml. This replaces commitlint so the repo does not
# need Node.
#
# Usage: tool/check-commit-msg.sh <file holding the message>

set -euo pipefail

subject="$(head -n 1 "$1")"
types="build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test"

# Messages git writes itself.
if [[ "$subject" =~ ^(Merge|Revert\ \"|fixup!|squash!) ]]; then
	exit 0
fi

if ! [[ "$subject" =~ ^($types)(\([a-z0-9._/-]+\))?!?:\ [^[:space:]] ]]; then
	echo "Commit subject is not a Conventional Commit: $subject"
	echo "Expected: <type>(<optional scope>): <description>"
	echo "Types: ${types//|/, }"
	exit 1
fi

if (( ${#subject} > 100 )); then
	echo "Commit subject is ${#subject} characters; the limit is 100."
	exit 1
fi
