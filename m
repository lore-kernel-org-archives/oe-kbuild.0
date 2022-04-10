Content-Type: multipart/mixed; boundary="===============1819076388019379444=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/touchscreen/imagis.c:87:34: warning: Signed integer overflow for expression '0x800B<<16'. [integerOverflow]
Date: Sun, 10 Apr 2022 11:35:32 +0800
Message-ID: <202204101123.SnHByKVT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1819076388019379444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Markuss Broks <markuss.broks@gmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Jeff LaBundy <jeff@labundy.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: a23ba3c043db9a2e8c967a3ff66dcedc5725afdf Input: add Imagis touchscr=
een driver
date:   3 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a23ba3c043db9a2e8c967a3ff66dcedc5725afdf
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/input/touchscreen/imagis.c:87:34: warning: Signed integer overfl=
ow for expression '0x800B<<16'. [integerOverflow]
    error =3D imagis_i2c_read_reg(ts, IST3038C_REG_INTR_MESSAGE,
                                    ^
   drivers/input/touchscreen/imagis.c:108:10: warning: Signed integer overf=
low for expression '0x800B<<16'. [integerOverflow]
            IST3038C_REG_TOUCH_COORD + (i * 4),
            ^

vim +87 drivers/input/touchscreen/imagis.c

a23ba3c043db9a Markuss Broks 2022-03-14   78  =

a23ba3c043db9a Markuss Broks 2022-03-14   79  static irqreturn_t imagis_int=
errupt(int irq, void *dev_id)
a23ba3c043db9a Markuss Broks 2022-03-14   80  {
a23ba3c043db9a Markuss Broks 2022-03-14   81  	struct imagis_ts *ts =3D dev=
_id;
a23ba3c043db9a Markuss Broks 2022-03-14   82  	u32 intr_message, finger_sta=
tus;
a23ba3c043db9a Markuss Broks 2022-03-14   83  	unsigned int finger_count, f=
inger_pressed;
a23ba3c043db9a Markuss Broks 2022-03-14   84  	int i;
a23ba3c043db9a Markuss Broks 2022-03-14   85  	int error;
a23ba3c043db9a Markuss Broks 2022-03-14   86  =

a23ba3c043db9a Markuss Broks 2022-03-14  @87  	error =3D imagis_i2c_read_re=
g(ts, IST3038C_REG_INTR_MESSAGE,
a23ba3c043db9a Markuss Broks 2022-03-14   88  				    &intr_message);
a23ba3c043db9a Markuss Broks 2022-03-14   89  	if (error) {
a23ba3c043db9a Markuss Broks 2022-03-14   90  		dev_err(&ts->client->dev,
a23ba3c043db9a Markuss Broks 2022-03-14   91  			"failed to read the interr=
upt message: %d\n", error);
a23ba3c043db9a Markuss Broks 2022-03-14   92  		goto out;
a23ba3c043db9a Markuss Broks 2022-03-14   93  	}
a23ba3c043db9a Markuss Broks 2022-03-14   94  =

a23ba3c043db9a Markuss Broks 2022-03-14   95  	finger_count =3D (intr_messa=
ge & IST3038C_FINGER_COUNT_MASK) >>
a23ba3c043db9a Markuss Broks 2022-03-14   96  				IST3038C_FINGER_COUNT_SHI=
FT;
a23ba3c043db9a Markuss Broks 2022-03-14   97  	if (finger_count > IST3038C_=
MAX_FINGER_NUM) {
a23ba3c043db9a Markuss Broks 2022-03-14   98  		dev_err(&ts->client->dev,
a23ba3c043db9a Markuss Broks 2022-03-14   99  			"finger count %d is more t=
han maximum supported\n",
a23ba3c043db9a Markuss Broks 2022-03-14  100  			finger_count);
a23ba3c043db9a Markuss Broks 2022-03-14  101  		goto out;
a23ba3c043db9a Markuss Broks 2022-03-14  102  	}
a23ba3c043db9a Markuss Broks 2022-03-14  103  =

a23ba3c043db9a Markuss Broks 2022-03-14  104  	finger_pressed =3D intr_mess=
age & IST3038C_FINGER_STATUS_MASK;
a23ba3c043db9a Markuss Broks 2022-03-14  105  =

a23ba3c043db9a Markuss Broks 2022-03-14  106  	for (i =3D 0; i < finger_cou=
nt; i++) {
a23ba3c043db9a Markuss Broks 2022-03-14  107  		error =3D imagis_i2c_read_r=
eg(ts,
a23ba3c043db9a Markuss Broks 2022-03-14  108  					    IST3038C_REG_TOUCH_C=
OORD + (i * 4),
a23ba3c043db9a Markuss Broks 2022-03-14  109  					    &finger_status);
a23ba3c043db9a Markuss Broks 2022-03-14  110  		if (error) {
a23ba3c043db9a Markuss Broks 2022-03-14  111  			dev_err(&ts->client->dev,
a23ba3c043db9a Markuss Broks 2022-03-14  112  				"failed to read coordinat=
es for finger %d: %d\n",
a23ba3c043db9a Markuss Broks 2022-03-14  113  				i, error);
a23ba3c043db9a Markuss Broks 2022-03-14  114  			goto out;
a23ba3c043db9a Markuss Broks 2022-03-14  115  		}
a23ba3c043db9a Markuss Broks 2022-03-14  116  =

a23ba3c043db9a Markuss Broks 2022-03-14  117  		input_mt_slot(ts->input_dev=
, i);
a23ba3c043db9a Markuss Broks 2022-03-14  118  		input_mt_report_slot_state(=
ts->input_dev, MT_TOOL_FINGER,
a23ba3c043db9a Markuss Broks 2022-03-14  119  					   finger_pressed & BIT(=
i));
a23ba3c043db9a Markuss Broks 2022-03-14  120  		touchscreen_report_pos(ts->=
input_dev, &ts->prop,
a23ba3c043db9a Markuss Broks 2022-03-14  121  				       (finger_status & I=
ST3038C_X_MASK) >>
a23ba3c043db9a Markuss Broks 2022-03-14  122  						IST3038C_X_SHIFT,
a23ba3c043db9a Markuss Broks 2022-03-14  123  				       finger_status & IS=
T3038C_Y_MASK, 1);
a23ba3c043db9a Markuss Broks 2022-03-14  124  		input_report_abs(ts->input_=
dev, ABS_MT_TOUCH_MAJOR,
a23ba3c043db9a Markuss Broks 2022-03-14  125  				 (finger_status & IST3038=
C_AREA_MASK) >>
a23ba3c043db9a Markuss Broks 2022-03-14  126  					IST3038C_AREA_SHIFT);
a23ba3c043db9a Markuss Broks 2022-03-14  127  	}
a23ba3c043db9a Markuss Broks 2022-03-14  128  =

a23ba3c043db9a Markuss Broks 2022-03-14  129  	input_mt_sync_frame(ts->inpu=
t_dev);
a23ba3c043db9a Markuss Broks 2022-03-14  130  	input_sync(ts->input_dev);
a23ba3c043db9a Markuss Broks 2022-03-14  131  =

a23ba3c043db9a Markuss Broks 2022-03-14  132  out:
a23ba3c043db9a Markuss Broks 2022-03-14  133  	return IRQ_HANDLED;
a23ba3c043db9a Markuss Broks 2022-03-14  134  }
a23ba3c043db9a Markuss Broks 2022-03-14  135  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1819076388019379444==--

