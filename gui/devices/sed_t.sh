#!/bin/bash

#设置电池的位置，将原来的 270 修改成400

#sed -i "s/<placement x=\"270\" y=\"76\" \/>/<placement x=\"400\" y=\"76\" \/>/" "$2"

#替换ui.xml中的变量
#将 <text>...</text> ; 修改成 <text id=....>...</text>
cat "$1" | while read line
 do
	orig=`echo "$line" | sed -ne '/ id=\"/ { s/\(<[^>]*\)\([ \t]\+id=\"[^\">]*\"\)\([^>]*>[^<>]*<\/.*>\)/\1\3/; s/\//\\\\\//g; s/\"/\\\"/g; s/\&/\\\&/g; p }'`
	if [ -n "$orig" ]
	then
		sed -i "s/$orig/`echo "$line" | sed -ne '/ id=\"/ {s/\//\\\\\//g; s/\"/\\\"/g; s/\&/\\\&/g; p }'`/g" "$2"
	fi
done


#将双语言功能插入

# for multi languages 
sed -i "s/^[ \t]*<\/pages>/\n\t\t<page name=\"choosedeflanguage\">\n\
\t\t\<object type=\"template\" name=\"header\" \/>\n\
\t\t\<object type=\"listbox\">\n\
\t\t\<highlight color=\"%fileselector_highlight_color%\" \/>\n\
\t\t\<placement x=\"%listbox_x%\" y=\"%row1_header_y%\" w=\"%listbox_width%\" h=\"170\" \/>\n\
\t\t\<header background=\"%fileselector_header_background%\" textcolor=\"%fileselector_header_textcolor%\" separatorcolor=\"%fileselector_header_separatorcolor%\" separatorheight=\"%fileselector_header_separatorheight%\" \/>\n\
\t\t\<fastscroll linecolor=\"%fastscroll_linecolor%\" rectcolor=\"%fastscroll_rectcolor%\" w=\"%fastscroll_w%\" linew=\"%fastscroll_linew%\" rectw=\"%fastscroll_rectw%\" recth=\"%fastscroll_recth%\" \/>\n\
\t\t\<text id=\"language_select\">Select Language<\/text>\n\<icon selected=\"radio_true\" unselected=\"radio_false\" \/>\n\
\t\t\<separator color=\"%fileselector_separatorcolor%\" height=\"%fileselector_separatorheight%\" \/>\n\<background color=\"%listbox_background%\" \/>\n\
\t\t\<font resource=\"font\" spacing=\"%listbox_spacing%\" color=\"%text_color%\" highlightcolor=\"%fileselector_highlight_font_color%\" \/>\n\
\t\t\<data name=\"tw_lang_guisel\" \/>\n\
\t\t\<listitem id=\"lang_en\" name=\"English\">en<\/listitem>\n\
\t\t\<listitem id=\"lang_zh-CN\" name=\"Chinese\">zh-CN<\/listitem>\n\
\t\t\<\/object>\n\n\
\t\t\<object type=\"checkbox\">\n\
				<placement x=\"%col1_x%\" y=\"%row4_text_y%\" \/>\n\
				<text id=\"NeverShowIt\">Never show this screen during boot again<\/text>\n\
				<data variable=\"tw_never_show_choose_languages_page\" \/>\n\
			<\/object>\n\
			<object type=\"button\">\n\
				<highlight color=\"%highlight_color%\" \/>\n\
				<placement x=\"%col_center_x%\" y=\"%tz_set_y%\" \/>\n\
				<font resource=\"font\" color=\"%button_text_color%\" \/>\n\
                                <text id=\"lang_set\">Set Language<\/text>\n\
				<image resource=\"main_button\" \/>\n\
				<action function=\"chooselanguages\"><\/action>\n\
				<action function=\"set\">tw_page_done=1<\/action>\n\
				<action function=\"page\">%tw_back%<\/action>\n\
			<\/object>\n\
			<object type=\"text\" color=\"%text_color%\">\n\
				<font resource=\"font\" \/>\n\
				<placement x=\"%center_x%\" y=\"%tz_current_y%\" placement=\"5\" \/>\n\
				<text id=\"language_current\">Current Language: %tw_lang_name%<\/text>\n\
			<\/object>\n\
\t\t\<object type=\"template\" name=\"footer\" \/>\n\
\t\t\t\<\/page>\n\
\t\t\<\/pages>\n/" "$2"
