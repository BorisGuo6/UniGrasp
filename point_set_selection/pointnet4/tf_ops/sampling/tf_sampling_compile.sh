#/bin/bash
nvcc point_set_selection/pointnet4/tf_ops/sampling/tf_sampling_g.cu -o point_set_selection/pointnet4/tf_ops/sampling/tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# TF1.2
#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
g++ -std=c++11 point_set_selection/pointnet4/tf_ops/sampling/tf_sampling.cpp point_set_selection/pointnet4/tf_ops/sampling/tf_sampling_g.cu.o -o point_set_selection/pointnet4/tf_ops/sampling/tf_sampling_so.so -shared -fPIC -I ~/anaconda3/envs/py36/lib/python3.6/site-packages/tensorflow/include -I /usr/local/cuda-9.0/include -I ~/anaconda3/envs/py36/lib/python3.6/site-packages/tensorflow/include/external/nsync/internal -I ~/anaconda3/envs/py36/lib/python3.6/site-packages/tensorflow/include/external/nsync/public -l cudart -L /usr/local/cuda-9.0/lib64/ -L ~/anaconda3/envs/py36/lib/python3.6/site-packages/tensorflow -l tensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0
