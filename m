Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A62A95E
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752379139; cv=none; b=Uz0+/Un6ofqKzV9LmcNioKdsRU1poduuwyvsFGzlh8Mg47dqWAHllp+b/slb4E3k3hkkC6vhDawGtsvb5InXVJv5A3my1BZhUG+08UvmsoAPRYw33a5jMnvvX0J7dtC5IpavKaX/++h/Pf7b2SEw7KjQOdjZJ1+dv/6pqQieXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752379139; c=relaxed/simple;
	bh=Q97AfKM3FRdPuwZcPNKCPXaembXNQRmH2ahELV9i4qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JfzaDPJUUumFlmsfqDjCv2QH1Lqcyf51dUgrCBrirqeqYEdS62ay/WteTlhoHeUMWt3FzLCkQ+2jyFnDybbB+97Cm2FaHWa7xO9Lg/LM8vFZ+5cwGUFsMPhsgMCUvtQCZGAc63az7MzYpuf/WdezieUJhtK40FRIRdkBIsGBDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHPHhSlt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHPHhSlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752379136; x=1783915136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q97AfKM3FRdPuwZcPNKCPXaembXNQRmH2ahELV9i4qw=;
  b=QHPHhSlt2daIG+e7VDGRoQG+ALY6m/97S5WuWlBPCFmPIwo7P8QpLkha
   LMp4RDp447HMq3lVljsBPe0x1OOTXKitfR2e8XQgBnKl28Q+Ha92a2AQP
   pti+8A0MjJLyo6BI8olfcyCwTm5wR249MI//goBxV/R52OrJzbEoca20K
   gQarNy8962lVeTAc+81/lE6GjeAMOGtoNZ4xqms7TT+/skO2c/JZ5OVFI
   NNWEfmPHfTxH6Zbx+wm+gGInR2vt8ttJJDQX0zBwEgDBg0JtpKig7o9CL
   c8ERM9N5lX90/k8OHKLEWMeGSkTSTra6VcPlfFNUT0+uZazNr6ovbezPG
   A==;
X-CSE-ConnectionGUID: RoizVijwSPWy/uarWEc7TQ==
X-CSE-MsgGUID: F8HdCe0sQXu7erJRU4b02Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80052810"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="80052810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 20:58:56 -0700
X-CSE-ConnectionGUID: s9K82WjYT1a5P0O+KCQabg==
X-CSE-MsgGUID: BM5q83PuR3iZwjS3QsMrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="160972605"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jul 2025 20:58:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uanrY-0007rv-2j;
	Sun, 13 Jul 2025 03:58:52 +0000
Date: Sun, 13 Jul 2025 11:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/dt-for-6.17 13/13]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: efuse@3006000
 (allwinner,sun55i-a523-sid): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507131145.oAw6MuiU-lkp@intel.com>
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
TO: Mikhail Kalashnikov <iuncuim@gmail.com>
CC: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-6.17
head:   082c6a2d06c0831d236760a29953355845eee988
commit: 082c6a2d06c0831d236760a29953355845eee988 [13/13] arm64: dts: allwinner: A523: Add SID controller node
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131145.oAw6MuiU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131145.oAw6MuiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507131145.oAw6MuiU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-660.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
   	'allwinner,sun4i-a10-sid' was expected
   	'allwinner,sun7i-a20-sid' was expected
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun55i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid']
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-660.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
   	'allwinner,sun4i-a10-sid' was expected
   	'allwinner,sun7i-a20-sid' was expected
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun55i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid']
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-660.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
   	'allwinner,sun4i-a10-sid' was expected
   	'allwinner,sun7i-a20-sid' was expected
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun55i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid']
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-660.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
   	'allwinner,sun4i-a10-sid' was expected
   	'allwinner,sun7i-a20-sid' was expected
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun55i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: efuse@3006000 (allwinner,sun55i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun55i-a523-sid', 'allwinner,sun50i-a64-sid']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
