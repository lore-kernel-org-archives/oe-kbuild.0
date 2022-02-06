Content-Type: multipart/mixed; boundary="===============0347118837347995221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:smc/work 14/16] drivers/pci/controller/pcie-apple.c:821:2-13: ERROR: probable double put.
Date: Mon, 07 Feb 2022 00:15:01 +0800
Message-ID: <202202070057.GFAkgspn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0347118837347995221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux smc/work
head:   60ce5f01c74024d326c4ae6880e1f922f6d1712d
commit: 9f4235d19a7390b792c6d00c7541bcefde7c73a7 [14/16] PCI: apple: Probe =
all GPIOs for availability first
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: riscv-randconfig-c003-20220206 (https://download.01.org/0day-ci/arc=
hive/20220207/202202070057.GFAkgspn-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-apple.c:821:2-13: ERROR: probable double put.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0347118837347995221==--

