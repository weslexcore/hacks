# Run this script to set up new mac
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
brew update

brew tap caskroom/cask
declare -a DEV_INSTALLS=(\
    "Xcode/xcode-select --install" \
    "Git/brew install git" \
    "Iterm2/brew cask install iterm2" \
    "Visual Studio Code/brew cask install visual-studio-code" \
    "Postgresql/brew install postgresql" \
    "curl/brew install curl" \
    "jq/brew install jq" \
    "HTTPie/brew install httpie" \
    "Bash-Completion/brew install bash-completion" \
    "DBeaver/brew cask install dbeaver-community" \
    "AWS CLI/brew install awscli" \
    "Kubernetes CLI/brew install kubernetes-cli" \
    "Docker/brew cask install docker" \
    "Insomnia/brew cask install insomnia" \
    "Whatsapp/brew cask install whatsapp" \
    "Discord/brew cask install discord" \
)


for install in "${DEV_INSTALLS[@]}"; do
    NAME=${install%%/*};
    CMD=${install#*/};
    echo -e "\n${NOTIFICATION}Installing $NAME... ${DEFAULT} \n"
    ${CMD}
    echo -e "\n${SUCCESS}${NAME} install successful ${DEFAULT} \n"
    echo "$SEPARATOR"
done


# VS CODE EXTENSIONS TO INSTALL
VS_CODE_EXTENSIONS=( \
    aaron-bond.better-comments \
    bengreenier.vscode-node-readme \
    burkeholland.simple-react-snippets \
    christian-kohler.npm-intellisense \
    dbaeumer.vscode-eslint \
    dzannotti.vscode-babel-coloring \
    eamodio.gitlens \
    eg2.vscode-npm-script \
    esbenp.prettier-vscode \
    mohsen1.prettify-json \
    mrmlnc.vscode-autoprefixer \
    ms-azuretools.vscode-docker \
    ms-vscode.Go \
    ms-vscode.vscode-typescript-tslint-plugin \
    ms-vsliveshare.vsliveshare \
    pnp.polacode \
    redhat.vscode-yaml \
    Shan.code-settings-sync \
    vscode-icons-team.vscode-icons \
    waderyan.gitblame \
    wix.vscode-import-cost \
)

for extension in ${VS_CODE_EXTENSIONS[@]}; do
    echo -e "${NOTIFICATION}Installing VSCode Extension $extension ${DEFAULT}"
    code --install-extension ${extension}
done

cd ~
git clone https://github.com/weslexcore/hacks.git
cp ./hacks/.bash_profile.template .bash_profile

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

VALID=false
VALID_REGEX="^[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}$"
until [[ "$VALID" == true ]]; do
    # NODE VERSION TO INSTALL VIA NVM
    DEFAULT_NODE_VERSION=10.15.1

    echo -e "\n"
    read -p "Which version of Node would you like to install? [10.15.1]" USER_VERSION
    
    NODE_VERSION=${USER_VERSION:-$DEFAULT_NODE_VERSION}

    if [[ $NODE_VERSION =~ $VALID_REGEX ]]; then
        VALID=true
    else
        echo 'Invalid version number, please enter a valid Node version'
    fi
done

nvm install $NODE_VERSION
nvm use $NODE_VERSION
