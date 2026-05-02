Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C527DA66
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777705413; cv=none; b=tSA4KJFGVZ7BRtv3JVGBmqCATBSRCdBp4tRPwEUpr4FEvWWo8eOSmmJZGoToEY423rs5oGXnKMc3OOPeG14sFoqjvTsHocpv63wGrEM4uuiBhmtCydhxhBjMYfPpXxd+Vs3YkApwp6D8sJbPmtGZdar74Px/X8kO4t4SHOQCXrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777705413; c=relaxed/simple;
	bh=VeznfHoxNxxeA1kAx9fLFvhisRRXk55jtDAQiHYR1Zs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=icKdD3zOqSdHrbdIZRNtIJumgEcmFkgOsZtESFZOELRgunDPA3mB7TQ8bJe198KQZ3k6UnBLnmuU385rtrm7mjCT7wjG/dIJgusHkrSGJYJFnSATKJj/fa5X3BY3piTdaUnFClL7KJGVMNr0Ug89mfULl6JsZnfI1DyVXZ+CMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yno8V4+B; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yno8V4+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777705411; x=1809241411;
  h=date:from:to:cc:subject:message-id;
  bh=VeznfHoxNxxeA1kAx9fLFvhisRRXk55jtDAQiHYR1Zs=;
  b=Yno8V4+BwVQLdlcSHrFeUuo3qzuxfypvjkfvqbKHVebVcdS0xaNKkfut
   8nRKJm7/1JhALCEWWnH7HuJ918FIWzLgmtU84MSQBjfOSXj8Yo563YI5S
   6yEylcsGEzc+YlWJ7iZ4olgfu2BAjGuLvuxIoRdoPtNFxxXfp9OT7vN3/
   t1xd8V9ee0xLm6sMNz3euMZC+vMFUuSUs7ZZOqnpX0qsht1zLH7gq1SwZ
   HZMkPgp7MGIOGGRF27yq7PUZT0c6pyCp0/c8k4KQ1dMkxlTvVmNjeDFr0
   81W4XRCfT6CcG06EXDlPt0pxRbsj9ZmQm3kFX104Z8TWvH4G0BosEd521
   Q==;
X-CSE-ConnectionGUID: fMC1v1XNRMGJRXklihRfSA==
X-CSE-MsgGUID: 2gEXvtA0SOSWeo+B9/J8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="89343016"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="89343016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 00:03:30 -0700
X-CSE-ConnectionGUID: eBogrkx5TdOLHxBKGkDHFA==
X-CSE-MsgGUID: 49LRy+5ZTa6hWyHzZpBq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="232406855"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 May 2026 00:03:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ4Nr-000000001Dl-0rzt;
	Sat, 02 May 2026 07:03:27 +0000
Date: Sat, 02 May 2026 15:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:360
 papr_hvpipe_handle_read() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202605021418.PU5uXOWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haren Myneni <haren@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
