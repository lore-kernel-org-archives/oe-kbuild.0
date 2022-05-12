Content-Type: multipart/mixed; boundary="===============1675055880423994735=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 59/67] drivers/cxl/cxl.h:94 cxl_to_ig() warn: signedness bug returning '(-8)'
Date: Fri, 13 May 2022 06:01:43 +0800
Message-ID: <202205130517.Glanqjxg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1675055880423994735==
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
commit: 7102596b97e044692ff2ab9fd6e27f6b7cc5d8c8 [59/67] cxl/region: Implem=
ent XHB verification
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001-20220509 (https://download.01.org/0day-ci/ar=
chive/20220513/202205130517.Glanqjxg-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/cxl.h:94 cxl_to_ig() warn: signedness bug returning '(-8)'

Old smatch warnings:
drivers/cxl/region.c:292 region_xhb_config_valid() warn: maybe use && inste=
ad of &

vim +94 drivers/cxl/cxl.h

7102596b97e044 Ben Widawsky 2022-02-11  91  =

7102596b97e044 Ben Widawsky 2022-02-11  92  static inline u8 cxl_to_ig(u16 =
g)
7102596b97e044 Ben Widawsky 2022-02-11  93  {
7102596b97e044 Ben Widawsky 2022-02-11 @94  	return ilog2(g) - 8;
7102596b97e044 Ben Widawsky 2022-02-11  95  }
7102596b97e044 Ben Widawsky 2022-02-11  96  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1675055880423994735==--

