Content-Type: multipart/mixed; boundary="===============2837385062294260398=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 25 Feb 2022 04:31:35 +0800
Message-ID: <202202250437.hVRKF7HN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2837385062294260398==
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
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   7 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220225/202202250437.hVRKF7HN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/ssb/main.c:828:2: note: 'Default' branch taken. Execution contin=
ues on line 842
           switch (v) {
           ^
   drivers/ssb/main.c:842:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:898:8: note: Returning from 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:898:3: note: The value 0 is assigned to 'm1'
                   m1 =3D clkfactor_f6_resolve(m1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:899:8: note: 'plltype' is equal to SSB_PLLTYPE_1
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                        ^~~~~~~
   drivers/ssb/main.c:899:34: note: Left side of '||' is true
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                                                  ^
   drivers/ssb/main.c:904:8: note: Calling 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:828:2: note: 'Default' branch taken. Execution contin=
ues on line 842
           switch (v) {
           ^
   drivers/ssb/main.c:842:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:904:8: note: Returning from 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:904:3: note: The value 0 is assigned to 'm3'
                   m3 =3D clkfactor_f6_resolve(m3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:906:3: note: Control jumps to 'case 17:'  at line 915
                   switch (mc) {
                   ^
   drivers/ssb/main.c:916:18: note: Division by zero
                           return (clock / (m1 * m3));
                                   ~~~~~~^~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/scsi/sym53c8xx_2/sym_hipd.c:383:2: warning: Value stored to 'f1'=
 is never read [clang-analyzer-deadcode.DeadStores]
           f1 =3D 40000;
           ^    ~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.c:383:2: note: Value stored to 'f1' is=
 never read
           f1 =3D 40000;
           ^    ~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.c:5411:2: warning: Value stored to 'i'=
 is never read [clang-analyzer-deadcode.DeadStores]
           i =3D sym_dequeue_from_squeue(np, i, cp->target, sdev->lun, -1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.c:5411:2: note: Value stored to 'i' is=
 never read
           i =3D sym_dequeue_from_squeue(np, i, cp->target, sdev->lun, -1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_t2.c:14:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:14:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:160:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:160:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:279:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:279:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:387:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:387:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: warning: Value stored to=
 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: note: Value stored to 's=
tatus' is never read
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: warning: Value stored to=
 'operation_mode' is never read [clang-analyzer-deadcode.DeadStores]
                   operation_mode |=3D OFDM_SC_RA_RAM_OP_AUTO_RATE__M;
                   ^
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: note: Value stored to 'o=
peration_mode' is never read
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: warning: Value stored to=
 'fec_rs_prescale' is never read [clang-analyzer-deadcode.DeadStores]
           fec_rs_prescale =3D 1;
           ^                 ~
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: note: Value stored to 'f=
ec_rs_prescale' is never read
           fec_rs_prescale =3D 1;
           ^                 ~
>> drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value=
 is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           *ucblocks =3D (u32) err;
                     ^ ~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6676:2: note: 'err' declared wit=
hout an initial value
           u16 err;
           ^~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Assuming 'debug' i=
s < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Taking false branch
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Loop condition is =
false.  Exiting loop
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:6: note: Assuming field 'm_=
drxk_state' is not equal to DRXK_NO_DEV
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6680:2: note: Taking false branch
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:6682:6: note: Assuming field 'm_=
drxk_state' is not equal to DRXK_UNINITIALIZED
           if (state->m_drxk_state =3D=3D DRXK_UNINITIALIZED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6682:2: note: Taking false branch
           if (state->m_drxk_state =3D=3D DRXK_UNINITIALIZED)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:6685:2: note: Calling 'dvbtqam_g=
et_acc_pkt_err'
           dvbtqam_get_acc_pkt_err(state, &err);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3184:2: note: 'debug' is < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3184:2: note: Taking false branch
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   drivers/media/dvb-frontends/drxk_hard.c:3184:2: note: Loop condition is =
false.  Exiting loop
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:3185:6: note: 'packet_err' is no=
t equal to NULL
           if (packet_err =3D=3D NULL)
               ^~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3185:2: note: Taking false branch
           if (packet_err =3D=3D NULL)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:3188:12: note: Calling 'read16'
                   status =3D read16(state, SCU_RAM_FEC_ACCUM_PKT_FAILURES_=
_A,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:314:9: note: Calling 'read16_fla=
gs'
           return read16_flags(state, reg, data, 0);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:288:6: note: Assuming field 'sin=
gle_master' is false
           if (state->single_master)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:288:2: note: Taking false branch
           if (state->single_master)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:291:35: note: Left side of '||' =
is true
           if (DRXDAP_FASI_LONG_FORMAT(reg) || (flags !=3D 0)) {
                                            ^
   drivers/media/dvb-frontends/drxk_hard.c:302:2: note: 'debug' is < 2
           dprintk(2, "(0x%08x, 0x%02x)\n", reg, flags);
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~
   drivers/media/dvb-frontends/drxk_hard.c:302:2: note: Taking false branch
           dprintk(2, "(0x%08x, 0x%02x)\n", reg, flags);
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   drivers/media/dvb-frontends/drxk_hard.c:302:2: note: Loop condition is f=
alse.  Exiting loop
           dprintk(2, "(0x%08x, 0x%02x)\n", reg, flags);
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:304:6: note: Assuming 'status' i=
s < 0
           if (status < 0)
               ^~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:304:2: note: Taking true branch
           if (status < 0)
--
   drivers/media/cec/core/cec-adap.c:904:6: note: Assuming field 'transmitt=
ing' is non-null
           if (!adap->transmitting)
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:904:2: note: Taking false branch
           if (!adap->transmitting)
           ^
   drivers/media/cec/core/cec-adap.c:908:6: note: Assuming 'block' is true
           if (!block)
               ^~~~~~
   drivers/media/cec/core/cec-adap.c:908:2: note: Taking false branch
           if (!block)
           ^
   drivers/media/cec/core/cec-adap.c:916:6: note: Assuming field 'completed=
' is false
           if (!data->completed)
               ^~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:916:2: note: Taking true branch
           if (!data->completed)
           ^
   drivers/media/cec/core/cec-adap.c:921:6: note: Assuming field 'completed=
' is false
           if (!data->completed)
               ^~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:921:2: note: Taking true branch
           if (!data->completed)
           ^
   drivers/media/cec/core/cec-adap.c:922:3: note: Calling 'cec_data_cancel'
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:378:6: note: Assuming 'data' is equal =
to field 'transmitting'
           if (data->adap->transmitting =3D=3D data) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:378:2: note: Taking true branch
           if (data->adap->transmitting =3D=3D data) {
           ^
   drivers/media/cec/core/cec-adap.c:387:6: note: Assuming the condition is=
 true
           if (data->msg.tx_status & CEC_TX_STATUS_OK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:387:2: note: Taking true branch
           if (data->msg.tx_status & CEC_TX_STATUS_OK) {
           ^
   drivers/media/cec/core/cec-adap.c:401:2: note: Calling 'cec_data_complet=
ed'
           cec_data_completed(data);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:344:6: note: Assuming field 'fh' is nu=
ll
           if (data->fh)
               ^~~~~~~~
   drivers/media/cec/core/cec-adap.c:344:2: note: Taking false branch
           if (data->fh)
           ^
   drivers/media/cec/core/cec-adap.c:347:6: note: Assuming field 'blocking'=
 is false
           if (data->blocking) {
               ^~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:347:2: note: Taking false branch
           if (data->blocking) {
           ^
   drivers/media/cec/core/cec-adap.c:359:13: note: Field 'fh' is null
                   if (data->fh)
                             ^
   drivers/media/cec/core/cec-adap.c:359:3: note: Taking false branch
                   if (data->fh)
                   ^
   drivers/media/cec/core/cec-adap.c:361:3: note: Memory is released
                   kfree(data);
                   ^~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:401:2: note: Returning; memory was rel=
eased via 1st parameter
           cec_data_completed(data);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:922:3: note: Returning; memory was rel=
eased via 1st parameter
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:925:9: note: Use of memory after it is=
 freed
           *msg =3D data->msg;
                  ^~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/core/init.c:616:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(id, "Default");
                   ^~~~~~
   sound/core/init.c:616:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(id, "Default");
                   ^~~~~~
   sound/core/init.c:636:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(spos, sfxstr);
                   ^~~~~~
   sound/core/init.c:636:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(spos, sfxstr);
                   ^~~~~~
   sound/core/init.c:697:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->id, buf1);
           ^~~~~~
   sound/core/init.c:697:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(card->id, buf1);
           ^~~~~~
   sound/core/init.c:924:3: warning: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(card->components, " ");
                   ^~~~~~
   sound/core/init.c:924:3: note: Call to function 'strcat' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcat'. CWE-119
                   strcat(card->components, " ");
                   ^~~~~~
   sound/core/init.c:925:2: warning: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(card->components, component);
           ^~~~~~
   sound/core/init.c:925:2: note: Call to function 'strcat' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcat'. CWE-119
           strcat(card->components, component);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/core/control.c:121:2: note: Loop condition is false.  Exiting loop
           write_lock_irqsave(&card->ctl_files_rwlock, flags);
           ^
   include/linux/rwlock.h:81:2: note: expanded from macro 'write_lock_irqsa=
ve'
           do {                                            \
           ^
   sound/core/control.c:123:2: note: Loop condition is false.  Exiting loop
           write_unlock_irqrestore(&card->ctl_files_rwlock, flags);
           ^
   include/linux/rwlock.h:118:2: note: expanded from macro 'write_unlock_ir=
qrestore'
           do {                                            \
           ^
   sound/core/control.c:125:2: note: Left side of '&&' is false
           list_for_each_entry(control, &card->controls, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \

vim +6686 drivers/media/dvb-frontends/drxk_hard.c

43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6672  =

43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6673  static int drxk_read_ucblocks(struct dvb_frontend *fe, =
u32 *ucblocks)
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6674  {
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6675  	struct drxk_state *state =3D fe->demodulator_priv;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6676  	u16 err;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6677  =

2da6750117c8fc drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2011-07-04  6678  	dprintk(1, "\n");
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6679  =

cd7a67a4f18047 drivers/media/dvb-frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2013-04-28  6680  	if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6681  		return -ENODEV;
cd7a67a4f18047 drivers/media/dvb-frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2013-04-28  6682  	if (state->m_drxk_state =3D=3D DRXK_UNINITIALIZED)
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6683  		return -EAGAIN;
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6684  =

cd7a67a4f18047 drivers/media/dvb-frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2013-04-28  6685  	dvbtqam_get_acc_pkt_err(state, &err);
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03 @6686  	*ucblocks =3D (u32) err;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6687  	return 0;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6688  }
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6689  =


:::::: The code at line 6686 was first introduced by commit
:::::: 43dd07f758d81fc55a7a1ff24b7689b10cc75bf2 [media] DRX-K: Initial chec=
k-in

:::::: TO: Ralph Metzler <rjkm@metzlerbros.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2837385062294260398==--

