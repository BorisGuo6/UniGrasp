#/bin/bash
nvcc tf_grouping_g.cu -o tf_grouping_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC -Ddisable_float128

# TF1.2
#g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
# g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o ../../../tf_grouping_so.so -shared -fPIC -I  /home/shaol/anaconda3/envs/uni/lib/python3.6/site-packages/tensorflow/include/ -I /usr/local/cuda-9.0/include -I /home/shaol/anaconda3/envs/uni/lib/python3.6/site-packages/tensorflow/include/external/nsync/public  -lcudart -L /usr/local/cuda-9.0/lib64/ -L /home/shaol/anaconda3/envs/uni/lib/python3.6/site-packages/tensorflow -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0 -Ddisable_float128