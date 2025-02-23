Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4E2F3B
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740302021; cv=none; b=TOwJ/3cW4RqsAP6isZQi3BWxqMlx7yuULpjEgkjJ8POO4XBcFg0nk8GcH0PvK2T1GmQxoLajkTeucs0qJJq2/51mk8thB+E2MxTiTq1fMXFaDWkstnn1ygGi0rM5HGDPZx1iP2xmxbMz9eMpe/OVaZncNL0ToQVvEi1gyKSMih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740302021; c=relaxed/simple;
	bh=9J/896GKu5ob80W4MnrqWpTUteytnt1HifTa5Fld9Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGWiT7Vk0tTlZeO7fyLIjTRVVuP+krEolCehHU6hcF3hd/T2B9nF6tah0LZ2qAsoLfj0kh9D4Sr4J7Omj2AHlvcVfdCu06THaHJj8DovUSAEvunNHTaGuPm2roa/yNYSu7YmwC3+NWCyX2lL9JB9a1LZJ4rcrN5IOIrRw85wyg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyo+2Jl0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyo+2Jl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740302019; x=1771838019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9J/896GKu5ob80W4MnrqWpTUteytnt1HifTa5Fld9Bo=;
  b=jyo+2Jl0v/Ht9+ssYKle7HPEegFhTUEgssC3vmd5ndYmhuvybISwELu2
   VA3P595koIhQ1WzS70efqfM57Cti/WSZnfHH+gV/5p0eMGEctrQNNayP8
   rR+bJVSE1Z9zlOhPUbUfXuWuiwi1BN4qpSrKYPcN8QTXgxkfSCfywAH6e
   Zetsr29oHVjGCFIyuPmUMSkWyYTzBirsSaChIjDrH6dKAl8GTcDkjipfR
   uaXq1bVl0X0dC+oQxycDEEGYM9R3jkYifJPcICxAhdziY69ibxlltJZzc
   l52TPp6WGTxjf0zkHwOt3XI7M5/ZCJ2cucWEoOjMXr/bf8zuW2V7xNh7t
   Q==;
X-CSE-ConnectionGUID: WOLF7eyJTeiA8YPsfNGR3g==
X-CSE-MsgGUID: iseCD8gaTG+MFfFOErIXww==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="41090652"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41090652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 01:13:37 -0800
X-CSE-ConnectionGUID: fcC9iO8qTEazGEFWZqQnBw==
X-CSE-MsgGUID: ejOTyTocTh+Eqh+LbcqZjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116421789"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2025 01:13:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm83K-0007ER-1W;
	Sun, 23 Feb 2025 09:13:34 +0000
Date: Sun, 23 Feb 2025 17:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1037/1079]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: typec-mux@8: 'vdd-supply',
 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not
 match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502231745.MfzbZgcy-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250223/202502231745.MfzbZgcy-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231745.MfzbZgcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502231745.MfzbZgcy-lkp@intel.com/

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
