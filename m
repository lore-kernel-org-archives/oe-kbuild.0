Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EEA1862A
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 02:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740279046; cv=none; b=GYEEGJuPROb5gHuR/4c/e799/kbVIRBGKMsd6URdQR6JF82Rb3DD1mrGMoaCbAU9iYMyipweZmNMOciYLQD8HZnUdtOztN4BpmAgvh41dMItU95kzGF7FpkkhjYcqhfCtk7LWX6sDQFChYxxDOVyrQhfPliz1ZrFqPVCE6WTK9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740279046; c=relaxed/simple;
	bh=ZBz+xAro6YnF5hGRMguUM2RLSdOC0d7joXXAY3MPNxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBuhznUISeqC1ghqXuzhPI8I8IQ3PYS+NIJcVoRwMBu8ZUdXeMeER8jT4Skf3esFVrDkDPwWXNFxP0rzASTtwu4+5L+UmnTW0gtjcXNGKPshc0yz3byR60JmJvQ862d09hbmJmi0MUwjzMYMj+cNcimtlWntJAFgnPa2Ik3+HU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GA9sUTce; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GA9sUTce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740279044; x=1771815044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZBz+xAro6YnF5hGRMguUM2RLSdOC0d7joXXAY3MPNxw=;
  b=GA9sUTcepGJSuHGL9mUkc44176YvGRd2npTihKeX7dHK5rpl+Pn9JJ72
   8nIsYF5De0JY/1Ii1HDFj8BjhLUVtTfupsinOAMHy5+1Eygj7VHMWMJma
   hAk1r4SADd9YXUryoPTWu2DzXvU4LFHRC/Cr32DcpBRHczqLG/nghhhVw
   pujyyQNOLNelYpCBa5oUxiv/k2dBHkyAzEQ21AfJmCq+qNf2ro2oQTlgt
   /iNdxaHquEP7tIwDzeKggeGjjvsi3PuOaomgU9I6KpUTZ0TO4AmGZq3R2
   tQ2ST1Tw6uxpVFBYOUA30WCMpsVJpiR4ExQLPmJyjq4ESpdiQFv8OE95y
   g==;
X-CSE-ConnectionGUID: 1EkjeMOIQ6aIcQ+l2ZLs7Q==
X-CSE-MsgGUID: t8WTCbtrQPS3X3dcSohirQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40298006"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40298006"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 18:50:41 -0800
X-CSE-ConnectionGUID: hjtmKFbySL29gTn9FzOBhA==
X-CSE-MsgGUID: 63cnYZ3HSNaMKPkkXCDRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120356654"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2025 18:50:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm24k-000755-1c;
	Sun, 23 Feb 2025 02:50:38 +0000
Date: Sun, 23 Feb 2025 10:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1028/1079]
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000:
 usb-1-ss0-sbu-state: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502231034.Lud9b7ym-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250223/202502231034.Lud9b7ym-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231034.Lud9b7ym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502231034.Lud9b7ym-lkp@intel.com/

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
