Content-Type: multipart/mixed; boundary="===============3958073730435941637=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/rcu/tasks.h:1254:15: sparse: sparse: cast to non-scalar
Date: Sat, 06 Aug 2022 16:00:32 +0800
Message-ID: <202208061535.uokuJWx8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3958073730435941637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/rc=
u/tasks.h:1254:15: sparse: sparse: cast to non-scalar"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 0bcb386857376224b5fd3f38b6e3173ec74d8d36 rcu-tasks: Untrack blocked=
 RCU Tasks Trace at reader end
date:   7 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 weeks ago
config: alpha-randconfig-s042-20220804 (https://download.01.org/0day-ci/arc=
hive/20220806/202208061535.uokuJWx8-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0bcb386857376224b5fd3f38b6e3173ec74d8d36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0bcb386857376224b5fd3f38b6e3173ec74d8d36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash .// kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/update.c: note: in included file:
>> kernel/rcu/tasks.h:1254:15: sparse: sparse: cast to non-scalar
>> kernel/rcu/tasks.h:1254:15: sparse: sparse: cast from non-scalar
   kernel/rcu/tasks.h:329:9: sparse: sparse: context imbalance in 'call_rcu=
_tasks_generic' - wrong count at exit

vim +1254 kernel/rcu/tasks.h

3847b64570b175 Paul E. McKenney 2022-05-23  1244  =

d5f177d35c2442 Paul E. McKenney 2020-03-09  1245  /* If we are the last rea=
der, wake up the grace-period kthread. */
a5c071ccfa1728 Paul E. McKenney 2021-07-28  1246  void rcu_read_unlock_trac=
e_special(struct task_struct *t)
d5f177d35c2442 Paul E. McKenney 2020-03-09  1247  {
0bcb3868573762 Paul E. McKenney 2022-05-17  1248  	unsigned long flags;
0bcb3868573762 Paul E. McKenney 2022-05-17  1249  	struct rcu_tasks_percpu =
*rtpcp;
0bcb3868573762 Paul E. McKenney 2022-05-17  1250  	union rcu_special trs;
0bcb3868573762 Paul E. McKenney 2022-05-17  1251  =

0bcb3868573762 Paul E. McKenney 2022-05-17  1252  	// Open-coded full-word =
version of rcu_ld_need_qs().
0bcb3868573762 Paul E. McKenney 2022-05-17  1253  	smp_mb(); // Enforce ful=
l grace-period ordering.
0bcb3868573762 Paul E. McKenney 2022-05-17 @1254  	trs =3D smp_load_acquire=
(&t->trc_reader_special);
276c410448dbca Paul E. McKenney 2020-03-17  1255  =

3847b64570b175 Paul E. McKenney 2022-05-23  1256  	if (IS_ENABLED(CONFIG_TA=
SKS_TRACE_RCU_READ_MB) && t->trc_reader_special.b.need_mb)
276c410448dbca Paul E. McKenney 2020-03-17  1257  		smp_mb(); // Pairs with=
 update-side barriers.
276c410448dbca Paul E. McKenney 2020-03-17  1258  	// Update .need_qs befor=
e ->trc_reader_nesting for irq/NMI handlers.
0bcb3868573762 Paul E. McKenney 2022-05-17  1259  	if (trs.b.need_qs =3D=3D=
 (TRC_NEED_QS_CHECKED | TRC_NEED_QS)) {
3847b64570b175 Paul E. McKenney 2022-05-23  1260  		u8 result =3D rcu_trc_c=
mpxchg_need_qs(t, TRC_NEED_QS_CHECKED | TRC_NEED_QS,
3847b64570b175 Paul E. McKenney 2022-05-23  1261  						       TRC_NEED_QS_=
CHECKED);
3847b64570b175 Paul E. McKenney 2022-05-23  1262  =

0bcb3868573762 Paul E. McKenney 2022-05-17  1263  		WARN_ONCE(result !=3D t=
rs.b.need_qs, "%s: result =3D %d", __func__, result);
0bcb3868573762 Paul E. McKenney 2022-05-17  1264  	}
0bcb3868573762 Paul E. McKenney 2022-05-17  1265  	if (trs.b.blocked) {
0bcb3868573762 Paul E. McKenney 2022-05-17  1266  		rtpcp =3D per_cpu_ptr(r=
cu_tasks_trace.rtpcpu, t->trc_blkd_cpu);
0bcb3868573762 Paul E. McKenney 2022-05-17  1267  		raw_spin_lock_irqsave_r=
cu_node(rtpcp, flags);
0bcb3868573762 Paul E. McKenney 2022-05-17  1268  		list_del_init(&t->trc_b=
lkd_node);
0bcb3868573762 Paul E. McKenney 2022-05-17  1269  		WRITE_ONCE(t->trc_reade=
r_special.b.blocked, false);
0bcb3868573762 Paul E. McKenney 2022-05-17  1270  		raw_spin_unlock_irqrest=
ore_rcu_node(rtpcp, flags);
3847b64570b175 Paul E. McKenney 2022-05-23  1271  	}
a5c071ccfa1728 Paul E. McKenney 2021-07-28  1272  	WRITE_ONCE(t->trc_reader=
_nesting, 0);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1273  }
d5f177d35c2442 Paul E. McKenney 2020-03-09  1274  EXPORT_SYMBOL_GPL(rcu_rea=
d_unlock_trace_special);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1275  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3958073730435941637==--

