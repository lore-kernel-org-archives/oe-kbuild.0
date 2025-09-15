Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8EE2747B
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Sep 2025 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757968104; cv=none; b=TZUJStJcxIVA5udo8FCUqmsdvx1Ku+6xb4mV4WiTcXNkhx8oorZGvM9heAfAf1KbgbCPrSF5wK59sA298mO6x83kKYh08Vh672WL9xWW6JvcPkpTraxtpsMOr8ygk5xxRR4Pz2WqATmN+flABTl2da3O/LpGVXx4x/VQ/mcWxw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757968104; c=relaxed/simple;
	bh=VqpOZ+fet8hqp1lGg0YAlB8CjpyMUHxtWV/Jj7BSj7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jC1qZOP0UJxPfvKxy/jFoj8oxwSEUCeJHcSlkn1SXADqNOgYWscd/r3AjHoaK7PR9gZKnmfnRk/HEmbeYfiU9Ee8SG7EYf6Vx9RsJVk0o36Fm7+D3qS7288F/I6RKquKrkEe6+QXi2JwLIU6pA+OkGfHsaDtt78PiI0VZm0VrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdQk2xvT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdQk2xvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757968103; x=1789504103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VqpOZ+fet8hqp1lGg0YAlB8CjpyMUHxtWV/Jj7BSj7c=;
  b=LdQk2xvTGKtlC3X2KM/EEdKr24MWyWGhu0VhBGpP7KT1nyPzWnXZhpgF
   8vNSV4MsARB5j1NE/XR7zw0CmDtTmUP+6iK2eVZdr2jZNw/d9hXzBbIc2
   qa9iyTFtP+dAIpuLZuY1576/aInfW/gfBydscImbcjh4J1wwCdk6XC+kG
   r7UpDF5Gy3/U5XQktiHGZaUqKf7pazelmauEF5FHQ+cbjQen97udUYzcG
   q34G+Q2SBIKZmW1v0e9D59bFoLMwvAQBdEIWUTkwAjcd8OrNGlCJ9BNLl
   MpzE3GbvAyYeAhf6jgVIzc1XQT7+4HGHM/9bHqrIYxSRIpi2g9Jvi3UTm
   A==;
X-CSE-ConnectionGUID: 12j8/+ifSQGVijB2Z8kXjg==
X-CSE-MsgGUID: F0BQBGXARWWVjxoydEKMyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70918273"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="70918273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 13:28:21 -0700
X-CSE-ConnectionGUID: NZ2x2R17TuCzcKbHItyGYQ==
X-CSE-MsgGUID: 9jFEksfJRQeHZB0CZNwehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="174681261"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2025 13:28:21 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyFoA-0000fx-2I;
	Mon, 15 Sep 2025 20:28:18 +0000
Date: Tue, 16 Sep 2025 04:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/dt64 151/208]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: phy@88e8000
 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509160425.ARLA0hWq-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/dt64
head:   be6f43c64ca0f7929904f31c2a034c81093eb5c0
commit: 99d741245e7a6d8b533511f96fc110a7d89aee1b [151/208] arm64: dts: qcom: sm8550: allow mode-switch events to reach the QMP Combo PHY
:::::: branch date: 6 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-054-20250912 (https://download.01.org/0day-ci/archive/20250916/202509160425.ARLA0hWq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160425.ARLA0hWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509160425.ARLA0hWq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3923.27-3978.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4092.22-4182.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3828.27-3902.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3923.27-3978.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4092.22-4182.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3923.27-3978.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4092.22-4182.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3923.27-3978.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4092.22-4182.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3828.27-3902.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3923.27-3978.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4092.22-4182.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3828.27-3902.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3923.27-3978.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4092.22-4182.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
