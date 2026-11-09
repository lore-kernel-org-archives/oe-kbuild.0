Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185263;
	b=ogacDozLsEluDevNlWMGQN4JHtz8c6B1ZTrjbRrdJKlDB8wq9cbQpX7UE++OgCdIetX5
	 No2/peubtWVIYAgeNhr4NhpLgEysyeZJr37kQaBMCl+ugnVOmUz/W90q9otkcWzIKBPKM
	 asAQgzjhVykBEKE0Y9GsxB1MlNDYECdTRt735L5ko3BeO1/WGbBrgXyQykOSIZjlqjzP4
	 XHZjHC4oqky2Ud9sZYCDi2hnz9GeAbcvlRZ8DKdY4t2FBprfpCyC0n/plj2SRds72X/XO
	 68HuDHw90guIN7Odtx5WlCNY+vgRbdasu898OFRdlFtyhnln2ou9ojS0bF1lUp3xLbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185263;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EYv0awpH/y3ZFTnNSQBFHl9P0fHwYb1Fry3PB40GzO0=;
	b=cgEDu4lM5yLAYY4t4IKZIOrtZFqfP0uvx+NPJBsGz2QhgDP+Q+DgzuW+G/N8q53S7bhZ
	 mR85a/Q46Hm59+g7j847BsFs6lSnx3TuNaIAMbeiJVZCehYqJcAsolrS3/26WqlPb6A8O
	 EgnYEoXNd7db48SvmXf6K16OgGoVzqojI3Pz53+2raQByFkvKxTJtO2Agz3fIQoG8uNRr
	 e6G+/GF9/j+hX5JwWvQ56GzyLXBv4BwCrHCe0OicqfkPROH/DPEySY2LON+FNNK9pmbL2
	 sdEmFCQqlBhQGx9Q7mKpaqTfLf7algGbOEXJe+5Uk/qNnSx5yrofTiGBDiDAyzOdACw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFQjV1ec;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF3606A325
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 00:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECF3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFQjV1ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794185262; x=1825721262;
  h=date:from:to:cc:subject:message-id;
  bh=6Ecv5h4dD+Jm5VCYxDbVlc1noFmFqSeDePlAAbj8GlU=;
  b=YFQjV1ecWB39UDGvoBSLeAAKEIRst2sXSve/iNYnDtlz895k6uKeoWlx
   /EdjB0sQgpNJJkPXJZszO5UMwwgu7pPL7wv7oWGfcyAYHCYbxRvyuZ1NO
   2dsVD+SFod4QVZMk8LGLyBG/bs6Kba+pXJ8Ykfme4wyNreYK68+aY8mWA
   0Gyfz0/ed3AMUJw/QnYzAFiOyhyMTUL8avlJ3I+HJZAVt5BOGKP8UcIgr
   OmRf8TR9qj/YfRIK6Za8I8cSJtJxPHbwRePMK6CiIcAKrMMbozxeSsewr
   G4jnUyZC5wS7N/CSLONn9uksWXu0Lmika22/C83F6zAI+TAotuQkH3sZ+
   A==;
X-CSE-ConnectionGUID: lcGxlwNJRImQZasXRbJSIg==
X-CSE-MsgGUID: gmRVfPKGSxW3yt6B+DuhwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2789283"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2789283"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 16:47:42 -0800
X-CSE-ConnectionGUID: mm+B/UmAQo2dkdHPJAb6AQ==
X-CSE-MsgGUID: XyfUVbJKQb28Lb6ZXq4shg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="9519265"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 08 Nov 2026 16:47:40 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQDXt-0000000007P-2n3B;
	Mon, 09 Nov 2026 00:47:37 +0000
Date: Mon, 09 Nov 2026 01:46:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 82/242]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000
 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611090110.pcMMcaRg-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611090110.pcMMcaRg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090110.pcMMcaRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611090110.pcMMcaRg-lkp@intel.com/

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
