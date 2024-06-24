from bs4 import BeautifulSoup
from termcolor import colored
import requests
import os

clear = lambda:os.system("clear")

ver = colored("alpha version","magenta")

logo = f"""
 
  _     _   _    _____                      
 | |   | | | |  / ____|                     
 | |__ | |_| |_| (___   ___ _ __ __ _ _ __  
 | '_ \| __| __|\___ \ / __| '__/ _` | '_ \ 
 | | | | |_| |_ ____) | (__| | | (_| | |_) |
 |_| |_|\__|\__|_____/ \___|_|  \__,_| .__/ 
                                     | |    
                                     |_|    
  
 <[ {ver} ]>
"""

def pip(cmd):
	os.system(f"pip install {cmd}")

def errorHundler(file):
	os.system(f"""
	if ![ -f main.sh ]
	then
	   pkg install curl || sudo apt install curl
	   curl -O {file}
	fi    
	""")

while True:
	
	try:
		print(logo)		
		link = input("\tyour link: ")
		req = requests.get(link)
		soup = BeautifulSoup(req.text,"lxml")
		print(soup)
		os.system("sleep 20")
		clear()
	except:
		try:
			pip("requests")
			pip("html5lib")
			pip("lxml")
			pip("beautifulsoup4")
			pip("termcolor")
			os.system("python main.py")
			clear()
		except:
			try:
				clear()
				os.system("bash main.sh")
			except:
				clear()
				errorHundler("https://bartwel27.github.io/httScrap/main.sh")
