Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90992134AB
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747582336; cv=none; b=bkgIsqooKWf76MQoxI8xNbLtssq//fpNekXU/yNZtMPzcAf2V9oPx9shFSwzHNIzfB9xFUYRa6C5DIYoE3NxilyUcjoRZtptn6nr8KShBVE6Vri10HbdyXHDVUiki3CweFbR0oI7BnFCC0o8A3sar8qp0UdEHB47AYiWT5feC1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747582336; c=relaxed/simple;
	bh=RSGQC/+KkhlYHjr1Y+ebYh+mRmZIfVoH7cQQXAaDvHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6sJO5DWV3P5Lkhi90l4653QkNXm+/VWdmtLfPiuivsfkUwiMQ7ZbD9f3l6jVmND+KgQx3zoEIWOyY6o+QhP1lpivOoh8tyh0eUVkYJwoCvNB4yMob8co5w4N47a6VG7k/MDElf/MH2EyuQmJ/3Zx9Bjx16AcUGgc89BXFlOOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDP7B6bD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDP7B6bD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747582331; x=1779118331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSGQC/+KkhlYHjr1Y+ebYh+mRmZIfVoH7cQQXAaDvHs=;
  b=NDP7B6bDoWvVJpxeBmL+MbOujLU8z4RgRcpqMKlSTU254xmyxO2aMQGb
   Dn+Ne0Z2f/0LE/m8iorS+nX9qKv5v0WEyQr4+7OflUD6e37eQSJGHkoPt
   tcObZZExxRqLrBEP8xlbYTSWH96J3tgWbPXgRoNotS4i9h1KB0Aar/MBm
   fnzT1MnAmX/lck888WIXBhHoV0E6/efFL+VDVT4Mtq2avaPywt3tCI+KS
   y51ROvTPRxPGbB5hlduRZos53PK6ayjuDEambdxGXarcXskm8GEFBhu3r
   UOtq4aloeGM4OklQJvUBNHYsr4huCt87UocA8cy7RyEQ25ZG/+dCWhOMU
   w==;
X-CSE-ConnectionGUID: 9vsR4nRfS42bncYn5ZVPzQ==
X-CSE-MsgGUID: 1lDfXoZ/TRW+fUvOnE/y4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60125679"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="60125679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 08:32:11 -0700
X-CSE-ConnectionGUID: /Hh+uWpuRRizYPmu11vjSA==
X-CSE-MsgGUID: K8GIfgJHSMmcaCCRWoa7HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139555793"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2025 08:32:09 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGfzj-0000i7-1B;
	Sun, 18 May 2025 15:32:07 +0000
Date: Sun, 18 May 2025 23:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [abelvesa:clk/imx 5/11]
 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb:
 clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required
 property
Message-ID: <202505182335.rphLZT4x-lkp@intel.com>
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
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git clk/imx
head:   6a55647af3334f1d935ece67de4a838a864b53fc
commit: 2ba124053687c933031a6dc5b2e16ceaca250934 [5/11] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250518/202505182335.rphLZT4x-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182335.rphLZT4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505182335.rphLZT4x-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts:48.9-58.5: Warning (graph_child_address): /connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:794.26-806.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30820000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000 (fsl,imx8mq-nwl-dsi): ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000 (fsl,imx8mq-nwl-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
