Content-Type: multipart/mixed; boundary="===============5173262128932250776=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/070-audio 2/20] drivers/dma/apple-admac.c:653:2-9: line 653 is redundant because platform_get_irq() already prints an error
Date: Sun, 10 Jul 2022 04:17:23 +0800
Message-ID: <202207100435.ntbYCJh6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5173262128932250776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Martin Povi=C5=A1er" <povik+lin@cutebit.org>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   401ef594286e6abfe89c2d92664087bc5d6ca657
commit: d2b3a34a7f529cd3e338989d7b4c71981180ad30 [2/20] dmaengine: apple-ad=
mac: Add Apple ADMAC driver
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
config: xtensa-randconfig-c004-20220710 (https://download.01.org/0day-ci/ar=
chive/20220710/202207100435.ntbYCJh6-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/dma/apple-admac.c:653:2-9: line 653 is redundant because platfor=
m_get_irq() already prints an error

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5173262128932250776==--

