Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1565258EFF
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818453; cv=none; b=upEGA4NzdvXe0Svlgc35xi0Z2g3ReREdD5Q3fHrPzEm/hLq/yI3MT6aJIENWKEACkAWej3GIHehrKDH67L6NaXi5wYZipSkpYKpS2ZksqrDoihxjCC4hwPNNngKMtGy+RKIQYogyOS8zymQRMUhJT6IK3h4nrXx4SHpaOwNCmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818453; c=relaxed/simple;
	bh=IEUH6Fy9cn7QXfqcCamP9xeGUgGJt2CuEK3/LsEnlic=;
	h=Date:From:To:Subject:Message-ID; b=MNHF2mA5CnQT8aMHs8Z343B1dB4CnqU4Msns+Xoz20dg9+K8idm4ONKj+qoCwmuk5ERQAiOcjM/JgPePC9r916z1PeY1JNAU8RO9DWB337U/GgdZ3Z5vbDRYKHvbU1ahPQVO+8WObrwk4pbWKpyP7E3mlvMtAJcFA3SfkrpVVco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL/v1yy6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL/v1yy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769818451; x=1801354451;
  h=date:from:to:subject:message-id;
  bh=IEUH6Fy9cn7QXfqcCamP9xeGUgGJt2CuEK3/LsEnlic=;
  b=BL/v1yy6ULOOLDhKH5B/WHkNwDO3rb0PLp5/A3yvaIw9UtiUSkm8ZKG3
   CBm4oiCqi/V8B4N2gq0Kr8bhgKlSwVApl4zdgYwtz4PkYKAo9HUZNaDgL
   jcABXXpptrg7y2QiGsF4+sHO61ALVr5qxl1aJVHDvcrdTdPoHznL8sQAN
   oxg+bx2EJjz+Gp2QuFWjtgw7QDZs4q1YqLFk+tLcf3CR1Q8KGorHgL8vF
   tlKmWNEWy7/p+M8wZYUTy9gTZuxpOzWLh1fqrftf6nGUN9oqW/jw6ZLWE
   qm9/dTqQmNYs9zOTm2Z9FIV+Hzyz5MIUySnq55EVkmVbcmxhAwGzq31Jh
   Q==;
X-CSE-ConnectionGUID: sZOom3mBQLSUm32908rAWw==
X-CSE-MsgGUID: BKJLqUtFQVimiuuhf1U6eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71157566"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71157566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:14:11 -0800
X-CSE-ConnectionGUID: jQpNXbKMSwCvAZhBaz9S9w==
X-CSE-MsgGUID: UoSseTMGTEuwgBRH8YDFHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208095308"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2026 16:14:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlycq-000000002b4-2XbC
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:14:08 +0000
Date: Sat, 31 Jan 2026 01:13:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 18/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'until'
Message-ID: <202601310107.1s4XjRFN-lkp@intel.com>
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
commit: edf3acd8a1d22f6b41b915cb27728011227e9a6c [18/23] RDMA/hfi2: Implement data moving infrastructure
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310107.1s4XjRFN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#4844: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:71:
+		 * copy until until the wrap, then wrap.

WARNING:REPEATED_WORD: Possible repeated word: 'from'
#4947: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:174:
+ * o do not read from from if nbytes is zero

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#5075: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:302:
+		 * copy until until the wrap, then wrap.

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#5170: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:397:
+	 * copy until until the wrap, then wrap.

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#5296: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:523:
+	 * copy until until the wrap, then wrap.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#8873: FILE: drivers/infiniband/hw/hfi2/sdma.c:3385:
+			/*
+			* SW initiated halt does not perform engines

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
