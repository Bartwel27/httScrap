#!/usr/system/bin/sh
#!/sys/bin/bash

# libraries
function lib(){
  
  # quick install
  pip install beautifulsoup4 || pip3 install beautifulsoup4
  pip install bs4 || pip3 install bs4
  pip install lxml || pip3 install lxml
  pip install requests || pip3 install requests
  pip install termcolor || pip3 install termcolor
  
  pkg install curl || sudo apt install curl
  
  # else ...
  
  # requests lib
  if pip show requests > log
  then
      rm -rf log
      echo "requests library is installed"
  else
     while true
     do
       pip install requests
       if pip show requests > log
       then
          rm -rf log
          break
       fi
     done
  fi
  
  # beautifulsoup lib
  if pip show beautifulsoup4 > log
  then
      rm -rf log
      echo "beautifulsoup4 is already installed"
  else
      while true
      do
        pip install beautifulsoup4 bs4
        if pip show beautifulsoup4 > log
        then
           rm -rf log
           break
        fi
      done
  fi
  
  # lxml lib
  if pip show lxml > log
  then
      rm -rf log
      echo "lxml is already installed"
  else
      while true
      do
        pip install lxml
        if pip show lxml > log
        then
           rm -rf log
           break
        fi
      done
  fi
  
  # html5lib lib
  if pip show html5lib > log
  then
      rm -rf log
      echo "html5lib is already installed"
  else
      while true
      do
        pip install html5lib
        if pip show html5lib > log
        then
           rm -rf log
           break
        fi
      done
  fi
  
}

# python check
if command -v python > log
then
   rm -rf log
   lib
   if ![ -f main.py ];then
     curl -O https://bartwel27.github.io/httScrap/main.py
     python main.py
   fi
else
   pkg install python || sudo apt install python
   lib
   if ![ -f main.py ];then
     curl -O https://bartwel27.github.io/httScrap/main.py
     python main.py
   fi
fi
