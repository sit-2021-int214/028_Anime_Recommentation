### Step to do:

0. Assign variables:
   - μ0 or p0
   - x̄ or P̅
   - n
   - sd (or sigma σ)
   - α (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha α)
3. Select Test statistic (This formula for one population)
   - `z/t <- (xbar - u0) / (sd/sqrt(n))`
   - `z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)`
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion

### Part : 1
จากข้อมูลที่ได้มามี Anime จำนวนทั้งหมด 11,830 โดยทางกลุ่มสนใจ Anime ที่เป็นประเภท ONA ซึ่งมีจำนวนทั้งหมด 606 เรื่องจากทั้งหมด และได้ตั้งสมมุติฐานว่าคะแนนความนิยมของ Anime ประเภทนี้ส่วนใหญ่จะมีคะแนนที่มากกว่า 5.70 คะแนน โดยที่มีค่าเฉลี่ยของคะแนนอยู่ที่ 5.64 คะแนน และมีส่วนเบี่ยงเบนมาตรฐานอยู่ที่ 1.12


### Step 0: Assign variables

```
n <- 606
sd <- 1.12
xbar <- 5.64
u0 <-  5.7
  ```

### Step 1: State the hypothesis

```
Ho: μ ≥ 5.7 
Ha: μ < 5.7
```

### Step 2: Level of significance

```
alpha <- 0.05
```

### Step 3: Test statistic

```
z <- (xbar - u0) / (sd/sqrt(n))
```
Result
```
-1.301828
```

### Step 4: Finding P-value approach or Critical Value approach
#### P-value approach

```
pvalue <- pnorm(z)
```
Result
```
0.09648
```
#### Critical Value approach
```
zalpha <- qnorm(alpha)
```
Result
```
-1.644854
```

### Step 5: Compare

```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```
Result
```
P-value approach : "Accept H0"
Critical value approach : "Accept H0"
```


### Step 6: Conclusion

จากการทดสอบสมมุติฐาน พบว่ายอมรับสมมุติฐานข้างต้น Anime ประเภท ONA ส่วนใหญ่มีคะแนนเฉลี่ยที่มากกว่า 5.70 คะแนน
