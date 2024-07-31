Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE11AD3FD
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432766; cv=none; b=cOWhASZ+xrMkLbv/QjO7jUW4WBPbNtD771tbuBQFFkbIyZTZjWOsUtRAwAaQWR/3hgrauWh6ZvNQ0VJE0kYoZImRi+njEiZvx0kJYifsa5aDT7eouNBwu+lWQaqt7Kj+fuXv9BhBM17fSVr83A0d1D4g2sbuFPmdBYLLJfBPl54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432766; c=relaxed/simple;
	bh=74FUjQaDkjBOt8toEHTQ+1S+Ro/Sqp/WZOE4AquTAkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6UxgW5oY22Or+ZRPoX87APA4PW3XHyjuDMaWJYI6e0pITbtdnauijx780JX5aJNj0tKe5lBSQ/govc+5gSMsv8kBi9iIc9zHc9VqJ2XH94YXs5jMqZYO5TKY7OPKBSIPHCjLKdM4dJekKZbUg+sgK5e8EtTqnE/b1BQvEOgsaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGvck2iY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGvck2iY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722432762; x=1753968762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=74FUjQaDkjBOt8toEHTQ+1S+Ro/Sqp/WZOE4AquTAkg=;
  b=CGvck2iY+B/Cr79Fb+o31vABimZuld8cTiDtRCjLm89iOk+6mJfmJkS0
   MJ8XWKQnSUq/rvG3koHy3mULOO5C37R06mjIVGtLhNbdkXurbxiOvAQAE
   FW3N4ACLafHvim33SBzqcmcPHbffBi5d7rvRPpqft/BYpc38vA3NCWL7a
   ENUUrLaubiwX1BqtOdmqLU9mL2T64GDy2G71/wkGPidYHM8uPyiHK8nPA
   u36Jw/39cj03QpflbwXEKn5hoTPNwJfJJgrRxCgQAAH2/XM6YyU8iF8om
   yy9dagY8wFdDYq2PWZvTdv5UgL89Q2rprd+xiE+b2lTWWHc5qNUKm5lFR
   g==;
X-CSE-ConnectionGUID: PfLFVSljQvCbbVwpvOdLJg==
X-CSE-MsgGUID: +45te9NAQmmJkm94fXocxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23228007"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="23228007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 06:32:41 -0700
X-CSE-ConnectionGUID: h14Q5BhITSq6hHPXPawwHg==
X-CSE-MsgGUID: jJMiZoB8R3u4oY++plW/PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54618186"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jul 2024 06:32:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ9RV-000uMi-1R;
	Wed, 31 Jul 2024 13:32:37 +0000
Date: Wed, 31 Jul 2024 21:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 8/12] arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
 cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407312143.sdPK1u6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-usb@vger.kernel.org
TO: "Théo Lebrun" <theo.lebrun@bootlin.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   d483f034f03261c8c8450d106aa243837122b5f0
commit: f7fd939e805672417bbf418f6035dec9400230fd [8/12] dt-bindings: usb: ti,j721e-usb: fix compatible list
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407312143.sdPK1u6u-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312143.sdPK1u6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407312143.sdPK1u6u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: adc: 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: mux-controller: idle-state: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: mux-controller: idle-state: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: mux-controller: idle-state: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: pinctrl@f4000: 'gpmc0-pins-default' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: gpio@600000: 'gpio0-36' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: gpio0-36: $nodename:0: 'gpio0-36' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: adc: 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,gpmc-nand.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
