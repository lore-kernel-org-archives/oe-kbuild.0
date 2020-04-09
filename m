Content-Type: multipart/mixed; boundary="===============7238364892467142242=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 47/48] drivers/extcon/extcon-tcss-cros-ec.c:345:33: warning: 'status_reg' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
Date: Fri, 10 Apr 2020 02:14:57 +0800
Message-ID: <202004100255.NVeBYhQm%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7238364892467142242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   236107e4922718c52d3757b9d8ef0a5b9c66e713
commit: 13f6da8f2a3b39d2e39f6f17c76af31711ccc386 [47/48] CHROMIUM: extcon: =
Prevent duplicate connect / disconnect requests
:::::: branch date: 3 hours ago
:::::: commit date: 10 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/extcon/extcon-tcss-cros-ec.c:345:33: warning: 'status_reg' is of=
 type 'void *'. When using void pointers in calculations, the behaviour is =
undefined. [arithOperationsOnVoidPointer]
    void __iomem *reg =3D status_reg + (IOM_REG_LEN * port);
                                   ^
   drivers/extcon/extcon-tcss-cros-ec.c:666:6: warning: The scope of the va=
riable 'ret' can be reduced. [variableScope]
    int ret;
        ^

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout 13f6da8f2a3b39d2e39f6f17c76af31711ccc386
vim +345 drivers/extcon/extcon-tcss-cros-ec.c

562267b91e8a1ed Vijay Hiremath 2020-02-20  342  =

13f6da8f2a3b39d Rajmohan Mani  2020-03-06  343  static bool cros_ec_tcss_po=
rt_connected(u8 port, void __iomem *status_reg)
13f6da8f2a3b39d Rajmohan Mani  2020-03-06  344  {
13f6da8f2a3b39d Rajmohan Mani  2020-03-06 @345  	void __iomem *reg =3D stat=
us_reg + (IOM_REG_LEN * port);
13f6da8f2a3b39d Rajmohan Mani  2020-03-06  346  =

13f6da8f2a3b39d Rajmohan Mani  2020-03-06  347  	return !!(ioread32(reg) & =
IOM_PORT_STATUS_CONNECTED);
13f6da8f2a3b39d Rajmohan Mani  2020-03-06  348  }
13f6da8f2a3b39d Rajmohan Mani  2020-03-06  349  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7238364892467142242==--

