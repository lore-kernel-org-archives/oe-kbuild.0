Content-Type: multipart/mixed; boundary="===============3830635712491662304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 479/1181] arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more than once.
Date: Tue, 21 Jun 2022 05:39:39 +0800
Message-ID: <202206210523.bPXdCJqX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3830635712491662304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Michal Simek <monstr@monstr.eu>
CC: Stefan Asserhall <stefan.asserhall@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 08dfb7d5fabd8bb46ce8d7761a724012bf1b03cd [479/1181] microblaze: Rew=
ork mmu context management to prepare
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included =
more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3830635712491662304==--

