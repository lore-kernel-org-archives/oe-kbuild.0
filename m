Content-Type: multipart/mixed; boundary="===============6593621442319654063=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 20/47] drivers/media/platform/intel/ipu6-acpi.c: linux/clk.h is included more than once.
Date: Sun, 24 Apr 2022 00:59:39 +0800
Message-ID: <202204240024.bTJPBAQU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6593621442319654063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: zouxiaoh <xiaohong.zou@intel.com>
CC: nanli2x <nanx.li@intel.com>
CC: khaiwenn <khai.wen.ng@intel.com>
CC: Chen Meng J <meng.j.chen@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   6410aba3b60feba47b9713f297d9b3bdb79981f5
commit: af562e426dc30ed39b0892b0e6de491f171ffe63 [20/47] media: acpi: add a=
cpi driver for intel ipu
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/intel/ipu6-acpi.c: linux/clk.h is included more t=
han once.
>> /kbuild/src/consumer/drivers/media/platform/intel/ipu6-acpi.c: linux/pla=
tform_device.h is included more than once.
>> /kbuild/src/consumer/drivers/media/platform/intel/ipu6-acpi.c: linux/gpi=
o.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6593621442319654063==--

