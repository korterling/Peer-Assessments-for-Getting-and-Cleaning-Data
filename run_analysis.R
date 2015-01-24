#项目要求
#1.  整合培训和测试集，创建一个数据集。

#2.  仅提取测量的平均值以及每次测量的标准差。

#3.  使用描述性活动名称命名数据集中的活动

#4.  使用描述性变量名称恰当标记数据集。

#5.  从第4步的数据集中，针对每个活动和每个主题使用每个表里的平均值建立第2个独立的整洁数据集。

#读取数据
X_train<-read.table("X_train.txt")
X_test<-read.table("X_test.txt")
#合并数据，得到一个新数据集
data<-rbind(X_train,X_test)
#使用描述性活动名称命名数据集中的活动
names(data)<-read.table("features.txt")$V2
#提取测量的平均值以及每次测量的标准差。

data1<-data[,sort(c(grep("[mM]ean",names(data)),grep("std",names(data))))]

#使用描述性变量名称恰当标记数据集。
names<-""
names[1:7352]<-"train"
names[7353:10299]<-"test"
names<-paste(rownames,1:10299)
rownames(data1)<-names
#针对每个活动和每个主题使用每个表里的平均值建立第2个独立的整洁数据集
data2<-data1[,grep("[mM]ean",names(data1))]
#保存第二个数据集
write.table(data2,"tidy.txt",row.name=FALSE)
