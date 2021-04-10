Content-Type: multipart/mixed; boundary="===============8906221446967033473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tty/vt/vt.c:1210 vc_do_resize() warn: impossible condition '(new_screen_size > (1 << (17 + 16 - 1))) => (0-u32max > 4294967296)'
Date: Sun, 11 Apr 2021 01:26:55 +0800
Message-ID: <202104110150.aFIAALuA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8906221446967033473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Pitre <nico@fluxnic.net>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d4961772226de3b48a395a26c076d450d7044c76
commit: 2717769e204e83e65b8819c5e2ef3e5b6639b270 vt: don't hardcode the mem=
 allocation upper bound
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: ia64-randconfig-m031-20210410 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/vt/vt.c:1210 vc_do_resize() warn: impossible condition '(new_sc=
reen_size > (1 << (17 + 16 - 1))) =3D> (0-u32max > 4294967296)'

Old smatch warnings:
drivers/tty/vt/vt.c:1817 cursor_report() warn: format string contains unusu=
al character '\x1b'
drivers/tty/vt/vt.c:1835 mouse_report() warn: format string contains unusua=
l character '\x1b'

vim +1210 drivers/tty/vt/vt.c

8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1163  =

8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1164  /**
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1165   *=
	vc_do_resize	-	resizing method for the tty
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1166   *=
	@tty: tty being resized
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1167   *=
	@real_tty: real tty (different to tty if a pty/tty pair)
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1168   *=
	@vc: virtual console private data
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1169   *=
	@cols: columns
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1170   *=
	@lines: lines
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1171   *
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1172   *=
	Resize a virtual console, clipping according to the actual constraints.
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1173   *=
	If the caller passes a tty structure then update the termios winsize
3ad2f3fbb96142 drivers/char/vt.c   Daniel Mack         2010-02-03  1174   *=
	information and perform any necessary signal handling.
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1175   *
6a1c0680cf3ba9 drivers/tty/vt/vt.c Peter Hurley        2013-06-15  1176   *=
	Caller must hold the console semaphore. Takes the termios rwsem and
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1177   *=
	ctrl_lock of the tty IFF a tty is passed.
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1178   */
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1179  =

