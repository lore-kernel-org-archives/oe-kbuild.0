Content-Type: multipart/mixed; boundary="===============2401766787013950339=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/touchscreen/elants_i2c.c:966:7: warning: Opposite expression on both sides of '|='. [oppositeExpression]
Date: Mon, 29 Mar 2021 04:41:51 +0800
Message-ID: <202103290433.h2oDpWLz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2401766787013950339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Micha=C5=82 Miros=C5=82aw" <mirq-linux@rere.qmqm.pl>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Dmitry Osipenko <digetx@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0f4498cef9f5cd18d7c6639a2a902ec1edc5be4e
commit: 9517b95bdc4699d94c2ffc6a520bb0ccec396f5b Input: elants_i2c - add su=
pport for eKTF3624
date:   9 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/input/touchscreen/elants_i2c.c:966:7: warning: Opposite expressi=
on on both sides of '|=3D'. [oppositeExpression]
       w |=3D !w;
         ^

vim +966 drivers/input/touchscreen/elants_i2c.c

66aee90088da2f Scott Liu       2014-11-19  921  =

66aee90088da2f Scott Liu       2014-11-19  922  /*
66aee90088da2f Scott Liu       2014-11-19  923   * Event reporting.
66aee90088da2f Scott Liu       2014-11-19  924   */
66aee90088da2f Scott Liu       2014-11-19  925  =

9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  926  static void elant=
s_i2c_mt_event(struct elants_data *ts, u8 *buf,
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  927  				size_t packet=
_size)
66aee90088da2f Scott Liu       2014-11-19  928  {
66aee90088da2f Scott Liu       2014-11-19  929  	struct input_dev *input =
=3D ts->input;
66aee90088da2f Scott Liu       2014-11-19  930  	unsigned int n_fingers;
f27ad8932725f8 Johnny Chuang   2020-04-09  931  	unsigned int tool_type;
66aee90088da2f Scott Liu       2014-11-19  932  	u16 finger_state;
66aee90088da2f Scott Liu       2014-11-19  933  	int i;
66aee90088da2f Scott Liu       2014-11-19  934  =

66aee90088da2f Scott Liu       2014-11-19  935  	n_fingers =3D buf[FW_POS_S=
TATE + 1] & 0x0f;
66aee90088da2f Scott Liu       2014-11-19  936  	finger_state =3D ((buf[FW_=
POS_STATE + 1] & 0x30) << 4) |
66aee90088da2f Scott Liu       2014-11-19  937  			buf[FW_POS_STATE];
66aee90088da2f Scott Liu       2014-11-19  938  =

66aee90088da2f Scott Liu       2014-11-19  939  	dev_dbg(&ts->client->dev,
66aee90088da2f Scott Liu       2014-11-19  940  		"n_fingers: %u, state: %0=
4x\n",  n_fingers, finger_state);
66aee90088da2f Scott Liu       2014-11-19  941  =

f27ad8932725f8 Johnny Chuang   2020-04-09  942  	/* Note: all fingers have =
the same tool type */
f27ad8932725f8 Johnny Chuang   2020-04-09  943  	tool_type =3D buf[FW_POS_T=
OOL_TYPE] & BIT(0) ?
f27ad8932725f8 Johnny Chuang   2020-04-09  944  			MT_TOOL_FINGER : MT_TOOL=
_PALM;
f27ad8932725f8 Johnny Chuang   2020-04-09  945  =

66aee90088da2f Scott Liu       2014-11-19  946  	for (i =3D 0; i < MAX_CONT=
ACT_NUM && n_fingers; i++) {
66aee90088da2f Scott Liu       2014-11-19  947  		if (finger_state & 1) {
66aee90088da2f Scott Liu       2014-11-19  948  			unsigned int x, y, p, w;
66aee90088da2f Scott Liu       2014-11-19  949  			u8 *pos;
66aee90088da2f Scott Liu       2014-11-19  950  =

66aee90088da2f Scott Liu       2014-11-19  951  			pos =3D &buf[FW_POS_XY +=
 i * 3];
66aee90088da2f Scott Liu       2014-11-19  952  			x =3D (((u16)pos[0] & 0x=
f0) << 4) | pos[1];
66aee90088da2f Scott Liu       2014-11-19  953  			y =3D (((u16)pos[0] & 0x=
0f) << 8) | pos[2];
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  954  =

9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  955  			/*
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  956  			 * eKTF3624 ma=
y have use "old" touch-report format,
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  957  			 * depending o=
n a device and TS firmware version.
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  958  			 * For example=
, ASUS Transformer devices use the "old"
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  959  			 * format, whi=
le ASUS Nexus 7 uses the "new" formant.
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  960  			 */
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  961  			if (packet_siz=
e =3D=3D PACKET_SIZE_OLD &&
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  962  			    ts->chip_i=
d =3D=3D EKTF3624) {
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  963  				w =3D buf[FW_=
POS_WIDTH + i / 2];
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  964  				w >>=3D 4 * (=
~i & 1);
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  965  				w |=3D w << 4;
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24 @966  				w |=3D !w;
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  967  				p =3D w;
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  968  			} else {
66aee90088da2f Scott Liu       2014-11-19  969  				p =3D buf[FW_POS_PRESSU=
RE + i];
66aee90088da2f Scott Liu       2014-11-19  970  				w =3D buf[FW_POS_WIDTH =
+ i];
9517b95bdc4699 Micha=C5=82 Miros=C5=82aw 2021-01-24  971  			}
66aee90088da2f Scott Liu       2014-11-19  972  =

66aee90088da2f Scott Liu       2014-11-19  973  			dev_dbg(&ts->client->dev=
, "i=3D%d x=3D%d y=3D%d p=3D%d w=3D%d\n",
66aee90088da2f Scott Liu       2014-11-19  974  				i, x, y, p, w);
66aee90088da2f Scott Liu       2014-11-19  975  =

66aee90088da2f Scott Liu       2014-11-19  976  			input_mt_slot(input, i);
f27ad8932725f8 Johnny Chuang   2020-04-09  977  			input_mt_report_slot_sta=
te(input, tool_type, true);
68334dbab13bc5 Micha=C5=82 Miros=C5=82aw 2020-05-17  978  			touchscreen_re=
port_pos(input, &ts->prop, x, y, true);
66aee90088da2f Scott Liu       2014-11-19  979  			input_event(input, EV_AB=
S, ABS_MT_PRESSURE, p);
66aee90088da2f Scott Liu       2014-11-19  980  			input_event(input, EV_AB=
S, ABS_MT_TOUCH_MAJOR, w);
66aee90088da2f Scott Liu       2014-11-19  981  =

66aee90088da2f Scott Liu       2014-11-19  982  			n_fingers--;
66aee90088da2f Scott Liu       2014-11-19  983  		}
66aee90088da2f Scott Liu       2014-11-19  984  =

66aee90088da2f Scott Liu       2014-11-19  985  		finger_state >>=3D 1;
66aee90088da2f Scott Liu       2014-11-19  986  	}
66aee90088da2f Scott Liu       2014-11-19  987  =

66aee90088da2f Scott Liu       2014-11-19  988  	input_mt_sync_frame(input);
66aee90088da2f Scott Liu       2014-11-19  989  	input_sync(input);
66aee90088da2f Scott Liu       2014-11-19  990  }
66aee90088da2f Scott Liu       2014-11-19  991  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2401766787013950339==--

