Content-Type: multipart/mixed; boundary="===============4810522136443592470=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_fw.c:1209 mpi3mr_issue_reset() error: uninitialized symbol 'host_diagnostic'.
Date: Tue, 15 Feb 2022 07:47:57 +0800
Message-ID: <202202150735.ENek3KKS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4810522136443592470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: b64845a7d4039ab9667bafff9d7bb59365f17c0f scsi: mpi3mr: Detect async=
 reset that occurred in firmware
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202150735.ENek3KKS-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1209 mpi3mr_issue_reset() error: uninitiali=
zed symbol 'host_diagnostic'.

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1691 mpi3mr_create_op_reply_q() error: we p=
reviously assumed 'op_reply_q->q_segments' could be null (see line 1662)
drivers/scsi/mpi3mr/mpi3mr_fw.c:1796 mpi3mr_create_op_req_q() error: we pre=
viously assumed 'op_req_q->q_segments' could be null (see line 1769)

vim +/host_diagnostic +1209 drivers/scsi/mpi3mr/mpi3mr_fw.c

824a156633dfdb Kashyap Desai   2021-05-20  1167  =

824a156633dfdb Kashyap Desai   2021-05-20  1168  /**
824a156633dfdb Kashyap Desai   2021-05-20  1169   * mpi3mr_issue_reset - Is=
sue reset to the controller
824a156633dfdb Kashyap Desai   2021-05-20  1170   * @mrioc: Adapter referen=
ce
824a156633dfdb Kashyap Desai   2021-05-20  1171   * @reset_type: Reset type
824a156633dfdb Kashyap Desai   2021-05-20  1172   * @reset_reason: Reset re=
ason code
824a156633dfdb Kashyap Desai   2021-05-20  1173   *
f061178e076210 Kashyap Desai   2021-05-20  1174   * Unlock the host diagnos=
tic registers and write the specific
f061178e076210 Kashyap Desai   2021-05-20  1175   * reset type to that, wai=
t for reset acknowledgment from the
f061178e076210 Kashyap Desai   2021-05-20  1176   * controller, if the rese=
t is not successful retry for the
f061178e076210 Kashyap Desai   2021-05-20  1177   * predefined number of ti=
mes.
824a156633dfdb Kashyap Desai   2021-05-20  1178   *
824a156633dfdb Kashyap Desai   2021-05-20  1179   * Return: 0 on success, n=
on-zero on failure.
824a156633dfdb Kashyap Desai   2021-05-20  1180   */
824a156633dfdb Kashyap Desai   2021-05-20  1181  static int mpi3mr_issue_re=
set(struct mpi3mr_ioc *mrioc, u16 reset_type,
824a156633dfdb Kashyap Desai   2021-05-20  1182  	u32 reset_reason)
824a156633dfdb Kashyap Desai   2021-05-20  1183  {
f061178e076210 Kashyap Desai   2021-05-20  1184  	int retval =3D -1;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1185  	u8 unlock_retry_count =3D=
 0;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1186  	u32 host_diagnostic, ioc_=
status, ioc_config;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1187  	u32 timeout =3D MPI3MR_RE=
SET_ACK_TIMEOUT * 10;
f061178e076210 Kashyap Desai   2021-05-20  1188  =

f061178e076210 Kashyap Desai   2021-05-20  1189  	if ((reset_type !=3D MPI3=
_SYSIF_HOST_DIAG_RESET_ACTION_SOFT_RESET) &&
f061178e076210 Kashyap Desai   2021-05-20  1190  	    (reset_type !=3D MPI3=
_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT))
b64845a7d4039a Sreekanth Reddy 2021-12-20  1191  		return retval;
f061178e076210 Kashyap Desai   2021-05-20  1192  	if (mrioc->unrecoverable)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1193  		return retval;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1194  	if (reset_reason =3D=3D M=
PI3MR_RESET_FROM_FIRMWARE) {
b64845a7d4039a Sreekanth Reddy 2021-12-20  1195  		retval =3D 0;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1196  		return retval;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1197  	}
b64845a7d4039a Sreekanth Reddy 2021-12-20  1198  =

b64845a7d4039a Sreekanth Reddy 2021-12-20  1199  	ioc_info(mrioc, "%s reset=
 due to %s(0x%x)\n",
b64845a7d4039a Sreekanth Reddy 2021-12-20  1200  	    mpi3mr_reset_type_nam=
e(reset_type),
b64845a7d4039a Sreekanth Reddy 2021-12-20  1201  	    mpi3mr_reset_rc_name(=
reset_reason), reset_reason);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1202  =

f061178e076210 Kashyap Desai   2021-05-20  1203  	mpi3mr_clear_reset_histor=
y(mrioc);
f061178e076210 Kashyap Desai   2021-05-20  1204  	do {
f061178e076210 Kashyap Desai   2021-05-20  1205  		ioc_info(mrioc,
f061178e076210 Kashyap Desai   2021-05-20  1206  		    "Write magic sequenc=
e to unlock host diag register (retry=3D%d)\n",
f061178e076210 Kashyap Desai   2021-05-20  1207  		    ++unlock_retry_count=
);
f061178e076210 Kashyap Desai   2021-05-20  1208  		if (unlock_retry_count >=
=3D MPI3MR_HOSTDIAG_UNLOCK_RETRY_COUNT) {
b64845a7d4039a Sreekanth Reddy 2021-12-20 @1209  			ioc_err(mrioc,
b64845a7d4039a Sreekanth Reddy 2021-12-20  1210  			    "%s reset failed du=
e to unlock failure, host_diagnostic(0x%08x)\n",
b64845a7d4039a Sreekanth Reddy 2021-12-20  1211  			    mpi3mr_reset_type_n=
ame(reset_type),
b64845a7d4039a Sreekanth Reddy 2021-12-20  1212  			    host_diagnostic);
f061178e076210 Kashyap Desai   2021-05-20  1213  			mrioc->unrecoverable =
=3D 1;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1214  			return retval;
f061178e076210 Kashyap Desai   2021-05-20  1215  		}
f061178e076210 Kashyap Desai   2021-05-20  1216  =

f061178e076210 Kashyap Desai   2021-05-20  1217  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_FLUSH,
f061178e076210 Kashyap Desai   2021-05-20  1218  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1219  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_1ST,
f061178e076210 Kashyap Desai   2021-05-20  1220  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1221  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_2ND,
f061178e076210 Kashyap Desai   2021-05-20  1222  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1223  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_3RD,
f061178e076210 Kashyap Desai   2021-05-20  1224  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1225  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_4TH,
f061178e076210 Kashyap Desai   2021-05-20  1226  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1227  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_5TH,
f061178e076210 Kashyap Desai   2021-05-20  1228  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1229  		writel(MPI3_SYSIF_WRITE_=
SEQUENCE_KEY_VALUE_6TH,
f061178e076210 Kashyap Desai   2021-05-20  1230  		    &mrioc->sysif_regs->=
write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1231  		usleep_range(1000, 1100);
f061178e076210 Kashyap Desai   2021-05-20  1232  		host_diagnostic =3D read=
l(&mrioc->sysif_regs->host_diagnostic);
f061178e076210 Kashyap Desai   2021-05-20  1233  		ioc_info(mrioc,
f061178e076210 Kashyap Desai   2021-05-20  1234  		    "wrote magic sequenc=
e: retry_count(%d), host_diagnostic(0x%08x)\n",
f061178e076210 Kashyap Desai   2021-05-20  1235  		    unlock_retry_count, =
host_diagnostic);
f061178e076210 Kashyap Desai   2021-05-20  1236  	} while (!(host_diagnosti=
c & MPI3_SYSIF_HOST_DIAG_DIAG_WRITE_ENABLE));
f061178e076210 Kashyap Desai   2021-05-20  1237  =

f061178e076210 Kashyap Desai   2021-05-20  1238  	writel(reset_reason, &mri=
oc->sysif_regs->scratchpad[0]);
f061178e076210 Kashyap Desai   2021-05-20  1239  	writel(host_diagnostic | =
reset_type,
f061178e076210 Kashyap Desai   2021-05-20  1240  	    &mrioc->sysif_regs->h=
ost_diagnostic);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1241  	switch (reset_type) {
b64845a7d4039a Sreekanth Reddy 2021-12-20  1242  	case MPI3_SYSIF_HOST_DIAG=
_RESET_ACTION_SOFT_RESET:
f061178e076210 Kashyap Desai   2021-05-20  1243  		do {
f061178e076210 Kashyap Desai   2021-05-20  1244  			ioc_status =3D readl(&m=
rioc->sysif_regs->ioc_status);
f061178e076210 Kashyap Desai   2021-05-20  1245  			ioc_config =3D
f061178e076210 Kashyap Desai   2021-05-20  1246  			    readl(&mrioc->sysif=
_regs->ioc_configuration);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1247  			if ((ioc_status & MPI3_=
SYSIF_IOC_STATUS_RESET_HISTORY)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1248  			    && mpi3mr_soft_rese=
t_success(ioc_status, ioc_config)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1249  			    ) {
b64845a7d4039a Sreekanth Reddy 2021-12-20  1250  				mpi3mr_clear_reset_his=
tory(mrioc);
f061178e076210 Kashyap Desai   2021-05-20  1251  				retval =3D 0;
f061178e076210 Kashyap Desai   2021-05-20  1252  				break;
f061178e076210 Kashyap Desai   2021-05-20  1253  			}
f061178e076210 Kashyap Desai   2021-05-20  1254  			msleep(100);
f061178e076210 Kashyap Desai   2021-05-20  1255  		} while (--timeout);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1256  		mpi3mr_print_fault_info(=
mrioc);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1257  		break;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1258  	case MPI3_SYSIF_HOST_DIAG=
_RESET_ACTION_DIAG_FAULT:
f061178e076210 Kashyap Desai   2021-05-20  1259  		do {
f061178e076210 Kashyap Desai   2021-05-20  1260  			ioc_status =3D readl(&m=
rioc->sysif_regs->ioc_status);
f061178e076210 Kashyap Desai   2021-05-20  1261  			if (mpi3mr_diagfault_su=
ccess(mrioc, ioc_status)) {
f061178e076210 Kashyap Desai   2021-05-20  1262  				retval =3D 0;
f061178e076210 Kashyap Desai   2021-05-20  1263  				break;
f061178e076210 Kashyap Desai   2021-05-20  1264  			}
f061178e076210 Kashyap Desai   2021-05-20  1265  			msleep(100);
f061178e076210 Kashyap Desai   2021-05-20  1266  		} while (--timeout);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1267  		break;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1268  	default:
b64845a7d4039a Sreekanth Reddy 2021-12-20  1269  		break;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1270  	}
b64845a7d4039a Sreekanth Reddy 2021-12-20  1271  =

f061178e076210 Kashyap Desai   2021-05-20  1272  	writel(MPI3_SYSIF_WRITE_S=
EQUENCE_KEY_VALUE_2ND,
f061178e076210 Kashyap Desai   2021-05-20  1273  	    &mrioc->sysif_regs->w=
rite_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1274  =

f061178e076210 Kashyap Desai   2021-05-20  1275  	ioc_config =3D readl(&mri=
oc->sysif_regs->ioc_configuration);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1276  	ioc_status =3D readl(&mri=
oc->sysif_regs->ioc_status);
f061178e076210 Kashyap Desai   2021-05-20  1277  	ioc_info(mrioc,
b64845a7d4039a Sreekanth Reddy 2021-12-20  1278  	    "ioc_status/ioc_onfig=
 after %s reset is (0x%x)/(0x%x)\n",
f061178e076210 Kashyap Desai   2021-05-20  1279  	    (!retval)?"successful=
":"failed", ioc_status,
f061178e076210 Kashyap Desai   2021-05-20  1280  	    ioc_config);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1281  	if (retval)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1282  		mrioc->unrecoverable =3D=
 1;
f061178e076210 Kashyap Desai   2021-05-20  1283  	return retval;
824a156633dfdb Kashyap Desai   2021-05-20  1284  }
824a156633dfdb Kashyap Desai   2021-05-20  1285  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4810522136443592470==--

