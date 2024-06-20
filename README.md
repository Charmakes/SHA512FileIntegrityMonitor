SHA512FileIntegrityMonitor is a robust PowerShell script repository designed for continuous file integrity verification using the SHA-512 hashing algorithm.

This PowerShell script enables file integrity monitoring by generating and monitoring baselines of files within a specified directory.
Features

    Generate Baseline: Compute hashes for all files in a directory to create a baseline.
    Monitor Files: Continuously monitor files for changes, deletions, and new additions based on the generated baseline.

Usage

    Generate a New Baseline:
        Execute option 1 to compute hashes for all files in a specified directory.
        This creates a baseline file (baseline.txt by default) containing file paths and their corresponding SHA-512 hashes.

    Monitor Files Using Current Baseline:
        Execute option 2 to monitor files against the existing baseline.
        Continuously checks for file modifications (content changes), deletions, and new file creations.
        Alerts are displayed in different colors based on the type of change detected.

Screenshots

Insert screenshots here:
    ![Image 3](https://media.discordapp.net/attachments/1110683056349651047/1253440831302406234/3.JPG?ex=6675dd3d&is=66748bbd&hm=e9c49b80dc31050d4f23661b44524904120e753ead5eecb982a311b10f7151dd&=&format=webp&width=1440&height=387)

    Screenshot of Option 1: Generating a new baseline.

![Image 1](https://media.discordapp.net/attachments/1110683056349651047/1253440830815867020/1.JPG?ex=6675dd3d&is=66748bbd&hm=cc9cb65b7605661d15cf0e1ad4d0aa9ca705f95334e42a4fef63393d35a64aa7&=&format=webp&width=1440&height=421)

        Example of implementing a file change.

![Image 2](https://media.discordapp.net/attachments/1110683056349651047/1253440831084564621/2.JPG?ex=6675dd3d&is=66748bbd&hm=25816fad636b24f0f8cb10bf9f497022cfdb3e21b5d109606c5682d97ef56be4&=&format=webp&width=1440&height=443)
        Example of a file deletion alert.

Requirements

    PowerShell (version X.X or higher)
    Windows Operating System

Installation

    Clone the repository:

    bash

git clone https://github.com/yourusername/your-repository.git
cd your-repository

Open PowerShell and run the script:

powershell

    .\file_integrity_monitor.ps1

    Follow the prompts to specify the directory and baseline file path.

Notes

    Customize the baseline file path (baseline.txt) as needed.
    Ensure appropriate permissions for the script to read/write files.
