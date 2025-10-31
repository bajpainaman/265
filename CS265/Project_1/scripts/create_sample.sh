#!/bin/bash
set -euo pipefail

BASE_DIR="$(dirname "${BASH_SOURCE[0]}")/.."
SAMPLE_ROOT="${BASE_DIR}/sample"

rm -rf "${SAMPLE_ROOT}"
mkdir -p "${SAMPLE_ROOT}"

mkdir -p "${SAMPLE_ROOT}/bar/subdir"
mkdir -p "${SAMPLE_ROOT}/empty_dir"
touch "${SAMPLE_ROOT}/empty_dir/.gitkeep"
mkdir -p "${SAMPLE_ROOT}/foo/baaz/a_different_directory"
mkdir -p "${SAMPLE_ROOT}/foo/baaz/some_directory"

cat <<'CONTENTS' > "${SAMPLE_ROOT}/bar/file1.txt"
This is file1 with some random content.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/bar/file2.txt"
Random text for file2: Lorem ipsum dolor sit amet.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/bar/subdir/test.txt"
Test content in subdir: Hello world!
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/file with spaces.txt"
This file has spaces in its name and contains: Random data 123.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/readme.txt"
README: This is a sample directory structure for testing.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/_blacklist"
yet another file
abc
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/_special"
x
a_different_directory
y
z
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/a_different_directory/nested.txt"
Nested file content: Some random nested text.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/some_directory/file.txt"
Some file in some_directory: Random content.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/abc"
This is abc file content.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/another file"
Another file with random stuff: 42 is the answer.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/file1"
File1 content: Just some random text here.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/this_file"
This is this_file content: More random text.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/x"
X file: Short random content.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/y"
Y file: Another piece of random text.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/z"
Z file: Final random content.
CONTENTS

cat <<'CONTENTS' > "${SAMPLE_ROOT}/foo/baaz/yet another file"
Yet another file: Should be blacklisted.
CONTENTS

printf 'Sample directory recreated at %s\n' "${SAMPLE_ROOT}"
