Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F7EC0
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396334; cv=none; b=O68fT7X5eVuN4d8++Hs8n5BnzZGxE94HCWuVWi0LMcH2bBcul19XP7rJctlSozsQGWWhTQhY1KZ8OUJYbbgySbuarBnkGXnWoM1rYHfVvJH+vtkh463x/0qQ1GFs0c5VEUENuEEyMeP086XEilNIS7fYNvdmYEmAaH5yuAT3jHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396334; c=relaxed/simple;
	bh=jsNYADhZo2eIm7l/NngO8DMvaEc3hhEhNfoPIWBqC0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gviQsXP3dv1MM+/EcnUo6+SU7R0EHhbVkg0oBO8sYG+iOBadG78KdPCjbIbKIliTjrPfkuPtQDltX4H1Eyjo0ael89antmLDD+T+VR04HpnLmLdOfv8FpuLuUZL5VLrNRSjfx6hYbBX922Plc3yhq8aeCev6iyNf6s+9C55ISF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIWM8vdW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIWM8vdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737396333; x=1768932333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jsNYADhZo2eIm7l/NngO8DMvaEc3hhEhNfoPIWBqC0g=;
  b=mIWM8vdWv9MPcC0BsVC+0Jd/mGMePMWRw/HERgB4ce5ObIY3JaGNZkZk
   G7xkMnN6qAYJxW+U15vYXgRsTZk66VzbqEdTFYbb/iTcQOOZfn9ww4zQP
   xokiqP/p31XuPc8g3L8ieZAFeOzjaEEdKFBH1uP4wIMj/vqkl78QxkmVB
   VTP0MzCEY5mDcG08mtUfVHTU7ZAKANeOovZxJIQ5yfT16ywz+fR0C0qxI
   Eo1oQyT0m9edoQqen1Qly0WbPmvUj2Cux2J6SWGe4IFzfi1UzjhztfvHW
   S8gZyOSR1Xkm7kQGXSIYtnoJoNrGh6di5Ltv6WZ5bzStnehvom6kztmo7
   Q==;
X-CSE-ConnectionGUID: sIsifLoHSo+AnJGjPxmkIA==
X-CSE-MsgGUID: dpz7fG97R32v9g+SGx16AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37676581"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37676581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 10:05:32 -0800
X-CSE-ConnectionGUID: Jawu/ePRSg6658cWU+DNRQ==
X-CSE-MsgGUID: ng5Yylp6T72PInMR+gA2Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129861746"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2025 10:05:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZw9Q-000WqZ-0P;
	Mon, 20 Jan 2025 18:05:28 +0000
Date: Tue, 21 Jan 2025 02:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 13/13] drivers/ufs/core/ufshcd.c:5518
 __ufshcd_transfer_req_compl() error: we previously assumed 'compl_cmd' could
 be null (see line 5517)
Message-ID: <202501210143.ZyDTG1tQ-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   21a8754aa33228c1b822c1104d24fce691357678
commit: 8563ce58954679187f0c269a504520d8def37e41 [13/13] BACKPORT: FROMLIST: scsi: ufs: Make the polling code report which command has been completed
:::::: branch date: 3 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210143.ZyDTG1tQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501210143.ZyDTG1tQ-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:5518 __ufshcd_transfer_req_compl() error: we previously assumed 'compl_cmd' could be null (see line 5517)

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5437 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5425)
drivers/ufs/core/ufshcd.c:9081 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9061.
drivers/ufs/core/ufshcd.c:2341 ufshcd_hba_capabilities() warn: missing error code? 'err'

vim +/compl_cmd +5518 drivers/ufs/core/ufshcd.c

ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5501  
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5502  /**
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5503   * __ufshcd_transfer_req_compl - handle SCSI and query command completion
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5504   * @hba: per adapter instance
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5505   * @completed_reqs: bitmask that indicates which requests to complete
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5506   * @compl_cmd: if not NULL, check whether *@compl_cmd has been completed.
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5507   *	Clear *@compl_cmd if it has been completed.
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5508   */
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5509  static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5510  					unsigned long completed_reqs,
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5511  					struct scsi_cmnd **compl_cmd)
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5512  {
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5513  	int tag;
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5514  
ee00e6f120fbd0 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5515  	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5516  		if (ufshcd_compl_one_cqe(hba, tag, NULL,
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11 @5517  					 compl_cmd ? *compl_cmd : NULL))
8563ce58954679 drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11 @5518  			*compl_cmd = NULL;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  5519  }
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  5520  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
