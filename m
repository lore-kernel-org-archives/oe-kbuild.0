Content-Type: multipart/mixed; boundary="===============5220340386860359075=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/hid-lenovo.c:293:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Mon, 26 Apr 2021 07:14:19 +0800
Message-ID: <202104260713.hQMuw4sY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5220340386860359075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Kefeng,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f4ad9e425a1d3b6a34617b8ea226d56a119a717
commit: ed1ed4c0da5447c5e322481ce2ef9f03336c6ffb riscv: mmiowb: Fix implici=
t declaration of function 'smp_processor_id'
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +293 drivers/hid/hid-lenovo.c

f3d4ff0e04cc44 Jamie Lentin 2014-07-23  285  =

e3cb0acd23258c Jamie Lentin 2014-12-16  286  static ssize_t attr_sensitivit=
y_show_cptkbd(struct device *dev,
e3cb0acd23258c Jamie Lentin 2014-12-16  287  		struct device_attribute *att=
r,
e3cb0acd23258c Jamie Lentin 2014-12-16  288  		char *buf)
e3cb0acd23258c Jamie Lentin 2014-12-16  289  {
ee79a8f840a45d Geliang Tang 2015-12-27  290  	struct hid_device *hdev =3D t=
o_hid_device(dev);
e3cb0acd23258c Jamie Lentin 2014-12-16  291  	struct lenovo_drvdata_cptkbd =
*cptkbd_data =3D hid_get_drvdata(hdev);
e3cb0acd23258c Jamie Lentin 2014-12-16  292  =

e3cb0acd23258c Jamie Lentin 2014-12-16 @293  	return snprintf(buf, PAGE_SIZ=
E, "%u\n",
e3cb0acd23258c Jamie Lentin 2014-12-16  294  		cptkbd_data->sensitivity);
e3cb0acd23258c Jamie Lentin 2014-12-16  295  }
e3cb0acd23258c Jamie Lentin 2014-12-16  296  =


:::::: The code at line 293 was first introduced by commit
:::::: e3cb0acd23258cf5e1a7ea270c98805eff01dcc5 HID: lenovo: Add sensitivit=
y control to compact keyboards

:::::: TO: Jamie Lentin <jm@lentin.co.uk>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5220340386860359075==--

