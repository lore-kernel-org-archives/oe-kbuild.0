Content-Type: multipart/mixed; boundary="===============7302122168583366977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1952/6654] arch/arm/mach-s3c/irq-s3c24xx.c:399:14: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour. See condition at line 396.
Date: Fri, 11 Sep 2020 17:18:21 +0800
Message-ID: <202009111758.LmQ6YfLm%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7302122168583366977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7ce53e3a447bced7b85ed181c4d027e93c062e07
commit: 71b9114d2c13a648fbe6523dd859e611c316ad90 [1952/6654] ARM: s3c: move=
 into a common directory
:::::: branch date: 26 hours ago
:::::: commit date: 3 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/arm/mach-s3c/irq-s3c24xx.c:399:14: warning: Shifting signed 32-bit =
value by 31 bits is undefined behaviour. See condition at line 396. [shiftT=
ooManyBitsSigned]
     intmod =3D 1 << offs;
                ^
   arch/arm/mach-s3c/irq-s3c24xx.c:396:12: note: Assuming that condition 'o=
ffs>31' is not redundant
     if (offs > 31)
              ^
   arch/arm/mach-s3c/irq-s3c24xx.c:399:14: note: Shift
     intmod =3D 1 << offs;
                ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D71b9114d2c13a648fbe6523dd859e611c316ad90
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout 71b9114d2c13a648fbe6523dd859e611c316ad90
vim +399 arch/arm/mach-s3c/irq-s3c24xx.c

17453dd2e7df20 arch/arm/mach-s3c24xx/irq.c         Heiko Stuebner 2013-03-0=
7  374  =

229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  375  #ifdef CONFIG_FIQ
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  376  /**
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  377   * s3c24xx_set_fiq - set the FIQ routing
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  378   * @irq: IRQ number to route to FIQ on processor.
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  379   * @ack_ptr: pointer to a location for storing the bit mask
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  380   * @on: Whether to route @irq to the FIQ, or to remove the FIQ rout=
ing.
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  381   *
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  382   * Change the state of the IRQ to FIQ routing depending on @irq and=
 @on. If
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  383   * @on is true, the @irq is checked to see if it can be routed and =
the
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  384   * interrupt controller updated to route the IRQ. If @on is false, =
the FIQ
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  385   * routing is cleared, regardless of which @irq is specified.
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  386   *
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  387   * returns the mask value for the register.
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  388   */
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  389  int s3c24xx_set_fiq(unsigned int irq, u32 *ack_ptr, bool on)
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  390  {
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  391  	u32 intmod;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  392  	unsigned offs;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  393  =

229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  394  	if (on) {
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  395  		offs =3D irq - FIQ_START;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3 @396  		if (offs > 31)
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  397  			return 0;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  398  =

229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3 @399  		intmod =3D 1 << offs;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  400  	} else {
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  401  		intmod =3D 0;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  402  	}
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  403  =

cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  404  	if (ack_ptr)
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  405  		*ack_ptr =3D intmod;
353332855eef20 drivers/irqchip/irq-s3c24xx.c       Ben Dooks      2016-06-2=
1  406  	writel_relaxed(intmod, S3C2410_INTMOD);
cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  407  =

cd4bd8f9435ddf arch/arm/mach-s3c24xx/irq-s3c24xx.c Arnd Bergmann  2020-08-0=
6  408  	return intmod;
229fd8ffba57df arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-08-0=
3  409  }
0f13c8248040d6 arch/arm/plat-s3c24xx/irq.c         Ben Dooks      2009-12-0=
7  410  =


:::::: The code@line 399 was first introduced by commit
:::::: 229fd8ffba57dfaea59078b9144371369ffdb0a3 ARM: S3C24XX: Add FIQ IRQ r=
outing support

:::::: TO: Ben Dooks <ben@simtec.co.uk>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7302122168583366977==--

