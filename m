Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30CC18B04
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726421757; cv=none; b=fB3rZUATvqPscD/Foqjeys856cEIc26EUW1ULmjk2PjxPyTvcORf2jTJ8/HDaKrYctufM7YiwKPTLEb4AufQfydTUDgDopFsH7hyao6cE1pWkVhR5qg/aGHtbuA+9/jEO2ZLjEC2ta0w553N90/usq544RKXNvwFrDYUhqLJ83c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726421757; c=relaxed/simple;
	bh=gkVueb2wqLddjd2pacA2c4Tvw1O1W1NvuKllY1uEJPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIQkEW+ysSYEK0YblG8fnWriQIvp5zueaC1nL9I5Frnk83OuUl4QorfQzUrYmRCWPTZ16MYzCeAqQD8/FrdI4ISXQFvgQVhvAXUtli8+TAqyZN+l67IEuZRY7F2cno/o35dAGW7mmg4FLFV8K+EHGxr0t7p6eOVhFarXa2Nhp8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vf0iP671; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vf0iP671"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726421755; x=1757957755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkVueb2wqLddjd2pacA2c4Tvw1O1W1NvuKllY1uEJPQ=;
  b=Vf0iP671AosJtcFdwXWBlm2phWgUOqodPiBCpqCTo0KtyVs+t08pyWWj
   ugWlJ8ZPIyP5hZVbsgzAng721lcy8ER2eaMH0/WArIhUsuiTS25QXSmW9
   vH9c5qLwIHgMHju1CDWhh6zdbzsKpcDa6xxrIPmEWR8fSX3XyHcYf6xpK
   LhTs/KNEnbNKH2OprIZ8J7aSmchUmd5xObQ0DEmWRdMF1xVLNb7tgwNzc
   ET0qxuD0BRBmjBif0X5kVmiEtvQ91R58R7k2+He5s8U7z2139hB0n9N/6
   MXIc3QCURuPvsjB/7nCZb1tjSUUX64Rp8MgStK2DuuzQOpm3+ObgluBk5
   w==;
X-CSE-ConnectionGUID: bO8E/N2MRMypCkNerYAzyQ==
X-CSE-MsgGUID: YUIEei43Q9uzIoCbcV5qsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24797836"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="24797836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 10:35:54 -0700
X-CSE-ConnectionGUID: 6XoHUx3TSjWcLNP+4o1B9Q==
X-CSE-MsgGUID: K6/ry11KQnitswzRemJrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68284808"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2024 10:35:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sptA7-0008sk-0Q;
	Sun, 15 Sep 2024 17:35:51 +0000
Date: Mon, 16 Sep 2024 01:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11826/11962] drivers/scsi/mpi3mr/mpi3mr_fw.c:1497
 mpi3mr_bring_ioc_ready() error: uninitialized symbol 'start_time'.
Message-ID: <202409160309.ENK2OYP3-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ranjan Kumar <ranjan.kumar@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Prayas Patel <prayas.patel@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
commit: 9634bb07083cfae38933d4e944709e06e4c30e74 [11826/11962] scsi: mpi3mr: Enhance the Enable Controller retry logic
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-r073-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160309.ENK2OYP3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409160309.ENK2OYP3-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1497 mpi3mr_bring_ioc_ready() error: uninitialized symbol 'start_time'.

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1616 mpi3mr_issue_reset() error: uninitialized symbol 'host_diagnostic'.
drivers/scsi/mpi3mr/mpi3mr_fw.c:2132 mpi3mr_create_op_reply_q() error: we previously assumed 'op_reply_q->q_segments' could be null (see line 2085)
drivers/scsi/mpi3mr/mpi3mr_fw.c:2240 mpi3mr_create_op_req_q() error: we previously assumed 'op_req_q->q_segments' could be null (see line 2213)

vim +/start_time +1497 drivers/scsi/mpi3mr/mpi3mr_fw.c

