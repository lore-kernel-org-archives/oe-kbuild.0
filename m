Content-Type: multipart/mixed; boundary="===============8698108504194304853=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/intel/iommu.c:230 clear_context_copied() warn: clear_bit() takes a bit number
Date: Tue, 20 Sep 2022 07:42:12 +0800
Message-ID: <202209201529.65aJOj82-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8698108504194304853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: 0c5f6c0d8201a809a6585b07b6263e9db2c874a3 iommu/vt-d: Fix kdump kern=
els boot failure with scalable mode
date:   13 days ago
:::::: branch date: 35 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-m021-20220919 (https://download.01.org/0day-ci/arch=
ive/20220920/202209201529.65aJOj82-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iommu/intel/iommu.c:230 clear_context_copied() warn: clear_bit() ta=
kes a bit number
drivers/iommu/intel/iommu.c:224 set_context_copied() warn: set_bit() takes =
a bit number

Old smatch warnings:
drivers/iommu/intel/iommu.c:731 device_to_iommu() error: we previously assu=
med 'pdev' could be null (see line 704)

vim +230 drivers/iommu/intel/iommu.c

0c5f6c0d8201a8 Lu Baolu 2022-08-23  220  =

0c5f6c0d8201a8 Lu Baolu 2022-08-23  221  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  222  set_context_copied(struct intel_io=
mmu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  223  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @224  	set_bit(((long)bus << 8) | devfn,=
 iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  225  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  226  =

0c5f6c0d8201a8 Lu Baolu 2022-08-23  227  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  228  clear_context_copied(struct intel_=
iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  229  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @230  	clear_bit(((long)bus << 8) | devf=
n, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  231  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  232  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8698108504194304853==--

