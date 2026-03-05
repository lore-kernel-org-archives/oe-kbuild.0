Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D5274FE3
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680484; cv=none; b=Lv8W0VZGJmNrCYiF2hCILh+HAXMcW9Okj3C04NtEdGRBXMETCWFddxsdf0Q3IvA2CBayvGxe21AnYcUN7B9zO/Z6sBN8AsQZ1bkgDMPbnImvnVBWj7BRvtaECOKO0pv1+k4+2iV47DK/SCd4pYVvV6Z3j58/6wO4B+RDBieL93g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680484; c=relaxed/simple;
	bh=rWZFjBAm3812qNbHEvcDO7hr21EPZM1KFUZL0pe1c5M=;
	h=Date:From:To:Subject:Message-ID; b=G6E+a15t8dIvV4j3NAX4FNoqiEB5f53n+OTU4NombNidSBGzcQv9oZnUH/J/T/LxsR2JMFcHaB1xbZbEYBQzj1Sr96G2j0yTdvcuiStJlvB2B7kQJ7KUKDohTAyvXd6pLqEPhMdVcehlU8yCPvZIHjJ6vwLAUyOCp/KTpnqMuwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCJAf4R5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCJAf4R5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680482; x=1804216482;
  h=date:from:to:subject:message-id;
  bh=rWZFjBAm3812qNbHEvcDO7hr21EPZM1KFUZL0pe1c5M=;
  b=kCJAf4R50LIvohss7rakbWXW5LyjoE8uHzLqKF1rrrgMqJE6QYxjkCLL
   /9F42q/2Qh+oUh8o3xsgqN7seR1RE5PpT9RxkxqSQLxT7/RRw9YCZms2M
   gfiLJGN7kZuulPgexYVnwQfeYq6+XbNm4vuSZlHjvxshYdL6FUq+9p6RH
   68NU2vxV5omECrJe+6Dbi5HoBV/+Sc14ho/WtQk4kByTvn1fgz4uUHBjw
   2csx+QSvwnE4TMYUU8K27ETkD3dgoMHsqhZWb67soGUhNy4yyPwdtWL9Z
   eo9HsUi6jW955rVX+BSqTKo7faocymcKAfaG8GHXLsaZxH3LS+6uhUOn6
   g==;
X-CSE-ConnectionGUID: lCR8UikrRHapXmsQSQTitQ==
X-CSE-MsgGUID: Il+MCMQNSqG2QimVBkmbig==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328484"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: 5/aQEhWSTomo5s3Q6yH2WA==
X-CSE-MsgGUID: bA5LMgFfS96Z+pOzOcigWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014069"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001th-2ta7
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 432/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050440.PDNjhiui-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 1899b9ced9fa5604578784a78cd9cf9c0af01148 [432/467] x86/kernel: convert itmt debugfs fops to read/write iterators
:::::: branch date: 62 minutes ago
:::::: commit date: 62 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050440.PDNjhiui-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: arch/x86/kernel/itmt.c:42:
+static ssize_t sched_itmt_enabled_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
