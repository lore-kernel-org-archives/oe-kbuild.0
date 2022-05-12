Content-Type: multipart/mixed; boundary="===============6575781362045914871=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 56/67] drivers/cxl/core/region.c: core.h is included more than once.
Date: Thu, 12 May 2022 18:32:14 +0800
Message-ID: <202205121816.mRTqH43R-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6575781362045914871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   9c642abd8b31d895f34186bd72b7360083b58492
commit: e3a336d0e7c1ec862bd7543a81652b6111a00d8e [56/67] cxl/region: Introd=
uce a cxl_region driver
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/cxl/core/region.c: core.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6575781362045914871==--

