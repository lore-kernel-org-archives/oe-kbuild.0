Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07141DE2A5
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943593; cv=none; b=tVMmvgHxYmvM3Etickn+mf8lnUE7oUguC/cCpmu/vvRWw1DH0rMXG/4QoyrFuqGlldsQIvppVX1S/Hdn3b7t9S4hTg7H13HS2Glm0qOXp7Pvff4ZzOmBxf7P0BiNwxQkm9oiOf8RgGaO57ZtEW+r5/pgBSMS2o42VpWMyX/Hg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943593; c=relaxed/simple;
	bh=aAho7jlggJUdPkzef5oSxFShk1qSMV7Wv7V2gM2/q3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSLL6nRj1qqpfuce19pBaDp1VSjmcQpE0YSJw6xL95+MXgBCuGKzcx1Bf+sZaylMTe5+XK/NCsO8ircG4kGzcIyZgzFU3hEEiL0L37XDNejV4rmrrZjd2C+LuOJXjzEqUXtcJrdK+pjzdy30FatB3VL7dJTvW8H3654pZdxtzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/fpiDbv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/fpiDbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741943592; x=1773479592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAho7jlggJUdPkzef5oSxFShk1qSMV7Wv7V2gM2/q3w=;
  b=O/fpiDbvMmqiT2ge6TetgPlNPeM0NDkx8BIfbH6moLwVZkR98HTvHWvX
   rGJyIyMCgPnDSF05O8PJo5badPGQRoDhM97FKOfkI3jETBfYnEiIB1PlE
   +YyHs+6NhWyBUAvAFDgUPrGxWcoO/uNbOxbOL940TRBKSWtdyfvueRZ3X
   52mhElvu+pAPPBrtkxEBJ8nmw0fTmuFke890MZo0g6d/qL0/KBsjTcx3S
   I08DepXtHD80Ei1kGSTap5dypZb0sxvoP/+Q2raEs92MnVg3Azf5OR0EU
   HTrSNbdHe1fPDSV8E7LePgzYeSz+iDzu9Ag9RMCD84EdYiSvQm4T+5j00
   Q==;
X-CSE-ConnectionGUID: +4XIBe2uRPeaRqlCBez8pA==
X-CSE-MsgGUID: qaTqeDKvSqOutNsODus/3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43216149"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43216149"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:13:11 -0700
X-CSE-ConnectionGUID: CnjsIZsESDmjvAcV904sUA==
X-CSE-MsgGUID: YqZw3y7XSzKlPQxXu7wEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121709786"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2025 02:13:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt16J-000AHG-1H;
	Fri, 14 Mar 2025 09:13:07 +0000
Date: Fri, 14 Mar 2025 17:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/3] dt-bindings: Add cros-ec-ucsi to cros-ec-typec
 device tree documentation
Message-ID: <202503141610.tpeCgQIn-lkp@intel.com>
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
In-Reply-To: <20250312195951.1579682-2-jthies@google.com>
References: <20250312195951.1579682-2-jthies@google.com>
TO: Jameson Thies <jthies@google.com>
TO: tzungbi@kernel.org
TO: ukaszb@chromium.org
TO: bleung@chromium.org
TO: heikki.krogerus@linux.intel.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: groeck@chromium.org
TO: swboyd@chromium.org
TO: akuchynski@chromium.org
CC: devicetree@vger.kernel.org
CC: chrome-platform@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: Jameson Thies <jthies@google.com>

Hi Jameson,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9fc83373f0ffb8834da48b1446a5c2fef9525bb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Jameson-Thies/dt-bindings-Add-cros-ec-ucsi-to-cros-ec-typec-device-tree-documentation/20250313-040216
base:   9fc83373f0ffb8834da48b1446a5c2fef9525bb1
patch link:    https://lore.kernel.org/r/20250312195951.1579682-2-jthies%40google.com
patch subject: [PATCH v1 1/3] dt-bindings: Add cros-ec-ucsi to cros-ec-typec device tree documentation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250313 (https://download.01.org/0day-ci/archive/20250314/202503141610.tpeCgQIn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141610.tpeCgQIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503141610.tpeCgQIn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: ec@0: typec:compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: typec: compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: ec@0: typec:compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: typec: compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: ec@0: typec:compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: typec: compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: ec@0: typec:compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: typec: compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1084.21-1102.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: ec@0: typec:compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: typec: compatible: ['google,cros-ec-typec'] is too short
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
