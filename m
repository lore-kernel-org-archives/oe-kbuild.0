Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3E846F
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740339302; cv=none; b=XZu7KKTykNy8YEkxv/hQSfyk0lbvMKYmlPfWnMheF/XGPedAy3ZCfrsKvH6Jki3v7ot9lhwXHdOMuPGTT9rFoVTH7YuBje9VqcalYeBWEMtTgGUvQ4jSs/Sz7SmkbVzB74kbGQNYEi4hsXM5mMYsX7DeeAgiqGkuTs2ww1ogCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740339302; c=relaxed/simple;
	bh=61pfftqzmbYOXUxzAye6sTY+vgDt9zcVouUHPJOe9pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6ac/2mag6XjTaBSUgWbUsJjNaYl2qrnYO96Lk5aIjMaKAH2NDqe2/BuboighbZh6pdEv32U82Bj5dmOVEG6mZ9gGd5lpEXy1hZ7cuR0z3wwU8oqXEQoN7OqgguDX4XwuHc69kwp/unBAPnQaVge/aTtScUx4nCFZqgQpDV+p7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFyVk07I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFyVk07I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740339300; x=1771875300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61pfftqzmbYOXUxzAye6sTY+vgDt9zcVouUHPJOe9pU=;
  b=lFyVk07InDRen0SPmMmpKSPPNinmptneCBbChhSv9fxq/S5ajpn5Jaks
   Xtf/lpOTV74Ixa51643EeR3J7F8MvT2ExERiaUcX4pLGzCtqTkd4GIdOp
   F9SN4sf/IUvqvgeeDZ3H1wBh9qD5C4pFWBXy/5U1BoZWHiiVqPu00ToIZ
   fYGdEsR1RaNOwsqHMZvhSwU+f8QO8L5K1Bxc7SwOTObmx6+rKuHhUp+mF
   Vi3uiqJNyDTzKxMnhGRgbNIv/wHJ3QQCJEt+WNSS3FJsmJeQnWciKbFWj
   CENTIbPn85U7qFfZr+GUcCZ+D9Si0N3LnQhGXJA9mhuv3HRwsjYnRLJTM
   w==;
X-CSE-ConnectionGUID: emEYc5O/ScO+sTQctcBVyw==
X-CSE-MsgGUID: xZXtb/aQSXK5fEcdWW9ZCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="43923246"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="43923246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 11:34:59 -0800
X-CSE-ConnectionGUID: 5DTFguf0QuKjyP22zokoJQ==
X-CSE-MsgGUID: 3DDnB0uNRIWfY4kNVbNRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="146715962"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Feb 2025 11:34:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmHkd-0007YN-2p;
	Sun, 23 Feb 2025 19:34:55 +0000
Date: Mon, 24 Feb 2025 03:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1039/1079]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: typec-mux@8:
 'vdd-supply', 'vdd33-cap-supply', 'vddar-supply', 'vddat-supply',
 'vddio-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502240332.xkYpeQMv-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250224/202502240332.xkYpeQMv-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502240332.xkYpeQMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502240332.xkYpeQMv-lkp@intel.com/

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
