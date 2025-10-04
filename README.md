# Dotfiles Sync

This repository stores your dotfiles in the home/ folder and provides a sync script to keep them in sync with your system’s home directory (~/).

The sync is bidirectional:
	•	If the file in the repo is newer, it gets copied to your home folder.
	•	If the file in your home folder is newer, it gets copied back into the repo.
	•	You’ll get a confirmation prompt showing which files will be updated before anything happens.

## Repository Structure

```
.
├── home/                # Dotfiles stored in the repo
│   ├── .vimrc
│   ├── .tmux.conf
│   └── .config/ghostty/config
├── dotfiles.yaml        # List of files to keep in sync
├── sync_dotfiles.py     # Sync script
└── README.md
```

## Prerequisites

	•	Python 3.8+ installed on your system

Setup

	1.	Create a virtual environment

```
python3 -m venv .venv
source .venv/bin/activate
```

	2.	Install dependencies

```
pip install -r requirements.txt
```

## Configuration

List the files you want to sync in dotfiles.yaml (relative to the home/ folder):

files:
  - .vimrc
  - .tmux.conf
  - .config/ghostty/config
  - .gitconfig

## Usage

Run the sync script:

```
python sync_dotfiles.py
```

Example output:

```
The following files will be updated:

repo → home: /home/user/.vimrc
  Source: /path/to/repo/home/.vimrc (2025-10-04 15:32:10)
  Target: /home/user/.vimrc (2025-10-03 20:14:55)

Proceed with sync? [y/N]
```
