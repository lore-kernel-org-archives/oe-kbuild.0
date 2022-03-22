Content-Type: multipart/mixed; boundary="===============4413999578506214148=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qla2xxx/qla_edif.c:1093:3: warning: Value stored to 'rval' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Mar 2022 10:17:31 +0800
Message-ID: <202203221051.r7v780c8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4413999578506214148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Quinn Tran <qutran@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Larry Wisneski <Larry.Wisneski@marvell.com>
CC: Duane Grigsby <duane.grigsby@marvell.com>
CC: Rick Hicksted Jr <rhicksted@marvell.com>
CC: Nilesh Javali <njavali@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   93e220a62da36f766b3188e76e234607e41488f9
commit: dd30706e73b70d67e88fdaca688db7a3374fd5de scsi: qla2xxx: edif: Add k=
ey update
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220322/202203221051.r7v780c8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddd30706e73b70d67e88fdaca688db7a3374fd5de
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dd30706e73b70d67e88fdaca688db7a3374fd5de
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/target/target_core_sbc.c:1158:9: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
           return target_cmd_size_check(cmd, size);
                  ^                          ~~~~
   drivers/target/target_core_sbc.c:826:2: note: 'size' declared without an=
 initial value
           unsigned int size;
           ^~~~~~~~~~~~~~~~~
   drivers/target/target_core_sbc.c:832:2: note: Control jumps to 'case 8:'=
  at line 833
           switch (cdb[0]) {
           ^
   drivers/target/target_core_sbc.c:838:3: note:  Execution continues on li=
ne 1139
                   break;
                   ^
   drivers/target/target_core_sbc.c:1139:12: note: Field 'execute_cmd' is n=
on-null
           if (!cmd->execute_cmd)
                     ^
   drivers/target/target_core_sbc.c:1139:2: note: Taking false branch
           if (!cmd->execute_cmd)
           ^
   drivers/target/target_core_sbc.c:1142:6: note: Assuming the condition is=
 false
           if (cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_sbc.c:1142:2: note: Taking false branch
           if (cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) {
           ^
   drivers/target/target_core_sbc.c:1158:9: note: 2nd function call argumen=
t is an uninitialized value
           return target_cmd_size_check(cmd, size);
                  ^                          ~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   drivers/scsi/qla2xxx/qla_attr.c:1995:4: warning: Value stored to 'action=
' is never read [clang-analyzer-deadcode.DeadStores]
                           action =3D MODE_CHANGE_ACCEPT;
                           ^        ~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_attr.c:1995:4: note: Value stored to 'action' i=
s never read
                           action =3D MODE_CHANGE_ACCEPT;
                           ^        ~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (6 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (6 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/scsi/qla2xxx/qla_dfs.c:215:3: warning: Value stored to 'rc' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   rc =3D qla24xx_gpdb_wait(vha, &fc_port, 0);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_dfs.c:215:3: note: Value stored to 'rc' is neve=
r read
                   rc =3D qla24xx_gpdb_wait(vha, &fc_port, 0);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (6 in non-user code, 4 with check filters).
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
   8 warnings generated.
   drivers/scsi/initio.c:403:8: warning: Although the value stored to 'rb' =
is used in the enclosing expression, the value is never actually read from =
'rb' [clang-analyzer-deadcode.DeadStores]
                   if ((rb =3D inb(base + TUL_NVRAM)) & SE2DI)
                        ^
   drivers/scsi/initio.c:403:8: note: Although the value stored to 'rb' is =
used in the enclosing expression, the value is never actually read from 'rb'
   drivers/scsi/initio.c:1169:9: warning: Although the value stored to 'scb=
' is used in the enclosing expression, the value is never actually read fro=
m 'scb' [clang-analyzer-deadcode.DeadStores]
                           if ((scb =3D host->active) !=3D NULL)
                                ^     ~~~~~~~~~~~~
   drivers/scsi/initio.c:1169:9: note: Although the value stored to 'scb' i=
s used in the enclosing expression, the value is never actually read from '=
scb'
                           if ((scb =3D host->active) !=3D NULL)
                                ^     ~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/scsi/qla2xxx/qla_edif.c:1093:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -EIO;
                   ^      ~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1093:3: note: Value stored to 'rval' is =
never read
                   rval =3D -EIO;
                   ^      ~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1100:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -EIO;
                   ^      ~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1100:3: note: Value stored to 'rval' is =
never read
                   rval =3D -EIO;
                   ^      ~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1117:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -EINVAL;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1117:3: note: Value stored to 'rval' is =
never read
                   rval =3D -EINVAL;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1128:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -EINVAL;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1128:3: note: Value stored to 'rval' is =
never read
                   rval =3D -EINVAL;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1141:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -EINVAL;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1141:3: note: Value stored to 'rval' is =
never read
                   rval =3D -EINVAL;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1221:4: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                           rval =3D -EINVAL;
                           ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1221:4: note: Value stored to 'rval' is =
never read
                           rval =3D -EINVAL;
                           ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1301:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -ENOMEM;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1301:3: note: Value stored to 'rval' is =
never read
                   rval =3D -ENOMEM;
                   ^      ~~~~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1321:3: warning: Value stored to 'rval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   rval =3D -EIO;
                   ^      ~~~~
   drivers/scsi/qla2xxx/qla_edif.c:1321:3: note: Value stored to 'rval' is =
never read
                   rval =3D -EIO;
                   ^      ~~~~
>> drivers/scsi/qla2xxx/qla_edif.c:1813:3: warning: Value stored to 'totlen=
' is never read [clang-analyzer-deadcode.DeadStores]
                   totlen =3D le16_to_cpu(p->trunc_frame_size);
                   ^
   drivers/scsi/qla2xxx/qla_edif.c:1813:3: note: Value stored to 'totlen' i=
s never read
   Suppressed 11 warnings (6 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/f2fs/node.c:1088:8: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                   nofs =3D noffset[1];
                        ^ ~~~~~~~~~~
   fs/f2fs/node.c:1069:10: note: Calling 'get_node_path'
           level =3D get_node_path(inode, from, offset, noffset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c:678:6: note: Assuming 'block' is < 'direct_index'
           if (block < direct_index) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c:678:2: note: Taking true branch
           if (block < direct_index) {
           ^
   fs/f2fs/node.c:680:3: note: Control jumps to line 736
                   goto got;
                   ^
   fs/f2fs/node.c:736:2: note: Returning zero (loaded from 'level'), which =
participates in a condition later
           return level;
           ^~~~~~~~~~~~
   fs/f2fs/node.c:1069:10: note: Returning from 'get_node_path'
           level =3D get_node_path(inode, from, offset, noffset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c:1070:6: note: 'level' is >=3D 0
           if (level < 0) {
               ^~~~~
   fs/f2fs/node.c:1070:2: note: Taking false branch
           if (level < 0) {
           ^
   fs/f2fs/node.c:1076:6: note: Calling 'IS_ERR'
           if (IS_ERR(page)) {
               ^~~~~~~~~~~~
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
   fs/f2fs/node.c:1076:6: note: Returning from 'IS_ERR'
           if (IS_ERR(page)) {
               ^~~~~~~~~~~~
   fs/f2fs/node.c:1076:2: note: Taking false branch
           if (IS_ERR(page)) {
           ^
   fs/f2fs/node.c:1085:2: note: Control jumps to 'case 0:'  at line 1086
           switch (level) {
           ^
   fs/f2fs/node.c:1088:8: note: Assigned value is garbage or undefined
                   nofs =3D noffset[1];
                        ^ ~~~~~~~~~~
   fs/f2fs/node.c:1385:3: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   fs/f2fs/node.c:1385:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ext4/migrate.c:644:9: warning: Although the value stored to 'len' is =
used in the enclosing expression, the value is never actually read from 'le=
n' [clang-analyzer-deadcode.DeadStores]
                   blk =3D len =3D start =3D end =3D 0;
                         ^     ~~~~~~~~~~~~~~~
   fs/ext4/migrate.c:644:9: note: Although the value stored to 'len' is use=
d in the enclosing expression, the value is never actually read from 'len'
                   blk =3D len =3D start =3D end =3D 0;
                         ^     ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/scsi/qla2xxx/qla_mbx.c:2439:2: warning: 7th function call argume=
nt is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ql_dbg(ql_dbg_mbx + ql_dbg_verbose, vha, 0x105e,
           ^
   drivers/scsi/qla2xxx/qla_mbx.c:2439:2: note: 7th function call argument =
is an uninitialized value
           ql_dbg(ql_dbg_mbx + ql_dbg_verbose, vha, 0x105e,
           ^
   drivers/scsi/qla2xxx/qla_mbx.c:3225:18: warning: Value stored to 'req' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct req_que *req =3D vha->req;
                           ^~~   ~~~~~~~~
   drivers/scsi/qla2xxx/qla_mbx.c:3225:18: note: Value stored to 'req' duri=
ng its initialization is never read
           struct req_que *req =3D vha->req;
                           ^~~   ~~~~~~~~
   drivers/scsi/qla2xxx/qla_mbx.c:5455:2: warning: Value stored to 'rval' i=
s never read [clang-analyzer-deadcode.DeadStores]
           rval =3D QLA_SUCCESS;
           ^
   drivers/scsi/qla2xxx/qla_mbx.c:5455:2: note: Value stored to 'rval' is n=
ever read
   drivers/scsi/qla2xxx/qla_mbx.c:6352:14: warning: The left expression of =
the compound assignment is an uninitialized value. The computed value will =
also be garbage [clang-analyzer-core.uninitialized.Assign]
           mcp->out_mb |=3D MBX_10|MBX_8|MBX_7|MBX_6|MBX_5|MBX_4|MBX_3|MBX_=
2|MBX_1|
           ~~~~~~~~~~~ ^
   drivers/scsi/qla2xxx/qla_mbx.c:6333:7: note: Assuming the condition is t=
rue
           if (!IS_MCTP_CAPABLE(vha->hw))
                ^

vim +/rval +1093 drivers/scsi/qla2xxx/qla_edif.c

dd30706e73b70d Quinn Tran 2021-06-23  1067  =

dd30706e73b70d Quinn Tran 2021-06-23  1068  int
dd30706e73b70d Quinn Tran 2021-06-23  1069  qla24xx_sadb_update(struct bsg_=
job *bsg_job)
dd30706e73b70d Quinn Tran 2021-06-23  1070  {
dd30706e73b70d Quinn Tran 2021-06-23  1071  	struct	fc_bsg_reply	*bsg_reply=
 =3D bsg_job->reply;
dd30706e73b70d Quinn Tran 2021-06-23  1072  	struct Scsi_Host *host =3D fc_=
bsg_to_shost(bsg_job);
dd30706e73b70d Quinn Tran 2021-06-23  1073  	scsi_qla_host_t *vha =3D shost=
_priv(host);
dd30706e73b70d Quinn Tran 2021-06-23  1074  	fc_port_t		*fcport =3D NULL;
dd30706e73b70d Quinn Tran 2021-06-23  1075  	srb_t			*sp =3D NULL;
dd30706e73b70d Quinn Tran 2021-06-23  1076  	struct edif_list_entry *edif_e=
ntry =3D NULL;
dd30706e73b70d Quinn Tran 2021-06-23  1077  	int			found =3D 0;
dd30706e73b70d Quinn Tran 2021-06-23  1078  	int			rval =3D 0;
dd30706e73b70d Quinn Tran 2021-06-23  1079  	int result =3D 0;
dd30706e73b70d Quinn Tran 2021-06-23  1080  	struct qla_sa_update_frame sa_=
frame;
dd30706e73b70d Quinn Tran 2021-06-23  1081  	struct srb_iocb *iocb_cmd;
dd30706e73b70d Quinn Tran 2021-06-23  1082  =

dd30706e73b70d Quinn Tran 2021-06-23  1083  	ql_dbg(ql_dbg_edif + ql_dbg_ve=
rbose, vha, 0x911d,
dd30706e73b70d Quinn Tran 2021-06-23  1084  	    "%s entered, vha: 0x%p\n",=
 __func__, vha);
dd30706e73b70d Quinn Tran 2021-06-23  1085  =

dd30706e73b70d Quinn Tran 2021-06-23  1086  	sg_copy_to_buffer(bsg_job->req=
uest_payload.sg_list,
dd30706e73b70d Quinn Tran 2021-06-23  1087  	    bsg_job->request_payload.s=
g_cnt, &sa_frame,
dd30706e73b70d Quinn Tran 2021-06-23  1088  	    sizeof(struct qla_sa_updat=
e_frame));
dd30706e73b70d Quinn Tran 2021-06-23  1089  =

dd30706e73b70d Quinn Tran 2021-06-23  1090  	/* Check if host is online */
dd30706e73b70d Quinn Tran 2021-06-23  1091  	if (!vha->flags.online) {
dd30706e73b70d Quinn Tran 2021-06-23  1092  		ql_log(ql_log_warn, vha, 0x70=
a1, "Host is not online\n");
dd30706e73b70d Quinn Tran 2021-06-23 @1093  		rval =3D -EIO;
dd30706e73b70d Quinn Tran 2021-06-23  1094  		SET_DID_STATUS(bsg_reply->res=
ult, DID_ERROR);
dd30706e73b70d Quinn Tran 2021-06-23  1095  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1096  	}
dd30706e73b70d Quinn Tran 2021-06-23  1097  =

dd30706e73b70d Quinn Tran 2021-06-23  1098  	if (vha->e_dbell.db_flags !=3D=
 EDB_ACTIVE) {
dd30706e73b70d Quinn Tran 2021-06-23  1099  		ql_log(ql_log_warn, vha, 0x70=
a1, "App not started\n");
dd30706e73b70d Quinn Tran 2021-06-23  1100  		rval =3D -EIO;
dd30706e73b70d Quinn Tran 2021-06-23  1101  		SET_DID_STATUS(bsg_reply->res=
ult, DID_ERROR);
dd30706e73b70d Quinn Tran 2021-06-23  1102  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1103  	}
dd30706e73b70d Quinn Tran 2021-06-23  1104  =

dd30706e73b70d Quinn Tran 2021-06-23  1105  	fcport =3D qla2x00_find_fcport=
_by_pid(vha, &sa_frame.port_id);
dd30706e73b70d Quinn Tran 2021-06-23  1106  	if (fcport) {
dd30706e73b70d Quinn Tran 2021-06-23  1107  		found =3D 1;
dd30706e73b70d Quinn Tran 2021-06-23  1108  		if (sa_frame.flags =3D=3D QLA=
_SA_UPDATE_FLAGS_TX_KEY)
dd30706e73b70d Quinn Tran 2021-06-23  1109  			fcport->edif.tx_bytes =3D 0;
dd30706e73b70d Quinn Tran 2021-06-23  1110  		if (sa_frame.flags =3D=3D QLA=
_SA_UPDATE_FLAGS_RX_KEY)
dd30706e73b70d Quinn Tran 2021-06-23  1111  			fcport->edif.rx_bytes =3D 0;
dd30706e73b70d Quinn Tran 2021-06-23  1112  	}
dd30706e73b70d Quinn Tran 2021-06-23  1113  =

dd30706e73b70d Quinn Tran 2021-06-23  1114  	if (!found) {
dd30706e73b70d Quinn Tran 2021-06-23  1115  		ql_dbg(ql_dbg_edif, vha, 0x70=
a3, "Failed to find port=3D %06x\n",
dd30706e73b70d Quinn Tran 2021-06-23  1116  		    sa_frame.port_id.b24);
dd30706e73b70d Quinn Tran 2021-06-23  1117  		rval =3D -EINVAL;
dd30706e73b70d Quinn Tran 2021-06-23  1118  		SET_DID_STATUS(bsg_reply->res=
ult, DID_TARGET_FAILURE);
dd30706e73b70d Quinn Tran 2021-06-23  1119  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1120  	}
dd30706e73b70d Quinn Tran 2021-06-23  1121  =

dd30706e73b70d Quinn Tran 2021-06-23  1122  	/* make sure the nport_handle =
is valid */
dd30706e73b70d Quinn Tran 2021-06-23  1123  	if (fcport->loop_id =3D=3D FC_=
NO_LOOP_ID) {
dd30706e73b70d Quinn Tran 2021-06-23  1124  		ql_dbg(ql_dbg_edif, vha, 0x70=
e1,
dd30706e73b70d Quinn Tran 2021-06-23  1125  		    "%s: %8phN lid=3DFC_NO_LO=
OP_ID, spi: 0x%x, DS %d, returning NO_CONNECT\n",
dd30706e73b70d Quinn Tran 2021-06-23  1126  		    __func__, fcport->port_na=
me, sa_frame.spi,
dd30706e73b70d Quinn Tran 2021-06-23  1127  		    fcport->disc_state);
dd30706e73b70d Quinn Tran 2021-06-23  1128  		rval =3D -EINVAL;
dd30706e73b70d Quinn Tran 2021-06-23  1129  		SET_DID_STATUS(bsg_reply->res=
ult, DID_NO_CONNECT);
dd30706e73b70d Quinn Tran 2021-06-23  1130  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1131  	}
dd30706e73b70d Quinn Tran 2021-06-23  1132  =

dd30706e73b70d Quinn Tran 2021-06-23  1133  	/* allocate and queue an sa_ct=
l */
dd30706e73b70d Quinn Tran 2021-06-23  1134  	result =3D qla24xx_check_sadb_=
avail_slot(bsg_job, fcport, &sa_frame);
dd30706e73b70d Quinn Tran 2021-06-23  1135  =

dd30706e73b70d Quinn Tran 2021-06-23  1136  	/* failure of bsg */
dd30706e73b70d Quinn Tran 2021-06-23  1137  	if (result =3D=3D INVALID_EDIF=
_SA_INDEX) {
dd30706e73b70d Quinn Tran 2021-06-23  1138  		ql_dbg(ql_dbg_edif, vha, 0x70=
e1,
dd30706e73b70d Quinn Tran 2021-06-23  1139  		    "%s: %8phN, skipping upda=
te.\n",
dd30706e73b70d Quinn Tran 2021-06-23  1140  		    __func__, fcport->port_na=
me);
dd30706e73b70d Quinn Tran 2021-06-23  1141  		rval =3D -EINVAL;
dd30706e73b70d Quinn Tran 2021-06-23  1142  		SET_DID_STATUS(bsg_reply->res=
ult, DID_ERROR);
dd30706e73b70d Quinn Tran 2021-06-23  1143  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1144  =

dd30706e73b70d Quinn Tran 2021-06-23  1145  	/* rx delete failure */
dd30706e73b70d Quinn Tran 2021-06-23  1146  	} else if (result =3D=3D RX_DE=
LETE_NO_EDIF_SA_INDEX) {
dd30706e73b70d Quinn Tran 2021-06-23  1147  		ql_dbg(ql_dbg_edif, vha, 0x70=
e1,
dd30706e73b70d Quinn Tran 2021-06-23  1148  		    "%s: %8phN, skipping rx d=
elete.\n",
dd30706e73b70d Quinn Tran 2021-06-23  1149  		    __func__, fcport->port_na=
me);
dd30706e73b70d Quinn Tran 2021-06-23  1150  		SET_DID_STATUS(bsg_reply->res=
ult, DID_OK);
dd30706e73b70d Quinn Tran 2021-06-23  1151  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1152  	}
dd30706e73b70d Quinn Tran 2021-06-23  1153  =

dd30706e73b70d Quinn Tran 2021-06-23  1154  	ql_dbg(ql_dbg_edif, vha, 0x70e=
1,
dd30706e73b70d Quinn Tran 2021-06-23  1155  	    "%s: %8phN, sa_index in sa=
_frame: %d flags %xh\n",
dd30706e73b70d Quinn Tran 2021-06-23  1156  	    __func__, fcport->port_nam=
e, sa_frame.fast_sa_index,
dd30706e73b70d Quinn Tran 2021-06-23  1157  	    sa_frame.flags);
dd30706e73b70d Quinn Tran 2021-06-23  1158  =

dd30706e73b70d Quinn Tran 2021-06-23  1159  	/* looking for rx index and de=
lete */
dd30706e73b70d Quinn Tran 2021-06-23  1160  	if (((sa_frame.flags & SAU_FLG=
_TX) =3D=3D 0) &&
dd30706e73b70d Quinn Tran 2021-06-23  1161  	    (sa_frame.flags & SAU_FLG_=
INV)) {
dd30706e73b70d Quinn Tran 2021-06-23  1162  		uint16_t nport_handle =3D fcp=
ort->loop_id;
dd30706e73b70d Quinn Tran 2021-06-23  1163  		uint16_t sa_index =3D sa_fram=
e.fast_sa_index;
dd30706e73b70d Quinn Tran 2021-06-23  1164  =

dd30706e73b70d Quinn Tran 2021-06-23  1165  		/*
dd30706e73b70d Quinn Tran 2021-06-23  1166  		 * make sure we have an exist=
ing rx key, otherwise just process
dd30706e73b70d Quinn Tran 2021-06-23  1167  		 * this as a straight delete =
just like TX
dd30706e73b70d Quinn Tran 2021-06-23  1168  		 * This is NOT a normal case,=
 it indicates an error recovery or key cleanup
dd30706e73b70d Quinn Tran 2021-06-23  1169  		 * by the ipsec code above us.
dd30706e73b70d Quinn Tran 2021-06-23  1170  		 */
dd30706e73b70d Quinn Tran 2021-06-23  1171  		edif_entry =3D qla_edif_list_=
find_sa_index(fcport, fcport->loop_id);
dd30706e73b70d Quinn Tran 2021-06-23  1172  		if (!edif_entry) {
dd30706e73b70d Quinn Tran 2021-06-23  1173  			ql_dbg(ql_dbg_edif, vha, 0x9=
11d,
dd30706e73b70d Quinn Tran 2021-06-23  1174  			    "%s: WARNING: no active =
sa_index for nport_handle 0x%x, forcing delete for sa_index 0x%x\n",
dd30706e73b70d Quinn Tran 2021-06-23  1175  			    __func__, fcport->loop_i=
d, sa_index);
dd30706e73b70d Quinn Tran 2021-06-23  1176  			goto force_rx_delete;
dd30706e73b70d Quinn Tran 2021-06-23  1177  		}
dd30706e73b70d Quinn Tran 2021-06-23  1178  =

dd30706e73b70d Quinn Tran 2021-06-23  1179  		/*
dd30706e73b70d Quinn Tran 2021-06-23  1180  		 * if we have a forced delete=
 for rx, remove the sa_index from the edif list
dd30706e73b70d Quinn Tran 2021-06-23  1181  		 * and proceed with normal de=
lete.  The rx delay timer should not be running
dd30706e73b70d Quinn Tran 2021-06-23  1182  		 */
dd30706e73b70d Quinn Tran 2021-06-23  1183  		if ((sa_frame.flags & SAU_FLG=
_FORCE_DELETE) =3D=3D SAU_FLG_FORCE_DELETE) {
dd30706e73b70d Quinn Tran 2021-06-23  1184  			qla_edif_list_delete_sa_inde=
x(fcport, edif_entry);
dd30706e73b70d Quinn Tran 2021-06-23  1185  			ql_dbg(ql_dbg_edif, vha, 0x9=
11d,
dd30706e73b70d Quinn Tran 2021-06-23  1186  			    "%s: FORCE DELETE flag f=
ound for nport_handle 0x%x, sa_index 0x%x, forcing DELETE\n",
dd30706e73b70d Quinn Tran 2021-06-23  1187  			    __func__, fcport->loop_i=
d, sa_index);
dd30706e73b70d Quinn Tran 2021-06-23  1188  			kfree(edif_entry);
dd30706e73b70d Quinn Tran 2021-06-23  1189  			goto force_rx_delete;
dd30706e73b70d Quinn Tran 2021-06-23  1190  		}
dd30706e73b70d Quinn Tran 2021-06-23  1191  =

dd30706e73b70d Quinn Tran 2021-06-23  1192  		/*
dd30706e73b70d Quinn Tran 2021-06-23  1193  		 * delayed rx delete
dd30706e73b70d Quinn Tran 2021-06-23  1194  		 *
dd30706e73b70d Quinn Tran 2021-06-23  1195  		 * if delete_sa_index is not =
invalid then there is already
dd30706e73b70d Quinn Tran 2021-06-23  1196  		 * a delayed index in progres=
s, return bsg bad status
dd30706e73b70d Quinn Tran 2021-06-23  1197  		 */
dd30706e73b70d Quinn Tran 2021-06-23  1198  		if (edif_entry->delete_sa_ind=
ex !=3D INVALID_EDIF_SA_INDEX) {
dd30706e73b70d Quinn Tran 2021-06-23  1199  			struct edif_sa_ctl *sa_ctl;
dd30706e73b70d Quinn Tran 2021-06-23  1200  =

dd30706e73b70d Quinn Tran 2021-06-23  1201  			ql_dbg(ql_dbg_edif, vha, 0x9=
11d,
dd30706e73b70d Quinn Tran 2021-06-23  1202  			    "%s: delete for lid 0x%x=
, delete_sa_index %d is pending\n",
dd30706e73b70d Quinn Tran 2021-06-23  1203  			    __func__, edif_entry->ha=
ndle, edif_entry->delete_sa_index);
dd30706e73b70d Quinn Tran 2021-06-23  1204  =

dd30706e73b70d Quinn Tran 2021-06-23  1205  			/* free up the sa_ctl that w=
as allocated with the sa_index */
dd30706e73b70d Quinn Tran 2021-06-23  1206  			sa_ctl =3D qla_edif_find_sa_=
ctl_by_index(fcport, sa_index,
dd30706e73b70d Quinn Tran 2021-06-23  1207  			    (sa_frame.flags & SAU_FL=
G_TX));
dd30706e73b70d Quinn Tran 2021-06-23  1208  			if (sa_ctl) {
dd30706e73b70d Quinn Tran 2021-06-23  1209  				ql_dbg(ql_dbg_edif, vha, 0x=
3063,
dd30706e73b70d Quinn Tran 2021-06-23  1210  				    "%s: freeing sa_ctl for=
 index %d\n",
dd30706e73b70d Quinn Tran 2021-06-23  1211  				    __func__, sa_ctl->index=
);
dd30706e73b70d Quinn Tran 2021-06-23  1212  				qla_edif_free_sa_ctl(fcport=
, sa_ctl, sa_ctl->index);
dd30706e73b70d Quinn Tran 2021-06-23  1213  			}
dd30706e73b70d Quinn Tran 2021-06-23  1214  =

dd30706e73b70d Quinn Tran 2021-06-23  1215  			/* release the sa_index */
dd30706e73b70d Quinn Tran 2021-06-23  1216  			ql_dbg(ql_dbg_edif, vha, 0x3=
063,
dd30706e73b70d Quinn Tran 2021-06-23  1217  			    "%s: freeing sa_index %d=
, nph: 0x%x\n",
dd30706e73b70d Quinn Tran 2021-06-23  1218  			    __func__, sa_index, npor=
t_handle);
dd30706e73b70d Quinn Tran 2021-06-23  1219  			qla_edif_sadb_delete_sa_inde=
x(fcport, nport_handle, sa_index);
dd30706e73b70d Quinn Tran 2021-06-23  1220  =

dd30706e73b70d Quinn Tran 2021-06-23  1221  			rval =3D -EINVAL;
dd30706e73b70d Quinn Tran 2021-06-23  1222  			SET_DID_STATUS(bsg_reply->re=
sult, DID_ERROR);
dd30706e73b70d Quinn Tran 2021-06-23  1223  			goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1224  		}
dd30706e73b70d Quinn Tran 2021-06-23  1225  =

dd30706e73b70d Quinn Tran 2021-06-23  1226  		fcport->edif.rekey_cnt++;
dd30706e73b70d Quinn Tran 2021-06-23  1227  =

dd30706e73b70d Quinn Tran 2021-06-23  1228  		/* configure and start the rx=
 delay timer */
dd30706e73b70d Quinn Tran 2021-06-23  1229  		edif_entry->fcport =3D fcport;
dd30706e73b70d Quinn Tran 2021-06-23  1230  		edif_entry->timer.expires =3D=
 jiffies + RX_DELAY_DELETE_TIMEOUT * HZ;
dd30706e73b70d Quinn Tran 2021-06-23  1231  =

dd30706e73b70d Quinn Tran 2021-06-23  1232  		ql_dbg(ql_dbg_edif, vha, 0x91=
1d,
dd30706e73b70d Quinn Tran 2021-06-23  1233  		    "%s: adding timer, entry:=
 %p, delete sa_index %d, lid 0x%x to edif_list\n",
dd30706e73b70d Quinn Tran 2021-06-23  1234  		    __func__, edif_entry, sa_=
index, nport_handle);
dd30706e73b70d Quinn Tran 2021-06-23  1235  =

dd30706e73b70d Quinn Tran 2021-06-23  1236  		/*
dd30706e73b70d Quinn Tran 2021-06-23  1237  		 * Start the timer when we qu=
eue the delayed rx delete.
dd30706e73b70d Quinn Tran 2021-06-23  1238  		 * This is an activity timer =
that goes off if we have not
dd30706e73b70d Quinn Tran 2021-06-23  1239  		 * received packets with the =
new sa_index
dd30706e73b70d Quinn Tran 2021-06-23  1240  		 */
dd30706e73b70d Quinn Tran 2021-06-23  1241  		add_timer(&edif_entry->timer);
dd30706e73b70d Quinn Tran 2021-06-23  1242  =

dd30706e73b70d Quinn Tran 2021-06-23  1243  		/*
dd30706e73b70d Quinn Tran 2021-06-23  1244  		 * sa_delete for rx key with =
an active rx key including this one
dd30706e73b70d Quinn Tran 2021-06-23  1245  		 * add the delete rx sa index=
 to the hash so we can look for it
dd30706e73b70d Quinn Tran 2021-06-23  1246  		 * in the rsp queue.  Do this=
 after making any changes to the
dd30706e73b70d Quinn Tran 2021-06-23  1247  		 * edif_entry as part of the =
rx delete.
dd30706e73b70d Quinn Tran 2021-06-23  1248  		 */
dd30706e73b70d Quinn Tran 2021-06-23  1249  =

dd30706e73b70d Quinn Tran 2021-06-23  1250  		ql_dbg(ql_dbg_edif, vha, 0x91=
1d,
dd30706e73b70d Quinn Tran 2021-06-23  1251  		    "%s: delete sa_index %d, =
lid 0x%x to edif_list. bsg done ptr %p\n",
dd30706e73b70d Quinn Tran 2021-06-23  1252  		    __func__, sa_index, nport=
_handle, bsg_job);
dd30706e73b70d Quinn Tran 2021-06-23  1253  =

dd30706e73b70d Quinn Tran 2021-06-23  1254  		edif_entry->delete_sa_index =
=3D sa_index;
dd30706e73b70d Quinn Tran 2021-06-23  1255  =

dd30706e73b70d Quinn Tran 2021-06-23  1256  		bsg_job->reply_len =3D sizeof=
(struct fc_bsg_reply);
dd30706e73b70d Quinn Tran 2021-06-23  1257  		bsg_reply->result =3D DID_OK =
<< 16;
dd30706e73b70d Quinn Tran 2021-06-23  1258  =

dd30706e73b70d Quinn Tran 2021-06-23  1259  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1260  =

dd30706e73b70d Quinn Tran 2021-06-23  1261  	/*
dd30706e73b70d Quinn Tran 2021-06-23  1262  	 * rx index and update
dd30706e73b70d Quinn Tran 2021-06-23  1263  	 * add the index to the list a=
nd continue with normal update
dd30706e73b70d Quinn Tran 2021-06-23  1264  	 */
dd30706e73b70d Quinn Tran 2021-06-23  1265  	} else if (((sa_frame.flags & =
SAU_FLG_TX) =3D=3D 0) &&
dd30706e73b70d Quinn Tran 2021-06-23  1266  	    ((sa_frame.flags & SAU_FLG=
_INV) =3D=3D 0)) {
dd30706e73b70d Quinn Tran 2021-06-23  1267  		/* sa_update for rx key */
dd30706e73b70d Quinn Tran 2021-06-23  1268  		uint32_t nport_handle =3D fcp=
ort->loop_id;
dd30706e73b70d Quinn Tran 2021-06-23  1269  		uint16_t sa_index =3D sa_fram=
e.fast_sa_index;
dd30706e73b70d Quinn Tran 2021-06-23  1270  		int result;
dd30706e73b70d Quinn Tran 2021-06-23  1271  =

dd30706e73b70d Quinn Tran 2021-06-23  1272  		/*
dd30706e73b70d Quinn Tran 2021-06-23  1273  		 * add the update rx sa index=
 to the hash so we can look for it
dd30706e73b70d Quinn Tran 2021-06-23  1274  		 * in the rsp queue and conti=
nue normally
dd30706e73b70d Quinn Tran 2021-06-23  1275  		 */
dd30706e73b70d Quinn Tran 2021-06-23  1276  =

dd30706e73b70d Quinn Tran 2021-06-23  1277  		ql_dbg(ql_dbg_edif, vha, 0x91=
1d,
dd30706e73b70d Quinn Tran 2021-06-23  1278  		    "%s:  adding update sa_in=
dex %d, lid 0x%x to edif_list\n",
dd30706e73b70d Quinn Tran 2021-06-23  1279  		    __func__, sa_index, nport=
_handle);
dd30706e73b70d Quinn Tran 2021-06-23  1280  =

dd30706e73b70d Quinn Tran 2021-06-23  1281  		result =3D qla_edif_list_add_=
sa_update_index(fcport, sa_index,
dd30706e73b70d Quinn Tran 2021-06-23  1282  		    nport_handle);
dd30706e73b70d Quinn Tran 2021-06-23  1283  		if (result) {
dd30706e73b70d Quinn Tran 2021-06-23  1284  			ql_dbg(ql_dbg_edif, vha, 0x9=
11d,
dd30706e73b70d Quinn Tran 2021-06-23  1285  			    "%s: SA_UPDATE failed to=
 add new sa index %d to list for lid 0x%x\n",
dd30706e73b70d Quinn Tran 2021-06-23  1286  			    __func__, sa_index, npor=
t_handle);
dd30706e73b70d Quinn Tran 2021-06-23  1287  		}
dd30706e73b70d Quinn Tran 2021-06-23  1288  	}
dd30706e73b70d Quinn Tran 2021-06-23  1289  	if (sa_frame.flags & SAU_FLG_G=
MAC_MODE)
dd30706e73b70d Quinn Tran 2021-06-23  1290  		fcport->edif.aes_gmac =3D 1;
dd30706e73b70d Quinn Tran 2021-06-23  1291  	else
dd30706e73b70d Quinn Tran 2021-06-23  1292  		fcport->edif.aes_gmac =3D 0;
dd30706e73b70d Quinn Tran 2021-06-23  1293  =

dd30706e73b70d Quinn Tran 2021-06-23  1294  force_rx_delete:
dd30706e73b70d Quinn Tran 2021-06-23  1295  	/*
dd30706e73b70d Quinn Tran 2021-06-23  1296  	 * sa_update for both rx and t=
x keys, sa_delete for tx key
dd30706e73b70d Quinn Tran 2021-06-23  1297  	 * immediately process the req=
uest
dd30706e73b70d Quinn Tran 2021-06-23  1298  	 */
dd30706e73b70d Quinn Tran 2021-06-23  1299  	sp =3D qla2x00_get_sp(vha, fcp=
ort, GFP_KERNEL);
dd30706e73b70d Quinn Tran 2021-06-23  1300  	if (!sp) {
dd30706e73b70d Quinn Tran 2021-06-23  1301  		rval =3D -ENOMEM;
dd30706e73b70d Quinn Tran 2021-06-23  1302  		SET_DID_STATUS(bsg_reply->res=
ult, DID_IMM_RETRY);
dd30706e73b70d Quinn Tran 2021-06-23  1303  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1304  	}
dd30706e73b70d Quinn Tran 2021-06-23  1305  =

dd30706e73b70d Quinn Tran 2021-06-23  1306  	sp->type =3D SRB_SA_UPDATE;
dd30706e73b70d Quinn Tran 2021-06-23  1307  	sp->name =3D "bsg_sa_update";
dd30706e73b70d Quinn Tran 2021-06-23  1308  	sp->u.bsg_job =3D bsg_job;
dd30706e73b70d Quinn Tran 2021-06-23  1309  	/* sp->free =3D qla2x00_bsg_sp=
_free; */
dd30706e73b70d Quinn Tran 2021-06-23  1310  	sp->free =3D qla2x00_rel_sp;
dd30706e73b70d Quinn Tran 2021-06-23  1311  	sp->done =3D qla2x00_bsg_job_d=
one;
dd30706e73b70d Quinn Tran 2021-06-23  1312  	iocb_cmd =3D &sp->u.iocb_cmd;
dd30706e73b70d Quinn Tran 2021-06-23  1313  	iocb_cmd->u.sa_update.sa_frame=
  =3D sa_frame;
dd30706e73b70d Quinn Tran 2021-06-23  1314  =

dd30706e73b70d Quinn Tran 2021-06-23  1315  	rval =3D qla2x00_start_sp(sp);
dd30706e73b70d Quinn Tran 2021-06-23  1316  	if (rval !=3D QLA_SUCCESS) {
dd30706e73b70d Quinn Tran 2021-06-23  1317  		ql_log(ql_dbg_edif, vha, 0x70=
e3,
dd30706e73b70d Quinn Tran 2021-06-23  1318  		    "qla2x00_start_sp failed=
=3D%d.\n", rval);
dd30706e73b70d Quinn Tran 2021-06-23  1319  =

dd30706e73b70d Quinn Tran 2021-06-23  1320  		qla2x00_rel_sp(sp);
dd30706e73b70d Quinn Tran 2021-06-23  1321  		rval =3D -EIO;
dd30706e73b70d Quinn Tran 2021-06-23  1322  		SET_DID_STATUS(bsg_reply->res=
ult, DID_IMM_RETRY);
dd30706e73b70d Quinn Tran 2021-06-23  1323  		goto done;
dd30706e73b70d Quinn Tran 2021-06-23  1324  	}
dd30706e73b70d Quinn Tran 2021-06-23  1325  =

dd30706e73b70d Quinn Tran 2021-06-23  1326  	ql_dbg(ql_dbg_edif, vha, 0x911=
d,
dd30706e73b70d Quinn Tran 2021-06-23  1327  	    "%s:  %s sent, hdl=3D%x, p=
ortid=3D%06x.\n",
dd30706e73b70d Quinn Tran 2021-06-23  1328  	    __func__, sp->name, sp->ha=
ndle, fcport->d_id.b24);
dd30706e73b70d Quinn Tran 2021-06-23  1329  =

dd30706e73b70d Quinn Tran 2021-06-23  1330  	fcport->edif.rekey_cnt++;
dd30706e73b70d Quinn Tran 2021-06-23  1331  	bsg_job->reply_len =3D sizeof(=
struct fc_bsg_reply);
dd30706e73b70d Quinn Tran 2021-06-23  1332  	SET_DID_STATUS(bsg_reply->resu=
lt, DID_OK);
dd30706e73b70d Quinn Tran 2021-06-23  1333  =

dd30706e73b70d Quinn Tran 2021-06-23  1334  	return 0;
dd30706e73b70d Quinn Tran 2021-06-23  1335  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4413999578506214148==--

