Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326261C5F05
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745651565; cv=none; b=DgflkUo06B6iiMtfQKJCbSNpgbJiy1jQ/vRGZjrAVriOH+xNKl7BA+9cWSQ0XsLb6xIuS9UhQca1s4UTbEMaWQhgJTvvaaRn5cSO3fg0VI+wKcdFg7chSbX5nsqNrefb80FVC38v/0BKzhtYh37X+fxwDE5M2xk8bVySLsf94xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745651565; c=relaxed/simple;
	bh=57VY4sclGK9LL5W3I5xMpH/Xm0ufJ/VMFsqTgZwfNbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+xLuZkSxsWLt/6yqaVKqn4oi5do0whSZ3Fbg3V+O7FVQ+opGQx1aAY4uizjzPyW1hiVK11HqYl51lnGCdkfNUjhtiRVHwoCTLo3ZSSebAhajhEbiX9vgW57Z9tSP1ZbSg0XpxegHEYuW/SOBJ8W+QW3GXr31klv03C5hp+N54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsKFEUiF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsKFEUiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745651563; x=1777187563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57VY4sclGK9LL5W3I5xMpH/Xm0ufJ/VMFsqTgZwfNbc=;
  b=dsKFEUiF7O9VcdtrtqOBv6RkMVQmFJZFlKcsl84cuRbdvrEcE+z+06jq
   X76VkN2B8tAxWHU7p82IuY36vVp6w54JqduHjOtLaIiDEqpXxcQa0Bd7h
   inEbN8IbIAhMe/4PngvHpr+7mgchVvI3jtjabCpLbQp6dQSsM12D2XGP8
   02We6RvWRk9O3fS5r2oY81F2i5cfk4nGOcsxPRk9lP0BGLGtk+2c2mcCP
   cOZntcV83hOO2CDE8jEUNIP/QGXdERM6CJeWtVx4BXcr/M5XAQJUGqgiE
   sV9AdrhjuPm4L3LXpb6eoh9zAMFL2CtNF/XA9tyR3Wex5VFpgWzbT8zUD
   A==;
X-CSE-ConnectionGUID: fUBD0qusRx6c+L71O8wy2g==
X-CSE-MsgGUID: YomEDBbKS0ONCNUWsIK4uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47323968"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47323968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 00:12:42 -0700
X-CSE-ConnectionGUID: lSxYJbO5TBmp9IO7Dp5woA==
X-CSE-MsgGUID: tDdi+XNKSL6IsZrh6wP+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="133065928"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2025 00:12:41 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8ZiJ-0005lR-0G;
	Sat, 26 Apr 2025 07:12:39 +0000
Date: Sat, 26 Apr 2025 15:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Message-ID: <202504261559.T0jjOiOp-lkp@intel.com>
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
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-3-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-3-3fd4124cf35a@linaro.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0316f040a04804ff1f45e51ccd42b45552c54a60]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/arm64-dts-qcom-x1e80100-Add-CAMCC-block-definition/20250417-193339
base:   0316f040a04804ff1f45e51ccd42b45552c54a60
patch link:    https://lore.kernel.org/r/20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-3-3fd4124cf35a%40linaro.org
patch subject: [PATCH v7 3/6] arm64: dts: qcom: x1e80100: Add CAMSS block definition
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-052-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261559.T0jjOiOp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261559.T0jjOiOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504261559.T0jjOiOp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
