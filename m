Content-Type: multipart/mixed; boundary="===============7539517377028105439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-6.0.y-rt-rebase 40/59] kernel/trace/trace_output.c:485 trace_print_lat_fmt() warn: bitwise AND condition is false here
Date: Sun, 21 Aug 2022 10:55:01 +0800
Message-ID: <202208211040.KTcGpA9K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7539517377028105439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-6.0.y-rt-rebase
head:   e29a13b35f027385359191ab8a1b4ae82ce76d68
commit: 0b1db90e5c45022e8f4124bdb57e077fbec1e76c [40/59] sched: Add support=
 for lazy preemption
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: csky-randconfig-m041-20220821 (https://download.01.org/0day-ci/arch=
ive/20220821/202208211040.KTcGpA9K-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_output.c:485 trace_print_lat_fmt() warn: bitwise AND con=
dition is false here

vim +485 kernel/trace/trace_output.c

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
0b1db90e5c4502 Thomas Gleixner           2012-10-26  445  	char need_resche=
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
0b1db90e5c4502 Thomas Gleixner           2012-10-26  466  #ifndef CONFIG_PR=
EEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  467  	case TRACE_FLAG_=
NEED_RESCHED | TRACE_FLAG_PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  468  		need_resched =
=3D 'N';
e5137b50a06400 Peter Zijlstra            2013-10-04  469  		break;
0b1db90e5c4502 Thomas Gleixner           2012-10-26  470  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  471  	case TRACE_FLAG_=
NEED_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  472  		need_resched =
=3D 'n';
e5137b50a06400 Peter Zijlstra            2013-10-04  473  		break;
0b1db90e5c4502 Thomas Gleixner           2012-10-26  474  #ifndef CONFIG_PR=
EEMPT_LAZY
e5137b50a06400 Peter Zijlstra            2013-10-04  475  	case TRACE_FLAG_=
PREEMPT_RESCHED:
e5137b50a06400 Peter Zijlstra            2013-10-04  476  		need_resched =
=3D 'p';
e5137b50a06400 Peter Zijlstra            2013-10-04  477  		break;
0b1db90e5c4502 Thomas Gleixner           2012-10-26  478  #endif
e5137b50a06400 Peter Zijlstra            2013-10-04  479  	default:
e5137b50a06400 Peter Zijlstra            2013-10-04  480  		need_resched =
=3D '.';
e5137b50a06400 Peter Zijlstra            2013-10-04  481  		break;
e5137b50a06400 Peter Zijlstra            2013-10-04  482  	}
e5137b50a06400 Peter Zijlstra            2013-10-04  483  =

0b1db90e5c4502 Thomas Gleixner           2012-10-26  484  	need_resched_laz=
y =3D
0b1db90e5c4502 Thomas Gleixner           2012-10-26 @485  		(entry->flags &=
 TRACE_FLAG_NEED_RESCHED_LAZY) ? 'L' : '.';
0b1db90e5c4502 Thomas Gleixner           2012-10-26  486  =

10da37a645b5e9 David Sharp               2010-12-03  487  	hardsoft_irq =3D
7e6867bf831c71 Peter Zijlstra            2016-03-18  488  		(nmi && hardirq=
)     ? 'Z' :
7e6867bf831c71 Peter Zijlstra            2016-03-18  489  		nmi            =
      ? 'z' :
d9793bd8018f83 Arnaldo Carvalho de Melo  2009-02-03  490  		(hardirq && sof=
tirq) ? 'H' :
10da37a645b5e9 David Sharp               2010-12-03  491  		hardirq        =
      ? 'h' :
10da37a645b5e9 David Sharp               2010-12-03  492  		softirq        =
      ? 's' :
10da37a645b5e9 David Sharp               2010-12-03  493  		               =
        '.' ;
10da37a645b5e9 David Sharp               2010-12-03  494  =

0b1db90e5c4502 Thomas Gleixner           2012-10-26  495  	trace_seq_printf=
(s, "%c%c%c%c",
0b1db90e5c4502 Thomas Gleixner           2012-10-26  496  			 irqs_off, nee=
d_resched, need_resched_lazy,
0b1db90e5c4502 Thomas Gleixner           2012-10-26  497  			 hardsoft_irq);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  498  =

54357f0c9149c8 Thomas Gleixner           2021-08-10  499  	if (entry->preem=
pt_count & 0xf)
54357f0c9149c8 Thomas Gleixner           2021-08-10  500  		trace_seq_print=
f(s, "%x", entry->preempt_count & 0xf);
54357f0c9149c8 Thomas Gleixner           2021-08-10  501  	else
54357f0c9149c8 Thomas Gleixner           2021-08-10  502  		trace_seq_putc(=
s, '.');
54357f0c9149c8 Thomas Gleixner           2021-08-10  503  =

0b1db90e5c4502 Thomas Gleixner           2012-10-26  504  	if (entry->preem=
pt_lazy_count)
0b1db90e5c4502 Thomas Gleixner           2012-10-26  505  		trace_seq_print=
f(s, "%x", entry->preempt_lazy_count);
0b1db90e5c4502 Thomas Gleixner           2012-10-26  506  	else
0b1db90e5c4502 Thomas Gleixner           2012-10-26  507  		trace_seq_putc(=
s, '.');
0b1db90e5c4502 Thomas Gleixner           2012-10-26  508  =

54357f0c9149c8 Thomas Gleixner           2021-08-10  509  	if (entry->preem=
pt_count & 0xf0)
54357f0c9149c8 Thomas Gleixner           2021-08-10  510  		trace_seq_print=
f(s, "%x", entry->preempt_count >> 4);
637e7e864103a7 Steven Rostedt            2009-09-11  511  	else
19a7fe206232cc Steven Rostedt (Red Hat   2014-11-12  512) 		trace_seq_putc(=
s, '.');
829b876dfc94ea Steven Rostedt            2009-09-27  513  =

19a7fe206232cc Steven Rostedt (Red Hat   2014-11-12  514) 	return !trace_se=
q_has_overflowed(s);
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  515  }
c4a8e8be2d43cc Frederic Weisbecker       2009-02-02  516  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7539517377028105439==--

