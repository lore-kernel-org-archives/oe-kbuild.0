Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06B29A1
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Oct 2025 00:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759277195; cv=none; b=pj8SPZstXeEFtBkeO/0JHZJfEezJqcxwhQw8+ZSfkUZuu0VV8J7zDS17M4hbUqoam2RHWM7Pnp4DGzSwuUaE/8Ch6HtizlrQcNQ0i+T72Q/75VQn24RnGeuiooftRO9itj3N3GoRCarDZse1DjTaKnF9qVZaZID5obSdZ3P+26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759277195; c=relaxed/simple;
	bh=JWgh/ydZrro4+4WpWucJgaa5OOtUuZ2bT6b8uYr7l6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=blDtf9UNSEjYKYTyCtqUr3hlXQRCdac59tvGvXkF9B1Txosfrj6KVSgaVr0VM02rAuDQqOHKzn6Q1FDqTj7kPI1FiH6wZe0S/fqNwkfjGC5evcRCVktRpR2/Wx4CqkazgAPdIhIRnN7bIeC91ekZl771xOKnDd6t03/XscxVBJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etMj0iBJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etMj0iBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759277193; x=1790813193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JWgh/ydZrro4+4WpWucJgaa5OOtUuZ2bT6b8uYr7l6E=;
  b=etMj0iBJSfLkX+Zc/CmMs3g7wNpyeamwQsQ8pB67HK7ywe0Mo2YCKHJP
   izuaT8TcM7jzXTGySQmug+F5X2ylFBSonxkCICc8kFkDJ1RD9IsQofvc6
   wFEWNg7YIIbCPLKvWuynST+JQdJjvrn52xyjC70mrWTDMeLncTrCZcXxj
   c5QNe2YXRakbZrckG1ASUtmbeKS2GuL8Tgh0CWSnT7HwI/U1r4prY6RTg
   0smzvqzlLq1VKcsiZZaxBKALU1OoBduTb2Hlj9IOsV1Zb2BEVNSaNKBgc
   nEkPpV/gZP0bOPZlbTspOjQKKVwmkRI6+Lkip4h43LkVg8Ue3sMrlAkxz
   g==;
X-CSE-ConnectionGUID: XrcaONflSTOlKdnKWfSpdw==
X-CSE-MsgGUID: EoZNmwGLSoeN5vSCVUucdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61590563"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61590563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 17:06:33 -0700
X-CSE-ConnectionGUID: VJnEbjJdT1Kp3YwO1sJ+IQ==
X-CSE-MsgGUID: +gntNyMfQL26NbMtjxMtBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="178242855"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2025 17:06:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3kMX-000000006Nt-1u7T;
	Wed, 01 Oct 2025 00:06:29 +0000
Date: Wed, 1 Oct 2025 02:05:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-6.17.y 30/50]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: usb@a800000 (qcom,sc8280xp-dwc3):
 #address-cells: 1 was expected
Message-ID: <202510010232.lPbODCxm-lkp@intel.com>
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

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.17.y
head:   920850f32669833c7d393f69785ac16d0292a10e
commit: 97ad2c9e3ffb17dd3274765cd11d5a9df8b3fdb3 [30/50] arm64: dts: qcom: sc8280x: Flatten the USB nodes
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-2051-20250930 (https://download.01.org/0day-ci/archive/20251001/202510010232.lPbODCxm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2e3389abb3a2e4ee27e40f353c5eec476a229f6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010232.lPbODCxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510010232.lPbODCxm-lkp@intel.com/

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
