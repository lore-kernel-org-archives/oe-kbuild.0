Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B55680
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 03:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754881597; cv=none; b=YUoiDBMHXHZ0wAeO/JSeFGi7+mM9/ksNqAnm/RG6DfNwW+rtPqELBXrk4yGy1/9HGR+KP4YpcC1VZ0RtR/D2J/RRHrMQgxCuYduUndwi2dIHt+oIQxW6rNxZpBpCmsd11vq08FIHftbxO/z6rQAp0kyh04M9obcHyNGooiZ2CjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754881597; c=relaxed/simple;
	bh=k7KyH+FadjFOQt9z3bwtewvm1j1Jj0YYhJ9BgfGpCjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CL4qJrzXJ0cH0SZTKCuO9ZsYrPCI93RVcaIn/nNz0OpP9W17Ktbp8x7ULqFCzPuh/BdFA7IOSh3LFiye9Q1goTxQel8rz3pM+pyCxrrsbJpEN7om7BPtIlY9xX7MLe5o8FtsrfP0C+7GHmWTp2/5dgsEDJcYpqcIVQerSHX5ZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xb3JopJs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xb3JopJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754881595; x=1786417595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7KyH+FadjFOQt9z3bwtewvm1j1Jj0YYhJ9BgfGpCjs=;
  b=Xb3JopJsd3LCEqVS596C5vNRhLWLYEl0/6/hq14T1qLTsQionTm8akMS
   xElvU4a7P7scscAD4hPxWezXqVXanyLqjX4bdn9cfvLreNIKZItizeCXi
   gnkKDHxLbp8eNaniUUtbRijm1LlUK8iO0sZk6B3nlyZvi3dm1aqYqp1eN
   WEKXpIaYq6aVXfMquhujcJ4W0qNSjv+DJrTZ/clFDpZIl6BAk8+g9PETk
   qm3zw/mLeZ+XCQ2iYMbkB6eMaMiFxJvsteiwJ5QcZfkMvGco2aK29XTuk
   +FSko+YrMWlYlvcMcrAXsU1/lyBrDNp66I6VRJEIdQz/5RdsxJrmTSiF5
   g==;
X-CSE-ConnectionGUID: vYV5EF1dTf2fkgU4PFFpgw==
X-CSE-MsgGUID: zaD7EQUWRhaRhKax2TgEgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57035845"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57035845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 20:06:35 -0700
X-CSE-ConnectionGUID: vqZ3gbYaSM2SY1wAvfd10A==
X-CSE-MsgGUID: 6iZHP9H/Tz2QUBsVpdjN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165796496"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Aug 2025 20:06:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulIrn-0005WO-2A;
	Mon, 11 Aug 2025 03:06:31 +0000
Date: Mon, 11 Aug 2025 11:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 88/801] arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb:
 apll96_ck@500 (ti,omap2-apll-clock): clocks: [[17]] is too short
Message-ID: <202508111036.9wj1luRO-lkp@intel.com>
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
commit: ab8849c27c1382ea3a8781e32e7b6d21aee7e20f [88/801] dt-bindings: clock: Convert ti/ti,dra7-apll-clock to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250811/202508111036.9wj1luRO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111036.9wj1luRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508111036.9wj1luRO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): '#address-cells', '#size-cells', 'prcm@6000', 'scm@2000', 'target-module@20000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,omap2-l4.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: prcm@6000 (ti,omap2-prcm): 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/omap/prcm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/dpll_ck@500: failed to match any schema with compatible: ['ti,omap2-dpll-core-clock']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: apll96_ck@500 (ti,omap2-apll-clock): clocks: [[17]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,dra7-apll-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: apll54_ck@500 (ti,omap2-apll-clock): clocks: [[17]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,dra7-apll-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/usb_l4_gate_ick@214: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/mdm_gate_ick@c10: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/gfx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l3_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/wkup_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
