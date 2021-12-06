Content-Type: multipart/mixed; boundary="===============0377779624946889117=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/aquantia/atlantic/aq_vec.c:44:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 06 Dec 2021 11:04:51 +0800
Message-ID: <202112061058.LL3vE8sG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0377779624946889117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "L=C3=A9o Le Bouter" <lle-bout@zaclys.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   268ba095371cb28841bd9bd7f61c73290104a064
commit: 9b22fece786ed641909988da4810bfa8e5d2e592 atlantic: remove architect=
ure depends
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20211126 (https://download.01.org/0day-ci/arch=
ive/20211206/202112061058.LL3vE8sG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9b22fece786ed641909988da4810bfa8e5d2e592
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9b22fece786ed641909988da4810bfa8e5d2e592
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/udf/balloc.c:527:9: note: Left side of '&&' is true
   fs/udf/balloc.c:528:10: note: Value assigned to 'etype'
                  (etype =3D udf_next_aext(table, &epos, &eloc, &elen, 1)) =
!=3D -1) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:528:9: note: Assuming the condition is false
                  (etype =3D udf_next_aext(table, &epos, &eloc, &elen, 1)) =
!=3D -1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/udf/balloc.c:527:2: note: Loop condition is false. Execution continue=
s on line 534
           while (first_block !=3D eloc.logicalBlockNum &&
           ^
   fs/udf/balloc.c:534:6: note: Assuming 'first_block' is equal to field 'l=
ogicalBlockNum'
           if (first_block =3D=3D eloc.logicalBlockNum) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:534:2: note: Taking true branch
           if (first_block =3D=3D eloc.logicalBlockNum) {
           ^
   fs/udf/balloc.c:538:7: note: Assuming 'alloc_count' is > 'block_count'
                   if (alloc_count > block_count) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:538:3: note: Taking true branch
                   if (alloc_count > block_count) {
                   ^
   fs/udf/balloc.c:543:13: note: The result of the left shift is undefined =
because the left operand is negative
                                           (etype << 30) | elen, 1);
                                            ~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/net/ethernet/jme.c:446:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "Forced: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:446:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "Forced: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:464:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "ANed: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:464:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "ANed: ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:483:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "10 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:483:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "10 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:487:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "100 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:487:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "100 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:491:4: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(linkmsg, "1000 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:491:4: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                           strcat(linkmsg, "1000 Mbps, ");
                           ^~~~~~
   drivers/net/ethernet/jme.c:534:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(linkmsg, (phylink & PHY_LINK_DUPLEX) ?
                   ^~~~~~
   drivers/net/ethernet/jme.c:534:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(linkmsg, (phylink & PHY_LINK_DUPLEX) ?
                   ^~~~~~
   drivers/net/ethernet/jme.c:537:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(linkmsg, (phylink & PHY_LINK_MDI_STAT) ?
                   ^~~~~~
   drivers/net/ethernet/jme.c:537:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(linkmsg, (phylink & PHY_LINK_MDI_STAT) ?
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/net/ethernet/8390/pcnet_cs.c:311:5: warning: Value stored to 'j'=
 is never read [clang-analyzer-deadcode.DeadStores]
       j =3D pcmcia_release_window(link, link->resource[2]);
       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/8390/pcnet_cs.c:311:5: note: Value stored to 'j' is=
 never read
       j =3D pcmcia_release_window(link, link->resource[2]);
       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/8390/pcnet_cs.c:1434:6: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
               ret =3D -ENOMEM;
               ^     ~~~~~~~
   drivers/net/ethernet/8390/pcnet_cs.c:1434:6: note: Value stored to 'ret'=
 is never read
               ret =3D -ENOMEM;
               ^     ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/net/ethernet/aquantia/atlantic/aq_vec.c:44:3: warning: Value sto=
red to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_vec.c:44:3: note: Value stored=
 to 'err' is never read
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
>> drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:211:2: warning: Valu=
e stored to 'data' is never read [clang-analyzer-deadcode.DeadStores]
           data =3D aq_macsec_get_stats(aq_nic, data);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:211:2: note: Value s=
tored to 'data' is never read
           data =3D aq_macsec_get_stats(aq_nic, data);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:435:2: warning: Valu=
e stored to 'cfg' is never read [clang-analyzer-deadcode.DeadStores]
           cfg =3D aq_nic_get_cfg(aq_nic);
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:435:2: note: Value s=
tored to 'cfg' is never read
           cfg =3D aq_nic_get_cfg(aq_nic);
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/list.h:916:3: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
                   WRITE_ONCE(n->next->pprev, &n->next);
                   ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:688:6: note: 'err' i=
s 0
           if (err)
               ^~~
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:688:2: note: Taking =
false branch
           if (err)
           ^
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:692:15: note: Assumi=
ng 'aq_rx_fltr' is non-null
           if (unlikely(!aq_rx_fltr)) {
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:692:16: note: 'aq_rx=
_fltr' is non-null
           if (unlikely(!aq_rx_fltr)) {
                         ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:692:2: note: Taking =
false branch
           if (unlikely(!aq_rx_fltr)) {
           ^
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:699:8: note: Calling=
 'aq_update_table_filters'
           err =3D aq_update_table_filters(aq_nic, aq_rx_fltr, fsp->locatio=
n, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:638:2: note: Assumin=
g '____ptr' is non-null
           hlist_for_each_entry_safe(rule, aq_node2,
           ^
   include/linux/list.h:1024:13: note: expanded from macro 'hlist_for_each_=
entry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:638:2: note: '?' con=
dition is true
           hlist_for_each_entry_safe(rule, aq_node2,
           ^
   include/linux/list.h:1024:13: note: expanded from macro 'hlist_for_each_=
entry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
                      ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:638:2: note: Left si=
de of '&&' is false
           hlist_for_each_entry_safe(rule, aq_node2,
           ^
   include/linux/list.h:1024:13: note: expanded from macro 'hlist_for_each_=
entry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
                      ^
   include/linux/list.h:983:15: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
                        ^
   include/linux/list.h:972:40: note: expanded from macro 'hlist_entry'
   #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
                                          ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/ethernet/aquantia/atlantic/aq_filters.c:638:2: note: Taking =
false branch
           hlist_for_each_entry_safe(rule, aq_node2,
           ^
   include/linux/list.h:1024:13: note: expanded from macro 'hlist_for_each_=
entry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
                      ^
   include/linux/list.h:983:15: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
                        ^
   include/linux/list.h:972:40: note: expanded from macro 'hlist_entry'
   #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
                                          ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
--
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:57:2: note: Taking false branch
           if (page >=3D bitmap->pages) {
           ^
   drivers/md/md-bitmap.c:65:6: note: Assuming field 'hijacked' is 0
           if (bitmap->bp[page].hijacked) /* it's hijacked, don't try to al=
loc */
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:65:2: note: Taking false branch
           if (bitmap->bp[page].hijacked) /* it's hijacked, don't try to al=
loc */
           ^
   drivers/md/md-bitmap.c:68:6: note: Assuming field 'map' is non-null
           if (bitmap->bp[page].map) /* page is already allocated, just ret=
urn */
               ^~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:68:2: note: Taking true branch
           if (bitmap->bp[page].map) /* page is already allocated, just ret=
urn */
           ^
   drivers/md/md-bitmap.c:1366:8: note: Returning from 'md_bitmap_checkpage'
           err =3D md_bitmap_checkpage(bitmap, page, create, 0);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:1368:23: note: Field 'hijacked' is 0
           if (bitmap->bp[page].hijacked ||
                                ^
   drivers/md/md-bitmap.c:1368:6: note: Left side of '||' is false
           if (bitmap->bp[page].hijacked ||
               ^
   drivers/md/md-bitmap.c:1369:23: note: Field 'map' is not equal to NULL
               bitmap->bp[page].map =3D=3D NULL)
                                ^
   drivers/md/md-bitmap.c:1368:2: note: Taking false branch
           if (bitmap->bp[page].hijacked ||
           ^
   drivers/md/md-bitmap.c:1376:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/md/md-bitmap.c:1376:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/md/md-bitmap.c:1381:23: note: Field 'hijacked' is 0
           if (bitmap->bp[page].hijacked) { /* hijacked pointer */
                                ^
   drivers/md/md-bitmap.c:1381:2: note: Taking false branch
           if (bitmap->bp[page].hijacked) { /* hijacked pointer */
           ^
   drivers/md/md-bitmap.c:2194:14: note: Returning from 'md_bitmap_get_coun=
ter'
                           bmc_new =3D md_bitmap_get_counter(&bitmap->count=
s, block, &new_blocks, 1);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:2195:8: note: Assuming the condition is true
                           if (*bmc_new =3D=3D 0) {
                               ^~~~~~~~~~~~~
   drivers/md/md-bitmap.c:2195:4: note: Taking true branch
                           if (*bmc_new =3D=3D 0) {
                           ^
   drivers/md/md-bitmap.c:2200:12: note: Assuming 'start' is >=3D 'end'
                                   while (start < end) {
                                          ^~~~~~~~~~~
   drivers/md/md-bitmap.c:2200:5: note: Loop condition is false. Execution =
continues on line 2204
                                   while (start < end) {
                                   ^
   drivers/md/md-bitmap.c:2205:5: note: Calling 'md_bitmap_count_page'
                                   md_bitmap_count_page(&bitmap->counts, bl=
ock, 1);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/md/md-bitmap.c:1203:2: note: Calling 'md_bitmap_checkfree'
           md_bitmap_checkfree(bitmap, page);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:123:6: note: Assuming field 'count' is 0
           if (bitmap->bp[page].count) /* page is still busy */
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:123:2: note: Taking false branch
           if (bitmap->bp[page].count) /* page is still busy */
           ^
   drivers/md/md-bitmap.c:128:23: note: Field 'hijacked' is 0
           if (bitmap->bp[page].hijacked) { /* page was hijacked, undo this=
 now */
                                ^
   drivers/md/md-bitmap.c:128:2: note: Taking false branch
           if (bitmap->bp[page].hijacked) { /* page was hijacked, undo this=
 now */
           ^
   drivers/md/md-bitmap.c:136:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   drivers/md/md-bitmap.c:1203:2: note: Returning; memory was released
           md_bitmap_checkfree(bitmap, page);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:2205:5: note: Returning; memory was released
                                   md_bitmap_count_page(&bitmap->counts, bl=
ock, 1);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/md/md-bitmap.c:2208:13: note: Use of memory after it is freed
                           *bmc_new |=3D NEEDED_MASK;
                           ~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:491:2: warn=
ing: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStore=
s]
           err =3D readx_poll_timeout_atomic(hw_atl_scrpad25_get,
           ^
   drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:491:2: note=
: Value stored to 'err' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c:100:2:=
 warning: Value stored to 'err' is never read [clang-analyzer-deadcode.Dead=
Stores]
           err =3D readx_poll_timeout_atomic(aq_fw2x_mbox_get,
           ^
   drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c:100:2:=
 note: Value stored to 'err' is never read
   drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c:105:2:=
 warning: Value stored to 'err' is never read [clang-analyzer-deadcode.Dead=
Stores]
           err =3D readx_poll_timeout_atomic(aq_fw2x_rpc_get,
           ^
   drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c:105:2:=
 note: Value stored to 'err' is never read
   drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c:343:2:=
 warning: Value stored to 'err' is never read [clang-analyzer-deadcode.Dead=
Stores]
           err =3D readx_poll_timeout_atomic(aq_fw2x_state2_get, self, val,
           ^
   drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c:343:2:=
 note: Value stored to 'err' is never read
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/etherdevice.h:101:31: warning: The right operand of '|' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return ((*(const u32 *)addr) | (*(const u16 *)(addr + 4))) =3D=
=3D 0;
                                        ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1324:6: note: Assuming 'err' is=
 0
           if (err)
               ^~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1324:2: note: Taking false bran=
ch
           if (err)
           ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1332:31: note: 32 is not equal =
to 64
           if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)) &&
                                        ^
   include/linux/dma-mapping.h:76:27: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                             ^~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1332:31: note: '?' condition is=
 false
           if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)) &&
                                        ^
   include/linux/dma-mapping.h:76:26: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                            ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1332:6: note: Assuming the cond=
ition is false
           if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1332:49: note: Left side of '&&=
' is false
           if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)) &&
                                                          ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1342:6: note: Assuming 'err' is=
 0
           if (err)
               ^~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1342:2: note: Taking false bran=
ch
           if (err)
           ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1350:6: note: Assuming 'netdev'=
 is non-null
           if (!netdev) {
               ^~~~~~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1350:2: note: Taking false bran=
ch
           if (!netdev) {
           ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1364:13: note: Assuming field '=
start' is not equal to 0
           mmio_len =3D pci_resource_len(pdev, 0x0);
                      ^
   include/linux/pci.h:1858:4: note: expanded from macro 'pci_resource_len'
           ((pci_resource_start((dev), (bar)) =3D=3D 0 &&      \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1854:38: note: expanded from macro 'pci_resource_sta=
rt'
   #define pci_resource_start(dev, bar)    ((dev)->resource[(bar)].start)
                                           ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1364:13: note: Left side of '&&=
' is false
           mmio_len =3D pci_resource_len(pdev, 0x0);
                      ^
   include/linux/pci.h:1858:42: note: expanded from macro 'pci_resource_len'
           ((pci_resource_start((dev), (bar)) =3D=3D 0 &&      \
                                                   ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1368:6: note: Assuming field 'h=
w_addr' is non-null
           if (!adapter->hw.hw_addr) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1368:2: note: Taking false bran=
ch
           if (!adapter->hw.hw_addr) {
           ^
   drivers/net/ethernet/atheros/atlx/atl2.c:1389:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/net/ethernet/atheros/atlx/atl2.c:1389:2: note: Taking false bran=
ch
           if (err)

vim +/err +44 drivers/net/ethernet/aquantia/atlantic/aq_vec.c

970a2e9864b0ba David VomLehn   2017-01-23   32  =

970a2e9864b0ba David VomLehn   2017-01-23   33  static int aq_vec_poll(stru=
ct napi_struct *napi, int budget)
970a2e9864b0ba David VomLehn   2017-01-23   34  {
970a2e9864b0ba David VomLehn   2017-01-23   35  	struct aq_vec_s *self =3D =
container_of(napi, struct aq_vec_s, napi);
b647d3980948e8 Igor Russkikh   2018-03-20   36  	unsigned int sw_tail_old =
=3D 0U;
970a2e9864b0ba David VomLehn   2017-01-23   37  	struct aq_ring_s *ring =3D=
 NULL;
b647d3980948e8 Igor Russkikh   2018-03-20   38  	bool was_tx_cleaned =3D tr=
ue;
b647d3980948e8 Igor Russkikh   2018-03-20   39  	unsigned int i =3D 0U;
970a2e9864b0ba David VomLehn   2017-01-23   40  	int work_done =3D 0;
970a2e9864b0ba David VomLehn   2017-01-23   41  	int err =3D 0;
970a2e9864b0ba David VomLehn   2017-01-23   42  =

970a2e9864b0ba David VomLehn   2017-01-23   43  	if (!self) {
970a2e9864b0ba David VomLehn   2017-01-23  @44  		err =3D -EINVAL;
278175aba363dc Pavel Belous    2017-08-28   45  	} else {
970a2e9864b0ba David VomLehn   2017-01-23   46  		for (i =3D 0U, ring =3D s=
elf->ring[0];
970a2e9864b0ba David VomLehn   2017-01-23   47  			self->tx_rings > i; ++i,=
 ring =3D self->ring[i]) {
aa7e17a3e35a6e Dmitry Bogdanov 2020-07-20   48  			u64_stats_update_begin(&=
ring[AQ_VEC_RX_ID].stats.rx.syncp);
aa7e17a3e35a6e Dmitry Bogdanov 2020-07-20   49  			ring[AQ_VEC_RX_ID].stats=
.rx.polls++;
aa7e17a3e35a6e Dmitry Bogdanov 2020-07-20   50  			u64_stats_update_end(&ri=
ng[AQ_VEC_RX_ID].stats.rx.syncp);
970a2e9864b0ba David VomLehn   2017-01-23   51  			if (self->aq_hw_ops->hw_=
ring_tx_head_update) {
970a2e9864b0ba David VomLehn   2017-01-23   52  				err =3D self->aq_hw_ops=
->hw_ring_tx_head_update(
970a2e9864b0ba David VomLehn   2017-01-23   53  							self->aq_hw,
970a2e9864b0ba David VomLehn   2017-01-23   54  							&ring[AQ_VEC_TX_ID]);
970a2e9864b0ba David VomLehn   2017-01-23   55  				if (err < 0)
970a2e9864b0ba David VomLehn   2017-01-23   56  					goto err_exit;
970a2e9864b0ba David VomLehn   2017-01-23   57  			}
970a2e9864b0ba David VomLehn   2017-01-23   58  =

970a2e9864b0ba David VomLehn   2017-01-23   59  			if (ring[AQ_VEC_TX_ID].s=
w_head !=3D
970a2e9864b0ba David VomLehn   2017-01-23   60  			    ring[AQ_VEC_TX_ID].h=
w_head) {
b647d3980948e8 Igor Russkikh   2018-03-20   61  				was_tx_cleaned =3D aq_r=
ing_tx_clean(&ring[AQ_VEC_TX_ID]);
3aec6412e007b2 Igor Russkikh   2017-09-25   62  				aq_ring_update_queue_st=
ate(&ring[AQ_VEC_TX_ID]);
970a2e9864b0ba David VomLehn   2017-01-23   63  			}
970a2e9864b0ba David VomLehn   2017-01-23   64  =

970a2e9864b0ba David VomLehn   2017-01-23   65  			err =3D self->aq_hw_ops-=
>hw_ring_rx_receive(self->aq_hw,
970a2e9864b0ba David VomLehn   2017-01-23   66  					    &ring[AQ_VEC_RX_ID=
]);
970a2e9864b0ba David VomLehn   2017-01-23   67  			if (err < 0)
970a2e9864b0ba David VomLehn   2017-01-23   68  				goto err_exit;
970a2e9864b0ba David VomLehn   2017-01-23   69  =

970a2e9864b0ba David VomLehn   2017-01-23   70  			if (ring[AQ_VEC_RX_ID].s=
w_head !=3D
970a2e9864b0ba David VomLehn   2017-01-23   71  				ring[AQ_VEC_RX_ID].hw_h=
ead) {
970a2e9864b0ba David VomLehn   2017-01-23   72  				err =3D aq_ring_rx_clea=
n(&ring[AQ_VEC_RX_ID],
a54df682e559da Pavel Belous    2017-08-03   73  						       napi,
970a2e9864b0ba David VomLehn   2017-01-23   74  						       &work_done,
970a2e9864b0ba David VomLehn   2017-01-23   75  						       budget - work_=
done);
970a2e9864b0ba David VomLehn   2017-01-23   76  				if (err < 0)
970a2e9864b0ba David VomLehn   2017-01-23   77  					goto err_exit;
970a2e9864b0ba David VomLehn   2017-01-23   78  =

970a2e9864b0ba David VomLehn   2017-01-23   79  				sw_tail_old =3D ring[AQ=
_VEC_RX_ID].sw_tail;
970a2e9864b0ba David VomLehn   2017-01-23   80  =

970a2e9864b0ba David VomLehn   2017-01-23   81  				err =3D aq_ring_rx_fill=
(&ring[AQ_VEC_RX_ID]);
970a2e9864b0ba David VomLehn   2017-01-23   82  				if (err < 0)
970a2e9864b0ba David VomLehn   2017-01-23   83  					goto err_exit;
970a2e9864b0ba David VomLehn   2017-01-23   84  =

970a2e9864b0ba David VomLehn   2017-01-23   85  				err =3D self->aq_hw_ops=
->hw_ring_rx_fill(
970a2e9864b0ba David VomLehn   2017-01-23   86  					self->aq_hw,
970a2e9864b0ba David VomLehn   2017-01-23   87  					&ring[AQ_VEC_RX_ID], s=
w_tail_old);
970a2e9864b0ba David VomLehn   2017-01-23   88  				if (err < 0)
970a2e9864b0ba David VomLehn   2017-01-23   89  					goto err_exit;
970a2e9864b0ba David VomLehn   2017-01-23   90  			}
970a2e9864b0ba David VomLehn   2017-01-23   91  		}
970a2e9864b0ba David VomLehn   2017-01-23   92  =

be6cef69ba570e Dmitry Bogdanov 2019-08-30   93  err_exit:
b647d3980948e8 Igor Russkikh   2018-03-20   94  		if (!was_tx_cleaned)
970a2e9864b0ba David VomLehn   2017-01-23   95  			work_done =3D budget;
970a2e9864b0ba David VomLehn   2017-01-23   96  =

970a2e9864b0ba David VomLehn   2017-01-23   97  		if (work_done < budget) {
6ad20165d376fa Eric Dumazet    2017-01-30   98  			napi_complete_done(napi,=
 work_done);
970a2e9864b0ba David VomLehn   2017-01-23   99  			self->aq_hw_ops->hw_irq_=
enable(self->aq_hw,
970a2e9864b0ba David VomLehn   2017-01-23  100  					1U << self->aq_ring_pa=
ram.vec_idx);
970a2e9864b0ba David VomLehn   2017-01-23  101  		}
970a2e9864b0ba David VomLehn   2017-01-23  102  	}
be6cef69ba570e Dmitry Bogdanov 2019-08-30  103  =

970a2e9864b0ba David VomLehn   2017-01-23  104  	return work_done;
970a2e9864b0ba David VomLehn   2017-01-23  105  }
970a2e9864b0ba David VomLehn   2017-01-23  106  =


:::::: The code at line 44 was first introduced by commit
:::::: 970a2e9864b0ba45f639aebf464a5edcaabb5be0 net: ethernet: aquantia: Ve=
ctor operations

:::::: TO: David VomLehn <vomlehn@texas.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0377779624946889117==--

