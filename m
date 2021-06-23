Content-Type: multipart/mixed; boundary="===============4093516719375069642=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8921/12271] drivers/net/wwan/wwan_core.c:87:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Wed, 23 Jun 2021 14:56:13 +0800
Message-ID: <202106231408.Zw2uV7LS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4093516719375069642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Loic Poulain <loic.poulain@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4238b1710eadd18dd16de0288a2bc5bb84614b4e
commit: 89212e160b81e778f829b89743570665810e3b13 [8921/12271] net: wwan: Fi=
x WWAN config symbols
:::::: branch date: 20 hours ago
:::::: commit date: 8 days ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


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
--===============4093516719375069642==--

