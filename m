Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A91FBEA6
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732472; cv=none; b=gVL+ygy1qqDEF6mnW5jfraU+69DgR9Ri4CrsrxkeISBIyG4hjRBzx1b6/Wah/ib0qETcy6zYpJJVkmLgBGMLC2CmVfMZCZZjrmd2mLjGFWeA3TWR/vo63T+zCyqPQ5DZJZSzs4D+BpEreHMKJjKOh5bW0Rk/n9wG+MEmriFkQAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732472; c=relaxed/simple;
	bh=EYBSGrT64TY6zoycZUfCqMG5APEySj0KIyvdpYeNVr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R+Os1iSyVNIEVBQWPNiLSp2AjBUCaofmbYlcO0EvexG+nhhrSkLPxxR/U8zVIDOuw+8omhjIOn0zDkvo0zJ10S8SMPnW6J9l/JInz0wacRk/URcoE1JMAJraHFes0hgMKGXhLDUS08YbjxW/ANGRORJlAPNa9dsEmXozBql+Qas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSAxoQEP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSAxoQEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790732469; x=1822268469;
  h=date:from:to:cc:subject:message-id;
  bh=EYBSGrT64TY6zoycZUfCqMG5APEySj0KIyvdpYeNVr8=;
  b=KSAxoQEPlvxDv8NE/P9tElXIiT24MQH0s8stagzCUtG2RR59AWCizCbQ
   FoYHTWt9IZznBCu/GDTT8bGQjzIid9NNoSwp/zAWGSskFJNcsdPmRYdCd
   lN6w/cusKbw8FrSk1Tu10jZPOpql35gZga9OrTd4lJSf1t1WwyFBHaTOv
   MeqrdooaJdTIL4NeCyLjVrYZShzCLckmbm4d8vTBSBWxluLlq0KnPB3SA
   EzPMv3qEYKp1V8eDP4MDklxE2PXO6g5ck1mpzMvJEBjLcuPmRCqeQrZcv
   eO6PxS0bnhP8yXHjJ2GO88a7kJruIJUgcr2N7X8o5W6kEhx3a16GT7OL3
   Q==;
X-CSE-ConnectionGUID: 4vz/lgsETJ+aXWd6leEDQw==
X-CSE-MsgGUID: s8NeNEisQQiuaSr6mvoPPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113247444"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="113247444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 18:41:09 -0700
X-CSE-ConnectionGUID: EU118yBNQmqjrYAicJ/+fQ==
X-CSE-MsgGUID: yjCehgQUSMKxMjI6P0eJHA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Sep 2026 18:41:08 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBjJi-000000001fD-0fe2;
	Wed, 30 Sep 2026 01:41:06 +0000
Date: Wed, 30 Sep 2026 03:40:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 235/291]
 arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux',
 'usb3_pipe', 'p2rr2p_pipe'] is too long
Message-ID: <202609300334.S6oxG1dw-lkp@intel.com>
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
TO: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
CC: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   300f5c59beb257550ae3863aeeed2ba63871dae8
commit: 37f28aec2091c949a0e2ba76ad6b5eda34301e0a [235/291] arm64: dts: qcom: hamoa: Add Advantech SOM-DB5830
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2400-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300334.S6oxG1dw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300334.S6oxG1dw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300334.S6oxG1dw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
