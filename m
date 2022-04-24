Content-Type: multipart/mixed; boundary="===============3616656454680297250=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] rcu: Dump all rcuc kthreads status for CPUs that not report quiescent state
Date: Sun, 24 Apr 2022 16:05:15 +0800
Message-ID: <202204241503.imwh5SqZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3616656454680297250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220424041747.3172671-1-qiang1.zhang@intel.com>
References: <20220424041747.3172671-1-qiang1.zhang@intel.com>
TO: Zqiang <qiang1.zhang@intel.com>
TO: paulmck(a)kernel.org
TO: frederic(a)kernel.org
CC: rcu(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Zqiang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on paulmck-rcu/dev]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zqiang/rcu-Dump-all-=
rcuc-kthreads-status-for-CPUs-that-not-report-quiescent-state/20220424-1218=
50
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it dev
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
424/202204241503.imwh5SqZ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/tree_stall.h:467 print_cpu_stall_info() error: uninitialized sym=
bol 'j'.

vim +/j +467 kernel/rcu/tree_stall.h

c9515875850fef Zqiang           2022-01-25  428  =

59b73a27681c58 Paul E. McKenney 2019-01-11  429  /*
59b73a27681c58 Paul E. McKenney 2019-01-11  430   * Print out diagnostic in=
formation for the specified stalled CPU.
59b73a27681c58 Paul E. McKenney 2019-01-11  431   *
59b73a27681c58 Paul E. McKenney 2019-01-11  432   * If the specified CPU is=
 aware of the current RCU grace period, then
59b73a27681c58 Paul E. McKenney 2019-01-11  433   * print the number of sch=
eduling clock interrupts the CPU has taken
59b73a27681c58 Paul E. McKenney 2019-01-11  434   * during the time that it=
 has been aware.  Otherwise, print the number
59b73a27681c58 Paul E. McKenney 2019-01-11  435   * of RCU grace periods th=
at this CPU is ignorant of, for example, "1"
59b73a27681c58 Paul E. McKenney 2019-01-11  436   * if the CPU was aware of=
 the previous grace period.
59b73a27681c58 Paul E. McKenney 2019-01-11  437   *
e2c73a6860bdf5 Paul E. McKenney 2021-09-27  438   * Also print out idle inf=
o.
59b73a27681c58 Paul E. McKenney 2019-01-11  439   */
59b73a27681c58 Paul E. McKenney 2019-01-11  440  static void print_cpu_stal=
l_info(int cpu)
59b73a27681c58 Paul E. McKenney 2019-01-11  441  {
59b73a27681c58 Paul E. McKenney 2019-01-11  442  	unsigned long delta;
88375825171c7d Paul E. McKenney 2020-03-31  443  	bool falsepositive;
59b73a27681c58 Paul E. McKenney 2019-01-11  444  	struct rcu_data *rdp =3D =
per_cpu_ptr(&rcu_data, cpu);
59b73a27681c58 Paul E. McKenney 2019-01-11  445  	char *ticks_title;
59b73a27681c58 Paul E. McKenney 2019-01-11  446  	unsigned long ticks_value;
17d9de741a1aaf Zqiang           2022-04-24  447  	bool rcuc_starved;
17d9de741a1aaf Zqiang           2022-04-24  448  	unsigned long j;
59b73a27681c58 Paul E. McKenney 2019-01-11  449  =

59b73a27681c58 Paul E. McKenney 2019-01-11  450  	/*
59b73a27681c58 Paul E. McKenney 2019-01-11  451  	 * We could be printing a=
 lot while holding a spinlock.  Avoid
59b73a27681c58 Paul E. McKenney 2019-01-11  452  	 * triggering hard lockup.
59b73a27681c58 Paul E. McKenney 2019-01-11  453  	 */
59b73a27681c58 Paul E. McKenney 2019-01-11  454  	touch_nmi_watchdog();
59b73a27681c58 Paul E. McKenney 2019-01-11  455  =

59b73a27681c58 Paul E. McKenney 2019-01-11  456  	ticks_value =3D rcu_seq_c=
tr(rcu_state.gp_seq - rdp->gp_seq);
59b73a27681c58 Paul E. McKenney 2019-01-11  457  	if (ticks_value) {
59b73a27681c58 Paul E. McKenney 2019-01-11  458  		ticks_title =3D "GPs beh=
ind";
59b73a27681c58 Paul E. McKenney 2019-01-11  459  	} else {
59b73a27681c58 Paul E. McKenney 2019-01-11  460  		ticks_title =3D "ticks t=
his GP";
59b73a27681c58 Paul E. McKenney 2019-01-11  461  		ticks_value =3D rdp->tic=
ks_this_gp;
59b73a27681c58 Paul E. McKenney 2019-01-11  462  	}
59b73a27681c58 Paul E. McKenney 2019-01-11  463  	delta =3D rcu_seq_ctr(rdp=
->mynode->gp_seq - rdp->rcu_iw_gp_seq);
88375825171c7d Paul E. McKenney 2020-03-31  464  	falsepositive =3D rcu_is_=
gp_kthread_starving(NULL) &&
88375825171c7d Paul E. McKenney 2020-03-31  465  			rcu_dynticks_in_eqs(rcu=
_dynticks_snap(rdp));
17d9de741a1aaf Zqiang           2022-04-24  466  	rcuc_starved =3D rcu_is_r=
cuc_kthread_starving(rdp, &j);
17d9de741a1aaf Zqiang           2022-04-24 @467  	pr_err("\t%d-%c%c%c%c: (%=
lu %s) idle=3D%03x/%ld/%#lx softirq=3D%u/%u fqs=3D%ld rcuc=3D%ld jiffies(%s=
) %s\n",
59b73a27681c58 Paul E. McKenney 2019-01-11  468  	       cpu,
59b73a27681c58 Paul E. McKenney 2019-01-11  469  	       "O."[!!cpu_online(=
cpu)],
59b73a27681c58 Paul E. McKenney 2019-01-11  470  	       "o."[!!(rdp->grpma=
sk & rdp->mynode->qsmaskinit)],
59b73a27681c58 Paul E. McKenney 2019-01-11  471  	       "N."[!!(rdp->grpma=
sk & rdp->mynode->qsmaskinitnext)],
59b73a27681c58 Paul E. McKenney 2019-01-11  472  	       !IS_ENABLED(CONFIG=
_IRQ_WORK) ? '?' :
59b73a27681c58 Paul E. McKenney 2019-01-11  473  			rdp->rcu_iw_pending ? (=
int)min(delta, 9UL) + '0' :
59b73a27681c58 Paul E. McKenney 2019-01-11  474  				"!."[!delta],
59b73a27681c58 Paul E. McKenney 2019-01-11  475  	       ticks_value, ticks=
_title,
59b73a27681c58 Paul E. McKenney 2019-01-11  476  	       rcu_dynticks_snap(=
rdp) & 0xfff,
59b73a27681c58 Paul E. McKenney 2019-01-11  477  	       rdp->dynticks_nest=
ing, rdp->dynticks_nmi_nesting,
59b73a27681c58 Paul E. McKenney 2019-01-11  478  	       rdp->softirq_snap,=
 kstat_softirqs_cpu(RCU_SOFTIRQ, cpu),
88375825171c7d Paul E. McKenney 2020-03-31  479  	       data_race(rcu_stat=
e.n_force_qs) - rcu_state.n_force_qs_gpstart,
17d9de741a1aaf Zqiang           2022-04-24  480  	       j, rcuc_starved ? =
"starved" : "",
88375825171c7d Paul E. McKenney 2020-03-31  481  	       falsepositive ? " =
(false positive?)" : "");
59b73a27681c58 Paul E. McKenney 2019-01-11  482  }
59b73a27681c58 Paul E. McKenney 2019-01-11  483  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3616656454680297250==--

