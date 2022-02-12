Content-Type: multipart/mixed; boundary="===============4073829453190269912=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:remove-scsi_request 2/8] drivers/target/target_core_pscsi.c:1032:6: warning: Value stored to 'cdb' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 12 Feb 2022 20:31:16 +0800
Message-ID: <202202122030.XSq59p9L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4073829453190269912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git remove-scsi_request
head:   d8fd889c4c1f73165ec38da54e2c10bfe795686b
commit: ea4aca35de86f4866d0b1745ae4f0a03d3cef1a6 [2/8] target/pscsi: remove=
 struct pscsi_plugin_task
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20212/202202122030.XSq59p9L-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc remove-scsi_request
        git checkout ea4aca35de86f4866d0b1745ae4f0a03d3cef1a6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/net/can/dev/rx-offload.c:87:3: warning: Value stored to 'cb_pos'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   cb_pos =3D can_rx_offload_get_cb(pos);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/rx-offload.c:87:3: note: Value stored to 'cb_pos' is=
 never read
                   cb_pos =3D can_rx_offload_get_cb(pos);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/rx-offload.c:88:3: warning: Value stored to 'cb_new'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   cb_new =3D can_rx_offload_get_cb(new);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/rx-offload.c:88:3: note: Value stored to 'cb_new' is=
 never read
                   cb_new =3D can_rx_offload_get_cb(new);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   9 warnings generated.
   drivers/net/can/softing/softing_fw.c:531:3: warning: Value stored to 'er=
ror_reporting' is never read [clang-analyzer-deadcode.DeadStores]
                   error_reporting +=3D softing_error_reporting(netdev);
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/softing/softing_fw.c:531:3: note: Value stored to 'error=
_reporting' is never read
                   error_reporting +=3D softing_error_reporting(netdev);
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: note: Value stored to 'ret' is n=
ever read
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   sound/soc/codecs/max98373-sdw.c:794:26: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];

vim +/cdb +1032 drivers/target/target_core_pscsi.c

c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1026  =

2a842acab109f40 Christoph Hellwig  2017-06-03  1027  static void pscsi_req_=
done(struct request *req, blk_status_t status)
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1028  {
5787cacd0bd5ee0 Christoph Hellwig  2012-04-24  1029  	struct se_cmd *cmd =
=3D req->end_io_data;
dce6ce8cfb842c3 Mike Christie      2017-05-31  1030  	int result =3D scsi_r=
eq(req)->result;
149d0e489e807f1 Bart Van Assche    2021-05-23  1031  	enum sam_status scsi_=
status =3D result & 0xff;
ea4aca35de86f48 Christoph Hellwig  2022-02-10 @1032  	u8 *cdb =3D cmd->priv;
5787cacd0bd5ee0 Christoph Hellwig  2012-04-24  1033  =

15df85e0d63d870 Bart Van Assche    2021-04-15  1034  	if (scsi_status !=3D =
SAM_STAT_GOOD) {
5787cacd0bd5ee0 Christoph Hellwig  2012-04-24  1035  		pr_debug("PSCSI Stat=
us Byte exception at cmd: %p CDB:"
ea4aca35de86f48 Christoph Hellwig  2022-02-10  1036  			" 0x%02x Result: 0x=
%08x\n", cmd, cdb[0], result);
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1037  	}
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1038  =

dce6ce8cfb842c3 Mike Christie      2017-05-31  1039  	pscsi_complete_cmd(cm=
d, scsi_status, scsi_req(req)->sense);
dce6ce8cfb842c3 Mike Christie      2017-05-31  1040  =

dce6ce8cfb842c3 Mike Christie      2017-05-31  1041  	switch (host_byte(res=
ult)) {
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1042  	case DID_OK:
bd81372065fa467 Lee Duncan         2018-05-15  1043  		target_complete_cmd_=
with_length(cmd, scsi_status,
bd81372065fa467 Lee Duncan         2018-05-15  1044  			cmd->data_length - =
scsi_req(req)->resid_len);
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1045  		break;
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1046  	default:
5787cacd0bd5ee0 Christoph Hellwig  2012-04-24  1047  		pr_debug("PSCSI Host=
 Byte exception at cmd: %p CDB:"
ea4aca35de86f48 Christoph Hellwig  2022-02-10  1048  			" 0x%02x Result: 0x=
%08x\n", cmd, cdb[0], result);
5787cacd0bd5ee0 Christoph Hellwig  2012-04-24  1049  		target_complete_cmd(=
cmd, SAM_STAT_CHECK_CONDITION);
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1050  		break;
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1051  	}
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1052  =

0bf6d96cb829409 Christoph Hellwig  2021-10-25  1053  	blk_mq_free_request(r=
eq);
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1054  }
c66ac9db8d4ad99 Nicholas Bellinger 2010-12-17  1055  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4073829453190269912==--

