Content-Type: multipart/mixed; boundary="===============6740281546239378725=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 4/11] drivers/misc/habanalabs/common/device.c:1137 hl_device_reset() warn: missing error code 'rc'
Date: Tue, 23 Feb 2021 10:18:06 +0800
Message-ID: <202102231002.rnJ6llrk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6740281546239378725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   ea9bcaec82e5895e1090b36a850c119075ca590e
commit: 5755bd9a5a1212b52dbbb5864a863d5dc20c91cb [4/11] habanalabs: fail re=
set if device is not idle
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m031-20210222 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/habanalabs/common/device.c:1137 hl_device_reset() warn: missin=
g error code 'rc'

Old smatch warnings:
drivers/misc/habanalabs/common/device.c:1400 hl_device_init() warn: missing=
 error code 'rc'

vim +/rc +1137 drivers/misc/habanalabs/common/device.c

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   889  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   890  /*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   891   * hl_device_reset - reset the device
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   892   *
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   893   * @hdev: pointer to habanalabs device structure
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   894   * @hard_reset: should we do hard reset to all engines or jus=
t reset the
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   895   *              compute/dma engines
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-05-18   896   * @from_hard_reset_thread: is the caller the hard-reset thre=
ad
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   897   *
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   898   * Block future CS and wait for pending CS to be enqueued
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   899   * Call ASIC H/W fini
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   900   * Flush all completions
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   901   * Re-initialize all internal data structures
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   902   * Call ASIC H/W init, late_init
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   903   * Test queues
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   904   * Enable device
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   905   *
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   906   * Returns 0 for success or an error on failure.
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   907   */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   908  int hl_device_reset(struct hl_device *hdev, bool hard_reset,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   909  			bool from_hard_reset_thread)
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   910  {
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16   911  	u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE] =3D {0};
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   912  	int i, rc;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   913  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   914  	if (!hdev->init_done) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   915  		dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   916  			"Can't reset before initialization is done\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   917  		return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   918  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   919  =

