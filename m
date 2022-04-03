Content-Type: multipart/mixed; boundary="===============4752221189849739730=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/mem.c:223:1: warning: There is an unknown macro here somewhere. Configuration is required. If __stringify is a macro then please configure it. [unknownMacro]
Date: Sun, 03 Apr 2022 11:17:15 +0800
Message-ID: <202204031141.K1csF1c7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4752221189849739730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 8dd2bc0f8e02d39bd80851ca787bcbdb7d495e69 cxl/mem: Add the cxl_mem d=
river
date:   8 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/mem.c:223:1: warning: There is an unknown macro here somewhe=
re. Configuration is required. If __stringify is a macro then please config=
ure it. [unknownMacro]
   MODULE_ALIAS_CXL(CXL_DEVICE_MEMORY_EXPANDER);
   ^

vim +223 drivers/cxl/mem.c

8dd2bc0f8e02d3 Ben Widawsky 2022-02-04  220  =

8dd2bc0f8e02d3 Ben Widawsky 2022-02-04  221  MODULE_LICENSE("GPL v2");
8dd2bc0f8e02d3 Ben Widawsky 2022-02-04  222  MODULE_IMPORT_NS(CXL);
8dd2bc0f8e02d3 Ben Widawsky 2022-02-04 @223  MODULE_ALIAS_CXL(CXL_DEVICE_ME=
MORY_EXPANDER);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4752221189849739730==--

