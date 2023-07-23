Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7A373
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 06:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690094568; x=1721630568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tlk2WkCR43Fcnq6gtnZDYBDx32WmafNKrc0c5M3B44w=;
  b=BJlCjqfzVHHDqp+rO29RrHeoC0380tt3S6NuKEFhexSZzqmqfPp+tZMv
   e6wj6rdorXkrJFry3IXA2j+Pwk2PgUs7Yt2ZFheq+aO3uiudnN0cVrSNP
   O4vUSvYWoSNcpON1pPQ4NJQFBhuzktR5JyBLwKYWt/TImSJu70G4JO7Fl
   oP3420JgheBQ8vmzcYZUy/pPTxsVPrsOKsFJLEBKwBNQxnX86ARl0Fsod
   IYA6sswxQ4hDEV+Lk2uscZZCNUkR0nnNdtqEQzU0fRh0uo2XbEKM7yOts
   g4hkrtRwSAuiW3IpX+yk1/PESPuXz6TTj9X3ztkGPts1gAkU5CpmhFhFa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="453630150"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="453630150"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 23:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="971892759"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="971892759"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2023 23:42:45 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNSng-0008tR-1o;
	Sun, 23 Jul 2023 06:42:42 +0000
Date: Sun, 23 Jul 2023 14:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/accel/habanalabs/common/device.c:1571 hl_device_reset()
 warn: missing unwind goto?
Message-ID: <202307231407.xOg3ydJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
commit: e65e175b07bef5974045cc42238de99057669ca7 habanalabs: move driver to accel subsystem
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231407.xOg3ydJk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231407.xOg3ydJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307231407.xOg3ydJk-lkp@intel.com/

smatch warnings:
drivers/accel/habanalabs/common/device.c:1571 hl_device_reset() warn: missing unwind goto?

vim +1571 drivers/accel/habanalabs/common/device.c