fc6f6238226e6d drivers/char/vt.c   Alan Cox            2009-01-02  1180  st=
atic int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
fc6f6238226e6d drivers/char/vt.c   Alan Cox            2009-01-02  1181  		=
		unsigned int cols, unsigned int lines)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1182  {
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1183  	u=
nsigned long old_origin, new_origin, new_scr_end, rlth, rrem, err =3D 0;
9e0ba741aabdf1 drivers/char/vt.c   qiaochong           2010-08-09  1184  	u=
nsigned long end;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1185  	u=
nsigned int old_rows, old_row_size, first_copied_row;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1186  	u=
nsigned int new_cols, new_rows, new_row_size, new_screen_size;
9e0ba741aabdf1 drivers/char/vt.c   qiaochong           2010-08-09  1187  	u=
nsigned int user;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1188  	u=
nsigned short *newscreen;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1189  	s=
truct uni_screen *new_uniscr =3D NULL;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1190  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1191  	W=
ARN_CONSOLE_UNLOCKED();
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1192  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1193  	i=
f (!vc)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1194  		=
return -ENXIO;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1195  =

e400b6ec4ede4d drivers/char/vt.c   Antonino A. Daplas  2007-10-16  1196  	u=
ser =3D vc->vc_resize_user;
e400b6ec4ede4d drivers/char/vt.c   Antonino A. Daplas  2007-10-16  1197  	v=
c->vc_resize_user =3D 0;
e400b6ec4ede4d drivers/char/vt.c   Antonino A. Daplas  2007-10-16  1198  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1199  	i=
f (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1200  		=
return -EINVAL;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1201  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1202  	n=
ew_cols =3D (cols ? cols : vc->vc_cols);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1203  	n=
ew_rows =3D (lines ? lines : vc->vc_rows);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1204  	n=
ew_row_size =3D new_cols << 1;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1205  	n=
ew_screen_size =3D new_row_size * new_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1206  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1207  	i=
f (new_cols =3D=3D vc->vc_cols && new_rows =3D=3D vc->vc_rows)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1208  		=
return 0;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1209  =

2717769e204e83 drivers/tty/vt/vt.c Nicolas Pitre       2020-03-28 @1210  	i=
f (new_screen_size > KMALLOC_MAX_SIZE)
32b2921e6a7461 drivers/tty/vt/vt.c Dmitry Vyukov       2016-10-14  1211  		=
return -EINVAL;
21eff69aaaa0e7 drivers/tty/vt/vt.c Alexander Potapenko 2018-06-14  1212  	n=
ewscreen =3D kzalloc(new_screen_size, GFP_USER);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1213  	i=
f (!newscreen)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1214  		=
return -ENOMEM;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1215  =

d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1216  	i=
f (get_vc_uniscr(vc)) {
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1217  		=
new_uniscr =3D vc_uniscr_alloc(new_cols, new_rows);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1218  		=
if (!new_uniscr) {
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1219  		=
	kfree(newscreen);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1220  		=
	return -ENOMEM;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1221  		}
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1222  	}
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1223  =

dce05aa6eec977 drivers/tty/vt/vt.c Jiri Slaby          2020-02-19  1224  	i=
f (vc_is_sel(vc))
009e39ae44f419 drivers/tty/vt/vt.c Scot Doyle          2016-10-13  1225  		=
clear_selection();
009e39ae44f419 drivers/tty/vt/vt.c Scot Doyle          2016-10-13  1226  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1227  	o=
ld_rows =3D vc->vc_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1228  	o=
ld_row_size =3D vc->vc_size_row;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1229  =

e400b6ec4ede4d drivers/char/vt.c   Antonino A. Daplas  2007-10-16  1230  	e=
rr =3D resize_screen(vc, new_cols, new_rows, user);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1231  	i=
f (err) {
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1232  		=
kfree(newscreen);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1233  		=
kfree(new_uniscr);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1234  		=
return err;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1235  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1236  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1237  	v=
c->vc_rows =3D new_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1238  	v=
c->vc_cols =3D new_cols;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1239  	v=
c->vc_size_row =3D new_row_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1240  	v=
c->vc_screenbuf_size =3D new_screen_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1241  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1242  	r=
lth =3D min(old_row_size, new_row_size);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1243  	r=
rem =3D new_row_size - rlth;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1244  	o=
ld_origin =3D vc->vc_origin;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1245  	n=
ew_origin =3D (long) newscreen;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1246  	n=
ew_scr_end =3D new_origin + new_screen_size;
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1247  =

3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1248  	i=
f (vc->vc_y > new_rows) {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1249  		=
if (old_rows - vc->vc_y < new_rows) {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1250  		=
	/*
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1251  		=
	 * Cursor near the bottom, copy contents from the
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1252  		=
	 * bottom of buffer
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1253  		=
	 */
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1254  		=
	first_copied_row =3D (old_rows - new_rows);
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1255  		=
} else {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1256  		=
	/*
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1257  		=
	 * Cursor is in no man's land, copy 1/2 screenful
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1258  		=
	 * from the top and bottom of cursor position
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1259  		=
	 */
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1260  		=
	first_copied_row =3D (vc->vc_y - new_rows/2);
9fc2b2d0cf7430 drivers/char/vt.c   Francisco Jerez     2010-08-22  1261  		}
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1262  		=
old_origin +=3D first_copied_row * old_row_size;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1263  	}=
 else
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1264  		=
first_copied_row =3D 0;
9fc2b2d0cf7430 drivers/char/vt.c   Francisco Jerez     2010-08-22  1265  	e=
nd =3D old_origin + old_row_size * min(old_rows, new_rows);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1266  =

d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1267  	v=
c_uniscr_copy_area(new_uniscr, new_cols, new_rows,
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1268  		=
	    get_vc_uniscr(vc), rlth/2, first_copied_row,
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1269  		=
	    min(old_rows, new_rows));
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1270  	v=
c_uniscr_set(vc, new_uniscr);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre       2018-06-26  1271  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1272  	u=
pdate_attr(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1273  =

3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1274  	w=
hile (old_origin < end) {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1275  		=
scr_memcpyw((unsigned short *) new_origin,
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1276  		=
	    (unsigned short *) old_origin, rlth);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1277  		=
if (rrem)
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1278  		=
	scr_memsetw((void *)(new_origin + rlth),
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1279  		=
		    vc->vc_video_erase_char, rrem);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1280  		=
old_origin +=3D old_row_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1281  		=
new_origin +=3D new_row_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1282  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1283  	i=
f (new_scr_end > new_origin)
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1284  		=
scr_memsetw((void *)new_origin, vc->vc_video_erase_char,
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas  2005-09-09  1285  		=
	    new_scr_end - new_origin);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1286  	k=
free(vc->vc_screenbuf);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1287  	v=
c->vc_screenbuf =3D newscreen;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1288  	v=
c->vc_screenbuf_size =3D new_screen_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1289  	s=
et_origin(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1290  =

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1291  	/=
* do part of a reset_terminal() */
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1292  	v=
c->vc_top =3D 0;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1293  	v=
c->vc_bottom =3D vc->vc_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1294  	g=
otoxy(vc, vc->vc_x, vc->vc_y);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1295  	s=
ave_cur(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1296  =

8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1297  	i=
f (tty) {
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1298  		=
/* Rewrite the requested winsize data with the actual
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1299  		=
   resulting sizes */
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox            2008-08-15  1300  		=
struct winsize ws;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1301  		=
memset(&ws, 0, sizeof(ws));
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1302  		=
ws.ws_row =3D vc->vc_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1303  		=
ws.ws_col =3D vc->vc_cols;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1304  		=
ws.ws_ypixel =3D vc->vc_scan_lines;
fc6f6238226e6d drivers/char/vt.c   Alan Cox            2009-01-02  1305  		=
tty_do_resize(tty, &ws);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1306  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1307  =

6ca8dfd78187d8 drivers/tty/vt/vt.c Jiri Slaby          2016-06-23  1308  	i=
f (con_is_visible(vc))
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1309  		=
update_screen(vc);
8b92e87d39bfd0 drivers/char/vt.c   Alan Cox            2009-09-19  1310  	v=
t_event_post(VT_EVENT_RESIZE, vc->vc_num, vc->vc_num);
0c9b1965faddad drivers/tty/vt/vt.c Nicolas Pitre       2019-01-08  1311  	n=
otify_update(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1312  	r=
eturn err;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1313  }
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds      2005-04-16  1314  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8906221446967033473==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8906221446967033473==--

