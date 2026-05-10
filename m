Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82313B58A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778413906; cv=none; b=SzL/bQZti5r+S6dI5BzJ62L6p3CZg9Hvr/hau0BhSPIwQfjU45eT53jeFRW5fFC3SMqUyttVarl8g0D6EnsKOcGEqFbkVCbJCvX11Vr8wemVNkNyUcub+P91WuNSVmAi4oRlC+IkjDUcGSwS/cit74Humj8GdBQrTLJOqiRaLxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778413906; c=relaxed/simple;
	bh=m5IzHIdbLuRyi/Td+y44Gk8IYSMoG69PmX9X8upqkgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VmiGU2GQy4QsuJT+13NX8SGKHb2nJNOokPw4pIS6eNY+VhzMA2sS5Eg3RcxTmYV4G8Hws84kUyTNSNkl2SKEVMifZ1tcr5utMD1JzTcUEntg80bDVIkLJqpg7+pMri6wjeKHP6kPNFuYFPUUIQ1tGjhJQtuFYB/ZrMYrJkBlvIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WF6m4Ja7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WF6m4Ja7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778413904; x=1809949904;
  h=date:from:to:cc:subject:message-id;
  bh=m5IzHIdbLuRyi/Td+y44Gk8IYSMoG69PmX9X8upqkgE=;
  b=WF6m4Ja7O/ga4BoP2BSLetOlgIWldtiv8j9V1Os3vA62IglP+AbnVEtP
   EB+bLih62pD2tsLZTqoUWKcYGU3Vhp3kfuNZmj3etI5rjzMEH7YjQb8Wy
   Wk4v3zDFvN0OvZFBWF3sj8dbiT47MRcZezaIFK8uio4RAVv0pibFVhxxE
   uGUBGOyu6eLAD32xGEsuNTv82RacyYEIRp+6utReB7Q48Ak9EQTrUymjb
   PVZr5TC6tP+fw4lWDB+FW1w+AiFGHeAGA8tkQp+GaSGg8mbGjEvoNNHVJ
   5mRrdo5ugpP3XbPqsotxQb4v8OVAo9T+zF2Sr32wWt4TRtVwpXt8ardM6
   A==;
X-CSE-ConnectionGUID: oj1mkm/tRyqexaiWWzYxTg==
X-CSE-MsgGUID: gXPNF+50QN63O69ggK9bQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79047795"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79047795"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 04:51:43 -0700
X-CSE-ConnectionGUID: Xy7QAeGCQo+/NQmfa30iZA==
X-CSE-MsgGUID: ZzU6Iu2DSdeEo0eVC1Za1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="236355771"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 May 2026 04:51:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM2h9-000000007iH-34U9;
	Sun, 10 May 2026 11:51:39 +0000
Date: Sun, 10 May 2026 13:50:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aes@0
 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605101314.pzNZmJua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
commit: d0544657a28aade89e981bebdc116c628d750332 dt-bindings: crypto: Convert ti,omap2-aes to DT schema
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-2051 (https://download.01.org/0day-ci/archive/20260510/202605101314.pzNZmJua-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101314.pzNZmJua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d0544657a28a ("dt-bindings: crypto: Convert ti,omap2-aes to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605101314.pzNZmJua-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-mpu@4ae07ddc: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-ivahd@4ae07e34: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-dspeve@4ae07e30: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/regulator-abb-gpu@4ae07de4: failed to match any schema with compatible: ['ti,abb-v3']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/crossbar@4a002a48: failed to match any schema with compatible: ['ti,irq-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
