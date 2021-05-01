Content-Type: multipart/mixed; boundary="===============3820031764230882663=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:next 9/12] drivers/misc/habanalabs/common/firmware_if.c:1369 hl_fw_static_init_cpu() warn: missing error code 'rc'
Date: Sat, 01 May 2021 08:46:36 +0800
Message-ID: <202105010828.SOMje1xq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3820031764230882663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ohad Sharabi <osharabi@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git n=
ext
head:   ce97151d0dfd690a0db33e6bcdde9db7c39ecb27
commit: 08cd6811265925e075a52e639e017b87dc91cb65 [9/12] habanalabs: dynamic=
 fw load reset protocol
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20210430 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/firmware_if.c:1369 hl_fw_static_init_cpu() w=
arn: missing error code 'rc'

vim +/rc +1369 drivers/misc/habanalabs/common/firmware_if.c

08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1248  =

08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1249  /**
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1250   * hl_fw_static_init_cpu - initialize the device CPU usi=
ng static protocol
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1251   *
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1252   * @hdev: pointer to the habanalabs device structure
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1253   * @fw_loader: managing structure for loading device's FW
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1254   *
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1255   * @return 0 on success, otherwise non-zero error code
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1256   */
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1257  static int hl_fw_static_init_cpu(struct hl_device *hdev,
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1258  					struct fw_load_mgr *fw_loader)
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1259  {
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1260  	u32 cpu_msg_status_reg, cpu_timeout, msg_to_cpu_reg, st=
atus;
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1261  	u32 cpu_boot_status_reg, cpu_security_boot_status_reg;
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1262  	struct asic_fixed_properties *prop =3D &hdev->asic_prop;
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1263  	struct static_fw_load_mgr *static_loader;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1264  	int rc;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1265  =

6a2f5d7098c868 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2021-02-15  1266  	if (!(hdev->fw_components & FW_TYPE_BOOT_CPU))
596553dbf9b235 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-10-01  1267  		return 0;
596553dbf9b235 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-10-01  1268  =

08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1269  	/* init common loader parameters */
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1270  	static_loader =3D &fw_loader->static_loader;
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1271  	cpu_msg_status_reg =3D fw_loader->cpu_cmd_status_to_hos=
t_reg;
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1272  	msg_to_cpu_reg =3D fw_loader->kmd_msg_to_cpu_reg;
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1273  	cpu_timeout =3D fw_loader->cpu_timeout;
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1274  =

08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1275  	/* init static loader parameters */
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1276  	cpu_security_boot_status_reg =3D static_loader->cpu_boo=
t_status_reg;
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1277  	cpu_boot_status_reg =3D static_loader->cpu_boot_status_=
reg;
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1278  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1279  	dev_info(hdev->dev, "Going to wait for device boot (up =
to %lds)\n",
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1280  		cpu_timeout / USEC_PER_SEC);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1281  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1282  	/* Wait for boot FIT request */
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1283  	rc =3D hl_poll_timeout(
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1284  		hdev,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1285  		cpu_boot_status_reg,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1286  		status,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1287  		status =3D=3D CPU_BOOT_STATUS_WAITING_FOR_BOOT_FIT,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1288  		10000,
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1289  		fw_loader->boot_fit_timeout);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1290  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1291  	if (rc) {
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1292  		dev_dbg(hdev->dev,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1293  			"No boot fit request received, resuming boot\n");
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1294  	} else {
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1295  		rc =3D hdev->asic_funcs->load_boot_fit_to_device(hdev);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1296  		if (rc)
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1297  			goto out;
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1298  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1299  		/* Clear device CPU message status */
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1300  		WREG32(cpu_msg_status_reg, CPU_MSG_CLR);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1301  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1302  		/* Signal device CPU that boot loader is ready */
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1303  		WREG32(msg_to_cpu_reg, KMD_MSG_FIT_RDY);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1304  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1305  		/* Poll for CPU device ack */
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1306  		rc =3D hl_poll_timeout(
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1307  			hdev,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1308  			cpu_msg_status_reg,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1309  			status,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1310  			status =3D=3D CPU_MSG_OK,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1311  			10000,
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1312  			fw_loader->boot_fit_timeout);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1313  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1314  		if (rc) {
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1315  			dev_err(hdev->dev,
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1316  				"Timeout waiting for boot fit load ack\n");
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1317  			goto out;
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1318  		}
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1319  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1320  		/* Clear message */
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1321  		WREG32(msg_to_cpu_reg, KMD_MSG_NA);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1322  	}
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1323  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1324  	/* Make sure CPU boot-loader is running */
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1325  	rc =3D hl_poll_timeout(
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1326  		hdev,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1327  		cpu_boot_status_reg,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1328  		status,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1329  		(status =3D=3D CPU_BOOT_STATUS_DRAM_RDY) ||
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1330  		(status =3D=3D CPU_BOOT_STATUS_NIC_FW_RDY) ||
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1331  		(status =3D=3D CPU_BOOT_STATUS_READY_TO_BOOT) ||
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1332  		(status =3D=3D CPU_BOOT_STATUS_SRAM_AVAIL),
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1333  		10000,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1334  		cpu_timeout);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1335  =

