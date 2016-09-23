/* -*- Mode: Vala; indent-tabs-mode: nil; tab-width: 4 -*-
 * -*- coding: utf-8 -*-
 *
 * Copyright (C) 2011 ~ 2016 Deepin, Inc.
 *               2011 ~ 2016 Wang Yong
 *
 * Author:     Wang Yong <wangyong@deepin.com>
 * Maintainer: Wang Yong <wangyong@deepin.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */ 

using Gtk;
using Widgets;
using Gee;
using Animation;

namespace Widgets {
    public class Preference : Widgets.Dialog {
		// public Gtk.SpinButton scroll_line_spinbutton;
		public ArrayList<string> font_names;
		public ArrayList<string> window_state_list;
		public ArrayList<string> window_state_name_list;
		public Gtk.ComboBoxText font_combox;
		public Gtk.ComboBoxText window_combox;
		public Gtk.Entry close_other_windows_key_entry;
		public Gtk.Entry close_window_key_entry;
		public Gtk.Entry close_workspace_key_entry;
		public Gtk.Entry copy_key_entry;
		public Gtk.Entry display_hotkey_terminal_key_entry;
		public Gtk.Entry fullscreen_key_entry;
		public Gtk.Entry new_workspace_key_entry;
		public Gtk.Entry next_workspace_key_entry;
		public Gtk.Entry paste_key_entry;
		public Gtk.Entry open_key_entry;
		public Gtk.Entry previous_workspace_key_entry;
		public Gtk.Entry search_key_entry;
		public Gtk.Entry select_all_key_entry;
		public Gtk.Entry select_down_window_key_entry;
		public Gtk.Entry select_left_window_key_entry;
		public Gtk.Entry select_right_window_key_entry;
		public Gtk.Entry select_up_window_key_entry;
		public Gtk.Entry show_remote_manage_key_entry;
		public Gtk.Entry split_horizontally_key_entry;
		public Gtk.Entry split_vertically_key_entry;
		public Gtk.Entry zoom_in_key_entry;
		public Gtk.Entry zoom_out_key_entry;
		public Gtk.Entry zoom_reset_key_entry;
		public Gtk.Label close_other_windows_key_label;
		public Gtk.Label close_window_key_label;
		public Gtk.Label close_workspace_key_label;
		public Gtk.Label copy_key_label;
		public Gtk.Label cursor_style_label;
		public Gtk.Label display_hotkey_terminal_key_label;
		public Gtk.Label font_label;
		public Gtk.Label fullscreen_key_label;
		public Gtk.Label new_workspace_key_label;
		public Gtk.Label next_workspace_key_label;
		public Gtk.Label opacity_label;
		public Gtk.Label paste_key_label;
		public Gtk.Label open_key_label;
		public Gtk.Label previous_workspace_key_label;
		public Gtk.Label search_key_label;
		public Gtk.Label select_all_key_label;
		public Gtk.Label select_down_window_key_label;
		public Gtk.Label select_left_window_key_label;
		public Gtk.Label select_right_window_key_label;
		public Gtk.Label select_up_window_key_label;
		public Gtk.Label show_remote_manage_key_label;
		public Gtk.Label split_horizontally_key_label;
		public Gtk.Label split_vertically_key_label;
		public Gtk.Label theme_label;
		public Gtk.Label window_label;
		public Gtk.Label zoom_in_key_label;
		public Gtk.Label zoom_out_key_label;
		public Gtk.Label zoom_reset_key_label;
		public Gtk.SpinButton font_size_spinbutton;
		public ScrolledWindow scrolledwindow;
		public Widgets.CheckButton cursor_blink_checkbutton;
		public Widgets.CheckButton scroll_on_key_checkbutton;
		public Widgets.CheckButton scroll_on_out_checkbutton;
		public Widgets.ConfigWindow parent_window;
		public Widgets.CursorToggleButton cursor_style_button;
		public Widgets.ProgressBar opacity_progressbar;
        public Widgets.PreferenceSlidebar slidebar;
		public double timer_end_value;
		public double timer_start_value;
        public AnimateTimer timer;
        public Gtk.Box content_box;
        public Gtk.Widget focus_widget;
        public bool in_animation = false;
        public int checkbutton_margin_right = 5;
        public int checkbutton_margin_top = 4;
        public int first_segment_margin_left = 20;
        public int grid_height = 24;
        public int option_widget_margin_end = 5;
        public int option_widget_margin_left = 40;
        public int option_widget_margin_right = 10;
        public int option_widget_margin_top = 5;
        public int preference_name_width = 180;
        public int preference_split_line_margin_left = 2;
        public int preference_widget_width = Constant.PREFERENCE_WIDGET_WIDTH;
        public int reset_button_margin = 35;
        public int second_segment_margin_left = 30;
        public int segment_margin_bottom = 5;
        public int segment_margin_top = 10;
        public int slidebar_width = Constant.PREFERENCE_SLIDEBAR_WIDTH;
        public int timer_interval = 400;

