#!/bin/sh

# Create necessary directories
mkdir -p $HOME/.tdk/bin

# Fetch the latest/specified JAR file
TDK_VERSION=${TDK_VERSION:-"latest"}
TDK_JAR="synthesized_tdk_${TDK_VERSION}.jar"
curl -L -o $HOME/.tdk/latest.jar "https://governor-static.synthesized.io/jars-public/$TDK_JAR"

# Create a wrapper shell script
cat > $HOME/.tdk/bin/tdk << EOF
#!/bin/sh
java -jar $HOME/.tdk/latest.jar "\$@"
EOF

# Make the wrapper script executable
chmod +x $HOME/.tdk/bin/tdk

echo "TDK installation is complete. To use it, add TDK to your path with:"
echo 'export PATH=$HOME/.tdk/bin:$PATH'
echo "You can add this line to your shell's profile file (e.g., .bashrc, .zshrc, .bash_profile, or .profile) to make the change permanent."