66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-05-18   920  	if ((!hard_reset) && (!hdev->supports_soft_reset)) {
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-05-18   921  		dev_dbg(hdev->dev, "Doing hard-reset instead of soft-reset\=
n");
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-05-18   922  		hard_reset =3D true;
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-05-18   923  	}
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-05-18   924  =

adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   925  	/* Re-entry of reset thread */
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   926  	if (from_hard_reset_thread && hdev->process_kill_trial_cnt)
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   927  		goto kill_processes;
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   928  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   929  	/*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   930  	 * Prevent concurrency in this function - only one reset sho=
uld be
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   931  	 * done at any given time. Only need to perform this if we d=
idn't
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   932  	 * get from the dedicated hard reset thread
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   933  	 */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   934  	if (!from_hard_reset_thread) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   935  		/* Block future CS/VM/JOB completion operations */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   936  		rc =3D atomic_cmpxchg(&hdev->in_reset, 0, 1);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   937  		if (rc)
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   938  			return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   939  =

c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   940  		if (hard_reset) {
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   941  			/* Disable PCI access from device F/W so he won't send
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   942  			 * us additional interrupts. We disable MSI/MSI-X at
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   943  			 * the halt_engines function and we can't have the F/W
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   944  			 * sending us interrupts after that. We need to disable
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   945  			 * the access here because if the device is marked
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   946  			 * disable, the message won't be send. Also, in case
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   947  			 * of heartbeat, the device CPU is marked as disable
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   948  			 * so this message won't be sent
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   949  			 */
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   950  			if (hl_fw_send_pci_access_msg(hdev,
2f55342c5e4d3e drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-08-15   951  					CPUCP_PACKET_DISABLE_PCI_ACCESS))
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   952  				dev_warn(hdev->dev,
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   953  					"Failed to disable PCI access by F/W\n");
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   954  		}
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay     2020=
-07-05   955  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   956  		/* This also blocks future CS/VM/JOB completion operations =
*/
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   957  		hdev->disabled =3D true;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   958  =

eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30   959  		/* Flush anyone that is inside the critical section of enqu=
eue
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   960  		 * jobs to the H/W
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   961  		 */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   962  		hdev->asic_funcs->hw_queues_lock(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   963  		hdev->asic_funcs->hw_queues_unlock(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   964  =

eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30   965  		/* Flush anyone that is inside device open */
eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30   966  		mutex_lock(&hdev->fpriv_list_lock);
eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30   967  		mutex_unlock(&hdev->fpriv_list_lock);
eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30   968  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   969  		dev_err(hdev->dev, "Going to RESET device!\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   970  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   971  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   972  again:
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   973  	if ((hard_reset) && (!from_hard_reset_thread)) {
3f5398cfbf051d drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-04-06   974  		hdev->hard_reset_pending =3D true;
3f5398cfbf051d drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-04-06   975  =

adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   976  		hdev->process_kill_trial_cnt =3D 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   977  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   978  		/*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   979  		 * Because the reset function can't run from interrupt or
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   980  		 * from heartbeat work, we need to call the reset function
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   981  		 * from a dedicated work
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   982  		 */
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   983  		queue_delayed_work(hdev->device_reset_work.wq,
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08   984  			&hdev->device_reset_work.reset_work, 0);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   985  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   986  		return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   987  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   988  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   989  	if (hard_reset) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   990  		device_late_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   991  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   992  		/*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   993  		 * Now that the heartbeat thread is closed, flush processes
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   994  		 * which are sending messages to CPU
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   995  		 */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   996  		mutex_lock(&hdev->send_cpu_message_lock);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   997  		mutex_unlock(&hdev->send_cpu_message_lock);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   998  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16   999  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1000  	/*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1001  	 * Halt the engines and disable interrupts so we won't get a=
ny more
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1002  	 * completions from H/W and we won't have any accesses from =
the
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1003  	 * H/W to the host machine
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1004  	 */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1005  	hdev->asic_funcs->halt_engines(hdev, hard_reset);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1006  =

eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1007  	/* Go over all the queues, release all CS and their jobs */
eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1008  	hl_cs_rollback_all(hdev);
eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1009  =

adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1010  kill_processes:
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1011  	if (hard_reset) {
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1012  		/* Kill processes here after CS rollback. This is because t=
he
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1013  		 * process can't really exit until all its CSs are done, wh=
ich
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1014  		 * is what we do in cs rollback
4aecb05e526a42 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-22  1015  		 */
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1016  		rc =3D device_kill_open_processes(hdev, 0);
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1017  =

adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1018  		if (rc =3D=3D -EBUSY) {
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1019  			if (hdev->device_fini_pending) {
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1020  				dev_crit(hdev->dev,
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1021  					"Failed to kill all open processes, stopping hard reset\=
n");
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1022  				goto out_err;
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1023  			}
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1024  =

adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1025  			/* signal reset thread to reschedule */
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1026  			return rc;
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1027  		}
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-08  1028  =

36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman 2020=
-05-18  1029  		if (rc) {
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman 2020=
-05-18  1030  			dev_crit(hdev->dev,
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman 2020=
-05-18  1031  				"Failed to kill all open processes, stopping hard reset\n=
");
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman 2020=
-05-18  1032  			goto out_err;
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman 2020=
-05-18  1033  		}
4aecb05e526a42 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-22  1034  =

55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1035  		/* Flush the Event queue workers to make sure no other thre=
ad is
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1036  		 * reading or writing to registers during the reset
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1037  		 */
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1038  		flush_workqueue(hdev->eq_wq);
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1039  	}
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-11-17  1040  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1041  	/* Reset the H/W. It will be in idle state after this return=
s */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1042  	hdev->asic_funcs->hw_fini(hdev, hard_reset);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1043  =

0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1044  	if (hard_reset) {
9e2e8fc7d65c9c drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-09-23  1045  		/* Release kernel context */
aa6df6533b8f9e drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-01-11  1046  		if (hdev->kernel_ctx && hl_ctx_put(hdev->kernel_ctx) =3D=3D=
 1)
9e2e8fc7d65c9c drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-09-23  1047  			hdev->kernel_ctx =3D NULL;
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1048  		hl_vm_fini(hdev);
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1049  		hl_mmu_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1050  		hl_eq_reset(hdev, &hdev->event_queue);
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1051  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1052  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1053  	/* Re-initialize PI,CI to 0 in all queues (hw queue, cq) */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1054  	hl_hw_queue_reset(hdev, hard_reset);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1055  	for (i =3D 0 ; i < hdev->asic_prop.completion_queues_count ;=
 i++)
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1056  		hl_cq_reset(hdev, &hdev->completion_queue[i]);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1057  =

75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1058  	hdev->idle_busy_ts_idx =3D 0;
75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1059  	hdev->idle_busy_ts_arr[0].busy_to_idle_ts =3D ktime_set(0, 0=
);
75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1060  	hdev->idle_busy_ts_arr[0].idle_to_busy_ts =3D ktime_set(0, 0=
);
75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1061  =

75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1062  	if (hdev->cs_active_cnt)
75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1063  		dev_crit(hdev->dev, "CS active cnt %d is not 0 during reset=
\n",
75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1064  			hdev->cs_active_cnt);
75b3cb2bb08037 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-28  1065  =

eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1066  	mutex_lock(&hdev->fpriv_list_lock);
eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1067  =

027d35d0b6999c drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-04-25  1068  	/* Make sure the context switch phase will run again */
86d5307a6d3507 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1069  	if (hdev->compute_ctx) {
86d5307a6d3507 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1070  		atomic_set(&hdev->compute_ctx->thread_ctx_switch_token, 1);
86d5307a6d3507 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1071  		hdev->compute_ctx->thread_ctx_switch_wait_token =3D 0;
eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1072  	}
eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1073  =

eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1074  	mutex_unlock(&hdev->fpriv_list_lock);
eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1075  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1076  	/* Finished tear-down, starting to re-initialize */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1077  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1078  	if (hard_reset) {
a28ce422a6d926 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-28  1079  		hdev->device_cpu_disabled =3D false;
3f5398cfbf051d drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-04-06  1080  		hdev->hard_reset_pending =3D false;
a28ce422a6d926 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-28  1081  =

0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1082  		if (hdev->kernel_ctx) {
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1083  			dev_crit(hdev->dev,
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1084  				"kernel ctx was alive during hard reset, something is ter=
ribly wrong\n");
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1085  			rc =3D -EBUSY;
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1086  			goto out_err;
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1087  		}
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-03-17  1088  =

37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1089  		rc =3D hl_mmu_init(hdev);
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1090  		if (rc) {
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1091  			dev_err(hdev->dev,
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1092  				"Failed to initialize MMU S/W after hard reset\n");
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1093  			goto out_err;
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1094  		}
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-05-29  1095  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1096  		/* Allocate the kernel context */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1097  		hdev->kernel_ctx =3D kzalloc(sizeof(*hdev->kernel_ctx),
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1098  						GFP_KERNEL);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1099  		if (!hdev->kernel_ctx) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1100  			rc =3D -ENOMEM;
b000700d6db50c drivers/misc/habanalabs/common/device.c Dinghao Liu     2020=
-12-26  1101  			hl_mmu_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1102  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1103  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1104  =

86d5307a6d3507 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-07-30  1105  		hdev->compute_ctx =3D NULL;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1106  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1107  		rc =3D hl_ctx_init(hdev, hdev->kernel_ctx, true);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1108  		if (rc) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1109  			dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1110  				"failed to init kernel ctx in hard reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1111  			kfree(hdev->kernel_ctx);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1112  			hdev->kernel_ctx =3D NULL;
b000700d6db50c drivers/misc/habanalabs/common/device.c Dinghao Liu     2020=
-12-26  1113  			hl_mmu_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1114  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1115  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1116  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1117  =

8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-07-15  1118  	/* Device is now enabled as part of the initialization requi=
res
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-07-15  1119  	 * communication with the device firmware to get information=
 that
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-07-15  1120  	 * is required for the initialization itself
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-07-15  1121  	 */
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-07-15  1122  	hdev->disabled =3D false;
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-07-15  1123  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1124  	rc =3D hdev->asic_funcs->hw_init(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1125  	if (rc) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1126  		dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1127  			"failed to initialize the H/W after reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1128  		goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1129  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1130  =

5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1131  	/* If device is not idle fail the reset process */
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1132  	if (!hdev->asic_funcs->is_device_idle(hdev, idle_mask,
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1133  			HL_BUSY_ENGINES_MASK_EXT_SIZE, NULL)) {
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1134  		dev_err(hdev->dev,
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1135  			"device is not idle (mask %#llx %#llx) after reset\n",
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1136  			idle_mask[0], idle_mask[1]);
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16 @1137  		goto out_err;
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1138  	}
5755bd9a5a1212 drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-16  1139  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1140  	/* Check that the communication with the device is working */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1141  	rc =3D hdev->asic_funcs->test_queues(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1142  	if (rc) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1143  		dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1144  			"Failed to detect if device is alive after reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1145  		goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1146  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1147  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1148  	if (hard_reset) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1149  		rc =3D device_late_init(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1150  		if (rc) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1151  			dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1152  				"Failed late init after hard reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1153  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1154  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1155  =

0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1156  		rc =3D hl_vm_init(hdev);
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1157  		if (rc) {
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1158  			dev_err(hdev->dev,
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1159  				"Failed to init memory module after hard reset\n");
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1160  			goto out_err;
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1161  		}
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman 2019=
-02-16  1162  =

58361aae4b0eed drivers/misc/habanalabs/common/device.c Oded Gabbay     2020=
-08-08  1163  		hl_set_max_power(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1164  	} else {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1165  		rc =3D hdev->asic_funcs->soft_reset_late_init(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1166  		if (rc) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1167  			dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1168  				"Failed late init after soft reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1169  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1170  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1171  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1172  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1173  	atomic_set(&hdev->in_reset, 0);
66a76401c50b26 drivers/misc/habanalabs/common/device.c Ofir Bitton     2020=
-10-05  1174  	hdev->needs_reset =3D false;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1175  =

28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1176  	dev_notice(hdev->dev, "Successfully finished resetting the d=
evice\n");
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1177  =

28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1178  	if (hard_reset) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1179  		hdev->hard_reset_cnt++;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1180  =

28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1181  		/* After reset is done, we are ready to receive events from
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1182  		 * the F/W. We can't do it before because we will ignore ev=
ents
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1183  		 * and if those events are fatal, we won't know about it and
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1184  		 * the device will be operational although it shouldn't be
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1185  		 */
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1186  		hdev->asic_funcs->enable_events_from_fw(hdev);
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1187  	} else {
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1188  		hdev->soft_reset_cnt++;
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay     2021=
-02-01  1189  	}
867b58ac944557 drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-08-08  1190  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1191  	return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1192  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1193  out_err:
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1194  	hdev->disabled =3D true;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1195  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1196  	if (hard_reset) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1197  		dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1198  			"Failed to reset! Device is NOT usable\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1199  		hdev->hard_reset_cnt++;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1200  	} else {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1201  		dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1202  			"Failed to do soft-reset, trying hard reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1203  		hdev->soft_reset_cnt++;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1204  		hard_reset =3D true;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1205  		goto again;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1206  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1207  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1208  	atomic_set(&hdev->in_reset, 0);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1209  =

f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1210  	return rc;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1211  }
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay     2019=
-02-16  1212  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6740281546239378725==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6740281546239378725==--