        public Preference(Widgets.ConfigWindow window, Gtk.Widget widget) {
            Intl.bindtextdomain(GETTEXT_PACKAGE, "/usr/share/locale");
            
            window_init_width = 720;
            window_init_height = 670;
        
			theme_label = create_label();
            opacity_label = create_label("%s:".printf(_("Opacity")));
            opacity_progressbar = new Widgets.ProgressBar(opacity);
			font_label = create_label();
			font_combox = create_combox_text();
			window_label = create_label();
			window_combox = create_combox_text();
			
			copy_key_label = create_label();
			copy_key_entry = create_entry();
			paste_key_label = create_label();
			paste_key_entry = create_entry();
			open_key_label = create_label();
			open_key_entry = create_entry();
			search_key_label = create_label();
			search_key_entry = create_entry();
			zoom_in_key_label = create_label();
			zoom_in_key_entry = create_entry();
			zoom_out_key_label = create_label();
			zoom_out_key_entry = create_entry();
			zoom_reset_key_label = create_label();
			zoom_reset_key_entry = create_entry();
			select_all_key_label = create_label();
			select_all_key_entry = create_entry();
			new_workspace_key_label = create_label();
			new_workspace_key_entry = create_entry();
			close_workspace_key_label = create_label();
			close_workspace_key_entry = create_entry();
			previous_workspace_key_label = create_label();
			previous_workspace_key_entry = create_entry();
			next_workspace_key_label = create_label();
			next_workspace_key_entry = create_entry();
			split_vertically_key_label = create_label();
			split_vertically_key_entry = create_entry();
			split_horizontally_key_label = create_label();
			split_horizontally_key_entry = create_entry();
			select_up_window_key_label = create_label();
			select_up_window_key_entry = create_entry();
			select_down_window_key_label = create_label();
			select_down_window_key_entry = create_entry();
			select_left_window_key_label = create_label();
			select_left_window_key_entry = create_entry();
			select_right_window_key_label = create_label();
			select_right_window_key_entry = create_entry();
			close_window_key_label = create_label();
			close_window_key_entry = create_entry();
			close_other_windows_key_label = create_label();
			close_other_windows_key_entry = create_entry();
			fullscreen_key_label = create_label();
			fullscreen_key_entry = create_entry();
			display_hotkey_terminal_key_label = create_label();
			display_hotkey_terminal_key_entry = create_entry();
			show_remote_manage_key_label = create_label();
			show_remote_manage_key_entry = create_entry();
			
            cursor_style_label = create_label("%s:".printf(_("Cursor style")));
			cursor_style_button = new Widgets.CursorToggleButton();
			cursor_blink_checkbutton = create_checkbutton();
			scroll_on_key_checkbutton = create_checkbutton();
			scroll_on_out_checkbutton = create_checkbutton();
			
			font_size_spinbutton = create_spinbutton(Constant.FONT_MIN_SIZE, Constant.FONT_MAX_SIZE, 1);
			// scroll_line_spinbutton = create_spinbutton(0, Constant.MAX_SCROLL_LINES, 1);
			
            parent_window = window;
            
            focus_widget = widget;
            
            var titlebar = new Titlebar();
            titlebar.close_button.button_release_event.connect((b) => {
                    this.destroy();
                    
                    return false;
                });
            
            var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            box.pack_start(titlebar, false, false, 0);
            
            destroy.connect((w) => {
                    if (focus_widget != null) {
                        focus_widget.grab_focus();
                    }
                });
            
            var preference_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
            add_widget(preference_box);
            
            slidebar = new PreferenceSlidebar();
			preference_box.pack_start(slidebar, false, false, 0);
            preference_box.set_size_request(slidebar_width, -1);
			
            scrolledwindow = new ScrolledWindow(null, null);
            scrolledwindow.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
            scrolledwindow.set_shadow_type(Gtk.ShadowType.NONE);
            scrolledwindow.get_style_context().add_class("scrolledwindow");
            scrolledwindow.get_vscrollbar().get_style_context().add_class("light_scrollbar");
            box.pack_start(scrolledwindow, true, true, 0);
            
            preference_box.pack_start(box, true, true, 0);
            content_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            scrolledwindow.add(content_box);
			
            var basic_segment = get_first_segment(_("Basic"));
            content_box.pack_start(basic_segment, false, false, 0);

            var theme_segment = get_second_segment(_("Interface"));
            content_box.pack_start(theme_segment, false, false, 0);
            
            var theme_grid = new Gtk.Grid();
            content_box.pack_start(theme_grid, false, false, 0);
            
            var opacity_grid = new Gtk.Grid();
            content_box.pack_start(opacity_grid, false, false, 0);
            
			double opacity = 0;
			try {
				opacity = parent_window.config.config_file.get_double("general", "opacity");
			} catch (GLib.KeyFileError e) {
				print("Preference get window config: %s\n", e.message);
			}
			
			opacity_progressbar.set_percent(opacity);
			opacity_progressbar.update.connect((w, percent) => {
					parent_window.config.config_file.set_double("general", "opacity", percent);
					parent_window.config.save();
					
					parent_window.config.update();
				});
			adjust_option_widgets(opacity_label, opacity_progressbar);
            grid_attach(opacity_grid, opacity_label, 0, 0, preference_name_width, grid_height);
            grid_attach_next_to(opacity_grid, opacity_progressbar, opacity_label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
            
            var font_grid = new Gtk.Grid();
            content_box.pack_start(font_grid, false, false, 0);
            
			int num;
			string[] mono_or_dot_fonts = (string[]) list_mono_fonts_ambiguously(out num);
			font_names = new ArrayList<string>();
			for (int i = 0; i < num; i++) {
				font_names.add(mono_or_dot_fonts[i]);
			}
			font_names.sort();
			
            create_combox_row(font_label, font_combox, "%s:".printf(_("Font")), font_grid, font_names, "general", "font");
            
            create_follow_spinbutton_row(font_size_spinbutton, "%s:".printf(_("Font size")), font_label, font_grid, "general", "font_size");
            
            var hotkey_segment = get_first_segment(_("Shortcuts"));
            content_box.pack_start(hotkey_segment, false, false, 0);
            
            var terminal_key_segment = get_second_segment(_("Terminal"));
            content_box.pack_start(terminal_key_segment, false, false, 0);
            
            var terminal_key_grid = new Gtk.Grid();
            content_box.pack_start(terminal_key_grid, false, false, 0);
            
            create_key_row(copy_key_label, copy_key_entry, "%s:".printf(_("Copy")), terminal_key_grid, "shortcut", "copy");
            create_follow_key_row(paste_key_label, paste_key_entry, "%s:".printf(_("Paste")), copy_key_label, terminal_key_grid, "shortcut", "paste");
            create_follow_key_row(open_key_label, open_key_entry, "%s:".printf(_("Open")), paste_key_label, terminal_key_grid, "shortcut", "open");
			create_follow_key_row(search_key_label, search_key_entry, "%s:".printf(_("Search")), open_key_label, terminal_key_grid, "shortcut", "search");
            create_follow_key_row(zoom_in_key_label, zoom_in_key_entry, "%s:".printf(_("Zoom in")), search_key_label, terminal_key_grid, "shortcut", "zoom_in");
            create_follow_key_row(zoom_out_key_label, zoom_out_key_entry, "%s:".printf(_("Zoom out")), zoom_in_key_label, terminal_key_grid, "shortcut", "zoom_out");
            create_follow_key_row(zoom_reset_key_label, zoom_reset_key_entry, "%s:".printf(_("Default size")), zoom_out_key_label, terminal_key_grid, "shortcut", "default_size");
            create_follow_key_row(select_all_key_label, select_all_key_entry, "%s:".printf(_("Select all")), zoom_reset_key_label, terminal_key_grid, "shortcut", "select_all");
            
            var workspace_key_segment = get_second_segment(_("Workspace"));
            content_box.pack_start(workspace_key_segment, false, false, 0);
            
            var workspace_key_grid = new Gtk.Grid();
            content_box.pack_start(workspace_key_grid, false, false, 0);
            
            create_key_row(new_workspace_key_label, new_workspace_key_entry, "%s:".printf(_("New workspace")), workspace_key_grid, "shortcut", "new_workspace");
            create_follow_key_row(close_workspace_key_label, close_workspace_key_entry, "%s:".printf(_("Close workspace")), new_workspace_key_label, workspace_key_grid, "shortcut", "close_workspace");
            create_follow_key_row(previous_workspace_key_label, previous_workspace_key_entry, "%s:".printf(_("Previous workspace")), close_workspace_key_label, workspace_key_grid, "shortcut", "previous_workspace");
            create_follow_key_row(next_workspace_key_label, next_workspace_key_entry, "%s:".printf(_("Next workspace")), previous_workspace_key_label, workspace_key_grid, "shortcut", "next_workspace");
            create_follow_key_row(split_vertically_key_label, split_vertically_key_entry, "%s:".printf(_("Vertical split")), next_workspace_key_label, workspace_key_grid, "shortcut", "vertical_split");
            create_follow_key_row(split_horizontally_key_label, split_horizontally_key_entry, "%s:".printf(_("Horizontal split")), split_vertically_key_label, workspace_key_grid, "shortcut", "horizontal_split");
            create_follow_key_row(select_up_window_key_label, select_up_window_key_entry, "%s:".printf(_("Select upper window")), split_horizontally_key_label, workspace_key_grid, "shortcut", "select_upper_window");
            create_follow_key_row(select_down_window_key_label, select_down_window_key_entry, "%s:".printf(_("Select lower window")), select_up_window_key_label, workspace_key_grid, "shortcut", "select_lower_window");
            create_follow_key_row(select_left_window_key_label, select_left_window_key_entry, "%s:".printf(_("Select left window")), select_down_window_key_label, workspace_key_grid, "shortcut", "select_left_window");
            create_follow_key_row(select_right_window_key_label, select_right_window_key_entry, "%s:".printf(_("Select right window")), select_left_window_key_label, workspace_key_grid, "shortcut", "select_right_window");
            create_follow_key_row(close_window_key_label, close_window_key_entry, "%s:".printf(_("Close window")), select_right_window_key_label, workspace_key_grid, "shortcut", "close_window");
            create_follow_key_row(close_other_windows_key_label, close_other_windows_key_entry, "%s:".printf(_("Close other windows")), close_window_key_label, workspace_key_grid, "shortcut", "close_other_windows");
            
            var advanced_key_segment = get_second_segment(_("Advanced"));
            content_box.pack_start(advanced_key_segment, false, false, 0);
            
            var advanced_key_grid = new Gtk.Grid();
            content_box.pack_start(advanced_key_grid, false, false, 0);
            
            create_key_row(fullscreen_key_label, fullscreen_key_entry, "%s:".printf(_("Fullscreen")), advanced_key_grid, "shortcut", "switch_fullscreen");
            create_follow_key_row(display_hotkey_terminal_key_label, display_hotkey_terminal_key_entry, "%s:".printf(_("Display shortcuts")), fullscreen_key_label, advanced_key_grid, "shortcut", "display_shortcuts");
            create_follow_key_row(show_remote_manage_key_label, show_remote_manage_key_entry, "%s:".printf(_("Remote management")), display_hotkey_terminal_key_label, advanced_key_grid, "shortcut", "remote_management");
            
            var advanced_segment = get_first_segment(_("Advanced"));
            content_box.pack_start(advanced_segment, false, false, 0);
            
            var cursor_segment = get_second_segment(_("Cursor"));
            content_box.pack_start(cursor_segment, false, false, 0);
            
            var cursor_grid = new Gtk.Grid();
            content_box.pack_start(cursor_grid, false, false, 0);
            
            
			try {
				cursor_style_button.set_cursor_state(parent_window.config.config_file.get_string("advanced", "cursor_shape"));
			} catch (GLib.KeyFileError e) {
				print("Preference set cursor shape: %s\n", e.message);
			}
			cursor_style_button.change_cursor_state.connect((w, active_state) => {
					parent_window.config.config_file.set_string("advanced", "cursor_shape", active_state);
					parent_window.config.save();
					
					parent_window.config.update();
				});
			adjust_option_widgets(cursor_style_label, cursor_style_button);
            grid_attach(cursor_grid, cursor_style_label, 0, 0, preference_name_width, grid_height);
            grid_attach_next_to(cursor_grid, cursor_style_button, cursor_style_label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
            
            create_follow_check_row(cursor_blink_checkbutton, _("Cursor blink"), cursor_style_label, cursor_grid, "advanced", "cursor_blink_mode");
            
            var scroll_segment = get_second_segment(_("Scroll"));
            content_box.pack_start(scroll_segment, false, false, 0);
            
            var scroll_grid = new Gtk.Grid();
            content_box.pack_start(scroll_grid, false, false, 0);
            
            var scroll_on_key_box = create_check_row(scroll_on_key_checkbutton, _("Scroll on keystroke"), scroll_grid, "advanced", "scroll_on_key");
            create_follow_check_row(scroll_on_out_checkbutton, _("Scroll on output"), scroll_on_key_box, scroll_grid, "advanced", "scroll_on_output");
            
            // create_follow_spinbutton_row(scroll_line_spinbutton, "%s:".printf(_("Scroll lines")), scroll_on_output_box, scroll_grid, "advanced", "scroll_line");
            
            var window_segment = get_second_segment(_("Window"));
            content_box.pack_start(window_segment, false, false, 0);
            
            var window_grid = new Gtk.Grid();
            content_box.pack_start(window_grid, false, false, 0);
            
            window_state_list = new ArrayList<string>();
            window_state_list.add("window");
            window_state_list.add("maximize");
            window_state_list.add("fullscreen");
            window_state_name_list = new ArrayList<string>();
            window_state_name_list.add(_("Normal window"));
            window_state_name_list.add(_("Maximize"));
            window_state_name_list.add(_("Fullscreen"));
            create_combox_row_with_name(window_label, window_combox, _("Use on starting"), window_grid, window_state_list, window_state_name_list, "advanced", "use_on_starting");
            
            var reset_button = new Widgets.ImageButton("reset_button", false, _("Restore default settings"));
            reset_button.set_halign(Gtk.Align.CENTER);
            reset_button.margin_top = reset_button_margin;
            reset_button.margin_bottom = reset_button_margin;
			reset_button.button_release_event.connect((w, e) => {
					parent_window.config.init_config();
					parent_window.config.update();
			
					init_config();
					
					return false;
				});
            content_box.pack_start(reset_button, false, false, 0);
            
			timer = new AnimateTimer(AnimateTimer.ease_in_out, timer_interval);
			timer.animate.connect(on_animate);
			slidebar.click_item.connect((w, item) => {
					if (item == "basic") {
						scroll_to_widget(scrolledwindow, box, basic_segment);
					} else if (item == "theme") {
						scroll_to_widget(scrolledwindow, box, theme_segment);
					} else if (item == "hotkey") {
						scroll_to_widget(scrolledwindow, box, hotkey_segment);
					} else if (item == "terminal_key") {
						scroll_to_widget(scrolledwindow, box, terminal_key_segment);
					} else if (item == "workspace_key") {
						scroll_to_widget(scrolledwindow, box, workspace_key_segment);
					} else if (item == "advanced_key") {
						scroll_to_widget(scrolledwindow, box, advanced_key_segment);
					} else if (item == "advanced") {
						scroll_to_widget(scrolledwindow, box, advanced_segment);
					} else if (item == "cursor") {
						scroll_to_widget(scrolledwindow, box, cursor_segment);
					} else if (item == "scroll") {
						scroll_to_widget(scrolledwindow, box, scroll_segment);
					} else if (item == "window") {
						scroll_to_widget(scrolledwindow, box, window_segment);
					}
				});
            
            scrolledwindow.get_vadjustment().value_changed.connect((w) => {
                    if (!in_animation) {
                        if (item_in_visible_area(basic_segment)) {
                            slidebar.focus_item(slidebar.basic_segment);
                        } else if (item_in_visible_area(theme_segment)) {
                            slidebar.focus_item(slidebar.theme_segment);
                        } else if (item_in_visible_area(hotkey_segment)) {
                            slidebar.focus_item(slidebar.hotkey_segment);
                        } else if (item_in_visible_area(terminal_key_segment)) {
                            slidebar.focus_item(slidebar.terminal_key_segment);
                        } else if (item_in_visible_area(workspace_key_segment)) {
                            slidebar.focus_item(slidebar.workspace_key_segment);
                        } else if (item_in_visible_area(advanced_key_segment)) {
                            slidebar.focus_item(slidebar.advanced_key_segment);
                        } else if (item_in_visible_area(advanced_segment)) {
                            slidebar.focus_item(slidebar.advanced_segment);
                        } else if (item_in_visible_area(cursor_segment)) {
                            slidebar.focus_item(slidebar.cursor_segment);
                        } else if (item_in_visible_area(scroll_segment)) {
                            slidebar.focus_item(slidebar.scroll_segment);
                        } else if (item_in_visible_area(window_segment)) {
                            slidebar.focus_item(slidebar.window_segment);
                        }
                    }
                });
        }
		
		public void init_config() {
			try {
				opacity_progressbar.set_percent(parent_window.config.config_file.get_double("general", "opacity"));
				font_combox.set_active(font_names.index_of(parent_window.config.config_file.get_value("general", "font")));
				window_combox.set_active(window_state_list.index_of(parent_window.config.config_file.get_value("advanced", "use_on_starting")));
		    
				copy_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "copy"));
				paste_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "paste"));
				open_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "open"));
				search_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "search"));
				zoom_in_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "zoom_in"));
				zoom_out_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "zoom_out"));
				zoom_reset_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "default_size"));
				select_all_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "select_all"));
				new_workspace_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "new_workspace"));
				close_workspace_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "close_workspace"));
				previous_workspace_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "previous_workspace"));
				next_workspace_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "next_workspace"));
				split_vertically_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "vertical_split"));
				split_horizontally_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "horizontal_split"));
				select_up_window_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "select_upper_window"));
				select_down_window_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "select_lower_window"));
				select_left_window_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "select_left_window"));
				select_right_window_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "select_right_window"));
				close_window_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "close_window"));
				close_other_windows_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "close_other_windows"));
				fullscreen_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "switch_fullscreen"));
				display_hotkey_terminal_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "display_shortcuts"));
				show_remote_manage_key_entry.set_text(parent_window.config.config_file.get_string("shortcut", "remote_management"));
		    
				cursor_style_button.set_cursor_state(parent_window.config.config_file.get_string("advanced", "cursor_shape"));;
		    
				cursor_blink_checkbutton.set_active(parent_window.config.config_file.get_boolean("advanced", "cursor_blink_mode"));
				scroll_on_key_checkbutton.set_active(parent_window.config.config_file.get_boolean("advanced", "scroll_on_key"));
				scroll_on_out_checkbutton.set_active(parent_window.config.config_file.get_boolean("advanced", "scroll_on_output"));
		    
				font_size_spinbutton.set_value(parent_window.config.config_file.get_integer("general", "font_size"));
				// scroll_line_spinbutton.set_value(parent_window.config.config_file.get_integer("advanced", "scroll_line"));
			} catch (GLib.KeyFileError e) {
				print("Preference init_config: %s\n", e.message);
			}
			
		}
		
        public bool item_in_visible_area(Gtk.Widget item) {
			int widget_x, widget_y;
            content_box.translate_coordinates(item, 0, 0, out widget_x, out widget_y);
            
            return Math.fabs(widget_y) > scrolledwindow.get_vadjustment().get_value() - segment_margin_top * 2;
        }
        
        public void scroll_to_widget(ScrolledWindow scrolledwindow, Gtk.Box box, Gtk.Widget widget) {
			int widget_x, widget_y;
			content_box.translate_coordinates(widget, 0, 0, out widget_x, out widget_y);
			
            var adjust = scrolledwindow.get_vadjustment();
			timer_start_value= adjust.get_value();
            timer_end_value = Math.fabs(widget_y);
			
            in_animation = true;
			timer.reset();
		}
		
		public void on_animate(double progress) {
			var adjust = scrolledwindow.get_vadjustment();
			adjust.set_value(timer_start_value + (timer_end_value - timer_start_value) * progress);
			
			if (progress >= 1.0) {
				timer.stop();
                in_animation = false;
			}
		}
		
		public Gtk.Widget get_first_segment(string name) {
            var segment = create_label();
            segment.get_style_context().add_class("preference_first_segment");
            segment.set_text(name);
            segment.set_xalign(0);
            
            var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
            box.pack_start(segment, false, false, 0);
            
            var line = new Gtk.EventBox();
            line.margin_start = preference_split_line_margin_left;
            line.draw.connect((w, cr) => {
                    Gtk.Allocation rect;
                    this.get_allocation(out rect);
            
                    cr.set_source_rgba(0, 0, 0, 0.1);
                    Draw.draw_rectangle(cr, 0, 12, rect.width, 1);
            
                    return true;
                });
            box.pack_start(line, true, true, 0);
            
            box.margin_top = segment_margin_top;
            box.margin_bottom = segment_margin_bottom;
            box.margin_start = first_segment_margin_left;

            return (Gtk.Widget) box;
        }

        public Gtk.Widget get_second_segment(string name) {
            var segment = create_label();
            segment.get_style_context().add_class("preference_second_segment");
            segment.set_text(name);
            segment.set_xalign(0);
            segment.margin_top = segment_margin_top;
            segment.margin_bottom = segment_margin_bottom;
            segment.margin_start = second_segment_margin_left;

            return (Gtk.Widget) segment;
        }
        
        public void create_key_row(Gtk.Label label, Gtk.Entry entry, string name, Gtk.Grid grid, string? group_name=null, string? key=null) {
			label.set_text(name);

			monitor_check_key(entry, group_name, key);
			
            adjust_option_widgets(label, entry);
            grid_attach(grid, label, 0, 0, preference_name_width, grid_height);
            grid_attach_next_to(grid, entry, label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
		}
        
        public void create_follow_key_row(Gtk.Label label, Gtk.Entry entry, string name, Gtk.Label previous_label, Gtk.Grid grid, string? group_name=null, string? key=null) {
			label.set_text(name);
            
			monitor_check_key(entry, group_name, key);
			
            adjust_option_widgets(label, entry);
            grid_attach_next_to(grid, label, previous_label, Gtk.PositionType.BOTTOM, preference_name_width, grid_height);
            grid_attach_next_to(grid, entry, label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
		}
		
		public void monitor_check_key(Gtk.Entry entry, string group_name, string key) {
			entry.placeholder_text = _("Please enter a new shortcut");
			entry.editable = false;
			entry.key_press_event.connect((w, e) => {
					string keyname = Keymap.get_keyevent_name(e);
					
                    string new_key = "";
					if (keyname == "Backspace") {
						entry.set_text("");
					} else if (keyname.has_prefix("F") || keyname.contains("+")) {
						entry.set_text(keyname);
                        new_key = keyname;
					} else {
						return false;
					}
					
					parent_window.config.config_file.set_string(group_name, key, new_key);
					parent_window.config.save();
					
					parent_window.config.update();
					
					return false;
				});
			
			if (group_name != null && key != null) {
				try {
					entry.set_text(parent_window.config.config_file.get_string(group_name, key));
				} catch (GLib.KeyFileError e) {
					print("Preference monitor_check_key: %s\n", e.message);
				}
			}
		}
        
        public void create_combox_row(Gtk.Label label, Gtk.ComboBoxText combox, string name, Gtk.Grid grid, ArrayList<string>? values=null, string? group_name=null, string? key=null) {
			label.set_text(name);
			if (values != null) {
                foreach (string value in values) {
                    combox.append(value, value);
                }
                
                try {
                    combox.set_active(values.index_of(parent_window.config.config_file.get_value(group_name, key)));
                } catch (GLib.KeyFileError e) {
                    print("create_combox_row error: %s\n".printf(e.message));
                }
                
                combox.changed.connect((w) => {
                        parent_window.config.config_file.set_string(group_name, key, values[combox.get_active()]);
                        parent_window.config.save();
						
						parent_window.config.update();
                    });
            }
            adjust_option_widgets(label, combox);
            grid_attach(grid, label, 0, 0, preference_name_width, grid_height);
            grid_attach_next_to(grid, combox, label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
		}

        public void create_combox_row_with_name(Gtk.Label label, Gtk.ComboBoxText combox, string name, Gtk.Grid grid, ArrayList<string>? values=null, ArrayList<string>? names=null, string? group_name=null, string? key=null) {
			label.set_text(name);
			if (values != null) {
                int index = 0;
                foreach (string value in values) {
                    combox.append(value, names[index]);
                    index++;
                }
                
                try {
                    combox.set_active(values.index_of(parent_window.config.config_file.get_value(group_name, key)));
                } catch (GLib.KeyFileError e) {
                    print("create_combox_row error: %s\n".printf(e.message));
                }
                
                combox.changed.connect((w) => {
                        parent_window.config.config_file.set_string(group_name, key, values[combox.get_active()]);
                        parent_window.config.save();
						
						parent_window.config.update();
                    });
            }
            adjust_option_widgets(label, combox);
            grid_attach(grid, label, 0, 0, preference_name_width, grid_height);
            grid_attach_next_to(grid, combox, label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
		}

        public void adjust_option_widgets(Gtk.Label name_widget, Gtk.Widget value_widget) {
            name_widget.set_xalign(0);
            name_widget.set_size_request(preference_name_width, grid_height);
            name_widget.margin_start = option_widget_margin_left;
            
            value_widget.set_size_request(preference_widget_width, grid_height);
            value_widget.margin_end = option_widget_margin_right;
        }
        
        public Gtk.Box create_check_row(Widgets.CheckButton checkbutton, string name, Gtk.Grid grid, string? group_name=null, string? key=null) {
            var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
            var label = create_label(name);
            adjust_option_checkbutton(label, checkbutton);

            read_check_value(checkbutton, group_name, key);
            
            box.pack_start(checkbutton, false, false, 0);
            box.pack_start(label, false, false, 0);
            grid_attach(grid, box, 0, 0, preference_name_width, grid_height);
            
            return box;
        }
        
        public Gtk.Box create_follow_check_row(Widgets.CheckButton checkbutton, string name, Gtk.Widget previous_widget, Gtk.Grid grid, string? group_name=null, string? key=null) {
            var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
			var label = create_label(name);
            adjust_option_checkbutton(label, checkbutton);
            
            read_check_value(checkbutton, group_name, key);
            
            box.pack_start(checkbutton, false, false, 0);
            box.pack_start(label, false, false, 0);
            grid_attach_next_to(grid, box, previous_widget, Gtk.PositionType.BOTTOM, preference_name_width, grid_height);
            
            return box;
        }
        
        public void read_check_value(Widgets.CheckButton checkbutton, string group_name, string key) {
            if (group_name != null && key != null) {
                try {
                    checkbutton.set_active(parent_window.config.config_file.get_boolean(group_name, key));
                } catch (GLib.KeyFileError e) {
                    print("create_follow_check_row error: %s\n".printf(e.message));
                }
                
                monitor_check_value(checkbutton, group_name, key);
            }
        }
        
        public Gtk.Label create_follow_spinbutton_row(Gtk.SpinButton spinbutton, string name, Gtk.Widget previous_widget, Gtk.Grid grid, string? group_name=null, string? key=null) {
            var label = create_label(name);
            adjust_option_widgets(label, spinbutton);
            
            read_spin_value(spinbutton, group_name, key);
            
            grid_attach_next_to(grid, label, previous_widget, Gtk.PositionType.BOTTOM, preference_name_width, grid_height);
            grid_attach_next_to(grid, spinbutton, label, Gtk.PositionType.RIGHT, preference_widget_width, grid_height);
            
            return label;
        }
        
        public void read_spin_value(Gtk.SpinButton spinbutton, string group_name, string key) {
            if (group_name != null && key != null) {
                try {
                    spinbutton.set_value(parent_window.config.config_file.get_integer(group_name, key));
                } catch (GLib.KeyFileError e) {
                    print("read_spin_value error: %s\n".printf(e.message));
                }
                
                monitor_spin_value(spinbutton, group_name, key);
            }
        }
        
        public void monitor_check_value(Widgets.CheckButton checkbutton, string group_name, string key) {
            checkbutton.toggled.connect((w) => {
                    var is_active = checkbutton.get_active();
                    
                    parent_window.config.config_file.set_boolean(group_name, key, is_active);
                    parent_window.config.save();
                    
                    parent_window.config.update();
                });
        }

        public void monitor_spin_value(Gtk.SpinButton spinbutton, string group_name, string key) {
            spinbutton.value_changed.connect((w) => {
                    var spin_value = spinbutton.get_value();
                    
                    parent_window.config.config_file.set_integer(group_name, key, (int) spin_value);
                    parent_window.config.save();
                    
                    parent_window.config.update();
                });
        }
        
        public void adjust_option_checkbutton(Gtk.Label label, Widgets.CheckButton checkbutton) {
            checkbutton.margin_start = option_widget_margin_left;
            checkbutton.margin_top = checkbutton_margin_top;
            checkbutton.margin_end = checkbutton_margin_right;
        }
        
        public Gtk.Entry create_entry() {
            var entry = new Gtk.Entry();
            entry.get_style_context().add_class("preference_entry");
            
            return entry;
        }
        
        public Gtk.ComboBoxText create_combox_text() {
            var combox = new Gtk.ComboBoxText();
            combox.get_style_context().add_class("preference_comboboxtext");
            
            return combox;
        }
        
        public Gtk.SpinButton create_spinbutton(int min, int max, int step) {
            var spinbutton = new Gtk.SpinButton.with_range(min, max, step);
            spinbutton.get_style_context().add_class("preference_spinbutton");
            
            return spinbutton;
        }

        public Widgets.CheckButton create_checkbutton() {
            var checkbutton = new Widgets.CheckButton();
            
            return checkbutton;
        }
        
        public Gtk.Label create_label(string? text=null) {
            var label = new Gtk.Label(text);
            label.get_style_context().add_class("preference_label");
            
            return label;
        }
        
        public void grid_attach(Gtk.Grid grid, Gtk.Widget child, int left, int top, int width, int height) {
            child.margin_top = option_widget_margin_top;
            child.margin_bottom = option_widget_margin_end;
            grid.attach(child, left, top, width, height);
        }
        
        public void grid_attach_next_to(Gtk.Grid grid, Gtk.Widget child, Gtk.Widget sibling, Gtk.PositionType side, int width, int height) {
            child.margin_top = option_widget_margin_top;
            child.margin_bottom = option_widget_margin_end;
            grid.attach_next_to(child, sibling, side, width, height);
        }
    }
}
