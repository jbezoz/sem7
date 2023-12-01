if [ -d "build" ]; then
    # If it exists, remove its contents
    rm -r build/*
else
    # If it doesn't exist, make a dir name build
    echo "Creating build"
    mkdir build/
fi
cd build/ && cmake .. 
make
./cs-ssa ../testcases/test.slim.ll 