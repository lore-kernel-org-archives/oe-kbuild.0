Content-Type: multipart/mixed; boundary="===============3954314794395928130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [paulmck-rcu:dev.2021.12.09b 35/37] kernel/rcu/tree.c:4090:2: warning: Value stored to 'lseq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 17 Dec 2021 01:50:27 +0800
Message-ID: <202112170131.AdOf6Tpw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3954314794395928130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it dev.2021.12.09b
head:   0f1825f9df5a83cfeca5f1ecce96633223bf78d2
commit: ca34220fecf856ef7521c912a8812f2c1ea53ab3 [35/37] rcu: Rework rcu_ba=
rrier() and callback-migration logic
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211214 (https://download.01.org/0day-ci/ar=
chive/20211217/202112170131.AdOf6Tpw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git/commit/?id=3Dca34220fecf856ef7521c912a8812f2c1ea53ab3
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/ker=
nel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2021.12.09b
        git checkout ca34220fecf856ef7521c912a8812f2c1ea53ab3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/bpf/cgroup.c:535:54: note: Passing null pointer value via 4th par=
ameter 'link'
           ret =3D __cgroup_bpf_attach(cgrp, prog, replace_prog, link, type=
, flags);
                                                               ^~~~
   kernel/bpf/cgroup.c:535:8: note: Calling '__cgroup_bpf_attach'
           ret =3D __cgroup_bpf_attach(cgrp, prog, replace_prog, link, type=
, flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/bpf/cgroup.c:447:8: note: Assuming the condition is false
           if (((flags & BPF_F_ALLOW_OVERRIDE) && (flags & BPF_F_ALLOW_MULT=
I)) ||
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:447:38: note: Left side of '&&' is false
           if (((flags & BPF_F_ALLOW_OVERRIDE) && (flags & BPF_F_ALLOW_MULT=
I)) ||
                                               ^
   kernel/bpf/cgroup.c:448:8: note: Assuming the condition is false
               ((flags & BPF_F_REPLACE) && !(flags & BPF_F_ALLOW_MULTI)))
                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:448:31: note: Left side of '&&' is false
               ((flags & BPF_F_REPLACE) && !(flags & BPF_F_ALLOW_MULTI)))
                                        ^
   kernel/bpf/cgroup.c:451:6: note: 'link' is null
           if (link && (prog || replace_prog))
               ^~~~
   kernel/bpf/cgroup.c:451:11: note: Left side of '&&' is false
           if (link && (prog || replace_prog))
                    ^
   kernel/bpf/cgroup.c:454:2: note: Taking false branch
           if (!!replace_prog !=3D !!(flags & BPF_F_REPLACE))
           ^
   kernel/bpf/cgroup.c:459:6: note: 'atype' is >=3D 0
           if (atype < 0)
               ^~~~~
   kernel/bpf/cgroup.c:459:2: note: Taking false branch
           if (atype < 0)
           ^
   kernel/bpf/cgroup.c:464:6: note: Assuming the condition is false
           if (!hierarchy_allows_attach(cgrp, atype))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:464:2: note: Taking false branch
           if (!hierarchy_allows_attach(cgrp, atype))
           ^
   kernel/bpf/cgroup.c:467:6: note: Assuming the condition is false
           if (!list_empty(progs) && cgrp->bpf.flags[atype] !=3D saved_flag=
s)
               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:467:25: note: Left side of '&&' is false
           if (!list_empty(progs) && cgrp->bpf.flags[atype] !=3D saved_flag=
s)
                                  ^
   kernel/bpf/cgroup.c:474:6: note: Assuming the condition is false
           if (prog_list_length(progs) >=3D BPF_CGROUP_MAX_PROGS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:474:2: note: Taking false branch
           if (prog_list_length(progs) >=3D BPF_CGROUP_MAX_PROGS)
           ^
   kernel/bpf/cgroup.c:479:6: note: Calling 'IS_ERR'
           if (IS_ERR(pl))
               ^~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:479:6: note: Returning from 'IS_ERR'
           if (IS_ERR(pl))
               ^~~~~~~~~~
   kernel/bpf/cgroup.c:479:2: note: Taking false branch
           if (IS_ERR(pl))
           ^
   kernel/bpf/cgroup.c:483:11: note: '?' condition is false
                                         prog ? : link->link.prog, cgrp))
                                         ^
   kernel/bpf/cgroup.c:483:20: note: Dereference of null pointer
                                         prog ? : link->link.prog, cgrp))
                                                  ^~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   kernel/irq/matrix.c:289:25: warning: Value stored to 'end' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int bit, cpu, end =3D m->alloc_end;
                                  ^~~   ~~~~~~~~~~~~
   kernel/irq/matrix.c:289:25: note: Value stored to 'end' during its initi=
