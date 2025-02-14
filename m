Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC1186E40
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527375; cv=none; b=TiJatkW6ORqutTrhAcPqVu5oOGx5E2hhw2G3wOE4qZXjdVnKuDGrqMErGoe2oe72vvZ+3iPu1m9/Is+tI0+b54ypKebw70lr7Y4/io401ZhdJWqeiD45DmyxwvJq+VcgaLMqoJJtGt9PZ1oOmIxZ1Mtf3/onMZKKQNOl+BbNB6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527375; c=relaxed/simple;
	bh=LLVnEYU0ohogVRy2EtIRgeMx75D5h3J9qX2+lfGKets=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhq9uy0oT5aHTJkVCnJkwOt/MVMnSWBnGLLMgM2FmtRS7U+HyW19tGE8cXEjOUwOWLImxNExVZDQiJlgWldnBaqQ2sO6h6GNlD3RIECWmWxdWAeXP5MNrcnCeCOH9w7lkGQnlTBGn0s1IpipPne8VMmdlsdeIU+qE7UfCpdQUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAEog/xp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAEog/xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739527374; x=1771063374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLVnEYU0ohogVRy2EtIRgeMx75D5h3J9qX2+lfGKets=;
  b=MAEog/xpLkhHO5ow+z6B/FmApAjB6EaLMXx77FLZT81f57UjbX01t8o0
   vxm3oCQNqKsa3ZbhFV9cV4lBN/k1T9zQWrNSANLgJCwLcXDKU/XLrQTC/
   SU0PW3t7gukOWQg+4bxz7WLgbWi3FqbzRvIgiLwAMFn82F7WHD/qQ4DSM
   8VmlkIJ/S5A2+jz1m5M6ufdHLUFX0jvb4EwL/xzgDxFt7kT+mn4PvaW7e
   mDckdEFeWV7JzaFiKlAPkYphDHgHSFaMHswSOtS8ejU2uthAPWVPte4Cd
   AeXzyN6C3453gaaFaYRcCGHIApsQC8F0BJi6xgRU+2Wm63uU1VM1ngNk8
   w==;
X-CSE-ConnectionGUID: KgLgXmTKQc+6ZO4oUKnmsw==
X-CSE-MsgGUID: xT9mDmEHQd+tmU4/CTf1SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57677857"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="57677857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:02:53 -0800
X-CSE-ConnectionGUID: PpJ/5JnFRPWx1ETov17KiA==
X-CSE-MsgGUID: G7Ru1y/nQ6q4zMOznKyN7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="114058112"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2025 02:02:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tisX3-0019MZ-06;
	Fri, 14 Feb 2025 10:02:49 +0000
Date: Fri, 14 Feb 2025 18:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arm-platforms:kvm-arm64/fgt-masks 26/37]
 arch/arm64/kvm/emulate-nested.c:2073 aggregate_fgt() error: uninitialized
 symbol 'rmasks'.
Message-ID: <202502141754.Yq4j9d2M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/fgt-masks
head:   3412ba2237cce06d18ffa8c04b43b08e58cf37c2
commit: 1ff274dec2c5696a5ee65b99f7f0b87927b875bd [26/37] KVM: arm64: Compute FGT masks from KVM's own FGT tables
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141754.Yq4j9d2M-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502141754.Yq4j9d2M-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/emulate-nested.c:2073 aggregate_fgt() error: uninitialized symbol 'rmasks'.
arch/arm64/kvm/emulate-nested.c:2074 aggregate_fgt() error: uninitialized symbol 'wmasks'.

Old smatch warnings:
arch/arm64/kvm/emulate-nested.c:2082 aggregate_fgt() error: uninitialized symbol 'wmasks'.
arch/arm64/kvm/emulate-nested.c:2463 triage_sysreg_trap() error: uninitialized symbol 'val'.
arch/arm64/kvm/emulate-nested.c:2613 kvm_emulate_nested_eret() error: uninitialized symbol 'elr'.

vim +/rmasks +2073 arch/arm64/kvm/emulate-nested.c

