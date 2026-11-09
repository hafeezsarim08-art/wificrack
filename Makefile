# Compiler variables
CXX = g++
CXXFLAGS = -Wall -Wextra -O2 -std=c++17
TARGET = wificrack
SRC = wificrack.cpy

# Default target rule
all: $(TARGET)

$(TARGET): $(SRC)
	@echo "[*] Compiling native hybrid polyglot binary layer..."
	$(CXX) $(CXXFLAGS) -x c++ $(SRC) -o $(TARGET)
	@echo "[+] Success! Type 'sudo ./$(TARGET) -h' to see the guidance screen."

# Global system installation path rule
install: $(TARGET)
	@echo "[*] Copying binary to system local tools path..."
	sudo cp $(TARGET) /usr/local/bin/$(TARGET)
	@echo "[+] Global command available: run 'sudo $(TARGET)' from anywhere."

# Remove compiled binary components layout
clean:
	@echo "[-] Cleaning build artifacts..."
	rm -f $(TARGET)

.PHONY: all install clean
