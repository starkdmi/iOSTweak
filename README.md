- Добавить код приложения (Tweak.xm)
- Выложить все файлы приложения
- Добавить снимки экрана из айфона


# Writing iOS tweak on Windows using Theos

First of all you need an Ubuntu emulator. You can download it from Microsoft Store by this [link](https://www.microsoft.com/store/productId/9NBLGGH4MSV6).

You will also need [Theos](https://github.com/theos/theos) suite of tools. Installation guide you can found [here](https://github.com/theos/theos/wiki/Installation).

To start developing tweaks follow the next steps:
1) Open Ubuntu simulator and log in as the superuser
```Bash
sudo -i
```
2) Next, go to the user directory (username is your PC user name)
```
cd /home/username
```
3) To launch a development tool type
```
theos
```
If you see a message "command not found" then use an absolute link to app 
```
/opt/theos/bin/nic.pl
```
After the application is launched, you see a list of templates for development. Choose the item "iphone/tweak" and write it number<br/>
![](temp/2.jpg?raw=true "Launch development tool")
4) Next, you need to provide information about your tweak. Of the required here is only the name. To skip any of the items, press Enter<br/>
![](temp/3.jpg?raw=true "Provide information about the tweak")
5) After you have received a message that everything is "Done." go to the project folder
```
cd /home/username/tweakname
```
6) Now you need to fix paths of Makefile. This is not a required step, but on my computer without it the project did not compile. You can use [Nano](https://en.wikipedia.org/wiki/Nano) or find file in Explorer and change it by notepad. This is what the Makefile looks like
```Makefile
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iostweak
iostweak_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
```
Replace $(THEOS) with "/opt/theos" and $(THEOS_MAKE_PATH) with "/opt/theos/makefiles". Also, I suggest adding the following line to the end of the file 
```Makefile
install.exec "uicache"
```
Now Makefile looks like this
```Makefile
include /opt/theos/makefiles/common.mk

TWEAK_NAME = iostweak
iostweak_FILES = Tweak.xm

include /opt/theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
	install.exec "uicache"
```
If you plan to use Frameworks in your code then append next line to Makefile. I'll use UIKit
```Makefile
iostweak_FRAMEWORKS = UIKit
```
As a result, we get the following file
```Makefile
include /opt/theos/makefiles/common.mk

TWEAK_NAME = iostweak
iostweak_FILES = Tweak.xm
iostweak_FRAMEWORKS = UIKit

include /opt/theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
	install.exec "uicache"
```

<!--- 
![](temp/5.jpg?raw=true "Open Makefile")
Replace $(THEOS) with "/opt/theos" and $(THEOS_MAKE_PATH) with "/opt/theos/makefiles". Now Makefile looks like this
![](temp/6.jpg?raw=true "Fix Makefile")
Also, I suggest adding the following line to the end of the file 
```Makefile
install.exec "uicache"
```
And in the end we get the following view
![](temp/7.jpg?raw=true "Makefile finish")
If you plan to use Frameworks in your code then append next line to Makefile. I'll use UIKit
```Makefile
tweakname_FRAMEWORKS = UIKit
```
![](temp/8.jpg?raw=true "Frameworks") 
--->

7) Execute the following command
```
make clean
```
8) Build our tweak
```
sudo make package
```
9) Now we can found .deb file in /packages folder. Transfer it to your device to /var/root folder. You can use [3uTools](http://www.3u.com/)
10) Now we need to launch mobile terminal
11) Execute the following command. Login is "root", password is "alpine"
```
login
```
12) Install a package on your device. "filename" is your .deb file name
```
dpkg -i filename.deb
```
13) Open one more window in terminal and execute
```
uicache
```
14) Go back to the previous window and on behalf of the superuser run
```
reboot
```

All Done.
