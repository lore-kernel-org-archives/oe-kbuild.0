Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334369;
	b=GHXAJfB8uwz8H2sy19R1ilxfF1gQMRF8C2/pgS3gqrVYzNmNZ2CCjzRFunpeloCubw2f
	 uXGu5OB57iElPJWyK25qqiwFooXNEoRon3dnTv09qW3Dfn9MHMfcjCkHXTKeq52KsYdAX
	 KZvmDLubgigxvkEaW3teEG20agYc+MW2ntGLwLuVoSHzNtGbWlrINferkqIc0ulJiRqXv
	 v8vyppdpWCQmYVRGrSBQWceZ7qvMg0oNb+j/1JN1aG6c5eUXYg2hCMLzJoEaWg68x5LPl
	 RE9vY7GKIUFCjlnVGOlgVi3UptPrwF5tKaLmFR52Sth47pDay8PMHwrypiXCvk1BubA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334369;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OwvElc3xJpBh7EP6J0TNyyYQ9gM6V/Th3Gm++oV+G+U=;
	b=oIHJlj/YrqqOz78H3tg/uQOwuhyCs2ANAO+xwXUMFUC/rx/xExbZqCwKxPlOQBQpWZct
	 Gu1Kod2CiUdNhVaMoI6M6oziOylKnJpzj/SJDu6+pp/H1PzHa/eEK0QFbifNQ6aLjRlcw
	 Ikj3W3W9NkM426Rk1zYBOWhDIAG7+CHEAToGznF+RCvptOc5jNnUmqbBkVyJ6CoWQAPtO
	 V64BZfgsisrOtt7BEvAxrd/U46BpFoFlF/ZKJIw8MTP/3GXF3ABOF32S0OR7MMATDnavN
	 xXSejgoyAIIxidMYg2ArtXfQqvojmNKCyylnHbaAqtYS84TiU8NSWkvNIu0FYNw3Kgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XHGbTn2h;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C78606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 07:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C78606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XHGbTn2h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795334368; x=1826870368;
  h=date:from:to:cc:subject:message-id;
  bh=Vv57XO7mMQb1ythBjC/cpo0jwu8wtLbmoopaNjmtAmM=;
  b=XHGbTn2hGD8Oehj3Cj1YUCv3iWdIjfNtGynL3D90M+3Nr+gNmtUlzI0+
   GnO0A5V3qWXUz6D2YBZG6gI0ZDmFtt+s2v1JIkbpj/uWVF2ys5w7Rauk5
   HSVyYGldBk7XM1Eoeei1CdNs7uv+lTZe/+kEfxE4jjUrpntrrUuoikFBM
   iXrnclXj9Ei3yRfZGHy7a+L6NpspNZCI0yl7vq7Lpy7PTZ0aFqVs9pqHI
   8hLIcKd1sQheGV/WSFzystOP1lEH3OKu68JrAzTDTeeOIMaBOV4lLQOSn
   gKKWDnho3LnVvtcg9XSdZeSNsz2YM2xXieRt5xnax4p93eDrXuQrDZ23z
   A==;
X-CSE-ConnectionGUID: j2k/b+4ZQLmX0wfB3emWaQ==
X-CSE-MsgGUID: YznbGN9HTYK4SCcsZqAhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4057792"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4057792"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 23:59:27 -0800
X-CSE-ConnectionGUID: KunYZe6JShWn6PBNQtWPyw==
X-CSE-MsgGUID: wDB3eMvET1KWmbTP+2Ya8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11243243"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2026 23:59:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV2Tq-000000004Wn-2v2Z;
	Sun, 22 Nov 2026 07:59:22 +0000
Date: Sun, 22 Nov 2026 08:58:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 56/93]
 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43810000
 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
Message-ID: <20261122085747.dsTLRvJp-lkp@intel.com>
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
TO: Peng Fan <peng.fan@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   e32bda9845c5239c3b7605c465d61f3e2d350599
commit: fac954d758aa2d2d6c35b48c052ba753f06f856d [56/93] arm64: dts: imx95: fix gpio clocks
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261122/20261122085747.dsTLRvJp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122085747.dsTLRvJp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122085747.dsTLRvJp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:55.18-58.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev-ser0-mcu.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-nau8822-btl.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev-uart4-mcu.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
