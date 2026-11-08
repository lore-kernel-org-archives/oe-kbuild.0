Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794097617;
	b=g57ywN9uBgHwXSji4iF4m5EvfXJk0XOeden1L6aD75Ypdap6P530Ei1MEu0Wr/zV+qC6
	 8Pd0qyrPB9XSQTCy3y4I4hsDv3NDRUpONMRlfB5fknNfLo813EdDsmhBhx1IyjXlRisSf
	 YR4iHnPtYl/x6p4jWQvm1zp4c8oB2S8kZxw9pfjmXN6miPe6Nzs+VUd+lLHSXrasF1rmn
	 VmaQ4r/1lVYPHY0JfuiJdSsNsNiwK2XcwePqUEVVXwQkD67DJGRMkL3FRi7S8jLm0iH0R
	 rpsAGfdDXDIRQ0jrgLc7vwi7wZPH/ilRLZ4/oLftEj0FvsmBHpkox3SkN/kWi4BmHTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794097617;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PINiLNHkntmI83Z8DaAOODWCOtj/+O32zIldDNszREI=;
	b=W9AZi/epWy2i7uX1D6glvn6QqJiR1b+8fvBd9Czsm7UYn9ESvaYunnuGnrC/BwmasKlZ
	 lhNuapCop8SkPHllifQOW/Hm23M0zHGYMhfneIg75XiZ0dxzj4Vox0Ql2lREq9RPwrMEG
	 67mZcA31j6E8UfA6iYz9GRcajMG5wo7WGfuUm3e8AG6zPSXcgdBexwnHLrFj+RmER14hl
	 ULNGURGbpEPBfbQ1RIbnkyNDZma0Il+4AqWQn0iYsSQS+Wdg5e4bwOIoDkgpZMVKQc9Jo
	 Wpi/RFy+INUNSHQSvmS+DQtrH4EPLAErtSRLf87NU/KI2gbXqv8SLCTvMdnJ2nqy2bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eaR7soL7;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864E606A32E
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 00:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0864E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eaR7soL7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794097617; x=1825633617;
  h=date:from:to:cc:subject:message-id;
  bh=ESh7z5upYoLoci3JlkhKxqj9D+frGfP1Wzh4TJVz0io=;
  b=eaR7soL7jxmttKxNCFjzvv/jUwWMCptqGcvho3WnVgW7YQo3YZKIlmO/
   N+EdnwuY2L0I+TOPJkRyhat7CfW/fEBS3Dut6+ODSgvpng67fCVewvh2f
   RR+YMjnSQ20nxjbwVcstUuRSmjKW5lyuGnwuzPkkqoqbJh9wVfNtM/YQ7
   IC1K7kLoqnrvHxZIAMdpxqMENHdPs8ZzrP06ZTB1ULKqkJWWgJEFYXQHy
   oWvxsJF1tzlrGTnsjUPFP5B5AKdg+6wWFo1l1elmj94VwOHNNdPeAXTdU
   OTFfo4OgRKu12avdt6qs5ILj75UII9J6KqXkZM9IUmtbxLKwTbwruFCsZ
   g==;
X-CSE-ConnectionGUID: ZG07RN5DS9u+HqxjFvykow==
X-CSE-MsgGUID: 9W8KV7ZVQ2Ss8/LpdAJ7Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2770954"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2770954"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 16:26:56 -0800
X-CSE-ConnectionGUID: hPTggq4YSAi4eL9x5Ge6qA==
X-CSE-MsgGUID: C/JvI+lUTtKC4RtKhYooOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9318656"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Nov 2026 16:26:54 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqkF-00000000Au7-3vgK;
	Sun, 08 Nov 2026 00:26:51 +0000
Date: Sun, 08 Nov 2026 01:26:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 82/242]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000
 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611080128.VD6E6oCQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: 3e2114629f945662e8f83d3d3db1eba2f8a9db2b [82/242] DROP_v7.4: arm64: dts: apple: t600x: Add legacy "apple,dcs-min-ps" property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611080128.VD6E6oCQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080128.VD6E6oCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611080128.VD6E6oCQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
