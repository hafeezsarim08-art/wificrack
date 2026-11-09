# wificrack 🚀 (C++ + Python3 Hybrid Framework)

A custom, multi-language polyglot network orchestration engine designed for Kali Linux environment auditing. This application combines the raw speed, direct kernel mapping (`ioctl`), and permission checking of compiled **C++** with the rapid sub-process control of **Python 3** inside a single layout file (`wificrack.cpy`).

The project handles administrative setup workflows, signal tracking, and offline data analysis within standard private network structures.

---

## 🏗️ Architecture Design

- **C++ Layer**: Handles incoming command line option mapping via POSIX `getopt`, validates that the executing context maintains `root` boundaries via `getuid()`, and performs device layer identification via local stream sockets.
- **Python 3 Layer**: Manages background environment configuration adjustments, coordinates underlying framework processes, and drives offline file parsing logic.

---

## 🛠️ Requirements & Workspace Deployment

To deploy this project within your Kali Linux environment, ensure your system packages are completely updated:

```bash
sudo apt update && sudo apt install g++ bettercap wifipumpkin3 -y
```

### 1. Download the Project
```bash
git clone https://github.com
cd wificrack
```

### 2. Compile Natively with g++
Since the codebase relies on a multi-language polyglot model, compile the binary layer natively by instructing `g++` to parse it as C++:
```bash
g++ -x c++ wificrack.cpy -o wificrack
```

### 3. Run Administrative Auditing Modes
```bash
# Display the native guidance screen
sudo ./wificrack -h

# Execute automated tracking workflows on your wireless interface
sudo ./wificrack -i wlan0 -m deauth

# Run offline dictionary evaluation against a captured handshake pack
sudo ./wificrack -f handshake.pcap
```

---

## 🛡️ Administrative & Quality Boundaries

- **Validation Controls**: Built-in logic checks ensure that no network system routines are invoked unless the interface is physically mapped by the core kernel layer.
- **Spectrum Integrity**: The code focuses strictly on network topology monitoring, administrative task automation, and cryptographic calculations. It excludes high-frequency packet flooding mechanisms, keeping hardware microcode completely stable.
- 
