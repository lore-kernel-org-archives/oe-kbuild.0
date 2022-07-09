Content-Type: multipart/mixed; boundary="===============5154556775767164097=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/140-pci-pwren 4/5] drivers/pci/controller/pcie-apple.c:821:2-13: ERROR: probable double put.
Date: Sat, 09 Jul 2022 16:21:58 +0800
Message-ID: <202207091634.4CBmIPwv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5154556775767164097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/140-pci-pwren
head:   c689fa42344ffa092b97250d5fbf75faa11b4f36
commit: 5803234053885482d5952831f28d8f3b7c57043c [4/5] PCI: apple: Probe al=
l GPIOs for availability first
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
config: sparc64-randconfig-c024-20220707 (https://download.01.org/0day-ci/a=
rchive/20220709/202207091634.4CBmIPwv-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-apple.c:821:2-13: ERROR: probable double put.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5154556775767164097==--

