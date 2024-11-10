import numpy as np
import math

samplelist=[17,5,22,7,9,12]
sample1=np.array(samplelist)

mean=np.mean(sample1)
print("mean of the data is",mean)

meanDiffSqr=(sample1-mean)**2
print(meanDiffSqr)

strdDeviation=math.sqrt((np.sum(meanDiffSqr)/(sample1.size-1)))
print(f"the standard deviation of the number is {strdDeviation:.2f}")

print("the S.D using fn",np.std(sample1))

