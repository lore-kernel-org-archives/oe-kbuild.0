Content-Type: multipart/mixed; boundary="===============1821510390489522701=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/elx/libefc/efc_device.c:51:2: warning: Value stored to 'efc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 09 Jan 2022 22:08:42 +0800
Message-ID: <202201092230.7wIo20Z2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1821510390489522701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: James Smart <jsmart2021@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Daniel Wagner <dwagner@suse.de>
CC: Ram Vegesna <ram.vegesna@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: ebc076b3eddc807729bd81f7bc48e798a3ddc477 scsi: elx: efct: Tie into =
kernel Kconfig and build process
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20220101 (https://download.01.org/0day-ci/ar=
chive/20220109/202201092230.7wIo20Z2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Debc076b3eddc807729bd81f7bc48e798a3ddc477
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ebc076b3eddc807729bd81f7bc48e798a3ddc477
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           while (inlen > 0 && maxout > 0) {
                  ^~~~~~~~~
   fs/nls/nls_base.c:194:9: note: Left side of '&&' is true
   fs/nls/nls_base.c:194:22: note: Assuming 'maxout' is > 0
           while (inlen > 0 && maxout > 0) {
                               ^~~~~~~~~~
   fs/nls/nls_base.c:194:2: note: Loop condition is true.  Entering loop bo=
dy
           while (inlen > 0 && maxout > 0) {
           ^
   fs/nls/nls_base.c:195:7: note: Calling 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:176:2: note: Control jumps to the 'default' case at li=
ne 177
           switch (endian) {
           ^
   fs/nls/nls_base.c:178:3: note: Returning value (loaded from 'c'), which =
participates in a condition later
                   return c;
                   ^~~~~~~~
   fs/nls/nls_base.c:195:7: note: Returning from 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:196:7: note: Assuming 'u' is not equal to 0
                   if (!u)
                       ^~
   fs/nls/nls_base.c:196:3: note: Taking false branch
                   if (!u)
                   ^
   fs/nls/nls_base.c:200:7: note: Assuming 'u' is > 127
                   if (u > 0x7f) {
                       ^~~~~~~~
   fs/nls/nls_base.c:200:3: note: Taking true branch
                   if (u > 0x7f) {
                   ^
   fs/nls/nls_base.c:201:8: note: Assuming the condition is false
                           if ((u & SURROGATE_MASK) =3D=3D SURROGATE_PAIR) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:201:4: note: Taking false branch
                           if ((u & SURROGATE_MASK) =3D=3D SURROGATE_PAIR) {
                           ^
   fs/nls/nls_base.c:220:4: note: Taking false branch
                           if (size =3D=3D -1) {
                           ^
   fs/nls/nls_base.c:194:9: note: Assuming 'inlen' is > 0
           while (inlen > 0 && maxout > 0) {
                  ^~~~~~~~~
   fs/nls/nls_base.c:194:9: note: Left side of '&&' is true
   fs/nls/nls_base.c:194:22: note: 'maxout' is > 0
           while (inlen > 0 && maxout > 0) {
                               ^~~~~~
   fs/nls/nls_base.c:194:2: note: Loop condition is true.  Entering loop bo=
dy
           while (inlen > 0 && maxout > 0) {
           ^
   fs/nls/nls_base.c:195:7: note: Calling 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:176:2: note: Control jumps to the 'default' case at li=
ne 177
           switch (endian) {
           ^
   fs/nls/nls_base.c:178:3: note: Returning value (loaded from 'c'), which =
participates in a condition later
                   return c;
                   ^~~~~~~~
   fs/nls/nls_base.c:195:7: note: Returning from 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:196:7: note: Assuming 'u' is not equal to 0
                   if (!u)
                       ^~
   fs/nls/nls_base.c:196:3: note: Taking false branch
                   if (!u)
                   ^
   fs/nls/nls_base.c:200:7: note: Assuming 'u' is <=3D 127
                   if (u > 0x7f) {
                       ^~~~~~~~
   fs/nls/nls_base.c:200:3: note: Taking false branch
                   if (u > 0x7f) {
                   ^
   fs/nls/nls_base.c:227:5: note: Null pointer value stored to 'op'
                           *op++ =3D (u8) u;
                            ^~~~
   fs/nls/nls_base.c:227:10: note: Dereference of null pointer
                           *op++ =3D (u8) u;
                           ~~~~~~^~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   block/partitions/atari.c:143:5: warning: Value stored to 'part_fmt' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   part_fmt =3D 2;
                                   ^          ~
   block/partitions/atari.c:143:5: note: Value stored to 'part_fmt' is neve=
r read
                                   part_fmt =3D 2;
                                   ^          ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/scsi/elx/libefc/efc_device.c:51:2: warning: Value stored to 'efc=
' is never read [clang-analyzer-deadcode.DeadStores]
           efc =3D node->efc;
           ^     ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_device.c:51:2: note: Value stored to 'efc' i=
s never read
           efc =3D node->efc;
           ^     ~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/binfmt_elf.c:1293:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1293:3: note: Value stored to 'error' is never read
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/fhandle.c:232:9: warning: 1st function call argument is an uninitiali=
zed value [clang-analyzer-core.CallAndMessage]
           file =3D file_open_root(path.dentry, path.mnt, "", open_flag, 0);
                  ^
   fs/fhandle.c:256:1: note: Calling '__se_sys_open_by_handle_at'
   SYSCALL_DEFINE3(open_by_handle_at, int, mountdirfd,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:231:2: note: expanded from macro =
'__SYSCALL_DEFINEx'
           __X64_SYS_STUBx(x, name, __VA_ARGS__)                           \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:97:2: note: expanded from macro '=
__X64_SYS_STUBx'
           __SYS_STUBx(x64, sys##name,                                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/fhandle.c:256:1: note: Calling '__do_sys_open_by_handle_at'
   SYSCALL_DEFINE3(open_by_handle_at, int, mountdirfd,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:235:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/fhandle.c:262:2: note: Taking true branch
           if (force_o_largefile())
           ^
   fs/fhandle.c:265:8: note: Calling 'do_handle_open'
           ret =3D do_handle_open(mountdirfd, handle, flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fhandle.c:223:11: note: Calling 'handle_to_path'
           retval =3D handle_to_path(mountdirfd, ufh, &path);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/broadcom/b44.c:568:19: note: 'remote_adv' declared =
without an initial value
                           u32 local_adv, remote_adv;
                                          ^~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:570:8: note: Assuming the condition =
is false
                           if (bp->flags & B44_FLAG_FULL_DUPLEX)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:570:4: note: Taking false branch
                           if (bp->flags & B44_FLAG_FULL_DUPLEX)
                           ^
   drivers/net/ethernet/broadcom/b44.c:576:8: note: Assuming the condition =
is true
                           if (!(bp->flags & B44_FLAG_FORCE_LINK) &&
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:576:8: note: Left side of '&&' is tr=
ue
   drivers/net/ethernet/broadcom/b44.c:577:9: note: Calling 'b44_readphy'
                               !b44_readphy(bp, MII_ADVERTISE, &local_adv) =
&&
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:6: note: Assuming the condition =
is false
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:2: note: Taking false branch
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
           ^
   drivers/net/ethernet/broadcom/b44.c:290:2: note: Returning value, which =
participates in a condition later
           return __b44_readphy(bp, bp->phy_addr, reg, val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:577:9: note: Returning from 'b44_rea=
dphy'
                               !b44_readphy(bp, MII_ADVERTISE, &local_adv) =
&&
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:577:8: note: Assuming the condition =
is true
                               !b44_readphy(bp, MII_ADVERTISE, &local_adv) =
&&
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:576:8: note: Left side of '&&' is tr=
ue
                           if (!(bp->flags & B44_FLAG_FORCE_LINK) &&
                               ^
   drivers/net/ethernet/broadcom/b44.c:578:9: note: Calling 'b44_readphy'
                               !b44_readphy(bp, MII_LPA, &remote_adv))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:6: note: Assuming the condition =
is true
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:2: note: Taking true branch
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
           ^
   drivers/net/ethernet/broadcom/b44.c:288:3: note: Returning without writi=
ng to '*val'
                   return 0;
                   ^
   drivers/net/ethernet/broadcom/b44.c:288:3: note: Returning zero, which p=
articipates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:578:9: note: Returning from 'b44_rea=
dphy'
                               !b44_readphy(bp, MII_LPA, &remote_adv))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:576:4: note: Taking true branch
                           if (!(bp->flags & B44_FLAG_FORCE_LINK) &&
                           ^
   drivers/net/ethernet/broadcom/b44.c:579:5: note: 3rd function call argum=
ent is an uninitialized value
                                   b44_set_flow_ctrl(bp, local_adv, remote_=
adv);
                                   ^                                ~~~~~~~=
~~~
   drivers/net/ethernet/broadcom/b44.c:1816:11: warning: The left operand o=
f '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (bmcr & BMCR_ANENABLE) {
               ~~~~ ^
   drivers/net/ethernet/broadcom/b44.c:1809:2: note: 'bmcr' declared withou=
t an initial value
           u32 bmcr;
           ^~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:1813:2: note: Calling 'b44_readphy'
           b44_readphy(bp, MII_BMCR, &bmcr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:6: note: Assuming the condition =
is true
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:2: note: Taking true branch
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
           ^
   drivers/net/ethernet/broadcom/b44.c:288:3: note: Returning without writi=
ng to '*val'
                   return 0;
                   ^
   drivers/net/ethernet/broadcom/b44.c:1813:2: note: Returning from 'b44_re=
adphy'
           b44_readphy(bp, MII_BMCR, &bmcr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:1814:2: note: Calling 'b44_readphy'
           b44_readphy(bp, MII_BMCR, &bmcr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:287:2: note: Taking true branch
           if (bp->flags & B44_FLAG_EXTERNAL_PHY)
           ^
   drivers/net/ethernet/broadcom/b44.c:288:3: note: Returning without writi=
ng to '*val'
                   return 0;
                   ^
   drivers/net/ethernet/broadcom/b44.c:1814:2: note: Returning from 'b44_re=
adphy'
           b44_readphy(bp, MII_BMCR, &bmcr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/b44.c:1816:11: note: The left operand of '=
&' is a garbage value
           if (bmcr & BMCR_ANENABLE) {
               ~~~~ ^
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/scsi/elx/efct/efct_hw.c:1518:3: warning: Value stored to 'ctx' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ctx =3D list_first_entry(&hw->cmd_head,
                   ^
   drivers/scsi/elx/efct/efct_hw.c:1518:3: note: Value stored to 'ctx' is n=
ever read
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/scsi/elx/efct/efct_hw_queues.c:196:23: warning: Access to field =
'hw' results in a dereference of an undefined pointer value [clang-analyzer=
-core.NullDereference]
           struct efct_hw *hw =3D eqs[0]->hw;
                                ^
   drivers/scsi/elx/efct/efct_hw_queues.c:32:14: note: Assuming 'i' is >=3D=
 field 'n_eq'
           for (i =3D 0; i < hw->config.n_eq; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_hw_queues.c:32:2: note: Loop condition is fal=
se. Execution continues on line 73
           for (i =3D 0; i < hw->config.n_eq; i++) {
           ^
   drivers/scsi/elx/efct/efct_hw_queues.c:73:6: note: Calling 'efct_hw_new_=
cq_set'
           if (efct_hw_new_cq_set(eqs, cqs, i, hw->num_qentries[SLI4_QTYPE_=
CQ])) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/elx/efct/efct_hw_queues.c:196:23: note: Access to field 'hw=
' results in a dereference of an undefined pointer value
           struct efct_hw *hw =3D eqs[0]->hw;
                                ^~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/elx/efct/efct_lio.c:1156:15: warning: Value stored to 'efct=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct efct *efct =3D nport->efc->base;
                        ^~~~   ~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1156:15: note: Value stored to 'efct' d=
uring its initialization is never read
           struct efct *efct =3D nport->efc->base;
                        ^~~~   ~~~~~~~~~~~~~~~~
>> drivers/scsi/elx/efct/efct_lio.c:1366:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "FROM_INITIATOR";
                   ^      ~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1366:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "FROM_INITIATOR";
                   ^      ~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1370:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "TO_INITIATOR";
                   ^      ~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1370:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "TO_INITIATOR";
                   ^      ~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1374:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "BIDIR";
                   ^      ~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1374:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "BIDIR";
                   ^      ~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1378:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "NONE";
                   ^      ~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1378:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "NONE";
                   ^      ~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: warning: Access to field 'gener=
ate_node_acls' results in a dereference of a null pointer (loaded from vari=
able 'a') [clang-analyzer-core.NullDereference]
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1515:10: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           a->name =3D val;                                                =
    \
           ~       ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Left side of '&&' is false
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Taking false branch
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Loop condition is false. =
 Exiting loop
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: 'tpg' initialized to a nu=
ll pointer value
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: 'a' initialized to a null=
 pointer value
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1500:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           struct efct_lio_tpg_attrib *a =3D &tpg->tpg_attrib;             =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Assuming 'ret' is >=3D 0
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1505:6: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           if (ret < 0) {                                                  =
  \
               ^~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Taking false branch
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
--
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/media/tuners/e4000.c:12:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:12:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:525:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:525:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/scsi/elx/efct/efct_unsol.c:147:27: warning: Value stored to 'fch=
dr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
                   struct fc_frame_header  *fchdr =3D seq->header->dma.virt;
                                            ^~~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_unsol.c:147:27: note: Value stored to 'fchdr'=
 during its initialization is never read
                   struct fc_frame_header  *fchdr =3D seq->header->dma.virt;
                                            ^~~~~   ~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/elx/efct/efct_unsol.c:320:15: warning: Value stored to 'efc=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct efct *efct =3D node->efct;
                        ^~~~   ~~~~~~~~~~
   drivers/scsi/elx/efct/efct_unsol.c:320:15: note: Value stored to 'efct' =
during its initialization is never read
           struct efct *efct =3D node->efct;
                        ^~~~   ~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/scsi/elx/libefc/efc_cmds.c:36:14: warning: Value stored to 'efc'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_cmds.c:36:14: note: Value stored to 'efc' du=
ring its initialization is never read
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_cmds.c:314:14: warning: Value stored to 'efc=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct efc *efc =3D domain->efc;
                       ^~~   ~~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_cmds.c:314:14: note: Value stored to 'efc' d=
uring its initialization is never read
           struct efc *efc =3D domain->efc;
                       ^~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/scsi/elx/libefc/efc_fabric.c:77:14: warning: Value stored to 'ef=
c' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_fabric.c:77:14: note: Value stored to 'efc' =
during its initialization is never read
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
>> drivers/scsi/elx/libefc/efc_fabric.c:398:19: warning: Value stored to 'n=
ode' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct efc_node *node =3D ctx->app;
                            ^~~~   ~~~~~~~~
   drivers/scsi/elx/libefc/efc_fabric.c:398:19: note: Value stored to 'node=
' during its initialization is never read
           struct efc_node *node =3D ctx->app;
                            ^~~~   ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:397:13: warning: Division by z=
ero [clang-analyzer-core.DivideZero]
           *p_line +=3D DIV_ROUND_UP(p_blk->total_size, p_blk->real_size_in=
_page);
                      ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:480:2: note: Assuming field 'd=
p_level' is > QED_LEVEL_VERBOSE
           DP_VERBOSE(p_hwfn, QED_MSG_ILT,
           ^
   include/linux/qed/qed_if.h:1212:17: note: expanded from macro 'DP_VERBOS=
E'
                   if (unlikely(((cdev)->dp_level <=3D QED_LEVEL_VERBOSE) &=
& \
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:480:2: note: Left side of '&&'=
 is false
           DP_VERBOSE(p_hwfn, QED_MSG_ILT,
           ^
   include/linux/qed/qed_if.h:1212:56: note: expanded from macro 'DP_VERBOS=
E'
                   if (unlikely(((cdev)->dp_level <=3D QED_LEVEL_VERBOSE) &=
& \
                                                                        ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:480:2: note: Taking false bran=
ch
           DP_VERBOSE(p_hwfn, QED_MSG_ILT,
           ^
   include/linux/qed/qed_if.h:1212:3: note: expanded from macro 'DP_VERBOSE'
                   if (unlikely(((cdev)->dp_level <=3D QED_LEVEL_VERBOSE) &=
& \
                   ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:480:2: note: Loop condition is=
 false.  Exiting loop
           DP_VERBOSE(p_hwfn, QED_MSG_ILT,
           ^
   include/linux/qed/qed_if.h:1211:2: note: expanded from macro 'DP_VERBOSE'
           do {                                                            \
           ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:495:10: note: Calling 'qed_cxt=
_set_blk'
           p_blk =3D qed_cxt_set_blk(&p_cli->pf_blks[CDUC_BLK]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:439:2: note: Returning without=
 writing to 'p_blk->real_size_in_page'
           return p_blk;
           ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:495:10: note: Returning from '=
qed_cxt_set_blk'
           p_blk =3D qed_cxt_set_blk(&p_cli->pf_blks[CDUC_BLK]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:499:2: note: Calling 'qed_ilt_=
cli_blk_fill'
           qed_ilt_cli_blk_fill(p_cli, p_blk, curr_line,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:375:13: note: Field 'total_siz=
e' is 0
           if (p_blk->total_size)
                      ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:375:2: note: Taking false bran=
ch
           if (p_blk->total_size)
           ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:379:2: note: The value 0 is as=
signed to field 'real_size_in_page'
           p_blk->real_size_in_page =3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:380:6: note: Assuming 'elem_si=
ze' is 0
           if (elem_size)
               ^~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:380:2: note: Taking false bran=
ch
           if (elem_size)
           ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:499:2: note: Returning from 'q=
ed_ilt_cli_blk_fill'
           qed_ilt_cli_blk_fill(p_cli, p_blk, curr_line,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:502:2: note: Calling 'qed_ilt_=
cli_adv_line'
           qed_ilt_cli_adv_line(p_hwfn, p_cli, p_blk, &curr_line, ILT_CLI_C=
DUC);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:390:6: note: Assuming field 't=
otal_size' is not equal to 0
           if (!p_blk->total_size)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:390:2: note: Taking false bran=
ch
           if (!p_blk->total_size)
           ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:393:6: note: Assuming field 'a=
ctive' is true
           if (!p_cli->active)
               ^~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:393:2: note: Taking false bran=
ch
           if (!p_cli->active)
           ^
   drivers/net/ethernet/qlogic/qed/qed_cxt.c:397:13: note: Division by zero
           *p_line +=3D DIV_ROUND_UP(p_blk->total_size, p_blk->real_size_in=
_page);
                      ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
--
   13 warnings generated.
   drivers/scsi/isci/port.c:201:24: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   attached_sas_address =3D properties.remote.sas_address.h=
igh;
                                        ^
   drivers/scsi/isci/port.c:1317:2: note: Control jumps to 'case SCI_PORT_S=
UB_WAITING:'  at line 1318
           switch (state) {
           ^
   drivers/scsi/isci/port.c:1322:3: note: Calling 'sci_port_activate_phy'
                   sci_port_activate_phy(iport, iphy, PF_NOTIFY|PF_RESUME);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:629:6: note: Assuming field 'protocol' is equal=
 to SAS_PROTOCOL_SATA
           if (iphy->protocol !=3D SAS_PROTOCOL_SATA && (flags & PF_RESUME))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:629:42: note: Left side of '&&' is false
           if (iphy->protocol !=3D SAS_PROTOCOL_SATA && (flags & PF_RESUME))
                                                   ^
   drivers/scsi/isci/port.c:636:2: note: Taking true branch
           if (flags & PF_NOTIFY)
           ^
   drivers/scsi/isci/port.c:637:3: note: Calling 'isci_port_link_up'
                   isci_port_link_up(ihost, iport, iphy);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:180:2: note: Taking false branch
           dev_dbg(&isci_host->pdev->dev,
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/scsi/isci/port.c:184:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&iphy->sas_phy.frame_rcvd_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/isci/port.c:184:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&iphy->sas_phy.frame_rcvd_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/isci/port.c:186:2: note: Calling 'sci_port_get_properties'
           sci_port_get_properties(iport, &properties);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:131:7: note: 'iport' is non-null
           if (!iport || iport->logical_port_index =3D=3D SCIC_SDS_DUMMY_PO=
RT)
                ^~~~~
   drivers/scsi/isci/port.c:131:6: note: Left side of '||' is false
           if (!iport || iport->logical_port_index =3D=3D SCIC_SDS_DUMMY_PO=
RT)
               ^
   drivers/scsi/isci/port.c:131:16: note: Assuming field 'logical_port_inde=
x' is equal to SCIC_SDS_DUMMY_PORT
           if (!iport || iport->logical_port_index =3D=3D SCIC_SDS_DUMMY_PO=
RT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:131:2: note: Taking true branch
           if (!iport || iport->logical_port_index =3D=3D SCIC_SDS_DUMMY_PO=
RT)
           ^
   drivers/scsi/isci/port.c:132:3: note: Returning without writing to 'prop=
->remote.sas_address.high'
                   return SCI_FAILURE_INVALID_PORT;
                   ^
   drivers/scsi/isci/port.c:186:2: note: Returning from 'sci_port_get_prope=
rties'
           sci_port_get_properties(iport, &properties);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:188:6: note: Assuming field 'protocol' is equal=
 to SAS_PROTOCOL_SATA
           if (iphy->protocol =3D=3D SAS_PROTOCOL_SATA) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:188:2: note: Taking true branch
           if (iphy->protocol =3D=3D SAS_PROTOCOL_SATA) {
           ^
   drivers/scsi/isci/port.c:201:24: note: Assigned value is garbage or unde=
fined
                   attached_sas_address =3D properties.remote.sas_address.h=
igh;
                                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:969:20: warning: Value stored to 'ihost' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:969:20: note: Value stored to 'ihost' during it=
s initialization is never read
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:1029:20: warning: Value stored to 'ihost' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:1029:20: note: Value stored to 'ihost' during i=
ts initialization is never read
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:1048:20: warning: Value stored to 'ihost' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:1048:20: note: Value stored to 'ihost' during i=
ts initialization is never read
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:1513:20: warning: Value stored to 'ihost' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/port.c:1513:20: note: Value stored to 'ihost' during i=
ts initialization is never read
           struct isci_host *ihost =3D iport->owning_controller;
                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/scsi/elx/libefc/efc_node.c:592:14: warning: Value stored to 'efc=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_node.c:592:14: note: Value stored to 'efc' d=
uring its initialization is never read
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
>> drivers/scsi/elx/libefc/efc_node.c:653:2: warning: Value stored to 'efc'=
 is never read [clang-analyzer-deadcode.DeadStores]
           efc =3D node->efc;
           ^     ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_node.c:653:2: note: Value stored to 'efc' is=
 never read
           efc =3D node->efc;
           ^     ~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/scsi/elx/libefc/efc_nport.c:442:14: warning: Value stored to 'ef=
c' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_nport.c:442:14: note: Value stored to 'efc' =
during its initialization is never read
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   9 warnings generated.
   drivers/media/pci/saa7164/saa7164-dvb.c:200:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D saa7164_dvb_pause_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-dvb.c:200:2: note: Value stored to 're=
t' is never read
           ret =3D saa7164_dvb_pause_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-dvb.c:201:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D saa7164_dvb_acquire_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-dvb.c:201:2: note: Value stored to 're=
t' is never read
           ret =3D saa7164_dvb_acquire_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/hwmon/w83793.c:1253:7: warning: Access to field 'client' results=
 in a dereference of a null pointer (loaded from variable 'data') [clang-an=
alyzer-core.NullDereference]
           if (!data->client) {
                ^
   drivers/hwmon/w83793.c:1290:28: note: 'data' initialized to a null point=
er value
           struct w83793_data *pos, *data =3D NULL;
                                     ^~~~
   drivers/hwmon/w83793.c:1299:6: note: Assuming the condition is false
           if (!mutex_trylock(&watchdog_data_mutex))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1299:2: note: Taking false branch
           if (!mutex_trylock(&watchdog_data_mutex))
           ^
   drivers/hwmon/w83793.c:1301:2: note: Left side of '&&' is false
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/w83793.c:1301:2: note: Taking false branch
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/w83793.c:1301:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'

vim +/efc +51 drivers/scsi/elx/libefc/efc_device.c

202bfdffae27a5 James Smart 2021-06-01  42  =

202bfdffae27a5 James Smart 2021-06-01  43  static void
202bfdffae27a5 James Smart 2021-06-01  44  __efc_d_common(const char *funcn=
ame, struct efc_sm_ctx *ctx,
202bfdffae27a5 James Smart 2021-06-01  45  	       enum efc_sm_event evt, v=
oid *arg)
202bfdffae27a5 James Smart 2021-06-01  46  {
202bfdffae27a5 James Smart 2021-06-01  47  	struct efc_node *node =3D NULL;
202bfdffae27a5 James Smart 2021-06-01  48  	struct efc *efc =3D NULL;
202bfdffae27a5 James Smart 2021-06-01  49  =

202bfdffae27a5 James Smart 2021-06-01  50  	node =3D ctx->app;
202bfdffae27a5 James Smart 2021-06-01 @51  	efc =3D node->efc;
202bfdffae27a5 James Smart 2021-06-01  52  =

202bfdffae27a5 James Smart 2021-06-01  53  	switch (evt) {
202bfdffae27a5 James Smart 2021-06-01  54  	/* Handle shutdown events */
202bfdffae27a5 James Smart 2021-06-01  55  	case EFC_EVT_SHUTDOWN:
202bfdffae27a5 James Smart 2021-06-01  56  		efc_log_debug(efc, "[%s] %-20s=
 %-20s\n", node->display_name,
202bfdffae27a5 James Smart 2021-06-01  57  			      funcname, efc_sm_event_=
name(evt));
202bfdffae27a5 James Smart 2021-06-01  58  		node->shutdown_reason =3D EFC_=
NODE_SHUTDOWN_DEFAULT;
202bfdffae27a5 James Smart 2021-06-01  59  		efc_node_transition(node, __ef=
c_d_initiate_shutdown, NULL);
202bfdffae27a5 James Smart 2021-06-01  60  		break;
202bfdffae27a5 James Smart 2021-06-01  61  	case EFC_EVT_SHUTDOWN_EXPLICIT_=
LOGO:
202bfdffae27a5 James Smart 2021-06-01  62  		efc_log_debug(efc, "[%s] %-20s=
 %-20s\n",
202bfdffae27a5 James Smart 2021-06-01  63  			      node->display_name, fun=
cname,
202bfdffae27a5 James Smart 2021-06-01  64  				efc_sm_event_name(evt));
202bfdffae27a5 James Smart 2021-06-01  65  		node->shutdown_reason =3D EFC_=
NODE_SHUTDOWN_EXPLICIT_LOGO;
202bfdffae27a5 James Smart 2021-06-01  66  		efc_node_transition(node, __ef=
c_d_initiate_shutdown, NULL);
202bfdffae27a5 James Smart 2021-06-01  67  		break;
202bfdffae27a5 James Smart 2021-06-01  68  	case EFC_EVT_SHUTDOWN_IMPLICIT_=
LOGO:
202bfdffae27a5 James Smart 2021-06-01  69  		efc_log_debug(efc, "[%s] %-20s=
 %-20s\n", node->display_name,
202bfdffae27a5 James Smart 2021-06-01  70  			      funcname, efc_sm_event_=
name(evt));
202bfdffae27a5 James Smart 2021-06-01  71  		node->shutdown_reason =3D EFC_=
NODE_SHUTDOWN_IMPLICIT_LOGO;
202bfdffae27a5 James Smart 2021-06-01  72  		efc_node_transition(node, __ef=
c_d_initiate_shutdown, NULL);
202bfdffae27a5 James Smart 2021-06-01  73  		break;
202bfdffae27a5 James Smart 2021-06-01  74  =

202bfdffae27a5 James Smart 2021-06-01  75  	default:
202bfdffae27a5 James Smart 2021-06-01  76  		/* call default event handler =
common to all nodes */
202bfdffae27a5 James Smart 2021-06-01  77  		__efc_node_common(funcname, ct=
x, evt, arg);
202bfdffae27a5 James Smart 2021-06-01  78  	}
202bfdffae27a5 James Smart 2021-06-01  79  }
202bfdffae27a5 James Smart 2021-06-01  80  =


:::::: The code at line 51 was first introduced by commit
:::::: 202bfdffae27a50d6fae0a259cde1333d9833127 scsi: elx: libefc: FC node =
ELS and state handling

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1821510390489522701==--

