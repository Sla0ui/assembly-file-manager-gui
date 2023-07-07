## 🖥️ Assembly File Manager with Graphical User Interface

Welcome to the repository of an assembly program that implements a file manager using buttons as a graphical user interface. This project was developed during my early college years, aiming to provide essential file management functionalities in an assembly language environment.

### 📋 Features

The file manager program includes the following features:

1. ✏️ Create a file
2. 📄 Display a file
3. 📂 Copy a file
4. ✏️ Rename a file
5. 🗑️ Delete a file
6. 📂 Create a directory
7. 🗑️ Delete a directory
8. 📂 Change a directory
9. 📄 List all files and directories in a directory
10. 🚀 Action button to perform the above functions collectively

### 💻 Usage of BIOS Interrupts

To accomplish the tasks mentioned above, the program primarily utilizes three BIOS interrupts:

1. INT 10h: For graphical manipulation (screen)
2. INT 33h: For mouse interrupts
3. INT 21h: For file management and text handling

### 📝 Instructions

To run the program, follow these steps:

1. Clone the repository to your local machine.
2. Compile the assembly program using an appropriate assembler for your target system.
3. Execute the compiled program.
4. Interact with the graphical user interface using the provided buttons to perform file management operations.

Please note that the program's functionality may vary depending on your system's compatibility with the used BIOS interrupts.

Feel free to explore the code and modify it according to your needs. If you encounter any issues or have suggestions for improvements, don't hesitate to open an issue or submit a pull request.

Enjoy exploring this assembly file manager with a graphical user interface! 😊

### 📄 License

This project is licensed under the [MIT License](LICENSE).
