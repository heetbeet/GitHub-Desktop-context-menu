# GitHub Desktop context menu

![image](https://user-images.githubusercontent.com/4103775/128999333-b1b887a2-4a1e-4468-8d3e-0d4441e67a18.png)
![image](https://user-images.githubusercontent.com/4103775/128999588-b78f420a-bf4b-4ef4-aef6-ade081890c0f.png)


### Quick-install GitHub-Desktop along with a context menu:
Run the following command in _Run_ `⊞+r`, or in a _Cmd_ window:

    powershell -nop -c "Invoke-WebRequest -Uri 'https://github.com/heetbeet/GitHub-Desktop-context-menu/raw/main/Install%20Github%20Desktop.cmd' -OutFile $env:Temp/_.cmd; Start-Process $env:Temp/_.cmd"
<br>
<br>

---

### Quick-install context menu only:
Run the following command in _Run_ `⊞+r`, or in a _Cmd_ window:

- Add menu 

      powershell -nop -c "Invoke-WebRequest -Uri 'https://github.com/heetbeet/GitHub-Desktop-context-menu/raw/main/Add%20GitHub-Desktop%20context%20menu.cmd' -OutFile $env:Temp/_.cmd; Start-Process $env:Temp/_.cmd"
    
- Remove menu 

      powershell -nop -c "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heetbeet/GitHub-Desktop-context-menu/main/Remove%20GitHub-Desktop%20context%20menu.cmd' -OutFile $env:Temp/_.cmd; Start-Process $env:Temp/_.cmd"

### Alternative installation

Run `Add GitHub-Desktop context menu.cmd` or `Remove GitHub-Desktop context menu.cmd` from [the zip release](https://github.com/heetbeet/GitHub-Desktop-context-menu/archive/refs/heads/main.zip)

