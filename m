Content-Type: multipart/mixed; boundary="===============3987426992757635265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 26 Feb 2022 14:16:11 +0800
Message-ID: <202202261412.NVibXbnE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3987426992757635265==
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
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220226/202202261412.NVibXbnE-lkp(a)intel.com/config)
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
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:935:3: warning: Va=
lue stored to 'tsin' is never read [clang-analyzer-deadcode.DeadStores]
                   tsin =3D fei->channel_data[index];
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:935:3: note: Value=
 stored to 'tsin' is never read
                   tsin =3D fei->channel_data[index];
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/ata/pata_sis.c:417:6: warning: Value stored to 'speed' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_sis.c:417:6: note: Value stored to 'speed' during its i=
nitialization is never read
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_sis.c:451:6: warning: Value stored to 'speed' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_sis.c:451:6: note: Value stored to 'speed' during its i=
nitialization is never read
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/dvb-frontends/tc90522.c:51:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/media/dvb-frontends/tc90522.c:51:2: note: Value stored to 'ret' =
is never read
           ret =3D 0;
           ^     ~
   drivers/media/dvb-frontends/tc90522.c:343:2: warning: Value stored to 'm=
ode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D 1;
           ^      ~
   drivers/media/dvb-frontends/tc90522.c:343:2: note: Value stored to 'mode=
' is never read
           mode =3D 1;
           ^      ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/dvb-frontends/horus3a.c:141:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:141:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   drivers/media/tuners/max2165.c:67:3: note: Returning without writing to =
'*p_data'
                   return -EIO;
                   ^
   drivers/media/tuners/max2165.c:227:2: note: Returning from 'max2165_read=
_reg'
           max2165_read_reg(priv, REG_AUTOTUNE, &autotune);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:236:17: note: The left operand of '>>' is=
 a garbage value
           vco =3D autotune >> 6;
                 ~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-frontends/tda10086.c:220:28: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                                           | ((cmd->msg_len - 1) << 4));
                                              ~~~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/tda10086.c:207:2: note: Assuming 'debug' is 0
           dprintk ("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/tda10086.c:36:7: note: expanded from macro '=
dprintk'
                   if (debug) printk(KERN_DEBUG "tda10086: " args); \
                       ^~~~~
   drivers/media/dvb-frontends/tda10086.c:207:2: note: Taking false branch
           dprintk ("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/tda10086.c:36:3: note: expanded from macro '=
dprintk'
                   if (debug) printk(KERN_DEBUG "tda10086: " args); \
                   ^
   drivers/media/dvb-frontends/tda10086.c:207:2: note: Loop condition is fa=
lse.  Exiting loop
           dprintk ("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/tda10086.c:35:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/tda10086.c:209:6: note: Assuming field 'dise=
qc_tone' is 0
           if (state->config->diseqc_tone)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10086.c:209:2: note: Taking false branch
           if (state->config->diseqc_tone)
           ^
   drivers/media/dvb-frontends/tda10086.c:212:6: note: Assuming field 'msg_=
len' is <=3D 6
           if (cmd->msg_len > 6)
               ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10086.c:212:2: note: Taking false branch
           if (cmd->msg_len > 6)
           ^
   drivers/media/dvb-frontends/tda10086.c:216:11: note: Assuming 'i' is >=
=3D field 'msg_len'
           for(i=3D0; i< cmd->msg_len; i++) {
                    ^~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10086.c:216:2: note: Loop condition is fa=
lse. Execution continues on line 219
           for(i=3D0; i< cmd->msg_len; i++) {
           ^
   drivers/media/dvb-frontends/tda10086.c:220:28: note: The result of the l=
eft shift is undefined because the left operand is negative
                                           | ((cmd->msg_len - 1) << 4));
                                              ~~~~~~~~~~~~~~~~~~ ^
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   7 warnings generated.
   drivers/pci/pci.c:5819:20: warning: The result of the left shift is unde=
fined because the left operand is negative [clang-analyzer-core.UndefinedBi=
naryOperatorResult]
           v =3D (ffs(rq) - 8) << 12;
               ~~~~~~~~~~~~~ ^
   drivers/pci/pci.c:5804:6: note: Assuming 'rq' is >=3D 128
           if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
               ^~~~~~~~
   drivers/pci/pci.c:5804:6: note: Left side of '||' is false
   drivers/pci/pci.c:5804:18: note: Assuming 'rq' is <=3D 4096
           if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
                           ^~~~~~~~~
   drivers/pci/pci.c:5804:6: note: Left side of '||' is false
           if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
               ^
   drivers/pci/pci.c:5804:32: note: Calling 'is_power_of_2'
           if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
                                         ^~~~~~~~~~~~~~~~~
   include/linux/log2.h:47:10: note: 'n' is not equal to 0
           return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
                   ^
   include/linux/log2.h:47:10: note: Left side of '&&' is true
   include/linux/log2.h:47:21: note: Assuming the condition is true
           return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
                              ^~~~~~~~~~~~~~~~~~
   include/linux/log2.h:47:2: note: Returning the value 1, which participat=
es in a condition later
           return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.c:5804:32: note: Returning from 'is_power_of_2'
           if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
                                         ^~~~~~~~~~~~~~~~~
   drivers/pci/pci.c:5804:2: note: Taking false branch
           if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
           ^
   drivers/pci/pci.c:5812:6: note: Assuming 'pcie_bus_config' is not equal =
to PCIE_BUS_PERFORMANCE
           if (pcie_bus_config =3D=3D PCIE_BUS_PERFORMANCE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.c:5812:2: note: Taking false branch
           if (pcie_bus_config =3D=3D PCIE_BUS_PERFORMANCE) {
           ^
   drivers/pci/pci.c:5819:20: note: The result of the left shift is undefin=
ed because the left operand is negative
           v =3D (ffs(rq) - 8) << 12;
               ~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
   9 warnings generated.
   18 warnings generated.
   drivers/media/platform/atmel/atmel-isc-base.c:214:18: warning: Value sto=
red to 'isc_clk' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-base.c:214:18: note: Value stored=
 to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);

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
--===============3987426992757635265==--

