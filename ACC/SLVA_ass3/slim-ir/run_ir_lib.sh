# sudo rm -fr build/
if [ -d "build" ]; then
    # If it exists, remove its contents
    sudo rm -r build/*
else
    # If it doesn't exist, make a dir name build
    echo "Creating build"
    mkdir build 
fi
cd build
cmake -S .. -B .
sudo make install