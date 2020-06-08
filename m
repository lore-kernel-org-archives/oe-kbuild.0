Content-Type: multipart/mixed; boundary="===============7980502355775289817=="
MIME-Version: 1.0
From: Xia, Hui <hui.xia@intel.com>
Subject: Re: [PATCH 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Date: Mon, 08 Jun 2020 07:55:40 +0000
Message-ID: <MN2PR11MB4064D605B1C71ACA7E108C3BE5850@MN2PR11MB4064.namprd11.prod.outlook.com>
In-Reply-To: <202006081550.FOXQ2ecj%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7980502355775289817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Need to report.

>-----Original Message-----
>From: kernel test robot <lkp@intel.com>
>Sent: 2020=E5=B9=B46=E6=9C=888=E6=97=A5 15:34
>To: kbuild(a)lists.01.org
>Cc: lkp <lkp@intel.com>
>Subject: [kbuild] Re: [PATCH 2/2] iommu: Add gfp parameter to io_pgtable_o=
ps-
>>map()
>
>CC: kbuild-all(a)lists.01.org
>In-Reply-To:
><837d7131e83b06ce222bda678fe2e8ac7ba095f2.1591587029.git.baolin.wang@l
>inux.alibaba.com>
>References:
><837d7131e83b06ce222bda678fe2e8ac7ba095f2.1591587029.git.baolin.wang@l
>inux.alibaba.com>
>TO: Baolin Wang <baolin.wang@linux.alibaba.com>
>TO: joro(a)8bytes.org
>TO: will(a)kernel.org
>TO: robin.murphy(a)arm.com
>TO: agross(a)kernel.org
>TO: bjorn.andersson(a)linaro.org
>TO: matthias.bgg(a)gmail.com
>TO: robdclark(a)gmail.com
>TO: robh(a)kernel.org
>TO: tomeu.vizoso(a)collabora.com
>TO: steven.price(a)arm.com
>
>Hi Baolin,
>
>I love your patch! Perhaps something to improve:
>
>[auto build test WARNING on iommu/next]
>[also build test WARNING on soc/for-next linus/master v5.7 next-20200605] =
[if
>your patch is applied to the wrong git tree, please drop us a note to help=
 improve
>the system. BTW, we also suggest to use '--base' option to specify the bas=
e tree
>in git format-patch, please see https://stackoverflow.com/a/37406982]
>
>url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/Some-
>improvements-for-iommu/20200608-114141
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
>:::::: branch date: 4 hours ago
>:::::: commit date: 4 hours ago
>config: i386-randconfig-s001-20200608 (attached as .config)
>compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
>reproduce:
>        # apt-get install sparse
>        # sparse version: v0.6.1-247-gcadbd124-dirty
>        # save the attached .config to linux build tree
>        make W=3D1 C=3D1 ARCH=3Di386 CF=3D'-fdiagnostic-prefix -D__CHECK_E=
NDIAN__'
>
>If you fix the issue, kindly add following tag as appropriate
>Reported-by: kernel test robot <lkp@intel.com>
>
>
>sparse warnings: (new ones prefixed by >>)
>
>>> drivers/iommu/io-pgtable-arm-v7s.c:922:29: sparse: sparse: not enough
>>> arguments for function map
>   drivers/iommu/io-pgtable-arm-v7s.c:929:30: sparse: sparse: not enough
>arguments for function map
>   drivers/iommu/io-pgtable-arm-v7s.c:949:29: sparse: sparse: not enough
>arguments for function map
>   drivers/iommu/io-pgtable-arm-v7s.c:970:29: sparse: sparse: not enough
>arguments for function map
>
># https://github.com/0day-
>ci/linux/commit/6047fa5558b1fdb8d2d52c9807fd960220478d3d
>git remote add linux-review https://github.com/0day-ci/linux git remote up=
date
>linux-review git checkout 6047fa5558b1fdb8d2d52c9807fd960220478d3d
>vim +922 drivers/iommu/io-pgtable-arm-v7s.c
>
>e5fc9753b1a831 Robin Murphy 2016-01-26  878
>e5fc9753b1a831 Robin Murphy 2016-01-26  879  static int __init
>arm_v7s_do_selftests(void)
>e5fc9753b1a831 Robin Murphy 2016-01-26  880  {
>e5fc9753b1a831 Robin Murphy 2016-01-26  881  	struct io_pgtable_ops
>*ops;
>e5fc9753b1a831 Robin Murphy 2016-01-26  882  	struct io_pgtable_cfg
>cfg =3D {
>e5fc9753b1a831 Robin Murphy 2016-01-26  883  		.tlb =3D
>&dummy_tlb_ops,
>e5fc9753b1a831 Robin Murphy 2016-01-26  884  		.oas =3D 32,
>e5fc9753b1a831 Robin Murphy 2016-01-26  885  		.ias =3D 32,
>4f41845b340783 Will Deacon  2019-06-25  886  		.coherent_walk =3D true,
>4f41845b340783 Will Deacon  2019-06-25  887  		.quirks =3D
>IO_PGTABLE_QUIRK_ARM_NS,
>e5fc9753b1a831 Robin Murphy 2016-01-26  888  		.pgsize_bitmap
>=3D SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>e5fc9753b1a831 Robin Murphy 2016-01-26  889  	};
>e5fc9753b1a831 Robin Murphy 2016-01-26  890  	unsigned int iova, size,
>iova_start;
>e5fc9753b1a831 Robin Murphy 2016-01-26  891  	unsigned int i, loopnr =3D
>0;
>e5fc9753b1a831 Robin Murphy 2016-01-26  892
>e5fc9753b1a831 Robin Murphy 2016-01-26  893  	selftest_running =3D true;
>e5fc9753b1a831 Robin Murphy 2016-01-26  894
>e5fc9753b1a831 Robin Murphy 2016-01-26  895  	cfg_cookie =3D &cfg;
>e5fc9753b1a831 Robin Murphy 2016-01-26  896
>e5fc9753b1a831 Robin Murphy 2016-01-26  897  	ops =3D
>alloc_io_pgtable_ops(ARM_V7S, &cfg, &cfg);
>e5fc9753b1a831 Robin Murphy 2016-01-26  898  	if (!ops) {
>e5fc9753b1a831 Robin Murphy 2016-01-26  899  		pr_err("selftest:
>failed to allocate io pgtable ops\n");
>e5fc9753b1a831 Robin Murphy 2016-01-26  900  		return -EINVAL;
>e5fc9753b1a831 Robin Murphy 2016-01-26  901  	}
>e5fc9753b1a831 Robin Murphy 2016-01-26  902
>e5fc9753b1a831 Robin Murphy 2016-01-26  903  	/*
>e5fc9753b1a831 Robin Murphy 2016-01-26  904  	 * Initial sanity checks.
>e5fc9753b1a831 Robin Murphy 2016-01-26  905  	 * Empty page tables
>shouldn't provide any translations.
>e5fc9753b1a831 Robin Murphy 2016-01-26  906  	 */
>e5fc9753b1a831 Robin Murphy 2016-01-26  907  	if (ops-
>>iova_to_phys(ops, 42))
>e5fc9753b1a831 Robin Murphy 2016-01-26  908  		return
>__FAIL(ops);
>e5fc9753b1a831 Robin Murphy 2016-01-26  909
>e5fc9753b1a831 Robin Murphy 2016-01-26  910  	if (ops-
>>iova_to_phys(ops, SZ_1G + 42))
>e5fc9753b1a831 Robin Murphy 2016-01-26  911  		return
>__FAIL(ops);
>e5fc9753b1a831 Robin Murphy 2016-01-26  912
>e5fc9753b1a831 Robin Murphy 2016-01-26  913  	if (ops-
>>iova_to_phys(ops, SZ_2G + 42))
>e5fc9753b1a831 Robin Murphy 2016-01-26  914  		return
>__FAIL(ops);
>e5fc9753b1a831 Robin Murphy 2016-01-26  915
>e5fc9753b1a831 Robin Murphy 2016-01-26  916  	/*
>e5fc9753b1a831 Robin Murphy 2016-01-26  917  	 * Distinct mappings of
>different granule sizes.
>e5fc9753b1a831 Robin Murphy 2016-01-26  918  	 */
>e5fc9753b1a831 Robin Murphy 2016-01-26  919  	iova =3D 0;
>4ae8a5c528c0b1 Kefeng Wang  2016-09-21  920  	for_each_set_bit(i,
>&cfg.pgsize_bitmap, BITS_PER_LONG) {
>e5fc9753b1a831 Robin Murphy 2016-01-26  921  		size =3D 1UL << i;
>e5fc9753b1a831 Robin Murphy 2016-01-26 @922  		if (ops-
>>map(ops, iova, iova, size, IOMMU_READ |
>
>:::::: The code at line 922 was first introduced by commit
>:::::: e5fc9753b1a831466be9b45d0bf926eeaa8b84a0 iommu/io-pgtable: Add
>ARMv7 short descriptor support
>
>:::::: TO: Robin Murphy <robin.murphy@arm.com>
>:::::: CC: Will Deacon <will.deacon@arm.com>
>
>---
>0-DAY CI Kernel Test Service, Intel Corporation
>https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7980502355775289817==--

