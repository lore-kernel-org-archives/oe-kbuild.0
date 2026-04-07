Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC2377035
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534330; cv=none; b=sBzTYNBSUJH3DqfAi3zMsnLnMJ3aAutVcZU8PuErjSOKFMGBPqmCOnEU1seeHkEZ/1ewNqdz43cp5IxppC42To93S3FLqpADsZYB0Sl9RX6nKufPin0+JyCXVRzWXwnRFCwvqFP0cIDiFccnjpJckOqqe3nRDLtt5YDVXsE86H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534330; c=relaxed/simple;
	bh=WKCQLSTr7hMTNiB7RRL0YYUmKkN6jX8fBBh5p0Y2p0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KFjJpVJ/0t7SlHwjyAtidMK7mqYtSe/5/Q/SicPNboxEdRqJRU1jkclIe9XolUfrZ+3P7w4pWfVHX71+12jIcfYIBPFdpYs8rAbTouL3WJjlqZ6Lo/1bsAvZd/9Up9/zJ/U/PHvQ2axM0KmsLmgTaISZRV9B2KKhLLbUKugGHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+eXNQwZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+eXNQwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534322; x=1807070322;
  h=date:from:to:cc:subject:message-id;
  bh=WKCQLSTr7hMTNiB7RRL0YYUmKkN6jX8fBBh5p0Y2p0A=;
  b=X+eXNQwZ/CJj2qFli3qg9PrdHOrKpIDYBdXm6W+TKcmc1mcw8Zhc1hH6
   4VBDlo3TB4XPctobAv0+Vsm+CjEuMD1QO/ZQaA0BxK8N1tA7LB5jDf8pN
   6dNBBqd1ZzEjxU0HqGFa4JLLayIorvi5Rg7bpoxNTgk6FOgtn1Y3iLbeW
   jt7gUTGawWsRP76hG5bvROEyr80CxeIczyafgQGl05N7h2fTwALCZoYSD
   hmZQtvuBAm0VlLVkNoWaXl+ESm6kPxI3MiVvX5rDUMdk09Y6jNr+FE9k2
   902UqDkNodbK1xh41N4fvt7ntW9V9Aij32menIJz7ewkai52yN81kogN8
   w==;
X-CSE-ConnectionGUID: 4an2tevOSJyNQ4kFIVVpUQ==
X-CSE-MsgGUID: s1coI+9JRpmTj47l7ZNBxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76369555"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76369555"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:58:36 -0700
X-CSE-ConnectionGUID: OAsbPH/nSly0npbGFCEeSw==
X-CSE-MsgGUID: 445Nrag5TpqwUnjiVUZk/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232091291"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:58:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xaD-0000000006B-0h74;
	Tue, 07 Apr 2026 03:58:33 +0000
Date: Tue, 07 Apr 2026 11:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 14/35] vmlinux.o: error: objtool:
 sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0
Message-ID: <202604051228.JLTSLcIi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   96a27804fbb34c0e19f217848a8cbb91841bcc35
commit: 34289a9c265ced49097f0b40855c8b19a0cd62e9 [14/35] objtool: Don't copy insn->sym for alternative replacements
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-014-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051228.JLTSLcIi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051228.JLTSLcIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604051228.JLTSLcIi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
