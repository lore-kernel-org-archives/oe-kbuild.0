Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF4C26ED46
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778348875; cv=none; b=Btfk2VdWoPOe3KI8qDQeaY7mD7DjRVUuDReKCd4EopJY/aypVWN8qzQPDFSWrcqJIkQfas5OG7pa6nOaI39RjMkqdDfblCF2CVElULE4ellsqNRCv+uaf1+Xzu0RNlrT+mmIBq0hTYmSWHvxXZB73EEy+b2SRUZ83JzCiUp7Kuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778348875; c=relaxed/simple;
	bh=laTJ7JZic/BAnNB3OYFFrZDCLLJ2zHNSIw4hMDCPNag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WFb7mPk5bh4gwxFOsTN3QWNgzXDpdK7kd4bIbStzEs2Gzly7R/i+Z3kp3E6c4YsyypJqhIaOq3PN58cycLpC4+AsCad4Jdufg0ihv1ieSi4DQcQI2Lp3XlqcQV8Ty70RL29rNNw4gW8oj/0HlCEH2PXQUB9MWPx1nLJhMAQnsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jh+L0uOC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jh+L0uOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778348873; x=1809884873;
  h=date:from:to:cc:subject:message-id;
  bh=laTJ7JZic/BAnNB3OYFFrZDCLLJ2zHNSIw4hMDCPNag=;
  b=Jh+L0uOC/JHmdSBLfd+JUgTq0doAmlYgQlQd7kGwfZXe7tlgaEJ+eBUw
   qCiH7M/7rlnGqGuhUJmTQhWBjoP/MsORSL4KIaTEhNWIEDmMkX/9mUtWT
   Sz1TavOrjQwSKku9HH4OM6NgnvsMhuV0vzFN4091zV7Wf0GReiJDSibPp
   z98PiRpdR6C65303Y/+iANE9xUMSpgx02H1UiITAE7LZudGHarfMJeOpF
   Rc3bmO6JSjrio2/WlmEw+jxEgyq65y+BGI9zvy7EriyhdtFPSF+Yy9Twl
   fztPqBIhORBEia7WYY8pwc0DM6bPTLJZTBzUH0PEei78Nzcyovb7Sn2ED
   Q==;
X-CSE-ConnectionGUID: JQXXfd66QqyLXvTBSYfB2A==
X-CSE-MsgGUID: OFBCKsTnRkCgMaGTpfGPpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79337535"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79337535"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 10:47:53 -0700
X-CSE-ConnectionGUID: OpNjp2pVRFmEA4BEm2AF5g==
X-CSE-MsgGUID: ulgX9TAOSc+XhgM+6wJQvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232714726"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 10:47:52 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLlmH-000000001GD-32Ii;
	Sat, 09 May 2026 17:47:49 +0000
Date: Sun, 10 May 2026 01:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kas:uffd/v2 7/14] include/linux/mm.h:4618
 gup_can_follow_protnone() warn: bitwise AND condition is false here
Message-ID: <202605100132.U77SlLEg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/v2
head:   0b6f87fd4809245f9eebee73f34e2fb14230330c
commit: c88e78ffb2cc5ca81f5a6319b7e3c4ffd8baefe1 [7/14] mm: handle VM_UFFD_RWP in khugepaged, rmap, and GUP
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: m68k-randconfig-r073-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100132.U77SlLEg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605100132.U77SlLEg-lkp@intel.com/

smatch warnings:
include/linux/mm.h:4618 gup_can_follow_protnone() warn: bitwise AND condition is false here

vim +4618 include/linux/mm.h

9a291a7c9428155 James Morse            2017-06-02  4605  
474098edac262ae David Hildenbrand      2022-08-25  4606  /*
474098edac262ae David Hildenbrand      2022-08-25  4607   * Indicates whether GUP can follow a PROT_NONE mapped page, or whether
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4608)  * a (NUMA hinting or userfaultfd RWP) fault is required.
474098edac262ae David Hildenbrand      2022-08-25  4609   */
da0045587d59d4f Max Kellermann         2025-09-01  4610  static inline bool gup_can_follow_protnone(const struct vm_area_struct *vma,
d74943a2f3cdade David Hildenbrand      2023-08-03  4611  					   unsigned int flags)
474098edac262ae David Hildenbrand      2022-08-25  4612  {
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4613) 	/*
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4614) 	 * VM_UFFD_RWP uses protnone as an access-tracking marker, not for
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4615) 	 * NUMA hinting. GUP must always take a fault so the access is
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4616) 	 * delivered to userfaultfd, regardless of FOLL_HONOR_NUMA_FAULT.
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4617) 	 */
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22 @4618) 	if (vma->vm_flags & VM_UFFD_RWP)
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4619) 		return false;
c88e78ffb2cc5ca Kiryl Shutsemau (Meta  2026-04-22  4620) 
474098edac262ae David Hildenbrand      2022-08-25  4621  	/*
d74943a2f3cdade David Hildenbrand      2023-08-03  4622  	 * If callers don't want to honor NUMA hinting faults, no need to
d74943a2f3cdade David Hildenbrand      2023-08-03  4623  	 * determine if we would actually have to trigger a NUMA hinting fault.
474098edac262ae David Hildenbrand      2022-08-25  4624  	 */
d74943a2f3cdade David Hildenbrand      2023-08-03  4625  	if (!(flags & FOLL_HONOR_NUMA_FAULT))
d74943a2f3cdade David Hildenbrand      2023-08-03  4626  		return true;
d74943a2f3cdade David Hildenbrand      2023-08-03  4627  
d74943a2f3cdade David Hildenbrand      2023-08-03  4628  	/*
d74943a2f3cdade David Hildenbrand      2023-08-03  4629  	 * NUMA hinting faults don't apply in inaccessible (PROT_NONE) VMAs.
d74943a2f3cdade David Hildenbrand      2023-08-03  4630  	 *
d74943a2f3cdade David Hildenbrand      2023-08-03  4631  	 * Requiring a fault here even for inaccessible VMAs would mean that
d74943a2f3cdade David Hildenbrand      2023-08-03  4632  	 * FOLL_FORCE cannot make any progress, because handle_mm_fault()
d74943a2f3cdade David Hildenbrand      2023-08-03  4633  	 * refuses to process NUMA hinting faults in inaccessible VMAs.
d74943a2f3cdade David Hildenbrand      2023-08-03  4634  	 */
d74943a2f3cdade David Hildenbrand      2023-08-03  4635  	return !vma_is_accessible(vma);
474098edac262ae David Hildenbrand      2022-08-25  4636  }
474098edac262ae David Hildenbrand      2022-08-25  4637  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
