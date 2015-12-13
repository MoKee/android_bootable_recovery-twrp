#!/bin/bash
#old 
# for multi languages 
sed -i "s/^[ \t]*<\/pages>/\n\t\t<page name=\"language_reload\">\n\
                        <object type=\"template\" name=\"header\" \/>\n\
\n\
			<object type=\"listbox\">\n\
				<highlight color=\"%fileselector_highlight_color%\" \/>\n\
                                <placement x=\"%listbox_x%\" y=\"%row1_header_y%\" w=\"%listbox_width%\" h=\"135\" \/>\n\
				<header background=\"%fileselector_header_background%\" textcolor=\"%fileselector_header_textcolor%\" separatorcolor=\"%fileselector_header_separatorcolor%\" separatorheight=\"%fileselector_header_separatorheight%\" \/>\n\
				<fastscroll linecolor=\"%fastscroll_linecolor%\" rectcolor=\"%fastscroll_rectcolor%\" w=\"%fastscroll_w%\" linew=\"%fastscroll_linew%\" rectw=\"%fastscroll_rectw%\" recth=\"%fastscroll_recth%\" \/>\n\
                                <text id=\"language_select\">Select Language<\/text>\n\
				<icon selected=\"radio_true\" unselected=\"radio_false\" \/>\n\
				<separator color=\"%fileselector_separatorcolor%\" height=\"%fileselector_separatorheight%\" \/>\n\
				<background color=\"%listbox_background%\" \/>\n\
				<font resource=\"font\" spacing=\"%listbox_spacing%\" color=\"%text_color%\" highlightcolor=\"%fileselector_highlight_font_color%\" \/>\n\
\n\
				<data name=\"tw_lang_guisel\" \/>\n\
				<listitem id=\"lang_en\" name=\"English\">en<\/listitem>\n\
				<listitem id=\"lang_zh-CN\" name=\"Chinese\">zh-CN<\/listitem>\n\
			<\/object>\n\
\n\
			<object type=\"button\">\n\
				<highlight color=\"%highlight_color%\" \/>\n\
				<placement x=\"%col_center_x%\" y=\"%tz_set_y%\" \/>\n\
				<font resource=\"font\" color=\"%button_text_color%\" \/>\n\
                                <text id=\"lang_set\">Set Language<\/text>\n\
				<image resource=\"main_button\" \/>\n\
				<action function=\"reload\"><\/action>\n\
			<\/object>\n\
\n\
			<object type=\"text\" color=\"%text_color%\">\n\
				<font resource=\"font\" \/>\n\
				<placement x=\"%center_x%\" y=\"%tz_current_y%\" placement=\"5\" \/>\n\
				<text id=\"language_current\">Current Language: %tw_lang_name%<\/text>\n\
			<\/object>\n\
\n\
			<object type=\"action\">\n\
				<touch key=\"home\" \/>\n\
				<action function=\"page\">main<\/action>\n\
			<\/object>\n\
\n\
			<object type=\"action\">\n\
				<touch key=\"back\" \/>\n\
                                <action function=\"page\">advanced<\/action>\n\
			<\/object>\n\
\n\
			<object type=\"template\" name=\"footer\" \/>\n\
		<\/page>\n\
         <\/pages>\n/" "$2"

