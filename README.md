# My Awesome Python Project

This is a portable Python project that runs on Windows without needing a system-wide Python installation.

## How to Use

1.  **Download Python:**
    * Go to the official [Python website's download page for Windows](https://www.python.org/downloads/windows/).
    * Look for the **"Windows embeddable package"** for your desired architecture (64-bit is most common).
    * Download the `.zip` file.

2.  **Set up the Project:**
    * Unzip the contents of the Python embeddable package you downloaded into the `python-embed` folder.
    * (You can delete the `placeholder.txt` file that is in there).
    * **IMPORTANT:** Open `launch.bat` in a text editor and update the `PYTHON_PTH_FILE` variable near the top to match the Python version you downloaded (e.g., set it to `python-embed\python312._pth` if you downloaded Python 3.12).

3.  **Run:**
    * Simply double-click `launch.bat`.

The first time you run it, it will automatically download and install `pip` and all the required packages from `requirements.txt`. Subsequent launches will be much faster.