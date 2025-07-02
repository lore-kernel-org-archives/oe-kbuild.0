Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7923F429
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447919; cv=none; b=gwZHoMQ8i6kZcvkSK0gqlBuJqJkWwTXcUj272H+ziVWERB3R5ACtgTOH0arhjQdKw4gMPoAu2VkdFxJbGiPPqwurRpm2gms5AkLA72mpVWoJBfdyPAFkQv2rIieUcCSy/bQY6gpfT16qyhfj20Pj2cZPJmmH9v7OxgY22fmlFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447919; c=relaxed/simple;
	bh=htjcZAVTMauoG95sNeEwvD7lvdyUc4sOJr2PH6aSegY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKbdwiU27NNd9gJoso5HZDvrgLLG5IT/9lCvvlE0+UbeghPLcgMIM7FQaWCp5mde9AFp9EpyVymwL9PrYxVuJczqzrod1l+6sU2QmUK6pdTyYZoHj786437TeSmE6IjUP6ZiaTLQI4KlmRV/i+njYHjzQKqs6u72JAqKN2HMBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avPHj5So; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avPHj5So"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751447917; x=1782983917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htjcZAVTMauoG95sNeEwvD7lvdyUc4sOJr2PH6aSegY=;
  b=avPHj5So6AjTKvE5ASmZPNDv2m39K8IwYbX+/OI4RCTKqZScDZCC3fyB
   AlWGnWCCehAuE2MAMdItBPmVce+3rINe6n+P0kkaTIXqFJTndvHJ0Xez0
   NW6o42pKGL1bPL+Y2RmNiExMLr32CpF+xETAXwe8NxBp8ILf7IyGp7okt
   nE8bW5aeKNN0zAzrNoMvnDnA+DJQKdY3HkwhMSXEPhfGeFPeL4ifTeWES
   Ek9+8kPgMS8TLexdXV97Cruvs4oA2PMubXz4GJvP62veOx65N7+MrZGQY
   AIfHohehaI7iLjm+5CVOt9mhmh5VSUrSFtUwEE/yMCzhtxTVN5KkrhtNl
   w==;
X-CSE-ConnectionGUID: ihIEFQ51SjWXZtT8wfJjvw==
X-CSE-MsgGUID: s5yUZhyKR+e/vFGJr+AtLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427959"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64427959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:18:37 -0700
X-CSE-ConnectionGUID: Go3YliLmSaGA5ggGNDO1xw==
X-CSE-MsgGUID: Dhbn8hH5RtqrDL8jw4QoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159538623"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:18:36 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWtbu-0000RZ-0V;
	Wed, 02 Jul 2025 09:18:34 +0000
Date: Wed, 2 Jul 2025 17:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] dt-bindings: net: convert nxp,lpc1850-dwmac.txt
 to yaml format
Message-ID: <202507021604.JHDfqJCu-lkp@intel.com>
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
In-Reply-To: <20250630161613.2838039-1-Frank.Li@nxp.com>
References: <20250630161613.2838039-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.16-rc4 next-20250701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-net-convert-nxp-lpc1850-dwmac-txt-to-yaml-format/20250701-002132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250630161613.2838039-1-Frank.Li%40nxp.com
patch subject: [PATCH v2 1/1] dt-bindings: net: convert nxp,lpc1850-dwmac.txt to yaml format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250701 (https://download.01.org/0day-ci/archive/20250702/202507021604.JHDfqJCu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021604.JHDfqJCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507021604.JHDfqJCu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): $nodename:0: 'mmcsd@40004000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): clock-names:0: 'biu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): clock-names:1: 'ciu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): Unevaluated properties are not allowed ('bus-width', 'clock-names', 'resets', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/memory-controller@40005000: failed to match any schema with compatible: ['arm,pl172', 'arm,primecell']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/eeprom@4000e000: failed to match any schema with compatible: ['nxp,lpc1857-eeprom']
>> arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: ethernet@40010000 (nxp,lpc1850-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,lpc1850-dwmac.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000: failed to match any schema with compatible: ['nxp,lpc1850-creg', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/clock-controller: failed to match any schema with compatible: ['nxp,lpc1850-creg-clk']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/phy: failed to match any schema with compatible: ['nxp,lpc1850-usb-otg-phy']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/dma-mux: failed to match any schema with compatible: ['nxp,lpc1850-dmamux']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible:0: 'nxp,lpc1788-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000 (nxp,lpc1850-rtc): Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
