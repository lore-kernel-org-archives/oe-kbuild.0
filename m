Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AC23EAA7
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571492; cv=none; b=brtKhalqXQPnnimtJXuprc+0+0rtH/Bk+5zfQOxSBUHMSu+qkOs2DsYd9pbrQgMeuE2IQoQrTeTmZpHMQQ44Ri1r7E9v/p723oYmABVr2F2tbwlbP1VBbDgOokEGT09rfHzrpAt1KZNsZfkTseEHZbcUb+m3HgKazP+Bl/WG3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571492; c=relaxed/simple;
	bh=UeeKyfxGYtiQ6r2gkOR01iWxtKm1xR+hbziTBUBDIlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buDlLtJGrwKAu2Y4I5Vk+FhtJr+txhfyOMRM0nF/NSJrsL3KeruEOAssedJLcmvB9N1cpq4Pxp1vNdKk0tI4WdrEDg2IkJWxY8z4NT3XdDCCnScwhZir4vVoTfM+FAEF5xyCoRzQSv2iwWNA2IOHzkzOcHpx79XqvB+P6Kbikvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bM+XGEPf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bM+XGEPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571484; x=1793107484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UeeKyfxGYtiQ6r2gkOR01iWxtKm1xR+hbziTBUBDIlg=;
  b=bM+XGEPf/7zjg5iyI7Hqb3xu8JLyUvYbjL2lgnhtMuAS53wT2RZ3wIxm
   vLorcaanYocADDUf8/OnfSbM5m2xQnkAkKGgACVSqpsaOIwXPQL0Pc5f/
   mrfHcDjQ4/xCuYokF83HOdrs3OgHNBVrCqkJ8+69143uxApUsW+VDY80W
   ueSspFV/1LOVqAXV+f/Cj248CB/arEa2hMEW3eUZti+iFncbH+3GEMJOR
   rgMal9o+owX52NTwoedrPMCGa7ThqUN/zqwCwO831i6o4IVLednQwvQ/8
   pqWuK/X6mgm31v0AuQ1eDSYJbcvbxzdYLMWX92m+hMyZlfbaiwrtXpgS9
   A==;
X-CSE-ConnectionGUID: 5UFwAW7JTzmstt8tLZrv6g==
X-CSE-MsgGUID: LZILHvzZSlCe4Kby/M+EGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51224451"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="51224451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:24:43 -0700
X-CSE-ConnectionGUID: aGPfWgd+Qs22D+QDb7kfKA==
X-CSE-MsgGUID: bqeS8Sp6QWymOPJNeC0bLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184220357"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2025 06:24:42 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDNDD-000000000Kf-2orm;
	Mon, 27 Oct 2025 13:24:39 +0000
Date: Mon, 27 Oct 2025 14:23:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dtb: /sound: failed
 to match any schema with compatible: ['simple-audio-card']
