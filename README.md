# oc_opr_logs
Client for sending OPR logs to a centralized server


## Install Procedure

```bash
curl -s https://api.github.com/repos/ABalanuta/oc_opr_logs/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -

sudo dpkg -i oc-opr-logs*.deb

rm oc-opt-logs_*.deb

```


## Removing 
```bash
dpkg --purge oc-opt-logs
```


