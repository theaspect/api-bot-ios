#!/usr/bin/perl

use strict;
use warnings;

# How to
# ./rename.pl ios-a42 vc
# Скрипт полностью поменяет проект под новое название.

my ($currentName, $newName) = @ARGV;

renameAllContent($currentName, $newName);
renameAllFiles($currentName, $newName);

sub findIOSFiles {
    my $currentName = shift;
    my $filesString = `find ./ -name '$currentName*'`;
    my @fs;
    while ($filesString =~ s/(.*)\s+$//) {
        push (@fs, $1); 
    }
    return @fs
}

sub findContentFiles {
    my $currentName = shift;
    my $grep = `grep $currentName ./* -r`;
    my @fs;
    while ($grep =~ s/\n(.*)$//) {
        my $fileName = "";
        my $line = $1;
        $line =~ s/^\s+//;
        $line =~ s/\s+$//;
        while ($line =~ s/(.*)\:.*/$1/) { $fileName = $1 }
        push(@fs, $fileName) if (!isItemInList($fileName, @fs));
    }
    return @fs;
}

sub renameFileToNewName {
    my ($file, $newFile) = @_;
    `mv $file $newFile`;
}

sub renameContent {
    my ($currentName, $newName, $file) = @_;
    `sed -i '' 's/$currentName/$newName/g' $file`;
}

sub renameAllContent {
    my ($currentName, $newName) = @_;
    my @files = findContentFiles($currentName);
    for my $file (@files) {
        renameContent($currentName, $newName, $file)
    }
}

sub renameAllFiles {
    my ($currentName, $newName) = @_;
    my @files = findIOSFiles($currentName);
    while (scalar(@files) > 0) {
        for my $file (@files) {
            $file =~ s/\/\//\//;
            my $newFile = $file;
            $newFile =~ s/$currentName/$newName/s;
            renameFileToNewName($file, $newFile);
        }
        @files = findIOSFiles($currentName);
    }
}

sub isItemInList {
    my ($item, @list) = @_;
    for my $l (@list) {
        return 1 if ("$l" eq "$item");
    }
    return 0;
}
