Content-Type: multipart/mixed; boundary="===============8394897530176924859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 53/61] drivers/pci/quirks.c:317:18: warning: Unused variable: rdev [unusedVariable]
Date: Fri, 16 Apr 2021 09:57:28 +0800
Message-ID: <202104160911.g87xuekg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8394897530176924859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Prike Liang <Prike.Liang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   0739b4816007d29311a25f3a96c4c678a943309a
commit: 9597624ef6067bab1500d0273a43d4f90e62e929 [53/61] nvme: put some AMD=
 PCIE downstream NVME device to simple suspend/resume path
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/quirks.c:317:18: warning: Unused variable: rdev [unusedVaria=
ble]
    struct pci_dev *rdev;
                    ^

vim +317 drivers/pci/quirks.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  314  =

9597624ef6067b Prike Liang    2021-03-17  315  static void quirk_amd_nvme_f=
ixup(struct pci_dev *dev)
9597624ef6067b Prike Liang    2021-03-17  316  {
9597624ef6067b Prike Liang    2021-03-17 @317  	struct pci_dev *rdev;
9597624ef6067b Prike Liang    2021-03-17  318  =

9597624ef6067b Prike Liang    2021-03-17  319  	dev->dev_flags |=3D PCI_DEV=
_FLAGS_AMD_NVME_SIMPLE_SUSPEND;
9597624ef6067b Prike Liang    2021-03-17  320  	pci_info(dev, "AMD simple s=
uspend opt enabled\n");
9597624ef6067b Prike Liang    2021-03-17  321  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8394897530176924859==--

