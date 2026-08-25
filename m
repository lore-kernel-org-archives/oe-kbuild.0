Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA53DD846
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655496; cv=none; b=jyu7zhY0n0C+sZbe9JQit4Y7NU+HBWaRNy7x/oFQAQEBYg7G6MwbgNDds6dVQZ2ei+4t9XDccdlQCYhxpDLtW45RyFJzl3XNXQ4yQBkhL2MShO1PQ1pVXJm01AomAG613YLfTOqm3hhr+VudGNQ4125NvUUTyS/HnoT+r2ZYalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655496; c=relaxed/simple;
	bh=QwLqO6Uy0Z84DqTJUbv8zm3Vk6wFDrfsmPzvuw15H7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yw4euHCvWxkftT2wO6pOZ1oQApHJ9RGyEqvC4PrD/Ya7SbHRF0/5JYH8TGM8ZCv37bbMlxTc1tTEmsJAsfuKmYJwTP/+Vadl4fb1SnRMlja9XrFqanMytIWX50ewRcqKeB1ywXhOvBf/tDaNCFccQzUaLCJEpaTX2xEsJsEBt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9Jb1b+/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9Jb1b+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787655494; x=1819191494;
  h=date:from:to:cc:subject:message-id;
  bh=QwLqO6Uy0Z84DqTJUbv8zm3Vk6wFDrfsmPzvuw15H7U=;
  b=h9Jb1b+/wZjR/wBSsgCheMAgHi0HdI2HTm9ZKj5+vkW577ZJSRiICo+8
   bcKR27S7Dus8lrlrtFqBddcyzbHh2ONL2CqFc1iCqJj0HgGrPXwkEsCsE
   wwQQVvS14lJ5gdolVk4tqJipoGyOG+ZQ4fZuf41IXr+PrunT4x3cPEWLi
   4GPw0MQZJaKNtMGyTVVgnc9qfhfZw7cyK01WunhYPvjyd7lbECm6Od2A6
   0X71oudB2bAS7tJNxc5zi/aaVkwmAUD4GYgCosnVRZ27ySfrJ0En+xLHv
   2tFt9BBbMn7DnMuciy5oTDyp1fp5bX0+ilXdmL7rNrPa5qIlWcrYLrKuA
   Q==;
X-CSE-ConnectionGUID: jRcNW8KrRsmbWx3c+XUhAA==
X-CSE-MsgGUID: tk1aMThkSnCN4DlsJt4CJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88247411"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88247411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:58:13 -0700
X-CSE-ConnectionGUID: XklXdLx1R5ec6sJ8GBmOTw==
X-CSE-MsgGUID: tJesWiZERDmsw20wbPmm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="269202254"
Received: from igk-lkp-server01.igk.intel.com (HELO 22bb5ec67d6c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Aug 2026 03:58:12 -0700
Received: from kbuild by 22bb5ec67d6c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyor3-0000000003P-0YMG;
	Tue, 25 Aug 2026 10:58:09 +0000
Date: Tue, 25 Aug 2026 12:57:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:slf/phy_pages_by_region 38/39]
 s390/irq_routing.c:39:15: error: too many arguments to function
 'vm_phy_pages_alloc'
Message-ID: <202608251231.CLZ2ufVM-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux slf/phy_pages_by_region
head:   f7a0856580f28caa93f5f4035bc62cebdbb0d279
commit: 5a6557301b9f5dbe5670344e26e577c05c514ccc [38/39] KVM: selftests: Automatically pick min_gpa for allocations based on region type
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260825/202608251231.CLZ2ufVM-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251231.CLZ2ufVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251231.CLZ2ufVM-lkp@intel.com/

Note: the sean-jc/slf/phy_pages_by_region HEAD f7a0856580f28caa93f5f4035bc62cebdbb0d279 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   s390/irq_routing.c: In function 'test':
>> s390/irq_routing.c:39:15: error: too many arguments to function 'vm_phy_pages_alloc'
      39 |         mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
         |               ^~~~~~~~~~~~~~~~~~
   In file included from s390/irq_routing.c:16:
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
