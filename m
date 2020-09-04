Content-Type: multipart/mixed; boundary="===============2055365404900288342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/cec/platform/seco/seco-cec.c:136:10: warning: Variable 'status' is reassigned a value before the old one has been used.
Date: Fri, 04 Sep 2020 17:38:07 +0800
Message-ID: <202009041705.QCEk9nof%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2055365404900288342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59126901f200f5fc907153468b03c64e0081b6e6
commit: df823a8208c434eee6e4e9aa016c956d0968e2e2 media: cec: rename CEC pla=
tform drivers config options
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/media/cec/platform/seco/seco-cec.c:136:10: warning: Variable 'st=
atus' is reassigned a value before the old one has been used. [redundantAss=
ignment]
     status =3D smb_wr16(SECOCEC_STATUS_REG_1, val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:135:10: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
     status =3D smb_rd16(SECOCEC_STATUS_REG_1, &val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:136:10: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
     status =3D smb_wr16(SECOCEC_STATUS_REG_1, val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:139:10: warning: Variable 'st=
atus' is reassigned a value before the old one has been used. [redundantAss=
ignment]
     status =3D smb_rd16(SECOCEC_ENABLE_REG_1, &val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:136:10: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
     status =3D smb_wr16(SECOCEC_STATUS_REG_1, val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:139:10: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
     status =3D smb_rd16(SECOCEC_ENABLE_REG_1, &val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:140:10: warning: Variable 'st=
atus' is reassigned a value before the old one has been used. [redundantAss=
ignment]
     status =3D smb_wr16(SECOCEC_ENABLE_REG_1, val &
            ^
   drivers/media/cec/platform/seco/seco-cec.c:139:10: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
     status =3D smb_rd16(SECOCEC_ENABLE_REG_1, &val);
            ^
   drivers/media/cec/platform/seco/seco-cec.c:140:10: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
     status =3D smb_wr16(SECOCEC_ENABLE_REG_1, val &
            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ddf823a8208c434eee6e4e9aa016c956d0968e2e2
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout df823a8208c434eee6e4e9aa016c956d0968e2e2
vim +/status +136 drivers/media/cec/platform/seco/seco-cec.c

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  104  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  105  static int secocec_adap_enable(struct cec_adapter *adap, bo=
ol enable)
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  106  {
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  107  	struct secocec_data *cec =3D cec_get_drvdata(adap);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  108  	struct device *dev =3D cec->dev;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  109  	u16 val =3D 0;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  110  	int status;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  111  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  112  	if (enable) {
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  113  		/* Clear the status register */
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  114  		status =3D smb_rd16(SECOCEC_STATUS_REG_1, &val);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  115  		if (status)
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  116  			goto err;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  117  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  118  		status =3D smb_wr16(SECOCEC_STATUS_REG_1, val);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  119  		if (status)
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  120  			goto err;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  121  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  122  		/* Enable the interrupts */
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  123  		status =3D smb_rd16(SECOCEC_ENABLE_REG_1, &val);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  124  		if (status)
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  125  			goto err;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  126  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  127  		status =3D smb_wr16(SECOCEC_ENABLE_REG_1,
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  128  				  val | SECOCEC_ENABLE_REG_1_CEC);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  129  		if (status)
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  130  			goto err;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  131  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  132  		dev_dbg(dev, "Device enabled");
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  133  	} else {
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  134  		/* Clear the status register */
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  135  		status =3D smb_rd16(SECOCEC_STATUS_REG_1, &val);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21 @136  		status =3D smb_wr16(SECOCEC_STATUS_REG_1, val);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  137  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  138  		/* Disable the interrupts */
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  139  		status =3D smb_rd16(SECOCEC_ENABLE_REG_1, &val);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  140  		status =3D smb_wr16(SECOCEC_ENABLE_REG_1, val &
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  141  				  ~SECOCEC_ENABLE_REG_1_CEC &
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  142  				  ~SECOCEC_ENABLE_REG_1_IR);
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  143  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  144  		dev_dbg(dev, "Device disabled");
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  145  	}
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  146  =

b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  147  	return 0;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  148  err:
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  149  	return status;
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  150  }
b03c2fb97adcc6 drivers/media/platform/seco-cec/seco-cec.c Ettore Chimenti 2=
018-10-21  151  =


:::::: The code at line 136 was first introduced by commit
:::::: b03c2fb97adcc65d3c4098c4aa41fbaa6623ebf2 media: add SECO cec driver

:::::: TO: Ettore Chimenti <ek5.chimenti@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2055365404900288342==--

