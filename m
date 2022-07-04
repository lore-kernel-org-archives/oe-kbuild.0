Content-Type: multipart/mixed; boundary="===============0712132892883740885=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tty/serial/sifive.c:273:3: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
Date: Tue, 05 Jul 2022 07:44:02 +0800
Message-ID: <202207050726.89vctbKW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0712132892883740885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/tty/serial/sifive.c:273:3: warning: Signed integer overflow for ex=
pression '1<<31'. [integerOverflow]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Guenter,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c1084b6c5620a743f86947caca66d90f24060f56
commit: a18b14d8886614b3c7d290c4cfc33389822b0535 riscv: Disable STACKPROTEC=
TOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a18b14d8886614b3c7d290c4cfc33389822b0535
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/tty/serial/sifive.c:273:3: warning: Shifting signed 32-bit value=
 by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     SIFIVE_SERIAL_TXDATA_FULL_MASK;
     ^
   drivers/tty/serial/sifive.c:418:20: warning: Shifting signed 32-bit valu=
e by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     *is_empty =3D (v & SIFIVE_SERIAL_RXDATA_EMPTY_MASK) >>
                      ^
>> drivers/tty/serial/sifive.c:273:3: warning: Signed integer overflow for =
expression '1<<31'. [integerOverflow]
     SIFIVE_SERIAL_TXDATA_FULL_MASK;
     ^
   drivers/tty/serial/sifive.c:418:20: warning: Signed integer overflow for=
 expression '1<<31'. [integerOverflow]
     *is_empty =3D (v & SIFIVE_SERIAL_RXDATA_EMPTY_MASK) >>
                      ^
   drivers/tty/serial/sifive.c:762:9: warning: Shifting signed 32-bit value=
 by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
           SIFIVE_SERIAL_TXDATA_FULL_MASK)
           ^
   drivers/tty/serial/sifive.c:762:9: warning: Signed integer overflow for =
expression '1<<31'. [integerOverflow]
           SIFIVE_SERIAL_TXDATA_FULL_MASK)
           ^
--
>> drivers/tty/synclink_gt.c:550:50: warning: Parameter 'info' can be decla=
red with const [constParameter]
   static inline int sanity_check(struct slgt_info *info, char *devname, co=
nst char *name)
                                                    ^
--
>> drivers/video/fbdev/core/fbcon.c:2766:19: warning: Local variable 'info'=
 shadows outer argument [shadowArgument]
     struct fb_info *info =3D registered_fb[idx];
                     ^
   drivers/video/fbdev/core/fbcon.c:2742:38: note: Shadowed declaration
   void fbcon_fb_unbind(struct fb_info *info)
                                        ^
   drivers/video/fbdev/core/fbcon.c:2766:19: note: Shadow variable
     struct fb_info *info =3D registered_fb[idx];
                     ^
>> drivers/video/fbdev/core/fbcon.c:2700:40: warning: Parameter 'info' can =
be declared with const [constParameter]
   int fbcon_mode_deleted(struct fb_info *info,
                                          ^

vim +273 drivers/tty/serial/sifive.c

45c054d0815b15 Paul Walmsley 2019-04-12  258  =

45c054d0815b15 Paul Walmsley 2019-04-12  259  /**
45c054d0815b15 Paul Walmsley 2019-04-12  260   * sifive_serial_is_txfifo_fu=
ll() - is the TXFIFO full?
45c054d0815b15 Paul Walmsley 2019-04-12  261   * @ssp: pointer to a struct =
sifive_serial_port
45c054d0815b15 Paul Walmsley 2019-04-12  262   *
45c054d0815b15 Paul Walmsley 2019-04-12  263   * Read the transmit FIFO "fu=
ll" bit, returning a non-zero value if the
45c054d0815b15 Paul Walmsley 2019-04-12  264   * TX FIFO is full, or zero i=
f space remains.  Intended to be used to prevent
45c054d0815b15 Paul Walmsley 2019-04-12  265   * writes to the TX FIFO when=
 it's full.
45c054d0815b15 Paul Walmsley 2019-04-12  266   *
45c054d0815b15 Paul Walmsley 2019-04-12  267   * Returns: SIFIVE_SERIAL_TXD=
ATA_FULL_MASK (non-zero) if the transmit FIFO
45c054d0815b15 Paul Walmsley 2019-04-12  268   * is full, or 0 if space rem=
ains.
45c054d0815b15 Paul Walmsley 2019-04-12  269   */
45c054d0815b15 Paul Walmsley 2019-04-12  270  static int sifive_serial_is_t=
xfifo_full(struct sifive_serial_port *ssp)
45c054d0815b15 Paul Walmsley 2019-04-12  271  {
45c054d0815b15 Paul Walmsley 2019-04-12  272  	return __ssp_readl(ssp, SIFI=
VE_SERIAL_TXDATA_OFFS) &
45c054d0815b15 Paul Walmsley 2019-04-12 @273  		SIFIVE_SERIAL_TXDATA_FULL_M=
ASK;
45c054d0815b15 Paul Walmsley 2019-04-12  274  }
45c054d0815b15 Paul Walmsley 2019-04-12  275  =


:::::: The code at line 273 was first introduced by commit
:::::: 45c054d0815b1530d7c7ff8441389a0421dd05e7 tty: serial: add driver for=
 the SiFive UART

:::::: TO: Paul Walmsley <paul.walmsley@sifive.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0712132892883740885==--

