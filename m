Content-Type: multipart/mixed; boundary="===============8427696653244448493=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/070-audio 2/20] drivers/dma/apple-admac.c:653:2-9: line 653 is redundant because platform_get_irq() already prints an error
Date: Tue, 03 May 2022 16:28:06 +0800
Message-ID: <202205031621.jKoPGMr3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8427696653244448493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Martin Povi=C5=A1er" <povik+lin@cutebit.org>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   91b81123719d8b742da188f01ee3d897e0fac92b
commit: 428ea35bca43fe213456fa57640c57deeadc4204 [2/20] dmaengine: apple-ad=
mac: Add Apple ADMAC driver
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-c023-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205031621.jKoPGMr3-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/dma/apple-admac.c:653:2-9: line 653 is redundant because platfor=
m_get_irq() already prints an error

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8427696653244448493==--

