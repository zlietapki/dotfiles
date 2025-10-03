#!/usr/bin/env python3
"""CPU Usage Graph Monitor - Displays a unicode graph of CPU usage history using Braille characters."""
import json
import os
import sys
import psutil
import argparse
from pathlib import Path

# Configuration
CACHE_DIR = Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache'))
HISTORY_FILE = CACHE_DIR / 'cpu_usage_history.json'
DEFAULT_HISTORY_DEPTH = 40


def main():
    parser = argparse.ArgumentParser(description='CPU Usage Graph Monitor with Braille display')
    parser.add_argument('command', nargs='?', help='Command: toggle')
    parser.add_argument('-d', '--depth', type=int, default=DEFAULT_HISTORY_DEPTH,
                        help=f'History depth (default: {DEFAULT_HISTORY_DEPTH})')
    args = parser.parse_args()
    
    # Output for waybar
    print(json.dumps({
        "text": "some text",
        "tooltip": "hehe",
        "class": "cpu-history"
    }))

if __name__ == "__main__":
    main()
