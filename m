Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA801CEACB
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740159806; cv=none; b=py2GI3yVBGB8o9BEVHiY65RXOOQQDkSmVQ9ATUom+eRj7U0aawXxv74Dv+rZKk+5Zal2tCMrUaOoeEaLXv7CySWDbJYfn29BQkEL0UcmawR+8EQLkAjhVLFemR7DxlwnYknCJtqkDK8oArFcWrxJGDvpF/DjU7LjkkyHHDWaRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740159806; c=relaxed/simple;
	bh=k+zaZRzKLjYng0FpohPy5V+BT6o5Dvqo0n8WlvxvJNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hX9fbMXILpEuZevEIBKNIO95HZBGsbBgkxF86ZqYTfrEmxA0dVm6WTq0CtbyozJECSKphg+X5iSq81I5Uz5gcFZ/UQGRzsmSH51naheFtzx1zMPXuNQleOEZYj7wyN/ePkDlHdKQftvB8txoX5q6t4SteKUWG0g4xsvJJfQO1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esQAOXgT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esQAOXgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740159804; x=1771695804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+zaZRzKLjYng0FpohPy5V+BT6o5Dvqo0n8WlvxvJNs=;
  b=esQAOXgT/cMjjtEvO9k7cIaBjbv//K4QugBPARZG75tFD5HWegEaISO5
   tWx6QWhUUTwxnzSB7yMWxha0qb+arXlF/bqmeEEWqtom3natfDXZNdWTk
   P/RzYLLZLURlP9MuFJS9bh0HIEf3kQGggVepjnCC4+B/1cye+RqcF9fcB
   pijAr4fb73StF5WAOBI7ecRSTJJ4698Pwf/Lrk3SZu3vCQTr6UfvN75Zh
   2UZqu2sFQYhMOXT5Ly2xXtuh7Zj2xh8qjLbJAfCy3UcwJjALStSeKMTb2
   QqDHzl2Ep0i2cxE3iZGSsrhrctzE48XtQxNxVBXg7eyvVWM07e4Ot6WVG
   A==;
X-CSE-ConnectionGUID: HzSlEZrRROy+8C9iriKxJw==
X-CSE-MsgGUID: 4Z2Vg+PCQDGucePs91cekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40696872"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40696872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 09:43:24 -0800
X-CSE-ConnectionGUID: UEqvVs0VSAeODByBKCb49w==
X-CSE-MsgGUID: AxxcpoVFS8OiWGOJNIs11A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115381202"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Feb 2025 09:43:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlX3Y-0005q5-0i;
	Fri, 21 Feb 2025 17:43:20 +0000
Date: Sat, 22 Feb 2025 01:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1039/1079]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: typec-mux@8:
 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply',
 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502220137.13ygEj64-lkp@intel.com>
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
commit: beedb6b9ad5811e95a39bf393eda6782872cb075 [1039/1079] arm64: dts: qcom: x1e80100-t14s: Add external DP support
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250222/202502220137.13ygEj64-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220137.13ygEj64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502220137.13ygEj64-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4191.11-4201.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: typec-mux@8: 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply', 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: resets: [[56, 37], [56, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
