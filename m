Content-Type: multipart/mixed; boundary="===============8013778728468331535=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/rcu/update.c:546 early_boot_test_call_rcu() warn: possible memory leak of 'rhp'
Date: Thu, 13 Jan 2022 15:03:15 +0800
Message-ID: <202201131455.cpJZI5V0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8013778728468331535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   455e73a07f6e288b0061dfcf4fcf54fa9fe06458
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-m031-20220113 (https://download.01.org/0day-ci=
/archive/20220113/202201131455.cpJZI5V0-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/rcu/update.c:546 early_boot_test_call_rcu() warn: possible memory le=
ak of 'rhp'
kernel/sched/topology.c:1338 asym_cpu_capacity_update_data() warn: possible=
 memory leak of 'entry'

vim +/rhp +546 kernel/rcu/update.c

a35d16905efc6a Byungchul Park      2019-08-05  532  =

aa23c6fbc50c4f Pranith Kumar       2014-09-19  533  static void early_boot_=
test_call_rcu(void)
aa23c6fbc50c4f Pranith Kumar       2014-09-19  534  {
aa23c6fbc50c4f Pranith Kumar       2014-09-19  535  	static struct rcu_head=
 head;
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  536  	static struct rcu_head=
 shead;
a35d16905efc6a Byungchul Park      2019-08-05  537  	struct early_boot_kfre=
e_rcu *rhp;
aa23c6fbc50c4f Pranith Kumar       2014-09-19  538  =

aa23c6fbc50c4f Pranith Kumar       2014-09-19  539  	call_rcu(&head, test_c=
allback);
0a580fa65cfa08 Frederic Weisbecker 2021-04-14  540  	if (IS_ENABLED(CONFIG_=
SRCU)) {
0a580fa65cfa08 Frederic Weisbecker 2021-04-14  541  		early_srcu_cookie =3D=
 start_poll_synchronize_srcu(&early_srcu);
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  542  		call_srcu(&early_srcu=
, &shead, test_callback);
0a580fa65cfa08 Frederic Weisbecker 2021-04-14  543  	}
a35d16905efc6a Byungchul Park      2019-08-05  544  	rhp =3D kmalloc(sizeof=
(*rhp), GFP_KERNEL);
a35d16905efc6a Byungchul Park      2019-08-05  545  	if (!WARN_ON_ONCE(!rhp=
))
a35d16905efc6a Byungchul Park      2019-08-05 @546  		kfree_rcu(rhp, rh);
aa23c6fbc50c4f Pranith Kumar       2014-09-19  547  }
aa23c6fbc50c4f Pranith Kumar       2014-09-19  548  =


:::::: The code at line 546 was first introduced by commit
:::::: a35d16905efc6ad5523d864a5c6efcb1e657e386 rcu: Add basic support for =
kfree_rcu() batching

:::::: TO: Byungchul Park <byungchul.park@lge.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8013778728468331535==--

