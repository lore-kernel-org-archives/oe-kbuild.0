Content-Type: multipart/mixed; boundary="===============5290998426693563797=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qla2xxx/qla_attr.c:2703:13: warning: Value stored to 'fcport' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 05 May 2022 07:50:42 +0800
Message-ID: <202205050704.wwPseiQQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5290998426693563797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Daniel Wagner <dwagner@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a7391ad3572431a354c927cf8896e86e50d7d0bf
commit: baea0e833f7612483dcb2351240da19f0d0bc011 scsi: qla2xxx: Synchronize=
 rport dev_loss_tmo setting
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20220502 (https://download.01.org/0day-ci/ar=
chive/20220505/202205050704.wwPseiQQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbaea0e833f7612483dcb2351240da19f0d0bc011
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout baea0e833f7612483dcb2351240da19f0d0bc011
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/netdevice.h:5324:2: note: expanded from macro 'netdev_dbg'
           dynamic_netdev_dbg(__dev, format, ##args);              \
           ^
   include/linux/dynamic_debug.h:170:2: note: expanded from macro 'dynamic_=
netdev_dbg'
           _dynamic_func_call(fmt, __dynamic_netdev_dbg,           \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   net/can/j1939/transport.c:272:2: note: Loop condition is false.  Exiting=
 loop
           netdev_dbg(session->priv->ndev, "%s: 0x%p\n", __func__, session);
           ^
   include/linux/netdevice.h:5324:2: note: expanded from macro 'netdev_dbg'
           dynamic_netdev_dbg(__dev, format, ##args);              \
           ^
   include/linux/dynamic_debug.h:170:2: note: expanded from macro 'dynamic_=
netdev_dbg'
           _dynamic_func_call(fmt, __dynamic_netdev_dbg,           \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   net/can/j1939/transport.c:272:2: note: Loop condition is false.  Exiting=
 loop
           netdev_dbg(session->priv->ndev, "%s: 0x%p\n", __func__, session);
           ^
   include/linux/netdevice.h:5322:46: note: expanded from macro 'netdev_dbg'
   #define netdev_dbg(__dev, format, args...)                      \
                                                                   ^
   net/can/j1939/transport.c:274:2: note: Assuming '__ret_warn_on' is 0
           WARN_ON_ONCE(!list_empty(&session->sk_session_queue_entry));
           ^
   include/asm-generic/bug.h:105:6: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/transport.c:274:2: note: Taking false branch
           WARN_ON_ONCE(!list_empty(&session->sk_session_queue_entry));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   net/can/j1939/transport.c:275:2: note: Assuming '__ret_warn_on' is 0
           WARN_ON_ONCE(!list_empty(&session->active_session_list_entry));
           ^
   include/asm-generic/bug.h:105:6: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/transport.c:275:2: note: Taking false branch
           WARN_ON_ONCE(!list_empty(&session->active_session_list_entry));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   net/can/j1939/transport.c:280:2: note: Memory is released
           kfree(session);
           ^~~~~~~~~~~~~~
   net/can/j1939/transport.c:288:2: note: Returning; memory was released
           j1939_session_destroy(session);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   net/can/j1939/transport.c:293:2: note: Returning; memory was released
           kref_put(&session->kref, __j1939_session_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/transport.c:2180:5: note: Returning; memory was released
                                   j1939_session_put(session);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/transport.c:2182:17: note: Use of memory after it is freed
                           session->err =3D ESHUTDOWN;
                           ~~~~~~~~~~~~ ^
   6 warnings generated.
   drivers/scsi/qla2xxx/qla_attr.c:1105:17: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                   return strlen(strcat(buf, "\n"));
                                 ^~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:1105:17: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                   return strlen(strcat(buf, "\n"));
                                 ^~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:1675:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D qla2x00_get_firmware_state(vha, state);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:1675:3: note: Value stored to 'rval' is =
never read
                   rval =3D qla2x00_get_firmware_state(vha, state);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:2039:4: warning: Value stored to 'action=
' is never read [clang-analyzer-deadcode.DeadStores]
                           action =3D MODE_CHANGE_ACCEPT;
                           ^        ~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:2039:4: note: Value stored to 'action' i=
s never read
                           action =3D MODE_CHANGE_ACCEPT;
                           ^        ~~~~~~~~~~~~~~~~~~
>> drivers/scsi/qla2xxx/qla_attr.c:2703:13: warning: Value stored to 'fcpor=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           fc_port_t *fcport =3D *(fc_port_t **)rport->dd_data;
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:2703:13: note: Value stored to 'fcport' =
during its initialization is never read
           fc_port_t *fcport =3D *(fc_port_t **)rport->dd_data;
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/scsi/qla2xxx/qla_dfs.c:215:3: warning: Value stored to 'rc' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   rc =3D qla24xx_gpdb_wait(vha, &fc_port, 0);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_dfs.c:215:3: note: Value stored to 'rc' is neve=
r read
                   rc =3D qla24xx_gpdb_wait(vha, &fc_port, 0);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/scsi/qla2xxx/qla_nx.c:1473:19: warning: The left operand of '>>'=
 is a garbage value due to array index out of bounds [clang-analyzer-core.U=
ndefinedBinaryOperatorResult]
                   start =3D off0[i] >> 2;
                           ~~~~~~~ ^
   drivers/scsi/qla2xxx/qla_nx.c:1433:6: note: Assuming 'off' is >=3D QLA82=
XX_ADDR_QDR_NET
           if (off >=3D QLA82XX_ADDR_QDR_NET && off <=3D QLA82XX_P3_ADDR_QD=
R_NET_MAX)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1433:6: note: Left side of '&&' is true
   drivers/scsi/qla2xxx/qla_nx.c:1433:37: note: Assuming 'off' is <=3D QLA8=
2XX_P3_ADDR_QDR_NET_MAX
           if (off >=3D QLA82XX_ADDR_QDR_NET && off <=3D QLA82XX_P3_ADDR_QD=
R_NET_MAX)
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1433:2: note: Taking true branch
           if (off >=3D QLA82XX_ADDR_QDR_NET && off <=3D QLA82XX_P3_ADDR_QD=
R_NET_MAX)
           ^
   drivers/scsi/qla2xxx/qla_nx.c:1444:11: note: Assuming the condition is t=
rue
           sz[0] =3D (size < (16 - off0[0])) ? size : (16 - off0[0]);
                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1444:10: note: '?' condition is true
           sz[0] =3D (size < (16 - off0[0])) ? size : (16 - off0[0]);
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1450:14: note: Assuming 'i' is < 'loop'
           for (i =3D 0; i < loop; i++) {
                       ^~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1450:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < loop; i++) {
           ^
   drivers/scsi/qla2xxx/qla_nx.c:1460:3: note: Loop condition is true.  Ent=
ering loop body
                   for (j =3D 0; j < MAX_CTL_CHECK; j++) {
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1462:8: note: Assuming the condition is tr=
ue
                           if ((temp & MIU_TA_CTL_BUSY) =3D=3D 0)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1462:4: note: Taking true branch
                           if ((temp & MIU_TA_CTL_BUSY) =3D=3D 0)
                           ^
   drivers/scsi/qla2xxx/qla_nx.c:1463:5: note:  Execution continues on line=
 1466
                                   break;
                                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1466:7: note: 'j' is < MAX_CTL_CHECK
                   if (j >=3D MAX_CTL_CHECK) {
                       ^
   drivers/scsi/qla2xxx/qla_nx.c:1466:3: note: Taking false branch
                   if (j >=3D MAX_CTL_CHECK) {
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1475:19: note: Assuming 'k' is > 'end'
                   for (k =3D start; k <=3D end; k++) {
                                   ^~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1475:3: note: Loop condition is false. Exe=
cution continues on line 1450
                   for (k =3D start; k <=3D end; k++) {
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1450:14: note: Assuming 'i' is < 'loop'
           for (i =3D 0; i < loop; i++) {
                       ^~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1450:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < loop; i++) {
           ^
   drivers/scsi/qla2xxx/qla_nx.c:1460:3: note: Loop condition is true.  Ent=
ering loop body
                   for (j =3D 0; j < MAX_CTL_CHECK; j++) {
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1462:8: note: Assuming the condition is tr=
ue
                           if ((temp & MIU_TA_CTL_BUSY) =3D=3D 0)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_nx.c:1462:4: note: Taking true branch
                           if ((temp & MIU_TA_CTL_BUSY) =3D=3D 0)
                           ^
   drivers/scsi/qla2xxx/qla_nx.c:1463:5: note:  Execution continues on line=
 1466
                                   break;
                                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1466:7: note: 'j' is < MAX_CTL_CHECK
                   if (j >=3D MAX_CTL_CHECK) {
                       ^
   drivers/scsi/qla2xxx/qla_nx.c:1466:3: note: Taking false branch
                   if (j >=3D MAX_CTL_CHECK) {
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1475:3: note: Loop condition is false. Exe=
cution continues on line 1450
                   for (k =3D start; k <=3D end; k++) {
                   ^
   drivers/scsi/qla2xxx/qla_nx.c:1450:24: note: The value 2 is assigned to =
'i'

vim +/fcport +2703 drivers/scsi/qla2xxx/qla_attr.c

8482e118afa0cb Andrew Vasquez  2005-04-17  2699  =

2a3192a3f3bc4f Joe Carnuccio   2019-03-12  2700  static inline void
8482e118afa0cb Andrew Vasquez  2005-04-17  2701  qla2x00_set_rport_loss_tmo=
(struct fc_rport *rport, uint32_t timeout)
8482e118afa0cb Andrew Vasquez  2005-04-17  2702  {
baea0e833f7612 Hannes Reinecke 2021-12-14 @2703  	fc_port_t *fcport =3D *(f=
c_port_t **)rport->dd_data;
baea0e833f7612 Hannes Reinecke 2021-12-14  2704  =

2a3192a3f3bc4f Joe Carnuccio   2019-03-12  2705  	rport->dev_loss_tmo =3D t=
imeout ? timeout : 1;
baea0e833f7612 Hannes Reinecke 2021-12-14  2706  =

baea0e833f7612 Hannes Reinecke 2021-12-14  2707  	if (IS_ENABLED(CONFIG_NVM=
E_FC) && fcport && fcport->nvme_remote_port)
baea0e833f7612 Hannes Reinecke 2021-12-14  2708  		nvme_fc_set_remoteport_d=
evloss(fcport->nvme_remote_port,
baea0e833f7612 Hannes Reinecke 2021-12-14  2709  					       rport->dev_los=
s_tmo);
8482e118afa0cb Andrew Vasquez  2005-04-17  2710  }
8482e118afa0cb Andrew Vasquez  2005-04-17  2711  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5290998426693563797==--

