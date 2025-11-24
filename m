Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D27217736
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 06:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763964687; cv=none; b=R6vp2EYkmyTL9+evzPQ0MpAK46JavhNAwTL4TGYcKr9UrCDiPRVaTfnlD3+Wit9PYZHaZC9Bd69umMFkRTED9f5d56GH+1GvOd70dL7c22HdumprkATjuYyxQgOd94kp1NVRZ2m+b+ds+g1EoZSw42QvEG5dr/vBptfjVl1zo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763964687; c=relaxed/simple;
	bh=vgc0E191LWuxmCLBxEP0BT3fd5kyFXcgp63bWnG3vtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z46vLivqXj0MN3C2TboYyFmqY8++dRi1AGIutHK6qSZfelUebN5TxG6Ngme0APjr40BQ26zodrcoPo+bRJdayRWEnCgTLE8N+qH+L2e6Zhz++Cv+4HbutTE2e7b7liFJPE2Z4i/FrpA8HzqkDJ9i4QBtjdrdSY342fGuZju68gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TU+CYXvc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TU+CYXvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763964686; x=1795500686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgc0E191LWuxmCLBxEP0BT3fd5kyFXcgp63bWnG3vtY=;
  b=TU+CYXvcjFgYnSVFMzvw4U3ReXePx/dPmzj/XemRSWCQ7PysAwrQDrOd
   mtVlMKJNfdLN8npuIqd/jBs7EtJcnZyGHHg424KCtXXchztOsxpQHQ5RL
   djfW6C/3xSWFGa057FYunMEdoap6nh93jIMsqaxKaFFHxs+iS91Z2Lmjg
   taYiCdXnEp78n+Pxah7nKELscmlJRUbGwntg4kmFJWNZiTTVFa6hbcGI+
   SpwIOptatkIy24KB42r13Kf9zbfSrI0BY3kCZs//fSdyy33mXNEQlObnP
   iv9SP7W9XJWgy1TxZsFA3k6f3xhB73eFdLYNd8X3rxAO4kbq5hNMeVTXS
   w==;
X-CSE-ConnectionGUID: 62EUpuphTUWm33sHlLNc/w==
X-CSE-MsgGUID: O61HRB63Qm6MqRHDl8uVSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83575150"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="83575150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 22:11:25 -0800
X-CSE-ConnectionGUID: zEHF40PkT5S91AqiXhdj9Q==
X-CSE-MsgGUID: lhRC3/xGS9Cb3pWQjk1Dbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192340435"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Nov 2025 22:11:24 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNPnF-0000000009h-28Vm;
	Mon, 24 Nov 2025 06:11:21 +0000
Date: Mon, 24 Nov 2025 07:10:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:stm32/dt 4/9] arch/arm64/boot/dts/st/stm32mp235f-dk.dtb:
 pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins1: 'st,io-sync'
 does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202511240726.NOYuKuQp-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Antonio Borneo <antonio.borneo@foss.st.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Christophe Roullier <christophe.roullier@foss.st.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git stm32/dt
head:   a6961e2ced5190c68acd78a7e372de07f565fcd6
commit: e613ef5c1516b7b281f9f437598a6b3e320fffe1 [4/9] arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251124/202511240726.NOYuKuQp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511240726.NOYuKuQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511240726.NOYuKuQp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins1: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins3: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth2-rgmii-0:pins1: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth2-rgmii-0:pins4: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins1: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins3: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth2-rgmii-0:pins1: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth2-rgmii-0:pins4: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins1: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth1-rgmii-0:pins3: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth2-rgmii-0:pins1: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pinctrl@44240000 (st,stm32mp257-pinctrl): eth2-rgmii-0:pins4: 'st,io-sync' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
