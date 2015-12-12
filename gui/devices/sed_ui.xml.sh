#!/bin/bash

#修改支持中文字体

# New version for android 6.0 
# 1920*1200 
sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"30\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"30\" \/>/" "$1"

sed -i "s/<resource name=\"fixed\" type=\"font\" filename=\"DroidSansMono.ttf\" size=\"22\" \/>/<resource name=\"fixed\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"22\" \/>/" "$1"
# 1080*1920 
sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"40\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"40\" \/>/" "$1"
sed -i "s/<resource name=\"mediumfont\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"40\" \/>/<resource name=\"mediumfont\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"40\" \/>/" "$1"
sed -i "s/<resource name=\"filelist\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"40\" \/>/<resource name=\"filelist\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"40\" \/>/" "$1"
sed -i "s/<resource name=\"fixed\" type=\"font\" filename=\"DroidSansMono.ttf\" size=\"30\" \/>/<resource name=\"fixed\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"30\" \/>/" "$1"
# 800*400 
sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"16\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"16\" \/>/" "$1"
sed -i "s/<resource name=\"fixed\" type=\"font\" filename=\"DroidSansMono.ttf\" size=\"12\" \/>/<resource name=\"fixed\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"12\" \/>/" "$1"

# 480*800 
sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"20\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"20\" \/>/" "$1"
sed -i "s/<resource name=\"mediumfont\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"20\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"20\" \/>/" "$1"
sed -i "s/<resource name=\"filelist\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"20\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"20\" \/>/" "$1"
sed -i "s/<resource name=\"fixed\" type=\"font\" filename=\"DroidSansMono.ttf\" size=\"16\" \/>/<resource name=\"fixed\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"16\" \/>/" "$1"
# 320*320
sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"14\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"14\" \/>/" "$1"
sed -i "s/<resource name=\"mediumfont\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"14\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"14\" \/>/" "$1"
sed -i "s/<resource name=\"filelist\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"14\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"14\" \/>/" "$1"
sed -i "s/<resource name=\"fixed\" type=\"font\" filename=\"DroidSansMono.ttf\" size=\"12\" \/>/<resource name=\"fixed\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"12\" \/>/" "$1"


