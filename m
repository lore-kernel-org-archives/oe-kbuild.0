Content-Type: multipart/mixed; boundary="===============6589847068061653698=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 2/4] fs: split off do_getxattr from getxattr
Date: Thu, 24 Mar 2022 11:50:25 +0800
Message-ID: <202203241103.2NH9nYdb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6589847068061653698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220323154420.3301504-3-shr@fb.com>
References: <20220323154420.3301504-3-shr@fb.com>
TO: Stefan Roesch <shr@fb.com>

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ad9c6ee642a61adae93dfa35582b5af16dc5173a]

url:    https://github.com/0day-ci/linux/commits/Stefan-Roesch/io_uring-add=
-xattr-support/20220323-234525
base:   ad9c6ee642a61adae93dfa35582b5af16dc5173a
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20324/202203241103.2NH9nYdb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3530c5a50c41155118a8783e9=
8733f50d1950fa4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Roesch/io_uring-add-xattr-s=
upport/20220323-234525
        git checkout 3530c5a50c41155118a8783e98733f50d1950fa4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/nfs/nfs4session.c:406:8: note: Calling 'nfs41_try_wake_next_slot_tabl=
e_entry'
                   if (!nfs41_try_wake_next_slot_table_entry(tbl))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:393:27: note: Calling 'nfs4_alloc_slot'
           struct nfs4_slot *slot =3D nfs4_alloc_slot(tbl);
                                    ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:247:2: note: Loop condition is false.  Exiting loop
           dprintk("--> %s used_slots=3D%04lx highest_used=3D%u max_slots=
=3D%u\n",
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/nfs/nfs4session.c:251:6: note: Assuming 'slotid' is <=3D field 'max_s=
lotid'
           if (slotid <=3D tbl->max_slotid) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:251:2: note: Taking true branch
           if (slotid <=3D tbl->max_slotid) {
           ^
   fs/nfs/nfs4session.c:252:9: note: Calling 'nfs4_find_or_create_slot'
                   ret =3D nfs4_find_or_create_slot(tbl, slotid, 1, GFP_NOW=
AIT);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:7: note: Assuming the condition is true
                   if (*p =3D=3D NULL) {
                       ^~~~~~~~~~
   fs/nfs/nfs4session.c:127:3: note: Taking true branch
                   if (*p =3D=3D NULL) {
                   ^
   fs/nfs/nfs4session.c:128:9: note: Calling 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Calling 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Uninitialized value stored to field 'n=
ext'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Returning from 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:110:6: note: Assuming 'slot' is non-null
           if (slot) {
               ^~~~
   fs/nfs/nfs4session.c:110:2: note: Taking true branch
           if (slot) {
           ^
   fs/nfs/nfs4session.c:128:9: note: Returning from 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:130:4: note: Taking false branch
                           if (*p =3D=3D NULL)
                           ^
   fs/nfs/nfs4session.c:135:7: note: Assuming 'slotid' is not equal to fiel=
d 'slot_nr'
                   if (slot->slot_nr =3D=3D slotid)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:135:3: note: Taking false branch
                   if (slot->slot_nr =3D=3D slotid)
                   ^
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:10: note: The left operand of '=3D=3D' is a gar=
bage value
                   if (*p =3D=3D NULL) {
                       ~~ ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/gfs2/file.c:794:3: warning: Value stored to 'pages' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   pages =3D min(pages, nr_dirtied);
                   ^
   fs/gfs2/file.c:794:3: note: Value stored to 'pages' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/xattr.c:33:22: warning: Dereference of null pointer (loaded from vari=
able 'a') [clang-analyzer-core.NullDereference]
           while (*a_prefix && *a =3D=3D *a_prefix) {
                               ^
   fs/xattr.c:366:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xattr.c:366:2: note: Taking false branch
           if (error)
           ^
   fs/xattr.c:369:12: note: Calling 'xattr_resolve_name'
           handler =3D xattr_resolve_name(inode, &name);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c:61:6: note: Assuming the condition is false
           if (!(inode->i_opflags & IOP_XATTR)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c:61:2: note: Taking false branch
           if (!(inode->i_opflags & IOP_XATTR)) {
           ^
   fs/xattr.c:66:25: note: Assuming 'handlers' is non-null
           for_each_xattr_handler(handlers, handler) {
                                  ^
   fs/xattr.c:47:6: note: expanded from macro 'for_each_xattr_handler'
           if (handlers)                                           \
               ^~~~~~~~
   fs/xattr.c:66:2: note: Taking true branch
           for_each_xattr_handler(handlers, handler) {
           ^
   fs/xattr.c:47:2: note: expanded from macro 'for_each_xattr_handler'
           if (handlers)                                           \
           ^
   fs/xattr.c:66:2: note: Assuming 'handler' is not equal to null
           for_each_xattr_handler(handlers, handler) {
           ^
   fs/xattr.c:49:4: note: expanded from macro 'for_each_xattr_handler'
                           (handler) !=3D NULL;                      \
                           ^~~~~~~~~~~~~~~~~
   fs/xattr.c:66:2: note: Loop condition is true.  Entering loop body
           for_each_xattr_handler(handlers, handler) {
           ^
   fs/xattr.c:48:3: note: expanded from macro 'for_each_xattr_handler'
                   for ((handler) =3D *(handlers)++;                 \
                   ^
   fs/xattr.c:70:7: note: Assuming 'n' is null
                   if (n) {
                       ^
   fs/xattr.c:70:3: note: Taking false branch
                   if (n) {
                   ^
   fs/xattr.c:66:2: note: Assuming 'handler' is not equal to null
           for_each_xattr_handler(handlers, handler) {
           ^
   fs/xattr.c:49:4: note: expanded from macro 'for_each_xattr_handler'
                           (handler) !=3D NULL;                      \
                           ^~~~~~~~~~~~~~~~~
   fs/xattr.c:66:2: note: Loop condition is true.  Entering loop body
           for_each_xattr_handler(handlers, handler) {
           ^
   fs/xattr.c:48:3: note: expanded from macro 'for_each_xattr_handler'
                   for ((handler) =3D *(handlers)++;                 \
                   ^
   fs/xattr.c:69:21: note: Passing null pointer value via 1st parameter 'a'
                   n =3D strcmp_prefix(*name, xattr_prefix(handler));
                                     ^~~~~
   fs/xattr.c:69:7: note: Calling 'strcmp_prefix'
                   n =3D strcmp_prefix(*name, xattr_prefix(handler));
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c:33:9: note: Assuming the condition is true
           while (*a_prefix && *a =3D=3D *a_prefix) {
                  ^~~~~~~~~
   fs/xattr.c:33:9: note: Left side of '&&' is true
   fs/xattr.c:33:22: note: Dereference of null pointer (loaded from variabl=
e 'a')
           while (*a_prefix && *a =3D=3D *a_prefix) {
                               ^~
   include/linux/list.h:73:12: warning: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'new') [clang-analyzer=
-core.NullDereference]
           new->next =3D next;
                     ^
   fs/xattr.c:1058:2: note: 'new_xattr' initialized to a null pointer value
           struct simple_xattr *new_xattr =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c:1061:6: note: Assuming 'removed_size' is null
           if (removed_size)
               ^~~~~~~~~~~~
   fs/xattr.c:1061:2: note: Taking false branch
           if (removed_size)
           ^
   fs/xattr.c:1065:6: note: Assuming 'value' is null
           if (value) {
               ^~~~~
   fs/xattr.c:1065:2: note: Taking false branch
           if (value) {
           ^
   fs/xattr.c:1078:2: note: Loop condition is false. Execution continues on=
 line 1095
           list_for_each_entry(xattr, &xattrs->head, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/xattr.c:1095:6: note: Assuming the condition is false
           if (flags & XATTR_REPLACE) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c:1095:2: note: Taking false branch

vim +/a +33 fs/xattr.c

a3c60330ecbee3 Stefan Roesch       2022-03-23  29  =

b6ba11773d9535 Andreas Gruenbacher 2016-09-29  30  static const char *
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  31  strcmp_prefix(const char=
 *a, const char *a_prefix)
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  32  {
b6ba11773d9535 Andreas Gruenbacher 2016-09-29 @33  	while (*a_prefix && *a =
=3D=3D *a_prefix) {
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  34  		a++;
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  35  		a_prefix++;
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  36  	}
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  37  	return *a_prefix ? NULL=
 : a;
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  38  }
b6ba11773d9535 Andreas Gruenbacher 2016-09-29  39  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6589847068061653698==--

