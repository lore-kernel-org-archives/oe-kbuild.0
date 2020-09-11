Content-Type: multipart/mixed; boundary="===============7174684795809350337=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/io-pgtable-arm.c:1186:8: warning: Variable 'iova' is reassigned a value before the old one has been used.
Date: Fri, 11 Sep 2020 12:24:15 +0800
Message-ID: <202009111211.e1Rxhvqi%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7174684795809350337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   581cb3a26baf846ee9636214afaa5333919875b1
commit: 9062c1d0bedacf68d9c92cbd62c62a6fe6f6cebc iommu/io-pgtable: Move som=
e initialization data to .init.rodata
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/iommu/io-pgtable-arm.c:914:8: warning: Shifting signed 32-bit va=
lue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    reg =3D ARM_64_LPAE_S2_TCR_RES1 |
          ^
   drivers/iommu/io-pgtable-arm.c:992:31: warning: Shifting signed 32-bit v=
alue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     cfg->arm_lpae_s1_cfg.tcr |=3D ARM_32_LPAE_TCR_EAE;
                                 ^
>> drivers/iommu/io-pgtable-arm.c:1186:8: warning: Variable 'iova' is reass=
igned a value before the old one has been used. [redundantAssignment]
     iova =3D 0;
          ^
   drivers/iommu/io-pgtable-arm.c:1170:9: note: Variable 'iova' is reassign=
ed a value before the old one has been used.
      iova +=3D SZ_1G;
           ^
   drivers/iommu/io-pgtable-arm.c:1186:8: note: Variable 'iova' is reassign=
ed a value before the old one has been used.
     iova =3D 0;
          ^
