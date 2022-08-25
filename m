Content-Type: multipart/mixed; boundary="===============8839929651626659369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3092/3266] kernel/smpboot.c:449 cpu_wait_death() error: uninitialized symbol 'oldstate'.
Date: Thu, 25 Aug 2022 19:33:46 +0800
Message-ID: <202208251909.gOzRDLgL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8839929651626659369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Uros,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b5d939c951865f6fc229094e84b77c9a9e0ed0c7
commit: 2d1e07c7534c14e56ac3818fa24e7c1643a9b1dc [3092/3266] smpboot: use a=
tomic_try_cmpxchg in cpu_wait_death and cpu_report_death
:::::: branch date: 6 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
825/202208251909.gOzRDLgL-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/smpboot.c:449 cpu_wait_death() error: uninitialized symbol 'oldstate=
'.

vim +/oldstate +449 kernel/smpboot.c

8038dad7e88858 Paul E. McKenney 2015-02-25  421  =

8038dad7e88858 Paul E. McKenney 2015-02-25  422  /*
8038dad7e88858 Paul E. McKenney 2015-02-25  423   * Wait for the specified =
CPU to exit the idle loop and die.
8038dad7e88858 Paul E. McKenney 2015-02-25  424   */
8038dad7e88858 Paul E. McKenney 2015-02-25  425  bool cpu_wait_death(unsign=
ed int cpu, int seconds)
8038dad7e88858 Paul E. McKenney 2015-02-25  426  {
8038dad7e88858 Paul E. McKenney 2015-02-25  427  	int jf_left =3D seconds *=
 HZ;
8038dad7e88858 Paul E. McKenney 2015-02-25  428  	int oldstate;
8038dad7e88858 Paul E. McKenney 2015-02-25  429  	bool ret =3D true;
8038dad7e88858 Paul E. McKenney 2015-02-25  430  	int sleep_jf =3D 1;
8038dad7e88858 Paul E. McKenney 2015-02-25  431  =

8038dad7e88858 Paul E. McKenney 2015-02-25  432  	might_sleep();
8038dad7e88858 Paul E. McKenney 2015-02-25  433  =

8038dad7e88858 Paul E. McKenney 2015-02-25  434  	/* The outgoing CPU will =
normally get done quite quickly. */
8038dad7e88858 Paul E. McKenney 2015-02-25  435  	if (atomic_read(&per_cpu(=
cpu_hotplug_state, cpu)) =3D=3D CPU_DEAD)
8038dad7e88858 Paul E. McKenney 2015-02-25  436  		goto update_state;
8038dad7e88858 Paul E. McKenney 2015-02-25  437  	udelay(5);
8038dad7e88858 Paul E. McKenney 2015-02-25  438  =

8038dad7e88858 Paul E. McKenney 2015-02-25  439  	/* But if the outgoing CP=
U dawdles, wait increasingly long times. */
8038dad7e88858 Paul E. McKenney 2015-02-25  440  	while (atomic_read(&per_c=
pu(cpu_hotplug_state, cpu)) !=3D CPU_DEAD) {
8038dad7e88858 Paul E. McKenney 2015-02-25  441  		schedule_timeout_uninter=
ruptible(sleep_jf);
8038dad7e88858 Paul E. McKenney 2015-02-25  442  		jf_left -=3D sleep_jf;
8038dad7e88858 Paul E. McKenney 2015-02-25  443  		if (jf_left <=3D 0)
8038dad7e88858 Paul E. McKenney 2015-02-25  444  			break;
8038dad7e88858 Paul E. McKenney 2015-02-25  445  		sleep_jf =3D DIV_ROUND_U=
P(sleep_jf * 11, 10);
8038dad7e88858 Paul E. McKenney 2015-02-25  446  	}
8038dad7e88858 Paul E. McKenney 2015-02-25  447  	oldstate =3D atomic_read(=
&per_cpu(cpu_hotplug_state, cpu));
2d1e07c7534c14 Uros Bizjak      2022-08-23  448  update_state:
8038dad7e88858 Paul E. McKenney 2015-02-25 @449  	if (oldstate =3D=3D CPU_D=
EAD) {
8038dad7e88858 Paul E. McKenney 2015-02-25  450  		/* Outgoing CPU died nor=
mally, update state. */
8038dad7e88858 Paul E. McKenney 2015-02-25  451  		smp_mb(); /* atomic_read=
() before update. */
8038dad7e88858 Paul E. McKenney 2015-02-25  452  		atomic_set(&per_cpu(cpu_=
hotplug_state, cpu), CPU_POST_DEAD);
8038dad7e88858 Paul E. McKenney 2015-02-25  453  	} else {
8038dad7e88858 Paul E. McKenney 2015-02-25  454  		/* Outgoing CPU still ha=
sn't died, set state accordingly. */
2d1e07c7534c14 Uros Bizjak      2022-08-23  455  		if (!atomic_try_cmpxchg(=
&per_cpu(cpu_hotplug_state, cpu),
2d1e07c7534c14 Uros Bizjak      2022-08-23  456  					&oldstate, CPU_BROKEN=
))
8038dad7e88858 Paul E. McKenney 2015-02-25  457  			goto update_state;
8038dad7e88858 Paul E. McKenney 2015-02-25  458  		ret =3D false;
8038dad7e88858 Paul E. McKenney 2015-02-25  459  	}
8038dad7e88858 Paul E. McKenney 2015-02-25  460  	return ret;
8038dad7e88858 Paul E. McKenney 2015-02-25  461  }
8038dad7e88858 Paul E. McKenney 2015-02-25  462  =


:::::: The code@line 449 was first introduced by commit
:::::: 8038dad7e888581266c76df15d70ca457a3c5910 smpboot: Add common code fo=
r notification from dying CPU

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8839929651626659369==--

