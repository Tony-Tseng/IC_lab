1. How do I orginize the testbench in Part2?
In part2, we are supposed to compare results between rop_smart and rop_lut16; therefore, I use for loops to assign values to P,S,D from 0~2^N. Besides, I store 15 modes in HW1 PDF in an array initially and also use for loop to assign value to Mode pin, data_in_valid(0,1 each time).

2. How do I orginize the testbench in Part2?
In part3, we are supposed to compare results between rop_smart and rop_lut256; therefore, I use for loops to assign values to P,S,D from 0~2^N. This time the mode will start from 0 to 255 and use for loop to assign value to Mode pin, data_in_valid(0,1 each time).

3.How do I find out all 256 functions in part3?
I observe the formula from the implementation of smart module, and I found out that each bit in {P[i],S[i],D[i]} can create a truth table, whose output is mode. Therefore, I compute the K map of each bit to find the logic of one hot encoding (00000001, 00000010, ......, 10000000). Last but not least, I wrote a python code to generate the table, since each bit exists individually and I can simply OR each bit to get the desired results. ex. 10100001 -> logic of ( 10000000 | 00100000 | 00000001 ).

The python code is as follow:

known = {}
pattern = {}
known[0]   = "0"
known[1]   = "~(P|S|D)"
known[2]   = "~(P|S)&D"
known[4]   = "~(P|D)&S"
known[8]   = "~P&S&D"
known[16]  = "P&~(S|D)"
known[32]  = "P&~S&D"
known[64]  = "P&S&~D"
known[128] = "P&S&D"

known = sorted(known.items(),reverse=True)
pattern = known

for target in range(0,256):
    pattern = sorted(pattern,reverse=True)
    tmp = ""
    value = target
    keys = {k for k,v in pattern}
    if target not in keys:
        for k,v in known:
            if (value==0):
                pattern.insert(len(pattern),(target,tmp))
                break
            elif(value>=k):
                value -= k
                if tmp == "":
                    tmp = "(" + v + ")"
                else:
                    tmp = tmp + "|(" + v +")"
pattern = sorted(pattern)
fp = open("lut256.txt","a")

for k,v in pattern:
    fp.write(f"8'h{k:0x} : begin Result = {v}; end\n")

fp.close()
