Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD7DF6B
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 23:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683156821; x=1714692821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c57Lj4Ngad35Tcx+WXNfSGtWtND5OLF2IrEztVd8l7k=;
  b=Dxrv8eFTnksDtA2MeslNVgDwyODNXVvUncwnYAnl8ZcN6v9OZm6hahj/
   uYA0FHzwB3KnPNKsesNHwGirail9O57BQy2r9dUfEMPwEvflPfhvwfGa7
   ha1NycoGXdIzcu7zIgSKkN2mtUeMyaKyLFitVPNtJfrkUFaJ0/cqDikAc
   WbtszsuXlFtMhQTFtJ4+zNJ1cvVCKXMqJmnyFAJKf9CyRhYHdEfmkBVOG
   xMWc54desFEQ15jEXKFh5NH8icH8KnLTCaodQYzeWiWvCbnP4Jg3zuoCi
   KMdIrEIWsDq1HVl9Toq1HHE8JyxIIGDMf2HV/t5Qx4JCUzurIv/hHqvIX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414254011"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="414254011"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729559455"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="729559455"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 May 2023 16:33:38 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puLyb-0002MP-1J;
	Wed, 03 May 2023 23:33:37 +0000
Date: Thu, 4 May 2023 07:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_fw.c:1413 mpi3mr_issue_reset() error:
 uninitialized symbol 'host_diagnostic'.
Message-ID: <202305040735.8kNJSKlE-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa31fc82fb775445c176e576304c4098222f47f2
commit: 3753af778dd9d0d5199d6a7d01b0ead33135d095 kbuild: fix single directory build
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230504/202305040735.8kNJSKlE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305040735.8kNJSKlE-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1413 mpi3mr_issue_reset() error: uninitialized symbol 'host_diagnostic'.
drivers/scsi/mpi3mr/mpi3mr_fw.c:1919 mpi3mr_create_op_reply_q() error: we previously assumed 'op_reply_q->q_segments' could be null (see line 1872)
drivers/scsi/mpi3mr/mpi3mr_fw.c:2027 mpi3mr_create_op_req_q() error: we previously assumed 'op_req_q->q_segments' could be null (see line 2000)
drivers/scsi/mpi3mr/mpi3mr_app.c:1337 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1337 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1367 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[erb_offset]'
drivers/scsi/mpi3mr/mpi3mr_transport.c:2063 mpi3mr_expander_add() warn: returning -1 instead of -ENOMEM is sloppy

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:1338 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'

vim +/host_diagnostic +1413 drivers/scsi/mpi3mr/mpi3mr_fw.c

