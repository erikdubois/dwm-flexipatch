#if BAR_STATUS2D_PATCH
int
width_launcher(Bar *bar, BarArg *a)
{
	int i, x = 0;

	for (i = 0; i < LENGTH(launchers); i++) {
		x += status2dtextlength(launchers[i].name) + lrpad / 2 + launcher_padding;
	}
	return x ? x + lrpad / 2 : 0;
}

int
draw_launcher(Bar *bar, BarArg *a)
{
	int i, w = 0;;

	for (i = 0; i < LENGTH(launchers); i++) {
		w = status2dtextlength(launchers[i].name);
		drawstatusbar(a, launchers[i].name);
		a->x += w + lrpad / 2 + launcher_padding;
	}

	return a->x ;
}

int
click_launcher(Bar *bar, Arg *arg, BarArg *a)
{
	int i, x = 0;

	for (i = 0; i < LENGTH(launchers); i++) {
		x += status2dtextlength(launchers[i].name) + lrpad / 2 + launcher_padding;
		if (a->x < x) {
		    spawn(&launchers[i].command);
		    break;
		}
	}
	return -1;
}
#else
int
width_launcher(Bar *bar, BarArg *a)
{
	int i, x = 0;

	for (i = 0; i < LENGTH(launchers); i++) {
		x += TEXTW(launchers[i].name) + launcher_padding;
	}
	return x;
}

int
draw_launcher(Bar *bar, BarArg *a)
{
	int i, x = 0, w = 0;;

	for (i = 0; i < LENGTH(launchers); i++) {
		w = TEXTW(launchers[i].name);
		drw_text(drw, x, 0, w, bh, lrpad / 2, launchers[i].name, 0, True);
		x += w + launcher_padding;
	}

	return x;
}

int
click_launcher(Bar *bar, Arg *arg, BarArg *a)
{
	int i, x = 0;

	for (i = 0; i < LENGTH(launchers); i++) {
		x += TEXTW(launchers[i].name) + launcher_padding;
		if (a->x < x) {
		    spawn(&launchers[i].command);
		    break;
		}
	}
	return -1;
}
#endif // BAR_STATUS2D_PATCH