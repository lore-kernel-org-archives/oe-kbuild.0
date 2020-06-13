Content-Type: multipart/mixed; boundary="===============3344492236993165264=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tty/vt/vt.c:1210:22: warning: comparison is always false due to limited range of data type
Date: Sun, 14 Jun 2020 06:31:40 +0800
Message-ID: <202006140622.23pv73uH%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3344492236993165264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Pitre <nico@fluxnic.net>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Nicolas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f82e7b57b5fc48199e2f26ffafe2f96f7338ad3d
commit: 2717769e204e83e65b8819c5e2ef3e5b6639b270 vt: don't hardcode the mem=
 allocation upper bound
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: ia64-randconfig-r024-20200614 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 2717769e204e83e65b8819c5e2ef3e5b6639b270
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/tty/vt/vt.c: In function 'vc_do_resize':
>> drivers/tty/vt/vt.c:1210:22: warning: comparison is always false due to =
limited range of data type [-Wtype-limits]
1210 |  if (new_screen_size > KMALLOC_MAX_SIZE)
|                      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D2717769e204e83e65b8819c5e2ef3e5b6639b270
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 2717769e204e83e65b8819c5e2ef3e5b6639b270
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

--===============3344492236993165264==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
KbZePCAsw3Bxufpf1qdOwzR2AQA=
--===============3344492236993165264==--