alization is never read
           unsigned int bit, cpu, end =3D m->alloc_end;
                                  ^~~   ~~~~~~~~~~~~
   6 warnings generated.
   kernel/rcu/tree.c:2393:19: warning: Value stored to 'rnp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rcu_node *rnp =3D rdp->mynode;
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2393:19: note: Value stored to 'rnp' during its initia=
lization is never read
           struct rcu_node *rnp =3D rdp->mynode;
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2458:19: warning: Value stored to 'rnp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rcu_node *rnp =3D rdp->mynode;  /* Outgoing CPU's rdp & r=
np. */
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2458:19: note: Value stored to 'rnp' during its initia=
lization is never read
           struct rcu_node *rnp =3D rdp->mynode;  /* Outgoing CPU's rdp & r=
np. */
                            ^~~   ~~~~~~~~~~~
>> kernel/rcu/tree.c:4090:2: warning: Value stored to 'lseq' is never read =
[clang-analyzer-deadcode.DeadStores]
           lseq =3D rcu_state.barrier_sequence;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4090:2: note: Value stored to 'lseq' is never read
           lseq =3D rcu_state.barrier_sequence;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   6 warnings generated.
   Suppressed 6 warnings (6 with check filters).
   3 warnings generated.
   kernel/time/ntp.c:293:29: warning: The result of the left shift is undef=
