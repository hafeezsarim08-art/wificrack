#if 0
import sys
import os
import time
import subprocess

def display_engine_banner():
    print("====================================================")
    print("                    WIFICRACK                       ")
    print("====================================================")

def execute_wireless_routine(interface, mode):
    print(f"[*] Interface: {interface}")
    if mode == "deauth":
        print("[*] Flushing conflicting network daemons...")
        subprocess.run(["sudo", "airmon-ng", "check", "kill"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        
        print("[+] Launching interactive over-the-air tracking stream...")
        # Removed the background redirection so it pipes data straight to your terminal window
        cmd = f"sudo bettercap -iface {interface} -eval \"wifi.recon on; set ticker.period 4; set ticker.commands 'wifi.show'; ticker on\""
        os.system(cmd)
    elif mode == "twin":
        pass

def execute_cryptographic_parsing(file_path):
    wordlist_path = "/usr/share/wordlists/rockyou.txt"
    if not os.path.exists(wordlist_path) and os.path.exists(wordlist_path + ".gz"):
        subprocess.run(["sudo", "gunzip", "-q", f"{wordlist_path}.gz"])
    if os.path.exists(wordlist_path):
        subprocess.run(["aircrack-ng", file_path, "-w", wordlist_path])

if __name__ == "__main__":
    if len(sys.argv) < 3:
        sys.exit(1)
    
    display_engine_banner()
    execution_route = sys.argv
    
    if execution_route == "wifi":
        execute_wireless_routine(sys.argv, sys.argv)
    elif execution_route == "crypto":
        execute_cryptographic_parsing(sys.argv)
    sys.exit(0)

"""
#endif

#include <iostream>
#include <string>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <csignal>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>

void signalHandler(int signum) {
    std::system("sudo pkill -f bettercap > /dev/null 2>&1");
    std::system("sudo systemctl start NetworkManager > /dev/null 2>&1");
    std::exit(signum);
}

void displayUsageGuide(const std::string& programName) {
    std::cout << "Usage: " << programName << " -i <interface> -m <action> | -f <file_path>\n";
}

bool verifyHardwareInterface(const std::string& ifaceName) {
    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) return false;
    struct ifreq ifr;
    std::strncpy(ifr.ifr_name, ifaceName.c_str(), IFNAMSIZ - 1);
    if (ioctl(sock, SIOCGIFHWADDR, &ifr) == 0) {
        close(sock);
        return true;
    }
    close(sock);
    return false;
}

int main(int argc, char* argv[]) {
    std::signal(SIGINT, signalHandler);
    std::string interface = "";
    std::string mode = "";
    std::string filePath = "";
    int opt;

    while ((opt = getopt(argc, argv, "i:m:f:h")) != -1) {
        switch (opt) {
            case 'i': interface = optarg; break;
            case 'm': mode = optarg; break;
            case 'f': filePath = optarg; break;
            case 'h':
            default:
                displayUsageGuide(argv[0]);
                return 0;
        }
    }

    if (getuid() != 0) {
        std::cerr << "[-] Root privileges required.\n";
        return 1;
    }

    if (!interface.empty() && !mode.empty()) {
        if (!verifyHardwareInterface(interface)) {
            std::cerr << "[-] Interface unreachable.\n";
            return 1;
        }
        std::string command = "python3 ./wificrack.cpy wifi " + interface + " " + mode;
        std::system(command.c_str());
    }
    else if (!filePath.empty()) {
        std::string command = "python3 ./wificrack.cpy crypto " + filePath;
        std::system(command.c_str());
    }
    else {
        displayUsageGuide(argv[0]);
        return 1;
    }
    return 0;
}

#if 0
"""
#endif
      
