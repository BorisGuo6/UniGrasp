import numpy as np
import scipy.ndimage

def read_pgm_xyz(filename):
    """Return image data from a PGM file generated by blensor. """
    fx = 472.92840576171875
    fy = fx 
    with open(filename, 'rb') as f:
        f.readline()
        f.readline()
        width_height = f.readline().strip().split()
        if len(width_height) > 1:
          width, height = map(int,width_height)
          print("width",width,height)
          value_max_range = float(f.readline())
          image_ = [float(line.strip()) for line in f.readlines()]
          if len(image_) == height * width:
            nx,ny = (width,height)
            x_index = np.linspace(0,width-1,width)
            y_index = np.linspace(0,height-1,height)
            xx,yy = np.meshgrid(x_index,y_index)
            xx -= float(width)/2
            yy -= float(height)/2
            xx /= fx
            yy /= fy

            cam_z = np.reshape(image_,(height, width))
            cam_z = cam_z / value_max_range * 1.5
            cam_x = xx * cam_z 
            cam_y = yy * cam_z
            image_z = np.flipud(cam_z)
            image_y = np.flipud(cam_y)
            image_x = np.flipud(cam_x)
            image_z = image_z[240-120:240+120, 320-160:320+160]
            image_x = image_x[240-120:240+120, 320-160:320+160]
            image_y = image_y[240-120:240+120, 320-160:320+160]

            zoom_scale = 1#0.25
            image_x = scipy.ndimage.zoom(image_x, zoom_scale, order=1)
            image_y = scipy.ndimage.zoom(image_y, zoom_scale, order=1)
            image_z = scipy.ndimage.zoom(image_z, zoom_scale, order=1)
            image = np.dstack((image_x,image_y,image_z))
            print("image",image.shape)
            return image
        
    return np.zeros((480,640,3))


