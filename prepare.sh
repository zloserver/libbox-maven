wget https://go.dev/dl/go1.25.8.linux-amd64.tar.gz
tar -C . -xzf go1.25.8.linux-amd64.tar.gz
export PATH="$PATH:$(pwd)/go/bin"
go version

yes | $ANDROID_HOME/tools/bin/sdkmanager --install "ndk;28.0.13004108"
yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-23"
yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;21.1.2"
yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-21"
yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;23.0.3"

# sdkman pollutes envs
export SING_BOX_VERSION=$VERSION

source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk update
sdk install java 17.0.18-ms
sdk use java 17.0.18-ms
export JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.18-ms"
export PATH="$JAVA_HOME/bin:$PATH"
java --version

git clone https://github.com/SagerNet/sing-box.git --depth 1 --branch "$SING_BOX_VERSION" --single-branch
pushd sing-box
make lib_install
export PATH="$PATH:$(go env GOPATH)/bin"
go run ./cmd/internal/build_libbox -target android
popd