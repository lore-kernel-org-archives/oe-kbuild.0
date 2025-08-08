Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722B8BEC
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754616301; cv=none; b=EgSNUqDvZ4WnIUiCx5/sn4o30smUBezcuxqDDNjmhqkalSop965cMBza4PoVF+lQPH8q8bB+9WJXnZ5OPJzDrZcBHL2LffRMM37cFba9quOoSNX1nwgbMNF8ISV8P5MQYrDNjQmxmj3oc7sOAI7rxN//vsjXmTN+LtzzZ/B8F/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754616301; c=relaxed/simple;
	bh=nvki61jHeAI5Ru+dZeQI7RqgSbNojSrDFv51cO3WF2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6u7aHoDDgScMRQKymhqCl8mdg+0cfcCH22P5XBlB719Ry2yxyzldA70IooVAoNVqzgVubZtKR8lS87lPaH5V1jT/nDDlAOu4kmw1BTiLlCMXGwMNHu4+I+5UbaXUJs4R/YP9jHFCQ4C187TyNgsAvIom5VGT+Scusih3M7TmFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOb6E/A6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOb6E/A6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754616299; x=1786152299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvki61jHeAI5Ru+dZeQI7RqgSbNojSrDFv51cO3WF2A=;
  b=cOb6E/A6wb/ZI6LWIzIf4ULDHi9JtxHAlqCjKIFoK1lNvGkFB8Uii01v
   q9bg5GytE3Tq2PApt9oamEXIcBnnIgynYjf+JBimx1ikGZBuf+DHEXy84
   4r48OwELehTJtO5IMf+RIMiLE3ar7Acq3nxZDkypf2VM1AuMpuU5LLBgA
   /R6Ay9RuFe8t4WEOOyD5y5Wfp1vnyZzluM79oztgRD6V/AEr5rTe1qUJI
   myeSi2FuBMfsgnBL7EHWUob7rqEjtNYD2LNZKk2McT6Ml8/CgAmuaIRg1
   s913A8MJffhGz8PNHjP9aTsIvsBYd40P2eMr2apGUJCLlevYFFmpVTOq4
   w==;
X-CSE-ConnectionGUID: EWarqgAuT+KWN9BeU0To3A==
X-CSE-MsgGUID: 0hP5ih28Tvu0aTcsTpEZkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67659550"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67659550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:24:59 -0700
X-CSE-ConnectionGUID: q2R3tdwSSNKa/9Rp4Mg3JA==
X-CSE-MsgGUID: KMDjmCJhSi2u9M/4GHEp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164443751"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2025 18:24:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukBqp-0003Py-1n;
	Fri, 08 Aug 2025 01:24:55 +0000
Date: Fri, 8 Aug 2025 09:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 33/801] arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb:
 scm@2000 (ti,omap2-scm): compatible: ['ti,omap2-scm', 'simple-bus'] is too
 long
Message-ID: <202508080906.OzcNoD2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: b11d5507388c2461b10703954d9a9d36814f5413 [33/801] dt-bindings: arm: Convert omap/ti,am3-scm to DT schema
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-054-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080906.OzcNoD2L-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080906.OzcNoD2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080906.OzcNoD2L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/gfx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l3_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/wkup_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/mdm_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): '#address-cells', '#pinctrl-cells', '#size-cells', 'pinmux@30', 'ranges', 'scm_conf@270' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): clockdomains: {} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): compatible: ['ti,omap2-scm', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): 'ti,hwmods' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