1ff274dec2c569 Marc Zyngier 2025-01-24  2045  
1ff274dec2c569 Marc Zyngier 2025-01-24  2046  static __init bool aggregate_fgt(union trap_config tc)
1ff274dec2c569 Marc Zyngier 2025-01-24  2047  {
1ff274dec2c569 Marc Zyngier 2025-01-24  2048  	struct fgt_masks *rmasks, *wmasks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2049  
1ff274dec2c569 Marc Zyngier 2025-01-24  2050  	switch (tc.fgt) {
1ff274dec2c569 Marc Zyngier 2025-01-24  2051  	case HFGxTR_GROUP:
1ff274dec2c569 Marc Zyngier 2025-01-24  2052  		rmasks = &hfgrtr_masks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2053  		wmasks = &hfgwtr_masks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2054  		break;
1ff274dec2c569 Marc Zyngier 2025-01-24  2055  	case HDFGRTR_GROUP:
1ff274dec2c569 Marc Zyngier 2025-01-24  2056  		rmasks = &hdfgrtr_masks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2057  		wmasks = &hdfgwtr_masks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2058  		break;
1ff274dec2c569 Marc Zyngier 2025-01-24  2059  	case HAFGRTR_GROUP:
1ff274dec2c569 Marc Zyngier 2025-01-24  2060  		rmasks = &hafgrtr_masks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2061  		wmasks = NULL;
1ff274dec2c569 Marc Zyngier 2025-01-24  2062  		break;
1ff274dec2c569 Marc Zyngier 2025-01-24  2063  	case HFGITR_GROUP:
1ff274dec2c569 Marc Zyngier 2025-01-24  2064  		rmasks = &hfgitr_masks;
1ff274dec2c569 Marc Zyngier 2025-01-24  2065  		wmasks = NULL;
1ff274dec2c569 Marc Zyngier 2025-01-24  2066  		break;
1ff274dec2c569 Marc Zyngier 2025-01-24  2067  	}
1ff274dec2c569 Marc Zyngier 2025-01-24  2068  
1ff274dec2c569 Marc Zyngier 2025-01-24  2069  	/*
1ff274dec2c569 Marc Zyngier 2025-01-24  2070  	 * A bit can be reserved in either the R or W register, but
1ff274dec2c569 Marc Zyngier 2025-01-24  2071  	 * not both.
1ff274dec2c569 Marc Zyngier 2025-01-24  2072  	 */
1ff274dec2c569 Marc Zyngier 2025-01-24 @2073  	if ((BIT(tc.bit) & rmasks->res0) &&
1ff274dec2c569 Marc Zyngier 2025-01-24 @2074  	    (!wmasks || (BIT(tc.bit) & wmasks->res0)))
1ff274dec2c569 Marc Zyngier 2025-01-24  2075  		return false;
1ff274dec2c569 Marc Zyngier 2025-01-24  2076  
1ff274dec2c569 Marc Zyngier 2025-01-24  2077  	if (tc.pol)
1ff274dec2c569 Marc Zyngier 2025-01-24  2078  		rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
1ff274dec2c569 Marc Zyngier 2025-01-24  2079  	else
1ff274dec2c569 Marc Zyngier 2025-01-24  2080  		rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
1ff274dec2c569 Marc Zyngier 2025-01-24  2081  
1ff274dec2c569 Marc Zyngier 2025-01-24  2082  	if (wmasks) {
1ff274dec2c569 Marc Zyngier 2025-01-24  2083  		if (tc.pol)
1ff274dec2c569 Marc Zyngier 2025-01-24  2084  			wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
1ff274dec2c569 Marc Zyngier 2025-01-24  2085  		else
1ff274dec2c569 Marc Zyngier 2025-01-24  2086  			wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
1ff274dec2c569 Marc Zyngier 2025-01-24  2087  	}
1ff274dec2c569 Marc Zyngier 2025-01-24  2088  
1ff274dec2c569 Marc Zyngier 2025-01-24  2089  	return true;
1ff274dec2c569 Marc Zyngier 2025-01-24  2090  }
1ff274dec2c569 Marc Zyngier 2025-01-24  2091  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
