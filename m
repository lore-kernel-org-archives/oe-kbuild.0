Content-Type: multipart/mixed; boundary="===============6502072515410128302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/scsi/scsi_cmnd.h:183:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 23 May 2022 08:17:38 +0800
Message-ID: <202205230846.zEDEIEGN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6502072515410128302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   10 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001-20220516 (https://download.01.org/0day-ci/arch=
ive/20220523/202205230846.zEDEIEGN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/scsi/libsas/sas_expander.c:1794:8: note: Calling 'smp_execute_ta=
sk'
           res =3D smp_execute_task(dev, rg_req, RG_REQ_SIZE, rg_resp,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:148:2: note: Returning without writin=
g to 'resp->result'
           return smp_execute_task_sg(dev, &req_sg, &resp_sg);
           ^
   drivers/scsi/libsas/sas_expander.c:148:2: note: Returning value, which p=
articipates in a condition later
           return smp_execute_task_sg(dev, &req_sg, &resp_sg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1794:8: note: Returning from 'smp_exe=
cute_task'
           res =3D smp_execute_task(dev, rg_req, RG_REQ_SIZE, rg_resp,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1796:6: note: Assuming 'res' is 0
           if (res)
               ^~~
   drivers/scsi/libsas/sas_expander.c:1796:2: note: Taking false branch
           if (res)
           ^
   drivers/scsi/libsas/sas_expander.c:1798:22: note: The left operand of '!=
=3D' is a garbage value
           if (rg_resp->result !=3D SMP_RESP_FUNC_ACC) {
               ~~~~~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/autofs/root.c:562:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:562:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/scsi/3w-9xxx.c:718:3: warning: Value stored to 'timeout' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   timeout =3D wait_event_timeout(tw_dev->ioctl_wqueue, tw_=
dev->chrdev_request_id =3D=3D TW_IOCTL_CHRDEV_FREE, timeout);
                   ^
   drivers/scsi/3w-9xxx.c:718:3: note: Value stored to 'timeout' is never r=
ead
   drivers/scsi/3w-9xxx.c:1825:31: warning: Access to field 'cmnd' results =
in a dereference of a null pointer (loaded from variable 'srb') [clang-anal=
yzer-core.NullDereference]
                   memcpy(command_packet->cdb, srb->cmnd, TW_MAX_CDB_LEN);
                                               ^~~
   drivers/scsi/3w-9xxx.c:1806:2: note: 'srb' initialized to a null pointer=
 value
           struct scsi_cmnd *srb =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:6: note: Assuming the condition is false
           if (tw_dev->srb[request_id])
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:2: note: Taking false branch
           if (tw_dev->srb[request_id])
           ^
   drivers/scsi/3w-9xxx.c:1824:6: note: Assuming 'cdb' is null
           if (!cdb)
               ^~~~
   drivers/scsi/3w-9xxx.c:1824:2: note: Taking true branch
           if (!cdb)
           ^
   drivers/scsi/3w-9xxx.c:1825:31: note: Access to field 'cmnd' results in =
a dereference of a null pointer (loaded from variable 'srb')
                   memcpy(command_packet->cdb, srb->cmnd, TW_MAX_CDB_LEN);
                                               ^~~
>> include/scsi/scsi_cmnd.h:183:9: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           return cmd->sdb.table.nents;
                  ^
   drivers/scsi/3w-9xxx.c:1806:2: note: 'srb' initialized to a null pointer=
 value
           struct scsi_cmnd *srb =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:6: note: Assuming the condition is false
           if (tw_dev->srb[request_id])
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:2: note: Taking false branch
           if (tw_dev->srb[request_id])
           ^
   drivers/scsi/3w-9xxx.c:1824:6: note: Assuming 'cdb' is non-null
           if (!cdb)
               ^~~~
   drivers/scsi/3w-9xxx.c:1824:2: note: Taking false branch
           if (!cdb)
           ^
   drivers/scsi/3w-9xxx.c:1829:6: note: 'srb' is null
           if (srb) {
               ^~~
   drivers/scsi/3w-9xxx.c:1829:2: note: Taking false branch
           if (srb) {
           ^
   drivers/scsi/3w-9xxx.c:1841:6: note: Assuming 'sglistarg' is null
           if (!sglistarg) {
               ^~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1841:2: note: Taking true branch
           if (!sglistarg) {
           ^
   drivers/scsi/3w-9xxx.c:1844:21: note: Passing null pointer value via 1st=
 parameter 'cmd'
                   if (scsi_sg_count(srb)) {
                                     ^~~
   drivers/scsi/3w-9xxx.c:1844:7: note: Calling 'scsi_sg_count'
                   if (scsi_sg_count(srb)) {
                       ^~~~~~~~~~~~~~~~~~
   include/scsi/scsi_cmnd.h:183:9: note: Dereference of null pointer
           return cmd->sdb.table.nents;
                  ^~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/scsi/mvsas/mv_init.c:464:13: warning: Access to field 'dev' resu=
lts in a dereference of a null pointer (loaded from variable 'mvi') [clang-=
analyzer-core.NullDereference]
           sha->dev =3D mvi->dev;
                      ^
   drivers/scsi/mvsas/mv_init.c:505:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/scsi/mvsas/mv_init.c:505:2: note: Taking false branch
           if (rc)
           ^
   drivers/scsi/mvsas/mv_init.c:511:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/scsi/mvsas/mv_init.c:511:2: note: Taking false branch
           if (rc)
           ^
   drivers/scsi/mvsas/mv_init.c:515:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/scsi/mvsas/mv_init.c:515:2: note: Taking false branch
           if (rc)
           ^
   drivers/scsi/mvsas/mv_init.c:519:6: note: Assuming 'shost' is non-null
           if (!shost) {
               ^~~~~~
   drivers/scsi/mvsas/mv_init.c:519:2: note: Taking false branch
           if (!shost) {
           ^
   drivers/scsi/mvsas/mv_init.c:527:6: note: Assuming the condition is false
           if (!SHOST_TO_SAS_HA(shost)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mvsas/mv_init.c:527:2: note: Taking false branch
           if (!SHOST_TO_SAS_HA(shost)) {
           ^
   drivers/scsi/mvsas/mv_init.c:534:6: note: 'rc' is 0
           if (rc) {
               ^~
   drivers/scsi/mvsas/mv_init.c:534:2: note: Taking false branch
           if (rc) {
           ^
   drivers/scsi/mvsas/mv_init.c:544:8: note: 'mvi' is non-null
                   if (!mvi) {
                        ^~~
   drivers/scsi/mvsas/mv_init.c:544:3: note: Taking false branch
                   if (!mvi) {
                   ^
   drivers/scsi/mvsas/mv_init.c:556:7: note: Assuming 'rc' is 0
                   if (rc) {
                       ^~
   drivers/scsi/mvsas/mv_init.c:556:3: note: Taking false branch
                   if (rc) {
                   ^
   drivers/scsi/mvsas/mv_init.c:561:11: note: Assuming 'nhost' is >=3D fiel=
d 'n_host'
           } while (nhost < chip->n_host);
                    ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mvsas/mv_init.c:542:2: note: Loop condition is false.  Exit=
ing loop
           do {
--
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
   6 warnings generated.
   drivers/net/phy/mscc/mscc_ptp.c:1449:2: warning: Value stored to 'val' i=
s never read [clang-analyzer-deadcode.DeadStores]
           val =3D vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_VERS=
ION_CODE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/net/phy/mscc/mscc_ptp.c:1449:2: note: Value stored to 'val' is n=
ever read
           val =3D vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_VERS=
ION_CODE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
   drivers/net/arcnet/rfc1201.c:348:4: warning: Value stored to 'soft' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           soft =3D &pkt->soft.rfc1201;
                           ^      ~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/rfc1201.c:348:4: note: Value stored to 'soft' is neve=
r read
                           soft =3D &pkt->soft.rfc1201;
                           ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:3218:2: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ipw_fw_dma_enable(priv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:3218:2: note: Value stored =
to 'ret' is never read
           ret =3D ipw_fw_dma_enable(priv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/ipw2x00/ipw2200.c:8171:7: warning: Dereferenc=
e of null pointer (loaded from variable 'last_seq') [clang-analyzer-core.Nu=
llDereference]
           if ((*last_seq =3D=3D seq) &&
                ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8254:6: note: Assuming the =
condition is false
           r =3D ipw_read32(priv, IPW_RX_READ_INDEX);
               ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:401:2: note: expanded from =
macro 'ipw_read32'
           IPW_DEBUG_IO("%s %d: read_direct32(0x%08X)\n", __FILE__, __LINE_=
_, \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1474:31: note: expanded fro=
m macro 'IPW_DEBUG_IO'
   #define IPW_DEBUG_IO(f, a...) IPW_LL_DEBUG(IPW_DL_IO, f, ## a)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1389:10: note: expanded fro=
m macro 'IPW_LL_DEBUG'
   do { if (ipw_debug_level & (level)) \
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8254:6: note: Taking false =
branch
           r =3D ipw_read32(priv, IPW_RX_READ_INDEX);
               ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:401:2: note: expanded from =
macro 'ipw_read32'
           IPW_DEBUG_IO("%s %d: read_direct32(0x%08X)\n", __FILE__, __LINE_=
_, \
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1474:31: note: expanded fro=
m macro 'IPW_DEBUG_IO'
   #define IPW_DEBUG_IO(f, a...) IPW_LL_DEBUG(IPW_DL_IO, f, ## a)
                                 ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1389:6: note: expanded from=
 macro 'IPW_LL_DEBUG'
   do { if (ipw_debug_level & (level)) \
        ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8254:6: note: Loop conditio=
n is false.  Exiting loop
           r =3D ipw_read32(priv, IPW_RX_READ_INDEX);
               ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:401:2: note: expanded from =
macro 'ipw_read32'
           IPW_DEBUG_IO("%s %d: read_direct32(0x%08X)\n", __FILE__, __LINE_=
_, \
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1474:31: note: expanded fro=
m macro 'IPW_DEBUG_IO'
   #define IPW_DEBUG_IO(f, a...) IPW_LL_DEBUG(IPW_DL_IO, f, ## a)
                                 ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1388:43: note: expanded fro=
m macro 'IPW_LL_DEBUG'
   #define IPW_LL_DEBUG(level, fmt, args...) \
                                             ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8255:2: note: Taking false =
branch
           ipw_read32(priv, IPW_RX_WRITE_INDEX);
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:401:2: note: expanded from =
macro 'ipw_read32'
           IPW_DEBUG_IO("%s %d: read_direct32(0x%08X)\n", __FILE__, __LINE_=
_, \
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1474:31: note: expanded fro=
m macro 'IPW_DEBUG_IO'
   #define IPW_DEBUG_IO(f, a...) IPW_LL_DEBUG(IPW_DL_IO, f, ## a)
                                 ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1389:6: note: expanded from=
 macro 'IPW_LL_DEBUG'
   do { if (ipw_debug_level & (level)) \
        ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8255:2: note: Loop conditio=
n is false.  Exiting loop
           ipw_read32(priv, IPW_RX_WRITE_INDEX);
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:401:2: note: expanded from =
macro 'ipw_read32'
           IPW_DEBUG_IO("%s %d: read_direct32(0x%08X)\n", __FILE__, __LINE_=
_, \
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1474:31: note: expanded fro=
m macro 'IPW_DEBUG_IO'
   #define IPW_DEBUG_IO(f, a...) IPW_LL_DEBUG(IPW_DL_IO, f, ## a)
                                 ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1388:43: note: expanded fro=
m macro 'IPW_LL_DEBUG'
   #define IPW_LL_DEBUG(level, fmt, args...) \
                                             ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8258:6: note: Assuming the =
condition is false
           if (ipw_rx_queue_space (priv->rxq) > (RX_QUEUE_SIZE / 2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8258:2: note: Taking false =
branch
           if (ipw_rx_queue_space (priv->rxq) > (RX_QUEUE_SIZE / 2))
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8261:9: note: Assuming 'i' =
is not equal to 'r'
           while (i !=3D r) {
                  ^~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8261:2: note: Loop conditio=
n is true.  Entering loop body
           while (i !=3D r) {
           ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8263:16: note: Assuming 'rx=
b' is not equal to null
                   if (unlikely(rxb =3D=3D NULL)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8263:3: note: Taking false =
branch
                   if (unlikely(rxb =3D=3D NULL)) {
                   ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8273:3: note: Assuming the =
condition is false
                   IPW_DEBUG_RX("Packet: type=3D%02X seq=3D%02X bits=3D%02X=
\n",
                   ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1463:35: note: expanded fro=
m macro 'IPW_DEBUG_RX'
   #define IPW_DEBUG_RX(f, a...)     IPW_LL_DEBUG(IPW_DL_RX, f, ## a)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1389:10: note: expanded fro=
m macro 'IPW_LL_DEBUG'
   do { if (ipw_debug_level & (level)) \
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/ipw2x00/ipw2200.c:8273:3: note: Taking false =
branch
                   IPW_DEBUG_RX("Packet: type=3D%02X seq=3D%02X bits=3D%02X=
\n",
                   ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1463:35: note: expanded fro=
m macro 'IPW_DEBUG_RX'
   #define IPW_DEBUG_RX(f, a...)     IPW_LL_DEBUG(IPW_DL_RX, f, ## a)
                                     ^
   drivers/net/wireless/intel/ipw2x00/ipw2200.h:1389:6: note: expanded from=
 macro 'IPW_LL_DEBUG'
   do { if (ipw_debug_level & (level)) \

vim +183 include/scsi/scsi_cmnd.h

824d7b570b4dec FUJITA Tomonori 2007-05-26  180  =

30b0c37b27485a Boaz Harrosh    2007-12-13  181  static inline unsigned scsi=
_sg_count(struct scsi_cmnd *cmd)
30b0c37b27485a Boaz Harrosh    2007-12-13  182  {
30b0c37b27485a Boaz Harrosh    2007-12-13 @183  	return cmd->sdb.table.nent=
s;
30b0c37b27485a Boaz Harrosh    2007-12-13  184  }
30b0c37b27485a Boaz Harrosh    2007-12-13  185  =


:::::: The code at line 183 was first introduced by commit
:::::: 30b0c37b27485a9cb897bfe3824f6f517b8c80d6 [SCSI] implement scsi_data_=
buffer

:::::: TO: Boaz Harrosh <bharrosh@panasas.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6502072515410128302==--