10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1408  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1409  /*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1410   * hl_device_reset - reset the device
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1411   *
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1412   * @hdev: pointer to habanalabs device structure
e42a6400fb3810 drivers/misc/habanalabs/common/device.c Ohad Sharabi     2021-02-17  1413   * @flags: reset flags.
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1414   *
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1415   * Block future CS and wait for pending CS to be enqueued
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1416   * Call ASIC H/W fini
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1417   * Flush all completions
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1418   * Re-initialize all internal data structures
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1419   * Call ASIC H/W init, late_init
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1420   * Test queues
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1421   * Enable device
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1422   *
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1423   * Returns 0 for success or an error on failure.
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1424   */
e42a6400fb3810 drivers/misc/habanalabs/common/device.c Ohad Sharabi     2021-02-17  1425  int hl_device_reset(struct hl_device *hdev, u32 flags)
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1426  {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1427  	bool hard_reset, from_hard_reset_thread, fw_reset, hard_instead_soft = false,
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1428  			reset_upon_device_release = false, schedule_hard_reset = false, delay_reset,
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1429  			from_dev_release, from_watchdog_thread;
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1430  	u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE] = {0};
4337b50b5fe5ee drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1431  	struct hl_ctx *ctx;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1432  	int i, rc;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1433  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1434  	if (!hdev->init_done) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1435  		dev_err(hdev->dev, "Can't reset before initialization is done\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1436  		return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1437  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1438  
234caa52736b8d drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-09-16  1439  	hard_reset = !!(flags & HL_DRV_RESET_HARD);
234caa52736b8d drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-09-16  1440  	from_hard_reset_thread = !!(flags & HL_DRV_RESET_FROM_RESET_THR);
234caa52736b8d drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-09-16  1441  	fw_reset = !!(flags & HL_DRV_RESET_BYPASS_REQ_TO_FW);
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1442  	from_dev_release = !!(flags & HL_DRV_RESET_DEV_RELEASE);
b0106bc6fe5a99 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-02-23  1443  	delay_reset = !!(flags & HL_DRV_RESET_DELAY);
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1444  	from_watchdog_thread = !!(flags & HL_DRV_RESET_FROM_WD_THR);
e42a6400fb3810 drivers/misc/habanalabs/common/device.c Ohad Sharabi     2021-02-17  1445  
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1446  	if (!hard_reset && !hdev->asic_prop.supports_compute_reset) {
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1447  		hard_instead_soft = true;
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay      2020-05-18  1448  		hard_reset = true;
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay      2020-05-18  1449  	}
66446820df1864 drivers/misc/habanalabs/device.c        Oded Gabbay      2020-05-18  1450  
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1451  	if (hdev->reset_upon_device_release && (flags & HL_DRV_RESET_DEV_RELEASE)) {
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1452  		if (hard_reset) {
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1453  			dev_crit(hdev->dev,
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1454  				"Aborting reset because hard-reset is mutually exclusive with reset-on-device-release\n");
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1455  			return -EINVAL;
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1456  		}
ab440d3e39f610 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-15  1457  
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1458  		reset_upon_device_release = true;
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1459  
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1460  		goto do_reset;
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1461  	}
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1462  
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1463  	if (!hard_reset && !hdev->asic_prop.allow_inference_soft_reset) {
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1464  		hard_instead_soft = true;
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1465  		hard_reset = true;
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1466  	}
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1467  
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1468  	if (hard_instead_soft)
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1469  		dev_dbg(hdev->dev, "Doing hard-reset instead of compute reset\n");
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1470  
23bace677a3d92 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-06-08  1471  do_reset:
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1472  	/* Re-entry of reset thread */
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1473  	if (from_hard_reset_thread && hdev->process_kill_trial_cnt)
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1474  		goto kill_processes;
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1475  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1476  	/*
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1477  	 * Prevent concurrency in this function - only one reset should be
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1478  	 * done at any given time. Only need to perform this if we didn't
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1479  	 * get from the dedicated hard reset thread
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1480  	 */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1481  	if (!from_hard_reset_thread) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1482  		/* Block future CS/VM/JOB completion operations */
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1483  		spin_lock(&hdev->reset_info.lock);
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1484  		if (hdev->reset_info.in_reset) {
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1485  			/* We only allow scheduling of a hard reset during compute reset */
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1486  			if (hard_reset && hdev->reset_info.in_compute_reset)
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1487  				hdev->reset_info.hard_reset_schedule_flags = flags;
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1488  			spin_unlock(&hdev->reset_info.lock);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1489  			return 0;
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1490  		}
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1491  
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1492  		/* This still allows the completion of some KDMA ops
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1493  		 * Update this before in_reset because in_compute_reset implies we are in reset
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1494  		 */
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1495  		hdev->reset_info.in_compute_reset = !hard_reset;
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1496  
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1497  		hdev->reset_info.in_reset = 1;
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1498  
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1499  		spin_unlock(&hdev->reset_info.lock);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1500  
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1501  		/* Cancel the device release watchdog work if required.
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1502  		 * In case of reset-upon-device-release while the release watchdog work is
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1503  		 * scheduled, do hard-reset instead of compute-reset.
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1504  		 */
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1505  		if ((hard_reset || from_dev_release) && hdev->reset_info.watchdog_active) {
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1506  			hdev->reset_info.watchdog_active = 0;
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1507  			if (!from_watchdog_thread)
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1508  				cancel_delayed_work_sync(
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1509  						&hdev->device_release_watchdog_work.reset_work);
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1510  
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1511  			if (from_dev_release) {
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1512  				flags |= HL_DRV_RESET_HARD;
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1513  				flags &= ~HL_DRV_RESET_DEV_RELEASE;
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1514  				hard_reset = true;
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1515  			}
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1516  		}
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1517  
b0106bc6fe5a99 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-02-23  1518  		if (delay_reset)
b0106bc6fe5a99 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-02-23  1519  			usleep_range(HL_RESET_DELAY_USEC, HL_RESET_DELAY_USEC << 1);
b0106bc6fe5a99 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-02-23  1520  
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1521  		handle_reset_trigger(hdev, flags);
c83c4171933bc4 drivers/misc/habanalabs/device.c        Oded Gabbay      2020-07-05  1522  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1523  		/* This also blocks future CS/VM/JOB completion operations */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1524  		hdev->disabled = true;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1525  
b07e6c7ef5c7a0 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-07-01  1526  		take_release_locks(hdev);
eb7caf84b02938 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-07-30  1527  
1282dbbd292e95 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-09-30  1528  		if (hard_reset)
1282dbbd292e95 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-09-30  1529  			dev_info(hdev->dev, "Going to reset device\n");
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1530  		else if (reset_upon_device_release)
c82b025f2b8cf3 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-04-02  1531  			dev_dbg(hdev->dev, "Going to reset device after release by user\n");
1282dbbd292e95 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-09-30  1532  		else
c82b025f2b8cf3 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-04-02  1533  			dev_dbg(hdev->dev, "Going to reset engines of inference device\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1534  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1535  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1536  again:
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1537  	if ((hard_reset) && (!from_hard_reset_thread)) {
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1538  		hdev->reset_info.hard_reset_pending = true;
3f5398cfbf051d drivers/misc/habanalabs/device.c        Oded Gabbay      2019-04-06  1539  
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1540  		hdev->process_kill_trial_cnt = 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1541  
d214636be8a610 drivers/misc/habanalabs/common/device.c Tomer Tayar      2021-11-22  1542  		hdev->device_reset_work.flags = flags;
8d9aa980beb866 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-08-09  1543  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1544  		/*
3e0ca9fab10bc0 drivers/misc/habanalabs/common/device.c Koby Elbaz       2021-05-04  1545  		 * Because the reset function can't run from heartbeat work,
3e0ca9fab10bc0 drivers/misc/habanalabs/common/device.c Koby Elbaz       2021-05-04  1546  		 * we need to call the reset function from a dedicated work.
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1547  		 */
1eebb259290b1b drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1548  		queue_delayed_work(hdev->reset_wq, &hdev->device_reset_work.reset_work, 0);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1549  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1550  		return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1551  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1552  
a88a6f5f5cdfce drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-30  1553  	cleanup_resources(hdev, hard_reset, fw_reset, from_dev_release);
ab5f5c3089a2c9 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-01-12  1554  
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1555  kill_processes:
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1556  	if (hard_reset) {
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1557  		/* Kill processes here after CS rollback. This is because the
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1558  		 * process can't really exit until all its CSs are done, which
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1559  		 * is what we do in cs rollback
4aecb05e526a42 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-07-22  1560  		 */
707c1252868d88 drivers/misc/habanalabs/common/device.c Dani Liberman    2021-12-08  1561  		rc = device_kill_open_processes(hdev, 0, false);
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1562  
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1563  		if (rc == -EBUSY) {
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1564  			if (hdev->device_fini_pending) {
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1565  				dev_crit(hdev->dev,
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1566  					"Failed to kill all open processes, stopping hard reset\n");
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1567  				goto out_err;
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1568  			}
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1569  
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1570  			/* signal reset thread to reschedule */
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08 @1571  			return rc;
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1572  		}
adb51298fdc41b drivers/misc/habanalabs/common/device.c Ofir Bitton      2020-10-08  1573  
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman  2020-05-18  1574  		if (rc) {
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman  2020-05-18  1575  			dev_crit(hdev->dev,
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman  2020-05-18  1576  				"Failed to kill all open processes, stopping hard reset\n");
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman  2020-05-18  1577  			goto out_err;
36fafe87edd636 drivers/misc/habanalabs/device.c        Omer Shpigelman  2020-05-18  1578  		}
4aecb05e526a42 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-07-22  1579  
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1580  		/* Flush the Event queue workers to make sure no other thread is
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1581  		 * reading or writing to registers during the reset
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1582  		 */
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1583  		flush_workqueue(hdev->eq_wq);
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1584  	}
55f6d680970ea9 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-11-17  1585  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1586  	/* Reset the H/W. It will be in idle state after this returns */
8d9aa980beb866 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-08-09  1587  	hdev->asic_funcs->hw_fini(hdev, hard_reset, fw_reset);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1588  
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1589  	if (hard_reset) {
8f82ff75dfd27a drivers/misc/habanalabs/common/device.c Ohad Sharabi     2021-10-21  1590  		hdev->fw_loader.fw_comp_loaded = FW_TYPE_NONE;
a9623a8b3ae67d drivers/misc/habanalabs/common/device.c Tomer Tayar      2021-07-09  1591  
9e2e8fc7d65c9c drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-09-23  1592  		/* Release kernel context */
aa6df6533b8f9e drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-01-11  1593  		if (hdev->kernel_ctx && hl_ctx_put(hdev->kernel_ctx) == 1)
9e2e8fc7d65c9c drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-09-23  1594  			hdev->kernel_ctx = NULL;
a9623a8b3ae67d drivers/misc/habanalabs/common/device.c Tomer Tayar      2021-07-09  1595  
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1596  		hl_vm_fini(hdev);
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1597  		hl_mmu_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1598  		hl_eq_reset(hdev, &hdev->event_queue);
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1599  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1600  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1601  	/* Re-initialize PI,CI to 0 in all queues (hw queue, cq) */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1602  	hl_hw_queue_reset(hdev, hard_reset);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1603  	for (i = 0 ; i < hdev->asic_prop.completion_queues_count ; i++)
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1604  		hl_cq_reset(hdev, &hdev->completion_queue[i]);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1605  
027d35d0b6999c drivers/misc/habanalabs/device.c        Oded Gabbay      2019-04-25  1606  	/* Make sure the context switch phase will run again */
4337b50b5fe5ee drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1607  	ctx = hl_get_compute_ctx(hdev);
4337b50b5fe5ee drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1608  	if (ctx) {
4337b50b5fe5ee drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1609  		atomic_set(&ctx->thread_ctx_switch_token, 1);
4337b50b5fe5ee drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1610  		ctx->thread_ctx_switch_wait_token = 0;
4337b50b5fe5ee drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1611  		hl_ctx_put(ctx);
eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1612  	}
eff6f4a0e70b7b drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1613  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1614  	/* Finished tear-down, starting to re-initialize */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1615  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1616  	if (hard_reset) {
a28ce422a6d926 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-28  1617  		hdev->device_cpu_disabled = false;
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1618  		hdev->reset_info.hard_reset_pending = false;
a28ce422a6d926 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-28  1619  
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1620  		if (hdev->reset_info.reset_trigger_repeated &&
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1621  				(hdev->reset_info.prev_reset_trigger ==
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1622  						HL_DRV_RESET_FW_FATAL_ERR)) {
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1623  			/* if there 2 back to back resets from FW,
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1624  			 * ensure driver puts the driver in a unusable state
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1625  			 */
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1626  			dev_crit(hdev->dev,
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1627  				"Consecutive FW fatal errors received, stopping hard reset\n");
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1628  			rc = -EIO;
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1629  			goto out_err;
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1630  		}
10cab81d1cf92b drivers/misc/habanalabs/common/device.c Bharat Jauhari   2021-06-21  1631  
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1632  		if (hdev->kernel_ctx) {
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1633  			dev_crit(hdev->dev,
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1634  				"kernel ctx was alive during hard reset, something is terribly wrong\n");
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1635  			rc = -EBUSY;
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1636  			goto out_err;
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1637  		}
0878a42086e0a6 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-03-17  1638  
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1639  		rc = hl_mmu_init(hdev);
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1640  		if (rc) {
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1641  			dev_err(hdev->dev,
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1642  				"Failed to initialize MMU S/W after hard reset\n");
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1643  			goto out_err;
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1644  		}
37d68ce5274fac drivers/misc/habanalabs/device.c        Oded Gabbay      2019-05-29  1645  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1646  		/* Allocate the kernel context */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1647  		hdev->kernel_ctx = kzalloc(sizeof(*hdev->kernel_ctx),
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1648  						GFP_KERNEL);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1649  		if (!hdev->kernel_ctx) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1650  			rc = -ENOMEM;
b000700d6db50c drivers/misc/habanalabs/common/device.c Dinghao Liu      2020-12-26  1651  			hl_mmu_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1652  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1653  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1654  
5b90e59d55d94a drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-30  1655  		hdev->is_compute_ctx_active = false;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1656  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1657  		rc = hl_ctx_init(hdev, hdev->kernel_ctx, true);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1658  		if (rc) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1659  			dev_err(hdev->dev,
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1660  				"failed to init kernel ctx in hard reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1661  			kfree(hdev->kernel_ctx);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1662  			hdev->kernel_ctx = NULL;
b000700d6db50c drivers/misc/habanalabs/common/device.c Dinghao Liu      2020-12-26  1663  			hl_mmu_fini(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1664  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1665  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1666  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1667  
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-07-15  1668  	/* Device is now enabled as part of the initialization requires
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-07-15  1669  	 * communication with the device firmware to get information that
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-07-15  1670  	 * is required for the initialization itself
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-07-15  1671  	 */
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-07-15  1672  	hdev->disabled = false;
8df8cb1efc1962 drivers/misc/habanalabs/common/device.c Oded Gabbay      2020-07-15  1673  
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1674  	/* F/W security enabled indication might be updated after hard-reset */
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1675  	if (hard_reset) {
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1676  		rc = hl_fw_read_preboot_status(hdev);
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1677  		if (rc)
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1678  			goto out_err;
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1679  	}
a0fc8688c00317 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-09-01  1680  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1681  	rc = hdev->asic_funcs->hw_init(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1682  	if (rc) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1683  		dev_err(hdev->dev, "failed to initialize the H/W after reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1684  		goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1685  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1686  
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1687  	/* If device is not idle fail the reset process */
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1688  	if (!hdev->asic_funcs->is_device_idle(hdev, idle_mask,
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1689  						HL_BUSY_ENGINES_MASK_EXT_SIZE, NULL)) {
1b18cf33d6ce63 drivers/misc/habanalabs/common/device.c Tomer Tayar      2022-11-17  1690  		print_idle_status_mask(hdev, "device is not idle after reset", idle_mask);
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1691  		rc = -EIO;
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1692  		goto out_err;
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1693  	}
23c3efd1fb0eb1 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-16  1694  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1695  	/* Check that the communication with the device is working */
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1696  	rc = hdev->asic_funcs->test_queues(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1697  	if (rc) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1698  		dev_err(hdev->dev, "Failed to detect if device is alive after reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1699  		goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1700  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1701  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1702  	if (hard_reset) {
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1703  		rc = device_late_init(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1704  		if (rc) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1705  			dev_err(hdev->dev, "Failed late init after hard reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1706  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1707  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1708  
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1709  		rc = hl_vm_init(hdev);
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1710  		if (rc) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1711  			dev_err(hdev->dev, "Failed to init memory module after hard reset\n");
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1712  			goto out_err;
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1713  		}
0feaf86d4e6950 drivers/misc/habanalabs/device.c        Omer Shpigelman  2019-02-16  1714  
cc81c0f3b03e28 drivers/misc/habanalabs/common/device.c Ofir Bitton      2022-06-30  1715  		if (!hdev->asic_prop.fw_security_enabled)
092a31c5266282 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-01-08  1716  			hl_fw_set_max_power(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1717  	} else {
bc9b271e6c92b5 drivers/misc/habanalabs/common/device.c Ofir Bitton      2022-07-13  1718  		rc = hdev->asic_funcs->compute_reset_late_init(hdev);
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1719  		if (rc) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1720  			if (reset_upon_device_release)
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1721  				dev_err(hdev->dev,
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1722  					"Failed late init in reset after device release\n");
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1723  			else
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1724  				dev_err(hdev->dev, "Failed late init after compute reset\n");
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1725  			goto out_err;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1726  		}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1727  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1728  
605e1ef3d58c34 drivers/misc/habanalabs/common/device.c Dafna Hirschfeld 2022-05-12  1729  	rc = hdev->asic_funcs->scrub_device_mem(hdev);
605e1ef3d58c34 drivers/misc/habanalabs/common/device.c Dafna Hirschfeld 2022-05-12  1730  	if (rc) {
605e1ef3d58c34 drivers/misc/habanalabs/common/device.c Dafna Hirschfeld 2022-05-12  1731  		dev_err(hdev->dev, "scrub mem failed from device reset (%d)\n", rc);
605e1ef3d58c34 drivers/misc/habanalabs/common/device.c Dafna Hirschfeld 2022-05-12  1732  		return rc;
605e1ef3d58c34 drivers/misc/habanalabs/common/device.c Dafna Hirschfeld 2022-05-12  1733  	}
605e1ef3d58c34 drivers/misc/habanalabs/common/device.c Dafna Hirschfeld 2022-05-12  1734  
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1735  	spin_lock(&hdev->reset_info.lock);
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1736  	hdev->reset_info.in_compute_reset = 0;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1737  
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1738  	/* Schedule hard reset only if requested and if not already in hard reset.
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1739  	 * We keep 'in_reset' enabled, so no other reset can go in during the hard
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1740  	 * reset schedule
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1741  	 */
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1742  	if (!hard_reset && hdev->reset_info.hard_reset_schedule_flags)
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1743  		schedule_hard_reset = true;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1744  	else
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1745  		hdev->reset_info.in_reset = 0;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1746  
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1747  	spin_unlock(&hdev->reset_info.lock);
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1748  
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1749  	hdev->reset_info.needs_reset = false;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1750  
c82b025f2b8cf3 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-04-02  1751  	if (hard_reset)
c82b025f2b8cf3 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-04-02  1752  		dev_info(hdev->dev, "Successfully finished resetting the device\n");
c82b025f2b8cf3 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-04-02  1753  	else
c82b025f2b8cf3 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-04-02  1754  		dev_dbg(hdev->dev, "Successfully finished resetting the device\n");
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1755  
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1756  	if (hard_reset) {
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1757  		hdev->reset_info.hard_reset_cnt++;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1758  
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1759  		/* After reset is done, we are ready to receive events from
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1760  		 * the F/W. We can't do it before because we will ignore events
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1761  		 * and if those events are fatal, we won't know about it and
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1762  		 * the device will be operational although it shouldn't be
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1763  		 */
28bcf1fdc408cd drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-02-01  1764  		hdev->asic_funcs->enable_events_from_fw(hdev);
f69c3e460a614c drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-11-10  1765  	} else {
f69c3e460a614c drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-11-10  1766  		if (!reset_upon_device_release)
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1767  			hdev->reset_info.compute_reset_cnt++;
867b58ac944557 drivers/misc/habanalabs/device.c        Oded Gabbay      2019-08-08  1768  
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1769  		if (schedule_hard_reset) {
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1770  			dev_info(hdev->dev, "Performing hard reset scheduled during compute reset\n");
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1771  			flags = hdev->reset_info.hard_reset_schedule_flags;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1772  			hdev->reset_info.hard_reset_schedule_flags = 0;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1773  			hdev->disabled = true;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1774  			hard_reset = true;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1775  			handle_reset_trigger(hdev, flags);
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1776  			goto again;
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1777  		}
f69c3e460a614c drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-11-10  1778  	}
ce80098db2439e drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1779  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1780  	return 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1781  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1782  out_err:
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1783  	hdev->disabled = true;
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1784  
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1785  	spin_lock(&hdev->reset_info.lock);
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1786  	hdev->reset_info.in_compute_reset = 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1787  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1788  	if (hard_reset) {
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1789  		dev_err(hdev->dev, "Failed to reset! Device is NOT usable\n");
eb135291912f75 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1790  		hdev->reset_info.hard_reset_cnt++;
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1791  	} else if (reset_upon_device_release) {
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1792  		spin_unlock(&hdev->reset_info.lock);
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1793  		dev_err(hdev->dev, "Failed to reset device after user release\n");
15f8eb190573aa drivers/misc/habanalabs/common/device.c Dani Liberman    2022-01-11  1794  		flags |= HL_DRV_RESET_HARD;
15f8eb190573aa drivers/misc/habanalabs/common/device.c Dani Liberman    2022-01-11  1795  		flags &= ~HL_DRV_RESET_DEV_RELEASE;
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1796  		hard_reset = true;
60e0431f41fff9 drivers/misc/habanalabs/common/device.c Oded Gabbay      2021-11-16  1797  		goto again;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1798  	} else {
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1799  		spin_unlock(&hdev->reset_info.lock);
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1800  		dev_err(hdev->dev, "Failed to do compute reset\n");
0b0ae024402954 drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1801  		hdev->reset_info.compute_reset_cnt++;
15f8eb190573aa drivers/misc/habanalabs/common/device.c Dani Liberman    2022-01-11  1802  		flags |= HL_DRV_RESET_HARD;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1803  		hard_reset = true;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1804  		goto again;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1805  	}
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1806  
42eb2872e08676 drivers/misc/habanalabs/common/device.c Ofir Bitton      2021-11-23  1807  	hdev->reset_info.in_reset = 0;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1808  
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1809  	spin_unlock(&hdev->reset_info.lock);
bd4a338886a8cc drivers/misc/habanalabs/common/device.c Oded Gabbay      2022-07-07  1810  
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1811  	return rc;
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1812  }
f8c8c7d5f1b0ea drivers/misc/habanalabs/device.c        Oded Gabbay      2019-02-16  1813  

:::::: The code at line 1571 was first introduced by commit
:::::: adb51298fdc41b89f47c520171d86e4859cc7731 habanalabs: improve hard reset procedure

:::::: TO: Ofir Bitton <obitton@habana.ai>
:::::: CC: Oded Gabbay <ogabbay@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