596553dbf9b235 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-10-01  1336  	dev_dbg(hdev->dev, "uboot status =3D %d\n", status);
596553dbf9b235 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-10-01  1337  =

57799ce9f85c23 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-09-13  1338  	/* Read U-Boot version now in case we will later fail */
15fa3dcdbcd5cc drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1339  	hl_read_device_fw_version(hdev, FW_COMP_BOOT_FIT);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1340  =

6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1341  	/* Clear reset status since we need to read it again fr=
om boot CPU */
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1342  	prop->hard_reset_done_by_fw =3D false;
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1343  =

323b726706be3b drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-10-04  1344  	/* Read boot_cpu security bits */
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1345  	if (prop->fw_security_status_valid) {
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1346  		prop->fw_boot_cpu_security_map =3D
323b726706be3b drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-10-04  1347  				RREG32(cpu_security_boot_status_reg);
323b726706be3b drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-10-04  1348  =

6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1349  		if (prop->fw_boot_cpu_security_map &
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1350  				CPU_BOOT_DEV_STS0_FW_HARD_RST_EN)
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1351  			prop->hard_reset_done_by_fw =3D true;
2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1352  =

2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1353  		dev_dbg(hdev->dev,
2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1354  			"Firmware boot CPU security status %#x\n",
2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1355  			prop->fw_boot_cpu_security_map);
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1356  	}
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1357  =

6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1358  	dev_dbg(hdev->dev, "Firmware boot CPU hard-reset is %s\=
n",
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1359  			prop->hard_reset_done_by_fw ? "enabled" : "disabled");
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1360  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1361  	if (rc) {
57799ce9f85c23 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-09-13  1362  		detect_cpu_boot_status(hdev, status);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1363  		rc =3D -EIO;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1364  		goto out;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1365  	}
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1366  =

6a2f5d7098c868 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2021-02-15  1367  	if (!(hdev->fw_components & FW_TYPE_LINUX)) {
596553dbf9b235 drivers/misc/habanalabs/common/firmware_if.c Oded Gabbay    =
 2020-10-01  1368  		dev_info(hdev->dev, "Skip loading Linux F/W\n");
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26 @1369  		goto out;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1370  	}
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1371  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1372  	if (status =3D=3D CPU_BOOT_STATUS_SRAM_AVAIL)
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1373  		goto out;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1374  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1375  	dev_info(hdev->dev,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1376  		"Loading firmware to device, may take some time...\n");
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1377  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1378  	rc =3D hdev->asic_funcs->load_firmware_to_device(hdev);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1379  	if (rc)
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1380  		goto out;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1381  =

