Content-Type: multipart/mixed; boundary="===============5937124361324690702=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 1992/2561] drivers/usb/gadget/configfs.c:1554:6-8: ERROR: iterator variable bound on line 1553 cannot be NULL
Date: Tue, 07 Dec 2021 18:51:30 +0800
Message-ID: <202112071831.yZzrVHVp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5937124361324690702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   617fec3654adc5dfc39d303b5b371fc4e1be600b
commit: db87c70afb233e6f6c5fb8164f92b1bef4690a1b [1992/2561] NOUPSTREAM: AN=
DROID: usb: gadget: configfs: Add Uevent to notify userspace
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-c002-20211207 (https://download.01.org/0day-ci/ar=
chive/20211207/202112071831.yZzrVHVp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/configfs.c:1554:6-8: ERROR: iterator variable bound o=
n line 1553 cannot be NULL

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5937124361324690702==--

