Content-Type: multipart/mixed; boundary="===============1867749601827746981=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [tglx-devel:x86/entry 100/140] arch/x86/kernel/traps.c:721:16: warning: Using argument dr6 that points at uninitialized variable dr6 [ctuuninitvar]
Date: Wed, 06 May 2020 05:39:39 +0800
Message-ID: <202005060530.w5ecQnM3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1867749601827746981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/=
entry
head:   e6d36eed49b863bbe393e3c07cae737cd9c475e3
commit: e41ec789a83eaaa28efb7b897a48cb565e9aa067 [100/140] x86/db: Split ou=
t dr6/7 handling
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kernel/traps.c:721:16: warning: Using argument dr6 that points =
at uninitialized variable dr6 [ctuuninitvar]
    get_debugreg(*dr6, 6);
                  ^
   arch/x86/kernel/traps.c:763:13: note: Calling function debug_enter, 1st =
argument is uninitialized
    debug_enter(&dr6, &dr7);
               ^
   arch/x86/kernel/traps.c:721:16: note: Using argument dr6
    get_debugreg(*dr6, 6);
                  ^
>> arch/x86/kernel/traps.c:707:16: warning: Using argument dr7 that points =
at uninitialized variable dr7 [ctuuninitvar]
    get_debugreg(*dr7, 6);
                  ^
   arch/x86/kernel/traps.c:763:13: note: Calling function debug_enter, 2nd =
argument is uninitialized
    debug_enter(&dr6, &dr7);
               ^
   arch/x86/kernel/traps.c:707:16: note: Using argument dr7
    get_debugreg(*dr7, 6);
                  ^

# https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=
=3De41ec789a83eaaa28efb7b897a48cb565e9aa067
git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/t=
glx/devel.git
git remote update tglx-devel
git checkout e41ec789a83eaaa28efb7b897a48cb565e9aa067
vim +721 arch/x86/kernel/traps.c

f2b375756c839ff Andy Lutomirski 2016-03-09  693  =

e41ec789a83eaaa Peter Zijlstra  2020-04-06  694  static __always_inline voi=
d debug_enter(unsigned long *dr6, unsigned long *dr7)
e41ec789a83eaaa Peter Zijlstra  2020-04-06  695  {
e41ec789a83eaaa Peter Zijlstra  2020-04-06  696  	/*
e41ec789a83eaaa Peter Zijlstra  2020-04-06  697  	 * Disable breakpoints du=
ring exception handling; recursive exceptions
e41ec789a83eaaa Peter Zijlstra  2020-04-06  698  	 * are exceedingly 'fun'.
e41ec789a83eaaa Peter Zijlstra  2020-04-06  699  	 *
e41ec789a83eaaa Peter Zijlstra  2020-04-06  700  	 * Since this function is=
 NOKPROBE, and that also applies to
e41ec789a83eaaa Peter Zijlstra  2020-04-06  701  	 * HW_BREAKPOINT_X, we ca=
n't hit a breakpoint before this (XXX except a
e41ec789a83eaaa Peter Zijlstra  2020-04-06  702  	 * HW_BREAKPOINT_W on our=
 stack)
e41ec789a83eaaa Peter Zijlstra  2020-04-06  703  	 *
e41ec789a83eaaa Peter Zijlstra  2020-04-06  704  	 * Entry text is excluded=
 for HW_BP_X and cpu_entry_area, which
e41ec789a83eaaa Peter Zijlstra  2020-04-06  705  	 * includes the entry sta=
ck is excluded for everything.
e41ec789a83eaaa Peter Zijlstra  2020-04-06  706  	 */
e41ec789a83eaaa Peter Zijlstra  2020-04-06 @707  	get_debugreg(*dr7, 6);
e41ec789a83eaaa Peter Zijlstra  2020-04-06  708  	set_debugreg(0, 7);
e41ec789a83eaaa Peter Zijlstra  2020-04-06  709  =

e41ec789a83eaaa Peter Zijlstra  2020-04-06  710  	/*
e41ec789a83eaaa Peter Zijlstra  2020-04-06  711  	 * The Intel SDM says:
e41ec789a83eaaa Peter Zijlstra  2020-04-06  712  	 *
e41ec789a83eaaa Peter Zijlstra  2020-04-06  713  	 *   Certain debug except=
ions may clear bits 0-3. The remaining
e41ec789a83eaaa Peter Zijlstra  2020-04-06  714  	 *   contents of the DR6 =
register are never cleared by the
e41ec789a83eaaa Peter Zijlstra  2020-04-06  715  	 *   processor. To avoid =
confusion in identifying debug
e41ec789a83eaaa Peter Zijlstra  2020-04-06  716  	 *   exceptions, debug ha=
ndlers should clear the register before
e41ec789a83eaaa Peter Zijlstra  2020-04-06  717  	 *   returning to the int=
errupted task.
e41ec789a83eaaa Peter Zijlstra  2020-04-06  718  	 *
e41ec789a83eaaa Peter Zijlstra  2020-04-06  719  	 * Keep it simple: clear =
DR6 immediately.
e41ec789a83eaaa Peter Zijlstra  2020-04-06  720  	 */
e41ec789a83eaaa Peter Zijlstra  2020-04-06 @721  	get_debugreg(*dr6, 6);
e41ec789a83eaaa Peter Zijlstra  2020-04-06  722  	set_debugreg(0, 6);
e41ec789a83eaaa Peter Zijlstra  2020-04-06  723  	/* Filter out all the res=
erved bits which are preset to 1 */
e41ec789a83eaaa Peter Zijlstra  2020-04-06  724  	*dr6 &=3D ~DR6_RESERVED;
e41ec789a83eaaa Peter Zijlstra  2020-04-06  725  }
e41ec789a83eaaa Peter Zijlstra  2020-04-06  726  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1867749601827746981==--

