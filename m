Content-Type: multipart/mixed; boundary="===============6238369785133377036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/target/target_core_pscsi.c:1032:6: warning: Value stored to 'cdb' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 30 Mar 2022 15:54:12 +0800
Message-ID: <202203301545.wmLw8Kvh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6238369785133377036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c24a186398f59c80adb9a967486b65c1423a59d
commit: c49ff72cff4caff709b2edb98421bd87bec1d853 scsi: target: pscsi: Remov=
e struct pscsi_plugin_task
date:   4 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20330/202203301545.wmLw8Kvh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc49ff72cff4caff709b2edb98421bd87bec1d853
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c49ff72cff4caff709b2edb98421bd87bec1d853
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/ieee802154/nl-phy.c:174:6: note: Assuming the condition is false
           if (!info->attrs[IEEE802154_ATTR_PHY_NAME])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:174:2: note: Taking false branch
           if (!info->attrs[IEEE802154_ATTR_PHY_NAME])
           ^
   net/ieee802154/nl-phy.c:178:6: note: Assuming the condition is false
           if (name[nla_len(info->attrs[IEEE802154_ATTR_PHY_NAME]) - 1] !=
=3D '\0')
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/ieee802154/nl-phy.c:178:2: note: Taking false branch
           if (name[nla_len(info->attrs[IEEE802154_ATTR_PHY_NAME]) - 1] !=
=3D '\0')
           ^
   net/ieee802154/nl-phy.c:181:6: note: Assuming the condition is false
           if (info->attrs[IEEE802154_ATTR_DEV_NAME]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:181:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_DEV_NAME]) {
           ^
   net/ieee802154/nl-phy.c:192:2: note: Taking false branch
           if (strlen(devname) >=3D IFNAMSIZ)
           ^
   net/ieee802154/nl-phy.c:196:6: note: Assuming 'phy' is non-null
           if (!phy)
               ^~~~
   net/ieee802154/nl-phy.c:196:2: note: Taking false branch
           if (!phy)
           ^
   net/ieee802154/nl-phy.c:200:6: note: Assuming 'msg' is non-null
           if (!msg)
               ^~~~
   net/ieee802154/nl-phy.c:200:2: note: Taking false branch
           if (!msg)
           ^
   net/ieee802154/nl-phy.c:203:6: note: Assuming pointer value is null
           if (info->attrs[IEEE802154_ATTR_HW_ADDR] &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:203:43: note: Left side of '&&' is false
           if (info->attrs[IEEE802154_ATTR_HW_ADDR] &&
                                                    ^
   net/ieee802154/nl-phy.c:210:6: note: Assuming the condition is false
           if (info->attrs[IEEE802154_ATTR_DEV_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:210:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_DEV_TYPE]) {
           ^
   net/ieee802154/nl-phy.c:220:6: note: Calling 'IS_ERR'
           if (IS_ERR(dev)) {
               ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:220:6: note: Returning from 'IS_ERR'
           if (IS_ERR(dev)) {
               ^~~~~~~~~~~
   net/ieee802154/nl-phy.c:220:2: note: Taking false branch
           if (IS_ERR(dev)) {
           ^
   net/ieee802154/nl-phy.c:226:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_HW_ADDR]) {
           ^
   net/ieee802154/nl-phy.c:243:6: note: Assuming the condition is false
           if (nla_put_string(msg, IEEE802154_ATTR_PHY_NAME, wpan_phy_name(=
phy)) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   net/ieee802154/nl-phy.c:243:6: note: Left side of '||' is false
   net/ieee802154/nl-phy.c:244:52: note: Passing null pointer value via 3rd=
 parameter 'str'
               nla_put_string(msg, IEEE802154_ATTR_DEV_NAME, dev->name)) {
                                                             ^~~~~~~~~
   net/ieee802154/nl-phy.c:244:6: note: Calling 'nla_put_string'
               nla_put_string(msg, IEEE802154_ATTR_DEV_NAME, dev->name)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1477:32: note: Null pointer passed as 1st argument=
 to string length function
           return nla_put(skb, attrtype, strlen(str) + 1, str);
                                         ^      ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/target/target_core_pscsi.c:355:25: warning: Value stored to 'phv=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct pscsi_hba_virt *phv =3D dev->se_hba->hba_ptr;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pscsi.c:355:25: note: Value stored to 'phv' d=
uring its initialization is never read
           struct pscsi_hba_virt *phv =3D dev->se_hba->hba_ptr;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pscsi.c:400:25: warning: Value stored to 'phv=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct pscsi_hba_virt *phv =3D dev->se_hba->hba_ptr;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pscsi.c:400:25: note: Value stored to 'phv' d=
uring its initialization is never read
           struct pscsi_hba_virt *phv =3D dev->se_hba->hba_ptr;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
>> drivers/target/target_core_pscsi.c:1032:6: warning: Value stored to 'cdb=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           u8 *cdb =3D cmd->priv;
               ^~~   ~~~~~~~~~
   drivers/target/target_core_pscsi.c:1032:6: note: Value stored to 'cdb' d=
uring its initialization is never read
           u8 *cdb =3D cmd->priv;
               ^~~   ~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/target/loopback/tcm_loop.c:697:30: warning: Access to field 'tl_=
fabric_prot_type' results in a dereference of a null pointer (loaded from v=
ariable 'tl_tpg') [clang-analyzer-core.NullDereference]
           tl_tpg->tl_fabric_prot_type =3D val;
           ~~~~~~                      ^
   drivers/target/loopback/tcm_loop.c:684:2: note: 'tl_tpg' initialized to =
a null pointer value
           struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_=
loop_tpg,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:687:12: note: Calling 'kstrtoul'
           int ret =3D kstrtoul(page, 0, &val);
                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kstrtox.h:36:6: note: Left side of '&&' is true
           if (sizeof(unsigned long) =3D=3D sizeof(unsigned long long) &&
               ^
   include/linux/kstrtox.h:36:2: note: Taking true branch
           if (sizeof(unsigned long) =3D=3D sizeof(unsigned long long) &&
           ^
   include/linux/kstrtox.h:38:3: note: Returning value, which participates =
in a condition later
                   return kstrtoull(s, base, (unsigned long long *)res);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:687:12: note: Returning from 'kstrtou=
l'
           int ret =3D kstrtoul(page, 0, &val);
                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:689:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/target/loopback/tcm_loop.c:689:2: note: Taking false branch
           if (ret) {
           ^
   drivers/target/loopback/tcm_loop.c:693:6: note: Assuming 'val' is equal =
to 0
           if (val !=3D 0 && val !=3D 1 && val !=3D 3) {
               ^~~~~~~~
   drivers/target/loopback/tcm_loop.c:693:15: note: Left side of '&&' is fa=
lse
           if (val !=3D 0 && val !=3D 1 && val !=3D 3) {
                        ^
   drivers/target/loopback/tcm_loop.c:697:30: note: Access to field 'tl_fab=
ric_prot_type' results in a dereference of a null pointer (loaded from vari=
able 'tl_tpg')
           tl_tpg->tl_fabric_prot_type =3D val;
           ~~~~~~                      ^
   drivers/target/loopback/tcm_loop.c:725:23: warning: Value stored to 'tl_=
hba' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct tcm_loop_hba *tl_hba =3D tl_tpg->tl_hba;
                                ^~~~~~   ~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:725:23: note: Value stored to 'tl_hba=
' during its initialization is never read
           struct tcm_loop_hba *tl_hba =3D tl_tpg->tl_hba;
                                ^~~~~~   ~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:913:31: warning: Access to field 'tl_=
transport_status' results in a dereference of a null pointer (loaded from v=
ariable 'tl_tpg') [clang-analyzer-core.NullDereference]
                   tl_tpg->tl_transport_status =3D TCM_TRANSPORT_ONLINE;
                   ~~~~~~                      ^
   drivers/target/loopback/tcm_loop.c:909:2: note: 'tl_tpg' initialized to =
a null pointer value
           struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:912:2: note: Taking true branch
           if (!strncmp(page, "online", 6)) {
           ^
   drivers/target/loopback/tcm_loop.c:913:31: note: Access to field 'tl_tra=
nsport_status' results in a dereference of a null pointer (loaded from vari=
able 'tl_tpg')
                   tl_tpg->tl_transport_status =3D TCM_TRANSPORT_ONLINE;
                   ~~~~~~                      ^
   drivers/target/loopback/tcm_loop.c:993:17: warning: Value stored to 'wwn=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct se_wwn *wwn =3D se_tpg->se_tpg_wwn;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:993:17: note: Value stored to 'wwn' d=
uring its initialization is never read
           struct se_wwn *wwn =3D se_tpg->se_tpg_wwn;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:999:2: warning: Value stored to 'tl_h=
ba' is never read [clang-analyzer-deadcode.DeadStores]
           tl_hba =3D tl_tpg->tl_hba;
           ^        ~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:999:2: note: Value stored to 'tl_hba'=
 is never read
           tl_hba =3D tl_tpg->tl_hba;
           ^        ~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:1000:2: warning: Value stored to 'tpg=
t' is never read [clang-analyzer-deadcode.DeadStores]
           tpgt =3D tl_tpg->tl_tpgt;
           ^      ~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:1000:2: note: Value stored to 'tpgt' =
is never read
           tpgt =3D tl_tpg->tl_tpgt;
           ^      ~~~~~~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:1078:2: warning: Value stored to 'sh'=
 is never read [clang-analyzer-deadcode.DeadStores]
           sh =3D tl_hba->sh;
           ^    ~~~~~~~~~~
   drivers/target/loopback/tcm_loop.c:1078:2: note: Value stored to 'sh' is=
 never read
           sh =3D tl_hba->sh;
           ^    ~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/mac80211/tx.c:2594:4: warning: Null pointer passed as 2nd argument t=
o memory copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(hdr.addr1, sta->sta.addr, ETH_ALEN);
                           ^                 ~~~~~~~~~~~~~
   net/mac80211/tx.c:2576:2: note: Taking true branch
           if (IS_ERR(sta))
           ^
   net/mac80211/tx.c:2580:6: note: Assuming field 'force_tx_status' is false
           if (local->force_tx_status)

vim +/cdb +1032 drivers/target/target_core_pscsi.c

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1026  =

2a842acab109f4 Christoph Hellwig  2017-06-03  1027  static void pscsi_req_d=
one(struct request *req, blk_status_t status)
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1028  {
5787cacd0bd5ee Christoph Hellwig  2012-04-24  1029  	struct se_cmd *cmd =3D=
 req->end_io_data;
dce6ce8cfb842c Mike Christie      2017-05-31  1030  	int result =3D scsi_re=
q(req)->result;
149d0e489e807f Bart Van Assche    2021-05-23  1031  	enum sam_status scsi_s=
tatus =3D result & 0xff;
c49ff72cff4caf Christoph Hellwig  2022-02-24 @1032  	u8 *cdb =3D cmd->priv;
5787cacd0bd5ee Christoph Hellwig  2012-04-24  1033  =

15df85e0d63d87 Bart Van Assche    2021-04-15  1034  	if (scsi_status !=3D S=
AM_STAT_GOOD) {
5787cacd0bd5ee Christoph Hellwig  2012-04-24  1035  		pr_debug("PSCSI Statu=
s Byte exception at cmd: %p CDB:"
c49ff72cff4caf Christoph Hellwig  2022-02-24  1036  			" 0x%02x Result: 0x%=
08x\n", cmd, cdb[0], result);
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1037  	}
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1038  =

dce6ce8cfb842c Mike Christie      2017-05-31  1039  	pscsi_complete_cmd(cmd=
, scsi_status, scsi_req(req)->sense);
dce6ce8cfb842c Mike Christie      2017-05-31  1040  =

dce6ce8cfb842c Mike Christie      2017-05-31  1041  	switch (host_byte(resu=
lt)) {
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1042  	case DID_OK:
bd81372065fa46 Lee Duncan         2018-05-15  1043  		target_complete_cmd_w=
ith_length(cmd, scsi_status,
bd81372065fa46 Lee Duncan         2018-05-15  1044  			cmd->data_length - s=
csi_req(req)->resid_len);
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1045  		break;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1046  	default:
5787cacd0bd5ee Christoph Hellwig  2012-04-24  1047  		pr_debug("PSCSI Host =
Byte exception at cmd: %p CDB:"
c49ff72cff4caf Christoph Hellwig  2022-02-24  1048  			" 0x%02x Result: 0x%=
08x\n", cmd, cdb[0], result);
5787cacd0bd5ee Christoph Hellwig  2012-04-24  1049  		target_complete_cmd(c=
md, SAM_STAT_CHECK_CONDITION);
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1050  		break;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1051  	}
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1052  =

0bf6d96cb82940 Christoph Hellwig  2021-10-25  1053  	blk_mq_free_request(re=
q);
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1054  }
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1055  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6238369785133377036==--

