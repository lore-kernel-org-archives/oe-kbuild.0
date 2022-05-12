Content-Type: multipart/mixed; boundary="===============3995498456333274688=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
Date: Fri, 13 May 2022 06:42:30 +0800
Message-ID: <202205130602.WiXLHsWw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3995498456333274688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220512144557.18025-2-yf.wang@mediatek.com>
References: <20220512144557.18025-2-yf.wang@mediatek.com>
TO: yf.wang(a)mediatek.com
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: "Isaac J. Manjarres" <isaacm@codeaurora.org>
TO: Georgi Djakov <quic_c_gdjako@quicinc.com>
TO: Yunfei Wang <yf.wang@mediatek.com>
TO: Sven Peter <sven@svenpeter.dev>
TO: "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.o=
rg>
TO: "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
TO: open list <linux-kernel@vger.kernel.org>
TO: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infra=
dead.org>
CC: wsd_upstream(a)mediatek.com
CC: Libo Kang <Libo.Kang@mediatek.com>
CC: Yong Wu <Yong.Wu@mediatek.com>
CC: Ning Li <ning.li@mediatek.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v5.18-rc6 next-20220512]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/yf-wang-mediatek-com=
/iommu-io-pgtable-arm-v7s-Add-a-quirk-to-allow-pgtable-PA-up-to-35bit/20220=
512-234603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-=
next/perf
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: nios2-randconfig-s032-20220512 (https://download.01.org/0day-ci/arc=
hive/20220513/202205130602.WiXLHsWw-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/916a5fc41cbb8ddfe34=
3193598f250d06b09e3fa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review yf-wang-mediatek-com/iommu-io-pgta=
ble-arm-v7s-Add-a-quirk-to-allow-pgtable-PA-up-to-35bit/20220512-234603
        git checkout 916a5fc41cbb8ddfe343193598f250d06b09e3fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ios2 SHELL=3D/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/io-pgtable-arm-v7s.c:886:25: sparse: sparse: shift too big=
 (32) for type unsigned long
>> drivers/iommu/io-pgtable-arm-v7s.c:886:25: sparse: sparse: shift count i=
s negative (-3)
>> drivers/iommu/io-pgtable-arm-v7s.c:886:25: sparse: sparse: shift too big=
 (32) for type unsigned long

vim +886 drivers/iommu/io-pgtable-arm-v7s.c

e5fc9753b1a831 Robin Murphy       2016-01-26  795  =

e5fc9753b1a831 Robin Murphy       2016-01-26  796  static struct io_pgtable=
 *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
e5fc9753b1a831 Robin Murphy       2016-01-26  797  						void *cookie)
e5fc9753b1a831 Robin Murphy       2016-01-26  798  {
916a5fc41cbb8d Yunfei Wang        2022-05-12  799  	slab_flags_t slab_flag =
=3D ARM_V7S_TABLE_SLAB_FLAGS;
e5fc9753b1a831 Robin Murphy       2016-01-26  800  	struct arm_v7s_io_pgtab=
le *data;
916a5fc41cbb8d Yunfei Wang        2022-05-12  801  	phys_addr_t paddr;
e5fc9753b1a831 Robin Murphy       2016-01-26  802  =

f3a8a46d714fd6 Yong Wu            2021-01-11  803  	if (cfg->ias > (arm_v7s=
_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
4c019de6532376 Yong Wu            2019-08-24  804  		return NULL;
4c019de6532376 Yong Wu            2019-08-24  805  =

40596d2f2b6075 Yong Wu            2021-01-11  806  	if (cfg->oas > (arm_v7s=
_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
e5fc9753b1a831 Robin Murphy       2016-01-26  807  		return NULL;
e5fc9753b1a831 Robin Murphy       2016-01-26  808  =

3850db49da8712 Robin Murphy       2016-02-12  809  	if (cfg->quirks & ~(IO_=
PGTABLE_QUIRK_ARM_NS |
3850db49da8712 Robin Murphy       2016-02-12  810  			    IO_PGTABLE_QUIRK_=
NO_PERMS |
916a5fc41cbb8d Yunfei Wang        2022-05-12  811  			    IO_PGTABLE_QUIRK_=
ARM_MTK_EXT |
916a5fc41cbb8d Yunfei Wang        2022-05-12  812  			    IO_PGTABLE_QUIRK_=
ARM_MTK_TTBR_EXT))
1afe23194d0580 Yong Wu            2016-03-14  813  		return NULL;
1afe23194d0580 Yong Wu            2016-03-14  814  =

1afe23194d0580 Yong Wu            2016-03-14  815  	/* If ARM_MTK_4GB is en=
abled, the NO_PERMS is also expected. */
73d50811bc91d2 Yong Wu            2019-08-24  816  	if (cfg->quirks & IO_PG=
TABLE_QUIRK_ARM_MTK_EXT &&
1afe23194d0580 Yong Wu            2016-03-14  817  	    !(cfg->quirks & IO_=
PGTABLE_QUIRK_NO_PERMS))
3850db49da8712 Robin Murphy       2016-02-12  818  			return NULL;
3850db49da8712 Robin Murphy       2016-02-12  819  =

e5fc9753b1a831 Robin Murphy       2016-01-26  820  	data =3D kmalloc(sizeof=
(*data), GFP_KERNEL);
e5fc9753b1a831 Robin Murphy       2016-01-26  821  	if (!data)
e5fc9753b1a831 Robin Murphy       2016-01-26  822  		return NULL;
e5fc9753b1a831 Robin Murphy       2016-01-26  823  =

119ff305b02793 Robin Murphy       2017-06-22  824  	spin_lock_init(&data->s=
plit_lock);
916a5fc41cbb8d Yunfei Wang        2022-05-12  825  	if (cfg->quirks & IO_PG=
TABLE_QUIRK_ARM_MTK_TTBR_EXT)
916a5fc41cbb8d Yunfei Wang        2022-05-12  826  		slab_flag =3D 0;
e5fc9753b1a831 Robin Murphy       2016-01-26  827  	data->l2_tables =3D kme=
m_cache_create("io-pgtable_armv7s_l2",
468ea0bfaecd09 Yong Wu            2021-01-11  828  					    ARM_V7S_TABLE_S=
IZE(2, cfg),
468ea0bfaecd09 Yong Wu            2021-01-11  829  					    ARM_V7S_TABLE_S=
IZE(2, cfg),
916a5fc41cbb8d Yunfei Wang        2022-05-12  830  					    slab_flag, NULL=
);
e5fc9753b1a831 Robin Murphy       2016-01-26  831  	if (!data->l2_tables)
e5fc9753b1a831 Robin Murphy       2016-01-26  832  		goto out_free_data;
e5fc9753b1a831 Robin Murphy       2016-01-26  833  =

e5fc9753b1a831 Robin Murphy       2016-01-26  834  	data->iop.ops =3D (stru=
ct io_pgtable_ops) {
e5fc9753b1a831 Robin Murphy       2016-01-26  835  		.map		=3D arm_v7s_map,
23c30bed9c3c90 Isaac J. Manjarres 2021-06-16  836  		.map_pages	=3D arm_v7s=
_map_pages,
e5fc9753b1a831 Robin Murphy       2016-01-26  837  		.unmap		=3D arm_v7s_un=
map,
f13eabcf9dfad9 Isaac J. Manjarres 2021-06-16  838  		.unmap_pages	=3D arm_v=
7s_unmap_pages,
e5fc9753b1a831 Robin Murphy       2016-01-26  839  		.iova_to_phys	=3D arm_=
v7s_iova_to_phys,
e5fc9753b1a831 Robin Murphy       2016-01-26  840  	};
e5fc9753b1a831 Robin Murphy       2016-01-26  841  =

e5fc9753b1a831 Robin Murphy       2016-01-26  842  	/* We have to do this e=
arly for __arm_v7s_alloc_table to work... */
e5fc9753b1a831 Robin Murphy       2016-01-26  843  	data->iop.cfg =3D *cfg;
e5fc9753b1a831 Robin Murphy       2016-01-26  844  =

e5fc9753b1a831 Robin Murphy       2016-01-26  845  	/*
e5fc9753b1a831 Robin Murphy       2016-01-26  846  	 * Unless the IOMMU dri=
ver indicates supersection support by
e5fc9753b1a831 Robin Murphy       2016-01-26  847  	 * having SZ_16M set in=
 the initial bitmap, they won't be used.
e5fc9753b1a831 Robin Murphy       2016-01-26  848  	 */
e5fc9753b1a831 Robin Murphy       2016-01-26  849  	cfg->pgsize_bitmap &=3D=
 SZ_4K | SZ_64K | SZ_1M | SZ_16M;
e5fc9753b1a831 Robin Murphy       2016-01-26  850  =

fb485eb18e632f Robin Murphy       2019-10-25  851  	/* TCR: T0SZ=3D0, EAE=
=3D0 (if applicable) */
fb485eb18e632f Robin Murphy       2019-10-25  852  	cfg->arm_v7s_cfg.tcr =
=3D 0;
e5fc9753b1a831 Robin Murphy       2016-01-26  853  =

e5fc9753b1a831 Robin Murphy       2016-01-26  854  	/*
e5fc9753b1a831 Robin Murphy       2016-01-26  855  	 * TEX remap: the indic=
es used map to the closest equivalent types
e5fc9753b1a831 Robin Murphy       2016-01-26  856  	 * under the non-TEX-re=
map interpretation of those attribute bits,
e5fc9753b1a831 Robin Murphy       2016-01-26  857  	 * excepting various im=
plementation-defined aspects of shareability.
e5fc9753b1a831 Robin Murphy       2016-01-26  858  	 */
e5fc9753b1a831 Robin Murphy       2016-01-26  859  	cfg->arm_v7s_cfg.prrr =
=3D ARM_V7S_PRRR_TR(1, ARM_V7S_PRRR_TYPE_DEVICE) |
e5fc9753b1a831 Robin Murphy       2016-01-26  860  				ARM_V7S_PRRR_TR(4, A=
RM_V7S_PRRR_TYPE_NORMAL) |
e5fc9753b1a831 Robin Murphy       2016-01-26  861  				ARM_V7S_PRRR_TR(7, A=
RM_V7S_PRRR_TYPE_NORMAL) |
e5fc9753b1a831 Robin Murphy       2016-01-26  862  				ARM_V7S_PRRR_DS0 | A=
RM_V7S_PRRR_DS1 |
e5fc9753b1a831 Robin Murphy       2016-01-26  863  				ARM_V7S_PRRR_NS1 | A=
RM_V7S_PRRR_NOS(7);
e5fc9753b1a831 Robin Murphy       2016-01-26  864  	cfg->arm_v7s_cfg.nmrr =
=3D ARM_V7S_NMRR_IR(7, ARM_V7S_RGN_WBWA) |
e5fc9753b1a831 Robin Murphy       2016-01-26  865  				ARM_V7S_NMRR_OR(7, A=
RM_V7S_RGN_WBWA);
e5fc9753b1a831 Robin Murphy       2016-01-26  866  =

e5fc9753b1a831 Robin Murphy       2016-01-26  867  	/* Looking good; alloca=
te a pgd */
e5fc9753b1a831 Robin Murphy       2016-01-26  868  	data->pgd =3D __arm_v7s=
_alloc_table(1, GFP_KERNEL, data);
e5fc9753b1a831 Robin Murphy       2016-01-26  869  	if (!data->pgd)
e5fc9753b1a831 Robin Murphy       2016-01-26  870  		goto out_free_data;
e5fc9753b1a831 Robin Murphy       2016-01-26  871  =

e5fc9753b1a831 Robin Murphy       2016-01-26  872  	/* Ensure the empty pgd=
 is visible before any actual TTBR write */
e5fc9753b1a831 Robin Murphy       2016-01-26  873  	wmb();
e5fc9753b1a831 Robin Murphy       2016-01-26  874  =

d1e5f26f14272b Robin Murphy       2019-10-25  875  	/* TTBR */
916a5fc41cbb8d Yunfei Wang        2022-05-12  876  	paddr =3D virt_to_phys(=
data->pgd);
916a5fc41cbb8d Yunfei Wang        2022-05-12  877  	cfg->arm_v7s_cfg.ttbr =
=3D paddr | ARM_V7S_TTBR_S |
7618e479098226 Robin Murphy       2020-01-10  878  				(cfg->coherent_walk =
? (ARM_V7S_TTBR_NOS |
7618e479098226 Robin Murphy       2020-01-10  879  				 ARM_V7S_TTBR_IRGN_A=
TTR(ARM_V7S_RGN_WBWA) |
9e6ea59f3ff371 Bjorn Andersson    2019-05-15  880  				 ARM_V7S_TTBR_ORGN_A=
TTR(ARM_V7S_RGN_WBWA)) :
9e6ea59f3ff371 Bjorn Andersson    2019-05-15  881  				(ARM_V7S_TTBR_IRGN_A=
TTR(ARM_V7S_RGN_NC) |
9e6ea59f3ff371 Bjorn Andersson    2019-05-15  882  				 ARM_V7S_TTBR_ORGN_A=
TTR(ARM_V7S_RGN_NC)));
916a5fc41cbb8d Yunfei Wang        2022-05-12  883  =

916a5fc41cbb8d Yunfei Wang        2022-05-12  884  	if (cfg->quirks & IO_PG=
TABLE_QUIRK_ARM_MTK_TTBR_EXT)
916a5fc41cbb8d Yunfei Wang        2022-05-12  885  		cfg->arm_v7s_cfg.ttbr =
=3D
916a5fc41cbb8d Yunfei Wang        2022-05-12 @886  			ARM_V7S_TTBR_35BIT_PA=
(cfg->arm_v7s_cfg.ttbr, paddr);
e5fc9753b1a831 Robin Murphy       2016-01-26  887  	return &data->iop;
e5fc9753b1a831 Robin Murphy       2016-01-26  888  =

e5fc9753b1a831 Robin Murphy       2016-01-26  889  out_free_data:
e5fc9753b1a831 Robin Murphy       2016-01-26  890  	kmem_cache_destroy(data=
->l2_tables);
e5fc9753b1a831 Robin Murphy       2016-01-26  891  	kfree(data);
e5fc9753b1a831 Robin Murphy       2016-01-26  892  	return NULL;
e5fc9753b1a831 Robin Murphy       2016-01-26  893  }
e5fc9753b1a831 Robin Murphy       2016-01-26  894  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3995498456333274688==--

