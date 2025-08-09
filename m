Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859E298CBC
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754742332; cv=none; b=pE/+MsXAooQKexJX+YHvPYZZia79g2Q/tYCISjHY6FGOraBLjtZzkqAiQ9rk4RtFFJGux/mi7DvNeeZMt1Dhpy/DHMqpZN7sjqHO8VrGfMCJ+lzAw/BJoiotW8uysuAGGI68qCi2EbEnZDkGQi9RAQBds/Z/f+V5tQcH0zvFRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754742332; c=relaxed/simple;
	bh=IM/ydVWd9y/SYJmF9poKZBjwJ4n9dAd1bt5Hb9Wqvc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bikHoUK2LTHw+GpmtJTwtkS+nEacv2O5dhOnMfmmSlTbUmuYqVt+Lc1iAOl2qyGx7BD/Q/hXYLg1U4KDiqpDs7t9jDhd7dm+c1jEfA3cycThm0tSY+wYXt+KTl1GmkKEX7KqWpaMK1xec8d5ciu9wZGVpSXcXa4HrA62JJ/sSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qf4aVj/I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qf4aVj/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754742331; x=1786278331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IM/ydVWd9y/SYJmF9poKZBjwJ4n9dAd1bt5Hb9Wqvc0=;
  b=Qf4aVj/IZxbagv1ZLy2RqGX9VbWmOYSkUffeB9UUaBkMUWtYyfo42Ndv
   gHFegiAE/1KqS8huFu+zY9OjycXcQlL3gk+Tmcq4LwUdZejH3/A7QMcNE
   j8KV452ByQ7JoWdhpd2J3mgoS2NmWzWUNjvJhmKJw/Ccq4uVeTqJcah7c
   eHZeWCpXmhUqEOobrCbGzEisMB1wpDIN01C8N68KatZJjmW4kp5WBSXbZ
   +NNrEEL5MQlnCz+7/ni00ih4G3QKiBZrcmAEX0kQvO++kEIOPXtwjzsv5
   72Fj9afqjsWqgl7saPm4PifQuSdBMWyp/kBUxQVabUthfDRdnzSIKtioG
   Q==;
X-CSE-ConnectionGUID: zFZAQYIVTKCdO7yVoW2/SA==
X-CSE-MsgGUID: G7uYzaoQR76E60qG8sIkfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56994414"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56994414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 05:25:30 -0700
X-CSE-ConnectionGUID: UURyvTxkT/O7a7qbEDPWnw==
X-CSE-MsgGUID: ElGotF2SQRqYi1H0qJn84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169972672"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Aug 2025 05:25:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukidb-0004mW-0D;
	Sat, 09 Aug 2025 12:25:27 +0000
Date: Sat, 9 Aug 2025 20:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 33/801] arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb:
 scm@2000 (ti,omap2-scm): '#address-cells', '#pinctrl-cells', '#size-cells',
 'pinmux@30', 'ranges', 'scm_conf@270' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202508092024.JDWlwVRE-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250809/202508092024.JDWlwVRE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508092024.JDWlwVRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508092024.JDWlwVRE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/apll96_ck@500: failed to match any schema with compatible: ['ti,omap2-apll-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/apll54_ck@500: failed to match any schema with compatible: ['ti,omap2-apll-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/usb_l4_gate_ick@214: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/mdm_gate_ick@c10: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/gfx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l3_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/wkup_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/mdm_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): '#address-cells', '#pinctrl-cells', '#size-cells', 'pinmux@30', 'ranges', 'scm_conf@270' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): clockdomains: {} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): compatible: ['ti,omap2-scm', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
