Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE427462
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766091934; cv=none; b=Jm9UgfV8BnNlCvRvLtn+0wDUXy0jlLlrClhH4gRqBCI4gj7j/ZwiHsOaAYrGreK1k21JK6tThCSLP9bHNSCJasEdE2uxjUnLlvl8YA8VGNHhvzqp9H3gImxChdSfILbXB2RgI6mE57h3sc2idS919/eXZ7sBkELxNr06HqHmlxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766091934; c=relaxed/simple;
	bh=/Gfyw6iK1WgJbmhk2E/Cty9LNv5me67DGyv2lWTBi68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHMaC7tRyMDkoxik+F1YoZ38Z/dh5RuHZ3MQ81MbJFdi8Rs9Ex25owgW9dor6bsmQlXceIxZGZ3AngcDT3JWrPPkx/SakyeQh1U9Cmc0xMmrkAUOyN9LOFD4sxhg145lsCieSozlvlDqYkHt9OGsuH3lYn/J9mk9ukDXaFfyVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jhix32Jg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jhix32Jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766091933; x=1797627933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Gfyw6iK1WgJbmhk2E/Cty9LNv5me67DGyv2lWTBi68=;
  b=Jhix32JgvyleXFFxw4DHqzDyny3bopMdzDavbRKyQUKKUIueEc517z+Z
   gVA3vITHvE+omQ/qGb5oiV+5H5OACu08vHmeJ7p/6FjsYzbX/bcmRPfrJ
   i3B5+boXG29nzt5CbAeiI1PBFWYqpyzvKWsiLfxrTCcnuJAOJkvBsARDA
   +7MfP+60/yaPbICyIOOr+K9uQCEn/k/fSEv41KxJDvwqn+dwgDrGYs1Zq
   g9/j8SDi95rwCqizUhiTdpjic2qxSA6Lxan3rMm6BMO8X5xlFrz63h+Xf
   AJVlMstaH7mKlG80zLcV1ozD0xnwyVv1bZ6SpYFv2u9I+fQ1zrqQMbH3I
   Q==;
X-CSE-ConnectionGUID: 4Oa60xsjQi2qKP9ZLyxk5w==
X-CSE-MsgGUID: 3Tp9jHIxSxytRUpEs6SQuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79513534"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="79513534"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:05:32 -0800
X-CSE-ConnectionGUID: nmmciuocRsC+WEHpRvdfYw==
X-CSE-MsgGUID: WJtzIvxGSdCljJ7wU1EGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229359196"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2025 13:05:30 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWLBf-000000002ev-32Vm;
	Thu, 18 Dec 2025 21:05:27 +0000
Date: Fri, 19 Dec 2025 05:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/emulate-nested.c:2073 aggregate_fgt() error:
 uninitialized symbol 'rmasks'.
Message-ID: <202512190533.dj1bb5sJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 1b8570be89f8436b25bddc8afd7e54fcd906c3aa KVM: arm64: Compute FGT masks from KVM's own FGT tables
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r072-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190533.dj1bb5sJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512190533.dj1bb5sJ-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/emulate-nested.c:2073 aggregate_fgt() error: uninitialized symbol 'rmasks'.
arch/arm64/kvm/emulate-nested.c:2074 aggregate_fgt() error: uninitialized symbol 'wmasks'.

Old smatch warnings:
arch/arm64/kvm/emulate-nested.c:2082 aggregate_fgt() error: uninitialized symbol 'wmasks'.
arch/arm64/kvm/emulate-nested.c:2594 kvm_emulate_nested_eret() error: uninitialized symbol 'elr'.

vim +/rmasks +2073 arch/arm64/kvm/emulate-nested.c

