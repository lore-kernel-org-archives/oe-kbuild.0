Content-Type: multipart/mixed; boundary="===============2577901560327909932=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:491:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 01 Dec 2021 01:06:29 +0800
Message-ID: <202112010129.KI0y5I8w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2577901560327909932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "L=C3=A9o Le Bouter" <lle-bout@zaclys.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: 9b22fece786ed641909988da4810bfa8e5d2e592 atlantic: remove architect=
ure depends
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20211126 (https://download.01.org/0day-ci/arch=
ive/20211201/202112010129.KI0y5I8w-lkp(a)intel.com/config)
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
   fs/ntfs/runlist.c:1764:4: warning: Value stored to 'rl_end' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           rl_end =3D trl + (rl_end - runlist->rl);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/runlist.c:1764:4: note: Value stored to 'rl_end' is never read
                           rl_end =3D trl + (rl_end - runlist->rl);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/runlist.c:1834:4: warning: Value stored to 'rl_end' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           rl_end =3D trl + (rl_end - runlist->rl);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/runlist.c:1834:4: note: Value stored to 'rl_end' is never read
                           rl_end =3D trl + (rl_end - runlist->rl);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/runlist.c:1866:2: warning: Value stored to 'old_size' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           old_size +=3D 2;
           ^           ~
   fs/ntfs/runlist.c:1866:2: note: Value stored to 'old_size' is never read
           old_size +=3D 2;
           ^           ~
   fs/ntfs/runlist.c:1869:3: warning: Value stored to 'rl_end' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   rl_end =3D trl + (rl_end - runlist->rl);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/runlist.c:1869:3: note: Value stored to 'rl_end' is never read
                   rl_end =3D trl + (rl_end - runlist->rl);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/ntfs/super.c:775:2: warning: Value stored to 'nr_hidden_sects' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           nr_hidden_sects =3D le32_to_cpu(b->bpb.hidden_sectors);
           ^
   fs/ntfs/super.c:775:2: note: Value stored to 'nr_hidden_sects' is never =
read
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
   4 warnings generated.
   fs/ntfs/lcnalloc.c:735:4: warning: Value stored to 'need_writeback' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           need_writeback =3D 0;
                           ^                ~
   fs/ntfs/lcnalloc.c:735:4: note: Value stored to 'need_writeback' is neve=
r read
                           need_writeback =3D 0;
                           ^                ~
   Suppressed 3 warnings (3 in non-user code).
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
   5 warnings generated.
   drivers/scsi/scsi_transport_iscsi.c:3191:3: warning: Value stored to 'er=
r' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D transport->get_chap(shost, ev->u.get_chap.chap_t=
bl_idx,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/scsi/scsi_transport_iscsi.c:3191:3: note: Value stored to 'err' =
is never read
                   err =3D transport->get_chap(shost, ev->u.get_chap.chap_t=
bl_idx,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
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
   4 warnings generated.
   drivers/scsi/libfc/fc_disc.c:111:3: warning: Value stored to 'ev_qual' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ev_qual &=3D ELS_RSCN_EV_QUAL_MASK;
                   ^
   drivers/scsi/libfc/fc_disc.c:111:3: note: Value stored to 'ev_qual' is n=
ever read
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   3 warnings generated.
   drivers/i3c/master.c:555:32: warning: Value stored to 'master' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i3c_master_controller *master =3D i3c_bus_to_i3c_master(i=
3cbus);
                                         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/i3c/master.c:555:32: note: Value stored to 'master' during its i=
nitialization is never read
           struct i3c_master_controller *master =3D i3c_bus_to_i3c_master(i=
3cbus);
                                         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/i3c/master/i3c-master-cdns.c:1245:2: warning: Value stored to 'p=
rescl1' is never read [clang-analyzer-deadcode.DeadStores]
           prescl1 =3D PRESCL_CTRL1_OD_LOW(low);
           ^
   drivers/i3c/master/i3c-master-cdns.c:1245:2: note: Value stored to 'pres=
cl1' is never read
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
   5 warnings generated.
   drivers/ata/pata_legacy.c:283:3: warning: Value stored to 'rt' is never =
read [clang-analyzer-deadcode.DeadStores]
                   rt |=3D (1 + 3 * pio) << (3 * adev->devno);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_legacy.c:283:3: note: Value stored to 'rt' is never read
                   rt |=3D (1 + 3 * pio) << (3 * adev->devno);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_legacy.c:781:6: warning: Value stored to 'timing' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int timing =3D 0x88 + (ap->port_no * 4) + (adev->devno * 2);
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_legacy.c:781:6: note: Value stored to 'timing' during i=
ts initialization is never read
           int timing =3D 0x88 + (ap->port_no * 4) + (adev->devno * 2);
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/input/keyboard/samsung-keypad.c:88:23: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                           val &=3D ~(1 << col) << 8;
                                              ^
   drivers/input/keyboard/samsung-keypad.c:158:3: note: Calling 'samsung_ke=
ypad_scan'
                   samsung_keypad_scan(keypad, row_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:16: note: Assuming 'col' is <=
 field 'cols'
           for (col =3D 0; col < keypad->cols; col++) {
                         ^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:2: note: Loop condition is tr=
ue.  Entering loop body
           for (col =3D 0; col < keypad->cols; col++) {
           ^
   drivers/input/keyboard/samsung-keypad.c:86:7: note: Assuming field 'type=
' is equal to KEYPAD_TYPE_S5PV210

vim +/err +491 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c

98c4c20142e985 David VomLehn  2017-01-23  472  =

98c4c20142e985 David VomLehn  2017-01-23  473  static int hw_atl_utils_init=
_ucp(struct aq_hw_s *self,
4cbc9f92f9a134 Igor Russkikh  2018-01-15  474  				 const struct aq_hw_caps=
_s *aq_hw_caps)
98c4c20142e985 David VomLehn  2017-01-23  475  {
98c4c20142e985 David VomLehn  2017-01-23  476  	int err =3D 0;
98c4c20142e985 David VomLehn  2017-01-23  477  =

98c4c20142e985 David VomLehn  2017-01-23  478  	if (!aq_hw_read_reg(self, 0=
x370U)) {
98c4c20142e985 David VomLehn  2017-01-23  479  		unsigned int rnd =3D 0U;
98c4c20142e985 David VomLehn  2017-01-23  480  		unsigned int ucp_0x370 =3D=
 0U;
98c4c20142e985 David VomLehn  2017-01-23  481  =

98c4c20142e985 David VomLehn  2017-01-23  482  		get_random_bytes(&rnd, siz=
eof(unsigned int));
98c4c20142e985 David VomLehn  2017-01-23  483  =

98c4c20142e985 David VomLehn  2017-01-23  484  		ucp_0x370 =3D 0x02020202U =
| (0xFEFEFEFEU & rnd);
98c4c20142e985 David VomLehn  2017-01-23  485  		aq_hw_write_reg(self, HW_A=
TL_UCP_0X370_REG, ucp_0x370);
98c4c20142e985 David VomLehn  2017-01-23  486  	}
98c4c20142e985 David VomLehn  2017-01-23  487  =

8e1c072fcbeae2 Igor Russkikh  2018-01-15  488  	hw_atl_reg_glb_cpu_scratch_=
scp_set(self, 0x00000000U, 25U);
98c4c20142e985 David VomLehn  2017-01-23  489  =

98c4c20142e985 David VomLehn  2017-01-23  490  	/* check 10 times by 1ms */
6a7f2277313b4a Nikita Danilov 2019-02-27 @491  	err =3D readx_poll_timeout_=
atomic(hw_atl_scrpad25_get,
6a7f2277313b4a Nikita Danilov 2019-02-27  492  					self, self->mbox_addr,
6a7f2277313b4a Nikita Danilov 2019-02-27  493  					self->mbox_addr !=3D 0U,
6a7f2277313b4a Nikita Danilov 2019-02-27  494  					1000U, 10000U);
e7b5f97e6574dc Igor Russkikh  2020-02-14  495  	err =3D readx_poll_timeout_=
atomic(aq_fw1x_rpc_get, self,
e7b5f97e6574dc Igor Russkikh  2020-02-14  496  					self->rpc_addr,
e7b5f97e6574dc Igor Russkikh  2020-02-14  497  					self->rpc_addr !=3D 0U,
e7b5f97e6574dc Igor Russkikh  2020-02-14  498  					1000U, 100000U);
98c4c20142e985 David VomLehn  2017-01-23  499  =

98c4c20142e985 David VomLehn  2017-01-23  500  	return err;
98c4c20142e985 David VomLehn  2017-01-23  501  }
98c4c20142e985 David VomLehn  2017-01-23  502  =


:::::: The code at line 491 was first introduced by commit
:::::: 6a7f2277313b4a39645c13277efb9337ca441933 net: aquantia: replace AQ_H=
W_WAIT_FOR with readx_poll_timeout_atomic

:::::: TO: Nikita Danilov <nikita.danilov@aquantia.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2577901560327909932==--

