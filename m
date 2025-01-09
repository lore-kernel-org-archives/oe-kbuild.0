Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364D2144B4
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416425; cv=none; b=AEq7IB0uGcEl2CbZ2bbtcmW1Wlm8t1YLb31Z/ikQAzwbCAHK5/uduXyfpRK8A9XXmnIOIK2dZ5VYmuUyC+z4xUXqv2FSzgVXcofO9kQSRigx55rH4t53NfUKUEXynLk0NpgB9timFmp0fhsbFgREGTh84hO1hGIOU/NfqcELgHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416425; c=relaxed/simple;
	bh=5wA/+iUbGklaPGir5sR3/UMgzGoDAeUledN2j5eqsQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxDDvTzos1WGpVtgdgoxO3wBneJKaV4n/wwmEn4t1OQC7gZ9Ps97Q6F71ILKjwUYoacgdbIBV11oM6b5B0DyDZlqpa7iQICAOXfcS16Qys09ov8eaCBnum5wofZadpB9ghFin1tUqvY6hE9ZNb/BIu47H2AyXeYPOE319yTpXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4mkN9D9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4mkN9D9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736416423; x=1767952423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wA/+iUbGklaPGir5sR3/UMgzGoDAeUledN2j5eqsQ8=;
  b=B4mkN9D97VhsT9bwtJIvHMOKCtC+qbWMWfspFur1gkxjSCk5ixxjG+aS
   kJhqbfiPyZTuFsQY+E5dZB6FuMALN6ebBzGN1xg3VJmg+xSTnGgf2o1pn
   i+/be8Rf674HbAwCWjDqoZezRSFtIgNEhLzjLLlON4swd32/NSK9cTojh
   jN/kBMyXONywLss01QZDqbyzz2bYsZQzhxGKXgwza43+5Rug2PLylkEh8
   9Q3j6UOIEA/KYxuSdlmRzW2hwlBlkATx+PmUkSovm+a20hW/Ex8P2pDm/
   6GsO2ZEKWdBw6qkuUIiCztkVPBbPEbKUyJyDw14DhvJqEgdQQJBliE2q/
   w==;
X-CSE-ConnectionGUID: xw8P65nYSI65Wuc3W+m1IA==
X-CSE-MsgGUID: mMilKXgRTdq/tEbkNcsRRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="24274298"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="24274298"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:53:43 -0800
X-CSE-ConnectionGUID: zwhieYE2RAO3WdVKNI5uxA==
X-CSE-MsgGUID: Mf9F6BUrRy+fwUQnr6sfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107404083"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2025 01:53:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVpER-000HKd-2D;
	Thu, 09 Jan 2025 09:53:39 +0000
Date: Thu, 9 Jan 2025 17:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to
 yaml format
Message-ID: <202501091722.OEBuxlxh-lkp@intel.com>
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
In-Reply-To: <20250107161628.121685-1-Frank.Li@nxp.com>
References: <20250107161628.121685-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-leds-Convert-leds-tlc591xx-txt-to-yaml-format/20250108-001853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250107161628.121685-1-Frank.Li%40nxp.com
patch subject: [PATCH v2 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to yaml format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250109/202501091722.OEBuxlxh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091722.OEBuxlxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501091722.OEBuxlxh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: i2c@11000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
>> arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: tlc59116@68: '#gpio-cells', 'esata@4', 'usb2@5', 'usb3_1@6', 'usb3_2@7', 'wan_amber@0', 'wan_white@1', 'wlan_2g@2', 'wlan_5g@3', 'wps_amber@9', 'wps_white@8' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/ti,tlc59116.yaml#
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: i2c@11100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
