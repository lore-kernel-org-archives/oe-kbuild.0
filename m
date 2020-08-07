Content-Type: multipart/mixed; boundary="===============3622336648422203817=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [boqun:arr-rfc-v7-wip 14/19] kernel/locking/lockdep.c:3284:6: warning: Local variable hlock_id shadows outer function
Date: Fri, 07 Aug 2020 15:19:25 +0800
Message-ID: <202008071516.VUDsoO0w%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3622336648422203817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git arr=
-rfc-v7-wip
head:   584ea19e68b586b4fb2c87c4a67ad2348e08fb36
commit: dde8decc2fe553bff18aeb22aee08b2b386789f9 [14/19] lockdep: Take read=
/write status in consideration when generate chainkey
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   kernel/locking/lockdep.c:4826:6: warning: Variable 'ret' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    ret =3D NULL;
        ^
   kernel/locking/lockdep.c:4822:6: note: Variable 'ret' is reassigned a va=
lue before the old one has been used.
    ret =3D hlock;
        ^
   kernel/locking/lockdep.c:4826:6: note: Variable 'ret' is reassigned a va=
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

# https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/commit/?i=
d=3Ddde8decc2fe553bff18aeb22aee08b2b386789f9
git remote add boqun https://git.kernel.org/pub/scm/linux/kernel/git/boqun/=
linux.git
git remote update boqun
git checkout dde8decc2fe553bff18aeb22aee08b2b386789f9
vim +3284 kernel/locking/lockdep.c

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3279  =

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3280  static void prin=
t_chain_keys_chain(struct lock_chain *chain)
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3281  {
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3282  	int i;
f6ec8829ac9d59 Yuyang Du                 2019-05-06  3283  	u64 chain_key =
=3D INITIAL_CHAIN_KEY;
dde8decc2fe553 Boqun Feng                2017-08-28 @3284  	u16 hlock_id;
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3285  =

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3286  	printk("depth: =
%u\n", chain->depth);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3287  	for (i =3D 0; i=
 < chain->depth; i++) {
dde8decc2fe553 Boqun Feng                2017-08-28  3288  		hlock_id =3D c=
hain_hlocks[chain->base + i];
dde8decc2fe553 Boqun Feng                2017-08-28  3289  		chain_key =3D =
print_chain_key_iteration(hlock_id, chain_key);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3290  =

dde8decc2fe553 Boqun Feng                2017-08-28  3291  		print_lock_nam=
e(lock_classes + chain_hlock_class_idx(hlock_id) - 1);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3292  		printk("\n");
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3293  	}
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3294  }
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3295  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3622336648422203817==--

