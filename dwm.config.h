/* See LICENSE file for copyright and license details. */

#include "push.c"
#include <X11/XF86keysym.h>

/* appearance */
static const char *fonts[] = {
	"monospace:size=11"
};
static const char dmenufont[]       = "monospace:size=11";
static const char normbordercolor[] = "#b6b6b3";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#cccccc";
static const char selbordercolor[]  = "#4a90d9";
static const char selbgcolor[]      = "#e8e8e7";
static const char selfgcolor[]      = "#2e3436";
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gap pixel between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       0,            0,           -1 },
	{ "st-256color", NULL,    NULL,       0,            0,           -1 },
	{ "Gnome-mines", NULL,    NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-p", "RUN", "-m", dmenumon, "-fn", dmenufont, "-nb", selbgcolor, "-nf", selfgcolor, "-sb", selbordercolor, "-sf", "#ffffff", NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ Mod1Mask,                     XK_F2,     spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ Mod4Mask,                     XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      pushdown,       {0} },
	{ MODKEY|ShiftMask,             XK_k,      pushup,         {0} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ Mod1Mask,                     XK_F4,     killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_w,      focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_e,      focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_w,      tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_e,      tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      spawn,          SHCMD("dmenu_quit") },
	{ Mod4Mask,                     XK_l,      spawn,          SHCMD("slock") },
	{ Mod1Mask|ControlMask,         XK_l,      spawn,          SHCMD("slock") },
	{ Mod4Mask,                     XK_p,      spawn,          SHCMD("setup-monitors") },
	{ MODKEY,                       XK_r,      spawn,          SHCMD("xdotool mousemove 3200 1800") },
	{ NULL,                         XF86XK_AudioPlay, spawn,   SHCMD("mpc -q toggle") },
	{ NULL,                         XF86XK_AudioNext, spawn,   SHCMD("mpc -q next") },
	{ NULL,                         XF86XK_AudioPrev, spawn,   SHCMD("mpc -q prev") },
	{ NULL,                         XF86XK_AudioMute, spawn,   SHCMD("volctl mute") },
	{ NULL,                         XF86XK_AudioLowerVolume, spawn, SHCMD("volctl -5") },
	{ NULL,                         XF86XK_AudioRaiseVolume, spawn, SHCMD("volctl +5") },
	{ NULL,                         XF86XK_MonBrightnessUp, spawn, SHCMD("brightnessctl set 5%+") },
	{ NULL,                         XF86XK_MonBrightnessDown, spawn, SHCMD("brightnessctl set 5%-") },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkWinTitle,          0,              Button4,        focusstack,     {.i = -1 } },
	{ ClkWinTitle,          0,              Button5,        focusstack,     {.i = +1 } },
	{ ClkStatusText,        0,              Button1,        spawn,          SHCMD("pkill -x dwmstatus; dwmstatus") },
	{ ClkStatusText,        0,              Button2,        spawn,          SHCMD("volctl mute") },
	{ ClkStatusText,        0,              Button4,        spawn,          SHCMD("volctl +5") },
	{ ClkStatusText,        0,              Button5,        spawn,          SHCMD("volctl -5") },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkRootWin,           0,              Button3,        spawn,          SHCMD("rotatebg") },
};

