Sample Directory Setup
This README provides instructions for setting up a sample directory structure for testing a recursive directory indexer script. The structure is designed to test various cases, including files with spaces, blacklisted files, special files, and nested directories.
Directory Structure
The sample directory structure is as follows:
sample/
├── empty_dir/
├── foo/
│   └── baaz/
│       ├── another file
│       ├── abc
│       ├── this_file
│       ├── a_different_directory/
│       │   └── nested.txt
│       ├── some_directory/
│       │   └── file.txt
│       ├── yet another file
│       ├── _special
│       ├── _blacklist
│       ├── z
│       ├── file1
│       ├── x
│       └── y
├── file with spaces.txt
├── readme.txt
└── bar/
    ├── file2.txt
    ├── file1.txt
    └── subdir/
        └── test.txt

Purpose
This directory structure is used to test a Bash script that generates index.json files recursively for each directory. The structure includes:

Files with spaces in their names (e.g., file with spaces.txt, another file).
An empty directory (empty_dir/).
Configuration files (_blacklist and _special) to test exclusion and special categorization.
Nested directories to test recursive processing.
Various text files with sample content.

Setup Instructions
To create this directory structure, you can use the provided Bash script (create_sample.sh). Follow these steps:

Save the Script: Copy the following Bash script into a file named create_sample.sh:
#!/bin/bash

# Create the main sample directory
mkdir -p sample

# Create bar directory and its contents
mkdir -p sample/bar/subdir
echo "This is file1 with some random content." > sample/bar/file1.txt
echo "Random text for file2: Lorem ipsum dolor sit amet." > sample/bar/file2.txt
echo "Test content in subdir: Hello world!" > sample/bar/subdir/test.txt

# Create empty_dir
mkdir -p sample/empty_dir

# Create file with spaces
echo "This file has spaces in its name and contains: Random data 123." > sample/"file with spaces.txt"

# Create foo/baaz directory and its contents
mkdir -p sample/foo/baaz/{a_different_directory,some_directory}
echo "yet another file" > sample/foo/baaz/_blacklist
echo "abc" >> sample/foo/baaz/_blacklist
echo "x" > sample/foo/baaz/_special
echo "a_different_directory" >> sample/foo/baaz/_special
echo "y" >> sample/foo/baaz/_special
echo "z" >> sample/foo/baaz/_special
echo "Nested file content: Some random nested text." > sample/foo/baaz/a_different_directory/nested.txt
echo "This is abc file content." > sample/foo/baaz/abc
echo "Another file with random stuff: 42 is the answer." > sample/foo/baaz/"another file"
echo "File1 content: Just some random text here." > sample/foo/baaz/file1
echo "Some file in some_directory: Random content." > sample/foo/baaz/some_directory/file.txt
echo "This is this_file content: More random text." > sample/foo/baaz/this_file
echo "X file: Short random content." > sample/foo/baaz/x
echo "Y file: Another piece of random text." > sample/foo/baaz/y
echo "Yet another file: Should be blacklisted." > sample/foo/baaz/"yet another file"
echo "Z file: Final random content." > sample/foo/baaz/z

# Create readme.txt in sample
echo "README: This is a sample directory structure for testing." > sample/readme.txt

echo "Directory structure created successfully."


Make the Script Executable: Run the following command to make the script executable:
chmod +x create_sample.sh


Run the Script: Execute the script to create the directory structure:
./create_sample.sh


Verify the Structure: After running the script, you can verify the directory structure using:
tree sample/

 Or, if tree is not installed:
find sample/



File Contents

Text Files: All .txt files and other files (e.g., another file, this_file, x, y, z, abc) contain sample text for testing purposes. For example:
sample/bar/file1.txt: "This is file1 with some random content."
sample/foo/baaz/another file: "Another file with random stuff: 42 is the answer."


_blacklist: Located in sample/foo/baaz/, contains:yet another file
abc

These files are excluded from the files and directories arrays in the generated index.json.
_special: Located in sample/foo/baaz/, contains:x
a_different_directory
y
z

These files and directories are listed under special_files and special_directories in the generated index.json.
readme.txt: Contains a brief description: "README: This is a sample directory structure for testing."

Notes

The script handles filenames with spaces correctly by using proper quoting.
The _blacklist and _special files are set up to match the example structure for testing the indexer's behavior.
The empty_dir/ directory is intentionally empty to test edge cases.
The structure is designed to be compatible with a recursive directory indexer that generates index.json files, as specified in the CS265 Project 1 assignment.

