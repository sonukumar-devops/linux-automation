############URL HEALTH CHECK + simple logging############
#!/usr/bin/env python3

import requests
import sys
from requests.exceptions import RequestException
from datetime import datetime



url = "https://www.google.com"

def main():
    try:
        res = requests.get(url, timeout=5)
        status = res.status_code
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        if status == 200:
            print(f"[{now}] - OK: {url} is reachable (HTTP {status})")
            sys.exit(0)
        else:
            print(f"[{now}] Alert: {url} returned HTTP {status}")
            sys.exit(1)
            
    except RequestException as e:
        
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(f"[{now}] CRITICAL: {url} is not reachable: {e}")
        sys.exit(2)
        
if __name__ == "__main__":
    main()
