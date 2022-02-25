Content-Type: multipart/mixed; boundary="===============0616328399847658825=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-nomadik:ux500-codina-v5.17-rc1 6/12] drivers/input/touchscreen/zinitix.c:338:36: sparse: sparse: dubious: !x & y
Date: Fri, 25 Feb 2022 12:20:42 +0800
Message-ID: <202202251241.7kTh2qKA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0616328399847658825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-codina-v5.17-rc1
head:   55196848adbcea2ea36561a056bb610bf3ab40bf
commit: 727f5e5be135b8f1f94922093b5c88565fdadcb0 [6/12] Input: zinitix - Do=
 not report shadow fingers
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-s031-20220223 (https://download.01.org/0day-ci/archi=
ve/20220225/202202251241.7kTh2qKA-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-noma=
dik.git/commit/?id=3D727f5e5be135b8f1f94922093b5c88565fdadcb0
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/=
kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-codina-v5.17-rc1
        git checkout 727f5e5be135b8f1f94922093b5c88565fdadcb0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/zinitix.c:338:36: sparse: sparse: dubious: !x =
& y

vim +338 drivers/input/touchscreen/zinitix.c

26822652c85eff Michael Srba  2020-10-04  321  =

727f5e5be135b8 Linus Walleij 2022-02-14  322  static void zinitix_report_fi=
ngers(struct bt541_ts_data *bt541, struct touch_event *te)
26822652c85eff Michael Srba  2020-10-04  323  {
727f5e5be135b8 Linus Walleij 2022-02-14  324  	struct point_coord *p;
727f5e5be135b8 Linus Walleij 2022-02-14  325  	u16 x, y;
727f5e5be135b8 Linus Walleij 2022-02-14  326  	unsigned long fmask;
727f5e5be135b8 Linus Walleij 2022-02-14  327  	int i;
727f5e5be135b8 Linus Walleij 2022-02-14  328  =

727f5e5be135b8 Linus Walleij 2022-02-14  329  	/*
727f5e5be135b8 Linus Walleij 2022-02-14  330  	 * If the corresponding fing=
er is not active, do not report
727f5e5be135b8 Linus Walleij 2022-02-14  331  	 * what is happening on it.
727f5e5be135b8 Linus Walleij 2022-02-14  332  	 */
727f5e5be135b8 Linus Walleij 2022-02-14  333  	fmask =3D te->finger_mask;
727f5e5be135b8 Linus Walleij 2022-02-14  334  	for_each_set_bit(i, &fmask, =
MAX_SUPPORTED_FINGER_NUM) {
727f5e5be135b8 Linus Walleij 2022-02-14  335  		p =3D &te->point_coord[i];
727f5e5be135b8 Linus Walleij 2022-02-14  336  =

727f5e5be135b8 Linus Walleij 2022-02-14  337  		/* Skip nonexisting fingers=
 */
727f5e5be135b8 Linus Walleij 2022-02-14 @338  		if (!p->sub_status & SUB_BI=
T_EXIST)
727f5e5be135b8 Linus Walleij 2022-02-14  339  			continue;
727f5e5be135b8 Linus Walleij 2022-02-14  340  =

727f5e5be135b8 Linus Walleij 2022-02-14  341  		x =3D le16_to_cpu(p->x);
727f5e5be135b8 Linus Walleij 2022-02-14  342  		y =3D le16_to_cpu(p->y);
727f5e5be135b8 Linus Walleij 2022-02-14  343  =

727f5e5be135b8 Linus Walleij 2022-02-14  344  		input_mt_slot(bt541->input_=
dev, i);
727f5e5be135b8 Linus Walleij 2022-02-14  345  =

727f5e5be135b8 Linus Walleij 2022-02-14  346  		if (p->sub_status & BIT_DOW=
N) {
727f5e5be135b8 Linus Walleij 2022-02-14  347  			/* Finger down */
727f5e5be135b8 Linus Walleij 2022-02-14  348  			input_mt_report_slot_state=
(bt541->input_dev, MT_TOOL_FINGER, true);
727f5e5be135b8 Linus Walleij 2022-02-14  349  			touchscreen_report_pos(bt5=
41->input_dev, &bt541->prop, x, y, true);
727f5e5be135b8 Linus Walleij 2022-02-14  350  			input_report_abs(bt541->in=
put_dev, ABS_MT_TOUCH_MAJOR, p->width);
727f5e5be135b8 Linus Walleij 2022-02-14  351  			dev_dbg(&bt541->client->de=
v, "finger %d down (%u, %u)\n", i, x, y);
727f5e5be135b8 Linus Walleij 2022-02-14  352  		} else if (p->sub_status & =
BIT_UP) {
727f5e5be135b8 Linus Walleij 2022-02-14  353  			/* Release finger */
727f5e5be135b8 Linus Walleij 2022-02-14  354  			input_mt_report_slot_state=
(bt541->input_dev, MT_TOOL_FINGER, false);
727f5e5be135b8 Linus Walleij 2022-02-14  355  			touchscreen_report_pos(bt5=
41->input_dev, &bt541->prop, x, y, true);
727f5e5be135b8 Linus Walleij 2022-02-14  356  			input_report_abs(bt541->in=
put_dev, ABS_MT_TOUCH_MAJOR, 0);
727f5e5be135b8 Linus Walleij 2022-02-14  357  			dev_dbg(&bt541->client->de=
v, "finger %d up (%u, %u)\n", i, x, y);
727f5e5be135b8 Linus Walleij 2022-02-14  358  		} else if (p->sub_status & =
BIT_MOVE) {
727f5e5be135b8 Linus Walleij 2022-02-14  359  			/* Finger moves while pres=
sed down */
26822652c85eff Michael Srba  2020-10-04  360  			input_mt_report_slot_state=
(bt541->input_dev, MT_TOOL_FINGER, true);
727f5e5be135b8 Linus Walleij 2022-02-14  361  			touchscreen_report_pos(bt5=
41->input_dev, &bt541->prop, x, y, true);
26822652c85eff Michael Srba  2020-10-04  362  			input_report_abs(bt541->in=
put_dev, ABS_MT_TOUCH_MAJOR, p->width);
727f5e5be135b8 Linus Walleij 2022-02-14  363  			dev_dbg(&bt541->client->de=
v, "finger %d move (%u, %u)\n", i, x, y);
727f5e5be135b8 Linus Walleij 2022-02-14  364  		} else {
727f5e5be135b8 Linus Walleij 2022-02-14  365  			dev_dbg(&bt541->client->de=
v, "unknown finger event\n");
727f5e5be135b8 Linus Walleij 2022-02-14  366  		}
727f5e5be135b8 Linus Walleij 2022-02-14  367  	}
26822652c85eff Michael Srba  2020-10-04  368  }
26822652c85eff Michael Srba  2020-10-04  369  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0616328399847658825==--

