Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED67C16C850
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749402450; cv=none; b=A2Z6kY4VZnVAm4LbK309BVCl1iQGAZrAeYcOPH4aIX76rNcO6oeNlx0aUSy4u/hc8rrGR8Ds0W/tereleIwCb9bd8I6OLg6Fgv1XUw/loq5izB2OWuZEkcD2FPwnjvPM6g1Dv8Fsz6dRlXGbXfE3sYdoq2s+rlx2HmD5bA39KhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749402450; c=relaxed/simple;
	bh=sLC48SeqFYkVRYXB4/2ue9m6cf6U1d+tyhISvO7h0GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQDu3szmW2C9NMC3garConPwhdH9InI3uSj6GjkFLKckyxSd5zr9FekGhNJklFnXlueQ4LDExWbSibtbCisLJ+Hq0Rkrp20uTVD6yNXMeimOPdJABnM9C0X8VXLgLEisGzaNv/NFjY6ceNqOy+CbhIyOO/o3YPqljj/pmm442Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YocQM5Zp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YocQM5Zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749402448; x=1780938448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLC48SeqFYkVRYXB4/2ue9m6cf6U1d+tyhISvO7h0GY=;
  b=YocQM5ZpVVgJsuKq6xZ5iq9M3nFzT/1MfakPwGmw+Q+lIrSLoFhgh0rE
   C+GHIbquTxaTiANT+wfCrikJj5855aGYpIReU18eYDipxk7WkVOf8E5hE
   uLhf0i2tdxGRwVO/S8go6N1UR9Q/+VJZ1xf+k1cQXOKIjzT1LpWmO0bzh
   x8l/JAWfzEQmrIskNNszP+J/ZMJrOsDCvZGHuMIAfmigWRf6zkDcBzEZx
   INcoAPGg3V0iRZHs4Qb5q01BIT3OiwOPem5SQZDfCZwb7tsEABK4kdySI
   Pq+qo7ifraAMnu3YUbSBXHRzXv+SrhX5wiVHZ8zm1FvjBDdeEsqJuhiV1
   Q==;
X-CSE-ConnectionGUID: 1f17VgfaRJGcsq9z0+WXsg==
X-CSE-MsgGUID: FUMCfpWRRKyZReGDj08Hvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="39117963"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="39117963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 10:07:27 -0700
X-CSE-ConnectionGUID: UTc5PyMzRgWx+EkKrJCqcQ==
X-CSE-MsgGUID: hgyzXwKZSzmI2SyhgoTaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146653209"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2025 10:07:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOJUS-0006U7-0y;
	Sun, 08 Jun 2025 17:07:24 +0000
Date: Mon, 9 Jun 2025 01:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: phy: Convert ti,keystone-usbphy to DT schema
Message-ID: <202506090046.r16mryyj-lkp@intel.com>
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
In-Reply-To: <20250607212641.744683-1-robh@kernel.org>
References: <20250607212641.744683-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-phy-Convert-ti-keystone-usbphy-to-DT-schema/20250608-053412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250607212641.744683-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: phy: Convert ti,keystone-usbphy to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-053-20250608 (https://download.01.org/0day-ci/archive/20250609/202506090046.r16mryyj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090046.r16mryyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506090046.r16mryyj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/clocks/clkxge@23500c8: failed to match any schema with compatible: ['ti,keystone,psc-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: usb@2680000 (ti,keystone-dwc3): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: wdt@22f0080 (ti,keystone-wdt): $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/timer@22f0000: failed to match any schema with compatible: ['ti,keystone-timer']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/clkuart3@2350000: failed to match any schema with compatible: ['ti,keystone,psc-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: usb@2680000 (ti,keystone-dwc3): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: wdt@22f0080 (ti,keystone-wdt): $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/timer@22f0000: failed to match any schema with compatible: ['ti,keystone-timer']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/clocks/clkxge@23500c8: failed to match any schema with compatible: ['ti,keystone,psc-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb@2680000 (ti,keystone-dwc3): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: wdt@22f0080 (ti,keystone-wdt): $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/timer@22f0000: failed to match any schema with compatible: ['ti,keystone-timer']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
