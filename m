Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAC51448E0
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778924430; cv=none; b=OX3nbJfpqrGPLyfTzUPHYgdYp0MScficc4bcUqcEZPl951Wf9UXvlJes8U0w6XwtDjexVMKFQEZdO6g/ksFoNIa9yPe9i/vwGkFcG1uenU5ZtaLFqrSnpNjy2anCCYWJmms9+D58ZN09toaUVLQCS2nRDxOFOQjBkX+kllVr8mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778924430; c=relaxed/simple;
	bh=YdL6qzZnqM0jrgnvjpGHVFLmUY7VYntg/ZJ/FXsyEWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AP2hLnRV9aAHT0OHsJLdXjVMS+qqZHD07uQ11ZSn3KDdO1HCNLxsy05EMjLR4FM1FWqAIxf89v247dCAUwWqZQKBsaZ3gERp0fQxzp1sqs/qE0TmCYGBFO9KaHZyrDte6wWaDEc7pbcZdApkgm82kzI+HMgpfdXFtbsM47Azna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0tclUC6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0tclUC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778924429; x=1810460429;
  h=date:from:to:cc:subject:message-id;
  bh=YdL6qzZnqM0jrgnvjpGHVFLmUY7VYntg/ZJ/FXsyEWk=;
  b=I0tclUC6a7zJQ6vKgq1/FWxqiW41hQogOHPFJjLrxVJMOerMsF9uTGNL
   GFIc97p61VOwpq2BT49TUj08H3WMHhzzXQFs6vtlhs+4pb4kw4zppdTK1
   ZpF0m7EiEWyCdaDBXNWZad8GHoRYrgSy4T2hAdR7EcFY4XoVPX9ezNPLl
   rNB4xVfTgU7B8jg7r7yF1L6Ercj7mPaSpZ5q4XdH6DD8667/o2jhQavlH
   HEkELmnNdzPT3fBkrDyebiU3FKMmIE6yh2VT4kDGEcVom+iuDd/MU1N8p
   suTk9Od91pYVxprTSKoi710w0hxpFLKbFgWGOv441ysQztu4f7Vd8TjgA
   A==;
X-CSE-ConnectionGUID: elLHyhxCSIW5Z6XuyVek4g==
X-CSE-MsgGUID: NwCPDC+XSAeo5mRGiAA/Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97435554"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="97435554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 02:40:28 -0700
X-CSE-ConnectionGUID: IuvjoEiFS5uX4l3/pNg7dA==
X-CSE-MsgGUID: WtPnQDyxQHq1nY16E4IbZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="234689188"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 May 2026 02:40:27 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOBVQ-000000000gf-3i0C;
	Sat, 16 May 2026 09:40:24 +0000
Date: Sat, 16 May 2026 17:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-2025-05 0/5]
 include/linux/blk-mq.h:865:31: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202605161755.Z2bS6Oi4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/blk-mq.h:865:31: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-05
head:   69e9e5ccddbc3e3bc5614ab8465b6fcd8fafd443
commit: 99ca540851ee906ae15d36566ed3447e6e415780 [0/5] block: cleanup and fix batch completion adding conditions
:::::: branch date: 5 days ago
:::::: commit date: 1 year, 3 months ago
config: i386-randconfig-062-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161755.Z2bS6Oi4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161755.Z2bS6Oi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605161755.Z2bS6Oi4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/block/null_blk/main.c: note: in included file (through drivers/block/null_blk/null_blk.h):
>> include/linux/blk-mq.h:865:31: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/block/null_blk/main.c:1677:46: sparse: signed value source

vim +865 include/linux/blk-mq.h

99e48cd6855e953 John Garry 2022-07-06  842  
f794f3351f2672d Jens Axboe 2021-10-08  843  /*
f794f3351f2672d Jens Axboe 2021-10-08  844   * Batched completions only work when there is no I/O error and no special
f794f3351f2672d Jens Axboe 2021-10-08  845   * ->end_io handler.
f794f3351f2672d Jens Axboe 2021-10-08  846   */
f794f3351f2672d Jens Axboe 2021-10-08  847  static inline bool blk_mq_add_to_batch(struct request *req,
f794f3351f2672d Jens Axboe 2021-10-08  848  				       struct io_comp_batch *iob, int ioerror,
f794f3351f2672d Jens Axboe 2021-10-08  849  				       void (*complete)(struct io_comp_batch *))
f794f3351f2672d Jens Axboe 2021-10-08  850  {
c6b7a3a26e809c9 Ming Lei   2023-06-24  851  	/*
99ca540851ee906 Jens Axboe 2025-02-13  852  	 * Check various conditions that exclude batch processing:
99ca540851ee906 Jens Axboe 2025-02-13  853  	 * 1) No batch container
99ca540851ee906 Jens Axboe 2025-02-13  854  	 * 2) Has scheduler data attached
99ca540851ee906 Jens Axboe 2025-02-13  855  	 * 3) Not a passthrough request and end_io set
99ca540851ee906 Jens Axboe 2025-02-13  856  	 * 4) Not a passthrough request and an ioerror
c6b7a3a26e809c9 Ming Lei   2023-06-24  857  	 */
99ca540851ee906 Jens Axboe 2025-02-13  858  	if (!iob)
f794f3351f2672d Jens Axboe 2021-10-08  859  		return false;
99ca540851ee906 Jens Axboe 2025-02-13  860  	if (req->rq_flags & RQF_SCHED_TAGS)
99ca540851ee906 Jens Axboe 2025-02-13  861  		return false;
99ca540851ee906 Jens Axboe 2025-02-13  862  	if (!blk_rq_is_passthrough(req)) {
99ca540851ee906 Jens Axboe 2025-02-13  863  		if (req->end_io)
99ca540851ee906 Jens Axboe 2025-02-13  864  			return false;
99ca540851ee906 Jens Axboe 2025-02-13 @865  		if (ioerror < 0)
99ca540851ee906 Jens Axboe 2025-02-13  866  			return false;
99ca540851ee906 Jens Axboe 2025-02-13  867  	}
ab3e1d3bbab9e97 Jens Axboe 2022-09-21  868  
f794f3351f2672d Jens Axboe 2021-10-08  869  	if (!iob->complete)
f794f3351f2672d Jens Axboe 2021-10-08  870  		iob->complete = complete;
f794f3351f2672d Jens Axboe 2021-10-08  871  	else if (iob->complete != complete)
f794f3351f2672d Jens Axboe 2021-10-08  872  		return false;
f794f3351f2672d Jens Axboe 2021-10-08  873  	iob->need_ts |= blk_mq_need_time_stamp(req);
f794f3351f2672d Jens Axboe 2021-10-08  874  	rq_list_add(&iob->req_list, req);
f794f3351f2672d Jens Axboe 2021-10-08  875  	return true;
f794f3351f2672d Jens Axboe 2021-10-08  876  }
320ae51feed5c2f Jens Axboe 2013-10-24  877  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
