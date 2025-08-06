# main.py
# This is a template script. Replace this with your own code.

import sys
from colorama import Fore, Style, init

def main():
    """
    The main function of the script.
    """
    # Initialize colorama to work on Windows
    init(autoreset=True)

    print(Fore.GREEN + "=====================================")
    print(Fore.YELLOW + "  Python Embeddable Project Started  ")
    print(Fore.GREEN + "=====================================")
    print()

    print(f"Running on Python version: {sys.version}")
    print()
    print(Fore.CYAN + "This is a demonstration of a script running with its own portable Python environment.")
    print(Fore.CYAN + "All dependencies, like 'colorama', were installed automatically.")
    print()

    # --- START YOUR CUSTOM CODE HERE ---
    # For example, you could ask for user input or start a GUI.
    input(Fore.WHITE + "Press Enter to exit...")
    # --- END YOUR CUSTOM CODE HERE ---


if __name__ == "__main__":
    main()