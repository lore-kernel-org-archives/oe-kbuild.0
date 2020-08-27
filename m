Content-Type: multipart/mixed; boundary="===============2787748642742010214=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:locking/core 30/35] kernel/locking/lockdep.c:3284:6: warning: Local variable hlock_id shadows outer function
Date: Thu, 27 Aug 2020 21:07:56 +0800
Message-ID: <202008272148.6LOunFfq%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2787748642742010214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Boqun Feng <boqun.feng@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking=
/core
head:   96a16f45aed89cf024606a11679b0609d09552c7
commit: f611e8cf98ec908b9c2c0da6064a660fc6022487 [30/35] lockdep: Take read=
/write status in consideration when generate chainkey
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   kernel/locking/lockdep.c:4887:6: warning: Variable 'ret' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    ret =3D NULL;
        ^
   kernel/locking/lockdep.c:4883:6: note: Variable 'ret' is reassigned a va=
lue before the old one has been used.
    ret =3D hlock;
        ^
   kernel/locking/lockdep.c:4887:6: note: Variable 'ret' is reassigned a va=
lue before the old one has been used.
    ret =3D NULL;
        ^
>> kernel/locking/lockdep.c:3284:6: warning: Local variable hlock_id shadow=
s outer function [shadowFunction]
    u16 hlock_id;
        ^
   kernel/locking/lockdep.c:377:19: note: Shadowed declaration
   static inline u16 hlock_id(struct held_lock *hlock)
                     ^
   kernel/locking/lockdep.c:3284:6: note: Shadow variable
    u16 hlock_id;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=3D=
f611e8cf98ec908b9c2c0da6064a660fc6022487
git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.=
git
git fetch --no-tags tip locking/core
git checkout f611e8cf98ec908b9c2c0da6064a660fc6022487
vim +3284 kernel/locking/lockdep.c

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3279  =

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3280  static void prin=
t_chain_keys_chain(struct lock_chain *chain)
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3281  {
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3282  	int i;
f6ec8829ac9d59 Yuyang Du                 2019-05-06  3283  	u64 chain_key =
=3D INITIAL_CHAIN_KEY;
f611e8cf98ec90 Boqun Feng                2020-08-07 @3284  	u16 hlock_id;
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3285  =

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3286  	printk("depth: =
%u\n", chain->depth);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3287  	for (i =3D 0; i=
 < chain->depth; i++) {
f611e8cf98ec90 Boqun Feng                2020-08-07  3288  		hlock_id =3D c=
hain_hlocks[chain->base + i];
f611e8cf98ec90 Boqun Feng                2020-08-07  3289  		chain_key =3D =
print_chain_key_iteration(hlock_id, chain_key);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3290  =

f611e8cf98ec90 Boqun Feng                2020-08-07  3291  		print_lock_nam=
e(lock_classes + chain_hlock_class_idx(hlock_id) - 1);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3292  		printk("\n");
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3293  	}
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3294  }
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3295  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2787748642742010214==--

