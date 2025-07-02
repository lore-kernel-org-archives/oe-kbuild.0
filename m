Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99332C85
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751424904; cv=none; b=bhIim4ImJPf1FBbhq+geT4oR9NWXsK9ZIeSYthBmlY6l4WU3Y9pjKxSoS5kb3+HLf0Kup5Gw1lZgBAtRQWV1Y+U+gPb8SxSs8XUHSMIpKs7GOC0In9HyI7hRc+unGCrYW9tBxz5TIat42yYGEEcPi9/JGPlN+xqsbWF5WH3vH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751424904; c=relaxed/simple;
	bh=n0MEtfQ1xgoy5hl4WUJ8NcDkyLk4NOfgijq8qAkR0js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4agI7Tkuy6CTo+CSLhfz7zVXT6jat/DPcQVmkQsbLJd8qAs9lxHDpAfwImBgY5u27ynL5rw6Aq+sTLIB6H0UHOHQ8tswLjJ9GnOL/OuDz+8jqJAjucT3/yGQoUALyGIt+4QNX0Ac1rcSX0lQq11oLFX0mizsUxJtqeypZaMIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DS6oGs8k; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DS6oGs8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751424901; x=1782960901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0MEtfQ1xgoy5hl4WUJ8NcDkyLk4NOfgijq8qAkR0js=;
  b=DS6oGs8kjhQbjgMOn46HVLm9KNPp2k3vPeAOyK77UeZhXYTva2PaunyU
   +w/1ZlDCKPTHbKZZjxFzNHnZx25BlZ/Z41lsMbUts/1yPKdMVT+Ig4IX5
   susfPwUaYx8BpW3NT99oMmIsI187+GTU6b8LpRGo3Q2/r19NHSDIpVh8p
   h32n579t+XZGgw29DCfXAjnWsWyqkFiTa+LrtCxIiM8NeoiXAXYmtI0vn
   lL5FbxH7bS74OqD3q36DZF0tI4ptXNBrshwoxmofOeQl8zChBg6YUdCcg
   do49cjw2praffegmANEVNZyilhr2X2sfzicj7djfuIlghqpTNUMd/IFox
   g==;
X-CSE-ConnectionGUID: ezC3sdwoShuGuabrcvF15A==
X-CSE-MsgGUID: lRs15z+RTimpXsbDpXegBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53666753"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53666753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 19:55:01 -0700
X-CSE-ConnectionGUID: 3wExwGR4TrCN3CWUP8EARA==
X-CSE-MsgGUID: 1KUakeMISxOzVThbb/mlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="154431687"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2025 19:55:00 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWncf-00004L-2s;
	Wed, 02 Jul 2025 02:54:57 +0000
Date: Wed, 2 Jul 2025 10:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/fixes 7/8]
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000
 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
Message-ID: <202507021047.AGdKBfkL-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Meng Li <Meng.Li@windriver.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Ahmad Fatoum <a.fatoum@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/fixes
head:   61f1065272ea3721c20c4c0a6877d346b0e237c3
commit: 720fd1cbc0a0f3acdb26aedb3092ab10fe05e7ae [7/8] arm64: dts: add big-endian property back into watchdog node
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250701 (https://download.01.org/0day-ci/archive/20250702/202507021047.AGdKBfkL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021047.AGdKBfkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507021047.AGdKBfkL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1021a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
