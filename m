Content-Type: multipart/mixed; boundary="===============1190503396715753792=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 09/10] kernfs: Replace per-fs rwsem with hashed rwsems.
Date: Mon, 11 Apr 2022 07:13:44 +0800
Message-ID: <202204110759.VjS8bOux-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1190503396715753792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220410023719.1752460-10-imran.f.khan@oracle.com>
References: <20220410023719.1752460-10-imran.f.khan@oracle.com>
TO: Imran Khan <imran.f.khan@oracle.com>
TO: tj(a)kernel.org
TO: viro(a)zeniv.linux.org.uk
TO: gregkh(a)linuxfoundation.org
TO: ebiederm(a)xmission.com
CC: linux-kernel(a)vger.kernel.org

Hi Imran,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 2e9a9857569ec27e64d2ddd01294bbe3c736acb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Imran-Khan/kernfs-Re=
move-reference-counting-for-kernfs_open_node/20220410-103950
base:   2e9a9857569ec27e64d2ddd01294bbe3c736acb1
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-c006-20220410 (https://download.01.org/0day-ci/arc=
hive/20220411/202204110759.VjS8bOux-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b=
0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/04e45d04284fa1e81d8=
51bfffbfa133b08201b62
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Imran-Khan/kernfs-Remove-reference=
-counting-for-kernfs_open_node/20220410-103950
        git checkout 04e45d04284fa1e81d851bfffbfa133b08201b62
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/kernfs/dir.c:1695:2: note: Taking false branch
           if (!kn->parent)
           ^
   fs/kernfs/dir.c:1702:9: note: Assuming 'old_parent' is not equal to fiel=
d 'parent'
           while (old_parent !=3D kn->parent) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1702:2: note: Loop condition is true.  Entering loop body
           while (old_parent !=3D kn->parent) {
           ^
   fs/kernfs/dir.c:1702:9: note: Assuming 'old_parent' is not equal to fiel=
d 'parent'
           while (old_parent !=3D kn->parent) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1702:2: note: Loop condition is true.  Entering loop body
           while (old_parent !=3D kn->parent) {
           ^
   fs/kernfs/dir.c:1707:3: note: Value assigned to field 'parent'
                   kernfs_down_write_triple_nodes(kn, old_parent, new_paren=
t, &token);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   fs/kernfs/dir.c:1702:9: note: Assuming 'old_parent' is equal to field 'p=
arent'
           while (old_parent !=3D kn->parent) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1702:2: note: Loop condition is false. Execution continu=
es on line 1709
           while (old_parent !=3D kn->parent) {
           ^
   fs/kernfs/dir.c:1712:7: note: Calling 'kernfs_active'
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
                ^~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:28:9: note: Assuming the condition is true
           return atomic_read(&kn->active) >=3D 0;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:28:2: note: Returning without writing to 'kn->parent'
           return atomic_read(&kn->active) >=3D 0;
           ^
   fs/kernfs/dir.c:1712:7: note: Returning from 'kernfs_active'
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
                ^~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1712:6: note: Left side of '||' is false
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
               ^
   fs/kernfs/dir.c:1712:6: note: Left side of '||' is false
   fs/kernfs/dir.c:1713:7: note: Assuming the condition is false
               (new_parent->flags & KERNFS_EMPTY_DIR))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1712:2: note: Taking false branch
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
           ^
   fs/kernfs/dir.c:1717:21: note: 'new_parent' is not equal to field 'paren=
t'
           if ((kn->parent =3D=3D new_parent) && (kn->ns =3D=3D new_ns) &&
                              ^~~~~~~~~~
   fs/kernfs/dir.c:1717:33: note: Left side of '&&' is false
           if ((kn->parent =3D=3D new_parent) && (kn->ns =3D=3D new_ns) &&
                                          ^
   fs/kernfs/dir.c:1722:6: note: Assuming the condition is false
           if (kernfs_find_ns(new_parent, new_name, new_ns))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1722:2: note: Taking false branch
           if (kernfs_find_ns(new_parent, new_name, new_ns))
           ^
   fs/kernfs/dir.c:1726:6: note: Assuming the condition is true
           if (strcmp(kn->name, new_name) !=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1726:2: note: Taking true branch
           if (strcmp(kn->name, new_name) !=3D 0) {
           ^
   fs/kernfs/dir.c:1729:7: note: Assuming 'new_name' is non-null
                   if (!new_name)
                       ^~~~~~~~~
   fs/kernfs/dir.c:1729:3: note: Taking false branch
                   if (!new_name)
                   ^
   fs/kernfs/dir.c:1738:2: note: Calling 'kernfs_unlink_sibling'
           kernfs_unlink_sibling(kn);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:391:6: note: Assuming the condition is false
           if (RB_EMPTY_NODE(&kn->rb))
               ^
   include/linux/rbtree.h:34:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:391:2: note: Taking false branch
           if (RB_EMPTY_NODE(&kn->rb))
           ^
   fs/kernfs/dir.c:394:6: note: Calling 'kernfs_type'
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
               ^~~~~~~~~~~~~~~
   include/linux/kernfs.h:334:2: note: Returning without writing to 'kn->pa=
rent'
           return kn->flags & KERNFS_TYPE_MASK;
           ^
   fs/kernfs/dir.c:394:6: note: Returning from 'kernfs_type'
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
               ^~~~~~~~~~~~~~~
   fs/kernfs/dir.c:394:6: note: Assuming the condition is true
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:394:2: note: Taking true branch
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
           ^
   fs/kernfs/dir.c:395:3: note: Dereference of null pointer
                   kn->parent->dir.subdirs--;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/kernfs/kernfs-internal.h:126:2: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           parent->dir.rev++;
           ^
   fs/kernfs/dir.c:1692:29: note: Calling 'kernfs_root'
           struct kernfs_root *root =3D kernfs_root(kn);
                                      ^~~~~~~~~~~~~~~
   fs/kernfs/kernfs-internal.h:81:6: note: Assuming field 'parent' is non-n=
ull
           if (kn->parent)
               ^~~~~~~~~~
   fs/kernfs/kernfs-internal.h:81:2: note: Taking true branch
           if (kn->parent)
           ^
   fs/kernfs/kernfs-internal.h:83:2: note: Returning without writing to 'kn=
->parent'
           return kn->dir.root;
           ^
   fs/kernfs/dir.c:1692:29: note: Returning from 'kernfs_root'
           struct kernfs_root *root =3D kernfs_root(kn);
                                      ^~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1695:11: note: Field 'parent' is non-null
           if (!kn->parent)
                    ^
   fs/kernfs/dir.c:1695:2: note: Taking false branch
           if (!kn->parent)
           ^
   fs/kernfs/dir.c:1702:9: note: Assuming 'old_parent' is not equal to fiel=
d 'parent'
           while (old_parent !=3D kn->parent) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1702:2: note: Loop condition is true.  Entering loop body
           while (old_parent !=3D kn->parent) {
           ^
   fs/kernfs/dir.c:1707:3: note: Value assigned to field 'parent'
                   kernfs_down_write_triple_nodes(kn, old_parent, new_paren=
t, &token);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   fs/kernfs/dir.c:1702:9: note: Assuming 'old_parent' is equal to field 'p=
arent'
           while (old_parent !=3D kn->parent) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1702:2: note: Loop condition is false. Execution continu=
es on line 1709
           while (old_parent !=3D kn->parent) {
           ^
   fs/kernfs/dir.c:1712:7: note: Calling 'kernfs_active'
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
                ^~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:28:9: note: Assuming the condition is true
           return atomic_read(&kn->active) >=3D 0;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:28:2: note: Returning without writing to 'kn->parent'
           return atomic_read(&kn->active) >=3D 0;
           ^
   fs/kernfs/dir.c:1712:7: note: Returning from 'kernfs_active'
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
                ^~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1712:6: note: Left side of '||' is false
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
               ^
   fs/kernfs/dir.c:1712:6: note: Left side of '||' is false
   fs/kernfs/dir.c:1713:7: note: Assuming the condition is false
               (new_parent->flags & KERNFS_EMPTY_DIR))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:1712:2: note: Taking false branch
           if (!kernfs_active(kn) || !kernfs_active(new_parent) ||
           ^
   fs/kernfs/dir.c:1717:21: note: 'new_parent' is not equal to field 'paren=
t'
           if ((kn->parent =3D=3D new_parent) && (kn->ns =3D=3D new_ns) &&
                              ^~~~~~~~~~
   fs/kernfs/dir.c:1717:33: note: Left side of '&&' is false
           if ((kn->parent =3D=3D new_parent) && (kn->ns =3D=3D new_ns) &&
                                          ^
   fs/kernfs/dir.c:1722:2: note: Taking false branch
           if (kernfs_find_ns(new_parent, new_name, new_ns))
           ^
   fs/kernfs/dir.c:1726:2: note: Taking false branch
           if (strcmp(kn->name, new_name) !=3D 0) {
           ^
   fs/kernfs/dir.c:1738:2: note: Calling 'kernfs_unlink_sibling'
           kernfs_unlink_sibling(kn);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:391:6: note: Assuming the condition is false
           if (RB_EMPTY_NODE(&kn->rb))
               ^
   include/linux/rbtree.h:34:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:391:2: note: Taking false branch
           if (RB_EMPTY_NODE(&kn->rb))
           ^
   fs/kernfs/dir.c:394:6: note: Calling 'kernfs_type'
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
               ^~~~~~~~~~~~~~~
   include/linux/kernfs.h:334:2: note: Returning without writing to 'kn->pa=
rent'
           return kn->flags & KERNFS_TYPE_MASK;
           ^
   fs/kernfs/dir.c:394:6: note: Returning from 'kernfs_type'
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
               ^~~~~~~~~~~~~~~
   fs/kernfs/dir.c:394:6: note: Assuming the condition is false
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:394:2: note: Taking false branch
           if (kernfs_type(kn) =3D=3D KERNFS_DIR)
           ^
   fs/kernfs/dir.c:396:17: note: Passing null pointer value via 1st paramet=
er 'parent'

vim +126 fs/kernfs/kernfs-internal.h

895adbec302e920 Ian Kent 2021-07-16  123  =

895adbec302e920 Ian Kent 2021-07-16  124  static inline void kernfs_inc_rev=
(struct kernfs_node *parent)
895adbec302e920 Ian Kent 2021-07-16  125  {
895adbec302e920 Ian Kent 2021-07-16 @126  	parent->dir.rev++;
895adbec302e920 Ian Kent 2021-07-16  127  }
895adbec302e920 Ian Kent 2021-07-16  128  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1190503396715753792==--

