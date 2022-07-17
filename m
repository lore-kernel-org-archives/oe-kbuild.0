Content-Type: multipart/mixed; boundary="===============0091056286718612855=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 310/438] drivers/media/test-drivers/vimc/vimc-core.c:193:6-12: inconsistent IS_ERR and PTR_ERR on line 194.
Date: Mon, 18 Jul 2022 07:52:23 +0800
Message-ID: <202207180749.M5E2n7a1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0091056286718612855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yunke Cao <yunkec@google.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Shuah Khan <skhan@linuxfoundation.org>

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   8bd1dbf8d580c425605fb8936309a4e9745a7a95
commit: d534b9520a128d20d81d6dcf95441e806bdeb20f [310/438] media: vimc: add=
 ancillary lens
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-c043-20220715 (https://download.01.org/0day-ci=
/archive/20220718/202207180749.M5E2n7a1-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/test-drivers/vimc/vimc-core.c:193:6-12: inconsistent IS_ER=
R and PTR_ERR on line 194.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0091056286718612855==--

