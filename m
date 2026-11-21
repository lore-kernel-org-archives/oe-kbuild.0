Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259493;
	b=HEwuV4rUZSvRGkYNpRwiHDpL9ghAlHlHGjCqeZpTjie5CXLrOLzDZq6VsnOiEo3U/Ths
	 Eg2gpg13EHd9wA3kvHgzU51e8XNmOuOHHmKbv3IH72pAsTp3ShJH5lpf6K2/eP2UQ30G0
	 jCauqlXpDudyC4g2RGm2mWn3TxjO6PlrGOqoHMCwjkAP4spBAIpEkONaDCuTc81nA3NSZ
	 GfMItFweDz78ZhTJm/6oj3Sufzg85+G8bC15wl96j4kkbHKB756RiMMHoZ01uQNqdiE/0
	 fiGaGExEuBYX2OB0+B4apaYpqB7Dih8yFtf0McslCUVPQUU2T4SJsES1IUBApgeSWjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259493;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=S1hGtaSAr4DtS5XVZvXWYib8pmYSiS3gkdU3PwaxhQc=;
	b=WYwZI540FKRu1jdFQYu5q+RmhrhVdODZ1lwO1unCXcVhLif70mOF22IVigFCzIiFYqMN
	 up5yN4PD03yK1QtfA/3twTEhQrEbj/UP+f/h8e57acSLLow1aJDmHcot0ZIyL584bat4f
	 H120p7CVi/HKdYtvq34ADecuemRdr8urIs0DzDpciAuum40XxEoGEY4yLeEtR5gqG1WJj
	 hXZazmtZeG4MsK7wMrQdUwMVIksOD0d9GrW0OCcMWPDGZew4B6y301KpQj17DjsKHsIwl
	 XIwuQgJDt3e/ISciqzK4dijuYg43/nNnq9h0EBoaEgWNlkMn4PqAxFJ+zcRte40GdBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSjdCO8n;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A008606A331
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 11:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A008606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSjdCO8n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795259492; x=1826795492;
  h=date:from:to:cc:subject:message-id;
  bh=FlaouwJRD09wbHJGMbwbnktebQiyeiBc67/PdaIDMQQ=;
  b=bSjdCO8nMZkVxiQzY6RstOXjmHLuKaRNTwQuUrwTDnYMBfv3uwKv3Hbx
   hVgD8rye0NxqnhpnE5G9GsaJnwvXKGVdnWJu373Kkbf6W4xzS/V8UuyZ+
   PTyrtTJzgTxNxzeYK8hK16vFMeRdHBHVe3R3CoY1R6WVRJ/R3iJdsuM45
   mq/WcwKtm9o2K7wycXIeV+Ee70v3K8auZpYaxRogPEIa93KeErcjUUulx
   nakkRlarC4wuEEZGpUgTctT9jc6+oQs1NFaqvZ1KVqbfG+yCHlPEeyWtx
   YsHSLROZY+LZdpvvTRcdxx1hHaB5F+ZCWNY0kOGQgzy5Ay+zaXxSDoc/6
   A==;
X-CSE-ConnectionGUID: /h2ECoh0S22jLjRI75ddnA==
X-CSE-MsgGUID: Ov66A57RRgiW8gTLMYmy4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4020303"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4020303"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 03:11:31 -0800
X-CSE-ConnectionGUID: FcAorpM4QT+QFiTVSZ9+TA==
X-CSE-MsgGUID: qlYTgwiuSNKpvEPAEVyXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11240061"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2026 03:11:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUj09-000000004Iv-2SQ5;
	Sat, 21 Nov 2026 11:11:25 +0000
Date: Sat, 21 Nov 2026 12:10:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 55/93]
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43810000
 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
Message-ID: <20261121120854.es9DUptV-lkp@intel.com>
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
commit: 3667c33a8da759ccd979c130ada285f2c71b54df [55/93] arm64: dts: imx93: fix gpio clocks
:::::: branch date: 19 hours ago
:::::: commit date: 10 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121120854.es9DUptV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121120854.es9DUptV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121120854.es9DUptV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts:202.10-242.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@42000000/spi@425e0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev-nau8822-btl.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev-nau8822-btl.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
