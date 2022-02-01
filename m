Content-Type: multipart/mixed; boundary="===============1460502953391036613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 11/18] drivers/cxl/cxl.h:94 cxl_to_ig() warn: signedness bug returning '(-8)'
Date: Tue, 01 Feb 2022 21:35:53 +0800
Message-ID: <202202012110.FElRreZ4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1460502953391036613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   639e187dc9ae68fe9f0abe899e0e9ad2a3eab638
commit: 0b96951589ab27b80959447c9b07b8d82fc2d23f [11/18] cxl/region: Implem=
ent XHB verification
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-m001-20220131 (https://download.01.org/0day-ci/ar=
chive/20220201/202202012110.FElRreZ4-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/cxl.h:94 cxl_to_ig() warn: signedness bug returning '(-8)'

Old smatch warnings:
drivers/cxl/region.c:292 region_xhb_config_valid() warn: maybe use && inste=
ad of &

vim +94 drivers/cxl/cxl.h

0b96951589ab27 Ben Widawsky 2021-10-06  91  =

0b96951589ab27 Ben Widawsky 2021-10-06  92  static inline u8 cxl_to_ig(u16 =
g)
0b96951589ab27 Ben Widawsky 2021-10-06  93  {
0b96951589ab27 Ben Widawsky 2021-10-06 @94  	return ilog2(g) - 8;
0b96951589ab27 Ben Widawsky 2021-10-06  95  }
0b96951589ab27 Ben Widawsky 2021-10-06  96  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1460502953391036613==--

