Content-Type: multipart/mixed; boundary="===============3589305832461585791=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-4.19 4/4] drivers/input/touchscreen/elants_i2c.c:865:45: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
Date: Fri, 17 Apr 2020 13:13:14 +0800
Message-ID: <202004171356.KVwRuEzf%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3589305832461585791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.19
head:   a036ffbd29fc8c617419293e3ef6264293a7288b
commit: a036ffbd29fc8c617419293e3ef6264293a7288b [4/4] FROMGIT: Input: elan=
ts_i2c - support palm detection
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/input/touchscreen/elants_i2c.c:247:11: warning: The scope of the=
 variable 'error' can be reduced. [variableScope]
    int ret, error;
             ^
   drivers/input/touchscreen/elants_i2c.c:345:6: warning: The scope of the =
variable 'error' can be reduced. [variableScope]
    int error, retry_cnt;
        ^
   drivers/input/touchscreen/elants_i2c.c:372:6: warning: The scope of the =
variable 'error' can be reduced. [variableScope]
    int error, retry_cnt;
        ^
>> drivers/input/touchscreen/elants_i2c.c:865:45: warning: Clarify calculat=
ion precedence for '&' and '?'. [clarifyCalculation]
    tool_type =3D buf[FW_POS_TOOL_TYPE] & BIT(0) ?
                                               ^

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout a036ffbd29fc8c617419293e3ef6264293a7288b
vim +865 drivers/input/touchscreen/elants_i2c.c

66aee90088da2f Scott Liu     2014-11-19  844  =

66aee90088da2f Scott Liu     2014-11-19  845  /*
66aee90088da2f Scott Liu     2014-11-19  846   * Event reporting.
66aee90088da2f Scott Liu     2014-11-19  847   */
66aee90088da2f Scott Liu     2014-11-19  848  =

66aee90088da2f Scott Liu     2014-11-19  849  static void elants_i2c_mt_eve=
nt(struct elants_data *ts, u8 *buf)
66aee90088da2f Scott Liu     2014-11-19  850  {
66aee90088da2f Scott Liu     2014-11-19  851  	struct input_dev *input =3D =
ts->input;
66aee90088da2f Scott Liu     2014-11-19  852  	unsigned int n_fingers;
a036ffbd29fc8c Johnny Chuang 2020-04-09  853  	unsigned int tool_type;
66aee90088da2f Scott Liu     2014-11-19  854  	u16 finger_state;
66aee90088da2f Scott Liu     2014-11-19  855  	int i;
66aee90088da2f Scott Liu     2014-11-19  856  =

66aee90088da2f Scott Liu     2014-11-19  857  	n_fingers =3D buf[FW_POS_STA=
TE + 1] & 0x0f;
66aee90088da2f Scott Liu     2014-11-19  858  	finger_state =3D ((buf[FW_PO=
S_STATE + 1] & 0x30) << 4) |
66aee90088da2f Scott Liu     2014-11-19  859  			buf[FW_POS_STATE];
66aee90088da2f Scott Liu     2014-11-19  860  =

66aee90088da2f Scott Liu     2014-11-19  861  	dev_dbg(&ts->client->dev,
66aee90088da2f Scott Liu     2014-11-19  862  		"n_fingers: %u, state: %04x=
\n",  n_fingers, finger_state);
66aee90088da2f Scott Liu     2014-11-19  863  =

a036ffbd29fc8c Johnny Chuang 2020-04-09  864  	/* Note: all fingers have th=
e same tool type */
a036ffbd29fc8c Johnny Chuang 2020-04-09 @865  	tool_type =3D buf[FW_POS_TOO=
L_TYPE] & BIT(0) ?
a036ffbd29fc8c Johnny Chuang 2020-04-09  866  			MT_TOOL_FINGER : MT_TOOL_P=
ALM;
a036ffbd29fc8c Johnny Chuang 2020-04-09  867  =

66aee90088da2f Scott Liu     2014-11-19  868  	for (i =3D 0; i < MAX_CONTAC=
T_NUM && n_fingers; i++) {
66aee90088da2f Scott Liu     2014-11-19  869  		if (finger_state & 1) {
66aee90088da2f Scott Liu     2014-11-19  870  			unsigned int x, y, p, w;
66aee90088da2f Scott Liu     2014-11-19  871  			u8 *pos;
66aee90088da2f Scott Liu     2014-11-19  872  =

66aee90088da2f Scott Liu     2014-11-19  873  			pos =3D &buf[FW_POS_XY + i=
 * 3];
66aee90088da2f Scott Liu     2014-11-19  874  			x =3D (((u16)pos[0] & 0xf0=
) << 4) | pos[1];
66aee90088da2f Scott Liu     2014-11-19  875  			y =3D (((u16)pos[0] & 0x0f=
) << 8) | pos[2];
66aee90088da2f Scott Liu     2014-11-19  876  			p =3D buf[FW_POS_PRESSURE =
+ i];
66aee90088da2f Scott Liu     2014-11-19  877  			w =3D buf[FW_POS_WIDTH + i=
];
66aee90088da2f Scott Liu     2014-11-19  878  =

66aee90088da2f Scott Liu     2014-11-19  879  			dev_dbg(&ts->client->dev, =
"i=3D%d x=3D%d y=3D%d p=3D%d w=3D%d\n",
66aee90088da2f Scott Liu     2014-11-19  880  				i, x, y, p, w);
66aee90088da2f Scott Liu     2014-11-19  881  =

66aee90088da2f Scott Liu     2014-11-19  882  			input_mt_slot(input, i);
a036ffbd29fc8c Johnny Chuang 2020-04-09  883  			input_mt_report_slot_state=
(input, tool_type, true);
66aee90088da2f Scott Liu     2014-11-19  884  			input_event(input, EV_ABS,=
 ABS_MT_POSITION_X, x);
66aee90088da2f Scott Liu     2014-11-19  885  			input_event(input, EV_ABS,=
 ABS_MT_POSITION_Y, y);
66aee90088da2f Scott Liu     2014-11-19  886  			input_event(input, EV_ABS,=
 ABS_MT_PRESSURE, p);
66aee90088da2f Scott Liu     2014-11-19  887  			input_event(input, EV_ABS,=
 ABS_MT_TOUCH_MAJOR, w);
66aee90088da2f Scott Liu     2014-11-19  888  =

66aee90088da2f Scott Liu     2014-11-19  889  			n_fingers--;
66aee90088da2f Scott Liu     2014-11-19  890  		}
66aee90088da2f Scott Liu     2014-11-19  891  =

66aee90088da2f Scott Liu     2014-11-19  892  		finger_state >>=3D 1;
66aee90088da2f Scott Liu     2014-11-19  893  	}
66aee90088da2f Scott Liu     2014-11-19  894  =

66aee90088da2f Scott Liu     2014-11-19  895  	input_mt_sync_frame(input);
66aee90088da2f Scott Liu     2014-11-19  896  	input_sync(input);
66aee90088da2f Scott Liu     2014-11-19  897  }
66aee90088da2f Scott Liu     2014-11-19  898  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3589305832461585791==--

