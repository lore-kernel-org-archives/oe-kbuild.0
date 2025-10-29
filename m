Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1182248B9
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740251; cv=none; b=MlGmUS4w9RG7UkJoSEDSdKExVyumOwJfBT70dkMdI2RyMI9Vx8I1TdeYiBLwoCTqs6xSYprSMB4X/rNsny9zH7qRcx+ps+eIZKWVxJOn3OknKnSvnEC3+E+Qp2hBpCiSv4slNAEVPIp3MOcnRMFLddREND+J6LOuABP0OaYl7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740251; c=relaxed/simple;
	bh=BKLug3nLGfjUNg0H0sRT1PjufX1zYs7F64OkdqA2SAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etC8yzQj9LuqoqyZ25oQ7L1FvUvkiNJ9P20Jxs6Awxe1d7zZJpojh06tEHsmxWXNkffnwmwiZQ4XkthJfaPj0rZPJle66OXB6OHR2YsW9j9m7OtPWIVqNMn7Ft2McBEgvFQqnRYtYIdPEMeaNHuJXld8uIRhSFipzlyeS/dcTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVwOY2Ce; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVwOY2Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761740249; x=1793276249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BKLug3nLGfjUNg0H0sRT1PjufX1zYs7F64OkdqA2SAQ=;
  b=OVwOY2CePtr8WPaIr6WRybnToTO15VtY8RZeK8F2QoFex9ySPulDycHc
   eggn7Nj4beqSSD0Vcv+cF3XRS3T9q37H0lSN/Q79XHo7zt2v90MBk2sPS
   NDSJ6cOVW2WjQtlcKb9poIHpP3KApgHy6OmlxRwGxsphcnyl6yENt8lqJ
   nP6pazNAwdkHhAvY+/fac1Ig934/WDheX7PhELrhKHQDeQsyImPmJzfTh
   18qlWx3Ye1GOO5i3zQ6v+zktYPaydmMRMMqAp1KhPA02WE19nOKPG/a1B
   +WBfBMHtyPvReIh03vv+GRNneVWBaYJwCz1zq0058ywtk7UIKfdFT3kZN
   w==;
X-CSE-ConnectionGUID: TZKvXQq/QwqfBbmnxON5sg==
X-CSE-MsgGUID: M+bIPAD2SUWJXWqQp6yyrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63559639"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63559639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 05:17:28 -0700
X-CSE-ConnectionGUID: tgeCJf1wSUeaayxKSOcINQ==
X-CSE-MsgGUID: X61Ld/d1Scu3dQIGv9Ki8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190002094"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2025 05:17:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE57E-000KaX-2D;
	Wed, 29 Oct 2025 12:17:24 +0000
Date: Wed, 29 Oct 2025 20:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /sound: failed to match any
 schema with compatible: ['simple-audio-card']
Message-ID: <202510292041.okEj7Auq-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20251025 (https://download.01.org/0day-ci/archive/20251029/202510292041.okEj7Auq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292041.okEj7Auq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510292041.okEj7Auq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0id@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0id1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Speaker\x00BTTC Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: sound (simple-audio-card): simple-audio-card,routing: b'BTTC Speaker\x00SPKOUTN\x00BTTC Speaker\x00SPKOUTP\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
