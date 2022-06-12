Content-Type: multipart/mixed; boundary="===============1200151136844959154=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/torture.c:491 torture_shuffle_task_register() warn: possible memory leak of 'stp'
Date: Mon, 13 Jun 2022 01:44:04 +0800
Message-ID: <202206130153.IUYUERW4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1200151136844959154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-m031-20220611 (https://download.01.org/0day-ci=
/archive/20220613/202206130153.IUYUERW4-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
kernel/torture.c:491 torture_shuffle_task_register() warn: possible memory =
leak of 'stp'
security/keys/trusted-keys/trusted_tpm2.c:61 tpm2_key_encode() warn: passin=
g zero to 'PTR_ERR'
drivers/infiniband/core/uverbs_uapi.c:77 uapi_create_write() error: potenti=
ally using uninitialized 'exists'.
drivers/reset/core.c:225 reset_control_array_rearm() error: 'rstc' derefere=
ncing possible ERR_PTR()
drivers/reset/core.c:339 reset_control_reset() error: 'rstc' dereferencing =
possible ERR_PTR()
drivers/reset/core.c:411 reset_control_rearm() error: 'rstc' dereferencing =
possible ERR_PTR()
drivers/reset/core.c:452 reset_control_assert() error: 'rstc' dereferencing=
 possible ERR_PTR()
drivers/reset/core.c:540 reset_control_deassert() error: 'rstc' dereferenci=
ng possible ERR_PTR()
drivers/reset/core.c:612 reset_control_status() error: 'rstc' dereferencing=
 possible ERR_PTR()
drivers/reset/core.c:654 reset_control_acquire() error: 'rstc' dereferencin=
g possible ERR_PTR()
drivers/reset/core.c:723 reset_control_release() error: 'rstc' dereferencin=
g possible ERR_PTR()
drivers/net/wwan/wwan_core.c:1062 wwan_unregister_ops() error: 'wwandev' de=
referencing possible ERR_PTR()
sound/core/oss/pcm_oss.c:2603 snd_pcm_oss_ioctl() error: we previously assu=
med 'substream' could be null (see line 2598)
net/mac80211/key.c:464 ieee80211_key_replace() error: we previously assumed=
 'new' could be null (see line 446)
net/netfilter/nf_nat_core.c:1039 nf_nat_register_fn() warn: potentially one=
 past the end of array 'nat_ops[hooknum]'
net/netfilter/nf_nat_core.c:1039 nf_nat_register_fn() warn: potentially one=
 past the end of array 'nat_ops[hooknum]'
net/wireless/sme.c:782 __cfg80211_connect_result() error: we previously ass=
umed 'cr->bss' could be null (see line 733)
kernel/sched/topology.c:1338 asym_cpu_capacity_update_data() warn: possible=
 memory leak of 'entry'
kernel/rcu/rcutorture.c:2357 rcu_torture_fwd_prog_cr() warn: possible memor=
y leak of 'rfcp'

Old smatch warnings:
security/keys/trusted-keys/trusted_tpm2.c:83 tpm2_key_encode() warn: passin=
g zero to 'PTR_ERR'
drivers/infiniband/core/uverbs_uapi.c:114 uapi_merge_method() error: uninit=
ialized symbol 'exists'.
arch/powerpc/include/asm/mmu.h:233 early_mmu_has_feature() warn: bitwise AN=
D condition is false here
arch/powerpc/include/asm/mmu.h:233 early_mmu_has_feature() warn: bitwise AN=
D condition is false here

vim +/stp +491 kernel/torture.c

3808dc9fab0591 Paul E. McKenney 2014-01-28  478  =

3808dc9fab0591 Paul E. McKenney 2014-01-28  479  /*
3808dc9fab0591 Paul E. McKenney 2014-01-28  480   * Register a task to be s=
huffled.  If there is no memory, just splat
3808dc9fab0591 Paul E. McKenney 2014-01-28  481   * and don't bother regist=
ering.
3808dc9fab0591 Paul E. McKenney 2014-01-28  482   */
3808dc9fab0591 Paul E. McKenney 2014-01-28  483  void torture_shuffle_task_=
register(struct task_struct *tp)
3808dc9fab0591 Paul E. McKenney 2014-01-28  484  {
3808dc9fab0591 Paul E. McKenney 2014-01-28  485  	struct shuffle_task *stp;
3808dc9fab0591 Paul E. McKenney 2014-01-28  486  =

3808dc9fab0591 Paul E. McKenney 2014-01-28  487  	if (WARN_ON_ONCE(tp =3D=
=3D NULL))
3808dc9fab0591 Paul E. McKenney 2014-01-28  488  		return;
3808dc9fab0591 Paul E. McKenney 2014-01-28  489  	stp =3D kmalloc(sizeof(*s=
tp), GFP_KERNEL);
3808dc9fab0591 Paul E. McKenney 2014-01-28  490  	if (WARN_ON_ONCE(stp =3D=
=3D NULL))
3808dc9fab0591 Paul E. McKenney 2014-01-28 @491  		return;
3808dc9fab0591 Paul E. McKenney 2014-01-28  492  	stp->st_t =3D tp;
3808dc9fab0591 Paul E. McKenney 2014-01-28  493  	mutex_lock(&shuffle_task_=
mutex);
3808dc9fab0591 Paul E. McKenney 2014-01-28  494  	list_add(&stp->st_l, &shu=
ffle_task_list);
3808dc9fab0591 Paul E. McKenney 2014-01-28  495  	mutex_unlock(&shuffle_tas=
k_mutex);
3808dc9fab0591 Paul E. McKenney 2014-01-28  496  }
3808dc9fab0591 Paul E. McKenney 2014-01-28  497  EXPORT_SYMBOL_GPL(torture_=
shuffle_task_register);
3808dc9fab0591 Paul E. McKenney 2014-01-28  498  =


:::::: The code at line 491 was first introduced by commit
:::::: 3808dc9fab05913060626d7f0edd0f195cb9dcab rcutorture: Abstract tortur=
e_shuffle()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1200151136844959154==--

