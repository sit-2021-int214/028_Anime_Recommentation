# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer


1.) หาค่าเฉลี่ย Body weight ของแมวเพศเมีย และ จำนวนของแมวเพศเมียทั้งหมด
```{R}
mean(cats$Bwt[cats$Sex == 'F']) #2.359574
sum(cats$Sex == 'F') #47
```
คำอธิบาย
```{R}
หาค่าเฉลี่ย Body weight แมวเพศเมีย โดยใช้คำสั่ง mean(cats$Bwt) เพื่อบอกว่าเราใช้ข้อมูลชุดไหนอยู่และตามด้วย $ เพื่อเรียก Colum ที่เราจะหา และทำการตรวจสอบอีกครั้งว่าเป็นเพศเมียโดยใช้ [cats$Sex == 'F']
หาจำนวนแมวเพศเมียทั้งหมดโดยใช้คำสั่ง sum -- > sum(cats$Sex == 'F') กำหนดว่า $Sex == 'F' เพื่อตรวจสอบว่าเป็นเพศเมีย
```
2.) หาค่าเฉลี่ยของความสูงคนที่ถนัดเขียนมือซ้าย
```{R}
mean(survey$Height[survey$W.Hnd == 'Left'],na.rm = TRUE) #175.18
```
คำอธิบาย
```{R}
หาค่าเฉลี่ยโดยใช้คำสั่ง mean survey$Height และทำการตรวจสอบอีกครั้งว่าถนัดเขียนมือซ้ายโดยใช้ [survey$W.Hnd == 'Left']
มีการใช้ na.rm = TRUE เพื่อเอาค่า NA ใน column Height ออกไปจากการคิดค่า mean

```


### Team: Alpha-Lactabulmin

1. นาย ภาณุพงศ์ นาคมณี    StudentID: 63130500092
2. นาย รัญชน์ เลิศจิตธำรง     StudentID: 63130500101
3. นาย วศิน สุขีทรัพย์        StudentID: 63130500104
4. นาย รุ่งภพ จรัสพัฒน์       StudentID: 63130500157


