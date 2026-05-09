Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BEA23ED5B
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778358996; cv=none; b=nqv4r9JVD73i+0AxMQTutIXBQ6UqfclGGYKqFKvpHYQuL8YArR1+Z9qNZ06kEnFQE1oy7sLzkgV25w3lQl9EjxzMStxMUmV/DVO2GQ/S9eH/2hczyj2NufKUs7XZrpdr/Ph2swMuOOUCCHxSNBChkOE/GUi6JTRkw+2VkXQ3ehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778358996; c=relaxed/simple;
	bh=axmGQghNiHFO2JDDF7dnZmKXhuk60cplkm2DFdFypQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lYtjVzlV5P5WlwrLAAf++S2ZwxG3JxAuDKfygGa4I3SRJ5U7+lSdyO1rpK4hda8IcdgLrlSM2qhTA0JD8kDiSkvs2HMRps8yTWnn3eWq5YguptZbyjLBpzCj3zskAiFgcuShdtsfukh6mO8rE8pCViInefIQZOrCk3DCzAXEWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arqrbxfX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arqrbxfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778358993; x=1809894993;
  h=date:from:to:cc:subject:message-id;
  bh=axmGQghNiHFO2JDDF7dnZmKXhuk60cplkm2DFdFypQ8=;
  b=arqrbxfXAjinDAsn/4F+j4gF+x19z9wNDbL5lRXbXBS/okagwQrYRYP8
   bhmXwg52HJd9uFAJE8x7s/7jNy4oUNCHRsLXTSWKACtFBAIh5/E2dJj1r
   x7+Xa481Iux4N4N56jEwWWmUX8Uc834X2LgPifqzg5EGCbaqd/XP1mb4u
   eYVJvc9+J79JjNNCJpqpytM4j5Ux6imS/mjo2FhDUNgU6qaohqrQJiKOp
   7AQdW97fNSJT6b1f4mD3bFyQ56VsAk+p5sbJr3SYhzN59pn3zIIsMdq0i
   fRKtD/kRNemC/PGCfGMtcjQzf3pDvX/SOkYcKGZ17oLc5wSd0XQP2kY59
   w==;
X-CSE-ConnectionGUID: MYZQ5IuETR+h4a7mp945og==
X-CSE-MsgGUID: c8Kt5CYRRuWvup1NPcgwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79327021"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79327021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 13:36:33 -0700
X-CSE-ConnectionGUID: WF8gkEioRYe0D5jCRfWC3A==
X-CSE-MsgGUID: 4hmPZXe3R/mBrX8Xjp2BRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242034131"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 13:36:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLoPV-000000007Xp-1rlq;
	Sat, 09 May 2026 20:36:29 +0000
Date: Sat, 09 May 2026 22:36:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djakov-icc:icc-next 29992/30000]
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: interconnect@16e0000
 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
Message-ID: <202605092258.uFU9bb0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
CC: Georgi Djakov <djakov@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git icc-next
head:   ecdcb756656ffc8b5361a0be481b83dd882074e1
commit: c967b2b239dd4f1bd327d3864c12d7d085b412f4 [29992/30000] dt-bindings: interconnect: qcom,x1e80100-rpmh: add clocks property to enable QoS
:::::: branch date: 23 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2052-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092258.uFU9bb0G-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092258.uFU9bb0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605092258.uFU9bb0G-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
   arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: interconnect@16e0000 (qcom,x1e80100-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: interconnect@1760000 (qcom,x1e80100-usb-north-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: interconnect@1770000 (qcom,x1e80100-usb-south-anoc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,x1e80100-rpmh.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
