from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
import sys


def main():
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load("/home/bruno_rb/interfaz/Codes/Arm.qml")
    if not engine.rootObjects():
        print("Error: No root objects loaded.")
        sys.exit(-1)
    
    app_exec = app.exec_()
    
    sys.exit(app_exec)


if __name__ == "__main__":
    main()
