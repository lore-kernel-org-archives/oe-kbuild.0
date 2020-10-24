Content-Type: multipart/mixed; boundary="===============4335949596064405341=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/4] input: elants: support old touch report format
Date: Sun, 25 Oct 2020 01:24:47 +0800
Message-ID: <202010250126.8ufkhUTK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4335949596064405341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <6caac5757b8afdb84f0d621844ea2c5b6deb885f.1603543323.git.mirq-=
linux@rere.qmqm.pl>
References: <6caac5757b8afdb84f0d621844ea2c5b6deb885f.1603543323.git.mirq-l=
inux@rere.qmqm.pl>
TO: "Micha=C5=82 Miros=C5=82aw" <mirq-linux@rere.qmqm.pl>
TO: Dmitry Osipenko <digetx@gmail.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
TO: Johnny Chuang <johnny.chuang.emc@gmail.com>
TO: Peter Hutterer <peter.hutterer@who-t.net>
CC: linux-input(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi "Micha=C5=82,

I love your patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on v5.9 next-20201023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Micha-Miros-aw/input-elant=
s-Support-Asus-TF300T-and-Nexus-7-touchscreens/20201024-204814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/input/touchscreen/elants_i2c.c:890:7: warning: Opposite expressi=
on on both sides of '|=3D'. [oppositeExpression]
       w |=3D !w;
         ^

vim +890 drivers/input/touchscreen/elants_i2c.c

66aee90088da2f Scott Liu       2014-11-19  852  =

66aee90088da2f Scott Liu       2014-11-19  853  /*
66aee90088da2f Scott Liu       2014-11-19  854   * Event reporting.
66aee90088da2f Scott Liu       2014-11-19  855   */
66aee90088da2f Scott Liu       2014-11-19  856  =

89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  857  static void elant=
s_i2c_mt_event(struct elants_data *ts, u8 *buf,
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  858  				size_t report=
_len)
66aee90088da2f Scott Liu       2014-11-19  859  {
66aee90088da2f Scott Liu       2014-11-19  860  	struct input_dev *input =
=3D ts->input;
66aee90088da2f Scott Liu       2014-11-19  861  	unsigned int n_fingers;
f27ad8932725f8 Johnny Chuang   2020-04-09  862  	unsigned int tool_type;
66aee90088da2f Scott Liu       2014-11-19  863  	u16 finger_state;
66aee90088da2f Scott Liu       2014-11-19  864  	int i;
66aee90088da2f Scott Liu       2014-11-19  865  =

66aee90088da2f Scott Liu       2014-11-19  866  	n_fingers =3D buf[FW_POS_S=
TATE + 1] & 0x0f;
66aee90088da2f Scott Liu       2014-11-19  867  	finger_state =3D ((buf[FW_=
POS_STATE + 1] & 0x30) << 4) |
66aee90088da2f Scott Liu       2014-11-19  868  			buf[FW_POS_STATE];
66aee90088da2f Scott Liu       2014-11-19  869  =

66aee90088da2f Scott Liu       2014-11-19  870  	dev_dbg(&ts->client->dev,
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  871  		"n_fingers: %u,=
 state: %04x, report_len: %zu\n",
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  872  		n_fingers, fing=
er_state, report_len);
66aee90088da2f Scott Liu       2014-11-19  873  =

f27ad8932725f8 Johnny Chuang   2020-04-09  874  	/* Note: all fingers have =
the same tool type */
f27ad8932725f8 Johnny Chuang   2020-04-09  875  	tool_type =3D buf[FW_POS_T=
OOL_TYPE] & BIT(0) ?
f27ad8932725f8 Johnny Chuang   2020-04-09  876  			MT_TOOL_FINGER : MT_TOOL=
_PALM;
f27ad8932725f8 Johnny Chuang   2020-04-09  877  =

66aee90088da2f Scott Liu       2014-11-19  878  	for (i =3D 0; i < MAX_CONT=
ACT_NUM && n_fingers; i++) {
66aee90088da2f Scott Liu       2014-11-19  879  		if (finger_state & 1) {
66aee90088da2f Scott Liu       2014-11-19  880  			unsigned int x, y, p, w;
66aee90088da2f Scott Liu       2014-11-19  881  			u8 *pos;
66aee90088da2f Scott Liu       2014-11-19  882  =

66aee90088da2f Scott Liu       2014-11-19  883  			pos =3D &buf[FW_POS_XY +=
 i * 3];
66aee90088da2f Scott Liu       2014-11-19  884  			x =3D (((u16)pos[0] & 0x=
f0) << 4) | pos[1];
66aee90088da2f Scott Liu       2014-11-19  885  			y =3D (((u16)pos[0] & 0x=
0f) << 8) | pos[2];
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  886  			if (report_len=
 =3D=3D PACKET_SIZE_OLD) {
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  887  				w =3D buf[FW_=
POS_WIDTH + i / 2];
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  888  				w >>=3D 4 * (=
~i & 1);	// little-endian-nibbles
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  889  				w |=3D w << 4;
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24 @890  				w |=3D !w;
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  891  				p =3D w;
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  892  			} else {
66aee90088da2f Scott Liu       2014-11-19  893  				p =3D buf[FW_POS_PRESSU=
RE + i];
66aee90088da2f Scott Liu       2014-11-19  894  				w =3D buf[FW_POS_WIDTH =
+ i];
89a3e1f2b4f41c Micha=C5=82 Miros=C5=82aw 2020-10-24  895  			}
66aee90088da2f Scott Liu       2014-11-19  896  =

66aee90088da2f Scott Liu       2014-11-19  897  			dev_dbg(&ts->client->dev=
, "i=3D%d x=3D%d y=3D%d p=3D%d w=3D%d\n",
66aee90088da2f Scott Liu       2014-11-19  898  				i, x, y, p, w);
66aee90088da2f Scott Liu       2014-11-19  899  =

66aee90088da2f Scott Liu       2014-11-19  900  			input_mt_slot(input, i);
f27ad8932725f8 Johnny Chuang   2020-04-09  901  			input_mt_report_slot_sta=
te(input, tool_type, true);
68334dbab13bc5 Micha=C5=82 Miros=C5=82aw 2020-05-17  902  			touchscreen_re=
port_pos(input, &ts->prop, x, y, true);
66aee90088da2f Scott Liu       2014-11-19  903  			input_event(input, EV_AB=
S, ABS_MT_PRESSURE, p);
66aee90088da2f Scott Liu       2014-11-19  904  			input_event(input, EV_AB=
S, ABS_MT_TOUCH_MAJOR, w);
66aee90088da2f Scott Liu       2014-11-19  905  =

66aee90088da2f Scott Liu       2014-11-19  906  			n_fingers--;
66aee90088da2f Scott Liu       2014-11-19  907  		}
66aee90088da2f Scott Liu       2014-11-19  908  =

66aee90088da2f Scott Liu       2014-11-19  909  		finger_state >>=3D 1;
66aee90088da2f Scott Liu       2014-11-19  910  	}
66aee90088da2f Scott Liu       2014-11-19  911  =

66aee90088da2f Scott Liu       2014-11-19  912  	input_mt_sync_frame(input);
66aee90088da2f Scott Liu       2014-11-19  913  	input_sync(input);
66aee90088da2f Scott Liu       2014-11-19  914  }
66aee90088da2f Scott Liu       2014-11-19  915  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4335949596064405341==--

