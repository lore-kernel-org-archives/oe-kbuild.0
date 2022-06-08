Content-Type: multipart/mixed; boundary="===============7759870549217621355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev 72/85] kernel/rcu/tasks.h:1256:15: sparse: sparse: cast to non-scalar
Date: Wed, 08 Jun 2022 21:48:05 +0800
Message-ID: <202206082139.u3sVMM3S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7759870549217621355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/rc=
u/tasks.h:1256:15: sparse: sparse: cast to non-scalar"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
head:   771634294326a0a64ecf1e9a9a824031cb3fb324
commit: 96102856a205a4cae8b18b468209127478176860 [72/85] rcu-tasks: Untrack=
 blocked RCU Tasks Trace at reader end
:::::: branch date: 13 hours ago
:::::: commit date: 21 hours ago
config: alpha-randconfig-s031-20220608 (https://download.01.org/0day-ci/arc=
hive/20220608/202206082139.u3sVMM3S-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-26-gb3cf30ba-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/96102856a205a4c=
ae8b18b468209127478176860
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev
        git checkout 96102856a205a4cae8b18b468209127478176860
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/rcu/update.c: note: in included file:
>> kernel/rcu/tasks.h:1256:15: sparse: sparse: cast to non-scalar
>> kernel/rcu/tasks.h:1256:15: sparse: sparse: cast from non-scalar

vim +1256 kernel/rcu/tasks.h

3f1afa3a24f543 Paul E. McKenney 2022-05-23  1246  =

d5f177d35c2442 Paul E. McKenney 2020-03-09  1247  /* If we are the last rea=
der, wake up the grace-period kthread. */
a5c071ccfa1728 Paul E. McKenney 2021-07-28  1248  void rcu_read_unlock_trac=
e_special(struct task_struct *t)
d5f177d35c2442 Paul E. McKenney 2020-03-09  1249  {
96102856a205a4 Paul E. McKenney 2022-05-17  1250  	unsigned long flags;
96102856a205a4 Paul E. McKenney 2022-05-17  1251  	struct rcu_tasks_percpu =
*rtpcp;
96102856a205a4 Paul E. McKenney 2022-05-17  1252  	union rcu_special trs;
96102856a205a4 Paul E. McKenney 2022-05-17  1253  =

96102856a205a4 Paul E. McKenney 2022-05-17  1254  	// Open-coded full-word =
version of rcu_ld_need_qs().
96102856a205a4 Paul E. McKenney 2022-05-17  1255  	smp_mb(); // Enforce ful=
l grace-period ordering.
96102856a205a4 Paul E. McKenney 2022-05-17 @1256  	trs =3D smp_load_acquire=
(&t->trc_reader_special);
276c410448dbca Paul E. McKenney 2020-03-17  1257  =

3f1afa3a24f543 Paul E. McKenney 2022-05-23  1258  	if (IS_ENABLED(CONFIG_TA=
SKS_TRACE_RCU_READ_MB) && t->trc_reader_special.b.need_mb)
276c410448dbca Paul E. McKenney 2020-03-17  1259  		smp_mb(); // Pairs with=
 update-side barriers.
276c410448dbca Paul E. McKenney 2020-03-17  1260  	// Update .need_qs befor=
e ->trc_reader_nesting for irq/NMI handlers.
96102856a205a4 Paul E. McKenney 2022-05-17  1261  	if (trs.b.need_qs =3D=3D=
 (TRC_NEED_QS_CHECKED | TRC_NEED_QS)) {
3f1afa3a24f543 Paul E. McKenney 2022-05-23  1262  		u8 result =3D rcu_trc_c=
mpxchg_need_qs(t, TRC_NEED_QS_CHECKED | TRC_NEED_QS,
3f1afa3a24f543 Paul E. McKenney 2022-05-23  1263  						       TRC_NEED_QS_=
CHECKED);
3f1afa3a24f543 Paul E. McKenney 2022-05-23  1264  =

96102856a205a4 Paul E. McKenney 2022-05-17  1265  		WARN_ONCE(result !=3D t=
rs.b.need_qs, "%s: result =3D %d", __func__, result);
96102856a205a4 Paul E. McKenney 2022-05-17  1266  	}
96102856a205a4 Paul E. McKenney 2022-05-17  1267  	if (trs.b.blocked) {
96102856a205a4 Paul E. McKenney 2022-05-17  1268  		rtpcp =3D per_cpu_ptr(r=
cu_tasks_trace.rtpcpu, t->trc_blkd_cpu);
96102856a205a4 Paul E. McKenney 2022-05-17  1269  		raw_spin_lock_irqsave_r=
cu_node(rtpcp, flags);
96102856a205a4 Paul E. McKenney 2022-05-17  1270  		list_del_init(&t->trc_b=
lkd_node);
96102856a205a4 Paul E. McKenney 2022-05-17  1271  		WRITE_ONCE(t->trc_reade=
r_special.b.blocked, false);
96102856a205a4 Paul E. McKenney 2022-05-17  1272  		raw_spin_unlock_irqrest=
ore_rcu_node(rtpcp, flags);
3f1afa3a24f543 Paul E. McKenney 2022-05-23  1273  	}
a5c071ccfa1728 Paul E. McKenney 2021-07-28  1274  	WRITE_ONCE(t->trc_reader=
_nesting, 0);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1275  }
d5f177d35c2442 Paul E. McKenney 2020-03-09  1276  EXPORT_SYMBOL_GPL(rcu_rea=
d_unlock_trace_special);
d5f177d35c2442 Paul E. McKenney 2020-03-09  1277  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7759870549217621355==--