1b8570be89f843 Marc Zyngier 2025-01-24  2045  
1b8570be89f843 Marc Zyngier 2025-01-24  2046  static __init bool aggregate_fgt(union trap_config tc)
1b8570be89f843 Marc Zyngier 2025-01-24  2047  {
1b8570be89f843 Marc Zyngier 2025-01-24  2048  	struct fgt_masks *rmasks, *wmasks;
1b8570be89f843 Marc Zyngier 2025-01-24  2049  
1b8570be89f843 Marc Zyngier 2025-01-24  2050  	switch (tc.fgt) {
1b8570be89f843 Marc Zyngier 2025-01-24  2051  	case HFGRTR_GROUP:
1b8570be89f843 Marc Zyngier 2025-01-24  2052  		rmasks = &hfgrtr_masks;
1b8570be89f843 Marc Zyngier 2025-01-24  2053  		wmasks = &hfgwtr_masks;
1b8570be89f843 Marc Zyngier 2025-01-24  2054  		break;
1b8570be89f843 Marc Zyngier 2025-01-24  2055  	case HDFGRTR_GROUP:
1b8570be89f843 Marc Zyngier 2025-01-24  2056  		rmasks = &hdfgrtr_masks;
1b8570be89f843 Marc Zyngier 2025-01-24  2057  		wmasks = &hdfgwtr_masks;
1b8570be89f843 Marc Zyngier 2025-01-24  2058  		break;
1b8570be89f843 Marc Zyngier 2025-01-24  2059  	case HAFGRTR_GROUP:
1b8570be89f843 Marc Zyngier 2025-01-24  2060  		rmasks = &hafgrtr_masks;
1b8570be89f843 Marc Zyngier 2025-01-24  2061  		wmasks = NULL;
1b8570be89f843 Marc Zyngier 2025-01-24  2062  		break;
1b8570be89f843 Marc Zyngier 2025-01-24  2063  	case HFGITR_GROUP:
1b8570be89f843 Marc Zyngier 2025-01-24  2064  		rmasks = &hfgitr_masks;
1b8570be89f843 Marc Zyngier 2025-01-24  2065  		wmasks = NULL;
1b8570be89f843 Marc Zyngier 2025-01-24  2066  		break;
1b8570be89f843 Marc Zyngier 2025-01-24  2067  	}
1b8570be89f843 Marc Zyngier 2025-01-24  2068  
1b8570be89f843 Marc Zyngier 2025-01-24  2069  	/*
1b8570be89f843 Marc Zyngier 2025-01-24  2070  	 * A bit can be reserved in either the R or W register, but
1b8570be89f843 Marc Zyngier 2025-01-24  2071  	 * not both.
1b8570be89f843 Marc Zyngier 2025-01-24  2072  	 */
1b8570be89f843 Marc Zyngier 2025-01-24 @2073  	if ((BIT(tc.bit) & rmasks->res0) &&
1b8570be89f843 Marc Zyngier 2025-01-24 @2074  	    (!wmasks || (BIT(tc.bit) & wmasks->res0)))
1b8570be89f843 Marc Zyngier 2025-01-24  2075  		return false;
1b8570be89f843 Marc Zyngier 2025-01-24  2076  
1b8570be89f843 Marc Zyngier 2025-01-24  2077  	if (tc.pol)
1b8570be89f843 Marc Zyngier 2025-01-24  2078  		rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
1b8570be89f843 Marc Zyngier 2025-01-24  2079  	else
1b8570be89f843 Marc Zyngier 2025-01-24  2080  		rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
1b8570be89f843 Marc Zyngier 2025-01-24  2081  
1b8570be89f843 Marc Zyngier 2025-01-24  2082  	if (wmasks) {
1b8570be89f843 Marc Zyngier 2025-01-24  2083  		if (tc.pol)
1b8570be89f843 Marc Zyngier 2025-01-24  2084  			wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
1b8570be89f843 Marc Zyngier 2025-01-24  2085  		else
1b8570be89f843 Marc Zyngier 2025-01-24  2086  			wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
1b8570be89f843 Marc Zyngier 2025-01-24  2087  	}
1b8570be89f843 Marc Zyngier 2025-01-24  2088  
1b8570be89f843 Marc Zyngier 2025-01-24  2089  	return true;
1b8570be89f843 Marc Zyngier 2025-01-24  2090  }
1b8570be89f843 Marc Zyngier 2025-01-24  2091  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
