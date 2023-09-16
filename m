Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111031FA3
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694851549; x=1726387549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PVdrAdlO+iCihei0OjTuNMLUFjOFeC5jmLzXeWoVfM=;
  b=ClQipGTSCAVbx2mOqNvjgImOulsQo56pxKHpFt0RXnC0LSCSq+8bbPFw
   4RNFsiHFGHDXD+Szaf8kcgd+txtKDnwkLm1ZnGyT1Xw2C4UUcOiC0gOQL
   ezJX63BywsgF3a1/9BWzqW5pD7G9AP6QGajkEJLvncTxF51oucVqOLS3K
   wWubslvkbGgVMpbNU8dUPg4X1h1oWlCe69r5ulyyKGPOFG4Xe9rTwGokF
   yQE4HpdBC25uGQclHJqVAZ/g14lHeeX8VRpHWF9ENGNHIRJJFXVdcrE9n
   q8aEWyw6+P3dOz3AJklPbMC+xssdjlbjRWoDOUMqUPS3LPgK8Dx77jksa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="379308524"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="379308524"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 01:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1076027380"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="1076027380"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2023 01:05:43 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhQJ8-00043G-1B;
	Sat, 16 Sep 2023 08:05:38 +0000
Date: Sat, 16 Sep 2023 16:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ufs/core/ufshcd.c:7528 ufshcd_abort() error: uninitialized
 symbol 'reg'.
Message-ID: <202309161614.PVEMoVw8-lkp@intel.com>
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
TO: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Stanley Chu <stanley.chu@mediatek.com>
CC: Can Guo <quic_cang@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57d88e8a5974644039fbc47806bac7bb12025636
commit: adf452611677d048203398f489e2175a9068f9f7 scsi: ufs: mcq: Add support for cleaning up MCQ resources
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230916/202309161614.PVEMoVw8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309161614.PVEMoVw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309161614.PVEMoVw8-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:7528 ufshcd_abort() error: uninitialized symbol 'reg'.

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5440 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5428)
drivers/ufs/core/ufshcd.c:9073 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9053.
drivers/ufs/core/ufshcd.c:2343 ufshcd_hba_capabilities() warn: missing error code? 'err'

vim +/reg +7528 drivers/ufs/core/ufshcd.c

