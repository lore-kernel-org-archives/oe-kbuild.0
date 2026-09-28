Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D6356767
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 01:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557373; cv=none; b=SC4s0Kcw+6BHWl+aaEdaTj9TKvp2Bxf0yA3373PBe2poEjTm1gsX0PZqsbORwPStdQXF+Yiv2DnC0N9gQTv/xSMf/fakUxtPfCyOPdXW6IqmO0cuwp47qRqdk14WUaQfo0DaXjTLkA+1ToE5K9F8sW+ndfZEgpnDaoy07tWvTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557373; c=relaxed/simple;
	bh=wa7LKzGaBRGQ1hOhMLCIujjdrUC9iVbapXUADDNqW8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qSceZgHCZIV9vK3UCz985AqvuVoOBe4npQxkXbvHe/yAwO44iorGCm6slzygNsSouNNNAzE5F1Zxs4TmE6DafVMX5t2xKOt1B2cXs5sVOh/ZkcN9YwOKM66QFBc0e2TRZVz9/ler8wDW0+u/9fAbs0Kmf3ApahJBhpYUEDh5wYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPW+Harg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPW+Harg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790557371; x=1822093371;
  h=date:from:to:cc:subject:message-id;
  bh=wa7LKzGaBRGQ1hOhMLCIujjdrUC9iVbapXUADDNqW8g=;
  b=gPW+HargaCMNFfL9QAHC2YpLyPrGtkXAV7uvisX3JoCS2vzLGbwJVHtf
   Ept9J+Y3kWxNr824hgP1m7Wf8wa6lL9lNzSXGfihYoj6Qh87Rde7s+R+W
   R/f+13HlKGist7WLHrAbVch9v2nzDJizFrNOQl6cYAU9+s+BFsaVfYc2b
   gNcfMOoFMSaz86jUcvjk7ctIfdtus0Cyt/UcevquGPxI1fMLQ+z7zrR3s
   l+ti7fbn9KjYMcP55KP0lElU7CnIicQdIdubTRjht1wdUG0sG5Vof3KRR
   ARpmOUgHyAfhAnqxF3gz11vcxuu4qPCImRpbI8KPz+EVeTvmfv8N+uIvi
   w==;
X-CSE-ConnectionGUID: 8zHQoUGCS/6JTnWfOADZfg==
X-CSE-MsgGUID: 4/sxhHR1TCSURbM8tp1C6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101776853"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="101776853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 18:02:50 -0700
X-CSE-ConnectionGUID: 2tMeHPmCTC6O8WjuWzaOyg==
X-CSE-MsgGUID: ZDWUBOtfTXma5PQEp/u4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="271390333"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Sep 2026 18:02:48 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAzlW-000000000nf-2kFP;
	Mon, 28 Sep 2026 01:02:46 +0000
Date: Mon, 28 Sep 2026 03:02:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux',
 'usb3_pipe', 'p2rr2p_pipe'] is too long
Message-ID: <202609280200.mzueaftt-lkp@intel.com>
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
TO: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anand-Tiwari/arm64-dts-qcom-hamoa-iot-evk-Add-eDP-display-overlay/20260922-161251
head:   c796c4bdcf6845fbc36de7257b4fb12aad91138f
commit: c796c4bdcf6845fbc36de7257b4fb12aad91138f arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2401-20260924 (https://download.01.org/0day-ci/archive/20260928/202609280200.mzueaftt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280200.mzueaftt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609280200.mzueaftt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