Message-ID: <202510271422.tMnXcP34-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2053-20251025 (https://download.01.org/0day-ci/archive/20251027/202510271422.tMnXcP34-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271422.tMnXcP34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271422.tMnXcP34-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00Headphone Jack\x00HP\x00MIC2\x00Microphone Jack\x00Onboard Microphone\x00MBIAS\x00MIC1\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack Left\x00Microphone\x00Microphone Jack Right\x00Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack Left\x00Microphone\x00Microphone Jack Right\x00Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00Headphone Jack\x00HP\x00MIC2\x00Microphone Jack\x00Onboard Microphone\x00MBIAS\x00MIC1\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00Headphone Jack\x00HP\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00MIC2\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00Headphone Jack\x00HP\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00MIC2\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00Headphone Jack\x00HP\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00MIC2\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi:492.31-507.4: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HP\x00Internal Earpiece\x00EARPIECE\x00Internal Speaker\x00Speaker Amp OUTL\x00Internal Speaker\x00Speaker Amp OUTR\x00Speaker Amp INL\x00LINEOUT\x00Speaker Amp INR\x00LINEOUT\x00Left DAC\x00DACL\x00Right DAC\x00DACR\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00Internal Microphone\x00MBIAS\x00MIC1\x00Internal Microphone\x00Headset Microphone\x00HBIAS\x00MIC2\x00Headset Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Headset Microphone\x00Microphone\x00Internal Microphone\x00Headphone\x00Headphone Jack\x00Speaker\x00Internal Earpiece\x00Speaker\x00Internal Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Internal Microphone Left\x00Microphone\x00Internal Microphone Right\x00Headphone\x00Headphone Jack\x00Speaker\x00Internal Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Internal Microphone Left\x00Microphone\x00Internal Microphone Right\x00Headphone\x00Headphone Jack\x00Speaker\x00Internal Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Left DAC\x00DACL\x00Right DAC\x00DACR\x00Headphone Jack\x00HP\x00ADCL\x00Left ADC\x00ADCR\x00Right ADC\x00MIC2\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts:138.9-149.5: Warning (graph_child_address): /soc/i2c@1c2ac00/anx6345@38/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00Microphone\x00Headset Microphone\x00Microphone\x00Internal Microphone\x00Speaker\x00Internal Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dtb: /sound-spdif: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dtb: /sound-spdif: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00Line\x00Line Out Jack\x00Microphone\x00Microphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: /sound-dmic: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: /sound-wm8962: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: sound-wm8962 (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOUTL\x00Headphones\x00HPOUTR\x00Speaker\x00SPKOUTL\x00Speaker\x00SPKOUTR\x00Headset Mic\x00MICBIAS\x00IN3R\x00Headset Mic\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: /sound-hdmi: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HP_OUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: /sound-wm8904: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: sound-wm8904 (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Headphone Jack\x00MICBIAS\x00IN1L\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: sound-wm8904 (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Headphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: sound-card (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Microphone Jack\x00MICBIAS\x00IN1L\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: sound-card (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: sound-card (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00Line Out\x00AUXOUT1\x00Line Out\x00AUXOUT2\x00LAUX\x00Line In\x00RAUX\x00Line In\x00LMICP\x00Mic In\x00RMICP\x00Mic In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: sound-card (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Line Out\x00Line Out\x00Speaker\x00Speaker\x00Microphone\x00Mic In\x00Line\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: sound-card (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Microphone Jack\x00MICBIAS\x00IN1L\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: sound-card (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: sound-card (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00Line Out\x00AUXOUT1\x00Line Out\x00AUXOUT2\x00LAUX\x00Line In\x00RAUX\x00Line In\x00LMICP\x00Mic In\x00RMICP\x00Mic In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: sound-card (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Line Out\x00Line Out\x00Speaker\x00Speaker\x00Microphone\x00Mic In\x00Line\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1126.11-1136.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: /sound-dmic: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: /sound-wm8962: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: sound-wm8962 (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOUTL\x00Headphones\x00HPOUTR\x00Speaker\x00SPKOUTL\x00Speaker\x00SPKOUTR\x00Headset Mic\x00MICBIAS\x00IN3R\x00Headset Mic\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: /sound-hdmi: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1126.11-1136.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /sound-adv7535: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /sound-dmic: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /sound-wm8962: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: sound-wm8962 (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOUTL\x00Headphones\x00HPOUTR\x00Speaker\x00SPKOUTL\x00Speaker\x00SPKOUTR\x00Headset Mic\x00MICBIAS\x00IN3R\x00Headset Mic\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HP_OUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HP_OUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HP_OUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Headphone Jack\x00MICBIAS\x00IN1L\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Headphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Microphone Jack\x00MICBIAS\x00IN1L\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Speaker\x00Speaker External\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Microphone Jack\x00MICBIAS\x00IN1L\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00Line Out\x00AUXOUT1\x00Line Out\x00AUXOUT2\x00LAUX\x00Line In\x00RAUX\x00Line In\x00LMICP\x00Mic In\x00RMICP\x00Mic In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Line Out\x00Line Out\x00Speaker\x00Speaker\x00Microphone\x00Mic In\x00Line\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack\x00HPOUTL\x00Headphone Jack\x00HPOUTR\x00IN2L\x00Line In Jack\x00IN2R\x00Line In Jack\x00Microphone Jack\x00MICBIAS\x00IN1L\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00Line Out\x00AUXOUT1\x00Line Out\x00AUXOUT2\x00LAUX\x00Line In\x00RAUX\x00Line In\x00LMICP\x00Mic In\x00RMICP\x00Mic In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Line Out\x00Line Out\x00Speaker\x00Speaker\x00Microphone\x00Mic In\x00Line\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Builtin Microphone\x00Microphone\x00Headset Microphone\x00Headphone\x00Headphones\x00Speaker\x00Builtin Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MIC_IN\x00Mic Mux OUT\x00Mic Mux IN1\x00Headset Microphone\x00Mic Mux IN2\x00Builtin Microphone\x00Mic Mux OUT\x00Mic Bias\x00Headphones\x00HP_OUT\x00Builtin Speaker\x00Speaker Amp OUTR\x00Speaker Amp INR\x00LINE_OUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: /sound-wwan: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00Microphone\x00Headset Mic\x00Microphone\x00Digital Mic\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOUTL\x00Headphones\x00HPOUTR\x00Speaker\x00SPKOUTL\x00Speaker\x00SPKOUTR\x00Headset Mic\x00MICBIAS\x00IN3R\x00Headset Mic\x00DMICDAT\x00Digital Mic\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /sound-wwan: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00Microphone\x00Headset Mic\x00Microphone\x00Digital Mic\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOUTL\x00Headphones\x00HPOUTR\x00Speaker\x00SPKOUTL\x00Speaker\x00SPKOUTR\x00Headset Mic\x00MICBIAS\x00IN3R\x00Headset Mic\x00DMICDAT\x00Digital Mic\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: /sound-wwan: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00Microphone\x00Headset Mic\x00Microphone\x00Digital Mic\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOUTL\x00Headphones\x00HPOUTR\x00Speaker\x00SPKOUTL\x00Speaker\x00SPKOUTR\x00Headset Mic\x00MICBIAS\x00IN3R\x00Headset Mic\x00DMICDAT\x00Digital Mic\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: /sound-wwan: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /sound1: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: sound1 (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack Front\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /sound2: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: sound2 (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack Back\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: sound2 (simple-audio-card): simple-audio-card,routing: b'Headphone Jack Back\x00HPA1 HPLEFT\x00Headphone Jack Back\x00HPA1 HPRIGHT\x00HPA1 LEFTIN\x00HPL\x00HPA1 RIGHTIN\x00HPR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphone Jack Front\x00Headphone\x00Headphone Jack Back\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphone Jack Front\x00HPA1 HPLEFT\x00Headphone Jack Front\x00HPA1 HPRIGHT\x00Headphone Jack Back\x00HPA2 HPLEFT\x00Headphone Jack Back\x00HPA2 HPRIGHT\x00HPA1 LEFTIN\x00HPL\x00HPA1 RIGHTIN\x00HPR\x00HPA2 LEFTIN\x00HPL\x00HPA2 RIGHTIN\x00HPR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /sound-carrier: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: sound-carrier (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00Line Out\x00AUXOUT1\x00Line Out\x00AUXOUT2\x00LAUX\x00Line In\x00RAUX\x00Line In\x00LMICP\x00Mic In\x00RMICP\x00Mic In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: sound-carrier (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Line Out\x00Line Out\x00Speaker\x00Speaker\x00Microphone\x00Mic In\x00Line\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /sound-carrier: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: sound-carrier (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00Line Out\x00AUXOUT1\x00Line Out\x00AUXOUT2\x00LAUX\x00Line In\x00RAUX\x00Line In\x00LMICP\x00Mic In\x00RMICP\x00Mic In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: sound-carrier (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Line Out\x00Line Out\x00Speaker\x00Speaker\x00Microphone\x00Mic In\x00Line\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /sound-card: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Line\x00Line In\x00Line\x00Line Out\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Line Out\x00LLOUT\x00Line Out\x00RLOUT\x00Speaker\x00SPOP\x00Speaker\x00SPOM\x00LINE1L\x00Line In\x00LINE1R\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:513.19-536.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:538.23-557.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:55.18-58.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00Speaker Ext\x00Line\x00Line In Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: /sound-peb-av-10: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: sound-peb-av-10 (simple-audio-card): simple-audio-card,routing: b'Speaker\x00SPOP\x00Speaker\x00SPOM\x00Headphone Jack\x00HPLOUT\x00Headphone Jack\x00HPROUT\x00LINE1L\x00Line In\x00LINE1R\x00Line In\x00MIC3R\x00Microphone Jack\x00Microphone Jack\x00Mic Bias\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: sound-peb-av-10 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Line In\x00Speaker\x00Speaker\x00Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Speaker\x00Speaker External\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Speaker\x00Speaker External\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: /sound-wm8524: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,widgets: b'Line\x00Left Line Out Jack\x00Line\x00Right Line Out Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: sound-wm8524 (simple-audio-card): simple-audio-card,routing: b'Left Line Out Jack\x00LINEVOUTL\x00Right Line Out Jack\x00LINEVOUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/fsl,mpl3115.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: pressure-sensor@60 (fsl,mpl3115): 'vddio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/fsl,mpl3115.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Line\x00Line In\x00Line\x00Line Out\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Line Out\x00LLOUT\x00Line Out\x00RLOUT\x00Speaker\x00SPOP\x00Speaker\x00SPOM\x00LINE1L\x00Line In\x00LINE1R\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Line\x00Line In\x00Line\x00Line Out\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Line Out\x00LLOUT\x00Line Out\x00RLOUT\x00Speaker\x00SPOP\x00Speaker\x00SPOM\x00LINE1L\x00Line In\x00LINE1R\x00Line In\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: /sound-bt-sco: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: ethernet-phy@0 (ethernet-phy-id001c.c915): compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: ethernet-phy@0 (ethernet-phy-id001c.c915): compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: ethernet-phy@0 (ethernet-phy-id001c.c915): compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:84.11-93.6: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:119.11-128.6: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:169.9-178.5: Warning (graph_child_address): /soc/display@10890000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-pmod.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-pmod.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-pmod.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:832.12-840.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:842.12-851.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:877.12-886.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: /i2s0-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: ethernet@ff550000 (rockchip,rk3328-gmac): Unevaluated properties are not allowed ('assigned-clock-rate' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: /spdif-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351v.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351v.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351v.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: mux-controller (gpio-mux): 'pinctrl' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mux/gpio-mux.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: /spdif-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: ethernet@ff550000 (rockchip,rk3328-gmac): Unevaluated properties are not allowed ('assigned-clock-rate' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: /spdif-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /i2c@ff110000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5651']
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: typec-portc@22 (fcs,fusb302): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /rt5651-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: rt5651-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2176.20-2178.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-evb.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: spdif@ff870000 (rockchip,rk3399-spdif): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: /rt5640-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: wifi@0,0 (qcom,ath10k): reg: [[0, 0, 0, 0, 0], [50331664, 0, 0, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: panel@0 (kingdisplay,kd097d04): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth (brcm,bcm43438-bt): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth (brcm,bcm43438-bt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: pcie@f8000000 (rockchip,rk3399-pcie): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth (brcm,bcm43438-bt): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth (brcm,bcm43438-bt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: cm32181@10 (capella,cm32181): 'vdd-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: spi@ff1d0000 (rockchip,rk3399-spi): Unevaluated properties are not allowed ('max-freq' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /es8316-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: es8316-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: es8316-sound (simple-audio-card): simple-audio-card,routing: b'MIC1\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker Amplifier INL\x00HPOL\x00Speaker Amplifier INR\x00HPOR\x00Speaker\x00Speaker Amplifier OUTL\x00Speaker\x00Speaker Amplifier OUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1951.11-1955.6: Warning (graph_child_address): /isp0@ff910000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1984.9-1993.5: Warning (graph_child_address): /isp1@ff920000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1988.11-1992.6: Warning (graph_child_address): /isp1@ff920000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl (rockchip,rk3399-pinctrl): gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 190]], 'phandle': 185}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 189]], 'phandle': 184}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /i2s0-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /i2c@ff160000/regulator@66: failed to match any schema with compatible: ['mps,mp8859']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /i2c@ff160000/regulator@66: failed to match any schema with compatible: ['mps,mp8859']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11 (everest,es8388): 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11 (everest,es8388): 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11 (everest,es8388): 'PVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11 (everest,es8388): 'HPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: /es8388-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388-sound (simple-audio-card): simple-audio-card,routing: b'LINPUT1\x00Mic Jack\x00Headphone Amp INL\x00LOUT2\x00Headphone Amp INR\x00ROUT2\x00Headphones\x00Headphone Amp OUTL\x00Headphones\x00Headphone Amp OUTR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: pmic: vsel1-gpio: {'rockchip,pins': [[1, 17, 0, 194]], 'phandle': 138} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: pmic: vsel2-gpio: {'rockchip,pins': [[1, 14, 0, 194]], 'phandle': 139} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /rk809-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /i2c@ff110000/rt5651@1a: failed to match any schema with compatible: ['realtek,rt5651']
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /rt5651-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: rt5651-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICR\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amplifier OUTL\x00Internal Speakers\x00Speaker Amplifier OUTR\x00Speaker Amplifier INL\x00HPOL\x00Speaker Amplifier INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: rk817-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: rk817-sound (simple-audio-card): simple-audio-card,routing: b'MICR\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amplifier OUTL\x00Internal Speakers\x00Speaker Amplifier OUTR\x00Speaker Amplifier INL\x00HPOL\x00Speaker Amplifier INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Mic Jack\x00Headphone\x00Headphones\x00Speaker\x00Internal Speakers\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: sound (simple-audio-card): simple-audio-card,routing: b'MICL\x00Mic Jack\x00Headphones\x00HPOL\x00Headphones\x00HPOR\x00Internal Speakers\x00Speaker Amp OUTL\x00Internal Speakers\x00Speaker Amp OUTR\x00Speaker Amp INL\x00HPOL\x00Speaker Amp INR\x00HPOR\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /rk817-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /spdif-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm43455-fmac'] is too short
   	'brcm,bcm43455-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433', 'pci14e4,4434', 'pci14e4,449d']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: /rk809-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: /spdif-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /rk809-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /rk809-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /tas2562-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /rk809-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: rk809-sound (simple-audio-card): simple-audio-card,widgets: b'Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: rk809-sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOL\x00Headphones\x00HPOR\x00Speaker\x00SPKO\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /rk809-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: /pdm-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /es8388-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: es8388-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Headphone Mic\x00Microphone\x00Mic Pads\x00Headphone\x00Headphone\x00Line Out\x00Line Out\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: es8388-sound (simple-audio-card): simple-audio-card,routing: b'Headphone\x00LOUT1\x00Headphone\x00ROUT1\x00Line Out\x00LOUT2\x00Line Out\x00ROUT2\x00RINPUT1\x00Headphone Mic\x00LINPUT2\x00Mic Pads\x00RINPUT2\x00Mic Pads\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: es8388-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphone\x00Line Out\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /es8388-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: es8388-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Headphone Mic\x00Microphone\x00Mic Pads\x00Headphone\x00Headphone\x00Line Out\x00Line Out\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: es8388-sound (simple-audio-card): simple-audio-card,routing: b'Headphone\x00LOUT1\x00Headphone\x00ROUT1\x00Line Out\x00LOUT2\x00Line Out\x00ROUT2\x00RINPUT1\x00Headphone Mic\x00LINPUT2\x00Mic Pads\x00RINPUT2\x00Mic Pads\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: es8388-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphone\x00Line Out\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOL\x00Headphones\x00HPOR\x00IN1P\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1410.7-1418.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: analog-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphones\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: analog-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphones\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: analog-sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00HPOL\x00Headphones\x00HPOR\x00MIC1\x00Microphone Jack\x00Microphone Jack\x00micbias1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /spdif-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphones\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Headphones\x00Headphones\x00Speaker\x00Speaker\x00Microphone\x00Internal Microphone\x00Microphone\x00Headset Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LHP\x00Headphones\x00RHP\x00Speaker\x00LSPK\x00Speaker\x00RSPK\x00LMICP\x00Headset Microphone\x00RMICP\x00Internal Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Onboard Microphone\x00Microphone\x00Microphone Jack\x00Speaker\x00Speaker\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LOUT1\x00Headphones\x00ROUT1\x00Speaker\x00LOUT2\x00Speaker\x00ROUT2\x00Headphones\x00Headphones Amp OUTL\x00Headphones\x00Headphones Amp OUTR\x00Headphones Amp INL\x00LOUT1\x00Headphones Amp INR\x00ROUT1\x00Speaker\x00Speaker Amp OUTL\x00Speaker\x00Speaker Amp OUTR\x00Speaker Amp INL\x00LOUT2\x00Speaker Amp INR\x00ROUT2\x00LINPUT1\x00Microphone Jack\x00RINPUT1\x00Microphone Jack\x00LINPUT2\x00Onboard Microphone\x00RINPUT2\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Onboard Microphone\x00Microphone\x00Microphone Jack\x00Speaker\x00Speaker\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: sound (simple-audio-card): simple-audio-card,routing: b'Headphones\x00LOUT1\x00Headphones\x00ROUT1\x00Speaker\x00LOUT2\x00Speaker\x00ROUT2\x00Headphones\x00Headphones Amp OUTL\x00Headphones\x00Headphones Amp OUTR\x00Headphones Amp INL\x00LOUT1\x00Headphones Amp INR\x00ROUT1\x00Speaker\x00Speaker Amp OUTL\x00Speaker\x00Speaker Amp OUTR\x00Speaker Amp INL\x00LOUT2\x00Speaker Amp INR\x00ROUT2\x00LINPUT1\x00Microphone Jack\x00RINPUT1\x00Microphone Jack\x00LINPUT2\x00Onboard Microphone\x00RINPUT2\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts:1060.7-1068.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: analog-sound (simple-audio-card): simple-audio-card,routing: b'Speaker\x00LOUT2\x00Speaker\x00ROUT2\x00Headphones Amplifier INL\x00LOUT1\x00Headphones Amplifier INR\x00ROUT1\x00Headphones\x00Headphones Amplifier OUTL\x00Headphones\x00Headphones Amplifier OUTR\x00LINPUT1\x00Microphone Jack\x00RINPUT1\x00Microphone Jack\x00LINPUT2\x00Onboard Microphone\x00RINPUT2\x00Onboard Microphone\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1240.7-1248.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1172.7-1180.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: analog-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphones\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts:1375.7-1382.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: analog-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphones\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00Speaker\x00Speaker\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /analog-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: analog-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Microphone\x00Onboard Microphone\x00Headphone\x00Headphones\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: /i2s0-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: pinctrl (rockchip,rk3399-pinctrl): gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 190]], 'phandle': 185}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 189]], 'phandle': 184}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: /i2s0-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: panel@0 (jasonic,jt240mhqs-hwt-ek-e3): compatible: ['jasonic,jt240mhqs-hwt-ek-e3', 'sitronix,st7789v'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('compatible', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /pdm-sound: failed to match any schema with compatible: ['simple-audio-card']
--
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /hdmi-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /es8388-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: es8388-sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Headphone Mic\x00Microphone\x00Mic Pads\x00Headphone\x00Headphone\x00Line Out\x00Line Out\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: es8388-sound (simple-audio-card): simple-audio-card,routing: b'Headphone\x00LOUT1\x00Headphone\x00ROUT1\x00Line Out\x00LOUT2\x00Line Out\x00ROUT2\x00RINPUT1\x00Headphone Mic\x00LINPUT2\x00Mic Pads\x00RINPUT2\x00Mic Pads\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: es8388-sound (simple-audio-card): simple-audio-card,pin-switches: b'Headphone\x00Line Out\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: switch@5f (microchip,ksz9896): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: switch@5f (microchip,ksz9896): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
   Traceback (most recent call last):
   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'definitions'
--
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /hdmi0-sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /hdmi1-sound: failed to match any schema with compatible: ['simple-audio-card']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /i2s3-sound: failed to match any schema with compatible: ['simple-audio-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
