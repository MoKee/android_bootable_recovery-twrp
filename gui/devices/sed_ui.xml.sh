#!/bin/bash

#修改支持中文字体

#sed -i "s/<placement x=\"270\" y=\"76\" \/>/<placement x=\"400\" y=\"76\" \/>/" "$2"
sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"30\" fallback=\"Roboto-Condensed-30\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"28\" \/>/" "$1"

sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"40\" fallback=\"Roboto-Condensed-40\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"32\" \/>/" "$1"

sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"12\" fallback=\"Roboto-Condensed-12\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"10\" \/>/" "$1"

sed -i "s/<resource name=\"font\" type=\"font\" filename=\"RobotoCondensed-Regular.ttf\" size=\"20\" fallback=\"Roboto-Condensed-20\" \/>/<resource name=\"font\" type=\"font\" filename=\"SG_Bold.ttf\" size=\"15\" \/>/" "$1"


