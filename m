Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78423224D7
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754649346; cv=none; b=XS3MZITnqNz1KR8RUeAwn7e27YK8g7FaSRt6Uht1hB8OAjBL9nazNYd8obCGT9RIak508O106Zcg3K69SoESjaDHmwUSkTIG9cFvy+5WutRDlWGtaY6qPgHKtZw8N3aAE5JDPWtERFrg+zZ/kQ6v7H3USRBqeKHi+WzfN4VlRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754649346; c=relaxed/simple;
	bh=pEozjKRUY7M8sSyyaMt8HhswI2SQfZq84715ZAC/B50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q9t7orXU81zN58W5yTdOZncf1Ffi+t3drhwFNYE5V/jzqzTgwBiDYNXo5u6+VbUT4dIAFW25rd5JyW5D53zOzM1WCRmYvtCmarIYhRWC+U4fF6oiFDU09Ee1KrX+HSAk9jn3+j8XvUbxrWWLto6xtw7wd6rOZ8xL0wnB4WN5BUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1+X85sa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1+X85sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754649345; x=1786185345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEozjKRUY7M8sSyyaMt8HhswI2SQfZq84715ZAC/B50=;
  b=F1+X85saOvI+U/TSG5QNotGREKF826HSt9ASqld9vT6B6gbM0Ope0eqX
   cx6IYk1z5+D1QWw+WwVX2zypIUR64J0RhD4Xw/62nvs3bqGvRkMOt6Xpl
   FjKqNKVxJRkRabL4qHPg6/LE3cOWSgLJLkwUjuv5P0FKdIxV8l+Q/EHGn
   31qF+fo1UscdGYHceSrvanZZTGl+l4c6LMWBanudLtec8PWBSC0gxQH6H
   drKTjFlYTTjWW4/r8fPB8fNMCcB0DksgTTRfG1/ossFjsH0aX1IsMWZB4
   bgc6cW6eWBLMJq80RNn5Fbts6deygv7lsiWspHl+9fyp2cXcTVe2nsmLb
   g==;
X-CSE-ConnectionGUID: Xfb4cw9NTD2zNeYL4R5VoQ==
X-CSE-MsgGUID: N3XhGEdiQlCKtTAwfQfnwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56030749"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56030749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 03:35:44 -0700
X-CSE-ConnectionGUID: lU+vf6QkTl2MLeHRYDWA+A==
X-CSE-MsgGUID: JKoXoYLMRHy03oT4i8kPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165681298"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Aug 2025 03:35:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukKRD-0003r2-2z;
	Fri, 08 Aug 2025 10:35:17 +0000
Date: Fri, 8 Aug 2025 18:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 31/801] arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb:
 counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
Message-ID: <202508081819.SIYw12pB-lkp@intel.com>
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
commit: 9cf3b469c7854383dbd51c859b8e78a8bb781057 [31/801] dt-bindings: arm: Convert omap/ti,omap-counter32k to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081819.SIYw12pB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081819.SIYw12pB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081819.SIYw12pB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): $nodename:0: 'scm@2000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000: failed to match any schema with compatible: ['ti,omap2-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '@[0-7],[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/gpmc@6e000000/ethernet@gpmc: failed to match any schema with compatible: ['smsc,lan91c94']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
