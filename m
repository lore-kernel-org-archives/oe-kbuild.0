Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A118A6A8
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818212; cv=none; b=d0lkZXr7Zid2CD6ziVckdW51ZiBap4NXcRCS3FnFLsnFnSmuTaZtJN0egy7QWvlM4N1lWxDR+nfrSL4kK21s1hPunATsQH4nahcLQwF+rZCuWzrjqG3YTQwl3kFWtP14QwpAtP4d8lZYUHgN3+dEzAXjDgpjNVgAkhzUtvRQQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818212; c=relaxed/simple;
	bh=9rbZkIx7EsH21mXzfhfcOEcYAzCeHBNg6/WfNqeAVQE=;
	h=Date:From:To:Subject:Message-ID; b=Um0RR+IM2cGZHkPV2+qq9Y9Lz4Hsv/ySufCwZvg2e50XH62+uz+6jQ1VfzJQMjbq4WMUEy9DEOCJAmD5nXZI084KaGsZln4pd+tjNPbv9w8x5mWLvh2lEszrt+G7vgDmr5SFHgm8ShT0F3skKXlN50Lb4WAlBdzSXX2KnzUiYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AC/CERvr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AC/CERvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769818211; x=1801354211;
  h=date:from:to:subject:message-id;
  bh=9rbZkIx7EsH21mXzfhfcOEcYAzCeHBNg6/WfNqeAVQE=;
  b=AC/CERvrgGslsm1m0TPBqv7cVy5IGT0+N10tk5bwxt60wyuT7L0/tKhs
   ZKTK1p0LpECZRWN6jKmg0gu6lEsf0PPpci3O813tCqM+zMyD9uHBLoM1T
   Qtyg+2cNR2z8w5Ans3BWqecPqLb1OEBRvCcfF59rReHmbA0EJgyML+gYI
   MZiGLKQz8b8tbH4CGOClRZzrloBivxhKYq/AuqFUZPft13bvTTAuDnSnS
   olAkmpQsFzd3fdCwFTF+dWoBvsKFC5n/iVOl2xWCA890ZWPsxUCMewlDo
   RzTMXTWzGez1JuXuwVCH+HWsvgHpwDmlfpyEdjDLjcdEk2fJvpUoJZE2x
   Q==;
X-CSE-ConnectionGUID: r28wa34yTz+HqUELd04xmg==
X-CSE-MsgGUID: mggbqx4PThKgmJtoJbbVyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82182073"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82182073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:10:11 -0800
X-CSE-ConnectionGUID: tTih3lOTTn6BB6pBnYiFbg==
X-CSE-MsgGUID: uY1aD56MQZuIYUaqTqFVEA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 16:10:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlyYy-000000002aX-1IR9
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:10:08 +0000
Date: Sat, 31 Jan 2026 01:09:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 11/23] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601310111.yPmUoUQg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260130-1
head:   8613a3fd5b6e088624accc0967f5a063f0dd02eb
commit: a51e388b723bab84b3914c7a2529c47d6d39ea4f [11/23] RDMA/hfi2: Add in trace header files
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310111.yPmUoUQg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#83: FILE: drivers/infiniband/hw/hfi2/trace_ctxts.h:3:
+/*
+* Copyright(c) 2015 - 2020 Intel Corporation.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#204: FILE: drivers/infiniband/hw/hfi2/trace_dbg.h:3:
+/*
+* Copyright(c) 2015 - 2018 Intel Corporation.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#852: FILE: drivers/infiniband/hw/hfi2/trace_misc.h:3:
+/*
+* Copyright(c) 2015, 2016 Intel Corporation.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1251: FILE: drivers/infiniband/hw/hfi2/trace_rc.h:3:
+/*
+* Copyright(c) 2015, 2016, 2017 Intel Corporation.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
