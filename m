Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B91BF330
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719942929; cv=none; b=XISIGxxz2PgBrsWjErlmhB9Ae2/jkhOKXa08EonbYYwZbKiikO/zDcwWhpfZcaY3MWVb4ON75Ov4r+Hf/NNmIJL5PgeckJR6sq0AYo2KgZ1376dhJDkSqUkbMqjWLHTOHXsqW+UOaJ5XOpT/sabef1gUJFDdGPGzwYMJd6ACNjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719942929; c=relaxed/simple;
	bh=zQJFqDCEM/cCgHUri4uwnAlHcKUTfQ2fsDseKNdigvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4TZEFG89i6zjZ96JE+xX8hIdg/earg7weiGj/+rPqEd4t0dxFzpA4tntz41aHqnxx2bCXFKJZEBjJE4z0on68ro2gDh15uCl77tFPuZEt69ZFV3TehZe8TlXRkze2HRou8VUjMAmrJz5sQ9scqo/iONcrhbOu+HDMr7efdZLT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UV4ieCXL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UV4ieCXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719942927; x=1751478927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQJFqDCEM/cCgHUri4uwnAlHcKUTfQ2fsDseKNdigvs=;
  b=UV4ieCXLNPgQQlWNrgcP7zh8VRwX803+14fpAipZZSBNljDYhzxJUE2n
   ded1WAGAzXeKAwlfPWNDZaCj2GLViC9zJF0dxs9v2/doH7x0NGYMM8JK1
   VuMj37O/xPEU8VFC60Q0OmkXkk1nVAMN2krR3+aWCwmDlbLj7NspY14pX
   Qf4b7z1rA9JK4khS1VCGTkWaQ8CyKCFtPPnSVcdy4mEf3ZuCKRwSKnl2/
   UdWsbKfW/rGoH3SV7zPr+WALMoCRx6IuTcx75vN/5VEIPBNyJanXHf+9I
   KAN2uK28KKogcXi5NLw0sttl6aBuCSkotZF+babQwRwRAy6o61ZpMGcAh
   Q==;
X-CSE-ConnectionGUID: PsNutumQQf6HzYV9xhOw8A==
X-CSE-MsgGUID: qegeRLWTRUSqU8izUXRYiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16795298"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="16795298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 10:55:26 -0700
X-CSE-ConnectionGUID: SwABLNNFSluY42bfE9WM7Q==
X-CSE-MsgGUID: K7XOJYjLTBC588lpl0vCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50831743"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2024 10:55:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOhis-000OUO-1f;
	Tue, 02 Jul 2024 17:55:22 +0000
Date: Wed, 3 Jul 2024 01:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 3/4] drivers/ufs/core/ufs-mcq.c:293
 ufshcd_mcq_poll_cqe_nolock() error: we previously assumed 'compl_cmd' could
 be null (see line 292)
Message-ID: <202407030103.OwiRiX9t-lkp@intel.com>
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
head:   2447b4c0a5ca8efd6579d4a168103269dfac1866
commit: 8563ce58954679187f0c269a504520d8def37e41 [3/4] BACKPORT: FROMLIST: scsi: ufs: Make the polling code report which command has been completed
:::::: branch date: 32 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030103.OwiRiX9t-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407030103.OwiRiX9t-lkp@intel.com/

smatch warnings:
drivers/ufs/core/ufs-mcq.c:293 ufshcd_mcq_poll_cqe_nolock() error: we previously assumed 'compl_cmd' could be null (see line 292)

vim +/compl_cmd +293 drivers/ufs/core/ufs-mcq.c

31fe4a16211a23 Asutosh Das     2023-01-13  281  
8563ce58954679 Bart Van Assche 2024-04-11  282  /* Clears *@compl_cmd if and only if *@compl_cmd has been completed. */
31fe4a16211a23 Asutosh Das     2023-01-13  283  unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
8563ce58954679 Bart Van Assche 2024-04-11  284  					 struct ufs_hw_queue *hwq,
8563ce58954679 Bart Van Assche 2024-04-11  285  					 struct scsi_cmnd **compl_cmd)
31fe4a16211a23 Asutosh Das     2023-01-13  286  {
31fe4a16211a23 Asutosh Das     2023-01-13  287  	unsigned long completed_reqs = 0;
31fe4a16211a23 Asutosh Das     2023-01-13  288  
31fe4a16211a23 Asutosh Das     2023-01-13  289  	ufshcd_mcq_update_cq_tail_slot(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  290  	while (!ufshcd_mcq_is_cq_empty(hwq)) {
8563ce58954679 Bart Van Assche 2024-04-11  291  		if (ufshcd_mcq_process_cqe(hba, hwq,
8563ce58954679 Bart Van Assche 2024-04-11 @292  					   compl_cmd ? *compl_cmd : NULL))
8563ce58954679 Bart Van Assche 2024-04-11 @293  			*compl_cmd = NULL;
31fe4a16211a23 Asutosh Das     2023-01-13  294  		ufshcd_mcq_inc_cq_head_slot(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  295  		completed_reqs++;
31fe4a16211a23 Asutosh Das     2023-01-13  296  	}
31fe4a16211a23 Asutosh Das     2023-01-13  297  
31fe4a16211a23 Asutosh Das     2023-01-13  298  	if (completed_reqs)
31fe4a16211a23 Asutosh Das     2023-01-13  299  		ufshcd_mcq_update_cq_head(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  300  
31fe4a16211a23 Asutosh Das     2023-01-13  301  	return completed_reqs;
31fe4a16211a23 Asutosh Das     2023-01-13  302  }
31fe4a16211a23 Asutosh Das     2023-01-13  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
