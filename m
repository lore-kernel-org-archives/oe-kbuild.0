Content-Type: multipart/mixed; boundary="===============8397461412185649294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/elx/efct/efct_hw.c:1518:3: warning: Value stored to 'ctx' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 10:36:46 +0800
Message-ID: <202201031035.AWdwjTWB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8397461412185649294==
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
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: ebc076b3eddc807729bd81f7bc48e798a3ddc477 scsi: elx: efct: Tie into =
kernel Kconfig and build process
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20220101 (https://download.01.org/0day-ci/ar=
chive/20220103/202201031035.AWdwjTWB-lkp(a)intel.com/config)
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
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/net/ethernet/qlogic/qed/qed_ooo.c:254:14: note: Loop condition i=
s false.  Exiting loop
                   p_buffer =3D list_first_entry(&p_ooo_info->free_buffers_=
list,
                              ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/ethernet/qlogic/qed/qed_ooo.c:257:8: note: 'p_buffer' is non=
-null
                   if (!p_buffer)
                        ^~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_ooo.c:257:3: note: Taking false bran=
ch
                   if (!p_buffer)
                   ^
   drivers/net/ethernet/qlogic/qed/qed_ooo.c:260:3: note: Calling 'list_del'
                   list_del(&p_buffer->list_entry);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/net/phy/micrel.c:492:28: warning: Value stored to 'of_node' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:492:28: note: Value stored to 'of_node' during =
its initialization is never read
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:715:28: warning: Value stored to 'of_node' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:715:28: note: Value stored to 'of_node' during =
its initialization is never read
           const struct device_node *of_node =3D dev->of_node;
                                     ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:911:22: warning: Value stored to 'of_node' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *of_node =3D dev->of_node;
                               ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:911:22: note: Value stored to 'of_node' during =
its initialization is never read
           struct device_node *of_node =3D dev->of_node;
                               ^~~~~~~   ~~~~~~~~~~~~
   drivers/net/phy/micrel.c:975:2: warning: Value stored to 'regval' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:975:2: note: Value stored to 'regval' is never =
read
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/net/phy/microchip.c:40:3: warning: Value stored to 'rc' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   rc =3D phy_write(phydev, LAN88XX_INT_MASK, 0x7FFF);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:40:3: note: Value stored to 'rc' is never re=
ad
                   rc =3D phy_write(phydev, LAN88XX_INT_MASK, 0x7FFF);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:41:3: warning: Value stored to 'rc' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   rc =3D phy_read(phydev, LAN88XX_INT_STS);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:41:3: note: Value stored to 'rc' is never re=
ad
                   rc =3D phy_read(phydev, LAN88XX_INT_STS);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
           struct se_portal_group *se_tpg =3D nacl->se_tpg;
                                   ^~~~~~   ~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1279:39: warning: Value stored to 'tfo' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct target_core_fabric_ops *tfo =3D
                                                ^~~
   drivers/target/target_core_pr.c:1279:39: note: Value stored to 'tfo' dur=
ing its initialization is never read
           const struct target_core_fabric_ops *tfo =3D
                                                ^~~
   drivers/target/target_core_pr.c:1796:3: warning: Value stored to 'dest_s=
e_deve' is never read [clang-analyzer-deadcode.DeadStores]
                   dest_se_deve =3D tidh->dest_se_deve;
                   ^              ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1796:3: note: Value stored to 'dest_se_d=
eve' is never read
                   dest_se_deve =3D tidh->dest_se_deve;
                   ^              ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1954:3: warning: Value stored to 'len' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   len +=3D sprintf(buf+len, "No Registrations or Reservati=
ons");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:1954:3: note: Value stored to 'len' is n=
ever read
                   len +=3D sprintf(buf+len, "No Registrations or Reservati=
ons");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:2450:39: warning: Value stored to 'tfo' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct target_core_fabric_ops *tfo =3D se_nacl->se_tpg->se=
_tpg_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/target/target_core_pr.c:2450:39: note: Value stored to 'tfo' dur=
ing its initialization is never read
           const struct target_core_fabric_ops *tfo =3D se_nacl->se_tpg->se=
_tpg_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/target/target_core_pr.c:2760:39: warning: Value stored to 'tfo' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct target_core_fabric_ops *tfo =3D nacl->se_tpg->se_tp=
g_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:2760:39: note: Value stored to 'tfo' dur=
ing its initialization is never read
           const struct target_core_fabric_ops *tfo =3D nacl->se_tpg->se_tp=
g_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:3163:2: warning: Value stored to 'tf_ops=
' is never read [clang-analyzer-deadcode.DeadStores]
           tf_ops =3D se_tpg->se_tpg_tfo;
           ^        ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:3163:2: note: Value stored to 'tf_ops' i=
s never read
           tf_ops =3D se_tpg->se_tpg_tfo;
           ^        ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:3924:3: warning: Value stored to 'add_de=
sc_len' is never read [clang-analyzer-deadcode.DeadStores]
                   add_desc_len =3D 0;
                   ^              ~
   drivers/target/target_core_pr.c:3924:3: note: Value stored to 'add_desc_=
len' is never read
                   add_desc_len =3D 0;
                   ^              ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   drivers/i2c/algos/i2c-algo-pca.c:195:10: warning: Although the value sto=
red to 'state' is used in the enclosing expression, the value is never actu=
ally read from 'state' [clang-analyzer-deadcode.DeadStores]
           while ((state =3D pca_status(adap)) !=3D 0xf8) {
                   ^
   drivers/i2c/algos/i2c-algo-pca.c:195:10: note: Although the value stored=
 to 'state' is used in the enclosing expression, the value is never actuall=
y read from 'state'
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
   4 warnings generated.
   drivers/i2c/busses/i2c-amd756.c:108:7: warning: Although the value store=
d to 'temp' is used in the enclosing expression, the value is never actuall=
y read from 'temp' [clang-analyzer-deadcode.DeadStores]
           if ((temp =3D inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_S=
TS)) {
                ^
   drivers/i2c/busses/i2c-amd756.c:108:7: note: Although the value stored t=
o 'temp' is used in the enclosing expression, the value is never actually r=
ead from 'temp'
   Suppressed 3 warnings (3 in non-user code).
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
   9 warnings generated.
   drivers/scsi/bnx2fc/bnx2fc_fcoe.c:541:2: warning: Value stored to 'fh' i=
s never read [clang-analyzer-deadcode.DeadStores]
           fh =3D (struct fc_frame_header *) skb_transport_header(skb);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/bnx2fc/bnx2fc_fcoe.c:541:2: note: Value stored to 'fh' is n=
ever read
           fh =3D (struct fc_frame_header *) skb_transport_header(skb);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:692:3: warning: Value stored to 'num_rq=
' is never read [clang-analyzer-deadcode.DeadStores]
                   num_rq =3D 1;
                   ^        ~
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:692:3: note: Value stored to 'num_rq' i=
s never read
                   num_rq =3D 1;
                   ^        ~
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:804:3: warning: Value stored to 'num_rq=
' is never read [clang-analyzer-deadcode.DeadStores]
                   num_rq =3D 1;
                   ^        ~
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:804:3: note: Value stored to 'num_rq' i=
s never read
                   num_rq =3D 1;
                   ^        ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/i2c/lm3560.c:123:3: warning: Value stored to 'rval' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   rval =3D lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lm3560.c:123:3: note: Value stored to 'rval' is never =
read
                   rval =3D lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lm3560.c:146:3: warning: Value stored to 'rval' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   rval =3D lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lm3560.c:146:3: note: Value stored to 'rval' is never =
read
                   rval =3D lm3560_enable_ctrl(flash, led_no, true);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/i2c/ccs-pll.c:93:15: warning: Value stored to 's' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
                   const char *s =3D pll_string(br->which);
                               ^   ~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:93:15: note: Value stored to 's' during its =
initialization is never read
                   const char *s =3D pll_string(br->which);
                               ^   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/tuners/tua9001.c:148:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/tua9001.c:148:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/media/tuners/si2157.c:558:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "palGH";
                           ^     ~~~~~~~
   drivers/media/tuners/si2157.c:558:4: note: Value stored to 'std' is neve=
r read
                           std =3D "palGH";
                           ^     ~~~~~~~
   drivers/media/tuners/si2157.c:564:5: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   std =3D "secamGH";
                                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:564:5: note: Value stored to 'std' is neve=
r read
                                   std =3D "secamGH";
                                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:568:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "palB";
                           ^     ~~~~~~
   drivers/media/tuners/si2157.c:568:4: note: Value stored to 'std' is neve=
r read
                           std =3D "palB";
                           ^     ~~~~~~
   drivers/media/tuners/si2157.c:573:5: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   std =3D "secamB";
                                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:573:5: note: Value stored to 'std' is neve=
r read
                                   std =3D "secamB";
                                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:578:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "MN";
                   ^     ~~~~
   drivers/media/tuners/si2157.c:578:3: note: Value stored to 'std' is neve=
r read
                   std =3D "MN";
--
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
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/w83793.c:1301:2: note: Loop condition is false. Execution =
continues on line 1309
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hwmon/w83793.c:1315:6: note: Assuming 'watchdog_is_open' is 0
           if (!watchdog_is_open)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1315:2: note: Taking true branch
           if (!watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1321:6: note: 'watchdog_is_open' is 0
           if (watchdog_is_open)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1321:2: note: Taking false branch
           if (watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1325:18: note: Passing null pointer value via 1st=
 parameter 'data'
           watchdog_enable(data);
                           ^~~~
   drivers/hwmon/w83793.c:1325:2: note: Calling 'watchdog_enable'
           watchdog_enable(data);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1253:7: note: Access to field 'client' results in=
 a dereference of a null pointer (loaded from variable 'data')
           if (!data->client) {
                ^~~~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
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
   3 warnings generated.
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   13 warnings generated.
   drivers/scsi/isci/request.c:1377:3: warning: Value stored to 'sgl' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   sgl =3D pio_sgl_next(stp_req);
                   ^     ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:1377:3: note: Value stored to 'sgl' is never=
 read
                   sgl =3D pio_sgl_next(stp_req);
                   ^     ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3377:3: warning: Value stored to 'status' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   status =3D isci_smp_request_build(request);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3377:3: note: Value stored to 'status' is ne=
ver read
                   status =3D isci_smp_request_build(request);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3380:3: warning: Value stored to 'status' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   status =3D isci_request_ssp_request_construct(request);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3380:3: note: Value stored to 'status' is ne=
ver read
                   status =3D isci_request_ssp_request_construct(request);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3385:3: warning: Value stored to 'status' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   status =3D isci_request_stp_request_construct(request);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3385:3: note: Value stored to 'status' is ne=
ver read
                   status =3D isci_request_stp_request_construct(request);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/isci/request.c:3519:3: warning: Value stored to 'status' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   status =3D SCI_SUCCESS;
                   ^        ~~~~~~~~~~~
   drivers/scsi/isci/request.c:3519:3: note: Value stored to 'status' is ne=
ver read
                   status =3D SCI_SUCCESS;
                   ^        ~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/tuners/fc0011.c:252:3: warning: Value stored to 'bandwidth=
' is never read [clang-analyzer-deadcode.DeadStores]
                   bandwidth =3D 6000;
                   ^           ~~~~
   drivers/media/tuners/fc0011.c:252:3: note: Value stored to 'bandwidth' i=
s never read
                   bandwidth =3D 6000;
                   ^           ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/tuners/it913x.c:151:26: warning: Value stored to 'pdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:151:26: note: Value stored to 'pdev' durin=
g its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:210:26: warning: Value stored to 'pdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:210:26: note: Value stored to 'pdev' durin=
g its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/tuners/r820t.c:1856:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D r820t_section(priv, compare_iq);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/r820t.c:1856:2: note: Value stored to 'rc' is never=
 read
           rc =3D r820t_section(priv, compare_iq);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ctx +1518 drivers/scsi/elx/efct/efct_hw.c

580c0255e4effe James Smart 2021-06-01  1500  =

580c0255e4effe James Smart 2021-06-01  1501  static int
580c0255e4effe James Smart 2021-06-01  1502  efct_hw_command_cancel(struct =
efct_hw *hw)
580c0255e4effe James Smart 2021-06-01  1503  {
580c0255e4effe James Smart 2021-06-01  1504  	unsigned long flags =3D 0;
580c0255e4effe James Smart 2021-06-01  1505  	int rc =3D 0;
580c0255e4effe James Smart 2021-06-01  1506  =

580c0255e4effe James Smart 2021-06-01  1507  	spin_lock_irqsave(&hw->cmd_lo=
ck, flags);
580c0255e4effe James Smart 2021-06-01  1508  =

580c0255e4effe James Smart 2021-06-01  1509  	/*
580c0255e4effe James Smart 2021-06-01  1510  	 * Manually clean up remainin=
g commands. Note: since this calls
580c0255e4effe James Smart 2021-06-01  1511  	 * efct_hw_command_process(),=
 we'll also process the cmd_pending
580c0255e4effe James Smart 2021-06-01  1512  	 * list, so no need to manual=
ly clean that out.
580c0255e4effe James Smart 2021-06-01  1513  	 */
580c0255e4effe James Smart 2021-06-01  1514  	while (!list_empty(&hw->cmd_h=
ead)) {
580c0255e4effe James Smart 2021-06-01  1515  		u8		mqe[SLI4_BMBX_SIZE] =3D =
{ 0 };
580c0255e4effe James Smart 2021-06-01  1516  		struct efct_command_ctx *ctx;
580c0255e4effe James Smart 2021-06-01  1517  =

580c0255e4effe James Smart 2021-06-01 @1518  		ctx =3D list_first_entry(&hw=
->cmd_head,
580c0255e4effe James Smart 2021-06-01  1519  				       struct efct_command=
_ctx, list_entry);
580c0255e4effe James Smart 2021-06-01  1520  =

580c0255e4effe James Smart 2021-06-01  1521  		efc_log_debug(hw->os, "hung =
command %08x\n",
580c0255e4effe James Smart 2021-06-01  1522  			      !ctx ? U32_MAX :
580c0255e4effe James Smart 2021-06-01  1523  			      (!ctx->buf ? U32_MAX =
: *((u32 *)ctx->buf)));
580c0255e4effe James Smart 2021-06-01  1524  		spin_unlock_irqrestore(&hw->=
cmd_lock, flags);
580c0255e4effe James Smart 2021-06-01  1525  		rc =3D efct_hw_command_proce=
ss(hw, -1, mqe, SLI4_BMBX_SIZE);
580c0255e4effe James Smart 2021-06-01  1526  		spin_lock_irqsave(&hw->cmd_l=
ock, flags);
580c0255e4effe James Smart 2021-06-01  1527  	}
580c0255e4effe James Smart 2021-06-01  1528  =

580c0255e4effe James Smart 2021-06-01  1529  	spin_unlock_irqrestore(&hw->c=
md_lock, flags);
580c0255e4effe James Smart 2021-06-01  1530  =

580c0255e4effe James Smart 2021-06-01  1531  	return rc;
580c0255e4effe James Smart 2021-06-01  1532  }
580c0255e4effe James Smart 2021-06-01  1533  =


:::::: The code at line 1518 was first introduced by commit
:::::: 580c0255e4effe49b9974044e78a03e76d977618 scsi: elx: efct: RQ buffer,=
 memory pool allocation and deallocation APIs

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8397461412185649294==--

