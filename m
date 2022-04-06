Content-Type: multipart/mixed; boundary="===============7293761478006848749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding in 'struct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal).
Date: Wed, 06 Apr 2022 09:20:38 +0800
Message-ID: <202204060910.djR1mnUX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7293761478006848749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: e9d6cea2af1cf8d84287ff2287b6cd776f7475d2 clk: bcm: rpi: Run some cl=
ocks at the minimum rate allowed
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220405 (https://download.01.org/0day-ci/arc=
hive/20220406/202204060910.djR1mnUX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De9d6cea2af1cf8d84287ff2287b6cd776f7475d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e9d6cea2af1cf8d84287ff2287b6cd776f7475d2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '64', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/spi/spi-geni-qcom.c:815:10: note: Loop condition is false.  Exit=
ing loop
           m_irq =3D readl(se->base + SE_GENI_M_IRQ_STATUS);
                   ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/spi/spi-geni-qcom.c:816:6: note: Assuming 'm_irq' is not equal t=
o 0
           if (!m_irq)
               ^~~~~~
   drivers/spi/spi-geni-qcom.c:816:2: note: Taking false branch
           if (!m_irq)
           ^
   drivers/spi/spi-geni-qcom.c:819:6: note: Assuming the condition is false
           if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE=
_EN |
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/spi/spi-geni-qcom.c:819:2: note: Taking false branch
           if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE=
_EN |
           ^
   drivers/spi/spi-geni-qcom.c:826:7: note: Assuming the condition is true
           if ((m_irq & M_RX_FIFO_WATERMARK_EN) || (m_irq & M_RX_FIFO_LAST_=
EN))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-geni-qcom.c:826:39: note: Left side of '||' is true
           if ((m_irq & M_RX_FIFO_WATERMARK_EN) || (m_irq & M_RX_FIFO_LAST_=
EN))
                                                ^
   drivers/spi/spi-geni-qcom.c:827:3: note: Calling 'geni_spi_handle_rx'
                   geni_spi_handle_rx(mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-geni-qcom.c:682:37: note: Calling 'geni_byte_per_fifo_wo=
rd'
           unsigned int bytes_per_fifo_word =3D geni_byte_per_fifo_word(mas=
);
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-geni-qcom.c:630:6: note: Assuming the condition is true
           if (mas->fifo_width_bits % mas->cur_bits_per_word)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-geni-qcom.c:630:2: note: Taking true branch
           if (mas->fifo_width_bits % mas->cur_bits_per_word)
           ^
   drivers/spi/spi-geni-qcom.c:631:10: note: '?' condition is false
                   return roundup_pow_of_two(DIV_ROUND_UP(mas->cur_bits_per=
_word,
                          ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/spi/spi-geni-qcom.c:631:10: note: Calling '__roundup_pow_of_two'
                   return roundup_pow_of_two(DIV_ROUND_UP(mas->cur_bits_per=
_word,
                          ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:156:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:156:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:156:2: note: Returning the value 64
           return fls64(l);
           ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '64', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/clk/bcm/clk-iproc-pll.c:182:3: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   val =3D readl(base + offset);
                   ^
   drivers/clk/bcm/clk-iproc-pll.c:182:3: note: Value stored to 'val' is ne=
ver read
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding in 's=
truct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   clkdev, =

   min_rate, =

   export, =

   minimize, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/bcm/clk-raspberrypi.c:76:8: note: Excessive padding in 'stru=
ct raspberrypi_clk_variant' (14 padding bytes, where 6 is optimal). Optimal=
 fields order: clkdev, min_rate, export, minimize, consider reordering the =
fields or adding explicit padding members
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
   45 warnings generated.
   drivers/mmc/host/sdhci-of-aspeed.c:134:14: warning: The result of the le=
ft shift is undefined due to shifting '15' by '29', which is unrepresentabl=
e in the unsigned version of the return type 'int' [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
                   reg |=3D tap << __ffs(desc->tap_mask);
                              ^
   drivers/mmc/host/sdhci-of-aspeed.c:251:6: note: Assuming 'clock' is not =
equal to 0
           if (clock =3D=3D 0)
               ^~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:251:2: note: Taking false branch
           if (clock =3D=3D 0)
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:254:14: note: Assuming 'clock' is <=
=3D field 'max_clk'
           if (WARN_ON(clock > host->max_clk))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:254:6: note: Taking false branch
           if (WARN_ON(clock > host->max_clk))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:254:2: note: Taking false branch
           if (WARN_ON(clock > host->max_clk))
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:273:42: note: Assuming 'div' is < 256
           for (div =3D sdhci->pdata->clk_div_start; div < 256; div *=3D 2)=
 {
                                                   ^~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:273:2: note: Loop condition is true. =
 Entering loop body
           for (div =3D sdhci->pdata->clk_div_start; div < 256; div *=3D 2)=
 {
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:275:7: note: Assuming 'bus' is <=3D '=
clock'
                   if (bus <=3D clock)
                       ^~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:275:3: note: Taking true branch
                   if (bus <=3D clock)
                   ^
   drivers/mmc/host/sdhci-of-aspeed.c:276:4: note:  Execution continues on =
line 279
                           break;
                           ^
   drivers/mmc/host/sdhci-of-aspeed.c:283:2: note: Calling 'aspeed_sdhci_co=
nfigure_phase'
           aspeed_sdhci_configure_phase(host, bus);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:223:6: note: Assuming field 'phase_de=
sc' is non-null
           if (!sdhci->phase_desc)
               ^~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:223:2: note: Taking false branch
           if (!sdhci->phase_desc)
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:227:2: note: Calling 'aspeed_sdhci_ph=
ases_to_taps'
           aspeed_sdhci_phases_to_taps(dev, rate, params, taps);

vim +76 drivers/clk/bcm/clk-raspberrypi.c

4e85e535e6cc6e Nicolas Saenz Julienne 2019-06-12  75  =

12c90f3f27bb3a Maxime Ripard          2022-02-25 @76  struct raspberrypi_cl=
k_variant {
12c90f3f27bb3a Maxime Ripard          2022-02-25  77  	bool		export;
12c90f3f27bb3a Maxime Ripard          2022-02-25  78  	char		*clkdev;
542acfec4e313c Maxime Ripard          2022-02-25  79  	unsigned long	min_ra=
te;
e9d6cea2af1cf8 Maxime Ripard          2022-02-25  80  	bool		minimize;
12c90f3f27bb3a Maxime Ripard          2022-02-25  81  };
12c90f3f27bb3a Maxime Ripard          2022-02-25  82  =


:::::: The code at line 76 was first introduced by commit
:::::: 12c90f3f27bb3ad0dd3fad1550fec87091aa3329 clk: bcm: rpi: Add variant =
structure

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7293761478006848749==--

