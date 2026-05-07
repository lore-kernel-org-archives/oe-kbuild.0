Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB84466B69
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178404; cv=none; b=rTKKziUoaKoTk33JOqOy88kd5OtLISD+uxRFY+7V2uqTmitcEBEDV9UhdHzyIVpT0WU6Oh+sT4lsIVFlg4TeZn1+jlfm050jhAfv9j/4JVz+lsBL/2PWUbXR8WibPvUb5Xcl2y/v7TcYcXNZf0fxk2QuF9sCn93bpcXSasPpvcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178404; c=relaxed/simple;
	bh=QZoUBpmr7jWFOprAC8dhyybXd5MrovF+I66jk9MnUxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uNGNdYmDVuvOK1Bqgmc3Mi5F/gr7mZVoltrCwGo4e/JmWFDJuHjRqg2UPlFO09GjFLewrF/UPIkLGGaY0FbBJaIwGpjXX/nmS54yl8ShV3y8Ecx7WS75Fdz4Ce+FahQDlhMab0uelEYyHLlTd18RqbjDVJmgf6rFkWg0PtAqOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgNm8P3g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgNm8P3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778178402; x=1809714402;
  h=date:from:to:cc:subject:message-id;
  bh=QZoUBpmr7jWFOprAC8dhyybXd5MrovF+I66jk9MnUxc=;
  b=JgNm8P3gThLhA++/qJ1LeCwJwzxSdbLKl9m/eCG4iwXtB3GibDEFsSBI
   zJCFWozoqK9JGYt1OYQUDjO1JektLHb3F6+To39bvTWrL1PNwgVE+QsLf
   NcQ+CldhpllQOHWGjDtGo+upmZZQbgy1AnvBJT+rFl5Ar+UIdBHpehdmo
   I8FOaPvI8CDAFsUmWR28LJd0GSEMFKJcgSQn1raCmp3rQzUa4QATu00nL
   k64nq6HRCoLcKfwIq5CBN9s6hXi93spxxYhyPKSFMhDogPSbMUnnK9dvM
   GC3SiOo86VF3aZqsY6m7BH3ma3AeitBpldAm5tKUJNWHPouzjRmYqeRSZ
   w==;
X-CSE-ConnectionGUID: OMfXORiITJKkScOLTwaHjg==
X-CSE-MsgGUID: R/xsbMw2RKeDZuiHptM8Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79131065"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79131065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:26:42 -0700
X-CSE-ConnectionGUID: rJ4LvXxuRPSYw9G7GypgXQ==
X-CSE-MsgGUID: D/pOb/SrQr+bey+ZDpw5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="260251659"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2026 11:26:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3Qk-000000006vN-2pO0;
	Thu, 07 May 2026 18:26:38 +0000
Date: Thu, 07 May 2026 20:25:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb:
 usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
Message-ID: <202605072021.YuFnYDdA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre MINETTE <contact@alex-min.fr>
CC: 0day robot <lkp@intel.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-MINETTE-via-B4-Relay/dt-bindings-arm-qcom-Add-Samsung-Galaxy-S4/20260503-092020
head:   5eea8ec897bc79e313f44f6f0d08c7f613989dbd
commit: 130405e7d7f70a6895bebbf783030b687e1fc138 ARM: dts: qcom: apq8064: Fix USB controller clocks
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2052-20260503 (https://download.01.org/0day-ci/archive/20260507/202605072021.YuFnYDdA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072021.YuFnYDdA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605072021.YuFnYDdA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