>> drivers/iommu/io-pgtable-arm.c:1221:46: warning: Variable '__initconst' =
is reassigned a value before the old one has been used. [redundantAssignmen=
t]
    static const unsigned int ias[] __initconst =3D {
                                                ^
   drivers/iommu/io-pgtable-arm.c:1215:50: note: Variable '__initconst' is =
reassigned a value before the old one has been used.
    static const unsigned long pgsize[] __initconst =3D {
                                                    ^
   drivers/iommu/io-pgtable-arm.c:1221:46: note: Variable '__initconst' is =
reassigned a value before the old one has been used.
    static const unsigned int ias[] __initconst =3D {
                                                ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D9062c1d0bedacf68d9c92cbd62c62a6fe6f6cebc
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 9062c1d0bedacf68d9c92cbd62c62a6fe6f6cebc
vim +/iova +1186 drivers/iommu/io-pgtable-arm.c

fe4b991dcd84e0 Will Deacon        2014-11-17  1113  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1114  static int __init arm_l=
pae_run_tests(struct io_pgtable_cfg *cfg)
fe4b991dcd84e0 Will Deacon        2014-11-17  1115  {
9062c1d0bedacf Christophe JAILLET 2019-09-09  1116  	static const enum io_p=
gtable_fmt fmts[] __initconst =3D {
fe4b991dcd84e0 Will Deacon        2014-11-17  1117  		ARM_64_LPAE_S1,
fe4b991dcd84e0 Will Deacon        2014-11-17  1118  		ARM_64_LPAE_S2,
fe4b991dcd84e0 Will Deacon        2014-11-17  1119  	};
fe4b991dcd84e0 Will Deacon        2014-11-17  1120  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1121  	int i, j;
fe4b991dcd84e0 Will Deacon        2014-11-17  1122  	unsigned long iova;
fe4b991dcd84e0 Will Deacon        2014-11-17  1123  	size_t size;
fe4b991dcd84e0 Will Deacon        2014-11-17  1124  	struct io_pgtable_ops =
*ops;
fe4b991dcd84e0 Will Deacon        2014-11-17  1125  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1126  	selftest_running =3D t=
rue;
fe4b991dcd84e0 Will Deacon        2014-11-17  1127  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1128  	for (i =3D 0; i < ARRA=
Y_SIZE(fmts); ++i) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1129  		cfg_cookie =3D cfg;
fe4b991dcd84e0 Will Deacon        2014-11-17  1130  		ops =3D alloc_io_pgta=
ble_ops(fmts[i], cfg, cfg);
fe4b991dcd84e0 Will Deacon        2014-11-17  1131  		if (!ops) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1132  			pr_err("selftest: fa=
iled to allocate io pgtable ops\n");
fe4b991dcd84e0 Will Deacon        2014-11-17  1133  			return -ENOMEM;
fe4b991dcd84e0 Will Deacon        2014-11-17  1134  		}
fe4b991dcd84e0 Will Deacon        2014-11-17  1135  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1136  		/*
fe4b991dcd84e0 Will Deacon        2014-11-17  1137  		 * Initial sanity che=
cks.
fe4b991dcd84e0 Will Deacon        2014-11-17  1138  		 * Empty page tables =
shouldn't provide any translations.
fe4b991dcd84e0 Will Deacon        2014-11-17  1139  		 */
fe4b991dcd84e0 Will Deacon        2014-11-17  1140  		if (ops->iova_to_phys=
(ops, 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1141  			return __FAIL(ops, i=
);
fe4b991dcd84e0 Will Deacon        2014-11-17  1142  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1143  		if (ops->iova_to_phys=
(ops, SZ_1G + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1144  			return __FAIL(ops, i=
);
fe4b991dcd84e0 Will Deacon        2014-11-17  1145  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1146  		if (ops->iova_to_phys=
(ops, SZ_2G + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1147  			return __FAIL(ops, i=
);
fe4b991dcd84e0 Will Deacon        2014-11-17  1148  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1149  		/*
fe4b991dcd84e0 Will Deacon        2014-11-17  1150  		 * Distinct mappings =
of different granule sizes.
fe4b991dcd84e0 Will Deacon        2014-11-17  1151  		 */
fe4b991dcd84e0 Will Deacon        2014-11-17  1152  		iova =3D 0;
4ae8a5c528c0b1 Kefeng Wang        2016-09-21  1153  		for_each_set_bit(j, &=
cfg->pgsize_bitmap, BITS_PER_LONG) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1154  			size =3D 1UL << j;
fe4b991dcd84e0 Will Deacon        2014-11-17  1155  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1156  			if (ops->map(ops, io=
va, iova, size, IOMMU_READ |
fe4b991dcd84e0 Will Deacon        2014-11-17  1157  							    IOMMU_WRITE |
fe4b991dcd84e0 Will Deacon        2014-11-17  1158  							    IOMMU_NOEXEC=
 |
fe4b991dcd84e0 Will Deacon        2014-11-17  1159  							    IOMMU_CACHE))
fe4b991dcd84e0 Will Deacon        2014-11-17  1160  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1161  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1162  			/* Overlapping mappi=
ngs */
fe4b991dcd84e0 Will Deacon        2014-11-17  1163  			if (!ops->map(ops, i=
ova, iova + size, size,
fe4b991dcd84e0 Will Deacon        2014-11-17  1164  				      IOMMU_READ | =
IOMMU_NOEXEC))
fe4b991dcd84e0 Will Deacon        2014-11-17  1165  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1166  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1167  			if (ops->iova_to_phy=
s(ops, iova + 42) !=3D (iova + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1168  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1169  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1170  			iova +=3D SZ_1G;
fe4b991dcd84e0 Will Deacon        2014-11-17  1171  		}
fe4b991dcd84e0 Will Deacon        2014-11-17  1172  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1173  		/* Partial unmap */
fe4b991dcd84e0 Will Deacon        2014-11-17  1174  		size =3D 1UL << __ffs=
(cfg->pgsize_bitmap);
a2d3a382d6c682 Will Deacon        2019-07-02  1175  		if (ops->unmap(ops, S=
Z_1G + size, size, NULL) !=3D size)
fe4b991dcd84e0 Will Deacon        2014-11-17  1176  			return __FAIL(ops, i=
);
fe4b991dcd84e0 Will Deacon        2014-11-17  1177  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1178  		/* Remap of partial u=
nmap */
fe4b991dcd84e0 Will Deacon        2014-11-17  1179  		if (ops->map(ops, SZ_=
1G + size, size, size, IOMMU_READ))
fe4b991dcd84e0 Will Deacon        2014-11-17  1180  			return __FAIL(ops, i=
);
fe4b991dcd84e0 Will Deacon        2014-11-17  1181  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1182  		if (ops->iova_to_phys=
(ops, SZ_1G + size + 42) !=3D (size + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1183  			return __FAIL(ops, i=
);
fe4b991dcd84e0 Will Deacon        2014-11-17  1184  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1185  		/* Full unmap */
fe4b991dcd84e0 Will Deacon        2014-11-17 @1186  		iova =3D 0;
f793b13ef0c9c1 YueHaibing         2018-04-26  1187  		for_each_set_bit(j, &=
cfg->pgsize_bitmap, BITS_PER_LONG) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1188  			size =3D 1UL << j;
fe4b991dcd84e0 Will Deacon        2014-11-17  1189  =

a2d3a382d6c682 Will Deacon        2019-07-02  1190  			if (ops->unmap(ops, =
iova, size, NULL) !=3D size)
fe4b991dcd84e0 Will Deacon        2014-11-17  1191  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1192  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1193  			if (ops->iova_to_phy=
s(ops, iova + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1194  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1195  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1196  			/* Remap full block =
*/
fe4b991dcd84e0 Will Deacon        2014-11-17  1197  			if (ops->map(ops, io=
va, iova, size, IOMMU_WRITE))
fe4b991dcd84e0 Will Deacon        2014-11-17  1198  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1199  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1200  			if (ops->iova_to_phy=
s(ops, iova + 42) !=3D (iova + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1201  				return __FAIL(ops, =
i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1202  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1203  			iova +=3D SZ_1G;
fe4b991dcd84e0 Will Deacon        2014-11-17  1204  		}
fe4b991dcd84e0 Will Deacon        2014-11-17  1205  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1206  		free_io_pgtable_ops(o=
ps);
fe4b991dcd84e0 Will Deacon        2014-11-17  1207  	}
fe4b991dcd84e0 Will Deacon        2014-11-17  1208  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1209  	selftest_running =3D f=
alse;
fe4b991dcd84e0 Will Deacon        2014-11-17  1210  	return 0;
fe4b991dcd84e0 Will Deacon        2014-11-17  1211  }
fe4b991dcd84e0 Will Deacon        2014-11-17  1212  =

fe4b991dcd84e0 Will Deacon        2014-11-17  1213  static int __init arm_l=
pae_do_selftests(void)
fe4b991dcd84e0 Will Deacon        2014-11-17  1214  {
9062c1d0bedacf Christophe JAILLET 2019-09-09  1215  	static const unsigned =
long pgsize[] __initconst =3D {
fe4b991dcd84e0 Will Deacon        2014-11-17  1216  		SZ_4K | SZ_2M | SZ_1G,
fe4b991dcd84e0 Will Deacon        2014-11-17  1217  		SZ_16K | SZ_32M,
fe4b991dcd84e0 Will Deacon        2014-11-17  1218  		SZ_64K | SZ_512M,
fe4b991dcd84e0 Will Deacon        2014-11-17  1219  	};
fe4b991dcd84e0 Will Deacon        2014-11-17  1220  =

9062c1d0bedacf Christophe JAILLET 2019-09-09 @1221  	static const unsigned =
int ias[] __initconst =3D {

:::::: The code at line 1186 was first introduced by commit
:::::: fe4b991dcd84e0104cf2e29223a819335ed048a7 iommu: add self-consistency=
 tests to ARM LPAE IO page table allocator

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7174684795809350337==--

