Content-Type: multipart/mixed; boundary="===============2990289760481119137=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/davicom/dm9051.c:610:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sat, 26 Mar 2022 00:55:38 +0800
Message-ID: <202203260014.gxCD6F5x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2990289760481119137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Joseph CHAMG <josright123@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34af78c4e616c359ed428d79fe4758a35d2c5473
commit: 2dc95a4d30eddac9679f295ba4304a7ab0e4ae02 net: Add dm9051 driver
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220321 (https://download.01.org/0day-ci/arc=
hive/20220326/202203260014.gxCD6F5x-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2dc95a4d30eddac9679f295ba4304a7ab0e4ae02
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2dc95a4d30eddac9679f295ba4304a7ab0e4ae02
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/backlight/adp8860_bl.c:230:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/adp8860_bl.c:230:2: note: Value stored to 'ret' =
is never read
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
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
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/net/ethernet/davicom/dm9051.c:610:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/net/ethernet/davicom/dm9051.c:598:9: note: 'ret' declared withou=
t an initial value
           int i, ret;
                  ^~~
   drivers/net/ethernet/davicom/dm9051.c:600:6: note: Assuming the conditio=
n is false
           if ((len | offset) & 1)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:600:2: note: Taking false branch
           if ((len | offset) & 1)
           ^
   drivers/net/ethernet/davicom/dm9051.c:605:14: note: Assuming 'i' is >=3D=
 'len'
           for (i =3D 0; i < len; i +=3D 2) {
                       ^~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:605:2: note: Loop condition is fal=
se. Execution continues on line 610
           for (i =3D 0; i < len; i +=3D 2) {
           ^
   drivers/net/ethernet/davicom/dm9051.c:610:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
   drivers/net/ethernet/davicom/dm9051.c:632:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/net/ethernet/davicom/dm9051.c:619:9: note: 'ret' declared withou=
t an initial value
           int i, ret;
                  ^~~
   drivers/net/ethernet/davicom/dm9051.c:621:6: note: Assuming the conditio=
n is false
           if ((len | offset) & 1)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:621:2: note: Taking false branch
           if ((len | offset) & 1)
           ^
   drivers/net/ethernet/davicom/dm9051.c:624:6: note: Assuming field 'magic=
' is equal to DM_EEPROM_MAGIC
           if (ee->magic !=3D DM_EEPROM_MAGIC)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:624:2: note: Taking false branch
           if (ee->magic !=3D DM_EEPROM_MAGIC)
           ^
   drivers/net/ethernet/davicom/dm9051.c:627:14: note: Assuming 'i' is >=3D=
 'len'
           for (i =3D 0; i < len; i +=3D 2) {
                       ^~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:627:2: note: Loop condition is fal=
se. Execution continues on line 632
           for (i =3D 0; i < len; i +=3D 2) {
           ^
   drivers/net/ethernet/davicom/dm9051.c:632:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
>> drivers/net/ethernet/davicom/dm9051.c:714:21: warning: Value stored to '=
ndev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:714:21: note: Value stored to 'nde=
v' during its initialization is never read
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:744:21: warning: Value stored to '=
ndev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:744:21: note: Value stored to 'nde=
v' during its initialization is never read
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/orangefs/inode.c:836:3: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                   ret =3D posix_acl_chmod(&init_user_ns, inode, inode->i_m=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/orangefs/inode.c:836:3: note: Value stored to 'ret' is never read
                   ret =3D posix_acl_chmod(&init_user_ns, inode, inode->i_m=
ode);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
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
   fs/orangefs/super.c:480:22: warning: Value stored to 'sb' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct super_block *sb =3D ERR_PTR(-EINVAL);
                               ^~   ~~~~~~~~~~~~~~~~
   fs/orangefs/super.c:480:22: note: Value stored to 'sb' during its initia=
lization is never read
           struct super_block *sb =3D ERR_PTR(-EINVAL);
                               ^~   ~~~~~~~~~~~~~~~~
   fs/orangefs/super.c:573:3: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                   ret =3D service_operation(new_op, "orangefs_features", 0=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/orangefs/super.c:573:3: note: Value stored to 'ret' is never read
                   ret =3D service_operation(new_op, "orangefs_features", 0=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/sprd/sprd_dsi.c:338:10: warning: Although the value stor=
ed to 'video_size_step' is used in the enclosing expression, the value is n=
ever actually read from 'video_size_step' [clang-analyzer-deadcode.DeadStor=
es]
                   return video_size_step =3D 1;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:338:10: note: Although the value stored =
to 'video_size_step' is used in the enclosing expression, the value is neve=
r actually read from 'video_size_step'
                   return video_size_step =3D 1;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:345:10: warning: Although the value stor=
ed to 'video_size_step' is used in the enclosing expression, the value is n=
ever actually read from 'video_size_step' [clang-analyzer-deadcode.DeadStor=
es]
                   return video_size_step =3D 2;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:345:10: note: Although the value stored =
to 'video_size_step' is used in the enclosing expression, the value is neve=
r actually read from 'video_size_step'
                   return video_size_step =3D 2;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:641:15: warning: Although the value stor=
ed to 'j' is used in the enclosing expression, the value is never actually =
read from 'j' [clang-analyzer-deadcode.DeadStores]
                   for (i =3D 0, j =3D 0; i < len; i +=3D j) {
                               ^   ~
   drivers/gpu/drm/sprd/sprd_dsi.c:641:15: note: Although the value stored =
to 'j' is used in the enclosing expression, the value is never actually rea=
d from 'j'
                   for (i =3D 0, j =3D 0; i < len; i +=3D j) {
                               ^   ~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/msm/dp/dp_aux.c:150:2: warning: Value stored to 'data' i=
s never read [clang-analyzer-deadcode.DeadStores]
           data =3D dp_catalog_aux_read_data(aux->catalog);
--
                  ^~~~~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/getorder.h:46:9: note: Returning from 'fls64'
           return fls64(size);
                  ^~~~~~~~~~~
   include/asm-generic/getorder.h:46:2: note: Returning the value 64
           return fls64(size);
           ^~~~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4406:11: note: Returning from 'get_order'
                   order =3D get_order(req->tp_block_size);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4406:3: note: The value 64 is assigned to 'order'
                   order =3D get_order(req->tp_block_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4407:30: note: Passing the value 64 via 2nd param=
eter 'order'
                   pg_vec =3D alloc_pg_vec(req, order);
                                              ^~~~~
   net/packet/af_packet.c:4407:12: note: Calling 'alloc_pg_vec'
                   pg_vec =3D alloc_pg_vec(req, order);
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4318:15: note: Assuming 'pg_vec' is non-null
           if (unlikely(!pg_vec))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/packet/af_packet.c:4318:2: note: Taking false branch
           if (unlikely(!pg_vec))
           ^
   net/packet/af_packet.c:4321:14: note: 'i' is < 'block_nr'
           for (i =3D 0; i < block_nr; i++) {
                       ^
   net/packet/af_packet.c:4321:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < block_nr; i++) {
           ^
   net/packet/af_packet.c:4322:44: note: Passing the value 64 via 1st param=
eter 'order'
                   pg_vec[i].buffer =3D alloc_one_pg_vec_page(order);
                                                            ^~~~~
   net/packet/af_packet.c:4322:22: note: Calling 'alloc_one_pg_vec_page'
                   pg_vec[i].buffer =3D alloc_one_pg_vec_page(order);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4293:6: note: Assuming 'buffer' is null
           if (buffer)
               ^~~~~~
   net/packet/af_packet.c:4293:2: note: Taking false branch
           if (buffer)
           ^
   net/packet/af_packet.c:4297:33: note: The result of the left shift is un=
defined due to shifting by '64', which is greater or equal to the width of =
type 'int'
           buffer =3D vzalloc(array_size((1 << order), PAGE_SIZE));
                                          ^  ~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/net/ethernet/davicom/dm9051.c:610:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/net/ethernet/davicom/dm9051.c:598:9: note: 'ret' declared withou=
t an initial value
           int i, ret;
                  ^~~
   drivers/net/ethernet/davicom/dm9051.c:600:6: note: Assuming the conditio=
n is false
           if ((len | offset) & 1)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:600:2: note: Taking false branch
           if ((len | offset) & 1)
           ^
   drivers/net/ethernet/davicom/dm9051.c:605:14: note: Assuming 'i' is >=3D=
 'len'
           for (i =3D 0; i < len; i +=3D 2) {
                       ^~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:605:2: note: Loop condition is fal=
se. Execution continues on line 610
           for (i =3D 0; i < len; i +=3D 2) {
           ^
   drivers/net/ethernet/davicom/dm9051.c:610:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
   drivers/net/ethernet/davicom/dm9051.c:632:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/net/ethernet/davicom/dm9051.c:619:9: note: 'ret' declared withou=
t an initial value
           int i, ret;
                  ^~~
   drivers/net/ethernet/davicom/dm9051.c:621:6: note: Assuming the conditio=
n is false
           if ((len | offset) & 1)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:621:2: note: Taking false branch
           if ((len | offset) & 1)
           ^
   drivers/net/ethernet/davicom/dm9051.c:624:6: note: Assuming field 'magic=
' is equal to DM_EEPROM_MAGIC
           if (ee->magic !=3D DM_EEPROM_MAGIC)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:624:2: note: Taking false branch
           if (ee->magic !=3D DM_EEPROM_MAGIC)
           ^
   drivers/net/ethernet/davicom/dm9051.c:627:14: note: Assuming 'i' is >=3D=
 'len'
           for (i =3D 0; i < len; i +=3D 2) {
                       ^~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:627:2: note: Loop condition is fal=
se. Execution continues on line 632
           for (i =3D 0; i < len; i +=3D 2) {
           ^
   drivers/net/ethernet/davicom/dm9051.c:632:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
>> drivers/net/ethernet/davicom/dm9051.c:714:21: warning: Value stored to '=
ndev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:714:21: note: Value stored to 'nde=
v' during its initialization is never read
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:744:21: warning: Value stored to '=
ndev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   drivers/net/ethernet/davicom/dm9051.c:744:21: note: Value stored to 'nde=
v' during its initialization is never read
           struct net_device *ndev =3D db->ndev;
                              ^~~~   ~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/ntfs/file.c:194:3: warning: Value stored to 'm' is never read [clang-=
analyzer-deadcode.DeadStores]
                   m =3D ctx->mrec;
                   ^   ~~~~~~~~~
   fs/ntfs/file.c:194:3: note: Value stored to 'm' is never read
                   m =3D ctx->mrec;
                   ^   ~~~~~~~~~
   fs/ntfs/file.c:1779:15: warning: Although the value stored to 'idx' is u=
sed in the enclosing expression, the value is never actually read from 'idx=
' [clang-analyzer-deadcode.DeadStores]
                   start_idx =3D idx =3D pos >> PAGE_SHIFT;
                               ^     ~~~~~~~~~~~~~~~~~
   fs/ntfs/file.c:1779:15: note: Although the value stored to 'idx' is used=
 in the enclosing expression, the value is never actually read from 'idx'
                   start_idx =3D idx =3D pos >> PAGE_SHIFT;
                               ^     ~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/ntfs/inode.c:1840:3: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   err =3D -ENOMEM;
                   ^     ~~~~~~~
   fs/ntfs/inode.c:1840:3: note: Value stored to 'err' is never read
                   err =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
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
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c:355:27: warning: Value stored=
 to 'mdp5_state' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct mdp5_plane_state *mdp5_state =3D to_mdp5_plane_state(new_=
plane_state);
                                    ^~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c:355:27: note: Value stored to=
 'mdp5_state' during its initialization is never read
           struct mdp5_plane_state *mdp5_state =3D to_mdp5_plane_state(new_=
plane_state);
                                    ^~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:158:16: warning: The result of =
the left shift is undefined because the left operand is negative [clang-ana=
lyzer-core.UndefinedBinaryOperatorResult]
                   blkcfg |=3D (n << (8 * i));
                              ~ ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:136:7: note: Assuming 'rev' is =
<=3D 0
           if ((rev > 0) && (format->chroma_sample > CHROMA_FULL)) {
                ^~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:136:16: note: Left side of '&&'=
 is false
           if ((rev > 0) && (format->chroma_sample > CHROMA_FULL)) {
                         ^
   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:146:14: note: Assuming 'i' is <=
 'nplanes'
           for (i =3D 0; i < nplanes; i++) {
                       ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:146:2: note: Loop condition is =
true.  Entering loop body
           for (i =3D 0; i < nplanes; i++) {

vim +610 drivers/net/ethernet/davicom/dm9051.c

2dc95a4d30edda Joseph CHAMG 2022-02-11  591  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  592  static int dm9051_get_eeprom(s=
truct net_device *ndev,
2dc95a4d30edda Joseph CHAMG 2022-02-11  593  			     struct ethtool_eeprom =
*ee, u8 *data)
2dc95a4d30edda Joseph CHAMG 2022-02-11  594  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  595  	struct board_info *db =3D to_=
dm9051_board(ndev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  596  	int offset =3D ee->offset;
2dc95a4d30edda Joseph CHAMG 2022-02-11  597  	int len =3D ee->len;
2dc95a4d30edda Joseph CHAMG 2022-02-11  598  	int i, ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  599  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  600  	if ((len | offset) & 1)
2dc95a4d30edda Joseph CHAMG 2022-02-11  601  		return -EINVAL;
2dc95a4d30edda Joseph CHAMG 2022-02-11  602  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  603  	ee->magic =3D DM_EEPROM_MAGIC;
2dc95a4d30edda Joseph CHAMG 2022-02-11  604  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  605  	for (i =3D 0; i < len; i +=3D=
 2) {
2dc95a4d30edda Joseph CHAMG 2022-02-11  606  		ret =3D dm9051_eeprom_read(d=
b, (offset + i) / 2, data + i);
2dc95a4d30edda Joseph CHAMG 2022-02-11  607  		if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  608  			break;
2dc95a4d30edda Joseph CHAMG 2022-02-11  609  	}
2dc95a4d30edda Joseph CHAMG 2022-02-11 @610  	return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  611  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  612  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  613  static int dm9051_set_eeprom(s=
truct net_device *ndev,
2dc95a4d30edda Joseph CHAMG 2022-02-11  614  			     struct ethtool_eeprom =
*ee, u8 *data)
2dc95a4d30edda Joseph CHAMG 2022-02-11  615  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  616  	struct board_info *db =3D to_=
dm9051_board(ndev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  617  	int offset =3D ee->offset;
2dc95a4d30edda Joseph CHAMG 2022-02-11  618  	int len =3D ee->len;
2dc95a4d30edda Joseph CHAMG 2022-02-11  619  	int i, ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  620  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  621  	if ((len | offset) & 1)
2dc95a4d30edda Joseph CHAMG 2022-02-11  622  		return -EINVAL;
2dc95a4d30edda Joseph CHAMG 2022-02-11  623  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  624  	if (ee->magic !=3D DM_EEPROM_=
MAGIC)
2dc95a4d30edda Joseph CHAMG 2022-02-11  625  		return -EINVAL;
2dc95a4d30edda Joseph CHAMG 2022-02-11  626  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  627  	for (i =3D 0; i < len; i +=3D=
 2) {
2dc95a4d30edda Joseph CHAMG 2022-02-11  628  		ret =3D dm9051_eeprom_write(=
db, (offset + i) / 2, data + i);
2dc95a4d30edda Joseph CHAMG 2022-02-11  629  		if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  630  			break;
2dc95a4d30edda Joseph CHAMG 2022-02-11  631  	}
2dc95a4d30edda Joseph CHAMG 2022-02-11  632  	return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  633  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  634  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  635  static void dm9051_get_pausepa=
ram(struct net_device *ndev,
2dc95a4d30edda Joseph CHAMG 2022-02-11  636  				  struct ethtool_pausepara=
m *pause)
2dc95a4d30edda Joseph CHAMG 2022-02-11  637  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  638  	struct board_info *db =3D to_=
dm9051_board(ndev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  639  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  640  	*pause =3D db->pause;
2dc95a4d30edda Joseph CHAMG 2022-02-11  641  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  642  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  643  static int dm9051_set_pausepar=
am(struct net_device *ndev,
2dc95a4d30edda Joseph CHAMG 2022-02-11  644  				 struct ethtool_pauseparam=
 *pause)
2dc95a4d30edda Joseph CHAMG 2022-02-11  645  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  646  	struct board_info *db =3D to_=
dm9051_board(ndev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  647  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  648  	db->pause =3D *pause;
2dc95a4d30edda Joseph CHAMG 2022-02-11  649  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  650  	if (pause->autoneg =3D=3D AUT=
ONEG_DISABLE)
2dc95a4d30edda Joseph CHAMG 2022-02-11  651  		return dm9051_update_fcr(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  652  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  653  	phy_set_sym_pause(db->phydev,=
 pause->rx_pause, pause->tx_pause,
2dc95a4d30edda Joseph CHAMG 2022-02-11  654  			  pause->autoneg);
2dc95a4d30edda Joseph CHAMG 2022-02-11  655  	phy_start_aneg(db->phydev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  656  	return 0;
2dc95a4d30edda Joseph CHAMG 2022-02-11  657  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  658  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  659  static const struct ethtool_op=
s dm9051_ethtool_ops =3D {
2dc95a4d30edda Joseph CHAMG 2022-02-11  660  	.get_drvinfo =3D dm9051_get_d=
rvinfo,
2dc95a4d30edda Joseph CHAMG 2022-02-11  661  	.get_link_ksettings =3D phy_e=
thtool_get_link_ksettings,
2dc95a4d30edda Joseph CHAMG 2022-02-11  662  	.set_link_ksettings =3D phy_e=
thtool_set_link_ksettings,
2dc95a4d30edda Joseph CHAMG 2022-02-11  663  	.get_msglevel =3D dm9051_get_=
msglevel,
2dc95a4d30edda Joseph CHAMG 2022-02-11  664  	.set_msglevel =3D dm9051_set_=
msglevel,
2dc95a4d30edda Joseph CHAMG 2022-02-11  665  	.nway_reset =3D phy_ethtool_n=
way_reset,
2dc95a4d30edda Joseph CHAMG 2022-02-11  666  	.get_link =3D ethtool_op_get_=
link,
2dc95a4d30edda Joseph CHAMG 2022-02-11  667  	.get_eeprom_len =3D dm9051_ge=
t_eeprom_len,
2dc95a4d30edda Joseph CHAMG 2022-02-11  668  	.get_eeprom =3D dm9051_get_ee=
prom,
2dc95a4d30edda Joseph CHAMG 2022-02-11  669  	.set_eeprom =3D dm9051_set_ee=
prom,
2dc95a4d30edda Joseph CHAMG 2022-02-11  670  	.get_pauseparam =3D dm9051_ge=
t_pauseparam,
2dc95a4d30edda Joseph CHAMG 2022-02-11  671  	.set_pauseparam =3D dm9051_se=
t_pauseparam,
2dc95a4d30edda Joseph CHAMG 2022-02-11  672  };
2dc95a4d30edda Joseph CHAMG 2022-02-11  673  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  674  static int dm9051_all_start(st=
ruct board_info *db)
2dc95a4d30edda Joseph CHAMG 2022-02-11  675  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  676  	int ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  677  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  678  	/* GPR power on of the intern=
al phy
2dc95a4d30edda Joseph CHAMG 2022-02-11  679  	 */
2dc95a4d30edda Joseph CHAMG 2022-02-11  680  	ret =3D dm9051_set_reg(db, DM=
9051_GPR, 0);
2dc95a4d30edda Joseph CHAMG 2022-02-11  681  	if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  682  		return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  683  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  684  	/* dm9051 chip registers coul=
d not be accessed within 1 ms
2dc95a4d30edda Joseph CHAMG 2022-02-11  685  	 * after GPR power on, delay =
1 ms is essential
2dc95a4d30edda Joseph CHAMG 2022-02-11  686  	 */
2dc95a4d30edda Joseph CHAMG 2022-02-11  687  	msleep(1);
2dc95a4d30edda Joseph CHAMG 2022-02-11  688  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  689  	ret =3D dm9051_core_reset(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  690  	if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  691  		return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  692  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  693  	return dm9051_enable_interrup=
t(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  694  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  695  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  696  static int dm9051_all_stop(str=
uct board_info *db)
2dc95a4d30edda Joseph CHAMG 2022-02-11  697  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  698  	int ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  699  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  700  	/* GPR power off of the inter=
nal phy,
2dc95a4d30edda Joseph CHAMG 2022-02-11  701  	 * The internal phy still cou=
ld be accessed after this GPR power off control
2dc95a4d30edda Joseph CHAMG 2022-02-11  702  	 */
2dc95a4d30edda Joseph CHAMG 2022-02-11  703  	ret =3D dm9051_set_reg(db, DM=
9051_GPR, GPR_PHY_OFF);
2dc95a4d30edda Joseph CHAMG 2022-02-11  704  	if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  705  		return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  706  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  707  	return dm9051_set_reg(db, DM9=
051_RCR, RCR_RX_DISABLE);
2dc95a4d30edda Joseph CHAMG 2022-02-11  708  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  709  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  710  /* fifo reset while rx error f=
ound
2dc95a4d30edda Joseph CHAMG 2022-02-11  711   */
2dc95a4d30edda Joseph CHAMG 2022-02-11  712  static int dm9051_all_restart(=
struct board_info *db)
2dc95a4d30edda Joseph CHAMG 2022-02-11  713  {
2dc95a4d30edda Joseph CHAMG 2022-02-11 @714  	struct net_device *ndev =3D d=
b->ndev;
2dc95a4d30edda Joseph CHAMG 2022-02-11  715  	int ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  716  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  717  	ret =3D dm9051_core_reset(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  718  	if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  719  		return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  720  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  721  	ret =3D dm9051_enable_interru=
pt(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  722  	if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  723  		return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  724  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  725  	netdev_dbg(ndev, " rxstatus_E=
r & rxlen_Er %d, RST_c %d\n",
2dc95a4d30edda Joseph CHAMG 2022-02-11  726  		   db->bc.status_err_counter=
 + db->bc.large_err_counter,
2dc95a4d30edda Joseph CHAMG 2022-02-11  727  		   db->bc.fifo_rst_counter);
2dc95a4d30edda Joseph CHAMG 2022-02-11  728  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  729  	ret =3D dm9051_set_recv(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  730  	if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  731  		return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  732  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  733  	return dm9051_set_fcr(db);
2dc95a4d30edda Joseph CHAMG 2022-02-11  734  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  735  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2990289760481119137==--

