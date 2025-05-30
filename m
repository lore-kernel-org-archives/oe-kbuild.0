Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586238B
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748592656; cv=none; b=oCMF3HZq1iwiLl3rMjLDCOuzLldVXSoEmA/OgzsdZ+2fV5QQsac2AR2pGBEHEVbpew8Zs44hbG9TjOcx3WX0VSpcnW6KPxOp0sD7AeOh0vVgzgBWdlUlfA9NI4Ghpmv68PAacwei5ogDERtQZNP1NnouQW1JO7B4E08iJ1qMX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748592656; c=relaxed/simple;
	bh=7QyQ3Mzssla7YLlCLxTr7OWOnuws/oY4D1UA1HALk24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGqHes2WdMWP2uviRR3Ewbocs63qevpCihD1tCTSUpzHXvzrMRWXA83PBKAXn3RW943jSJ0m8FySVT3u6m8JagVGg+svRa1jGYDVSLTVrnXVJXIgoQTcp3VvoYFA2WyfxgbWD/myVGFHxENXhUNKECFggKaXnOgxr9ERBkllhdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYOo/iPi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYOo/iPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748592654; x=1780128654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QyQ3Mzssla7YLlCLxTr7OWOnuws/oY4D1UA1HALk24=;
  b=kYOo/iPiA4LQ2hVKWIt1XcBbnPUAw2Xg1NlJ0ZKAlyjVePlrSXUMkIi3
   yl18wu9PGjMvMxtKjtx+Mtns2hbFZSd5YrHUyoyP1tykewtDnxuEQJsxX
   p2fqO1Cik/XBETNeoOTt9zyJ3rwOkq8V3EyiHKpG+z+/ex1KyD8FFYvr5
   dVAVjkaPiUnjNBmNReMBmElbbdcZRbQfgPw1ycr7MKbedVvJNz6AelRwI
   ZiAgG0uu0gAPuIW8b7FF+IoQ0YMpeHK/ZXUt6tyeWZuJSY/KmkNtMogPX
   YCTj9987Vtr33pVbZHmisEfTcikLQCqf0Yo9OEocywB2DDIh2WfNml+Cc
   w==;
X-CSE-ConnectionGUID: fiLesj+mSdKkCwFcNE4Npg==
X-CSE-MsgGUID: en7Cpd1vSRG9WIZMVpbjRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61343426"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="61343426"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:10:53 -0700
X-CSE-ConnectionGUID: LiIMrzEDTf2M5dOmwBSYIg==
X-CSE-MsgGUID: yAvnXQpeShKjZw3q0kdyaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="144793971"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 01:10:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKupG-000XSe-1W;
	Fri, 30 May 2025 08:10:50 +0000
Date: Fri, 30 May 2025 16:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: display-timings: 'mode0'
 does not match any of the regexes: '^pinctrl-[0-9]+$', '^timing'
Message-ID: <202505301622.xZWtzkG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0797d3b91de75b6c95b4a0e0649ebd4aac1d9d1
commit: ce4f2199a099c1394ad2343c0e3393690d0cd08f dt-bindings: mmc: mmc-spi-slot: Change voltage-ranges to uint32-matrix
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250530/202505301622.xZWtzkG9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301622.xZWtzkG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505301622.xZWtzkG9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/pwm@2a40000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: display-timings: 'mode0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timing'
   	from schema $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ptp_clock@2d10e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: usb@3100000 (snps,dwc3): Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
