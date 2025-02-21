Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279181FBC94
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 06:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740118817; cv=none; b=CNzvTECh/Hd7/1jm5qITGYxOZYdOUMb0NAO8FpMk2euzMMM08/eg2TQxSfAzZBtacgqyzEiWFiRSNADRA9PUSFv5Wvf7u+lTfnri3Kb4jbBcHgLEBtGym89t540hR1uojtQ85/l7o50uKxB8yN14a52l3WeMRUlncSp7oo7ry7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740118817; c=relaxed/simple;
	bh=iZFSawfHDoWhBDUyI/C2+kViDoZOQTvQ3pfdReyrhlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bh42f+rJ7zfWP1c/yNxsir6ns/eRyN2dFRdvNYRY0FuBVuiQpKCZ0AAZq/XY2iS9DtLPtWXdFpefGahLl83EYHtFPA2wDBEJ6qED9HAVaYlXNvmmmyM/cuIZheDmkQrOt/E8hgW4btUbVpG6atA30I+ynzaHmLsLkD3cPNagv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFkhfqgE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFkhfqgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740118816; x=1771654816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZFSawfHDoWhBDUyI/C2+kViDoZOQTvQ3pfdReyrhlM=;
  b=SFkhfqgEOZv6aSEHCmwWsan8BR6jF9c2+ZUP/FDGmyMdyJie5t04RwOS
   zH1ODHUG0CCipulVgHVDlAF5F3Cwizad4IBkpu6iNhqnf9wHXgsXTGveY
   f5vtmxqEZqsErO8oK8/uVlrEiLUmC8IcrDGZpJAxqOfMPFjT5l4xDoxQ6
   XueX+MNIMztjBk8ZaS5UTAXo4p/+j/ncMYkjtAcB95gAbGF8aUa2/HBGw
   FmSuTLrht+9IdbdS2LZGoeJsSeXSPSIihBqAhgt8EIQ7OfN8SRL0kqBN4
   yb1IioSMq8RGcdM+24Dw23Z+wV1poT7uMU6zXqP81DY9HSaTO5Ibh5ZCK
   w==;
X-CSE-ConnectionGUID: L/9RUTXSQyix91JnVhCAkA==
X-CSE-MsgGUID: OlMKWhauQ7uqd1zlPshrXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58333285"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="58333285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 22:20:15 -0800
X-CSE-ConnectionGUID: ujr1zcdpTOOzxU52WGz1OQ==
X-CSE-MsgGUID: vphN3kfbQ2uvtuXAbmdSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="114995428"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 22:20:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlMOR-0005Bb-1R;
	Fri, 21 Feb 2025 06:20:11 +0000
Date: Fri, 21 Feb 2025 14:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1037/1079]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: typec-mux@8: 'vdd-supply',
 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not
 match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502211405.DRbU1m3l-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>

tree:   https://github.com/krzk/linux track/x1e80100-t14s
head:   0a5b996575143038f96d880868109359ede28367
commit: cf9355ba30e96c340ebe4c63eebcc9e0d5210341 [1037/1079] arm64: dts: qcom: x1e80100-crd: Enable external DP support
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250221/202502211405.DRbU1m3l-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211405.DRbU1m3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502211405.DRbU1m3l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1bfc000: resets: [[56, 37], [56, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
