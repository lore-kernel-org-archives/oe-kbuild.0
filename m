Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB991172BD5
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jan 2025 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964172; cv=none; b=c+hUdEFoP7oGIwbKuHkABFHNxs6uM3phpZg6YtnZtIZ2lpDdfHfujwrnz6WKetqrBl8nM8piXZKHitt09qyFzqPULNLrqkt2JSY7pNK6IzDbDk3kt5+Oyy/SZFVBz9wtqzsw/41A8LYlcr34SGMsM3naKPM57S8p4w4pL0WrxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964172; c=relaxed/simple;
	bh=WBhSmhRPe6t1/2THBB8NkqmVbRisbNI/dlmCPCC+e8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ly034QFmKc+Gp0UJ4TT0e/oCRVWvWfqCosgi0jSJpVA/Q5gBCvbOos+s+FiCmp5m6PsngH/jzVQhz0LqK6xyoedkm3G/TDzEdZbkWbCPrIqRC8NUjGCQlrZq6e9YuuOplgDJ0WoL5C6u+PUEuVtcQFycPDvtlxusgh5fqL4PMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZgqpmYA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZgqpmYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737964171; x=1769500171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBhSmhRPe6t1/2THBB8NkqmVbRisbNI/dlmCPCC+e8Q=;
  b=FZgqpmYAwPlR3xOrzxsNJEx46Yk4uE/gfgXij6bcpBRPgjH4pahTiCip
   kuuXChpReq8zT2y/1VVh9kzIa5GqFFS3LVYucFI1KqTJKhuxOwSOGwsq8
   N0go+ssQSvq5NsgvlFSdzX2v0Mw0UH6RYIvuLEZJr9tuxewNx0wQNhPvS
   aRlXFuPV3lsm5Lt+AZ+WGnzkv1tSkpvP66/mjdtAFOTb6/xAgCnfFh7nR
   AXA6lHwAQ1wGzvN/J3PESMrOvy+xHvEelE6lNbl9kjQs/6PvL5izOorB7
   5SVmXmldId2myU3uS6/rLyWHcaaRZBmuPVe5U45OzNncWD4mXs+HF8rfy
   Q==;
X-CSE-ConnectionGUID: 78cO7KxuQdOmty5jfUcTFQ==
X-CSE-MsgGUID: dmNDja5cQGmnNBEpR8k01w==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42076976"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="42076976"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 23:49:31 -0800
X-CSE-ConnectionGUID: xHqFs2b+SP+a03W75MAbXA==
X-CSE-MsgGUID: DqFUuD0vRo2ASREfXK/Guw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="108951315"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2025 23:49:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcJs7-000gYJ-0A;
	Mon, 27 Jan 2025 07:49:27 +0000
Date: Mon, 27 Jan 2025 15:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-6.13.y 78/83]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000:
 #size-cells: 0 was expected
Message-ID: <202501271510.x9loSbRr-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271510.x9loSbRr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271510.x9loSbRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501271510.x9loSbRr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4139.12-4143.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