5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1382  	if (fw_loader->skip_bmc) {
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1383  		WREG32(msg_to_cpu_reg, KMD_MSG_SKIP_BMC);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1384  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1385  		rc =3D hl_poll_timeout(
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1386  			hdev,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1387  			cpu_boot_status_reg,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1388  			status,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1389  			(status =3D=3D CPU_BOOT_STATUS_BMC_WAITING_SKIPPED),
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1390  			10000,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1391  			cpu_timeout);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1392  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1393  		if (rc) {
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1394  			dev_err(hdev->dev,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1395  				"Failed to get ACK on skipping BMC, %d\n",
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1396  				status);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1397  			WREG32(msg_to_cpu_reg, KMD_MSG_NA);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1398  			rc =3D -EIO;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1399  			goto out;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1400  		}
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1401  	}
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1402  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1403  	WREG32(msg_to_cpu_reg, KMD_MSG_FIT_RDY);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1404  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1405  	rc =3D hl_poll_timeout(
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1406  		hdev,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1407  		cpu_boot_status_reg,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1408  		status,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1409  		(status =3D=3D CPU_BOOT_STATUS_SRAM_AVAIL),
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1410  		10000,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1411  		cpu_timeout);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1412  =

47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1413  	/* Clear message */
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1414  	WREG32(msg_to_cpu_reg, KMD_MSG_NA);
47f6b41cddf849 drivers/misc/habanalabs/firmware_if.c        Ofir Bitton    =
 2020-04-16  1415  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1416  	if (rc) {
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1417  		if (status =3D=3D CPU_BOOT_STATUS_FIT_CORRUPTED)
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1418  			dev_err(hdev->dev,
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1419  				"Device reports FIT image is corrupted\n");
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1420  		else
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1421  			dev_err(hdev->dev,
917b79b0967174 drivers/misc/habanalabs/firmware_if.c        Omer Shpigelman=
 2020-07-04  1422  				"Failed to load firmware to device, %d\n",
917b79b0967174 drivers/misc/habanalabs/firmware_if.c        Omer Shpigelman=
 2020-07-04  1423  				status);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1424  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1425  		rc =3D -EIO;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1426  		goto out;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1427  	}
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1428  =

08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1429  	rc =3D fw_read_errors(hdev, fw_loader->static_loader.bo=
ot_err0_reg,
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1430  					cpu_security_boot_status_reg);
edb07cb69caacb drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-27  1431  	if (rc)
edb07cb69caacb drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-27  1432  		return rc;
edb07cb69caacb drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-27  1433  =

6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1434  	/* Clear reset status since we need to read again from =
app */
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1435  	prop->hard_reset_done_by_fw =3D false;
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1436  =

323b726706be3b drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-10-04  1437  	/* Read FW application security bits */
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1438  	if (prop->fw_security_status_valid) {
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1439  		prop->fw_app_security_map =3D
323b726706be3b drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-10-04  1440  				RREG32(cpu_security_boot_status_reg);
323b726706be3b drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-10-04  1441  =

6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1442  		if (prop->fw_app_security_map &
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1443  				CPU_BOOT_DEV_STS0_FW_HARD_RST_EN)
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1444  			prop->hard_reset_done_by_fw =3D true;
2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1445  =

2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1446  		dev_dbg(hdev->dev,
2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1447  			"Firmware application CPU security status %#x\n",
2e368560080cf0 drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-16  1448  			prop->fw_app_security_map);
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1449  	}
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1450  =

