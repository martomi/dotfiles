#!/usr/bin/env python3
import os
import yaml
import shutil
import time
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent
HOME_DIR = Path.home()
CONFIG_FILE = REPO_ROOT / "dotfiles.yaml"
REPO_HOME = REPO_ROOT / "home"

def load_config():
    with open(CONFIG_FILE) as f:
        return yaml.safe_load(f)["files"]

def file_mtime(path: Path):
    if not path.exists():
        return None
    return path.stat().st_mtime

def human_time(mtime):
    if mtime is None:
        return "MISSING"
    return time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(mtime))

def main():
    files = load_config()
    changes = []

    for rel_path in files:
        repo_file = REPO_HOME / rel_path
        home_file = HOME_DIR / rel_path

        repo_mtime = file_mtime(repo_file)
        home_mtime = file_mtime(home_file)

        if repo_mtime is None and home_mtime is None:
            print(f"⚠️ Skipping {rel_path} (missing in both places)")
            continue

        # Decide direction
        if repo_mtime and (not home_mtime or repo_mtime > home_mtime):
            changes.append((repo_file, home_file, "repo → home"))
        elif home_mtime and (not repo_mtime or home_mtime > repo_mtime):
            changes.append((home_file, repo_file, "home → repo"))

    if not changes:
        print("✅ Nothing to sync")
        return

    print("\nThe following files will be updated:\n")
    for src, dst, direction in changes:
        print(f"{direction}: {dst}")
        print(f"  Source: {src} ({human_time(file_mtime(src))})")
        print(f"  Target: {dst} ({human_time(file_mtime(dst))})\n")

    confirm = input("Proceed with sync? [y/N] ").strip().lower()
    if confirm != "y":
        print("❌ Aborted.")
        return

    # Perform sync
    for src, dst, direction in changes:
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)
        print(f"✔️ {direction}: {src} → {dst}")

    print("\n✨ Sync complete!")

if __name__ == "__main__":
    main()
