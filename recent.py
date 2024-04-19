import numpy as np

n = np.zeros((128,128, 3))
z = np.zeros((128, 128))
x = np.zeros((128, 128))
y = np.zeros((128, 128))
z_length = np.zeros((128, 128))

def calculate_distance(x1, y1, x2, y2):
    distance = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    return distance

def calculate_magnitude(x, y, z):
    magnitude = math.sqrt(x**2 + y**2 + z**2)
    return magnitude

for i in range(h):
    for j in range(w):
        if in_circle(i,j,w,h,radius):
            x[i][j] = j - 64;
            z[i][j] = math.sqrt(64**2 - (64 -i)**2 - (64 - j)**2)
            y[i][j] = i - 64;
            mag = calculate_magnitude(i, j,  z[i][j])
            n[i][j] = [ ((i-64)/mag), ((j-64)/mag), (z[i][j]/mag)  ]
            #z[i][j] = math.sqrt(64**2 - calculate_distance(i, j, 64, 64))
        
        #mag = calculate_magnitude(i, j,  z[i][j])
        #n[i][j] = [ ((i-64)/mag), ((j-64)/mag), (z[i][j]/mag)  ]

z = z/60
plt.imshow(z)
plt.colorbar()
