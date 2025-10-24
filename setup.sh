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
