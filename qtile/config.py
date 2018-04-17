# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
import subprocess
import os

mod = "mod4"
myterm = "urxvt"


last_playing = 'spotify'
def playpause(qtile):
    global last_playing
    if qtile.widgetMap['clementine'].is_playing() or last_playing == 'clementine':
        qtile.cmd_spawn("clementine --play-pause")
        last_playing = 'clementine'
    if qtile.widgetMap['spotify'].is_playing or last_playing == 'spotify':
        qtile.cmd_spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        last_playing = 'spotify'

def next_prev(state):
    def f(qtile):
        if qtile.widgetMap['clementine'].is_playing():
            qtile.cmd_spawn("clementine --%s" % state)
        if qtile.widgetMap['spotify'].is_playing:
            cmd = "Next" if state == "next" else "Previous"
            qtile.cmd_spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.%s" % cmd)
    return f

def init_keys():
    keys = [
            # Switch between windows in current stack pane
            Key([mod], "k", lazy.layout.down()),
            Key([mod], "j", lazy.layout.up()),

            # Move windows up or down in current stack
            Key([mod, "control"], "k", lazy.layout.shuffle_down()),
            Key([mod, "control"], "j", lazy.layout.shuffle_up()),

            Key([mod, "shift"], "l", lazy.layout.grow(), # Grow size of current window (XmonadTall)
                lazy.layout.increase_nmaster(),           # Increase number in master pane (Tile)
                ),
            Key([mod, "shift"], "h", lazy.layout.shrink(),                     # Shrink size of current window (XmonadTall)
                lazy.layout.decrease_nmaster(),           # Decrease number in master pane (Tile)
                ),

            # Switch window focus to other pane(s) of stack
            Key([mod], "space", lazy.layout.next()),

            # Swap panes of split stack
            Key([mod, "shift"], "space", lazy.layout.rotate()),

            # Toggle between split and unsplit sides of stack.
            # Split = all windows displayed
            # Unsplit = 1 window displayed, like Max layout, but still with
            # multiple stack panes
            Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
            Key([mod], "Return", lazy.spawn(myterm)),

            # Toggle between different layouts as defined below
            Key([mod], "Tab", lazy.next_layout()),
            Key([mod], "w", lazy.window.kill()),

            Key([mod, "control"], "r", lazy.restart()),
            Key([mod, "control"], "q", lazy.shutdown()),
            Key([mod], "r", lazy.spawncmd()),

            # Sound
            Key([], "XF86AudioMute",
                lazy.spawn("amixer -q set Master toggle")),
            Key([], "XF86AudioLowerVolume",
                lazy.spawn("amixer -c 0 sset Master 5- unmute")),
            Key([], "XF86AudioRaiseVolume",
                lazy.spawn("amixer -c 0 sset Master 5+ unmute")),

            Key([], "XF86AudioPlay", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")),
            Key([], "XF86AudioNext", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.next")),
            Key([], "XF86AudioPrev", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.prev")),
            ]
    return keys

#groups = [Group(i) for i in "12345678"]

def init_group_names():
    return [(""),
            (""),
            (""),
            (""),
            (""),
            ("")
            ]

def init_groups():
    return [Group(name) for name in group_names]

def init_layout_theme():
    return {"border_width": 2,
            "margin": 3
            }

def init_layouts():
    layouts = [
        layout.Max(**layout_theme),
        layout.Stack(num_stacks=2,**layout_theme),
        layout.xmonad.MonadTall(**layout_theme),
        layout.xmonad.MonadWide(**layout_theme),
        layout.matrix.Matrix(columns=2,**layout_theme),
        layout.TreeTab(**layout_theme)
        ]
    return layouts

keys = init_keys()
group_names = init_group_names()
groups = init_groups()
layout_theme = init_layout_theme()
layouts = init_layouts()

i = 1
for name in group_names :
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))          # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))# Send current window to another group
    i = i+1

widget_defaults = dict(
        font='ttf-droid',
        fontsize=12,
        padding=3,
        )
#extension_defaults = widget_defaults.copy()

screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(),
                    widget.Prompt(),
                    widget.WindowName(),
                    widget.Mpris2(),
                    widget.CurrentLayoutIcon(),
                    #widget.Wlan(),
                    widget.Systray(),
                    widget.TextBox("BAT"),
                    widget.Battery(charge_char="▲", discharge_char="▼", format="{percent:2.0%} {char}"),
                    widget.TextBox("VOL"),
                    widget.Volume(),
                    widget.TextBox("Updates"),
                    widget.Pacman(),
                    widget.Clock(format='%d-%m-%Y %a %H:%M')
                    ],
                24,
                ),
            ),
        ]

# Drag floating layouts.
mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(),
            start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(),
            start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front())
        ]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    ])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


