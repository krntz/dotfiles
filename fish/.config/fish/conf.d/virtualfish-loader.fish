set -g PROJECT_HOME ~/Projects
set -g VIRTUALFISH_VERSION 2.5.9
set -g VIRTUALFISH_PYTHON_EXEC /usr/local/Cellar/virtualfish/2.5.9/libexec/bin/python
source /usr/local/Cellar/virtualfish/2.5.9/libexec/lib/python3.12/site-packages/virtualfish/virtual.fish
source /usr/local/Cellar/virtualfish/2.5.9/libexec/lib/python3.12/site-packages/virtualfish/auto_activation.fish
source /usr/local/Cellar/virtualfish/2.5.9/libexec/lib/python3.12/site-packages/virtualfish/projects.fish
emit virtualfish_did_setup_plugins