824a156633dfdb Kashyap Desai   2021-05-20  1371  
824a156633dfdb Kashyap Desai   2021-05-20  1372  /**
824a156633dfdb Kashyap Desai   2021-05-20  1373   * mpi3mr_issue_reset - Issue reset to the controller
824a156633dfdb Kashyap Desai   2021-05-20  1374   * @mrioc: Adapter reference
824a156633dfdb Kashyap Desai   2021-05-20  1375   * @reset_type: Reset type
824a156633dfdb Kashyap Desai   2021-05-20  1376   * @reset_reason: Reset reason code
824a156633dfdb Kashyap Desai   2021-05-20  1377   *
f061178e076210 Kashyap Desai   2021-05-20  1378   * Unlock the host diagnostic registers and write the specific
f061178e076210 Kashyap Desai   2021-05-20  1379   * reset type to that, wait for reset acknowledgment from the
f061178e076210 Kashyap Desai   2021-05-20  1380   * controller, if the reset is not successful retry for the
f061178e076210 Kashyap Desai   2021-05-20  1381   * predefined number of times.
824a156633dfdb Kashyap Desai   2021-05-20  1382   *
824a156633dfdb Kashyap Desai   2021-05-20  1383   * Return: 0 on success, non-zero on failure.
824a156633dfdb Kashyap Desai   2021-05-20  1384   */
824a156633dfdb Kashyap Desai   2021-05-20  1385  static int mpi3mr_issue_reset(struct mpi3mr_ioc *mrioc, u16 reset_type,
824a156633dfdb Kashyap Desai   2021-05-20  1386  	u32 reset_reason)
824a156633dfdb Kashyap Desai   2021-05-20  1387  {
f061178e076210 Kashyap Desai   2021-05-20  1388  	int retval = -1;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1389  	u8 unlock_retry_count = 0;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1390  	u32 host_diagnostic, ioc_status, ioc_config;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1391  	u32 timeout = MPI3MR_RESET_ACK_TIMEOUT * 10;
f061178e076210 Kashyap Desai   2021-05-20  1392  
f061178e076210 Kashyap Desai   2021-05-20  1393  	if ((reset_type != MPI3_SYSIF_HOST_DIAG_RESET_ACTION_SOFT_RESET) &&
f061178e076210 Kashyap Desai   2021-05-20  1394  	    (reset_type != MPI3_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT))
b64845a7d4039a Sreekanth Reddy 2021-12-20  1395  		return retval;
f061178e076210 Kashyap Desai   2021-05-20  1396  	if (mrioc->unrecoverable)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1397  		return retval;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1398  	if (reset_reason == MPI3MR_RESET_FROM_FIRMWARE) {
b64845a7d4039a Sreekanth Reddy 2021-12-20  1399  		retval = 0;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1400  		return retval;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1401  	}
b64845a7d4039a Sreekanth Reddy 2021-12-20  1402  
b64845a7d4039a Sreekanth Reddy 2021-12-20  1403  	ioc_info(mrioc, "%s reset due to %s(0x%x)\n",
b64845a7d4039a Sreekanth Reddy 2021-12-20  1404  	    mpi3mr_reset_type_name(reset_type),
b64845a7d4039a Sreekanth Reddy 2021-12-20  1405  	    mpi3mr_reset_rc_name(reset_reason), reset_reason);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1406  
f061178e076210 Kashyap Desai   2021-05-20  1407  	mpi3mr_clear_reset_history(mrioc);
f061178e076210 Kashyap Desai   2021-05-20  1408  	do {
f061178e076210 Kashyap Desai   2021-05-20  1409  		ioc_info(mrioc,
f061178e076210 Kashyap Desai   2021-05-20  1410  		    "Write magic sequence to unlock host diag register (retry=%d)\n",
f061178e076210 Kashyap Desai   2021-05-20  1411  		    ++unlock_retry_count);
f061178e076210 Kashyap Desai   2021-05-20  1412  		if (unlock_retry_count >= MPI3MR_HOSTDIAG_UNLOCK_RETRY_COUNT) {
b64845a7d4039a Sreekanth Reddy 2021-12-20 @1413  			ioc_err(mrioc,
b64845a7d4039a Sreekanth Reddy 2021-12-20  1414  			    "%s reset failed due to unlock failure, host_diagnostic(0x%08x)\n",
b64845a7d4039a Sreekanth Reddy 2021-12-20  1415  			    mpi3mr_reset_type_name(reset_type),
b64845a7d4039a Sreekanth Reddy 2021-12-20  1416  			    host_diagnostic);
f061178e076210 Kashyap Desai   2021-05-20  1417  			mrioc->unrecoverable = 1;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1418  			return retval;
f061178e076210 Kashyap Desai   2021-05-20  1419  		}
f061178e076210 Kashyap Desai   2021-05-20  1420  
f061178e076210 Kashyap Desai   2021-05-20  1421  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_FLUSH,
f061178e076210 Kashyap Desai   2021-05-20  1422  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1423  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_1ST,
f061178e076210 Kashyap Desai   2021-05-20  1424  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1425  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_2ND,
f061178e076210 Kashyap Desai   2021-05-20  1426  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1427  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_3RD,
f061178e076210 Kashyap Desai   2021-05-20  1428  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1429  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_4TH,
f061178e076210 Kashyap Desai   2021-05-20  1430  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1431  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_5TH,
f061178e076210 Kashyap Desai   2021-05-20  1432  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1433  		writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_6TH,
f061178e076210 Kashyap Desai   2021-05-20  1434  		    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1435  		usleep_range(1000, 1100);
f061178e076210 Kashyap Desai   2021-05-20  1436  		host_diagnostic = readl(&mrioc->sysif_regs->host_diagnostic);
f061178e076210 Kashyap Desai   2021-05-20  1437  		ioc_info(mrioc,
f061178e076210 Kashyap Desai   2021-05-20  1438  		    "wrote magic sequence: retry_count(%d), host_diagnostic(0x%08x)\n",
f061178e076210 Kashyap Desai   2021-05-20  1439  		    unlock_retry_count, host_diagnostic);
f061178e076210 Kashyap Desai   2021-05-20  1440  	} while (!(host_diagnostic & MPI3_SYSIF_HOST_DIAG_DIAG_WRITE_ENABLE));
f061178e076210 Kashyap Desai   2021-05-20  1441  
f061178e076210 Kashyap Desai   2021-05-20  1442  	writel(reset_reason, &mrioc->sysif_regs->scratchpad[0]);
f061178e076210 Kashyap Desai   2021-05-20  1443  	writel(host_diagnostic | reset_type,
f061178e076210 Kashyap Desai   2021-05-20  1444  	    &mrioc->sysif_regs->host_diagnostic);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1445  	switch (reset_type) {
b64845a7d4039a Sreekanth Reddy 2021-12-20  1446  	case MPI3_SYSIF_HOST_DIAG_RESET_ACTION_SOFT_RESET:
f061178e076210 Kashyap Desai   2021-05-20  1447  		do {
f061178e076210 Kashyap Desai   2021-05-20  1448  			ioc_status = readl(&mrioc->sysif_regs->ioc_status);
f061178e076210 Kashyap Desai   2021-05-20  1449  			ioc_config =
f061178e076210 Kashyap Desai   2021-05-20  1450  			    readl(&mrioc->sysif_regs->ioc_configuration);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1451  			if ((ioc_status & MPI3_SYSIF_IOC_STATUS_RESET_HISTORY)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1452  			    && mpi3mr_soft_reset_success(ioc_status, ioc_config)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1453  			    ) {
b64845a7d4039a Sreekanth Reddy 2021-12-20  1454  				mpi3mr_clear_reset_history(mrioc);
f061178e076210 Kashyap Desai   2021-05-20  1455  				retval = 0;
f061178e076210 Kashyap Desai   2021-05-20  1456  				break;
f061178e076210 Kashyap Desai   2021-05-20  1457  			}
f061178e076210 Kashyap Desai   2021-05-20  1458  			msleep(100);
f061178e076210 Kashyap Desai   2021-05-20  1459  		} while (--timeout);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1460  		mpi3mr_print_fault_info(mrioc);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1461  		break;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1462  	case MPI3_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT:
f061178e076210 Kashyap Desai   2021-05-20  1463  		do {
f061178e076210 Kashyap Desai   2021-05-20  1464  			ioc_status = readl(&mrioc->sysif_regs->ioc_status);
f061178e076210 Kashyap Desai   2021-05-20  1465  			if (mpi3mr_diagfault_success(mrioc, ioc_status)) {
f061178e076210 Kashyap Desai   2021-05-20  1466  				retval = 0;
f061178e076210 Kashyap Desai   2021-05-20  1467  				break;
f061178e076210 Kashyap Desai   2021-05-20  1468  			}
f061178e076210 Kashyap Desai   2021-05-20  1469  			msleep(100);
f061178e076210 Kashyap Desai   2021-05-20  1470  		} while (--timeout);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1471  		break;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1472  	default:
b64845a7d4039a Sreekanth Reddy 2021-12-20  1473  		break;
b64845a7d4039a Sreekanth Reddy 2021-12-20  1474  	}
b64845a7d4039a Sreekanth Reddy 2021-12-20  1475  
f061178e076210 Kashyap Desai   2021-05-20  1476  	writel(MPI3_SYSIF_WRITE_SEQUENCE_KEY_VALUE_2ND,
f061178e076210 Kashyap Desai   2021-05-20  1477  	    &mrioc->sysif_regs->write_sequence);
f061178e076210 Kashyap Desai   2021-05-20  1478  
f061178e076210 Kashyap Desai   2021-05-20  1479  	ioc_config = readl(&mrioc->sysif_regs->ioc_configuration);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1480  	ioc_status = readl(&mrioc->sysif_regs->ioc_status);
f061178e076210 Kashyap Desai   2021-05-20  1481  	ioc_info(mrioc,
b64845a7d4039a Sreekanth Reddy 2021-12-20  1482  	    "ioc_status/ioc_onfig after %s reset is (0x%x)/(0x%x)\n",
f061178e076210 Kashyap Desai   2021-05-20  1483  	    (!retval)?"successful":"failed", ioc_status,
f061178e076210 Kashyap Desai   2021-05-20  1484  	    ioc_config);
b64845a7d4039a Sreekanth Reddy 2021-12-20  1485  	if (retval)
b64845a7d4039a Sreekanth Reddy 2021-12-20  1486  		mrioc->unrecoverable = 1;
f061178e076210 Kashyap Desai   2021-05-20  1487  	return retval;
824a156633dfdb Kashyap Desai   2021-05-20  1488  }
824a156633dfdb Kashyap Desai   2021-05-20  1489  

:::::: The code at line 1413 was first introduced by commit
:::::: b64845a7d4039ab9667bafff9d7bb59365f17c0f scsi: mpi3mr: Detect async reset that occurred in firmware

:::::: TO: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
