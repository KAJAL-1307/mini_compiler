# mini_compiler
⚙️ Setup and Installation Guide
This project uses Visual Studio Code with WSL (Ubuntu) for development. Follow the steps below to set up everything you need — starting from scratch.

🧰 Tools and Technologies Used
WSL (Windows Subsystem for Linux) with Ubuntu

Visual Studio Code with Remote - WSL extension

C++, Flex, Bison, Make

Linux build tools (build-essential)

💻 Step-by-Step Setup Instructions
✅ 1. Install WSL and Ubuntu
If you haven’t installed WSL (Windows Subsystem for Linux) yet:

Open PowerShell as Administrator and run:

powershell
Copy
Edit
wsl --install
This installs WSL along with Ubuntu as the default distro.

Restart your computer if prompted.

Once done, open the Ubuntu app from the Start menu and complete the initial setup (username and password).

✅ 2. Install Visual Studio Code and WSL Extension
Download and install Visual Studio Code.

Open VS Code and install this extension:

Remote - WSL (by Microsoft)

✅ 3. Open Your Project Inside WSL
Open Ubuntu (from Start menu).

Navigate to your project directory:
bash-
cd ~/mini_compiler
Open it in VS Code:

bash-
code .

The first time you do this, it may download the VS Code Server. Just wait — it only happens once per version.

✅ 4. Install Required Packages in Ubuntu (WSL)
Inside your WSL terminal, run these commands once:

bash
Copy
Edit
sudo apt update
sudo apt install flex bison g++ make build-essential
These install:

flex: Lexical analyzer generator

bison: Parser generator

g++: C++ compiler

make: Build automation tool

build-essential: Common development tools (like GCC, linker, etc.)