Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5DC8EB
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250267; cv=none; b=oaJOPs2cPaSfybowlFIMX2s4Jn4GkiKLEsojIBM0lia/swZDoekHjJ2ywLXbqEaJxAzYCwmg/3AGIZ3OUQQLIVM11urEa8gcKxUnIEVFfb4i3eYqPAqh1ALJmZmIpivj8QRHj+dOWLJ+4NkcN+7xWKsq4ZLlIZQXPqoqKxRGrxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250267; c=relaxed/simple;
	bh=7qn6ndeKShfPAsuckg63jq0kfxM+fsE0akJvrx/afhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R90sM5LnXyJ7b7sVFNdiSSY0cWimTwFwNkma9+P2P1T3S6mQ/eO9+BaiMwwp+qdVBsg4ptwe2iOy88Rty3SbmZr02MUQhOR/+klIc9prq2u7MBaa+r+VSSo+tFNKJJUpiXg3E+gZ8+Wcbu0c4FpSjXDtXRL12AHh5K585uN/Xq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0QjqeL1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0QjqeL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782250266; x=1813786266;
  h=date:from:to:cc:subject:message-id;
  bh=7qn6ndeKShfPAsuckg63jq0kfxM+fsE0akJvrx/afhA=;
  b=H0QjqeL1u55M4Nd++Z5A6h5EnpyuCL1L6bLWhPLdy1oAsDfaB+B3Acgf
   2JwjWsTQKOfRMsfCTkPFKcgX/hB6N4Rhl1zj7nb046zJEim9vXa2r8Rn2
   BD2R2MLPEUiYyEcsQo3easfv+OS/ZkQZ7hbdpJo0d8uXF0CDMZxrQjfPP
   Oaw8rsEKy62dUYRM9zwcIqLThca8WAzsnCVo8esS4fUzQSgpK5dJi5MoE
   KLRiastIID4mvlYlMRo7sx6PDA5SpSTI1vPv44orfwPV9wSagEyXw5Tki
   FqEhBeiuDzxa+xWkNbW7pBvs01Rum0XkE6wpjOM6sGtPWpQswpmO9+nT2
   w==;
X-CSE-ConnectionGUID: F9x/rm6RRweiKUkfffOlqg==
X-CSE-MsgGUID: c8LV350FQyCExZqqzP2ONA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94123315"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94123315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:31:05 -0700
X-CSE-ConnectionGUID: PN0WLZRGTWecVnpei5AJZQ==
X-CSE-MsgGUID: 3wKrHIPKQo+dSiRTuaI84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="247289597"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 14:31:04 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc8hy-000000006FN-05JY;
	Tue, 23 Jun 2026 21:31:02 +0000
Date: Tue, 23 Jun 2026 23:30:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jonhunter:tegra/next-fixes 12/28]
 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml:
 allOf:1:oneOf:0:properties:reg: {'maxItems': 4, 'items': [{'description':
 'application layer registers'}, {'description': 'transaction layer
 registers'}, {'description': 'privileged transact...
Message-ID: <202606232352.hVw4tuRR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thierry Reding <treding@nvidia.com>
CC: Jon Hunter <jonathanh@nvidia.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   36156593774da3e61f341b174f04a0f16b0241b5
commit: 1874ad48798d0c27d33f6f328c65584088386191 [12/28] dt-bindings: pci: Strictly distinguish C0 from C1-C5
:::::: branch date: 7 hours ago
:::::: commit date: 33 hours ago
config: csky-randconfig-2051-20260623 (https://download.01.org/0day-ci/archive/20260623/202606232352.hVw4tuRR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232352.hVw4tuRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606232352.hVw4tuRR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mfd/khadas,mcu.yaml: properties:fan-supply: '$ref' is not one of ['description', 'deprecated']
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml
   Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml: Unresolvable reference: /schemas/regulator/sprd,sc2730-regulator.yaml#
>> Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:0:properties:reg: {'maxItems': 4, 'items': [{'description': 'application layer registers'}, {'description': 'transaction layer registers'}, {'description': 'privileged transaction layer registers'}, {'description': 'ECAM compatible configuration space'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:0:properties:reg-names: {'maxItems': 4, 'items': [{'const': 'xal'}, {'const': 'xtl'}, {'const': 'xtl-pri'}, {'const': 'ecam'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:1:properties:reg: {'maxItems': 5, 'items': [{'description': 'application layer registers'}, {'description': 'transaction layer registers'}, {'description': 'privileged transaction layer registers'}, {'description': 'data link/physical layer registers'}, {'description': 'ECAM compatible configuration space'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml: allOf:1:oneOf:1:properties:reg-names: {'maxItems': 5, 'items': [{'const': 'xal'}, {'const': 'xtl'}, {'const': 'xtl-pri'}, {'const': 'xpl'}, {'const': 'ecam'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
