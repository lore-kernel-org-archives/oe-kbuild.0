Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA931F9AB
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775906722; cv=none; b=qDctuumCKTpeKB2QpKAlAWgCB3+fw6KZM2YKOOmZeQlj3bUKgkRhwjKDQfM7hKiBeyzrLQANG6CrvnTzCE+YdjY+ZKWB6WnHouic5/0/ZCcc4zhxUKtafLLfl7cUlL7uSdcR+xVZSvpsqTk3LgbU5xmLOAa250033CUA/twLdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775906722; c=relaxed/simple;
	bh=O7OB04cmnzya52d19YoU2+DsBGbzH9BfpTNaNJbgCqQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ilkm0Tivi8NTYVGoTLUmjCOItCjRNsC3wceKnqg+7cvZ4JvLErao4hHnIUgm9mDX8UPwfnTfL+9T7pli2EdrF8eKdMH9Z5TxH18mezhpUOEpd56araO7e+D5jdecMaj4lR9yyNZwdRUQF3sCfRwNG7L6Cz6e7q63ipcPllX15LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyogpRA+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyogpRA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775906721; x=1807442721;
  h=date:from:to:cc:subject:message-id;
  bh=O7OB04cmnzya52d19YoU2+DsBGbzH9BfpTNaNJbgCqQ=;
  b=CyogpRA+wT5Yy/9L1xdMzdUNLzFm+zgBeBvLEb1+p2bvjdkpv62MD1XT
   ZZ+wd8xXfaIKklnFuoURjH8XJnz2YGv8QrCdHFAG5k9D90VewpYT3elHz
   wMIqrD51El1KSRi4nchFJe+eRLAWSQVtEv+BaHkKrA8Nk4ZYVNyOkvN3T
   +izqavy6WATdLuzY1zOFEebuWN0rRjrsBv4AvBhQRVz+jzssm63c751xz
   KFnk0yF2nAkQSW3rd9dUJ4ygQ/gYrlOHxYHh5uiKOcs88FGT3rJ5zShdd
   I1gEmYWpmtO+vJYx/CpPzQcAToN1rPCWCLY2le08itCrGuwDUoamOoXKb
   Q==;
X-CSE-ConnectionGUID: y6xwwkaoTkqBD+v5KDTT/g==
X-CSE-MsgGUID: oHXctwQyQ4idCDPcd5dQAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76818147"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76818147"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 04:25:20 -0700
X-CSE-ConnectionGUID: nFXPz25AQgqwHIZ1G3G5gg==
X-CSE-MsgGUID: JsRYc7WeSCm5+jtELt2BSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="267304915"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2026 04:25:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBWSi-00000000B49-2qmX;
	Sat, 11 Apr 2026 11:25:16 +0000
Date: Sat, 11 Apr 2026 13:25:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/stackmap.c:172:42: error: implicit declaration of
 function 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'?
Message-ID: <202604111343.uFEJZS6D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ihor Solodrai <ihor.solodrai@linux.dev>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/bpf-Avoid-faultable-build-ID-reads-under-mm-locks/20260411-130435
head:   f8deb0e1c083c7f024a2e93514e2715c37899388
commit: f8deb0e1c083c7f024a2e93514e2715c37899388 bpf: Avoid faultable build ID reads under mm locks
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260411/202604111343.uFEJZS6D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111343.uFEJZS6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111343.uFEJZS6D-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/stackmap.c: In function 'stack_map_lock_vma':
>> kernel/bpf/stackmap.c:172:42: error: implicit declaration of function 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'? [-Wimplicit-function-declaration]
     172 |         if (range_in_vma(vma, ip, ip) && vma_start_read_locked(vma))
         |                                          ^~~~~~~~~~~~~~~~~~~~~
         |                                          vma_assert_write_locked


vim +172 kernel/bpf/stackmap.c

f8deb0e1c083c7 Ihor Solodrai 2026-04-07  161  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  162  static struct vm_area_struct *stack_map_lock_vma(struct mm_struct *mm, unsigned long ip)
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  163  {
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  164  	struct vm_area_struct *vma;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  165  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  166  	vma = lock_vma_under_rcu(mm, ip);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  167  	if (vma)
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  168  		return vma;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  169  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  170  	mmap_read_lock(mm);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  171  	vma = find_vma(mm, ip);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07 @172  	if (range_in_vma(vma, ip, ip) && vma_start_read_locked(vma))
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  173  		goto out;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  174  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  175  	vma = NULL;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  176  out:
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  177  	mmap_read_unlock(mm);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  178  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  179  	return vma;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  180  }
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  181  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
