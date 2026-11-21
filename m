Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268291;
	b=QM575+TiafrBjFdEcH8pQZJCr+gyGSXYiA4C9MNd/eC41zywJftZw4+nXAZMH210cGL3
	 YfFhvob6AdpNOK9MoBBePCof84s10tvZRleEkZTUyPRtnXjSpZhAkxme0bcJN2y1pVjIk
	 NDY+cCje7k8f8VodFlr6cbrtQa80j9OvTTpk7O0nFASbt3SIj/x5kT08M30jcf8K6OPpn
	 JQnRgbMbxRP5xFzttL3UHSsgEgx9DHyzm0qqKonY+zJxXhb1BI0pEaPLtVhHcaCvxUJH/
	 GyWH5AqSqramSMG/c8Szjed7Nv2Qp3okWPzFTuQkgzN/LPud2Y2Y1tVGJqz6y6Lbc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cJwES6Iy4cb24s+yP/izMdOYrIOE2QLG9+Z35uQPGsQ=;
	b=UbsHNIUp4Di9S/522bGm08DEol0XnY/dSDyk/FYjXTAo500gdZLYi+LiHQs3guB0TUgx
	 w1y/kJ/3cXIWx3O20aUTL454keYm2n8iTUqta7iylZtUwEq0O7hmagk3KGvXe41s1vgUJ
	 I89xDDLilZ5yis4Av/ohtnshg+byx+vY8ySsWEDCHQhy3TffynBzf6rNrfLzHxYTPkDqW
	 s1aJK1++6Fud3VQQ11kWz/4jyNtP1zLgfO5Y0aRBjJ1XyTRZSy/nwUyGOghDHsCmCnXfx
	 gj7tfxyg0PaJzz76EJklsHVMYCf9M+MdWc4veqV9glKr5sLsXUlt58aMAhUTL67yJ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DeyOZZKv;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE6C606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 13:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE6C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DeyOZZKv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795268289; x=1826804289;
  h=date:from:to:cc:subject:message-id;
  bh=V/+NNum9OLaWqiXTJxTFSkshUehmc+PmLqvl4zAR4go=;
  b=DeyOZZKv3gs2P/Qf3k8l3imuKf1YLF29l++1s98fh4TFNOlod/2nMnAs
   c4uG0T0m8wwmEa1gkcEB+gubgnamNNeZPYC47pg0QY6K+Y+i0LQzHirrt
   tovQZieYxC7vGI+BcYl+L5RIyEtx8AZeputXO1myFsWCyhdLbw/Vw9XAt
   IYGKleYr4Y+S8wqNRAvnfLFbIqzHwfnF2zuQhIN4Q/kr9IRX+Wqb+CfvN
   pCxpm+AvGKpQrS5wVYgvchDhE9qsjEq5SQsmi9AZd2RiXKwmo8owAMkZE
   a2WS35NwohLKGkZwjMM7lEeYeYCNzIisilEJbP9VrmSBbd3w6HEsTlvXr
   w==;
X-CSE-ConnectionGUID: JsWBoKTfT0SDnoHJ7He8/g==
X-CSE-MsgGUID: z9qE8wnATlSfqA3in/GUmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4025102"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4025102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 05:38:09 -0800
X-CSE-ConnectionGUID: uEui81TmQpGwGXPeCxHh2w==
X-CSE-MsgGUID: Eiekc13pRn6o408EjNsd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11040529"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2026 05:38:07 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUlI5-000000004KP-2WVi;
	Sat, 21 Nov 2026 13:38:05 +0000
Date: Sat, 21 Nov 2026 14:37:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 75/93]
 arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: can-phy0
 (microchip,ata6563): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <20261121143027.MRgX2Guo-lkp@intel.com>
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
TO: Marek Vasut <marex@nabladev.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   e32bda9845c5239c3b7605c465d61f3e2d350599
commit: d92df623e90b3ff8a07fd926d8521a431d01bd05 [75/93] arm64: dts: imx95: Add support for Data Module i.MX95 eDM SBC
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121143027.MRgX2Guo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121143027.MRgX2Guo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121143027.MRgX2Guo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43850000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@47400000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@47400000 (fsl,imx95-gpio): clocks: [[25, 54]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: can-phy0 (microchip,ata6563): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,ata6563', 'ti,tcan1042'] is too long
   	'microchip,ata6563' is not one of ['microchip,ata6561', 'microchip,mcp2542', 'ti,tcan1051']
   	'ti,tcan1046' was expected
   	'microchip,ata6563' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tja1048', 'nxp,tja1051', 'nxp,tja1057', 'nxp,tjr1443']
   	'nxp,tja1048' was expected
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml
>> arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: /can-phy0: failed to match any schema with compatible: ['microchip,ata6563', 'ti,tcan1042']
>> arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: can-phy1 (microchip,ata6563): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,ata6563', 'ti,tcan1042'] is too long
   	'microchip,ata6563' is not one of ['microchip,ata6561', 'microchip,mcp2542', 'ti,tcan1051']
   	'ti,tcan1046' was expected
   	'microchip,ata6563' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tja1048', 'nxp,tja1051', 'nxp,tja1057', 'nxp,tjr1443']
   	'nxp,tja1048' was expected
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml
>> arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: /can-phy1: failed to match any schema with compatible: ['microchip,ata6563', 'ti,tcan1042']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
