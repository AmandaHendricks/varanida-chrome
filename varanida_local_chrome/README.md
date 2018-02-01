# varanida-chrome

## Deployment

The extension is in atemplate form, which means it has to be "deployed" to use.
for that:
- make the deploy script executable (`chmod +x deploy_script.sh`)
- run it (`./deploy_script.sh`)
You can then choose your target network (local servers, staging servers or production) and browser (firefox or chrome).
The resulting extension folder is created alongside the template folder.

## Developpment Installation

to test the extension without it being packed:
- open the extension panel in Chrome (smthg like "More Tools">"Extensions" or chrome://extensions as url)
- make sure the Extension panel is in developer mode (checkbox in top right corner)
- drag and drop the extension folder from your file system to the extension panel
