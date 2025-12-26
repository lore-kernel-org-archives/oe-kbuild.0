Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E031961F
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766747189; cv=none; b=imOqxS7iggecC2qT12kPrX/izWLgFrHmphWy/kS8Q6ryd10vpltHja0VjM3x6qW7sYHC8lMFVXk2dx/QatGbbAD+JIeh7eUOE2uQN4rP2GKDtWOeE1IdfqLPN5AZABFZLlhCeVVbR8ONxQSo8rdL78IpAKAFcTcG8EWn+fLrXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766747189; c=relaxed/simple;
	bh=xYjuJSTmqVWzE0N4zUQUbWAfSb8GTDMeIPfDCORx5PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKd2T+ZJ709I2OBg0CsbovxZgmPFj0J6ENTomSZwP/nEGCPWze4D1/JmikKq7CVWVjsr/g7bgk3KKNGnZLF5DGFQKtj5E7L4Eks05vWY6DHZwANmMUTbImVp8TBF5D4gkgS4SeV1LynhMb3yLPlFjj6iB1bgiTEUEO5LflVaNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEFG/VrV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEFG/VrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766747186; x=1798283186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYjuJSTmqVWzE0N4zUQUbWAfSb8GTDMeIPfDCORx5PQ=;
  b=eEFG/VrVrAsnsn8Row4b+AQEdyAfppYyPZjBmZtBwYW7qPajesDlu3KK
   ht0a5A9NKajG/b45m1UL+W2i1jbS+3qOdaWERxZTjVjR17xoOeVRTgK7D
   93PVgL6I6AqfEUAuhUpZFoccDmsXZO2uRhhSAJy4P3u9k3xgCo8AQ/K+R
   cJnwc5kksDIUkFt9bPSxs2KxPkiD/fF/xuUzBx8W8UdRCxt0Gn21Xt0QJ
   zoWKJ5XLVJCCklynkLjmiWJPiROt7sWx+SzqKrLlx/KKHD8qK+2EGVKwM
   b2Lr3qp0X9OzFK+c7nVgyKdUJ+RlMamo/vFgNQ/OiA3PR1WtlegduDpce
   w==;
X-CSE-ConnectionGUID: AWdCceElRPqxXwo4QqOMMw==
X-CSE-MsgGUID: i4TikI6cTla4M9F+wMIFkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68391050"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68391050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 03:06:24 -0800
X-CSE-ConnectionGUID: MWlXNG4/SG6VYsRw4QhBSw==
X-CSE-MsgGUID: ah7oWf0jReqYsOZ0EctsYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="204870114"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Dec 2025 03:06:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ5eG-000000006rM-4B9c;
	Fri, 26 Dec 2025 11:06:20 +0000
Date: Fri, 26 Dec 2025 12:05:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 34/128]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: framebuffer@0
 (apple,simple-framebuffer): 'post-init-providers' does not match any of the
 regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
Message-ID: <202512261203.O1tywTbw-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: fd5824cbae098cce539b4d98941efcf4243a9482 [34/128] arm64: apple: t8103: Add display controller related device tree nodes
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251226/202512261203.O1tywTbw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261203.O1tywTbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512261203.O1tywTbw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
--
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any schema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any schema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
--
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
--
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any schema with compatible: ['apple,j457-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any schema with compatible: ['apple,j457-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
