Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766B101C5
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 03:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720756507; cv=none; b=Hs6JXhv/EY6WMMQTEsNN7Eg9//j3jdJq1IJXPnq8o33kDjnGoXkl/lEs5wnDCFBeaUdb0WpUqzK/BDTO6PVoP1aQu1QFiglu0MQdczPGM7uiNov0OANoJIoe936oJRcTjtf9Da5nhH/acnwrQgYU0MBBYCphXyzKb8HIL95BT/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720756507; c=relaxed/simple;
	bh=LiaoQJYvBOcjaaLAwAqozJdLbNLd5QphfzFtUw5UtIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxZ7vNoriqPEt7DwF5/MtuhxmDlJHmnbGaK+MQFrmLO0J+GSHv+c5nLhlTWtZkDwhxMzTaxqvjwd1axauCtuaTOzAWXm6KTh7uUi5TR9QB0Aux1zjlv6eabYTEdXBgNSov47q224uGJN0ka/HNR/g8QPpntUQRh+1meqB+GvGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ik5lXdSh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik5lXdSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720756506; x=1752292506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LiaoQJYvBOcjaaLAwAqozJdLbNLd5QphfzFtUw5UtIc=;
  b=ik5lXdShT8NlYQk+AJk2oxXVHAFXGVimsNwtpZTX7Zolr7W72YIcsVx+
   aV0owYHgr781pNlvYNdokaGpNwKTwUdRHUc0c+zwdooMT67Tljck/01ZI
   xBm0RrMwpJXTUNcMKpUGuW3sAf/QdAGmh0y2A4iEWuu7D9RBuCiA0/rZV
   WOPclAHpI6A5II2CiACaXBpA5oHPNewEhawZPG+lXVtcRAYLNGwu1F+ZR
   0TFP11Rs1VvC4hAX/jiXtR1TQUWC2BLZJda+EKdaXpuGstLnj7dWOQHY8
   NxaU2pLtDvxZR+mHs/NayRMOd7X6aOKrV2bY28Z9aytoNZ8fq43jLH/Bd
   g==;
X-CSE-ConnectionGUID: refp1QvgSCqhwrZ/8duWnw==
X-CSE-MsgGUID: xSH1L1lQTSmFRg7xcehyOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18299088"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="18299088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 20:55:05 -0700
X-CSE-ConnectionGUID: 18lwRamcRPiVnfJdDz59lw==
X-CSE-MsgGUID: IXwZclDgRKuzQ87HJ0Z7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="49445926"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jul 2024 20:55:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS7N7-000aJE-2L;
	Fri, 12 Jul 2024 03:55:01 +0000
Date: Fri, 12 Jul 2024 11:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bluetooth-next:master 65/70]
 arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: bluetooth: 'vddrfacmn-supply' is a
 required property
Message-ID: <202407121148.OG8cAIOS-lkp@intel.com>
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
CC: linux-bluetooth@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   f14c0bb78769f2670fdd8bcd28ca5543a7601c33
commit: e1c54afa8526cee976e02d4fe9bfaa4add97ddf7 [65/70] dt-bindings: bluetooth: qualcomm: describe the inputs from PMU for wcn7850
:::::: branch date: 24 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240712/202407121148.OG8cAIOS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121148.OG8cAIOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407121148.OG8cAIOS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3523.27-3579.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: bluetooth: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@1c0e000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
