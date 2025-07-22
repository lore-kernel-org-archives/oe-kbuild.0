Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783712EA15D
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Jul 2025 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193930; cv=none; b=aMA/xz1nmp4RNqikHzI8WEveDgiHb/6o63u1yKy0IL+mK8NN+9qqzMHEJw8zWsr3SyR6G24J9G0C0j2R73NDtSXS7pG1eDh6inTKs/hrhYxsvzl/OCZ5qvWzOjTyASR4Y6ut2S3lU/H7upFcRI5TtQi2DWxCUSuRqwmqusip+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193930; c=relaxed/simple;
	bh=/2dCZsvkAPfBUOzNHr1YgdTw+AnEUkHr5cfkPjcVyDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uj9stPRM6d6jSQgc72Le/ToYbRxACGmdRcocCetC2tchLVT8I+Ic4UgwOvQ/fG5Dl2LVISusN9YAcXXda2W5OrYw5FiHzw4hXklrASlyFvzpC4y2DTz7iNGBTzJDfbmrcdtJYRkbPMxFBY9TY2D18kA6j9v3Ldw0ddJKr/fjuKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5YCQ13/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5YCQ13/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753193929; x=1784729929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2dCZsvkAPfBUOzNHr1YgdTw+AnEUkHr5cfkPjcVyDI=;
  b=G5YCQ13/8eiAfQ3CJOKD1+mR7d7qtx5fILrxKOW0MBpQN80LU7TPrSHk
   8KTEujWPmxj3jg0EL3023A3C5aXebuUUyTuhLoRqvo0vgI7e6P7mJTW+J
   59DMFMBQOyu2Cl0GVARys1VwNTxFerD8mHC01I6sjp+2y4u68m37ElTUU
   w27r5BJQae/irT+eJ8GuTRGHq5L78Z8l1nP058d+Q7uVHZors2AEipanP
   LEen0UHTNC5WP1LU5Qy12SnRF8FeEtu9y0R8PtgWi3Bm8DfoSvt9yXV71
   dsD7hikdd/GpXeGotknXia3AhnvpV5NB1Y2xfp4FRztJP2qwm3Vh4ske+
   A==;
X-CSE-ConnectionGUID: SZXe3AU8QB2Iz5lCyQwliA==
X-CSE-MsgGUID: sFZpqCDdQDeZgjbSwwCGLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55535980"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55535980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:18:45 -0700
X-CSE-ConnectionGUID: xUJyRgi2RH6mD+TydAJj2g==
X-CSE-MsgGUID: hk39SsnJTbK6skMesFqUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159471516"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jul 2025 07:18:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueDpJ-000IKK-28;
	Tue, 22 Jul 2025 14:18:41 +0000
Date: Tue, 22 Jul 2025 22:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mediatek/dt 6/7]
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: timer@10008000
 (mediatek,mt6572-timer): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202507222222.v5jdcW8J-lkp@intel.com>
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
CC: arm@kernel.org
TO: Max Shevchenko <wctrl@proton.me>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/dt
head:   5a8e7b4eaaa232d747517fe34ba6867139a4cea8
commit: 7f3f9e565316d4c9c739569d46ae812b8c1e0535 [6/7] ARM: dts: mediatek: add basic support for JTY D101 board
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250722/202507222222.v5jdcW8J-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507222222.v5jdcW8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507222222.v5jdcW8J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts:22.37-29.5: Warning (unit_address_vs_reg): /chosen/framebuffer@bf400000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts:17.9-30.4: Warning (avoid_unnecessary_addr_size): /chosen: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: timer@10008000 (mediatek,mt6572-timer): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6572-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6572-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6572-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6572-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6572-timer', 'mediatek,mt6577-timer']
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: serial@11005000 (mediatek,mt6572-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6572-uart', 'mediatek,mt6577-uart'] is too long
   	'mediatek,mt6577-uart' was expected
   	'mediatek,mt6572-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt6893-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7981-uart', 'mediatek,mt7986-uart', 'mediatek,mt7988-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8188-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8365-uart', 'mediatek,mt8516-uart']
   	from schema $id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: serial@11005000 (mediatek,mt6572-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: /soc/serial@11005000: failed to match any schema with compatible: ['mediatek,mt6572-uart', 'mediatek,mt6577-uart']
   arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: serial@11006000 (mediatek,mt6572-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6572-uart', 'mediatek,mt6577-uart'] is too long
   	'mediatek,mt6577-uart' was expected
   	'mediatek,mt6572-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt6893-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7981-uart', 'mediatek,mt7986-uart', 'mediatek,mt7988-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8188-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8365-uart', 'mediatek,mt8516-uart']
   	from schema $id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#
   arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: /soc/serial@11006000: failed to match any schema with compatible: ['mediatek,mt6572-uart', 'mediatek,mt6577-uart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
