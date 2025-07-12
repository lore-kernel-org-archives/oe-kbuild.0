Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCCC132122
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752321219; cv=none; b=ZW4rFAlwUPPZ3EymcjSTZGpTgsACU4hyxfReh5o35QXJLMitPPyDbM3vHj7+SsdlhMyBqH/Aqvd+IP92qPj0ifcY9S9hVPe3wQbhjpaa49H6EWKgbOgSB8eAuYC/twO7Z27dQa5u6XwH4503WErtzQXYyCsp3DDb+yBZXxabRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752321219; c=relaxed/simple;
	bh=v87ah6e1OlI8ysZ5PMKtqyoUVUOTgjcS8x2IANQPV4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVLhL9Ixd+ZM9atCX0MO3BfC/yOEvmHh4HQn2MCc6pUcz1f1EG17+ekbr4JTK+t+42M0Xb5lKq1EUWY5XBwvdIgy+T1rdz9N9EjSJ0Mz7Qxs0q8Hq8Jool7OXZHZOnwEeQrwzKjTzBeXdpaEB9UbHQ12bLaZZaTTvEo7sekEA5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUNkibK+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUNkibK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752321216; x=1783857216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v87ah6e1OlI8ysZ5PMKtqyoUVUOTgjcS8x2IANQPV4Q=;
  b=BUNkibK+MnKEGfMPhj1VyZn7Q/P21xsgCQVjNJtnyINkTUTEZCET6Ztr
   VZvRF8S4Uv+CjTV+AVKrw+EKcIAv+B5XEIgz/YY6uEUfouzQO4X61BgqK
   /z9fzEEEAsEF8+kljiNGgd2OCLJM6mpVSvfJihICixEoBE1+0LQTeETQ+
   maTxJLeYMw41NUKqauhqhI5M0VAGVjlcf+9/RLqIcy31x+X3z8ku1xG/L
   /WzL9qAnAae+PR/uOjary9VVKNl2OYimWzIO2NASfCLbIoXn2AXy5Kda2
   eORJGFT7/mQ3bM3lqPwDaluUfleSs1vWhlcMoasFwF/j2GpeOi1Zsj2se
   Q==;
X-CSE-ConnectionGUID: m2PSWFTKRUOhbtNI5EWitg==
X-CSE-MsgGUID: j4g8wYVtQrukQ2ngSN8d3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65944976"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65944976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 04:53:36 -0700
X-CSE-ConnectionGUID: VEt+FZSOQSqSo/o3wBPmlQ==
X-CSE-MsgGUID: Pr4JolIvQ7SaxtRlxRCcHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="180240420"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2025 04:53:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaYnM-0007Ix-1f;
	Sat, 12 Jul 2025 11:53:32 +0000
Date: Sat, 12 Jul 2025 19:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-6.16.0-rc5 61/77]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000 (qcom,sc8280xp-dwc3):
 #address-cells: 1 was expected
Message-ID: <202507121906.4tTLOSk9-lkp@intel.com>
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

tree:   https://github.com/steev/linux lenovo-x13s-6.16.0-rc5
head:   8a7f181d5501fa73b17dcb76340908f033b61b88
commit: c865b35daf2c911171c9b3d019f383c53eb6c74b [61/77] arm64: dts: qcom: sc8280x: Flatten the USB nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121906.4tTLOSk9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121906.4tTLOSk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507121906.4tTLOSk9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4240.12-4244.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: usb@a800000 (qcom,sc8280xp-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