c5758fc72b9256 Sreekanth Reddy 2021-12-20  1349  
824a156633dfdb Kashyap Desai   2021-05-20  1350  /**
824a156633dfdb Kashyap Desai   2021-05-20  1351   * mpi3mr_bring_ioc_ready - Bring controller to ready state
824a156633dfdb Kashyap Desai   2021-05-20  1352   * @mrioc: Adapter instance reference
824a156633dfdb Kashyap Desai   2021-05-20  1353   *
824a156633dfdb Kashyap Desai   2021-05-20  1354   * Set Enable IOC bit in IOC configuration register and wait for
824a156633dfdb Kashyap Desai   2021-05-20  1355   * the controller to become ready.
824a156633dfdb Kashyap Desai   2021-05-20  1356   *
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1357   * Return: 0 on success, appropriate error on failure.
824a156633dfdb Kashyap Desai   2021-05-20  1358   */
824a156633dfdb Kashyap Desai   2021-05-20  1359  static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
824a156633dfdb Kashyap Desai   2021-05-20  1360  {
0a319f1629495d Ranjan Kumar    2023-02-28  1361  	u32 ioc_config, ioc_status, timeout, host_diagnostic;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1362  	int retval = 0;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1363  	enum mpi3mr_iocstate ioc_state;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1364  	u64 base_info;
9634bb07083cfa Ranjan Kumar    2024-09-05  1365  	u8 retry = 0;
9634bb07083cfa Ranjan Kumar    2024-09-05  1366  	u64 start_time, elapsed_time_sec;
9634bb07083cfa Ranjan Kumar    2024-09-05  1367  
9634bb07083cfa Ranjan Kumar    2024-09-05  1368  retry_bring_ioc_ready:
824a156633dfdb Kashyap Desai   2021-05-20  1369  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1370  	ioc_status = readl(&mrioc->sysif_regs->ioc_status);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1371  	ioc_config = readl(&mrioc->sysif_regs->ioc_configuration);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1372  	base_info = lo_hi_readq(&mrioc->sysif_regs->ioc_information);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1373  	ioc_info(mrioc, "ioc_status(0x%08x), ioc_config(0x%08x), ioc_info(0x%016llx) at the bringup\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1374  	    ioc_status, ioc_config, base_info);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1375  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1376  	/*The timeout value is in 2sec unit, changing it to seconds*/
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1377  	mrioc->ready_timeout =
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1378  	    ((base_info & MPI3_SYSIF_IOC_INFO_LOW_TIMEOUT_MASK) >>
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1379  	    MPI3_SYSIF_IOC_INFO_LOW_TIMEOUT_SHIFT) * 2;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1380  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1381  	ioc_info(mrioc, "ready timeout: %d seconds\n", mrioc->ready_timeout);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1382  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1383  	ioc_state = mpi3mr_get_iocstate(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1384  	ioc_info(mrioc, "controller is in %s state during detection\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1385  	    mpi3mr_iocstate_name(ioc_state));
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1386  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1387  	if (ioc_state == MRIOC_STATE_BECOMING_READY ||
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1388  	    ioc_state == MRIOC_STATE_RESET_REQUESTED) {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1389  		timeout = mrioc->ready_timeout * 10;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1390  		do {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1391  			msleep(100);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1392  		} while (--timeout);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1393  
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1394  		if (!pci_device_is_present(mrioc->pdev)) {
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1395  			mrioc->unrecoverable = 1;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1396  			ioc_err(mrioc,
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1397  			    "controller is not present while waiting to reset\n");
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1398  			retval = -1;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1399  			goto out_device_not_present;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1400  		}
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1401  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1402  		ioc_state = mpi3mr_get_iocstate(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1403  		ioc_info(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1404  		    "controller is in %s state after waiting to reset\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1405  		    mpi3mr_iocstate_name(ioc_state));
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1406  	}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1407  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1408  	if (ioc_state == MRIOC_STATE_READY) {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1409  		ioc_info(mrioc, "issuing message unit reset (MUR) to bring to reset state\n");
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1410  		retval = mpi3mr_issue_and_process_mur(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1411  		    MPI3MR_RESET_FROM_BRINGUP);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1412  		ioc_state = mpi3mr_get_iocstate(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1413  		if (retval)
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1414  			ioc_err(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1415  			    "message unit reset failed with error %d current state %s\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1416  			    retval, mpi3mr_iocstate_name(ioc_state));
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1417  	}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1418  	if (ioc_state != MRIOC_STATE_RESET) {
0a319f1629495d Ranjan Kumar    2023-02-28  1419  		if (ioc_state == MRIOC_STATE_FAULT) {
0a319f1629495d Ranjan Kumar    2023-02-28  1420  			timeout = MPI3_SYSIF_DIAG_SAVE_TIMEOUT * 10;
0a319f1629495d Ranjan Kumar    2023-02-28  1421  			mpi3mr_print_fault_info(mrioc);
0a319f1629495d Ranjan Kumar    2023-02-28  1422  			do {
0a319f1629495d Ranjan Kumar    2023-02-28  1423  				host_diagnostic =
0a319f1629495d Ranjan Kumar    2023-02-28  1424  					readl(&mrioc->sysif_regs->host_diagnostic);
0a319f1629495d Ranjan Kumar    2023-02-28  1425  				if (!(host_diagnostic &
0a319f1629495d Ranjan Kumar    2023-02-28  1426  				      MPI3_SYSIF_HOST_DIAG_SAVE_IN_PROGRESS))
0a319f1629495d Ranjan Kumar    2023-02-28  1427  					break;
0a319f1629495d Ranjan Kumar    2023-02-28  1428  				if (!pci_device_is_present(mrioc->pdev)) {
0a319f1629495d Ranjan Kumar    2023-02-28  1429  					mrioc->unrecoverable = 1;
0a319f1629495d Ranjan Kumar    2023-02-28  1430  					ioc_err(mrioc, "controller is not present at the bringup\n");
0a319f1629495d Ranjan Kumar    2023-02-28  1431  					goto out_device_not_present;
0a319f1629495d Ranjan Kumar    2023-02-28  1432  				}
0a319f1629495d Ranjan Kumar    2023-02-28  1433  				msleep(100);
0a319f1629495d Ranjan Kumar    2023-02-28  1434  			} while (--timeout);
0a319f1629495d Ranjan Kumar    2023-02-28  1435  		}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1436  		mpi3mr_print_fault_info(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1437  		ioc_info(mrioc, "issuing soft reset to bring to reset state\n");
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1438  		retval = mpi3mr_issue_reset(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1439  		    MPI3_SYSIF_HOST_DIAG_RESET_ACTION_SOFT_RESET,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1440  		    MPI3MR_RESET_FROM_BRINGUP);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1441  		if (retval) {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1442  			ioc_err(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1443  			    "soft reset failed with error %d\n", retval);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1444  			goto out_failed;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1445  		}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1446  	}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1447  	ioc_state = mpi3mr_get_iocstate(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1448  	if (ioc_state != MRIOC_STATE_RESET) {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1449  		ioc_err(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1450  		    "cannot bring controller to reset state, current state: %s\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1451  		    mpi3mr_iocstate_name(ioc_state));
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1452  		goto out_failed;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1453  	}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1454  	mpi3mr_clear_reset_history(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1455  	retval = mpi3mr_setup_admin_qpair(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1456  	if (retval) {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1457  		ioc_err(mrioc, "failed to setup admin queues: error %d\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1458  		    retval);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1459  		goto out_failed;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1460  	}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1461  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1462  	ioc_info(mrioc, "bringing controller to ready state\n");
824a156633dfdb Kashyap Desai   2021-05-20  1463  	ioc_config = readl(&mrioc->sysif_regs->ioc_configuration);
824a156633dfdb Kashyap Desai   2021-05-20  1464  	ioc_config |= MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC;
824a156633dfdb Kashyap Desai   2021-05-20  1465  	writel(ioc_config, &mrioc->sysif_regs->ioc_configuration);
824a156633dfdb Kashyap Desai   2021-05-20  1466  
9634bb07083cfa Ranjan Kumar    2024-09-05  1467  	if (retry == 0)
9634bb07083cfa Ranjan Kumar    2024-09-05  1468  		start_time = jiffies;
9634bb07083cfa Ranjan Kumar    2024-09-05  1469  
824a156633dfdb Kashyap Desai   2021-05-20  1470  	timeout = mrioc->ready_timeout * 10;
824a156633dfdb Kashyap Desai   2021-05-20  1471  	do {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1472  		ioc_state = mpi3mr_get_iocstate(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1473  		if (ioc_state == MRIOC_STATE_READY) {
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1474  			ioc_info(mrioc,
5867b8569e6480 Colin Ian King  2021-12-24  1475  			    "successfully transitioned to %s state\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1476  			    mpi3mr_iocstate_name(ioc_state));
824a156633dfdb Kashyap Desai   2021-05-20  1477  			return 0;
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1478  		}
9634bb07083cfa Ranjan Kumar    2024-09-05  1479  		ioc_status = readl(&mrioc->sysif_regs->ioc_status);
9634bb07083cfa Ranjan Kumar    2024-09-05  1480  		if ((ioc_status & MPI3_SYSIF_IOC_STATUS_RESET_HISTORY) ||
9634bb07083cfa Ranjan Kumar    2024-09-05  1481  		    (ioc_status & MPI3_SYSIF_IOC_STATUS_FAULT)) {
9634bb07083cfa Ranjan Kumar    2024-09-05  1482  			mpi3mr_print_fault_info(mrioc);
9634bb07083cfa Ranjan Kumar    2024-09-05  1483  			goto out_failed;
9634bb07083cfa Ranjan Kumar    2024-09-05  1484  		}
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1485  		if (!pci_device_is_present(mrioc->pdev)) {
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1486  			mrioc->unrecoverable = 1;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1487  			ioc_err(mrioc,
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1488  			    "controller is not present at the bringup\n");
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1489  			retval = -1;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1490  			goto out_device_not_present;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1491  		}
824a156633dfdb Kashyap Desai   2021-05-20  1492  		msleep(100);
9634bb07083cfa Ranjan Kumar    2024-09-05  1493  		elapsed_time_sec = jiffies_to_msecs(jiffies - start_time)/1000;
9634bb07083cfa Ranjan Kumar    2024-09-05  1494  	} while (elapsed_time_sec < mrioc->ready_timeout);
824a156633dfdb Kashyap Desai   2021-05-20  1495  
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1496  out_failed:
9634bb07083cfa Ranjan Kumar    2024-09-05 @1497  	elapsed_time_sec = jiffies_to_msecs(jiffies - start_time)/1000;
9634bb07083cfa Ranjan Kumar    2024-09-05  1498  	if ((retry < 2) && (elapsed_time_sec < (mrioc->ready_timeout - 60))) {
9634bb07083cfa Ranjan Kumar    2024-09-05  1499  		retry++;
9634bb07083cfa Ranjan Kumar    2024-09-05  1500  
9634bb07083cfa Ranjan Kumar    2024-09-05  1501  		ioc_warn(mrioc, "retrying to bring IOC ready, retry_count:%d\n"
9634bb07083cfa Ranjan Kumar    2024-09-05  1502  				" elapsed time =%llu\n", retry, elapsed_time_sec);
9634bb07083cfa Ranjan Kumar    2024-09-05  1503  
9634bb07083cfa Ranjan Kumar    2024-09-05  1504  		goto retry_bring_ioc_ready;
9634bb07083cfa Ranjan Kumar    2024-09-05  1505  	}
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1506  	ioc_state = mpi3mr_get_iocstate(mrioc);
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1507  	ioc_err(mrioc,
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1508  	    "failed to bring to ready state,  current state: %s\n",
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1509  	    mpi3mr_iocstate_name(ioc_state));
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1510  out_device_not_present:
59bd9cfe3fa072 Sreekanth Reddy 2021-12-20  1511  	return retval;
824a156633dfdb Kashyap Desai   2021-05-20  1512  }
824a156633dfdb Kashyap Desai   2021-05-20  1513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
