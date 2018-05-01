# iOSBench
Swift benchmark test project. array etc...

# iOS array benchmark test.

- created by swift 

## measure 
Create String array. [String]
Item has 8192 chars.

- array create(append)
- array copy


# Result

## iPhone 8

| itemnum    | array create time(s) | array copy time(s) | 
|------------|---------------------|--------------------| 
|        100 | 0.000938            | 0.000009           | 
|       1000 | 0.000128            | 0.000062           | 
|      10000 | 0.000881            | 0.000483           | 
|     100000 | 0.005577            | 0.003073           | 
|    1000000 | 0.033246            | 0.026912           | 
|   10000000 | 0.325634            | 0.274719           | 