CC: Tyrel Datwyler <tyreld@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: cebdb522fd3edd1fe05f7b4a74a27da7dd0f8d86 powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-r071-20260501 (https://download.01.org/0day-ci/archive/20260502/202605021418.PU5uXOWe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cebdb522fd3e ("powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605021418.PU5uXOWe-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:360 papr_hvpipe_handle_read() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:214 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes remaining?

vim +360 arch/powerpc/platforms/pseries/papr-hvpipe.c

814ef095f12c9fa Haren Myneni 2025-09-09  315  
814ef095f12c9fa Haren Myneni 2025-09-09  316  	struct hvpipe_source_info *src_info = file->private_data;
cebdb522fd3edd1 Haren Myneni 2025-09-09  317  	struct papr_hvpipe_hdr hdr;
cebdb522fd3edd1 Haren Myneni 2025-09-09  318  	long ret;
814ef095f12c9fa Haren Myneni 2025-09-09  319  
814ef095f12c9fa Haren Myneni 2025-09-09  320  	if (!src_info)
814ef095f12c9fa Haren Myneni 2025-09-09  321  		return -EIO;
814ef095f12c9fa Haren Myneni 2025-09-09  322  
cebdb522fd3edd1 Haren Myneni 2025-09-09  323  	/*
cebdb522fd3edd1 Haren Myneni 2025-09-09  324  	 * Max payload is 4048 (HVPIPE_MAX_WRITE_BUFFER_SIZE)
cebdb522fd3edd1 Haren Myneni 2025-09-09  325  	 */
cebdb522fd3edd1 Haren Myneni 2025-09-09  326  	if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
cebdb522fd3edd1 Haren Myneni 2025-09-09  327  		(size < HVPIPE_HDR_LEN))
cebdb522fd3edd1 Haren Myneni 2025-09-09  328  		return -EINVAL;
cebdb522fd3edd1 Haren Myneni 2025-09-09  329  
cebdb522fd3edd1 Haren Myneni 2025-09-09  330  	/*
cebdb522fd3edd1 Haren Myneni 2025-09-09  331  	 * Payload is not available to receive or source pipe
cebdb522fd3edd1 Haren Myneni 2025-09-09  332  	 * is not closed.
cebdb522fd3edd1 Haren Myneni 2025-09-09  333  	 */
cebdb522fd3edd1 Haren Myneni 2025-09-09  334  	if (!src_info->hvpipe_status)
814ef095f12c9fa Haren Myneni 2025-09-09  335  		return 0;
cebdb522fd3edd1 Haren Myneni 2025-09-09  336  
cebdb522fd3edd1 Haren Myneni 2025-09-09  337  	hdr.version = 0;
cebdb522fd3edd1 Haren Myneni 2025-09-09  338  	hdr.flags = 0;
cebdb522fd3edd1 Haren Myneni 2025-09-09  339  
cebdb522fd3edd1 Haren Myneni 2025-09-09  340  	/*
cebdb522fd3edd1 Haren Myneni 2025-09-09  341  	 * In case if the hvpipe has payload and also the
cebdb522fd3edd1 Haren Myneni 2025-09-09  342  	 * hypervisor closed the pipe to the source, retrieve
cebdb522fd3edd1 Haren Myneni 2025-09-09  343  	 * the payload and return to the user space first and
cebdb522fd3edd1 Haren Myneni 2025-09-09  344  	 * then notify the userspace about the hvpipe close in
cebdb522fd3edd1 Haren Myneni 2025-09-09  345  	 * next read().
cebdb522fd3edd1 Haren Myneni 2025-09-09  346  	 */
cebdb522fd3edd1 Haren Myneni 2025-09-09  347  	if (src_info->hvpipe_status & HVPIPE_MSG_AVAILABLE)
cebdb522fd3edd1 Haren Myneni 2025-09-09  348  		hdr.flags = HVPIPE_MSG_AVAILABLE;
cebdb522fd3edd1 Haren Myneni 2025-09-09  349  	else if (src_info->hvpipe_status & HVPIPE_LOST_CONNECTION)
cebdb522fd3edd1 Haren Myneni 2025-09-09  350  		hdr.flags = HVPIPE_LOST_CONNECTION;
cebdb522fd3edd1 Haren Myneni 2025-09-09  351  	else
cebdb522fd3edd1 Haren Myneni 2025-09-09  352  		/*
cebdb522fd3edd1 Haren Myneni 2025-09-09  353  		 * Should not be here without one of the above
cebdb522fd3edd1 Haren Myneni 2025-09-09  354  		 * flags set
cebdb522fd3edd1 Haren Myneni 2025-09-09  355  		 */
cebdb522fd3edd1 Haren Myneni 2025-09-09  356  		return -EIO;
cebdb522fd3edd1 Haren Myneni 2025-09-09  357  
cebdb522fd3edd1 Haren Myneni 2025-09-09  358  	ret = copy_to_user(buf, &hdr, HVPIPE_HDR_LEN);
cebdb522fd3edd1 Haren Myneni 2025-09-09  359  	if (ret)
cebdb522fd3edd1 Haren Myneni 2025-09-09 @360  		return ret;
cebdb522fd3edd1 Haren Myneni 2025-09-09  361  
cebdb522fd3edd1 Haren Myneni 2025-09-09  362  	/*
cebdb522fd3edd1 Haren Myneni 2025-09-09  363  	 * Message event has payload, so get the payload with
cebdb522fd3edd1 Haren Myneni 2025-09-09  364  	 * recv HVPIPE RTAS.
cebdb522fd3edd1 Haren Myneni 2025-09-09  365  	 */
cebdb522fd3edd1 Haren Myneni 2025-09-09  366  	if (hdr.flags & HVPIPE_MSG_AVAILABLE) {
cebdb522fd3edd1 Haren Myneni 2025-09-09  367  		ret = hvpipe_rtas_recv_msg(buf + HVPIPE_HDR_LEN,
cebdb522fd3edd1 Haren Myneni 2025-09-09  368  				size - HVPIPE_HDR_LEN);
cebdb522fd3edd1 Haren Myneni 2025-09-09  369  		if (ret > 0) {
cebdb522fd3edd1 Haren Myneni 2025-09-09  370  			src_info->hvpipe_status &= ~HVPIPE_MSG_AVAILABLE;
cebdb522fd3edd1 Haren Myneni 2025-09-09  371  			ret += HVPIPE_HDR_LEN;
cebdb522fd3edd1 Haren Myneni 2025-09-09  372  		}
cebdb522fd3edd1 Haren Myneni 2025-09-09  373  	} else if (hdr.flags & HVPIPE_LOST_CONNECTION) {
cebdb522fd3edd1 Haren Myneni 2025-09-09  374  		/*
cebdb522fd3edd1 Haren Myneni 2025-09-09  375  		 * Hypervisor is closing the pipe for the specific
cebdb522fd3edd1 Haren Myneni 2025-09-09  376  		 * source. So notify user space.
cebdb522fd3edd1 Haren Myneni 2025-09-09  377  		 */
cebdb522fd3edd1 Haren Myneni 2025-09-09  378  		src_info->hvpipe_status &= ~HVPIPE_LOST_CONNECTION;
cebdb522fd3edd1 Haren Myneni 2025-09-09  379  		ret = HVPIPE_HDR_LEN;
cebdb522fd3edd1 Haren Myneni 2025-09-09  380  	}
cebdb522fd3edd1 Haren Myneni 2025-09-09  381  
cebdb522fd3edd1 Haren Myneni 2025-09-09  382  	return ret;
814ef095f12c9fa Haren Myneni 2025-09-09  383  }
814ef095f12c9fa Haren Myneni 2025-09-09  384  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
