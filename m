Content-Type: multipart/mixed; boundary="===============0507305560462476759=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [paulmck-rcu:dev.2021.12.07a 56/57] kernel/rcu/tree.c:4312 rcu_cpu_starting() error: uninitialized symbol 'flags'.
Date: Sat, 11 Dec 2021 05:57:33 +0800
Message-ID: <202112110527.4F48SvmP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0507305560462476759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Woodhouse <dwmw@amazon.co.uk>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it dev.2021.12.07a
head:   89ddc546d3ad541bc89ec553c92036c98aef57a6
commit: 342f2d0f88f3c2d7ab2ae206be5846579319e3bf [56/57] rcu: Kill rnp->ofl=
_seq and use only rcu_state.ofl_lock for exclusion
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112110527.4F48SvmP-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/tree.c:4312 rcu_cpu_starting() error: uninitialized symbol 'flag=
s'.

vim +/flags +4312 kernel/rcu/tree.c

4df8374254ea92 Thomas Gleixner         2016-07-13  4266  =

7ec99de36f4026 Paul E. McKenney        2016-06-30  4267  /*
7ec99de36f4026 Paul E. McKenney        2016-06-30  4268   * Mark the specif=
ied CPU as being online so that subsequent grace periods
7ec99de36f4026 Paul E. McKenney        2016-06-30  4269   * (both expedited=
 and normal) will wait on it.  Note that this means that
7ec99de36f4026 Paul E. McKenney        2016-06-30  4270   * incoming CPUs a=
re not allowed to use RCU read-side critical sections
7ec99de36f4026 Paul E. McKenney        2016-06-30  4271   * until this func=
tion is called.  Failing to observe this restriction
7ec99de36f4026 Paul E. McKenney        2016-06-30  4272   * will result in =
lockdep splats.
deb34f36439808 Paul E. McKenney        2017-03-23  4273   *
deb34f36439808 Paul E. McKenney        2017-03-23  4274   * Note that this =
function is special in that it is invoked directly
deb34f36439808 Paul E. McKenney        2017-03-23  4275   * from the incomi=
ng CPU rather than from the cpuhp_step mechanism.
deb34f36439808 Paul E. McKenney        2017-03-23  4276   * This is because=
 this function must be invoked at a precise location.
7ec99de36f4026 Paul E. McKenney        2016-06-30  4277   */
7ec99de36f4026 Paul E. McKenney        2016-06-30  4278  void rcu_cpu_start=
ing(unsigned int cpu)
7ec99de36f4026 Paul E. McKenney        2016-06-30  4279  {
342f2d0f88f3c2 David Woodhouse         2021-12-09  4280  	unsigned long fla=
gs, seq_flags;
7ec99de36f4026 Paul E. McKenney        2016-06-30  4281  	unsigned long mas=
k;
7ec99de36f4026 Paul E. McKenney        2016-06-30  4282  	struct rcu_data *=
rdp;
7ec99de36f4026 Paul E. McKenney        2016-06-30  4283  	struct rcu_node *=
rnp;
abfce041481414 Wei Yang                2020-04-19  4284  	bool newcpu;
7ec99de36f4026 Paul E. McKenney        2016-06-30  4285  =

c0f97f20e5d97a Paul E. McKenney        2020-07-24  4286  	rdp =3D per_cpu_p=
tr(&rcu_data, cpu);
c0f97f20e5d97a Paul E. McKenney        2020-07-24  4287  	if (rdp->cpu_star=
ted)
f64c6013a20293 Peter Zijlstra          2018-05-22  4288  		return;
c0f97f20e5d97a Paul E. McKenney        2020-07-24  4289  	rdp->cpu_started =
=3D true;
f64c6013a20293 Peter Zijlstra          2018-05-22  4290  =

7ec99de36f4026 Paul E. McKenney        2016-06-30  4291  	rnp =3D rdp->myno=
de;
7ec99de36f4026 Paul E. McKenney        2016-06-30  4292  	mask =3D rdp->grp=
mask;
342f2d0f88f3c2 David Woodhouse         2021-12-09  4293  	local_irq_save(se=
q_flags);
342f2d0f88f3c2 David Woodhouse         2021-12-09  4294  	arch_spin_lock(&r=
cu_state.ofl_lock);
2caebefb00f03b Paul E. McKenney        2021-07-28  4295  	rcu_dynticks_eqs_=
online();
4d60b475f858eb Paul E. McKenney        2020-10-13  4296  	smp_mb(); // Pair=
 with rcu_gp_cleanup()'s ->ofl_seq barrier().
342f2d0f88f3c2 David Woodhouse         2021-12-09  4297  	raw_spin_lock_rcu=
_node(rnp);
105abf82b0a626 Paul E. McKenney        2020-01-03  4298  	WRITE_ONCE(rnp->q=
smaskinitnext, rnp->qsmaskinitnext | mask);
abfce041481414 Wei Yang                2020-04-19  4299  	newcpu =3D !(rnp-=
>expmaskinitnext & mask);
7ec99de36f4026 Paul E. McKenney        2016-06-30  4300  	rnp->expmaskinitn=
ext |=3D mask;
313517fc44fb2d Paul E. McKenney        2017-06-08  4301  	/* Allow lockless=
 access for expedited grace periods. */
abfce041481414 Wei Yang                2020-04-19  4302  	smp_store_release=
(&rcu_state.ncpus, rcu_state.ncpus + newcpu); /* ^^^ */
2f08469563550d Paul E. McKenney        2020-02-10  4303  	ASSERT_EXCLUSIVE_=
WRITER(rcu_state.ncpus);
e05121ba5b81e2 Paul E. McKenney        2018-05-07  4304  	rcu_gpnum_ovf(rnp=
, rdp); /* Offline-induced counter wrap? */
eb7a6653887b54 Paul E. McKenney        2018-07-05  4305  	rdp->rcu_onl_gp_s=
eq =3D READ_ONCE(rcu_state.gp_seq);
eb7a6653887b54 Paul E. McKenney        2018-07-05  4306  	rdp->rcu_onl_gp_f=
lags =3D READ_ONCE(rcu_state.gp_flags);
9f866dac94292f Joel Fernandes (Google  2020-09-29  4307) =

9f866dac94292f Joel Fernandes (Google  2020-09-29  4308) 	/* An incoming CP=
U should never be blocking a grace period. */
9f866dac94292f Joel Fernandes (Google  2020-09-29  4309) 	if (WARN_ON_ONCE(=
rnp->qsmask & mask)) { /* RCU waiting on incoming CPU? */
516e5ae0c94016 Joel Fernandes (Google  2019-09-05  4310) 		rcu_disable_urge=
ncy_upon_qs(rdp);
99990da1b3c00f Paul E. McKenney        2018-05-03  4311  		/* Report QS -af=
ter- changing ->qsmaskinitnext! */
b50912d0b5e03f Paul E. McKenney        2018-07-03 @4312  		rcu_report_qs_rn=
p(mask, rnp, rnp->gp_seq, flags);
99990da1b3c00f Paul E. McKenney        2018-05-03  4313  	} else {
7ec99de36f4026 Paul E. McKenney        2016-06-30  4314  		raw_spin_unlock_=
irqrestore_rcu_node(rnp, flags);
7ec99de36f4026 Paul E. McKenney        2016-06-30  4315  	}
342f2d0f88f3c2 David Woodhouse         2021-12-09  4316  	arch_spin_unlock(=
&rcu_state.ofl_lock);
342f2d0f88f3c2 David Woodhouse         2021-12-09  4317  	local_irq_restore=
(seq_flags);
313517fc44fb2d Paul E. McKenney        2017-06-08  4318  	smp_mb(); /* Ensu=
re RCU read-side usage follows above initialization. */
7ec99de36f4026 Paul E. McKenney        2016-06-30  4319  }
7ec99de36f4026 Paul E. McKenney        2016-06-30  4320  =


:::::: The code at line 4312 was first introduced by commit
:::::: b50912d0b5e03f11004fec1e2b50244de9e2fa41 rcu: Remove rsp parameter f=
rom rcu_report_qs_rnp()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0507305560462476759==--

