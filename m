Content-Type: multipart/mixed; boundary="===============2737859012927311822=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V3] mmc: sdhci-msm: Reset GCC_SDCC_BCR register for SDHC
Date: Thu, 07 Apr 2022 07:31:49 +0800
Message-ID: <202204070708.sE7Ed67N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2737859012927311822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1648710182-31899-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1648710182-31899-1-git-send-email-quic_c_sbhanu@quicinc.com>
TO: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
TO: adrian.hunter(a)intel.com
TO: ulf.hansson(a)linaro.org
TO: robh+dt(a)kernel.org
CC: quic_asutoshd(a)quicinc.com
CC: quic_rampraka(a)quicinc.com
CC: quic_pragalla(a)quicinc.com
CC: quic_sartgarg(a)quicinc.com
CC: quic_nitirawa(a)quicinc.com
CC: quic_sayalil(a)quicinc.com
CC: agross(a)kernel.org
CC: bjorn.andersson(a)linaro.org
CC: krzysztof.kozlowski(a)canonical.com
CC: linux-arm-msm(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>

Hi Shaik,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next linux/master v5.18-=
rc1 next-20220406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Shaik-Sajida-Bhanu/m=
mc-sdhci-msm-Reset-GCC_SDCC_BCR-register-for-SDHC/20220331-150338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
787af64d05cd528aac9ad16752d11bb1c6061bb9
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220405 (https://download.01.org/0day-ci/arc=
hive/20220407/202204070708.sE7Ed67N-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/667fad5561c9ebaeed5=
137640c6cbe75fa020a42
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shaik-Sajida-Bhanu/mmc-sdhci-msm-R=
eset-GCC_SDCC_BCR-register-for-SDHC/20220331-150338
        git checkout 667fad5561c9ebaeed5137640c6cbe75fa020a42
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/omap_hsmmc.c:821:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&host->irq_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/omap_hsmmc.c:828:6: note: Assuming field 'data' is null
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
               ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:828:16: note: Left side of '&&' is false
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
                         ^
   drivers/mmc/host/omap_hsmmc.c:830:2: note: Null pointer value stored to =
field 'mrq'
           host->mrq =3D NULL;
           ^~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:864:3: note: Returning from 'omap_hsmmc_re=
quest_done'
                   omap_hsmmc_request_done(host, data->mrq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1060:3: note: Returning from 'omap_hsmmc_x=
fer_done'
                   omap_hsmmc_xfer_done(host, data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1074:4: note: Returning from 'omap_hsmmc_d=
o_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1076:7: note: Assuming the condition is fa=
lse
                   if (status & CIRQ_EN)
                       ^~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1076:3: note: Taking false branch
                   if (status & CIRQ_EN)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1072:2: note: Loop condition is true.  Ent=
ering loop body
           while (status & (INT_EN_MASK | CIRQ_EN)) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1073:7: note: Assuming field 'req_in_progr=
ess' is not equal to 0
                   if (host->req_in_progress)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1073:3: note: Taking true branch
                   if (host->req_in_progress)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1074:4: note: Calling 'omap_hsmmc_do_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1023:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "IRQ Status is %x\n", status);
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/omap_hsmmc.c:1025:6: note: Assuming the condition is fa=
lse
           if (status & ERR_EN) {
               ^~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1025:2: note: Taking false branch
           if (status & ERR_EN) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1057:6: note: 'end_cmd' is 0
           if (end_cmd || ((status & CC_EN) && host->cmd))
               ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:6: note: Left side of '||' is false
   drivers/mmc/host/omap_hsmmc.c:1057:19: note: Assuming the condition is t=
rue
           if (end_cmd || ((status & CC_EN) && host->cmd))
                            ^~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:18: note: Left side of '&&' is true
           if (end_cmd || ((status & CC_EN) && host->cmd))
                           ^
   drivers/mmc/host/omap_hsmmc.c:1057:38: note: Assuming field 'cmd' is non=
-null
           if (end_cmd || ((status & CC_EN) && host->cmd))
                                               ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:2: note: Taking true branch
           if (end_cmd || ((status & CC_EN) && host->cmd))
           ^
   drivers/mmc/host/omap_hsmmc.c:1058:3: note: Calling 'omap_hsmmc_cmd_done'
                   omap_hsmmc_cmd_done(host, host->cmd);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:873:6: note: Access to field 'sbc' results=
 in a dereference of a null pointer (loaded from field 'mrq')
           if (host->mrq->sbc && (host->cmd =3D=3D host->mrq->sbc) &&
               ^     ~~~
   drivers/mmc/host/omap_hsmmc.c:945:8: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "MMC IRQ 0x%x :", status);
                 ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:945:8: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(buf, "MMC IRQ 0x%x :", status);
                 ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:950:10: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                           len =3D sprintf(buf, " %s", omap_hsmmc_status_bi=
ts[i]);
                                 ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:950:10: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                           len =3D sprintf(buf, " %s", omap_hsmmc_status_bi=
ts[i]);
                                 ^~~~~~~
   Suppressed 53 warnings (46 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/mmc/host/sdhci-bcm-kona.c:222:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/mmc/host/sdhci-bcm-kona.c:222:2: note: Value stored to 'ret' is =
never read
           ret =3D 0;
           ^     ~
   Suppressed 53 warnings (46 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
>> drivers/mmc/host/sdhci-msm.c:257:8: warning: Excessive padding in 'struc=
t sdhci_msm_host' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   pdev, =

   core_mem, =

   ice_mem, =

   bus_clk, =

   xo_clk, =

   clk_rate, =

   mmc, =

   var_ops, =

   offset, =

   core_reset, =

   bulk_clks, =

   pwr_irq_wait, =

   pwr_irq, =

   curr_pwr_state, =

   curr_io_level, =

   caps_0, =

   transfer_mode, =

   dll_config, =

   ddr_config, =

   use_14lpp_dll_reset, =

   tuning_done, =

   calibration_done, =

   saved_tuning_phase, =

   use_cdclp533, =

   pwr_irq_flag, =

   mci_removed, =

   restore_dll_config, =

   use_cdr, =

   updated_ddr_cfg, =

   uses_tassadar_dll, =

   vqmmc_enabled, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sdhci_msm_host {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:257:8: note: Excessive padding in 'struct s=
dhci_msm_host' (32 padding bytes, where 0 is optimal). Optimal fields order=
: pdev, core_mem, ice_mem, bus_clk, xo_clk, clk_rate, mmc, var_ops, offset,=
 core_reset, bulk_clks, pwr_irq_wait, pwr_irq, curr_pwr_state, curr_io_leve=
l, caps_0, transfer_mode, dll_config, ddr_config, use_14lpp_dll_reset, tuni=
ng_done, calibration_done, saved_tuning_phase, use_cdclp533, pwr_irq_flag, =
mci_removed, restore_dll_config, use_cdr, updated_ddr_cfg, uses_tassadar_dl=
l, vqmmc_enabled, consider reordering the fields or adding explicit padding=
 members
   struct sdhci_msm_host {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:687:16: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
                           mclk_freq =3D DIV_ROUND_CLOSEST_ULL((host->clock=
 * 8),
                                       ^
   include/linux/math.h:105:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem =3D ((uint64_t)(n)) % __base;                       \
                   ~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/mmc/host/sdhci-msm.c:627:23: note: 'xo_clk' initialized to 0
           unsigned long flags, xo_clk =3D 0;
                                ^~~~~~
   drivers/mmc/host/sdhci-msm.c:632:6: note: Assuming field 'use_14lpp_dll_=
reset' is false
           if (msm_host->use_14lpp_dll_reset && !IS_ERR_OR_NULL(msm_host->x=
o_clk))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:632:36: note: Left side of '&&' is false
           if (msm_host->use_14lpp_dll_reset && !IS_ERR_OR_NULL(msm_host->x=
o_clk))
                                             ^
   drivers/mmc/host/sdhci-msm.c:635:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&host->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/mmc/host/sdhci-msm.c:635:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&host->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/sdhci-msm.c:642:11: note: Loop condition is false.  Exi=
ting loop
           config =3D readl_relaxed(host->ioaddr + msm_offset->core_vendor_=
spec);
                    ^
   arch/riscv/include/asm/mmio.h:116:38: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                               ^
   arch/riscv/include/asm/mmio.h:109:21: note: expanded from macro '__io_rb=
r'
   #define __io_rbr()              do {} while (0)
                                   ^
   drivers/mmc/host/sdhci-msm.c:642:11: note: Loop condition is false.  Exi=
ting loop
           config =3D readl_relaxed(host->ioaddr + msm_offset->core_vendor_=
spec);
                    ^
   arch/riscv/include/asm/mmio.h:116:70: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                                                           =
    ^
   arch/riscv/include/asm/mmio.h:110:21: note: expanded from macro '__io_ra=
r'
   #define __io_rar()              do {} while (0)
                                   ^
   drivers/mmc/host/sdhci-msm.c:644:2: note: Loop condition is false.  Exit=
ing loop
           writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_sp=
ec);
           ^
   arch/riscv/include/asm/mmio.h:120:33: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __i=
o_raw(); })
                                      ^
   arch/riscv/include/asm/mmio.h:111:21: note: expanded from macro '__io_rb=
w'
   #define __io_rbw()              do {} while (0)
                                   ^
   drivers/mmc/host/sdhci-msm.c:644:2: note: Loop condition is false.  Exit=
ing loop
           writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_sp=
ec);

vim +257 drivers/mmc/host/sdhci-msm.c

6ed4bb4387033a Vijay Viswanath          2018-06-19  256  =

0eb0d9f4de34a7 Georgi Djakov            2014-03-10 @257  struct sdhci_msm_h=
ost {
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  258  	struct platform_d=
evice *pdev;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  259  	void __iomem *cor=
e_mem;	/* MSM SDCC mapped address */
c93767cf64ebf4 Eric Biggers             2021-01-25  260  	void __iomem *ice=
_mem;	/* MSM ICE mapped address (if available) */
ad81d387100454 Georgi Djakov            2016-06-24  261  	int pwr_irq;		/* =
power irq */
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  262  	struct clk *bus_c=
lk;	/* SDHC bus voter clock */
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  263  	struct clk *xo_cl=
k;	/* TCXO clk needed for FLL feature of cm_dll*/
c93767cf64ebf4 Eric Biggers             2021-01-25  264  	/* core, iface, c=
al, sleep, and ice clocks */
c93767cf64ebf4 Eric Biggers             2021-01-25  265  	struct clk_bulk_d=
ata bulk_clks[5];
edc609fd19e1cd Ritesh Harjani           2016-11-21  266  	unsigned long clk=
_rate;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  267  	struct mmc_host *=
mmc;
83736352e0caaa Venkat Gopalakrishnan    2016-11-21  268  	bool use_14lpp_dl=
l_reset;
ff06ce417828b9 Venkat Gopalakrishnan    2016-11-21  269  	bool tuning_done;
ff06ce417828b9 Venkat Gopalakrishnan    2016-11-21  270  	bool calibration_=
done;
abf270e5c62610 Ritesh Harjani           2016-11-21  271  	u8 saved_tuning_p=
hase;
02e4293dc01362 Ritesh Harjani           2016-11-21  272  	bool use_cdclp533;
c0309b3803fed9 Vijay Viswanath          2017-09-27  273  	u32 curr_pwr_stat=
e;
c0309b3803fed9 Vijay Viswanath          2017-09-27  274  	u32 curr_io_level;
c0309b3803fed9 Vijay Viswanath          2017-09-27  275  	wait_queue_head_t=
 pwr_irq_wait;
c0309b3803fed9 Vijay Viswanath          2017-09-27  276  	bool pwr_irq_flag;
ac06fba1de8fb2 Vijay Viswanath          2018-04-20  277  	u32 caps_0;
6ed4bb4387033a Vijay Viswanath          2018-06-19  278  	bool mci_removed;
21f1e2d457ce67 Veerabhadrarao Badiganti 2018-11-12  279  	bool restore_dll_=
config;
6ed4bb4387033a Vijay Viswanath          2018-06-19  280  	const struct sdhc=
i_msm_variant_ops *var_ops;
6ed4bb4387033a Vijay Viswanath          2018-06-19  281  	const struct sdhc=
i_msm_offset *offset;
a89e7bcb18081c Loic Poulain             2018-12-04  282  	bool use_cdr;
a89e7bcb18081c Loic Poulain             2018-12-04  283  	u32 transfer_mode;
fa56ac97922653 Veerabhadrarao Badiganti 2019-11-26  284  	bool updated_ddr_=
cfg;
5c30f340f9e0b8 Veerabhadrarao Badiganti 2020-05-22  285  	bool uses_tassada=
r_dll;
03591160ca192d Sarthak Garg             2020-05-22  286  	u32 dll_config;
1dfbe3ff81f941 Sarthak Garg             2020-05-22  287  	u32 ddr_config;
667fad5561c9eb Shaik Sajida Bhanu       2022-03-31  288  	struct reset_cont=
rol *core_reset;
92a2173837d2c8 Veerabhadrarao Badiganti 2020-06-23  289  	bool vqmmc_enable=
d;
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  290  };
0eb0d9f4de34a7 Georgi Djakov            2014-03-10  291  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2737859012927311822==--

