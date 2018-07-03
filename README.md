# Writing iOS tweak on Windows using Theos

First of all you need an Ubuntu emulator. You can download it from Microsoft Store by this [link](https://www.microsoft.com/store/productId/9NBLGGH4MSV6).

You will also need [Theos](https://github.com/theos/theos) suite of tools. Installation guide you can found [here](https://github.com/theos/theos/wiki/Installation).

To start developing tweaks follow the next steps:
- Open Ubuntu simulator and log in as the superuser using "sudo -i" command
![](temp/1.jpg?raw=true "Authorize as root")
- Type next command "cd /home/username" where "username" is your PC user name
- To launch a development tool type "theos". If you see a message "command not found" then use an absolute link to app "/opt/theos/bin/nic.pl". After the application is launched, you see a list of templates for development. Choose the item "iphone/tweak" and write it number
![](temp/2.jpg?raw=true "Launch development tool")
- Next, you need to provide information about your tweak. Of the required here is only the name. To skip any of the items, press Enter
![](temp/3.jpg?raw=true "Provide information about the tweak")
- After you have received a message that everything is "Done." go to the project folder using "cd /home/username/tweakname" command
![](temp/4.jpg?raw=true "Go to project folder")
- Now you need to fix paths of Makefile. This is not a required step, but on my computer without it the project did not compile. You can use [Nano](https://en.wikipedia.org/wiki/Nano) or find file in Explorer and change it by notepad
![](temp/5.jpg?raw=true "Open Makefile")
Replace $(THEOS) with "/opt/theos" and $(THEOS_MAKE_PATH) with "/opt/theos/makefiles". Now Makefile looks like this
![](temp/6.jpg?raw=true "Fix Makefile")
Also, I suggest adding the following line to the end of the file 
```
install.exec "uicache"
```
And in the end we get the following view
![](temp/7.jpg?raw=true "Makefile finish")
If you plan to use Frameworks in your code then append next line to Makefile. I'll use UIKit
```
tweakname_FRAMEWORKS = UIKit
```
![](temp/8.jpg?raw=true "Frameworks")
- 


<!--- just ---> 

