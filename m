Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045741F1307
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 23:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092818; cv=none; b=ih8ItUq5AIScDNuw/14FZDN0kfInwR9hM90lYoXV3YJbML/uH0bNZZTqJLcK01n/3sZzjdHEfdBcgtdIyF4+T9R3AeRcaCR2F4InXw/NfyZHMQHeZy+hhet0DptX/KN+jjGLGo2yTlRLXtS9TMWO9dR6ZN4+h1C5XUx+z2Yc9lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092818; c=relaxed/simple;
	bh=ppcFyhLTY1fIVDy79bPGt2p2lwEJffZb4Bcy3y0z5VY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMwYnJeeLRnbZQU4UBpavZHM8wZt5gcSVG3L7P9+C3T9A5AqkwLb8tBP6f/dY5gWjuHeMqtMJZh77opkfvM/zBTFA+QbBTQ/lMexrzLAMBg2wb/K7bK7XjsYGA+CQDPgZxpjLprscPqHASDpjxgc+PRjsXj5HYjAumdLnMQPq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLSIl/RD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLSIl/RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740092817; x=1771628817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ppcFyhLTY1fIVDy79bPGt2p2lwEJffZb4Bcy3y0z5VY=;
  b=lLSIl/RDGMr2jS034KsZqq6uela5AQJWfS1Won7A7eYqe3kkU4yrPsXY
   doydi+jOb3p8Vyjul3006iHWLX6lmOWw6JTvobah20pb1Eb0yiph2K0xQ
   +P57FYaw5byywnHW1+jy5ezuesrvX/My9ftzfjnDdqmQIHIrjR7aUbKjI
   +fTq5rRca4xYR8HC+4kGRUgoyrK/3AO4tzuBl+hGqet6VZrnke2Co7495
   WpifEyRf8s6JtX/sVrrDpu++LnYJgcWQd1wgXFVc86O8SSQ3g/ZNuoyro
   QP0sfb5SUYRWd23RTuXTaktFqUZ7B+AG54PWGmsr7Wl6W2QGvLS0oC8q9
   A==;
X-CSE-ConnectionGUID: DCamu3c6To2Cu5ua3vdOng==
X-CSE-MsgGUID: 33KIcLw/TZaEBee5zOFHqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40764882"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40764882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 15:06:56 -0800
X-CSE-ConnectionGUID: eV5Hq1WyTaSYtRXSC2mSpg==
X-CSE-MsgGUID: EySdDSXJREKzCRUOFbrV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115131949"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2025 15:06:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlFd6-0004qh-30;
	Thu, 20 Feb 2025 23:06:52 +0000
Date: Fri, 21 Feb 2025 07:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1028/1079]
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000:
 usb-1-ss0-sbu-state: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502210724.bsO9XbFN-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>

tree:   https://github.com/krzk/linux track/x1e80100-t14s
head:   0a5b996575143038f96d880868109359ede28367
commit: e234d19fb6bbccf219985a5ce826afa2b6b63e2e [1028/1079] arm64: dts: qcom: x1e80100-qcp: Add Onsemi FSUSB42UMX USB mux nodes
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250221/202502210724.bsO9XbFN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210724.bsO9XbFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502210724.bsO9XbFN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1bfc000: resets: [[56, 37], [56, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: usb-1-ss0-sbu-state: 'oneOf' conditional failed, one must be fixed:
   	'function' is a required property
   	Unevaluated properties are not allowed ('mode-hog', 'oe-n-pins', 'sel-pins' were unexpected)
   	'pins' is a required property
   	'mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: usb-1-ss1-sbu-state: 'oneOf' conditional failed, one must be fixed:
   	'function' is a required property
   	Unevaluated properties are not allowed ('mode-hog', 'oe-n-pins', 'sel-pins' were unexpected)
   	'pins' is a required property
   	'mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: usb-1-ss2-sbu-state: 'oneOf' conditional failed, one must be fixed:
   	'function' is a required property
   	Unevaluated properties are not allowed ('mode-hog', 'oe-n-pins', 'sel-pins' were unexpected)
   	'pins' is a required property
   	'mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'pins' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'pins' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'pins' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb-1-ss0-sbu-mux: compatible:0: 'on,fsusb42' is not one of ['nxp,cbdtu02043', 'onnn,fsusb43l10x', 'pericom,pi3usb102', 'ti,tmuxhs4212']
   	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /usb-1-ss0-sbu-mux: failed to match any schema with compatible: ['on,fsusb42', 'gpio-sbu-mux']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb-1-ss1-sbu-mux: compatible:0: 'on,fsusb42' is not one of ['nxp,cbdtu02043', 'onnn,fsusb43l10x', 'pericom,pi3usb102', 'ti,tmuxhs4212']
   	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /usb-1-ss1-sbu-mux: failed to match any schema with compatible: ['on,fsusb42', 'gpio-sbu-mux']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb-1-ss2-sbu-mux: compatible:0: 'on,fsusb42' is not one of ['nxp,cbdtu02043', 'onnn,fsusb43l10x', 'pericom,pi3usb102', 'ti,tmuxhs4212']
   	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /usb-1-ss2-sbu-mux: failed to match any schema with compatible: ['on,fsusb42', 'gpio-sbu-mux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
