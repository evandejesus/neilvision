import numpy as np
import cv2 as cv

cap = cv.VideoCapture(0)
# fourcc = cv.VideoWriter_fourcc(*'XVID')
# out = cv.VideoWriter('assets/output.avi', fourcc, 20.0, (640,  480))
if not cap.isOpened():
    print('cannot open camera')
    exit()

while True:
    ret, frame = cap.read()
    if not ret:
        print("Can't receive frame (stream end?). Exiting ...")
        break

    frame = cv.flip(frame, 1)
    # out.write(frame)
    cv.imshow('frame', frame)
    if cv.waitKey(1) == ord('q'):
        break

cap.release()
# out.release()
cv.destroyAllWindows()
