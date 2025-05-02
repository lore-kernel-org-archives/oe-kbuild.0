Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165E267393
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 18:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746209312; cv=none; b=ZIaG/zebfFzyJ7v09zIhTePX9b2vYuiFgXeKYcU2sbXDl6YBEQ1jJ13dngWGK/Tg7WIAWe9ydFfWIY3U9Y8NhxnO6MjbVQRO+6P7ObC77bt72BUkUaWHNUu5Adi4aw5dr6RSpDhJ08wyQtLMpMuKHIyWdZ+atLyu1yRpaDBxL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746209312; c=relaxed/simple;
	bh=JxLqXWveWwW1R4eJSo13UczvTQP5U1HSLEhtVYHCfKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgqfcOPrqbjW53QBvEVOZ3BRyXvWGa5ShCZr2CJIpC1TvSDLmbbOGJqS1GOVArNOpoNhEhktQVgA4DAddeSOq4aUw5fuBS43Ze36Hph+NDqBn2qGkmRyKR9z+Me5mVyzT+CDHfzKv49XLr28fN2FbdYsvVJpimvR6gfH2rLb8vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7kIK0MJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7kIK0MJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746209309; x=1777745309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxLqXWveWwW1R4eJSo13UczvTQP5U1HSLEhtVYHCfKg=;
  b=A7kIK0MJqh+JffwZRmMaiLhLFn7jP6QSZBwJe+eqJ4B5ZIkTalCXFHwJ
   QiSK2aTkGfQGrm+ESc/0XepGrd5zaif5gkd9Q+Siekil784mY3vQeFfCv
   GCPHaxstxKL6miejoXzY5cDANsYctK7a8ooK3tMkyyNDzwR0g9GsrEf0k
   GoMnrUekPUtYHGQyopM66wk9a6Jh0FOqPnCi9n8YTdIasu1PK0jzxHGrp
   MmWOHqgBeDlB9ydLozxfDzbEO2HJvUJPvjayhE7ZhO2x85X68L7f5stgF
   bgcmMDNkSJ0bjIrDhdFZmNUP/w1Y0RByOgnRiHe99qr+nGDE/DHCqwJhj
   A==;
X-CSE-ConnectionGUID: PHEPVNakSce43MsprEeDRQ==
X-CSE-MsgGUID: O1Mrs5AoTNSGyCwB2zs/mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48035659"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="48035659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 11:08:26 -0700
X-CSE-ConnectionGUID: anF8zzNkTF6BPBii31Ox/Q==
X-CSE-MsgGUID: J1+UouzlQ3a8dg3YTQrzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134447487"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2025 11:08:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAuoB-0004wj-0E;
	Fri, 02 May 2025 18:08:23 +0000
Date: Sat, 3 May 2025 02:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
Message-ID: <202505030128.52ED50Pp-lkp@intel.com>
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
In-Reply-To: <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
TO: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/arm64-dts-qcom-qcs6490-audioreach-Add-gpr-node/20250429-172836
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250429092430.21477-3-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-053-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030128.52ED50Pp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030128.52ED50Pp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030128.52ED50Pp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[223, 8], [223, 7], [224]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[223, 8], [223, 7], [224]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[218, 8], [218, 7], [219]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[218, 8], [218, 7], [219]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[235, 8], [235, 7], [236]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[235, 8], [235, 7], [236]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[216, 8], [216, 7], [217]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[216, 8], [216, 7], [217]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[221, 8], [221, 7], [222]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[221, 8], [221, 7], [222]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:153.29-156.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
