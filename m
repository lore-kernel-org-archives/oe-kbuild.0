Content-Type: multipart/mixed; boundary="===============0873564857460763542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ax25/ax25_dev.c:122:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 07 Feb 2022 06:10:55 +0800
Message-ID: <202202070601.GmVurdtI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0873564857460763542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Duoming Zhou <duoming@zju.edu.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90c9e950c0def5c354b4a6154a2ddda3e5f214ac
commit: d01ffb9eee4af165d83b08dd73ebdf9fe94a519b ax25: add refcount in ax25=
_dev to avoid UAF bugs
date:   9 days ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20207/202202070601.GmVurdtI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5=
a44925592c764c59219b0024ee06317028)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd01ffb9eee4af165d83b08dd73ebdf9fe94a519b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d01ffb9eee4af165d83b08dd73ebdf9fe94a519b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/reiserfs/fix_node.c:2655:3: note: Taking false branch
                   if (ret !=3D CARRY_ON)
                   ^
   fs/reiserfs/fix_node.c:2663:7: note: 'ret' is equal to CARRY_ON
                   if (ret !=3D CARRY_ON)
                       ^~~
   fs/reiserfs/fix_node.c:2663:3: note: Taking false branch
                   if (ret !=3D CARRY_ON)
                   ^
   fs/reiserfs/fix_node.c:2670:8: note: Field 'pe_buffer' is non-null
                   if (!PATH_H_PBUFFER(tb->tb_path, h)) {
                        ^
   fs/reiserfs/reiserfs.h:2169:4: note: expanded from macro 'PATH_H_PBUFFER'
                           PATH_OFFSET_PBUFFER(path, path->path_length - (h=
))
                           ^
   fs/reiserfs/reiserfs.h:2148:86: note: expanded from macro 'PATH_OFFSET_P=
BUFFER'
   #define PATH_OFFSET_PBUFFER(path, n_offset)   (PATH_OFFSET_PELEMENT(path=
, n_offset)->pe_buffer)
                                                                           =
             ^
   fs/reiserfs/fix_node.c:2670:3: note: Taking false branch
                   if (!PATH_H_PBUFFER(tb->tb_path, h)) {
                   ^
   fs/reiserfs/fix_node.c:2677:14: note: Assuming field 'pe_buffer' is null
                   } else if (!PATH_H_PBUFFER(tb->tb_path, h + 1)) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2677:10: note: Taking true branch
                   } else if (!PATH_H_PBUFFER(tb->tb_path, h + 1)) {
                          ^
   fs/reiserfs/fix_node.c:2684:8: note: Assuming the condition is true
                           if (tb->blknum[h] > 1) {
                               ^~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2684:4: note: Taking true branch
                           if (tb->blknum[h] > 1) {
                           ^
   fs/reiserfs/fix_node.c:2686:5: note: Taking false branch
                                   RFALSE(h =3D=3D MAX_HEIGHT - 1,
                                   ^
   fs/reiserfs/reiserfs.h:918:39: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")",=
 format, ##args)
                                         ^
   fs/reiserfs/reiserfs.h:909:2: note: expanded from macro '__RASSERT'
           if (!(cond))                                                    \
           ^
   fs/reiserfs/fix_node.c:2686:5: note: Loop condition is false.  Exiting l=
oop
                                   RFALSE(h =3D=3D MAX_HEIGHT - 1,
                                   ^
   fs/reiserfs/reiserfs.h:918:39: note: expanded from macro 'RFALSE'
   #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")",=
 format, ##args)
                                         ^
   fs/reiserfs/reiserfs.h:907:51: note: expanded from macro '__RASSERT'
   #define __RASSERT(cond, scond, format, args...)                 \
                                                                   ^
   fs/reiserfs/fix_node.c:2630:14: note: 'h' is < MAX_HEIGHT
           for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h]; h++) {
                       ^
   fs/reiserfs/fix_node.c:2630:14: note: Left side of '&&' is true
   fs/reiserfs/fix_node.c:2630:2: note: Loop condition is true.  Entering l=
oop body
           for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h]; h++) {
           ^
   fs/reiserfs/fix_node.c:2631:9: note: Calling 'get_direct_parent'
                   ret =3D get_direct_parent(tb, h);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2098:6: note: Assuming 'path_offset' is > FIRST_P=
ATH_ELEMENT_OFFSET
           if (path_offset <=3D FIRST_PATH_ELEMENT_OFFSET) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2098:2: note: Taking false branch
           if (path_offset <=3D FIRST_PATH_ELEMENT_OFFSET) {
           ^
   fs/reiserfs/fix_node.c:2115:6: note: Assuming the condition is false
           if (!B_IS_IN_TREE
               ^~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2115:2: note: Taking false branch
           if (!B_IS_IN_TREE
           ^
   fs/reiserfs/fix_node.c:2119:6: note: Assuming the condition is false
           if ((position =3D
               ^~~~~~~~~~~
   fs/reiserfs/fix_node.c:2119:2: note: Taking false branch
           if ((position =3D
           ^
   fs/reiserfs/fix_node.c:2126:6: note: Access to field 'b_blocknr' results=
 in a dereference of a null pointer (loaded from field 'pe_buffer')
               PATH_OFFSET_PBUFFER(path, path_offset)->b_blocknr)
               ^
   fs/reiserfs/reiserfs.h:2148:47: note: expanded from macro 'PATH_OFFSET_P=
BUFFER'
   #define PATH_OFFSET_PBUFFER(path, n_offset)   (PATH_OFFSET_PELEMENT(path=
, n_offset)->pe_buffer)
                                                 ^                         =
             ~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> net/ax25/ax25_dev.c:122:3: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                   ax25_dev_put(ax25_dev);
                   ^            ~~~~~~~~
   net/ax25/ax25_dev.c:98:6: note: Assuming the condition is false
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:98:2: note: Taking false branch
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
           ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is not equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is true.  Entering loop =
body
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:113:7: note: Assuming 'dev' is not equal to field 'f=
orward'
                   if (s->forward =3D=3D dev)
                       ^~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:113:3: note: Taking false branch
                   if (s->forward =3D=3D dev)
                   ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is false. Execution cont=
inues on line 116
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:116:6: note: Assuming the condition is true
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:116:2: note: Taking true branch
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
           ^
   net/ax25/ax25_dev.c:118:3: note: Calling 'ax25_dev_put'
                   ax25_dev_put(ax25_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/net/ax25.h:302:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&ax25_dev->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ax25.h:302:2: note: Taking true branch
           if (refcount_dec_and_test(&ax25_dev->refcount)) {
           ^
   include/net/ax25.h:303:3: note: Memory is released
                   kfree(ax25_dev);
                   ^~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:118:3: note: Returning; memory was released via 1st =
parameter
                   ax25_dev_put(ax25_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:122:3: note: Use of memory after it is freed
                   ax25_dev_put(ax25_dev);
                   ^            ~~~~~~~~
   net/ax25/ax25_dev.c:133:4: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                           ax25_dev_put(ax25_dev);
                           ^            ~~~~~~~~
   net/ax25/ax25_dev.c:98:6: note: Assuming the condition is false
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:98:2: note: Taking false branch
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
           ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is not equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is true.  Entering loop =
body
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:113:7: note: Assuming 'dev' is not equal to field 'f=
orward'
                   if (s->forward =3D=3D dev)
                       ^~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:113:3: note: Taking false branch
                   if (s->forward =3D=3D dev)
                   ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is not equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is true.  Entering loop =
body
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:113:7: note: Assuming 'dev' is not equal to field 'f=
orward'
                   if (s->forward =3D=3D dev)
                       ^~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:113:3: note: Taking false branch
                   if (s->forward =3D=3D dev)
                   ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is false. Execution cont=
inues on line 116
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:116:6: note: Assuming the condition is false
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:116:2: note: Taking false branch
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
           ^
   net/ax25/ax25_dev.c:126:9: note: 's' is not equal to NULL
           while (s !=3D NULL && s->next !=3D NULL) {
                  ^
   net/ax25/ax25_dev.c:126:9: note: Left side of '&&' is true
   net/ax25/ax25_dev.c:126:25: note: Field 'next' is not equal to NULL

vim +122 net/ax25/ax25_dev.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  108  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  109  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  	 *	Remove any packet forwar=
ding that points to this device.
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  112  	for (s =3D ax25_dev_list; s=
 !=3D NULL; s =3D s->next)
^1da177e4c3f41 Linus Torvalds 2005-04-16  113  		if (s->forward =3D=3D dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  114  			s->forward =3D NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  115  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  116  	if ((s =3D ax25_dev_list) =
=3D=3D ax25_dev) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  117  		ax25_dev_list =3D s->next;
d01ffb9eee4af1 Duoming Zhou   2022-01-28  118  		ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  119  		spin_unlock_bh(&ax25_dev_l=
ock);
c433570458e49b Cong Wang      2018-12-29  120  		dev->ax25_ptr =3D NULL;
66ce07f7802b68 Eric Dumazet   2021-12-06  121  		dev_put_track(dev, &ax25_d=
ev->dev_tracker);
d01ffb9eee4af1 Duoming Zhou   2022-01-28 @122  		ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  123  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  124  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  125  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  126  	while (s !=3D NULL && s->ne=
xt !=3D NULL) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  127  		if (s->next =3D=3D ax25_de=
v) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  128  			s->next =3D ax25_dev->nex=
t;
d01ffb9eee4af1 Duoming Zhou   2022-01-28  129  			ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  130  			spin_unlock_bh(&ax25_dev_=
lock);
c433570458e49b Cong Wang      2018-12-29  131  			dev->ax25_ptr =3D NULL;
66ce07f7802b68 Eric Dumazet   2021-12-06  132  			dev_put_track(dev, &ax25_=
dev->dev_tracker);
d01ffb9eee4af1 Duoming Zhou   2022-01-28  133  			ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  134  			return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  135  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  136  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  137  		s =3D s->next;
^1da177e4c3f41 Linus Torvalds 2005-04-16  138  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  139  	spin_unlock_bh(&ax25_dev_lo=
ck);
^1da177e4c3f41 Linus Torvalds 2005-04-16  140  	dev->ax25_ptr =3D NULL;
d01ffb9eee4af1 Duoming Zhou   2022-01-28  141  	ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  142  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0873564857460763542==--

