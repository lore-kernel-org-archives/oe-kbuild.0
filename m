Content-Type: multipart/mixed; boundary="===============3678494024628464047=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-nomadik:ux500-janice-v5.18-rc1 18/21] drivers/input/misc/isa1200.c:327:5-11: inconsistent IS_ERR and PTR_ERR on line 328.
Date: Thu, 07 Apr 2022 08:13:21 +0800
Message-ID: <202204070801.hNvu3cEu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3678494024628464047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-janice-v5.18-rc1
head:   7d27ddbe075c07508ab045a63d23aeca798514ee
commit: 0baaba96c1a1116b9fc698a263657cb9b6ab8198 [18/21] Input: isa1200 - n=
ew driver for Immersion ISA1200
:::::: branch date: 27 hours ago
:::::: commit date: 29 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20220407/=
202204070801.hNvu3cEu-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/isa1200.c:327:5-11: inconsistent IS_ERR and PTR_ERR o=
n line 328.
   drivers/input/misc/isa1200.c:332:5-11: inconsistent IS_ERR and PTR_ERR o=
n line 333.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3678494024628464047==--

