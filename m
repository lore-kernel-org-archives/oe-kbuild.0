Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34663B585D
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516160; cv=none; b=EvuEl5lIQ5ZL7D1tAWTruhxqCWZkNShD0mgxubbzsJpGGrHzLQ2Dgl0EGpFcwYxgSEt7itUFPCbBj9GAb4vLOUf0h5MtUrl3juoxViUJxP8/40dd8fo16Iz/8qdp6d8JGk68G78DIdC6/WyRETTH4IhoydzDJoBbFDMWXTibuhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516160; c=relaxed/simple;
	bh=6pdFIhycrQNrsclout3oXhqEjm/ravlM96v58oeu2ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRfNuiNGjcv0zkODRk0o42UbiGQUL4HBUJuSlR+F1m4yixkrDr1OE/2ioBPSwzhDT6uh/DMQoSDVuV9lj95SuMKD4adsmDo9lK5T9nqir2YM/mYvmLwBjlVm7zfr25/4utNROgnJG8ljwa6BjWLln07zqougrXNXYtxP9eIAfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1Ukk3F5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1Ukk3F5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790516158; x=1822052158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6pdFIhycrQNrsclout3oXhqEjm/ravlM96v58oeu2ZI=;
  b=I1Ukk3F5hHMfgKIgZEDUofj/6+UuQr2Jv10bZ/fwGokQYyAii48DpI+C
   tRxU4MgszxxOU/6v9kk4EpjL/9Zmyl3SQ3ed+knaf1guICg9ZdoDkFhYo
   mRFYEdBvXkhtDt62cWonmMrF4M3+1nQaW57kPGCVpWAwCOt4oPzhiwslp
   5lTmbaH/CVtZguPORww2mrhgCACI0kZohB4i3V18oGj7eIvjObe8nVJz2
   nfAvALctbwpR74Q+ICacRxRsP93NnCZA6OLr5eGoqCE6/KRKWwI4dEB0h
   bkGI4TWHQIrPEJ+VWHTrVmUykAyiQROy2a2/Tipaxu8KrOsS9tNHJDWOO
   g==;
X-CSE-ConnectionGUID: os2pNfpdRVOUPGZkOuEkXA==
X-CSE-MsgGUID: 4eSPcMQLTXqdB2mKZ2/rmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="91254263"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="91254263"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 06:35:57 -0700
X-CSE-ConnectionGUID: UkiyOQ4OQ9G0PQN2njcR4A==
X-CSE-MsgGUID: l4KLdrZSSjmJBNHR+S96Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="302754525"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2026 06:35:57 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAp2m-000000000at-2jAR;
	Sun, 27 Sep 2026 13:35:52 +0000
Date: Sun, 27 Sep 2026 15:35:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Message-ID: <202609271524.IRhw370W-lkp@intel.com>
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
In-Reply-To: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
References: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
TO: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abel Vesa <abelvesa@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: vishnu.saini@oss.qualcomm.com

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 43d09481a91466a7388cbffc6de3b1df8e5aa35b]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Tiwari/arm64-dts-qcom-hamoa-iot-evk-Add-eDP-display-overlay/20260922-161251
base:   43d09481a91466a7388cbffc6de3b1df8e5aa35b
patch link:    https://lore.kernel.org/r/20260922-edp_overlay_for-next-v3-2-2758d46ee174%40oss.qualcomm.com
patch subject: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2401-20260924 (https://download.01.org/0day-ci/archive/20260927/202609271524.IRhw370W-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271524.IRhw370W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609271524.IRhw370W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