ined because the left operand is negative [clang-analyzer-core.UndefinedBin=
aryOperatorResult]
           return div64_long(offset64 << (NTP_SCALE_SHIFT - SHIFT_FLL), sec=
s);
                                      ^
   kernel/time/ntp.c:767:6: note: Assuming the condition is false
           if (txc->modes & ADJ_ADJTIME) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:767:2: note: Taking false branch
           if (txc->modes & ADJ_ADJTIME) {
           ^
   kernel/time/ntp.c:781:7: note: Assuming field 'modes' is not equal to 0
                   if (txc->modes) {
                       ^~~~~~~~~~
   kernel/time/ntp.c:781:3: note: Taking true branch
                   if (txc->modes) {
                   ^
   kernel/time/ntp.c:788:4: note: Calling 'process_adjtimex_modes'
                           process_adjtimex_modes(txc, time_tai);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:712:6: note: Assuming the condition is false
           if (txc->modes & ADJ_STATUS)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:712:2: note: Taking false branch
           if (txc->modes & ADJ_STATUS)
           ^
   kernel/time/ntp.c:715:6: note: Assuming the condition is false
           if (txc->modes & ADJ_NANO)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:715:2: note: Taking false branch
           if (txc->modes & ADJ_NANO)
           ^
   kernel/time/ntp.c:718:6: note: Assuming the condition is false
           if (txc->modes & ADJ_MICRO)
               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:718:2: note: Taking false branch
           if (txc->modes & ADJ_MICRO)
           ^
   kernel/time/ntp.c:721:6: note: Assuming the condition is false
           if (txc->modes & ADJ_FREQUENCY) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:721:2: note: Taking false branch
           if (txc->modes & ADJ_FREQUENCY) {
           ^
   kernel/time/ntp.c:729:6: note: Assuming the condition is false
           if (txc->modes & ADJ_MAXERROR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:729:2: note: Taking false branch
           if (txc->modes & ADJ_MAXERROR)
           ^
   kernel/time/ntp.c:732:6: note: Assuming the condition is false
           if (txc->modes & ADJ_ESTERROR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:732:2: note: Taking false branch
           if (txc->modes & ADJ_ESTERROR)
           ^
   kernel/time/ntp.c:735:6: note: Assuming the condition is false
           if (txc->modes & ADJ_TIMECONST) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:735:2: note: Taking false branch
           if (txc->modes & ADJ_TIMECONST) {
           ^
   kernel/time/ntp.c:743:6: note: Assuming the condition is false
           if (txc->modes & ADJ_TAI &&
               ^~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:743:27: note: Left side of '&&' is false
           if (txc->modes & ADJ_TAI &&
                                    ^
   kernel/time/ntp.c:747:6: note: Assuming the condition is true
           if (txc->modes & ADJ_OFFSET)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:747:2: note: Taking true branch
           if (txc->modes & ADJ_OFFSET)
           ^
   kernel/time/ntp.c:748:3: note: Calling 'ntp_update_offset'
                   ntp_update_offset(txc->offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:302:6: note: Assuming the condition is false
           if (!(time_status & STA_PLL))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:302:2: note: Taking false branch
           if (!(time_status & STA_PLL))
           ^
   kernel/time/ntp.c:305:6: note: Assuming the condition is false

vim +/lseq +4090 kernel/rcu/tree.c

ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  405=
8  =

dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  405=
9  /**
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
0   * rcu_barrier - Wait until all in-flight call_rcu() callbacks complete.
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
1   *
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
2   * Note that this primitive does not necessarily wait for an RCU grace p=
eriod
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
3   * to complete.  For example, if there are no RCU callbacks queued anywh=
ere
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
4   * in the system, then rcu_barrier() is within its rights to return
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
5   * immediately, without waiting for anything, much less an RCU grace per=
iod.
d0ec774cb2599c8 kernel/rcutree.c  Paul E. McKenney          2009-10-06  406=
6   */
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  406=
7  void rcu_barrier(void)
d0ec774cb2599c8 kernel/rcutree.c  Paul E. McKenney          2009-10-06  406=
8  {
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  406=
9  	uintptr_t cpu;
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  407=
0  	unsigned long flags;
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  407=
1  	unsigned long gseq;
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  407=
2  	unsigned long lseq;
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  407=
3  	struct rcu_data *rdp;
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  407=
4  	unsigned long s =3D rcu_seq_snap(&rcu_state.barrier_sequence);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  407=
5  =

dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  407=
6  	rcu_barrier_trace(TPS("Begin"), -1, s);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  407=
7  =

e74f4c4564455c9 kernel/rcutree.c  Paul E. McKenney          2009-10-06  407=
8  	/* Take mutex to serialize concurrent rcu_barrier() requests. */
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  407=
9  	mutex_lock(&rcu_state.barrier_mutex);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  408=
0  =

4f525a528b9e755 kernel/rcu/tree.c Paul E. McKenney          2015-06-26  408=
1  	/* Did someone else do our work for us? */
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  408=
2  	if (rcu_seq_done(&rcu_state.barrier_sequence, s)) {
ae788da94567b1c kernel/rcu/tree.c Paul E. McKenney          2021-12-10  408=
3  		rcu_barrier_trace(TPS("EarlyExit"), -1, rcu_state.barrier_sequence);
cf3a9c4842b1e09 kernel/rcutree.c  Paul E. McKenney          2012-05-29  408=
4  		smp_mb(); /* caller's subsequent code after above check. */
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  408=
5  		mutex_unlock(&rcu_state.barrier_mutex);
cf3a9c4842b1e09 kernel/rcutree.c  Paul E. McKenney          2012-05-29  408=
6  		return;
cf3a9c4842b1e09 kernel/rcutree.c  Paul E. McKenney          2012-05-29  408=
7  	}
cf3a9c4842b1e09 kernel/rcutree.c  Paul E. McKenney          2012-05-29  408=
8  =

4f525a528b9e755 kernel/rcu/tree.c Paul E. McKenney          2015-06-26  408=
9  	/* Mark the start of the barrier operation. */
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14 @409=
0  	lseq =3D rcu_state.barrier_sequence;
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  409=
1  	rcu_seq_start(&rcu_state.barrier_sequence);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  409=
2  	gseq =3D rcu_state.barrier_sequence;
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  409=
3  	rcu_barrier_trace(TPS("Inc1"), -1, rcu_state.barrier_sequence);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  409=
4  =

d0ec774cb2599c8 kernel/rcutree.c  Paul E. McKenney          2009-10-06  409=
5  	/*
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  409=
6  	 * Initialize the count to two rather than to zero in order
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  409=
7  	 * to avoid a too-soon return to zero in case of an immediate
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  409=
8  	 * invocation of the just-enqueued callback (or preemption of
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  409=
9  	 * this task).  Exclude CPU-hotplug operations to ensure that no
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  410=
0  	 * offline non-offloaded CPU has callbacks queued.
d0ec774cb2599c8 kernel/rcutree.c  Paul E. McKenney          2009-10-06  410=
1  	 */
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  410=
2  	init_completion(&rcu_state.barrier_completion);
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  410=
3  	atomic_set(&rcu_state.barrier_cpu_count, 2);
d3dd95a8853f1d5 kernel/rcu/tree.c Sebastian Andrzej Siewior 2021-08-03  410=
4  	cpus_read_lock();
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  410=
5  =

b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  410=
6  	/*
1331e7a1bbe1f11 kernel/rcutree.c  Paul E. McKenney          2012-08-02  410=
7  	 * Force each CPU with callbacks to register a new callback.
1331e7a1bbe1f11 kernel/rcutree.c  Paul E. McKenney          2012-08-02  410=
8  	 * When that callback is invoked, we will know that all of the
1331e7a1bbe1f11 kernel/rcutree.c  Paul E. McKenney          2012-08-02  410=
9  	 * corresponding CPU's preceding callbacks have been invoked.
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  411=
0  	 */
3fbfbf7a3b66ec4 kernel/rcutree.c  Paul E. McKenney          2012-08-19  411=
1  	for_each_possible_cpu(cpu) {
da1df50d16171f4 kernel/rcu/tree.c Paul E. McKenney          2018-07-03  411=
2  		rdp =3D per_cpu_ptr(&rcu_data, cpu);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  411=
3  retry:
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  411=
4  		if (READ_ONCE(rdp->barrier_seq_snap) =3D=3D gseq)
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  411=
5  			continue;
ae788da94567b1c kernel/rcu/tree.c Paul E. McKenney          2021-12-10  411=
6  		if (!rcu_segcblist_n_cbs(&rdp->cblist)) {
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  411=
7  			raw_spin_lock_irqsave(&rdp->barrier_lock, flags);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  411=
8  			WRITE_ONCE(rdp->barrier_seq_snap, gseq);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  411=
9  			raw_spin_unlock_irqrestore(&rdp->barrier_lock, flags);
ae788da94567b1c kernel/rcu/tree.c Paul E. McKenney          2021-12-10  412=
0  			rcu_barrier_trace(TPS("NQ"), cpu, rcu_state.barrier_sequence);
ce5215c1342c6c8 kernel/rcu/tree.c Paul E. McKenney          2019-04-12  412=
1  			continue;
ae788da94567b1c kernel/rcu/tree.c Paul E. McKenney          2021-12-10  412=
2  		}
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  412=
3  		if (rcu_rdp_cpu_online(rdp)) {
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  412=
4  			if (smp_call_function_single(cpu, rcu_barrier_handler, (void *)cpu, 1=
)) {
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  412=
5  				schedule_timeout_uninterruptible(1);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  412=
6  				goto retry;
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  412=
7  			}
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  412=
8  			WARN_ON_ONCE(READ_ONCE(rdp->barrier_seq_snap) !=3D gseq);
ae788da94567b1c kernel/rcu/tree.c Paul E. McKenney          2021-12-10  412=
9  			rcu_barrier_trace(TPS("OnlineQ"), cpu, rcu_state.barrier_sequence);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
0  			continue;
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  413=
1  		}
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
2  		if (!rcu_barrier_entrain_if_ofl(rdp)) {
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
3  			schedule_timeout_uninterruptible(1);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
4  			goto retry;
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
5  		}
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
6  		WARN_ON_ONCE(READ_ONCE(rdp->barrier_seq_snap) !=3D gseq);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  413=
7  		rcu_barrier_trace(TPS("OfflineNoCBQ"), cpu, rcu_state.barrier_sequence=
);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  413=
8  	}
d3dd95a8853f1d5 kernel/rcu/tree.c Sebastian Andrzej Siewior 2021-08-03  413=
9  	cpus_read_unlock();
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
0  =

b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
1  	/*
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
2  	 * Now that we have an rcu_barrier_callback() callback on each
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
3  	 * CPU, and thus each counted, remove the initial count.
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
4  	 */
127e29815b4b220 kernel/rcu/tree.c Paul E. McKenney          2020-02-11  414=
5  	if (atomic_sub_and_test(2, &rcu_state.barrier_cpu_count))
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  414=
6  		complete(&rcu_state.barrier_completion);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
7  =

b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  414=
8  	/* Wait for all rcu_barrier_callback() callbacks to be invoked. */
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  414=
9  	wait_for_completion(&rcu_state.barrier_completion);
b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  415=
0  =

4f525a528b9e755 kernel/rcu/tree.c Paul E. McKenney          2015-06-26  415=
1  	/* Mark the end of the barrier operation. */
dd46a7882c2c200 kernel/rcu/tree.c Paul E. McKenney          2018-07-10  415=
2  	rcu_barrier_trace(TPS("Inc2"), -1, rcu_state.barrier_sequence);
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  415=
3  	rcu_seq_end(&rcu_state.barrier_sequence);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  415=
4  	gseq =3D rcu_state.barrier_sequence;
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  415=
5  	for_each_possible_cpu(cpu) {
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  415=
6  		rdp =3D per_cpu_ptr(&rcu_data, cpu);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  415=
7  =

ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  415=
8  		WRITE_ONCE(rdp->barrier_seq_snap, gseq);
ca34220fecf856e kernel/rcu/tree.c Paul E. McKenney          2021-12-14  415=
9  	}
4f525a528b9e755 kernel/rcu/tree.c Paul E. McKenney          2015-06-26  416=
0  =

b1420f1c8bfc30e kernel/rcutree.c  Paul E. McKenney          2012-03-01  416=
1  	/* Other rcu_barrier() invocations can now safely proceed. */
ec9f5835f74cba5 kernel/rcu/tree.c Paul E. McKenney          2018-07-05  416=
2  	mutex_unlock(&rcu_state.barrier_mutex);
d0ec774cb2599c8 kernel/rcutree.c  Paul E. McKenney          2009-10-06  416=
3  }
45975c7d21a1c0a kernel/rcu/tree.c Paul E. McKenney          2018-07-02  416=
4  EXPORT_SYMBOL_GPL(rcu_barrier);
d0ec774cb2599c8 kernel/rcutree.c  Paul E. McKenney          2009-10-06  416=
5  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3954314794395928130==--

