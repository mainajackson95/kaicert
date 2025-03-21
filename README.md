# **KAICERT**  
*Lightning-Fast Subdomain Enumeration via Certificate Transparency*  

---

## **Installation**  
KAICERT requires **curl**, **jq**, **sed**, and **awk**. Follow these steps to set it up:  

### **1. Install Dependencies**  
#### Linux (Debian/Ubuntu):  
```bash  
sudo apt update && sudo apt install -y curl jq  
```  
#### Linux (Fedora/CentOS/RHEL):  
```bash  
sudo dnf install -y curl jq  
```  
#### macOS (Homebrew Required):  
```bash  
brew install curl jq  
```  
> **Note**: `sed` and `awk` are pre-installed on most Unix systems.  

---

### **2. Clone the Repository**  
```bash  
git clone https://github.com/mainajackson95/kaicert.git  
cd kaicert  
```  

### **3. Make the Script Executable**  
```bash  
chmod +x kaicert.sh  
```  

---

### **Alternative: One-Click Install Script**  
Run this command to **auto-install dependencies and KAICERT**:  
```bash  
curl -sSL https://raw.githubusercontent.com/maina95/kaicert/main/install.sh | bash  
```  

---

## **Usage**  
```bash  
./kaicert.sh  
Enter a domain (example domain.com): example.com  
```  
*Results are saved to `[DOMAIN]_subdomains_[DATE].txt` and displayed in the terminal.*  

---

## **Manual Dependency Checks**  
Verify installations:  
```bash  
curl --version    # Should show curl 7.xx+  
jq --version      # Should show jq-1.6+  
```  

---

## **Why KAICERT?**  
- 🚀 **Zero Dependencies**: Uses tools already on your system.  
- 🔄 **Cross-Platform**: Works on Linux/macOS.  
- 📦 **Auto-Installer**: Run one command and forget setup!  

---

*Find the unseen. Secure the exposed.* 🔍🔒  

---

![Demo](https://github.com/mainajackson95/kaicert/blob/main/ss/Screenshot_2025-01-23_19-48-50.jpg)
![Demo](https://github.com/mainajackson95/kaicert/blob/main/ss/Screenshot_2025-01-23_19-51-11.jpg)  

