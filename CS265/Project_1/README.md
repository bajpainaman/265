# CS265 Project 1 — Recursive Directory Indexer in Bash

## Course Context
- **Course:** CS265 — Advanced Programming Tools and Techniques
- **Project:** 1 — Recursive Directory Indexer

This repository contains the starter materials, assignment specification, and example directory structure for CS265 Project 1. The goal is to implement a robust Bash script named `indexer` that produces JSON indices for every directory in a tree.

---

## Assignment Overview

### Invocation Requirements
- The script must accept **exactly one** command-line argument representing a directory path.
- If the argument is missing or is not a valid directory, the script must:
  - Print an error message to **standard error**.
  - Exit with a **non-zero status code**.
- When the input directory is valid, the script must produce **no output** on standard output.

### Index Creation
- For the input directory and **all subdirectories recursively**, create (or overwrite) an `index.json` file **within each directory**.
- The script **must not** create, delete, or modify any other files.

### `index.json` Format
Each generated `index.json` file must be a valid JSON object containing the following keys:

| Key | Description |
| --- | --- |
| `files` | Alphabetically sorted array of regular file names in the directory, excluding any special cases described below. |
| `directories` | Alphabetically sorted array of subdirectory names, excluding any special cases described below. |
| `special_files` | Alphabetically sorted array of regular files explicitly listed in the `_special` file and not listed in `_blacklist`. |
| `special_directories` | Alphabetically sorted array of subdirectories explicitly listed in `_special` and not listed in `_blacklist`. |
| `outer` | String containing the relative path from the current directory back to the root input directory (e.g., `"."`, `".."`, `"../.."`). |

### Special Configuration Files
- `_blacklist`
  - Contains one filename per line.
  - Any file or directory listed must be excluded from **all** arrays in `index.json`.
- `_special`
  - Contains one filename per line.
  - Any file or directory listed must appear in `special_files` or `special_directories` (as appropriate), provided it is not also blacklisted.
- Neither `_blacklist` nor `_special` should appear in any array within `index.json`.

### Robustness Expectations
- Handle filenames that include spaces, quotes, or other special characters.
- Ensure generated JSON is syntactically valid (consider validating with `jq`).
- Support both relative and absolute input paths, with or without trailing slashes, when computing the `outer` value.
- Account for edge cases such as missing `_blacklist` or `_special` files, empty directories, and the root directory itself.

---

## Repository Layout
```
CS265/
└── Project_1/
    ├── README.md                # Assignment specification (this file)
    ├── starter/
    │   └── indexer              # Executable starter script to replace with your solution
    ├── sample/                  # Pre-built directory tree for local testing
    │   ├── bar/
    │   │   ├── file1.txt
    │   │   ├── file2.txt
    │   │   └── subdir/test.txt
    │   ├── empty_dir/
    │   ├── file with spaces.txt
    │   ├── foo/
    │   │   └── baaz/
    │   │       ├── _blacklist
    │   │       ├── _special
    │   │       ├── a_different_directory/nested.txt
    │   │       ├── another file
    │   │       ├── abc
    │   │       ├── file1
    │   │       ├── some_directory/file.txt
    │   │       ├── this_file
    │   │       ├── x
    │   │       ├── y
    │   │       ├── z
    │   │       └── yet another file
    │   └── readme.txt
    └── scripts/
        └── create_sample.sh     # Utility to recreate the sample tree from scratch
```

---

## Getting Started
1. Copy `CS265/Project_1/starter/indexer` into your working directory (or edit it in place).
2. Implement the recursive indexing logic following the specification above.
3. Use the provided `sample/` directory (or regenerate it with `scripts/create_sample.sh`) to test your script.
4. Validate your JSON output with `jq '.' <path/to/index.json>`.

---

## Tips
- Prefer Bash arrays and helper functions to keep your script organized.
- Normalize paths with tools like `realpath` before computing relative paths for the `outer` key.
- Use `find` with `-print0` or similar techniques to handle filenames containing spaces.
- Thoroughly test directories with no files, no subdirectories, or missing configuration files.

---

## Regenerating the Sample Directory
Run the following from the repository root to reset the sample directory:

```bash
CS265/Project_1/scripts/create_sample.sh
```

This script clears the existing `sample/` directory and rebuilds it with the expected contents.

---

## Deliverables
Submit your completed `indexer` script to the course submission system (`project p1`). Ensure it is executable and adheres to the specification. Late submissions follow the standard CS265 policy.

Good luck, and happy scripting!
