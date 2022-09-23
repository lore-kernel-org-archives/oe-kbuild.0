Content-Type: multipart/mixed; boundary="===============2958768397158645258=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dvyukov:dvyukov-perf-debugging 1/1] arch/x86/kernel/hw_breakpoint.c:577 hw_breakpoint_handler() error: uninitialized symbol 'info'.
Date: Fri, 23 Sep 2022 09:15:55 +0800
Message-ID: <202209230922.QZCmp68Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2958768397158645258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Vyukov <dvyukov@google.com>

tree:   https://github.com/dvyukov/linux dvyukov-perf-debugging
head:   62267cd404c44bbb18a96c108839c99e7ba6f9bd
commit: 62267cd404c44bbb18a96c108839c99e7ba6f9bd [1/1] perf: debugging of m=
issed breakpoints
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20923/202209230922.QZCmp68Z-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/hw_breakpoint.c:577 hw_breakpoint_handler() error: uninitia=
lized symbol 'info'.

vim +/info +577 arch/x86/kernel/hw_breakpoint.c

0067f1297241ea K.Prasad            2009-06-01  500  =

0067f1297241ea K.Prasad            2009-06-01  501  /*
0067f1297241ea K.Prasad            2009-06-01  502   * Handle debug excepti=
on notifications.
0067f1297241ea K.Prasad            2009-06-01  503   *
0067f1297241ea K.Prasad            2009-06-01  504   * Return value is eith=
er NOTIFY_STOP or NOTIFY_DONE as explained below.
0067f1297241ea K.Prasad            2009-06-01  505   *
0067f1297241ea K.Prasad            2009-06-01  506   * NOTIFY_DONE returned=
 if one of the following conditions is true.
0067f1297241ea K.Prasad            2009-06-01  507   * i) When the causativ=
e address is from user-space and the exception
0067f1297241ea K.Prasad            2009-06-01  508   * is a valid one, i.e.=
 not triggered as a result of lazy debug register
0067f1297241ea K.Prasad            2009-06-01  509   * switching
0067f1297241ea K.Prasad            2009-06-01  510   * ii) When there are m=
ore bits than trap<n> set in DR6 register (such
0067f1297241ea K.Prasad            2009-06-01  511   * as BD, BS or BT) ind=
icating that more than one debug condition is
0067f1297241ea K.Prasad            2009-06-01  512   * met and requires som=
e more action in do_debug().
0067f1297241ea K.Prasad            2009-06-01  513   *
0067f1297241ea K.Prasad            2009-06-01  514   * NOTIFY_STOP returned=
 for all other cases
0067f1297241ea K.Prasad            2009-06-01  515   *
0067f1297241ea K.Prasad            2009-06-01  516   */
9c54b6164eeb29 Masami Hiramatsu    2014-04-17  517  static int hw_breakpoin=
t_handler(struct die_args *args)
0067f1297241ea K.Prasad            2009-06-01  518  {
21d44be7b6ff4c Peter Zijlstra      2020-09-02  519  	int i, rc =3D NOTIFY_S=
TOP;
24f1e32c60c45c Frederic Weisbecker 2009-09-09  520  	struct perf_event *bp;
62edab9056a6cf K.Prasad            2009-06-01  521  	unsigned long *dr6_p;
d53d9bc0cf783e Peter Zijlstra      2020-09-02  522  	unsigned long dr6;
9ad22e165994cc Peter Zijlstra      2021-01-28  523  	bool bpx;
62267cd404c44b Dmitry Vyukov       2022-09-22  524  	struct arch_hw_breakpo=
int *info;
62edab9056a6cf K.Prasad            2009-06-01  525  =

62edab9056a6cf K.Prasad            2009-06-01  526  	/* The DR6 value is po=
inted by args->err */
62edab9056a6cf K.Prasad            2009-06-01  527  	dr6_p =3D (unsigned lo=
ng *)ERR_PTR(args->err);
62edab9056a6cf K.Prasad            2009-06-01  528  	dr6 =3D *dr6_p;
0067f1297241ea K.Prasad            2009-06-01  529  =

0067f1297241ea K.Prasad            2009-06-01  530  	/* Do an early return =
if no trap bits are set in DR6 */
62267cd404c44b Dmitry Vyukov       2022-09-22  531  	if ((dr6 & DR_TRAP_BIT=
S) =3D=3D 0) {
62267cd404c44b Dmitry Vyukov       2022-09-22  532  		LOG("HIT no trap bits=
");
0067f1297241ea K.Prasad            2009-06-01  533  		return NOTIFY_DONE;
62267cd404c44b Dmitry Vyukov       2022-09-22  534  	}
0067f1297241ea K.Prasad            2009-06-01  535  =

0067f1297241ea K.Prasad            2009-06-01  536  	/* Handle all the brea=
kpoints that were triggered */
0067f1297241ea K.Prasad            2009-06-01  537  	for (i =3D 0; i < HBP_=
NUM; ++i) {
0067f1297241ea K.Prasad            2009-06-01  538  		if (likely(!(dr6 & (D=
R_TRAP0 << i))))
0067f1297241ea K.Prasad            2009-06-01  539  			continue;
24f1e32c60c45c Frederic Weisbecker 2009-09-09  540  =

9ad22e165994cc Peter Zijlstra      2021-01-28  541  		bp =3D this_cpu_read(=
bp_per_reg[i]);
9ad22e165994cc Peter Zijlstra      2021-01-28  542  		if (!bp)
9ad22e165994cc Peter Zijlstra      2021-01-28  543  			continue;
9ad22e165994cc Peter Zijlstra      2021-01-28  544  =

9ad22e165994cc Peter Zijlstra      2021-01-28  545  		bpx =3D bp->hw.info.t=
ype =3D=3D X86_BREAKPOINT_EXECUTE;
9ad22e165994cc Peter Zijlstra      2021-01-28  546  =

0067f1297241ea K.Prasad            2009-06-01  547  		/*
9ad22e165994cc Peter Zijlstra      2021-01-28  548  		 * TF and data breakp=
oints are traps and can be merged, however
9ad22e165994cc Peter Zijlstra      2021-01-28  549  		 * instruction breakp=
oints are faults and will be raised
9ad22e165994cc Peter Zijlstra      2021-01-28  550  		 * separately.
9ad22e165994cc Peter Zijlstra      2021-01-28  551  		 *
9ad22e165994cc Peter Zijlstra      2021-01-28  552  		 * However DR6 can in=
dicate both TF and instruction
9ad22e165994cc Peter Zijlstra      2021-01-28  553  		 * breakpoints. In th=
at case take TF as that has precedence and
9ad22e165994cc Peter Zijlstra      2021-01-28  554  		 * delay the instruct=
ion breakpoint for the next exception.
0067f1297241ea K.Prasad            2009-06-01  555  		 */
9ad22e165994cc Peter Zijlstra      2021-01-28  556  		if (bpx && (dr6 & DR_=
STEP))
9ad22e165994cc Peter Zijlstra      2021-01-28  557  			continue;
24f1e32c60c45c Frederic Weisbecker 2009-09-09  558  =

62edab9056a6cf K.Prasad            2009-06-01  559  		/*
62edab9056a6cf K.Prasad            2009-06-01  560  		 * Reset the 'i'th TR=
AP bit in dr6 to denote completion of
62edab9056a6cf K.Prasad            2009-06-01  561  		 * exception handling
62edab9056a6cf K.Prasad            2009-06-01  562  		 */
62edab9056a6cf K.Prasad            2009-06-01  563  		(*dr6_p) &=3D ~(DR_TR=
AP0 << i);
24f1e32c60c45c Frederic Weisbecker 2009-09-09  564  =

62267cd404c44b Dmitry Vyukov       2022-09-22  565  		info =3D counter_arch=
_bp(bp);
62267cd404c44b Dmitry Vyukov       2022-09-22  566  		//LOG("HIT on 0x%lx",=
 info->address);
b326e9560a28fc Frederic Weisbecker 2009-12-05  567  		perf_bp_event(bp, arg=
s->regs);
0067f1297241ea K.Prasad            2009-06-01  568  =

0c4519e825c9e2 Frederic Weisbecker 2010-06-24  569  		/*
0c4519e825c9e2 Frederic Weisbecker 2010-06-24  570  		 * Set up resume flag=
 to avoid breakpoint recursion when
0c4519e825c9e2 Frederic Weisbecker 2010-06-24  571  		 * returning back to =
origin.
0c4519e825c9e2 Frederic Weisbecker 2010-06-24  572  		 */
9ad22e165994cc Peter Zijlstra      2021-01-28  573  		if (bpx)
0c4519e825c9e2 Frederic Weisbecker 2010-06-24  574  			args->regs->flags |=
=3D X86_EFLAGS_RF;
0067f1297241ea K.Prasad            2009-06-01  575  	}
9ad22e165994cc Peter Zijlstra      2021-01-28  576  =

62267cd404c44b Dmitry Vyukov       2022-09-22 @577  	if (!info)
62267cd404c44b Dmitry Vyukov       2022-09-22  578  		LOG("HIT not found");
62267cd404c44b Dmitry Vyukov       2022-09-22  579  	//LOG("HIT done");
62267cd404c44b Dmitry Vyukov       2022-09-22  580  =

e0e53db6133c32 K.Prasad            2010-01-28  581  	/*
e0e53db6133c32 K.Prasad            2010-01-28  582  	 * Further processing =
in do_debug() is needed for a) user-space
e0e53db6133c32 K.Prasad            2010-01-28  583  	 * breakpoints (to gen=
erate signals) and b) when the system has
e0e53db6133c32 K.Prasad            2010-01-28  584  	 * taken exception due=
 to multiple causes
e0e53db6133c32 K.Prasad            2010-01-28  585  	 */
d53d9bc0cf783e Peter Zijlstra      2020-09-02  586  	if ((current->thread.v=
irtual_dr6 & DR_TRAP_BITS) ||
e0e53db6133c32 K.Prasad            2010-01-28  587  	    (dr6 & (~DR_TRAP_B=
ITS)))
0067f1297241ea K.Prasad            2009-06-01  588  		rc =3D NOTIFY_DONE;
0067f1297241ea K.Prasad            2009-06-01  589  =

0067f1297241ea K.Prasad            2009-06-01  590  	return rc;
0067f1297241ea K.Prasad            2009-06-01  591  }
0067f1297241ea K.Prasad            2009-06-01  592  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2958768397158645258==--

