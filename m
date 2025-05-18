Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736251B532F
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747578669; cv=none; b=jVGozxuZE6SzXGrkqXubabS3AxZNdu7/26lMOXtEkx6us/SRKWWD6EBsg4vUrDWmDspvwYzo+C96x6xQoqvWIlmIjifTtjoEyuQq3hefxY+z/QjVO3htpe6ihGhmnot1dsbtJRCqsiYXhWotNvEMnQXRJe9d7SFveZmMRd03iT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747578669; c=relaxed/simple;
	bh=v/WNlhezxY+h7RNWq8xeM/9bTE5/M9a4OIMCMb2GcXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zy2gRjG1bh3BcMyB3HxxaBug5kwksBmLyF38KtwVP7pLKxiloZGVcHTOUQ9fisAtdX3WqxZo0ZhLN54F27TtpHTSjlC7eMYVbQ8KluaJljtt17Dg0RkliZhJiI6vMKaa5MIrHp1F1pXFprdj9jlPhrD+PFjotA3M1S7D32stGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5pyIOx7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5pyIOx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747578668; x=1779114668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v/WNlhezxY+h7RNWq8xeM/9bTE5/M9a4OIMCMb2GcXw=;
  b=l5pyIOx7j+leZewB783mnqEj5M03cY7+00qidz0XJGnNA9kz81TSYmlP
   l0VPqp1XONZb/FVZFWI/g2rSrhgR3CifED9rDgK1JuPoF856v7FjqqTdE
   Z1bJo0terh1V0xE3H9bSpkS0Iglpt6rxIN6NKdb8Ca5oYYb6lpy8ugze3
   wEFHzj0qHpAX2VEBEEw7rMmLgYvY29wa5GkHhHvNAeAuNdm8b86OXP5id
   MGD2nOky+uUmF7X2tkdjk67AR/Dq6CB3+T4KAB1I3x2R5YQFZdr+IAXFw
   j2RzG8Kp/NqL6wm4ZgdDcpfakT92E1zPGHRN+JhxZce/NJC6bevXnydrf
   w==;
X-CSE-ConnectionGUID: L/rbkD6NTSe++89UcXtpgA==
X-CSE-MsgGUID: 82qv0GQuSnOCxmAfcZCDdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49385530"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49385530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 07:31:07 -0700
X-CSE-ConnectionGUID: crWxhwX5QjSdXeDcutCimg==
X-CSE-MsgGUID: v3JWhjZpQoG1ImS9dmPPrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="138881473"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2025 07:31:06 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGf2d-0000hj-2c;
	Sun, 18 May 2025 14:31:03 +0000
Date: Sun, 18 May 2025 22:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 582/4329] arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /axi/pcie@1000100000: failed to match any schema with compatible:
 ['brcm,bcm2712-pcie']
Message-ID: <202505182217.ZajM22Ar-lkp@intel.com>
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
TO: Stanimir Varbanov <svarbanov@suse.de>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: 6e313687a8885d654b12e5978fc3ef6f1e1e1a5f [582/4329] arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250518/202505182217.ZajM22Ar-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182217.ZajM22Ar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505182217.ZajM22Ar-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/mop@7c500000: failed to match any schema with compatible: ['brcm,bcm2712-mop']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/moplet@7c501000: failed to match any schema with compatible: ['brcm,bcm2712-moplet']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/hdmi@7c701400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi0']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/hdmi@7c706400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi1']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/gpu: failed to match any schema with compatible: ['brcm,bcm2712-vc6']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000100000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000110000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000120000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/msi-controller@1000130000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/msi-controller@1000131000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /hvs@107c580000: failed to match any schema with compatible: ['brcm,bcm2712-hvs']
--
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/mop@7c500000: failed to match any schema with compatible: ['brcm,bcm2712-mop']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/moplet@7c501000: failed to match any schema with compatible: ['brcm,bcm2712-moplet']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/hdmi@7c701400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi0']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/hdmi@7c706400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi1']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/gpu: failed to match any schema with compatible: ['brcm,bcm2712-vc6']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000100000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000110000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000120000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/msi-controller@1000130000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/msi-controller@1000131000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /hvs@107c580000: failed to match any schema with compatible: ['brcm,bcm2712-hvs']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
