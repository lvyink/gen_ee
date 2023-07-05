# 论文复现

论文"Document-Level Argument Extraction by Conditional Generation". NAACL 2021'


## 环境 
- pytorch=1.6 
- transformers=3.1.0
- pytorch-lightning=1.0.6
- spacy=2.3.2
- en_core_web_sm=2.3.0


## 数据集
- RAMS (Download at [https://nlp.jhu.edu/rams/])
- ACE05 (Access from LDC[https://catalog.ldc.upenn.edu/LDC2006T06] and preprocessing following OneIE[http://blender.cs.illinois.edu/software/oneie/])
- WikiEvents (Available here [s3://gen-arg-data/wikievents/])


## 目录设置

```
gen-ee
├── data
│     ├── RAMS_1.0
│     │      ├──data
│     │      └── ...
│     ├── wikievents
│     │      ├── coref
│     │      └── ...
│     ├── ace
│     └── ...
├── facebook
│     ├── bart-large
│     └── ...
├── src
│     ├──genie
│     └── ...
├── scripts
│     └── ...
└── viz
│ 
└── ...
```


## 准备

可以通过以下方式下载单个wikievents数据文件
- `wget https://gen-arg-data.s3.us-east-2.amazonaws.com/wikievents/data/<split>.jsonl` 
其中 split={train, dev,test},保存路径为data/wikievents.
- `wget https://gen-arg-data.s3.us-east-2.amazonaws.com/wikievents/data/coref/<split>.jsonlines` 
其中 split={train, dev, test},保存路径为data/wikievents/coref.
  
RAMS的其他已处理测试文件可通过以下方式下载
- `wget https://gen-arg-data.s3.us-east-2.amazonaws.com/RAMS/test_head_coref.jsonlines`
- `wget https://gen-arg-data.s3.us-east-2.amazonaws.com/RAMS/test_head.jsonlines`
保存路径为data/RAMS_1.0/data

 使用的预训练模型为bart-large，必要的配置文件可通过 
- https://huggingface.co/facebook/bart-large/tree/main  
- 下载，保存路径为facebook/bart-large

en_core_web_sm-2.3.0可通过如下指令安装
- pip3 install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-2.2.0/en_core_web_sm-2.3.0.tar.gz


## 训练及测试
- wikievents ：
- 首先运行src/genie/KAIROS_data_module.py，会生成preprocessed_KAIROS文件
- 然后运行scripts/train_kairos.sh进行训练以及scripts/test_kairos.sh进行测试
- RAMS ：
- 首先运行src/genie/data_module.py，会生成preprocessed_RAMS文件
- 然后运行scripts/train_rams.sh进行训练以及scripts/test_rams.sh进行测试


### 参考

https://github.com/raspberryice/gen-arg

