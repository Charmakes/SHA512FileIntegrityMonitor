# SHA512FileIntegrityMonitor

**SHA512FileIntegrityMonitor** is a robust PowerShell script repository designed for continuous file integrity verification using the SHA-512 hashing algorithm.

This PowerShell script enables file integrity monitoring by generating and monitoring baselines of files within a specified directory.

## Features

- **Generate Baseline**: Compute hashes for all files in a directory to create a baseline.
- **Monitor Files**: Continuously monitor files for changes, deletions, and new additions based on the generated baseline.

## Usage

### Generate a New Baseline:

1. Execute option 1 to compute hashes for all files in a specified directory.
2. This creates a baseline file (`baseline.txt` by default) containing file paths and their corresponding SHA-512 hashes.

### Monitor Files Using Current Baseline:

1. Execute option 2 to monitor files against the existing baseline.
2. Continuously checks for file modifications (content changes), deletions, and new file creations.
3. Alerts are displayed in different colors based on the type of change detected.

## Screenshots

![Generating a New Baseline](https://media.discordapp.net/attachments/1110683056349651047/1253440831302406234/3.JPG?ex=6675dd3d&is=66748bbd&hm=e9c49b80dc31050d4f23661b44524904120e753ead5eecb982a311b10f7151dd&=&format=webp&width=1440&height=387)

_Screenshot of Option 1: Generating a new baseline._

![File Change Example](https://media.discordapp.net/attachments/1110683056349651047/1253440830815867020/1.JPG?ex=6675dd3d&is=66748bbd&hm=cc9cb65b7605661d15cf0e1ad4d0aa9ca705f95334e42a4fef63393d35a64aa7&=&format=webp&width=1440&height=421)

_Example of implementing a file change._

![File Deletion Alert](https://media.discordapp.net/attachments/1110683056349651047/1253440831084564621/2.JPG?ex=6675dd3d&is=66748bbd&hm=25816fad636b24f0f8cb10bf9f497022cfdb3e21b5d109606c5682d97ef56be4&=&format=webp&width=1440&height=443)

_Example of a file deletion alert._

## Requirements

- PowerShell (version X.X or higher)
- Windows Operating System

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Charmakes/SHA512FileIntegrityMonitor.git
   cd your-repository
   ```

2. Open PowerShell and run the script:
   ```powershell
   .\file_integrity_monitor.ps1
   ```

3. Follow the prompts to specify the directory and baseline file path.

## Notes

- Customize the baseline file path (`baseline.txt`) as needed.
- Ensure appropriate permissions for the script to read/write files.
