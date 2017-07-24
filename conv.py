# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import numpy as np
from matplotlib import pyplot as plt
import scipy.misc

I=plt.imread('/home/nikhil/Pictures/arnold.jpeg')
#filters
#identity
f1=np.array([[[0,1,0],[0,1,0],[0,1,0]],[[0,1,0],[0,1,0],[0,1,0]],[[0,1,0],[0,1,0],[0,1,0]]])
f1=f1.reshape((f1.shape[0]*f1.shape[1]*f1.shape[2]))
#edge
f2=np.array([[[0,1,0],[1,-4,1],[0,1,0]],[[0,1,0],[1,-4,1],[0,1,0]],[[0,1,0],[1,-4,1],[0,1,0]]])
f2=f2.reshape((f2.shape[0]*f2.shape[1]*f2.shape[2]))
f3=np.array([[[0,-1,0],[1,-5,1],[0,-1,0]],[[0,-1,0],[1,-5,1],[0,-1,0]],[[0,-1,0],[1,-5,1],[0,-1,0]]])
f3=f3.reshape((f3.shape[0]*f3.shape[1]*f3.shape[2]))
F=np.array([f1,f2,f3])


#image to array
I=np.asarray(I)
#image resize
I=scipy.misc.imresize(I,(259,259))
plt.figure()
plt.subplot(1,4,1)
plt.imshow(I)
#uint8 to float
I=I.astype(float)
#counter
k=0
#enter stride
s=int(input("Enter stride:"))
#output dimension
T=int(((I.shape[0]-3)/s)+1)
#image retrieval matrix
W=np.zeros((27,T*T))

    
#im2col ops
for i in np.arange(0,I.shape[0]-s,s):
    for j in np.arange(0,I.shape[0]-s,s):
            
        x=I[i:i+3,j:j+3,0]
        x=x.reshape(x.shape[0]*x.shape[1])
        y=I[i:i+3,j:j+3,1]
        y=y.reshape(y.shape[0]*y.shape[1])
        z=I[i:i+3,j:j+3,2]
        z=z.reshape(z.shape[0]*z.shape[1])
        t=np.array([x,y,z])
        t=t.reshape(x.shape[0]+y.shape[0]+z.shape[0])
        W[:,k]=t
        k=k+1
#convolution
d=F.dot(W)

#visualization
plt.subplot(1,4,2)
plt.imshow(d[0,:].reshape(T,T),cmap='gray')
plt.subplot(1,4,3)
plt.imshow(d[1,:].reshape(T,T),cmap='gray')
plt.subplot(1,4,4)
plt.imshow(d[2,:].reshape(T,T),cmap='gray')