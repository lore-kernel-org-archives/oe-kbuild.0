Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401936;
	b=xw7GOjM6p5c2lXPHmjfS5/Z/43fYfTXuTDwym9c4vp/13k6Nmk3XAZtGovMYOpRBnEl8
	 jl4llMglutl02lHfYdxf0r1m131vr35iamskHpH83fDwaYs/pNdGVFQEw3P4ngiMPX/JX
	 EWozK99SBWC96qu/P6vkxjERki/Nb5IM/S9bPZVwNxbAHMh53AYYRerxpX3ouaZrnfqvY
	 tC/Vywy4WHnUq0fUVZK5Jepk3mB801HLMheIAq4V62LMp98GK7FG/cHF754+ircPp/lLb
	 IiK3iuscW2lfiVcyV6u6Md2q5kJyDEWNolJvVSUdPB1+m47+0qfzmokjpYpUH6J6MDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401936;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vosq25UFz6phTWwd/++TUMauJZU/ho6ftnZVh3c1INM=;
	b=3fsPtpuCG21XsO/xM9JoNwEdRV/0svWXCxy1gT0/iZ5IpgrpxbJL7Plc5CHiu9arJ7nq
	 2GWcEX/QdLPAO7/mWb7Z1mbOP7/tXqnxBjceZPIUBYTbOOfzxU4OOrcjYPN0uhMkggqTz
	 p1hbdrxVHK+Nn96/Kz6p1EDsWdBt+10vierNbExqxpv1XBZuFpStppbWlRVorcPyQDAjq
	 sHz/geqTj87GtZZBMdTgCnUvLLVO9kQHbnU1JaYJd7RXrqP15vaAiRm4PL6Y7I7T5uoWi
	 WAYLl9N5Ougbv4FIs2qfNMQ5NB8tmFr2BEiK316Yt94RWA7WIlVv6grQmPLeHxI5OHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZkWnh04;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9C606A31E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 02:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE9C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZkWnh04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795401936; x=1826937936;
  h=date:from:to:cc:subject:message-id;
  bh=0wubux5scBjhx+zZ8jmjRy/l1rTUn44TF5z7LzTvTwQ=;
  b=DZkWnh04hYbobFZizLCiXB5dlk1hIODMnqN/sd6yutSSqZLQVaUTaE16
   NNx1O+niiL118B/RechhaKDhRPiP/W3y1jlKRjwUDnqMfVsQsBD/L6oZh
   Z5FislzLxP9y6DNq6EDzmobeGiWHGLMekcX1OD1TwzNHeI8/YTbQSTBow
   XPS7kM+dWzDZlBebvdq6G+5nnYNJEG4D94k3sccF1EQ45ol1SzD9PKs7l
   8gTTHfPQXqiGLyqbzxyzAMcIrM34ENd8Ct7Ba4LK6Y/uKGzOxTN3RcZsu
   Gu3uThS/N/esIQP06J1B2gcFWSqp6iFTCRMc4T1KZWTMK1Hs1ht9ysX1f
   Q==;
X-CSE-ConnectionGUID: 4PSfFraESr2yMNPQZbu2eQ==
X-CSE-MsgGUID: nFmS+C/7Qki1VLorNpggRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4232096"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4232096"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 18:45:35 -0800
X-CSE-ConnectionGUID: WTxxxOEqSpGRf0UZzl0V8w==
X-CSE-MsgGUID: c7l0FOdnS7yx92IdfFEF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11167210"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Nov 2026 18:45:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVK3f-000000004ig-3WcN;
	Mon, 23 Nov 2026 02:45:31 +0000
Date: Mon, 23 Nov 2026 03:44:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 57/93]
 arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43810000 (fsl,imx95-gpio):
 clock-names: ['gpio'] is too short
Message-ID: <20261123034009.L8XoP5Ds-lkp@intel.com>
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
commit: be166b98288e613f1e63fd39547c5caa0d0156e0 [57/93] arm64: dts: imx952: fix gpio clocks
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261123/20261123034009.L8XoP5Ds-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123034009.L8XoP5Ds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261123034009.L8XoP5Ds-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx952.dtsi:348.6-1534.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx952.dtsi:348.6-1534.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[2, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