6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1451  	dev_dbg(hdev->dev, "Firmware application CPU hard-reset=
 is %s\n",
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1452  			prop->hard_reset_done_by_fw ? "enabled" : "disabled");
6bbb77b9e6f0bd drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-06  1453  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1454  	dev_info(hdev->dev, "Successfully loaded firmware to de=
vice\n");
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1455  =

edb07cb69caacb drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-27  1456  	return 0;
edb07cb69caacb drivers/misc/habanalabs/common/firmware_if.c Ofir Bitton    =
 2020-12-27  1457  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1458  out:
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1459  	fw_read_errors(hdev, fw_loader->static_loader.boot_err0=
_reg,
5e4993046d4d73 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-11  1460  					cpu_security_boot_status_reg);
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1461  =

7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1462  	return rc;
7e1c07dd352509 drivers/misc/habanalabs/firmware_if.c        Oded Gabbay    =
 2020-03-26  1463  }
08cd6811265925 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi   =
 2021-04-08  1464  =


:::::: The code at line 1369 was first introduced by commit
:::::: 7e1c07dd35250971cd29c60c786ac676179eb7f9 habanalabs: unify and impro=
ve device cpu init

:::::: TO: Oded Gabbay <oded.gabbay@gmail.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3820031764230882663==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
En9jvAi7j93YsC0uHbJL7TYH4O/Qkx5wBfgu9S3+5ev5j8e79/MvTs2ac770cXT+voS3zspBZkgb
jJVn7hymyTvzaRt+DG1+eHteLKbLX4NfTHQMR4Q83SbjOS3YY+Z+zJyY4xDcgnUEtUhCT8WL6aWK
OZcXSmLa3FiYwIvxNsZ0S7EwE38zZ/wLvUXEGepaJEvP15fUWpDiPM4TVgW88o0Ssc5ItInzCW0i
sL241NqFp+VBOPVNEKACu1eRiDNONjI/FfAtCO26OgT3gmLinYntENxLiImf8Q2Z8+AlD6bOkATD
2aUTgimt8rrMFm3NwPYUhslg4Goz08N24DjFFIt2ixQG5Ip9zQssPVFdRk3miYrXE93WWZ6zSoyO
ZBOlualZ6+Egrl5zrcug4XzWqJ5it88arqgcCavNFkmzr68zM/s5IvbN2lj0SU70NfDTzb9gyoy4
CzjpoWyPRBVL5DHlWXK+//mKjylO9pvr9JYwnbeYhuRmn2JqC83Wd/dPWgvgtGFKkawGcYlGBMQU
1cAPYRU8b6akKYZk+HibbEF6S2tpJWAyv2m8R0kL88mITZ8ohUjImoRVJisUFX/keSJjNuLmyCNb
zutYYlTXbaM6SXfQ9L3MTVPdtpgvJY4a6l/lkHFSDUiqKOspjZipJYuQe8aSBczzNs0rU4HCojFD
2/bTL7+9/f7w9NvPt/Prj+ev51+/nx9fzq/9Nd7xmMMYRsYuyUXx6Re0xf/6/J+nf/119+PuX4/P
d19fHp7+9Xb3xxka/vD1Xxi77Ruun3/9/vLHL2pJXZ9fn86PV9/vXr+e5TvmsLSUpcn5x/Mrhn17
QKPKh/++084BvcibNdgpENd3pRUGAVEYPAOH2Miy51FtKGJUSnlpOyMXvkkd2t+j3o/K3ka9lIMr
G+1ZlYT8+tfL+/PV/fPr+er59UrNhxFkShJD9zYkrBMBhy48JZkJBqBLKq7jrNqaq8dCuEW2kXlU
GUCXtCaJZHoYS2gw8VbDvS2JfI2/riqX+rqq3BqQIXdJh0RNLJymd1Aoz/MeLdgmmZCniEzf5VS/
WQfhotjnDmK3z3kg15JK/utvi/yHWR/7ZgvnLlOhJ3dat1Cyos+bVv38/fHh/td/n/+6upcL+9vr
3cv3v8wXl27C+aQ0Cpm46ys1o5/1sGTLNBfAlyoHuT8hiRx0Nwp3GcAheEjD6TRYXkBhVOWu/9HP
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
WQAyHZ4aN4UGv0uDPBsqsOf/fbMaDpooAgA=
--===============3820031764230882663==--

