Content-Type: multipart/mixed; boundary="===============1070142071452928349=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] arm: introduce IRQ stacks
Date: Thu, 08 Oct 2020 21:04:43 +0800
Message-ID: <202010082013.AkGAec5X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1070142071452928349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1602141333-17822-3-git-send-email-maninder1.s@samsung.com>
References: <1602141333-17822-3-git-send-email-maninder1.s@samsung.com>
TO: Maninder Singh <maninder1.s@samsung.com>
TO: linux(a)armlinux.org.uk
TO: ndesaulniers(a)google.com
TO: caij2003(a)gmail.com
TO: tglx(a)linutronix.de
TO: bigeasy(a)linutronix.de
TO: maz(a)kernel.org
TO: valentin.schneider(a)arm.com
TO: vincent.whitchurch(a)axis.com
TO: nhuck(a)google.com
TO: akpm(a)linux-foundation.org

Hi Maninder,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on arm/for-next]
[also build test WARNING on linus/master v5.9-rc8 next-20201008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maninder-Singh/IRQ-stack-s=
upport-for-ARM/20201008-151928
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +53 arch/arm/kernel/irq.c

b503b88302e9143 Maninder Singh 2020-10-08  49  =

b503b88302e9143 Maninder Singh 2020-10-08  50  /*
b503b88302e9143 Maninder Singh 2020-10-08  51   * irq_stack must be IRQ_STA=
CK_SIZE(THREAD_SIZE) aligned,
b503b88302e9143 Maninder Singh 2020-10-08  52   */
b503b88302e9143 Maninder Singh 2020-10-08 @53  DEFINE_PER_CPU(unsigned long=
 [IRQ_STACK_SIZE/sizeof(long)], irq_stack) __aligned(IRQ_STACK_SIZE);
b503b88302e9143 Maninder Singh 2020-10-08  54  #endif
b503b88302e9143 Maninder Singh 2020-10-08  55  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1070142071452928349==--

