Content-Type: multipart/mixed; boundary="===============1095251103940746106=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/wwan_core.c:87:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Thu, 29 Jul 2021 09:16:58 +0800
Message-ID: <202107290948.Ip6ALKHq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1095251103940746106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Loic Poulain <loic.poulain@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4010a528219e01dd02e768b22168f7f0e78365ce
commit: 89212e160b81e778f829b89743570665810e3b13 net: wwan: Fix WWAN config=
 symbols
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
compiler: powerpc-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/net/wwan/wwan_core.c:87:9: warning: %d in format string (no. 1) =
requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgTy=
pe_sint]
    return sprintf(buf, "%dn", wwan->id);
           ^

vim +87 drivers/net/wwan/wwan_core.c

9a44c1cc638876 Loic Poulain 2021-04-16  82  =

e4e92ee78702b1 Loic Poulain 2021-05-25  83  static ssize_t index_show(struc=
t device *dev, struct device_attribute *attr, char *buf)
e4e92ee78702b1 Loic Poulain 2021-05-25  84  {
e4e92ee78702b1 Loic Poulain 2021-05-25  85  	struct wwan_device *wwan =3D t=
o_wwan_dev(dev);
e4e92ee78702b1 Loic Poulain 2021-05-25  86  =

e4e92ee78702b1 Loic Poulain 2021-05-25 @87  	return sprintf(buf, "%d\n", ww=
an->id);
e4e92ee78702b1 Loic Poulain 2021-05-25  88  }
e4e92ee78702b1 Loic Poulain 2021-05-25  89  static DEVICE_ATTR_RO(index);
e4e92ee78702b1 Loic Poulain 2021-05-25  90  =


:::::: The code at line 87 was first introduced by commit
:::::: e4e92ee78702b13ad55118d8b66f06e1aef62586 net: wwan: core: Add WWAN d=
evice index sysfs attribute

:::::: TO: Loic Poulain <loic.poulain@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1095251103940746106==--

