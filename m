Content-Type: multipart/mixed; boundary="===============6046784180523541354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-geni-qcom.c:467:19: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Fri, 26 Nov 2021 12:43:00 +0800
Message-ID: <202111261214.VPQTHTDy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6046784180523541354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 8db90aa36063f471bea1e65e23185913043852dc Merge tag 'v5.11-rc1' into=
 spi-5.11
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20211124 (https://download.01.org/0day-ci/arc=
hive/20211126/202111261214.VPQTHTDy-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c4=
5def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8db90aa36063f471bea1e65e23185913043852dc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8db90aa36063f471bea1e65e23185913043852dc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/media/i2c/mt9p031.c:249:9: note: Calling '__roundup_pow_of_two'
                   div =3D roundup_pow_of_two(div) / 2;
                         ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:187:2: note: '?' condition is true
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/bitops.h:187:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/bitops.h:189:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/asm-generic/bitops/fls64.h:29:2: note: '?' condition is false
           if (x =3D=3D 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/asm-generic/bitops/fls64.h:29:6: note: 'x' is not equal to 0
           if (x =3D=3D 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   include/asm-generic/bitops/fls64.h:29:2: note: '?' condition is false
           if (x =3D=3D 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:189:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:189:2: note: Returning the value 64
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
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/spi/spi-geni-qcom.c:467:19: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
                   for (i =3D 0; i < DIV_ROUND_UP(rx_bytes, bytes_per_fifo_=
word); i++)
                                   ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-geni-qcom.c:589:10: note: Loop condition is false.  Exit=
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
   drivers/spi/spi-geni-qcom.c:590:6: note: Assuming 'm_irq' is not equal t=
o 0
           if (!m_irq)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/spi/spi-geni-qcom.c:590:2: note: '?' condition is false
           if (!m_irq)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/spi/spi-geni-qcom.c:590:7: note: 'm_irq' is not equal to 0
           if (!m_irq)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/spi/spi-geni-qcom.c:590:2: note: '?' condition is false
           if (!m_irq)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/spi/spi-geni-qcom.c:590:2: note: Taking false branch
           if (!m_irq)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/spi/spi-geni-qcom.c:593:2: note: Assuming the condition is false
           if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE=
_EN |
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/spi/spi-geni-qcom.c:593:2: note: '?' condition is false
           if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE=
_EN |
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/spi/spi-geni-qcom.c:593:2: note: '?' condition is true
           if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE=
_EN |
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/spi/spi-geni-qcom.c:593:2: note: Taking true branch
           if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE=
_EN |
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +467 drivers/spi/spi-geni-qcom.c

6d66507d9b5507e Douglas Anderson 2020-09-12  445  =

6d66507d9b5507e Douglas Anderson 2020-09-12  446  static void geni_spi_hand=
le_rx(struct spi_geni_master *mas)
6d66507d9b5507e Douglas Anderson 2020-09-12  447  {
6d66507d9b5507e Douglas Anderson 2020-09-12  448  	struct geni_se *se =3D &=
mas->se;
6d66507d9b5507e Douglas Anderson 2020-09-12  449  	u32 rx_fifo_status;
6d66507d9b5507e Douglas Anderson 2020-09-12  450  	unsigned int rx_bytes;
6d66507d9b5507e Douglas Anderson 2020-09-12  451  	unsigned int rx_last_byt=
e_valid;
6d66507d9b5507e Douglas Anderson 2020-09-12  452  	u8 *rx_buf;
6d66507d9b5507e Douglas Anderson 2020-09-12  453  	unsigned int bytes_per_f=
ifo_word =3D geni_byte_per_fifo_word(mas);
6d66507d9b5507e Douglas Anderson 2020-09-12  454  	unsigned int i =3D 0;
6d66507d9b5507e Douglas Anderson 2020-09-12  455  =

6d66507d9b5507e Douglas Anderson 2020-09-12  456  	rx_fifo_status =3D readl=
(se->base + SE_GENI_RX_FIFO_STATUS);
6d66507d9b5507e Douglas Anderson 2020-09-12  457  	rx_bytes =3D (rx_fifo_st=
atus & RX_FIFO_WC_MSK) * bytes_per_fifo_word;
6d66507d9b5507e Douglas Anderson 2020-09-12  458  	if (rx_fifo_status & RX_=
LAST) {
6d66507d9b5507e Douglas Anderson 2020-09-12  459  		rx_last_byte_valid =3D =
rx_fifo_status & RX_LAST_BYTE_VALID_MSK;
6d66507d9b5507e Douglas Anderson 2020-09-12  460  		rx_last_byte_valid >>=
=3D RX_LAST_BYTE_VALID_SHFT;
6d66507d9b5507e Douglas Anderson 2020-09-12  461  		if (rx_last_byte_valid =
&& rx_last_byte_valid < 4)
6d66507d9b5507e Douglas Anderson 2020-09-12  462  			rx_bytes -=3D bytes_pe=
r_fifo_word - rx_last_byte_valid;
6d66507d9b5507e Douglas Anderson 2020-09-12  463  	}
4aa1464acbe3697 Douglas Anderson 2020-12-17  464  =

4aa1464acbe3697 Douglas Anderson 2020-12-17  465  	/* Clear out the FIFO an=
d bail if nowhere to put it */
4aa1464acbe3697 Douglas Anderson 2020-12-17  466  	if (!mas->cur_xfer) {
4aa1464acbe3697 Douglas Anderson 2020-12-17 @467  		for (i =3D 0; i < DIV_R=
OUND_UP(rx_bytes, bytes_per_fifo_word); i++)
4aa1464acbe3697 Douglas Anderson 2020-12-17  468  			readl(se->base + SE_GE=
NI_RX_FIFOn);
4aa1464acbe3697 Douglas Anderson 2020-12-17  469  		return;
4aa1464acbe3697 Douglas Anderson 2020-12-17  470  	}
4aa1464acbe3697 Douglas Anderson 2020-12-17  471  =

6d66507d9b5507e Douglas Anderson 2020-09-12  472  	if (mas->rx_rem_bytes < =
rx_bytes)
6d66507d9b5507e Douglas Anderson 2020-09-12  473  		rx_bytes =3D mas->rx_re=
m_bytes;
6d66507d9b5507e Douglas Anderson 2020-09-12  474  =

6d66507d9b5507e Douglas Anderson 2020-09-12  475  	rx_buf =3D mas->cur_xfer=
->rx_buf + mas->cur_xfer->len - mas->rx_rem_bytes;
6d66507d9b5507e Douglas Anderson 2020-09-12  476  	while (i < rx_bytes) {
6d66507d9b5507e Douglas Anderson 2020-09-12  477  		u32 fifo_word =3D 0;
6d66507d9b5507e Douglas Anderson 2020-09-12  478  		u8 *fifo_byte =3D (u8 *=
)&fifo_word;
6d66507d9b5507e Douglas Anderson 2020-09-12  479  		unsigned int bytes_to_r=
ead;
6d66507d9b5507e Douglas Anderson 2020-09-12  480  		unsigned int j;
6d66507d9b5507e Douglas Anderson 2020-09-12  481  =

6d66507d9b5507e Douglas Anderson 2020-09-12  482  		bytes_to_read =3D min(b=
ytes_per_fifo_word, rx_bytes - i);
6d66507d9b5507e Douglas Anderson 2020-09-12  483  		ioread32_rep(se->base +=
 SE_GENI_RX_FIFOn, &fifo_word, 1);
6d66507d9b5507e Douglas Anderson 2020-09-12  484  		for (j =3D 0; j < bytes=
_to_read; j++)
6d66507d9b5507e Douglas Anderson 2020-09-12  485  			rx_buf[i++] =3D fifo_b=
yte[j];
6d66507d9b5507e Douglas Anderson 2020-09-12  486  	}
6d66507d9b5507e Douglas Anderson 2020-09-12  487  	mas->rx_rem_bytes -=3D r=
x_bytes;
6d66507d9b5507e Douglas Anderson 2020-09-12  488  }
6d66507d9b5507e Douglas Anderson 2020-09-12  489  =


:::::: The code at line 467 was first introduced by commit
:::::: 4aa1464acbe3697710279a4bd65cb4801ed30425 spi: spi-geni-qcom: Fix gen=
i_spi_isr() NULL dereference in timeout case

:::::: TO: Douglas Anderson <dianders@chromium.org>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6046784180523541354==--

