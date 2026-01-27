Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763B34CFC7
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769517749; cv=none; b=QtqrBXBmOfNSvYaCPOkmtIqK1nWwnSxAZkTxuDoc0SqqCQabnxvV5fe4EdBIXlySNy+EPS42gTBF4IcVgTXs66jWlq9YkpuDn/suFphgZ/yQywy2qjYQHAWmKiDipE5zhHIA6MgJKFagMQ4HUAoYjupDg/Hnuz37suy42HsmK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769517749; c=relaxed/simple;
	bh=sy3H+SP03WqbolRO/Y8jQ1AwneB5x4NfvSJlzrYf93I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iSb/LB75oHwpdSpG4LKUVyKU2JKg6UUuwfyGCMT96rsMylop82RybGgB9EPm9gbnQu/mEoE4a1Q6hcHNVPyGpTSUl8MdS60sQ19OJgllAmt9kPPPxFNC+eGsbnBZHIXPPKP/6gREt1N2pf+QDHDVOc515vClUZa6QYiS3z/4Eks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QF2HWltV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QF2HWltV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769517748; x=1801053748;
  h=date:from:to:cc:subject:message-id;
  bh=sy3H+SP03WqbolRO/Y8jQ1AwneB5x4NfvSJlzrYf93I=;
  b=QF2HWltVmV+4QQPECUfiZ5h5V9D8QypJFBPmSZB4Du94Vx7ZxYvHa7+L
   suix/KdxFbc8OSRhoRJzRQu3NPMtBXjWk32r+kibJdmkURrEaXD8ztRaH
   PORzGwNHFLiWvQjp70EKiaIo8pWZCMbkCf7dTByMRCjpzT+BcHod2Vfz9
   pZdjwd1YvScp+UcXWY/P4RhQa216m0xTepeMukiiFv7SRQvWLwllFo1at
   zjDKoe36DYZs5cMVzCFwlux1tF1qYp0a4xaLj8OQUe2/aj+svQO0M80Ur
   PiNuC4rp1ZnWHJ1SuZvHQdbZB94vD948wmyFB/nM9/XgkQ/VOASNH1bn8
   Q==;
X-CSE-ConnectionGUID: GEdO1xxCRUCLbim7S7XRBw==
X-CSE-MsgGUID: wT4HqsPqQuelUmIU9EKgig==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81433631"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81433631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:42:27 -0800
X-CSE-ConnectionGUID: GtoDh47rRWO+gcgYsUbw2Q==
X-CSE-MsgGUID: NtVOvAV9Sc6M19LnlrA8sw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 04:42:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkiOl-00000000YTY-27cd;
	Tue, 27 Jan 2026 12:42:23 +0000
Date: Tue, 27 Jan 2026 20:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1641/9596]
 drivers/regulator/rt8092.c:311:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601272051.gZRPdLgw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/regulator/rt8092.c:311:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: ChiYuan Huang <cy_huang@richtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: 32a708ba5db50cf928a1f1b2039ceef33de2c286 [1641/9596] regulator: Add rt8092 support
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
config: arc-randconfig-r113-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272051.gZRPdLgw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272051.gZRPdLgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272051.gZRPdLgw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/rt8092.c:311:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:311:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/regulator/rt8092.c:312:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:312:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/regulator/rt8092.c:313:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:313:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/regulator/rt8092.c:313:1: sparse: sparse: bad integer constant expression
   drivers/regulator/rt8092.c:313:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +311 drivers/regulator/rt8092.c

32a708ba5db50c ChiYuan Huang 2025-12-19  310  
32a708ba5db50c ChiYuan Huang 2025-12-19 @311  MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
