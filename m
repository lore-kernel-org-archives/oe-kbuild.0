Content-Type: multipart/mixed; boundary="===============2697230470058700988=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-nomadik:gemini-cpuidle 4/4] drivers/clocksource/timer-fttmr010.c:309:3: warning: Null pointer dereference: evt [nullPointer]
Date: Sun, 28 Aug 2022 23:19:28 +0800
Message-ID: <202208282355.Em0SOckP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2697230470058700988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
locksource/timer-fttmr010.c:309:3: warning: Null pointer dereference: evt [=
nullPointer]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git gemini-cpuidle
head:   7fff44b9367cdde49fc46ed2cc683e1abf8a9bd7
commit: 7fff44b9367cdde49fc46ed2cc683e1abf8a9bd7 [4/4] slask
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7fff44b9367cdde49fc46ed2cc683e1abf8a9bd7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clocksource/timer-fttmr010.c:309:3: warning: Null pointer derefe=
rence: evt [nullPointer]
     evt->event_handler(evt);
     ^
   drivers/clocksource/timer-fttmr010.c:300:35: note: Assignment 'evt=3DNUL=
L', assigned value is 0
    struct clock_event_device *evt =3D NULL;
                                     ^
   drivers/clocksource/timer-fttmr010.c:309:3: note: Null pointer dereferen=
ce
     evt->event_handler(evt);
     ^

vim +309 drivers/clocksource/timer-fttmr010.c

4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  293  =

4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  294  /*
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  295   * IRQ handler for the timer
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  296   */
f5bf0ee4ebf779 drivers/clocksource/timer-fttmr010.c Linus Walleij 2017-03-2=
4  297  static irqreturn_t fttmr010_timer_interrupt(int irq, void *dev_id)
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  298  {
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  299  	struct fttmr010 *fttmr010 =3D dev_id;
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  300  	struct clock_event_device *evt =3D NULL;
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  301  	u32 val;
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  302  =

a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  303  	if (fttmr010->is_aspeed) {
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  304  		/*
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  305  		 * Aspeed versions do not implement the interrupt
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  306  		 * status register and cannot detect spurious
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  307  		 * interrupts.
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  308  		 */
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5 @309  		evt->event_handler(evt);
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  310  		return IRQ_HANDLED;
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  311  	}
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  312  =

a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  313  	val =3D readl(fttmr010->base + TIMER_INTR_STATE);
1808b6d9870d9c drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  314  	if (val & TIMER_1_INT_MATCH1)
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  315  		evt =3D &fttmr010->clkevt;
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  316  	if (val & TIMER_3_INT_MATCH1)
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  317  		evt =3D &fttmr010->extevt;
a8a95322d3167b drivers/clocksource/timer-fttmr010.c Linus Walleij 2021-07-2=
5  318  =

7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  319  	if (evt) {
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  320  		evt->event_handler(evt);
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  321  		return IRQ_HANDLED;
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  322  	}
4750535bc94b86 drivers/clocksource/timer-gemini.c   Linus Walleij 2017-01-2=
2  323  =

7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  324  	return IRQ_NONE;
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  325  }
7fff44b9367cdd drivers/clocksource/timer-fttmr010.c Linus Walleij 2019-09-2=
6  326  =


:::::: The code at line 309 was first introduced by commit
:::::: a8a95322d3167bf063408a85a7a012d90e841ad7 clocksource/drivers/fttmr01=
0: Be stricter on IRQs

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2697230470058700988==--

