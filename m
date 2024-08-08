Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA8126F1E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723121191; cv=none; b=l1S++qrfyKQVXW36IzAfOqNLoeiT46ZstLpMLbbdaRuRpwNE8TOzhCU1+gemhFcqUd+8DvcKLrP5vEattAGTqdwo96MpMZ3eZ+fEpaSYfc1REsw1zE5co4ST0HG3diQaLPSalnSpt31ipDYa7MfKkotWhW47h5/tMF0qd240h6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723121191; c=relaxed/simple;
	bh=rlDz0Pkw9aBM95Fgco7O+MPUoRtuORTaB9H06Kj+4/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q9a9TapK3UuedvdoCGELE3h5OBqwFeUf+e/DD+TAIaLVVWqObDP0pe2tIDh4avuGd6/8nu2PMgFP3jPuvscxJBioofcSoufnL2j0Wa+Ed72JTiCQbSgj7Tk8hF5of9MCD3JukY//cYXnphbwYSSrzDK4mfaDX817V/yzA88+n80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/51v+/s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/51v+/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723121190; x=1754657190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlDz0Pkw9aBM95Fgco7O+MPUoRtuORTaB9H06Kj+4/g=;
  b=T/51v+/shqNzcfjoQEEm5WAfvaGDfI7VsW2qk9ZaHZU642WWf7mur9+d
   Pox4dHgzDrqaEcEPkWR4AMOxh9IP4rrnea1kPwuk9lgkot6D7FDgMGiqi
   z3160IcbBAjdKc+7syeindpvAAqSyDpiXuYAfy+WDuGDCsL7u/SkiHCbA
   V1yS0nEY45OJ7nhxubGUvhgQpxPnY6uXu/Q0Nq7auDo7jbLxaE5SfhKSI
   4OMOj9IFGevgwZ3CnrzsWkjbZoCeJ2D+gYDqj5w/ozDagp366C8CmbIkE
   HeP/etNja/lehJK+BBopB4eBdhdgdBhdp5BLF/5fs3qhHcHCpTn1fX6tK
   w==;
X-CSE-ConnectionGUID: qZH/pkK7SaSGq2aNL7OvNQ==
X-CSE-MsgGUID: Qfx1hMuvRYadIESIhsHRKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21403285"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21403285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:46:28 -0700
X-CSE-ConnectionGUID: f7P+WZdgR5Wn4RpTV0xdfQ==
X-CSE-MsgGUID: 3m/T6/s9S0yGQcnKAUlrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62057882"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 05:46:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc2X9-0006B8-2P;
	Thu, 08 Aug 2024 12:46:23 +0000
Date: Thu, 8 Aug 2024 20:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29928/30000]
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000:
 usb-1-ss0-sbu-state: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408082035.OXhzFt2l-lkp@intel.com>
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

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 84d713bb15ba4c6e4438b713cd9b444cac8c7968 [29928/30000] arm64: dts: qcom: x1e80100-crd: Add Onsemi FSUSB42UMX USB mux nodes
:::::: branch date: 28 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240808/202408082035.OXhzFt2l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082035.OXhzFt2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408082035.OXhzFt2l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
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
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'pins' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mode-hog: 'pins' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb-1-ss0-sbu-mux: compatible:0: 'on,fsusb42' is not one of ['nxp,cbdtu02043', 'onnn,fsusb43l10x', 'pericom,pi3usb102']
   	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /usb-1-ss0-sbu-mux: failed to match any schema with compatible: ['on,fsusb42', 'gpio-sbu-mux']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb-1-ss1-sbu-mux: compatible:0: 'on,fsusb42' is not one of ['nxp,cbdtu02043', 'onnn,fsusb43l10x', 'pericom,pi3usb102']
   	from schema $id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /usb-1-ss1-sbu-mux: failed to match any schema with compatible: ['on,fsusb42', 'gpio-sbu-mux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
