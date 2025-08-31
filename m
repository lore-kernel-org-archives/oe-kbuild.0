Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E161874040
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 03:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756610445; cv=none; b=mLMk+LgxkUu9Oj71TDRN5i7RA3uQ9wEb/9mCQ3VTxb1OB/jD3SoRdyshDmervBebhbCsjeHInpLU3m3pGCjR5oQBIVCaFV4X+WJogwobEt68iBXZfskyzh56bqM1LWY3K7PLQzf7nM3HiBumJ9jT5gTpeUR2ab83AysLMOofbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756610445; c=relaxed/simple;
	bh=o1KuoZOYXuUbOGCP2UNlqcJIi2fYB1y5C8zSdyOWdkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inqA6bBSinC03aZx4gJmUGQgIbxo2D5pMVejAtUYbrXcGgI2fPNNaF8x9F1unBI928lN0Z/h7m648gqEZQVR+Xtz3n2/EnBZFPdnbjeuNbg7FuPCNpl+jcfeInawyO+hy+cGwBmpvIa6BHG3DyDJe+XBSa7IrxjqqJYfDj46KuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxPhmiuW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxPhmiuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756610444; x=1788146444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1KuoZOYXuUbOGCP2UNlqcJIi2fYB1y5C8zSdyOWdkM=;
  b=VxPhmiuWps2u/6UwGgzAGCPAvwg5qUtl2920mGyTsXXR0faU8KULU8zo
   08EbGn7tFzq+aJF8zE9Ohij4wzYZNk++9aTe8A0IoScPG9N6onC90JVSX
   nq/uUN7g5X7aptNHBek+JLR7LOMEeW0sA7kzPeX+/9SLFgb2Pn9lzuu3f
   Npx0TylNGXUXfdcUVFsocdWQebCqgFZNG4zWuh48dM/Z/Yi69tfwjJr9A
   4N5IPhfJFahVl9vfVOMeDu6Zqk4dZALZk6+x9MA4+PFq2fmC6NVqeeJ3x
   w6PpptaoFTrddaPtYBsE0AR7cxRsEx9YYyoIX03J6iVJmsy1ffNwtMsMV
   A==;
X-CSE-ConnectionGUID: Ds+tcdHIQ3uF87UNbOnuGA==
X-CSE-MsgGUID: edAG3jRhTtGtO/L4qJqARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62487836"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62487836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 20:20:43 -0700
X-CSE-ConnectionGUID: /gswxlZXTTuY87Nc+GzfNQ==
X-CSE-MsgGUID: taYWVo3uTQmAB4XoMzHHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171063810"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 30 Aug 2025 20:20:42 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usYcR-00033T-2q;
	Sun, 31 Aug 2025 03:20:39 +0000
Date: Sun, 31 Aug 2025 05:19:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.17-rc1 8/9]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0
 (marvell,mv88e6085): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells' were unexpected)
Message-ID: <202508310511.xXEnOxIH-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.17-rc1
head:   e48e1a2def8a9105cfaf3ccbf10260bde3e75f78
commit: e948b107f985bc442fba9d1327b7f9e90cc6f960 [8/9] ARM: dts: bcm6846: Add I2C bus block
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310511.xXEnOxIH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310511.xXEnOxIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310511.xXEnOxIH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: /bus@ff800000/i2c@2100: failed to match any schema with compatible: ['brcm,bcmbca-i2c']
--
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: /bus@ff800000/i2c@2100: failed to match any schema with compatible: ['brcm,bcmbca-i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