307348f6ab144b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-24  7473  
307348f6ab144b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-24  7474  /**
307348f6ab144b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-24  7475   * ufshcd_abort - scsi host template eh_abort_handler callback
307348f6ab144b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-24  7476   * @cmd: SCSI command pointer
307348f6ab144b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-24  7477   *
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7478   * Returns SUCCESS/FAILED
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7479   */
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7480  static int ufshcd_abort(struct scsi_cmnd *cmd)
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7481  {
4728ab4a8e6490 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7482  	struct Scsi_Host *host = cmd->device->host;
4728ab4a8e6490 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7483  	struct ufs_hba *hba = shost_priv(host);
3f2c1002e0fcb6 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-08-09  7484  	int tag = scsi_cmd_to_rq(cmd)->tag;
4728ab4a8e6490 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7485  	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7486  	unsigned long flags;
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7487  	int err = FAILED;
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7488  	bool outstanding;
e9d501b154ff62 drivers/scsi/ufs/ufshcd.c Dolev Raviv        2014-07-01  7489  	u32 reg;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7490  
4728ab4a8e6490 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7491  	WARN_ONCE(tag < 0, "Invalid tag %d\n", tag);
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7492  
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  7493  	ufshcd_hold(hba, false);
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7494  
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7495  	if (!is_mcq_enabled(hba)) {
14497328b6a628 drivers/scsi/ufs/ufshcd.c Yaniv Gardi        2016-02-01  7496  		reg = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7497  		if (!test_bit(tag, &hba->outstanding_reqs)) {
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7498  			/* If command is already aborted/completed, return FAILED. */
14497328b6a628 drivers/scsi/ufs/ufshcd.c Yaniv Gardi        2016-02-01  7499  			dev_err(hba->dev,
14497328b6a628 drivers/scsi/ufs/ufshcd.c Yaniv Gardi        2016-02-01  7500  				"%s: cmd at tag %d already completed, outstanding=0x%lx, doorbell=0x%x\n",
14497328b6a628 drivers/scsi/ufs/ufshcd.c Yaniv Gardi        2016-02-01  7501  				__func__, tag, hba->outstanding_reqs, reg);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7502  			goto release;
14497328b6a628 drivers/scsi/ufs/ufshcd.c Yaniv Gardi        2016-02-01  7503  		}
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7504  	}
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7505  
66cc820f9cbf12 drivers/scsi/ufs/ufshcd.c Dolev Raviv        2016-12-22  7506  	/* Print Transfer Request of aborted task */
d87a1f6d021f40 drivers/scsi/ufs/ufshcd.c Bean Huo           2020-08-11  7507  	dev_info(hba->dev, "%s: Device abort task at tag %d\n", __func__, tag);
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7508  
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7509  	/*
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7510  	 * Print detailed info about aborted request.
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7511  	 * As more than one request might get aborted at the same time,
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7512  	 * print full information only for the first aborted request in order
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7513  	 * to reduce repeated printouts. For other aborted requests only print
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7514  	 * basic details.
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7515  	 */
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7516  	scsi_print_command(cmd);
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7517  	if (!hba->req_abort_count) {
e965e5e00b23c4 drivers/scsi/ufs/ufshcd.c Stanley Chu        2020-12-05  7518  		ufshcd_update_evt_hist(hba, UFS_EVT_ABORT, tag);
e965e5e00b23c4 drivers/scsi/ufs/ufshcd.c Stanley Chu        2020-12-05  7519  		ufshcd_print_evt_hist(hba);
6ba65588381d59 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7520  		ufshcd_print_host_state(hba);
66cc820f9cbf12 drivers/scsi/ufs/ufshcd.c Dolev Raviv        2016-12-22  7521  		ufshcd_print_pwr_info(hba);
127fd07da45937 drivers/ufs/core/ufshcd.c Ziqi Chen          2023-03-15  7522  		ufshcd_print_tr(hba, tag, true);
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7523  	} else {
127fd07da45937 drivers/ufs/core/ufshcd.c Ziqi Chen          2023-03-15  7524  		ufshcd_print_tr(hba, tag, false);
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7525  	}
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7526  	hba->req_abort_count++;
e0b299e36004f5 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7527  
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29 @7528  	if (!is_mcq_enabled(hba) && !(reg & (1 << tag))) {
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7529  		/* only execute this code in single doorbell mode */
d87a1f6d021f40 drivers/scsi/ufs/ufshcd.c Bean Huo           2020-08-11  7530  		dev_err(hba->dev,
d87a1f6d021f40 drivers/scsi/ufs/ufshcd.c Bean Huo           2020-08-11  7531  		"%s: cmd was completed, but without a notifying intr, tag = %d",
d87a1f6d021f40 drivers/scsi/ufs/ufshcd.c Bean Huo           2020-08-11  7532  		__func__, tag);
11682523573c1c drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-10-20  7533  		__ufshcd_transfer_req_compl(hba, 1UL << tag);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7534  		goto release;
d87a1f6d021f40 drivers/scsi/ufs/ufshcd.c Bean Huo           2020-08-11  7535  	}
d87a1f6d021f40 drivers/scsi/ufs/ufshcd.c Bean Huo           2020-08-11  7536  
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7537  	/*
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7538  	 * Task abort to the device W-LUN is illegal. When this command
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7539  	 * will fail, due to spec violation, scsi err handling next step
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7540  	 * will be to send LU reset which, again, is a spec violation.
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7541  	 * To avoid these unnecessary/illegal steps, first we clean up
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  7542  	 * the lrb taken by this cmd and re-set it in outstanding_reqs,
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  7543  	 * then queue the eh_work and bail.
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7544  	 */
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7545  	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN) {
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7546  		ufshcd_update_evt_hist(hba, UFS_EVT_ABORT, lrbp->lun);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7547  
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  7548  		spin_lock_irqsave(host->host_lock, flags);
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7549  		hba->force_reset = true;
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  7550  		ufshcd_schedule_eh_work(hba);
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7551  		spin_unlock_irqrestore(host->host_lock, flags);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7552  		goto release;
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7553  	}
7a7e66c65d4148 drivers/scsi/ufs/ufshcd.c Can Guo            2020-12-02  7554  
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7555  	if (is_mcq_enabled(hba))
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7556  		goto release;
adf452611677d0 drivers/ufs/core/ufshcd.c Bao D. Nguyen      2023-05-29  7557  
e0b299e36004f5 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7558  	/* Skip task abort in case previous aborts failed and report failure */
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7559  	if (lrbp->req_abort_skip) {
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7560  		dev_err(hba->dev, "%s: skipping abort\n", __func__);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7561  		ufshcd_set_req_abort_skip(hba, hba->outstanding_reqs);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7562  		goto release;
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7563  	}
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7564  
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7565  	err = ufshcd_try_to_abort_task(hba, tag);
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7566  	if (err) {
f20810d8d0bbe7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-05-26  7567  		dev_err(hba->dev, "%s: failed with err %d\n", __func__, err);
e0b299e36004f5 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  7568  		ufshcd_set_req_abort_skip(hba, hba->outstanding_reqs);
f20810d8d0bbe7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-05-26  7569  		err = FAILED;
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7570  		goto release;
f20810d8d0bbe7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-05-26  7571  	}
f20810d8d0bbe7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-05-26  7572  
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7573  	/*
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7574  	 * Clear the corresponding bit from outstanding_reqs since the command
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7575  	 * has been aborted successfully.
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7576  	 */
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7577  	spin_lock_irqsave(&hba->outstanding_lock, flags);
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7578  	outstanding = __test_and_clear_bit(tag, &hba->outstanding_reqs);
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7579  	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7580  
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7581  	if (outstanding)
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7582  		ufshcd_release_scsi_cmd(hba, lrbp);
1fbaa02dfd0522 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  7583  
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7584  	err = SUCCESS;
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7585  
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7586  release:
64180742605f77 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  7587  	/* Matches the ufshcd_hold() call at the start of this function. */
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  7588  	ufshcd_release(hba);
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7589  	return err;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7590  }
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  7591  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
