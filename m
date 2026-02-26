Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B3F44D68A
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137343; cv=none; b=N2UWSm4HGnHSd57VYp+9hlRMFN/ZnMsaeEWw4fum38A65toZdT0iYURmOwuXmoKL85KFT/iMShMaR/RoxfpwB5nIahEeCavBIYMuwf1CbhE+MLsNu+mRCI9sOsNTdiJ5Clou0POoYcUvqUlQWKfZlzL2JB0SDkrnmVDzdRbrGcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137343; c=relaxed/simple;
	bh=xUQLO09KdUQFTy1WOkl0ixVpeIKrCIiXgRWl3vZtTog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KvuwpUeRTQNhsv42zR3w01Of+aztIeTKBCTsNM/mYmWZM5V1hpX7XgJco5ZeGarR61x5IU0Ol62jzON2HyBL2gI7BsaabRhXArybnc1rI6eUw9lTt/DktgeiRboNaV7vk4/vpeoFl/bM+37DXK1MEhOA/uj4BhqeO/8aJqGyQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiZ9FCIv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiZ9FCIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772137339; x=1803673339;
  h=date:from:to:cc:subject:message-id;
  bh=xUQLO09KdUQFTy1WOkl0ixVpeIKrCIiXgRWl3vZtTog=;
  b=PiZ9FCIvwU4ue5niq57qM49QeynofZqsS/TMobCnqEPJUdVWZBtsSKhx
   8nM8L0E0RpmCMZ3RoI6HVr32Ne7NejS90sxwHCL4XzNLRLhaeasVmwY6q
   U2yZ5MFxQE+cCrQY1cL1j/LDgIGckWLTeTA2+c2kMAu3COpEK5ihmK7JK
   4m7mlHm9N3tYwIYrAat4yBBbvH6XvkHpPAtJWv5cZzYqYvytwG0gQ+C5X
   C/8zBB0/ny2H69QY4ty+7GESiX9hiZHLiXymd4sRyzXSlRTjVxCAMToJI
   kWjC+uhFcNsC0g6TpXlhmyB62kKw3sZHNQripWDfy4LKBpEeF35Fiwaob
   w==;
X-CSE-ConnectionGUID: Wi1KKpevTKyEpIWYN1mE0A==
X-CSE-MsgGUID: KHTKAyXPRu+ZL7r+0CTVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72913981"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72913981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:22:18 -0800
X-CSE-ConnectionGUID: tY2rLdCxQZa1pRHdKv1xMg==
X-CSE-MsgGUID: bxjGh/Y1T5yndIVbQBVCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="244184706"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Feb 2026 12:22:17 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvhsE-000000000Ij-411a;
	Thu, 26 Feb 2026 20:22:14 +0000
Date: Thu, 26 Feb 2026 21:21:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 108/108]
 Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml: Unresolvable
 reference: /schemas/pci/snps,dw-pcie-common.yaml#
Message-ID: <202602262105.fKh4aRal-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml: Unresolvable reference: /schemas/pci/snps,dw-pcie-common.yaml#"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   8daf5694de38cda74d36b34a8eb8d82ff0392aa5
commit: 1b1c72fdb5d35de493c17aa9ba1e497cdaf51e0f [108/108] dt-bindings: PCI: convert amlogic,meson-pcie.txt to dt-schema
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-2051-20260226 (https://download.01.org/0day-ci/archive/20260226/202602262105.fKh4aRal-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262105.fKh4aRal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602262105.fKh4aRal-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml: Unresolvable reference: /schemas/pci/snps,dw-pcie-common.yaml#
   Documentation/devicetree/bindings/leds/leds-pwm.yaml: ^led(-[0-9a-f]+)?$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
