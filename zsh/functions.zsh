# zsh
# Functions file

# ls directories after cd'ing into them.
function list_all() {
  emulate -L zsh
  ls -ACF
}
chpwd_functions=(${chpwd_functions[@]} "list_all")
