Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A528614534C
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720516224; cv=none; b=oiayDTbkg+zA8RQQQgNW/RtYykY+P5jpkAwN8wC12KDpS58id6UJ/3TM++8c4yf8LxFDQ1mREFiWyzxhAZClkGUzdkL4CcD2guS/aAIODTXZJxeda4IXrPLBW4DmqONsdGnWmP7shBRYi1nO5C6ugosoqLRiVnav7ZBuqqv5soY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720516224; c=relaxed/simple;
	bh=s0G9nYmR14ZOnnS5AJBlIiGBDqGu+GJA4gOdZECVgfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxt5Z+zJ2arfDMSzjjmkZcgzxRpcn7t/iNhNVEoOULO6D0xrpHLVNmkCnQITdXa01wmR9Ci8mc6W4JWYHIeBIbckLf78/DtZxJyt5oD93oTetC9USNIuNXEM865dGFCkecs9BXFBqK/qcD/XPOatqbyheDYwzPCyYonyDHwhU5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7jkk5CR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7jkk5CR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720516223; x=1752052223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s0G9nYmR14ZOnnS5AJBlIiGBDqGu+GJA4gOdZECVgfI=;
  b=d7jkk5CR0X17/+jKOyGo0pGUwf2n2JHX21BhxH7Y5cGaWNdH9SFrKQ4z
   QG7uHJnj4nMe4LXCyHTLxkp0qeIlg0eTX4RAl73eKV4fhgOsHFobz1czl
   4Qcjk83X2d6MZ5UYcQMFiKvUrqHpRqYEZV0SdUrzcSbYCpFZoRjjFc4Qx
   R72OWQA9h21Su7DGMT1lWHrt985FWEjo6TXyI6qxIuP8KlfTlGdzfl99Y
   Bvj4iY+iZjT0XGTFkOe0v5DkYBRVc7EUGkQcxxm4cHcVam4NBgopI13/R
   OiyxziLAiQrdG4b+Wpo+JoCac/utWiPv9tiEiDSpcX57leRpFHUbkQnvt
   g==;
X-CSE-ConnectionGUID: zQzw4VSqSxKSQUQOtGhwsQ==
X-CSE-MsgGUID: cxwZbShnSSGpH7JxapMOZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17594500"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17594500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 02:10:22 -0700
X-CSE-ConnectionGUID: 1YMCYkqAQueQWMu0dhKcRQ==
X-CSE-MsgGUID: VEZtrFriTs2cjuLEri4I9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="48221205"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2024 02:10:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR6ra-000WV8-1D;
	Tue, 09 Jul 2024 09:10:18 +0000
Date: Tue, 9 Jul 2024 17:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 11/14]
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: video-codec@4210000:
 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202407091707.2qgIVDBK-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Brandon Brnich <b-brnich@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Prasanth Babu Mantena <p-mantena@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   32fb3aae72f286cd0d023455b5fc9e4c6b9859f5
commit: 281024f57114bab5c5a1ebd8708b921f0ea6cc8d [11/14] arm64: dts: ti: k3-j721s2-main: Add OPP table to the VPU node
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091707.2qgIVDBK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091707.2qgIVDBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091707.2qgIVDBK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/bus@28380000/i2c@42120000/pmic@60: failed to match any schema with compatible: ['ti,lp8733']
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: video-codec@4210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: fixedregulator-dp0-pwr: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1949.34-1958.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@4301c068: 'wkup_gpio_pins_default' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@11c000: 'dp0-pins-default', 'main-i2c4-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: video-codec@4210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@a40000: 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
