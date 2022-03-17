Content-Type: multipart/mixed; boundary="===============7964717214957659440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 03/11] habanalabs: change mmu_get_real_page_size to be ASIC-specific
Date: Thu, 17 Mar 2022 15:00:32 +0800
Message-ID: <202203171437.0m4BxdYd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7964717214957659440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220316114129.2520107-3-ogabbay@kernel.org>
References: <20220316114129.2520107-3-ogabbay@kernel.org>
TO: Oded Gabbay <ogabbay@kernel.org>

Hi Oded,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on next-20220316]
[cannot apply to linux/master linus/master v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oded-Gabbay/habanalabs-set=
-non-0-value-in-dram-default-page-size/20220316-194323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t d6cd2f85931f87dbd07c664c9c6e806db1dd7c75
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220317/202203171437.0m4BxdYd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/9535025e314bc12dbdeebee7c=
71634699759bcfa
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Oded-Gabbay/habanalabs-set-non-0-v=
alue-in-dram-default-page-size/20220316-194323
        git checkout 9535025e314bc12dbdeebee7c71634699759bcfa
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/iio/dac/ad5761.c:63:8: warning: Excessive padding in 'struct ad5=
761_state' (67 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   data, =

   vref, =

   spi, =

   vref_reg, =

   lock, =

   range, =

   use_intref, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5761_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5761.c:63:8: note: Excessive padding in 'struct ad5761=
_state' (67 padding bytes, where 3 is optimal). Optimal fields order: data,=
 vref, spi, vref_reg, lock, range, use_intref, consider reordering the fiel=
ds or adding explicit padding members
   struct ad5761_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/misc/genwqe/card_base.c:522:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/misc/genwqe/card_base.c:522:3: note: Value stored to 'err' is ne=
ver read
                   err =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/misc/genwqe/card_base.c:921:3: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D wait_event_interruptible_timeout(cd->health_waitq,
                   ^
   drivers/misc/genwqe/card_base.c:921:3: note: Value stored to 'rc' is nev=
er read
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/misc/habanalabs/common/mmu/mmu.c:220:2: warning: Value stored to=
 'prop' is never read [clang-analyzer-deadcode.DeadStores]
           prop =3D &hdev->asic_prop;
           ^      ~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu.c:220:2: note: Value stored to 'p=
rop' is never read
           prop =3D &hdev->asic_prop;
           ^      ~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu.c:287:2: warning: Value stored to=
 'prop' is never read [clang-analyzer-deadcode.DeadStores]
           prop =3D &hdev->asic_prop;
           ^      ~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu.c:287:2: note: Value stored to 'p=
rop' is never read
           prop =3D &hdev->asic_prop;
           ^      ~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (2 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:381:2: warning: Value stored=
 to 'hop2_pte_addr' is never read [clang-analyzer-deadcode.DeadStores]
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:381:2: note: Value stored to=
 'hop2_pte_addr' is never read
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/iio/frequency/ad9523.c:266:8: warning: Excessive padding in 'str=
uct ad9523_state' (110 padding bytes, where 46 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg, =

   pdata, =

   pwrdown_gpio, =

   reset_gpio, =

   sync_gpio, =

   vcxo_freq, =

   vco_freq, =

   vco_out_freq, =

   lock, =

   ad9523_channels, =

   vco_out_map, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad9523_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/frequency/ad9523.c:266:8: note: Excessive padding in 'struct=
 ad9523_state' (110 padding bytes, where 46 is optimal). Optimal fields ord=
er: data, spi, reg, pdata, pwrdown_gpio, reset_gpio, sync_gpio, vcxo_freq, =
vco_freq, vco_out_freq, lock, ad9523_channels, vco_out_map, consider reorde=
ring the fields or adding explicit padding members
   struct ad9523_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/iio/frequency/adf4350.c:33:8: warning: Excessive padding in 'str=
uct adf4350_state' (100 padding bytes, where 36 is optimal). =

   Optimal fields order: =

   val, =

   r0_fract, =

   spi, =

   reg, =

   lock_detect_gpiod, =

   pdata, =

   clk, =

   clkin, =

   chspc, =

   fpfd, =

   min_out_freq, =

   freq_req, =

   regs, =

   regs_hw, =

   lock, =

   r0_int, =

   r1_mod, =

   r4_rf_div_sel, =


vim +/prop +220 drivers/misc/habanalabs/common/mmu/mmu.c

9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  184  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  185  /*
5c05487f155093 drivers/misc/habanalabs/common/mmu.c     Ofir Bitton    2020=
-10-22  186   * hl_mmu_unmap_page - unmaps a virtual addr
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  187   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  188   * @ctx: pointer to the context structure
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  189   * @virt_addr: virt addr to map from
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  190   * @page_size: size of the page to unmap
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  191   * @flush_pte: whether to do a PCI flush
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  192   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  193   * This function does the following:
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  194   * - Check that the virt addr is mapped
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  195   * - Unmap the virt addr and frees pgts if possible
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  196   * - Returns 0 on success, -EINVAL if the given addr is not ma=
pped
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  197   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  198   * Because this function changes the page tables in the device=
 and because it
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  199   * changes the MMU hash, it must be protected by a lock.
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  200   * However, because it maps only a single page, the lock shoul=
d be implemented
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  201   * in a higher level in order to protect the entire mapping of=
 the memory area
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  202   *
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  203   * For optimization reasons PCI flush may be requested once af=
ter unmapping of
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  204   * large area.
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  205   */
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  206  int hl_mmu_unmap_page(struct hl_ctx *ctx, u64 virt_addr, u32 p=
age_size, bool flush_pte)
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  207  {
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  208  	struct hl_device *hdev =3D ctx->hdev;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  209  	struct asic_fixed_properties *prop;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  210  	struct hl_mmu_properties *mmu_prop;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  211  	struct hl_mmu_funcs *mmu_funcs;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  212  	int i, pgt_residency, rc =3D 0;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  213  	u32 real_page_size, npages;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  214  	u64 real_virt_addr;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  215  	bool is_dram_addr;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  216  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  217  	if (!hdev->mmu_enable)
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  218  		return 0;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  219  =

9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16 @220  	prop =3D &hdev->asic_prop;
9488307a555925 drivers/misc/habanalabs/common/mmu.c     Oded Gabbay    2021=
-01-11  221  	is_dram_addr =3D hl_is_dram_va(hdev, virt_addr);
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  222  	mmu_prop =3D hl_mmu_get_prop(hdev, page_size, is_dram_addr);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  223  =

ccf979ee330b19 drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-10-05  224  	pgt_residency =3D mmu_prop->host_resident ? MMU_HR_PGT : MMU_=
DR_PGT;
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  225  	mmu_funcs =3D hl_mmu_get_funcs(hdev, pgt_residency, is_dram_a=
ddr);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  226  =

9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  227  	rc =3D hdev->asic_funcs->mmu_get_real_page_size(hdev, mmu_pro=
p, page_size, &real_page_size,
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  228  							is_dram_addr);
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  229  	if (rc)
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  230  		return rc;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  231  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  232  	npages =3D page_size / real_page_size;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  233  	real_virt_addr =3D virt_addr;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  234  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  235  	for (i =3D 0 ; i < npages ; i++) {
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  236  		rc =3D mmu_funcs->unmap(ctx, real_virt_addr, is_dram_addr);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  237  		if (rc)
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  238  			break;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  239  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  240  		real_virt_addr +=3D real_page_size;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  241  	}
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  242  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  243  	if (flush_pte)
9535025e314bc1 drivers/misc/habanalabs/common/mmu/mmu.c Ohad Sharabi   2022=
-03-16  244  		mmu_funcs->flush(ctx);
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  245  =

d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  246  	return rc;
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  247  }
d83fe66928b2ff drivers/misc/habanalabs/common/mmu.c     Moti Haimovski 2020=
-08-12  248  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7964717214957659440==--

