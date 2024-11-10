import pandas as pd
import numpy as np

srs1=pd.Series(np.arange(0,11),index=np.arange(1,12))
print(srs1)
print(srs1.index)
print(srs1.values)