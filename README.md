# GitHub Desktop context menu
Run `Add GitHub-Desktop context menu.cmd` or `Remove GitHub-Desktop context menu.cmd` from [the zip release](https://github.com/heetbeet/GitHub-Desktop-context-menu/archive/refs/tags/0.0.2.zip) to add to your explorer context menu.

![image](https://user-images.githubusercontent.com/4103775/128999333-b1b887a2-4a1e-4468-8d3e-0d4441e67a18.png)
![image](https://user-images.githubusercontent.com/4103775/128999588-b78f420a-bf4b-4ef4-aef6-ade081890c0f.png)

# Run via a quick command

Copy `Ctrl+c` and paste `Ctrl+v` the following code into your run box `⊞+r` or into a terminal:

### ⊕ add

    powershell -nop -c "Invoke-WebRequest -Uri 'https://github.com/heetbeet/GitHub-Desktop-context-menu/raw/main/Add%20GitHub-Desktop%20context%20menu.cmd' -OutFile $env:Temp/_.bat; Start-Process $env:Temp/_.bat"

### ⊖ remove

    powershell -nop -c "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heetbeet/GitHub-Desktop-context-menu/main/Remove%20GitHub-Desktop%20context%20menu.cmd' -OutFile $env:Temp/_.bat; Start-Process $env:Temp/_.bat"
