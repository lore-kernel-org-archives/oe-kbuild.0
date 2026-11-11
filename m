Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403845;
	b=uSZq3Aaq/AN2t/ZYIzOKDupQuuqqlorCbmHz3fCd07WgGxRV4IzDmVM/iSrNf/1ZkZ83
	 PcLzfzO1c3bJBtTz4qIbwGNCvt0lfDb2d92dE4FsckLs99dhNT/q/rXLuzY51dN/9emi4
	 8SAhFD57cfXqjwNhyM1axaTyvXXor6Y2sMkcWr3eV2dvWraThbNDfwz/6Dj1uvGZbgFfQ
	 y6P/FaZN1hRvifebn3eKA5QKQmHvsShp9Vk43TyKVwnnoO1v61Ce/L7bSOwuMA4lAFZFp
	 6uYdSZov2qSvaYlLKBDmvetLxIC0ABm/KqizNb5zYzbdaZHCUnmhFBuUkxTQHlwtZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403845;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JUw8vJ93f71lTTyYO7FKM9fSQ8qkSzPyy9+SS4kikUY=;
	b=ae4ya446LezHpB+cubiKasLC/oNMwDEH8/BtaUHm666OEr3qelNw8kZ74ossxE02aXHg
	 ipfXbVUjexj0at0DjnLSeDThWNX8N6UqFQCF27KjXdQAV4y/+//WI2xMGm88C3ydED4zh
	 i5F/boMzVO9jhN5qcDegupKFB2MVRnAzGEY6pnH27Q/0bbDYqzy3b8IV/yJwzIIb5CPgf
	 4W3IV4rn4NciFDMF8kkAG3XInu3OK2gmBmKQBcg49WHWLpyScp+AF04PCQ61TDopfMSMD
	 V+V5HyBpnJ6fGiHxbmlkxwOXp806LkN39O4JjoVl13L+R5HvbuF9WxIpPLfBTaY6paA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UCTk8yG9;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93708606A32D
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 13:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93708606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UCTk8yG9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794403843; x=1825939843;
  h=date:from:to:cc:subject:message-id;
  bh=NxReRK4Kke24RywLVjHlzfZEYhB5vGlVsYhrz645g74=;
  b=UCTk8yG9I2MvcQFaTVYlwNnO95chVZ6TpE7HArQweF7KuUok2Znm+b+B
   suGyJ8H8yxqexYgOvjhGhxjnI9L++nMKWmBVdghdQEXreeakzlW8uGMdG
   UUQlrcqVBN+9MlopvWOALERiR1yEzo4QXuakzArONqOj4Wy1Zt2hrg+z+
   9prBHScWDBNcUcnr5OTs77q3DLVY29v4LaZke5S2cj4daxM670WGfWsJw
   jWuxdozXRHhT1/5DRoGsIxc1WMqfH3Uzu59MawoP5wKNDtowcXcl5SpMQ
   IOtjo6khGtdJ4X5kqWTrJB62EyRdggTKxY4B0xWHdgAVT3SbiPlkAIGT3
   Q==;
X-CSE-ConnectionGUID: d2HJrNdRR3y8BF7rZra96w==
X-CSE-MsgGUID: Hwe2VoywSzKORRdmQMGu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3258967"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3258967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:30:43 -0800
X-CSE-ConnectionGUID: ESBG42pAQzCC0Mbi5ZlaiA==
X-CSE-MsgGUID: ohXothy1QNaPWR88ZKrI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8757707"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2026 05:30:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR8PQ-000000000af-0N1m;
	Wed, 11 Nov 2026 13:30:40 +0000
Date: Wed, 11 Nov 2026 14:29:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 35/36]
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb: usb3-a-connector
 (usb-a-connector): ports: 'port@0' is a required property
Message-ID: <202611111402.zuQXh6gq-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 81def3f9aa50f13610b6091143c07057d54d8689 [35/36] fixup! arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611111402.zuQXh6gq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111402.zuQXh6gq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611111402.zuQXh6gq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb: usb3-a-connector (usb-a-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dtb: usb3-a-connector (usb-a-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
