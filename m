Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6075A37475D
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447318; cv=none; b=QAWbrUPqfbsUno0BIV9ET+acm25+H1+FWW9FEAkGh98Fvpx7JLGanv1Q+lCN8IJoXQj+SMS+Nhbz541PUmaB/VJ8LvQnxuBBeRQvbVPSrp8kDJq1ePSH2g+I+hwVheszai1CscTkbPd7sGlS7nN92k5uZGngc0ezcjiKrl+IpDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447318; c=relaxed/simple;
	bh=dHb+bYZSizbb0cOHIe/s3sWqDSvBVtkXKy3R7QbUn1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8kHG7EH4QadkgQ5vfgfRCb24Y/+1Uq5BPKl23nZepgkK1qwe1cALmvayK+N5iLuaN60qB0dB5ymnBvu0S/Es5aOfAKlxAMip2tkajb2/QhJCMWdmyQntPFHtCUU+9Ac21TGei04EFPNd8XepMA1m7QIsH36VDQT9TNwwvcXESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmNfrOt7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmNfrOt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790447316; x=1821983316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHb+bYZSizbb0cOHIe/s3sWqDSvBVtkXKy3R7QbUn1k=;
  b=bmNfrOt7R4CSZE4yFzvxFj7b6beUYCd/hdBDb71X39rGFT2QDqncxUtF
   Xvd9JSGFaqAb+poKQdVU1AAFi1XYlTOaNo4JOYkZh7iGclBhdUWWxO5Ii
   La1qiZ2zKXAm4eQ/Rok7YshxEk/wPXuUQAigciKUDkul0O1jL3ai9C6yd
   QAuJRCTawZRXXGHZWtGxbXHP3u2usoodHl5huld6TsN4V9XvlvWFuI9t6
   kSlWDNWMmLdL01wi2nHTq10qyeG7ukP6ysffK87nmgdh8fK3J9YiMA3dw
   Jhsv1XUL6gQlUQsJbgedbYtPJSZ3ahJOE4vI5VDqCG8nDb+kHAxjpaay2
   Q==;
X-CSE-ConnectionGUID: xjGsXTd1Rgq8XpB3zaTPAw==
X-CSE-MsgGUID: oytKqVJ3Q6eIjvz2C5Ryog==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101863325"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="101863325"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 11:28:36 -0700
X-CSE-ConnectionGUID: u4KgyKoGS4e00YGsVJ+DVQ==
X-CSE-MsgGUID: M1J15kIwSPSSEk9nm6c8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="282704283"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2026 11:28:35 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAX8R-0000000009T-2Dke;
	Sat, 26 Sep 2026 18:28:31 +0000
Date: Sat, 26 Sep 2026 20:28:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Message-ID: <202609262019.mWtRZ42U-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2401-20260924 (https://download.01.org/0day-ci/archive/20260926/202609262019.mWtRZ42U-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609262019.mWtRZ42U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609262019.mWtRZ42U-lkp@intel.com/

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
