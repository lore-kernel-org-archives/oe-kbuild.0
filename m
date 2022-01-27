Content-Type: multipart/mixed; boundary="===============3722877363181950595=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.17.y-rt-rebase 79/103] kernel/trace/trace_output.c:483 trace_print_lat_fmt() warn: bitwise AND condition is false here
Date: Thu, 27 Jan 2022 15:21:03 +0800
Message-ID: <202201271543.pM2tcSVW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3722877363181950595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.17.y-rt-rebase
head:   7ea0aa3ea9d10a340b9fe4cb19f8a47948e4f562
commit: 4e8c1def1137805b1a9d576c3ac092bd85177088 [79/103] sched: Add suppor=
t for lazy preemption
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20127/202201271543.pM2tcSVW-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_output.c:483 trace_print_lat_fmt() warn: bitwise AND con=
dition is false here

vim +483 kernel/trace/trace_output.c

f0868d1e23a8ef Steven Rostedt            2008-12-23  432  =

f81c972d27c367 Steven Rostedt            2009-09-11  433  /**
f81c972d27c367 Steven Rostedt            2009-09-11  434   * trace_print_la=
t_fmt - print the irq, preempt and lockdep fields
f81c972d27c367 Steven Rostedt            2009-09-11  435   * @s: trace seq =
struct to write to
f81c972d27c367 Steven Rostedt            2009-09-11  436   * @entry: The tr=
ace entry field from the ring buffer
f81c972d27c367 Steven Rostedt            2009-09-11  437   *
f81c972d27c367 Steven Rostedt            2009-09-11  438   * Prints the gen=
eric fields of irqs off, in hard or softirq, preempt
e6e1e2593592a8 Steven Rostedt            2011-03-09  439   * count.
f81c972d27c367 Steven Rostedt            2009-09-11  440   */
f81c972d27c367 Steven Rostedt            2009-09-11  441  int trace_print_l=
at_fmt(struct trace_seq *s, struct trace_entry *entry)
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  442  {
10da37a645b5e9 David Sharp               2010-12-03  443  	char hardsoft_ir=
q;
10da37a645b5e9 David Sharp               2010-12-03  444  	char need_resche=
d;
4e8c1def113780 Thomas Gleixner           2012-10-26  445  	char need_resche=
d_lazy;
10da37a645b5e9 David Sharp               2010-12-03  446  	char irqs_off;
10da37a645b5e9 David Sharp               2010-12-03  447  	int hardirq;
10da37a645b5e9 David Sharp               2010-12-03  448  	int softirq;
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  449  	int bh_off;
7e6867bf831c71 Peter Zijlstra            2016-03-18  450  	int nmi;
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  451  =

7e6867bf831c71 Peter Zijlstra            2016-03-18  452  	nmi =3D entry->f=
lags & TRACE_FLAG_NMI;
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  453  	hardirq =3D entr=
y->flags & TRACE_FLAG_HARDIRQ;
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  454  	softirq =3D entr=
y->flags & TRACE_FLAG_SOFTIRQ;
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  455  	bh_off =3D entry=
->flags & TRACE_FLAG_BH_OFF;
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  456  =

10da37a645b5e9 David Sharp               2010-12-03  457  	irqs_off =3D
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  458  		(entry->flags &=
 TRACE_FLAG_IRQS_OFF && bh_off) ? 'D' :
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  459  		(entry->flags &=
 TRACE_FLAG_IRQS_OFF) ? 'd' :
289e7b0f7eb47b Sebastian Andrzej Siewior 2021-12-13  460  		bh_off ? 'b' :
10da37a645b5e9 David Sharp               2010-12-03  461  		(entry->flags &=
 TRACE_FLAG_IRQS_NOSUPPORT) ? 'X' :
10da37a645b5e9 David Sharp               2010-12-03  462  		'.';
e5137b50a06400 Peter Zijlstra            2013-10-04  463  =

e5137b50a06400 Peter Zijlstra            2013-10-04  464  	switch (entry->f=
lags & (TRACE_FLAG_NEED_RESCHED |
e5137b50a06400 Peter Zijlstra            2013-10-04  465  				TRACE_FLAG_PR=
EEMPT_RESCHED)) {
e5137b50a06400 Peter Zijlstra            2013-10-04  466  	case TRACE_FLAG_=
NEED_RESCHED | TRACE_FLAG_PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  467  		need_resched =
=3D 'N';
e5137b50a06400 Peter Zijlstra            2013-10-04  468  		break;
4e8c1def113780 Thomas Gleixner           2012-10-26  469  #ifndef CONFIG_PR=
EEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  470  	case TRACE_FLAG_=
NEED_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  471  		need_resched =
=3D 'n';
e5137b50a06400 Peter Zijlstra            2013-10-04  472  		break;
4e8c1def113780 Thomas Gleixner           2012-10-26  473  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  474  	case TRACE_FLAG_=
PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  475  		need_resched =
=3D 'p';
e5137b50a06400 Peter Zijlstra            2013-10-04  476  		break;
e5137b50a06400 Peter Zijlstra            2013-10-04  477  	default:
e5137b50a06400 Peter Zijlstra            2013-10-04  478  		need_resched =
=3D '.';
e5137b50a06400 Peter Zijlstra            2013-10-04  479  		break;
e5137b50a06400 Peter Zijlstra            2013-10-04  480  	}
e5137b50a06400 Peter Zijlstra            2013-10-04  481  =

4e8c1def113780 Thomas Gleixner           2012-10-26  482  	need_resched_laz=
y =3D
4e8c1def113780 Thomas Gleixner           2012-10-26 @483  		(entry->flags &=
 TRACE_FLAG_NEED_RESCHED_LAZY) ? 'L' : '.';
4e8c1def113780 Thomas Gleixner           2012-10-26  484  =

10da37a645b5e9 David Sharp               2010-12-03  485  	hardsoft_irq =3D
7e6867bf831c71 Peter Zijlstra            2016-03-18  486  		(nmi && hardirq=
)     ? 'Z' :
7e6867bf831c71 Peter Zijlstra            2016-03-18  487  		nmi            =
      ? 'z' :
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  488  		(hardirq && sof=
tirq) ? 'H' :
10da37a645b5e9 David Sharp               2010-12-03  489  		hardirq        =
      ? 'h' :
10da37a645b5e9 David Sharp               2010-12-03  490  		softirq        =
      ? 's' :
10da37a645b5e9 David Sharp               2010-12-03  491  		               =
        '.' ;
10da37a645b5e9 David Sharp               2010-12-03  492  =

4e8c1def113780 Thomas Gleixner           2012-10-26  493  	trace_seq_printf=
(s, "%c%c%c%c",
4e8c1def113780 Thomas Gleixner           2012-10-26  494  			 irqs_off, nee=
d_resched, need_resched_lazy,
4e8c1def113780 Thomas Gleixner           2012-10-26  495  			 hardsoft_irq);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  496  =

54357f0c9149c8 Thomas Gleixner           2021-08-10  497  	if (entry->preem=
pt_count & 0xf)
54357f0c9149c8 Thomas Gleixner           2021-08-10  498  		trace_seq_print=
f(s, "%x", entry->preempt_count & 0xf);
54357f0c9149c8 Thomas Gleixner           2021-08-10  499  	else
54357f0c9149c8 Thomas Gleixner           2021-08-10  500  		trace_seq_putc(=
s, '.');
54357f0c9149c8 Thomas Gleixner           2021-08-10  501  =

4e8c1def113780 Thomas Gleixner           2012-10-26  502  	if (entry->preem=
pt_lazy_count)
4e8c1def113780 Thomas Gleixner           2012-10-26  503  		trace_seq_print=
f(s, "%x", entry->preempt_lazy_count);
4e8c1def113780 Thomas Gleixner           2012-10-26  504  	else
4e8c1def113780 Thomas Gleixner           2012-10-26  505  		trace_seq_putc(=
s, '.');
4e8c1def113780 Thomas Gleixner           2012-10-26  506  =

54357f0c9149c8 Thomas Gleixner           2021-08-10  507  	if (entry->preem=
pt_count & 0xf0)
54357f0c9149c8 Thomas Gleixner           2021-08-10  508  		trace_seq_print=
f(s, "%x", entry->preempt_count >> 4);
637e7e864103a7 Steven Rostedt            2009-09-11  509  	else
19a7fe206232cc Steven Rostedt (Red Hat   2014-11-12  510) 		trace_seq_putc(=
s, '.');
829b876dfc94ea Steven Rostedt            2009-09-27  511  =

19a7fe206232cc Steven Rostedt (Red Hat   2014-11-12  512) 	return !trace_se=
q_has_overflowed(s);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  513  }
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  514  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3722877363181950595==--

