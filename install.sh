#!/bin/sh

# Create necessary directories
mkdir -p $HOME/.tdk/bin

# Fetch the latest JAR file
# FIXME: select latest version automatically 
# LATEST_JAR_URL=$(curl -s https://synthesizedio.jfrog.io/artifactory/tdk-public/ | grep -o 'href="[^"]*.jar"' | sed 's/href="//;s/"//' | grep -E '_v[0-9]+\.[0-9]+\.[0-9]+\.jar$' | sort -t. -k2,2n -k3,3n -k4,4n | tail -n 1)
LATEST_JAR_URL="synthesized_tdk_v1.100.0.jar"
curl -L -o $HOME/.tdk/latest.jar "https://governor-static.synthesized.io/jars-public/$LATEST_JAR_URL"

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
