Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E31E9B01
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138376; cv=none; b=n5Fmbvyn92E6p97a0sJ6iHo5QxFQvdIlFS6AwhtVKrd7AMjRMUtq04hRRPA9WZZpCnp95RIP/ELpO/VG6/hRtSsVz36cMcSrQw+XZLzupS9kalnauYZWLMjOy409beHabX0HNJbloQtsIc+W6op9gPvIIaeVcNNWEIoGgFR9e9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138376; c=relaxed/simple;
	bh=Aww+tBvJ0EGfk4VJqFhdZyk2SG9MVYa3V/wfcDbeGfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFzhvWqXaNPL7LB2y2oGJD3nVofBv1QQgDjdqwztGGaGJVTWY1c+zLV23pOxO7F+2gV/p+838pAVFpqwpdEuG6G4jlESs+IL0jLCOSudcOfA9hnYgHH7xCoLsRbhOK1FM+iTSXEaFKMx4wHbMQWLtVd2MqcbglZplOHcqbRIxOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLspDEMW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLspDEMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740138374; x=1771674374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aww+tBvJ0EGfk4VJqFhdZyk2SG9MVYa3V/wfcDbeGfU=;
  b=eLspDEMWlkjBZiRW36uEs9tL4boKjqaQ+xR7/ZYiyr0qEWwxkOoGResd
   QRSL0qUXETSo8RS4t0ZuqgKvxwJIr4zpAsZCaSnHC4zh8PnRT//eBbuvf
   Mpgz8s24k5xfccCMv1Qicuu4TqZ9rWN74LHhFezvl1EmV0sMGdbUgHOgC
   i9XD32uTDMyFY6qZrolxFl+VYUZIOBUkqHOKOSW0yqjuh7rlHBQPp3iYe
   nVbhj+sl2gieyuRDGRTZm+lXPVzww6pliCn109B8rWEu/sbfv6Ig5zv9J
   n1RELybCTqlXgkM5nERYDe6fYGGZ1TO05XGoHIXyuEKkgQuNvyQQ7DwqO
   A==;
X-CSE-ConnectionGUID: r7M6+TVeRty5MRPb1qR2OA==
X-CSE-MsgGUID: MdA8bdsCQIqdtkPr8fruqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51172118"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51172118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:46:14 -0800
X-CSE-ConnectionGUID: igiO/DqvRVO2lFjOMT1SFA==
X-CSE-MsgGUID: RyhiO3yqQjujc2uqUHtwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115177814"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2025 03:46:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRTu-0005Sd-1W;
	Fri, 21 Feb 2025 11:46:10 +0000
Date: Fri, 21 Feb 2025 19:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1038/1079]
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: typec-mux@8:
 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply',
 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502211917.kxEc1C8i-lkp@intel.com>
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
commit: 5f579ad8c6e11a48c6687514e6caa889d8a69b3c [1038/1079] arm64: dts: qcom: x1e80100-slim7x: Enable external DP support
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250221/202502211917.kxEc1C8i-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211917.kxEc1C8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502211917.kxEc1C8i-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4191.11-4201.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1bfc000: resets: [[56, 37], [56, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlmx-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
