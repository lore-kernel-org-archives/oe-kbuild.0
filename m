Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64F1156F57
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jan 2025 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738020668; cv=none; b=fqwhMHFqiLq3Nbau/y9+Usyw3JVQYM105lMYZhUnPM9nkW0stMzBO0d76FRZN19QT2fFh9qjo6ryp/WEE+fJSovwjSPmtL2FeOyy7EtTF81Zm07/5bQ4KcuHIbHjQ/0Wo2/ANcEiKvoMaZt2Ki2Z8tUDwa0tVSWraSW6THIHabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738020668; c=relaxed/simple;
	bh=c4ZWxz4dcBRVw8FrHRP4FyhxWu5rbCCMUbX12tUihM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIIOBDO3kM6yhIB1zjKXF2BFFaoO4okFPPI1GapP1DCrFh0vs2Gmep67U2C1ZBrAQaF3X8mAmbG0ONsR2lAGB0e31uP4dYYcI+bpp9TdL+1lOKHWCiI6S+Pmz6s7Qw86k5wlZzAaQsams8rMYd1n9Oy6T6jYznTX5jmFk/uidZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QplwReop; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QplwReop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738020667; x=1769556667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4ZWxz4dcBRVw8FrHRP4FyhxWu5rbCCMUbX12tUihM4=;
  b=QplwReopILckwUNVIu6AF9JyvI3glXv7Nrz9aPcSi9iKPw6t5H0lImWj
   QlwIi5dI81C1OGNo4rlfKnW9T+R3Hpfniu5ZI1I6eJJI/nL7qaD+rI7vm
   WhOZNErqNxU/7Lu7tMzVvZa/UAmwI6r3O9hSyBiXoqZ3SfpTlSdgJT8r/
   5iUMW1Va98YbPHu/HEFF3lNabX1Hviq821LPjvt9qtrHGc5z4ZyMslk8b
   BXHEIq3BxtIccxxlAkTE2/vX0bRtve9g9IXwsrHv17KDSIKs4hUkBEswL
   KLtcaBjhglQUcLNFTNKDzOAw+qJdVTFvJPoQyg3z4d9T2ttBgkk23P870
   g==;
X-CSE-ConnectionGUID: DFQM35HKRsaOlHWbJ9FU/w==
X-CSE-MsgGUID: uKZ0UxJfQqe4c1bVTt2lxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42429776"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="42429776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 15:31:06 -0800
X-CSE-ConnectionGUID: 9OheXA1sQy6ifnFD+ZUxlQ==
X-CSE-MsgGUID: qGghJB4XSH2wMmIltNBe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="108369293"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2025 15:31:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcYZH-000hFr-15;
	Mon, 27 Jan 2025 23:30:59 +0000
Date: Tue, 28 Jan 2025 07:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-6.13.y 78/83]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: #address-cells: 1 was
 expected
Message-ID: <202501280747.8Z8fWY4a-lkp@intel.com>
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
TO: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: 3eca991e849cb286a52c0e200064915e629c1c2b [78/83] arm64: dts: qcom: sc8280x: Flatten the USB nodes
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-052-20250127 (https://download.01.org/0day-ci/archive/20250128/202501280747.8Z8fWY4a-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280747.8Z8fWY4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501280747.8Z8fWY4a-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: Unevaluated properties are not allowed ('max-speed', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('fixed-link', 'max-speed', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4139.12-4143.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
