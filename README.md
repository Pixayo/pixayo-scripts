# pixayo-scripts

A personal collection of shell scripts for system automation and utilities. These scripts are mostly customizable and free to use under the MIT License.

## 📋 Table of Contents

- [Scripts](#scripts)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)

## Scripts

| Script | Description | Requirements |
|--------|-------------|--------------|
| `backup.sh` | Automated backup utility | `zip`, `date` |
| `EOF` | `EOF` | `EOF` |

## Requirements

- Bash 4.0+
- Standard Unix utilities (`sed`, `grep`, `awk`, etc.)
- (Any specific tools needed by individual scripts)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Pixayo/pixayo-scripts.git
cd pixayo-scripts
```

2. Make scripts executable:
```bash
chmod +x *.sh
```

3. *(optional)* add to your `PATH`:
```bash
export PATH="$PATH:$(pwd)"
```

## Usage

Each script can be used individually:
```bash
./backup.sh [options]
```

## Configuration

Most scripts have a "customize section" here you can tweak their effects. To do this, use a text editor like 
`nano` or `vim` and edit the script itself, like:

```bash
nano backup.sh
```

For example, the `backup.sh` script has this specific *customize section*:

```bash
# -- Customize section ---------------------------------
TARGET="$HOME/backups"

# Directories/Files to backup (absolute paths)
WHITELIST=(
    # "$HOME/my/path/here"
)

# Directories/Files to ignore explicitly (supports wildcards like */folder/*)
BLACKLIST=(
    # "*/my_directory_here/*"         # ignore one subdirectory
    # "*.sh"                          # ignore .sh files
    # "*/cat_picture_231.png"         # ignore cat picture
)

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.zip"
# ------------------------------------------------------
```

## Contributing

Contributions are welcome! If you have a script that automates something useful or want to improve an existing one, feel free to open an Issue or submit a Pull Request.