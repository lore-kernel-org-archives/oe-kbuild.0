Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BAF3CCFB0
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322270; cv=none; b=FmU3KPlI//wX0pujjUg8jTzxQyEzfz7gEXK6HMhtNyGXOHF3azZlPWF34a/17ACzoG1skRe7tYU4rHw4z2/WdJI5GeFjTsszsno7RTx/gw7o1wdKqaAH6IwHhPPRcLIeP+JuxgNdDF2GMN4xjD5Bc/Q/5XiHSsn0X861p5xzRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322270; c=relaxed/simple;
	bh=IUOCL/15ESkl7OEaLuVqHIfCzw8PDB4z8DvKbotuy68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MKG/+fHUxvkMW3DZ81kgJAAVhDm4ZMTp8nu4LU1A3yLaxyWnYNkk6lyfZhFap7Dd7BuKT5GdIi3aEzZLnfFuf4/ix8iQBB5PZ0pJbKIQkUFv5Q7iLG+UhL6KPyiLDHqLZts87DPTtwU6rquf58d+IK2Bz32S1PRA8BgFDK36ggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dssNCZj8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dssNCZj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790322269; x=1821858269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUOCL/15ESkl7OEaLuVqHIfCzw8PDB4z8DvKbotuy68=;
  b=dssNCZj87PEOLHwCG+RpKffirzDofjJqnCVQREGEsADsubZPHpi8JAcx
   PGP+Fh3xMO//GKB/hbJ+0d2xT+BwcVb2KZ5O73jZ+LQidrU2Kx3iji+A0
   MKDG3dhf9Mkl3pMGYeCz8DUEcDJn2oseFqeCgocVKf8B5CCmrErX5DIYP
   ciScGzJe+wN/aCitcWxbGSF4Q7XhFQsO+gXLTHvMJHbpK8xO8CocqSDal
   xMDx2P268ekaVRMpUTcBfboMzjgFhDAqLUV9R0sLMlHbSGKrHHVnT68XT
   6SrIzL89gTIQvDtU47Pzrx6LK/lXmhnCZ0aWZkrBjz+Vr4OW7IxguyKoA
   Q==;
X-CSE-ConnectionGUID: B2AakVfQRAyvXbWcn/Thig==
X-CSE-MsgGUID: FLDvgABUR4SfrE740D0Vzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116632616"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116632616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:44:28 -0700
X-CSE-ConnectionGUID: YsJDu9nqSwe4VMEfDs+2uQ==
X-CSE-MsgGUID: VJEDefglT3OwVG5k6mfM4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="282350458"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 00:44:26 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA0bY-000000000eM-2e2B;
	Fri, 25 Sep 2026 07:44:24 +0000
Date: Fri, 25 Sep 2026 09:43:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Message-ID: <202609250900.jgZCosod-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2401-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250900.jgZCosod-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250900.jgZCosod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250900.jgZCosod-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
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
