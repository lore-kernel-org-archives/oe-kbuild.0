Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145455;
	b=ojw/mdg/v9c6/PCOoK7SpdHWI3GLIbg/3gBE3T4oZNsSa6Y1jelH2g/jyCaiyoQmlCcE
	 LU/xBvQ6IK4ogBoE1d25LatZhY63vHb0yDL4vi87u/ncQCIYE4gpHvBpfhY/vH0kQj0YE
	 dJE7wkXDwhUm1EdnBvTFRw8aWr0jqK4VsCCKZiuS7N7J8LPB2kuQmqGnMogU7XBtVzyYd
	 vuYqRxunr7xC1z0KLyKTiSzzvBQqWxhtLdmUQmY5lkuPSws49xGrL9wRjrHKVbRZqbiuS
	 yLm8mr5MNJ+RUHwgq8eJVGvPv9Kqy/b/mJ1tgzOHeDvuE/kI2G11KuuOw554B61ZYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145455;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fozPXuTrJLbUJRW2oeA5EhhVmMM2LewxcTgCgjVsxEw=;
	b=CKtdKKB4u59zqFbgFcWIQ6NuS9/6IizTwLAPRTv461aonlfJfUxjXSr81PEWcnl9Gjmx
	 Xepc0QEGOnRSWl7o5IuTwnb3BT/Et9luA4mMWqP3F5cjxKaLIoMAElA+mLzBoJcinmATl
	 X5I7RZI52SJI1NCN1sVptg1rq889h060JnFNigRbI03mjyx5gLZFbC5w++CZmmt5B71wh
	 FvYq0EPhR6tsR9WNpBBlBXrWOkpe6GQalduHiVPg0LAfnNTLbjzctNN7kJgXGW/VWbBNB
	 rp7Y2RJ0wVanFWFRzvNQXAbUTgBIFTD16T6OZG1qFN2rqWg/bwRxk+PgCmnGAMiMrQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fq6EzG88;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA2F606A33A
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 03:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA2F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fq6EzG88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795145453; x=1826681453;
  h=date:from:to:cc:subject:message-id;
  bh=qRgTXkxX4wqWjLO0DImEg2AIn4rxF83TvIVllN14j2k=;
  b=Fq6EzG88kkxjsSuRBR2HZEJa2pIcenKntcri7/DvCJet9lcwlUF8N+dl
   DANwVR6y7o5z8P1BM16XNsNTr3u31wVBSHlT077cjo/Z7BjPlG8NwEagA
   vEqYPb1WQwgNSifby3XifccMrRSZ90uUT2QTJ49rJp94du6XPUWepgeXk
   w1eE/sPoU/ZYRAs7dk9NSj6fD8JDPv6s9PS0XmFSVc/Al0fIdmtDCh2uP
   JEnQ/9NSnvs7RIRwKGv4g4FLj4hHYIZm0zcAUPYFKmGu+xQ434WU8XT96
   DUGOuuoXP5egm0QuAzvzvAOVQamGaCRS8AtThN429P0jNaHcmVXbcbhIt
   g==;
X-CSE-ConnectionGUID: sFwr+jBYRjK68glpKEaWVQ==
X-CSE-MsgGUID: 9Jmjhce3RVGzPQJ9p1/VuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4097685"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4097685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 19:30:53 -0800
X-CSE-ConnectionGUID: yeWs1uvQTRmSeiLhreX5rQ==
X-CSE-MsgGUID: g2GSY8+RTwKpu6bLWeK5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10586164"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2026 19:30:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUFKr-000000003wT-3v5O;
	Fri, 20 Nov 2026 03:30:49 +0000
Date: Fri, 20 Nov 2026 04:29:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:newsoc/ambarella 5/6]
 arch/arm64/boot/dts/ambarella/cv75-evk.dtb: serial@e4000000
 (ambarella,cv75-uart): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <20261120042010.Q0nAfIJF-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Long Zhao <longzhao@ambarella.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git newsoc/ambarella
head:   d76a3a4c6da46516fe641d5aff4e1a76f267e01d
commit: 4a1ce643a9ecb9d9f73122caa2bd9b94e4382fa8 [5/6] arm64: dts: ambarella: add CV75 SoC and EVK
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261120/20261120042010.Q0nAfIJF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120042010.Q0nAfIJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261120042010.Q0nAfIJF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ambarella/cv75-evk.dtb: serial@e4000000 (ambarella,cv75-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ambarella,cv75-uart', 'snps,dw-apb-uart'] is too short
   	['ambarella,cv75-uart', 'snps,dw-apb-uart'] is too long
   	'renesas,r9a06g032-uart' was expected
   	'ambarella,cv75-uart' is not one of ['anlogic,dr1v90-uart', 'brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'google,lga-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3506-uart', 'rockchip,rk3528-uart', 'rockchip,rk3562-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1103b-uart', 'rockchip,rv1106-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart', 'syna,sl2610-uart', 'ti,tda54-uart', 'ultrarisc,dp1000-uart']
   	'snps,dw-apb-uart' was expected
   	'renesas,rzn1-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arm64/boot/dts/ambarella/cv75-evk.dtb: /soc/apb@ffe4000000/serial@e4000000: failed to match any schema with compatible: ['ambarella,cv75-uart', 'snps,dw-apb-uart']
>> arch/arm64/boot/dts/ambarella/cv75-evk.dtb: /soc/apb@ffe4000000/gpio@e4013000: failed to match any schema with compatible: ['ambarella,cv75-gpio', 'arm,primecell']
>> arch/arm64/boot/dts/ambarella/cv75-evk.dtb: /soc/apb@ffe4000000/gpio@e4014000: failed to match any schema with compatible: ['ambarella,cv75-gpio', 'arm,primecell']
>> arch/arm64/boot/dts/ambarella/cv75-evk.dtb: /soc/apb@ffe4000000/gpio@e4015000: failed to match any schema with compatible: ['ambarella,cv75-gpio', 'arm,primecell']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
