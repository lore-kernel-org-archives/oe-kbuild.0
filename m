Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139EE4A24
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721095161; cv=none; b=CVCIBkRdrzptpVv0qI5+OmGopNMXwUUD5VYOy9vTf2MKweVH0k8p9veLVjexHCxj1oIm7kX6owMq5uT7XBy6XVpdMI1KKX9hb7+mCzGw70cfW27P6jY7lMQAauYdFCekxOFYPtOIFe7LzXrXGmDBhIilAORNV+eaewMTplc+pCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721095161; c=relaxed/simple;
	bh=Y3usyLHTSVgdqmeWZbublzRKpUhC9mYrT9RTjdgkkhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Npj3Yo3lPL+Vkw+S53Tb6B1gwU+pR7JAdi7AA6cOy86Qozi+IMy/osz/X+ats9O0V1qMTtstfvF5pDMXgCs0Jbodyc387wR8b1qbhrsEofydP7poVMsCd/SU2OxxPhrzQo11VwxpiLVprLNRK44LnnRx5p63zdryKbAHggyIQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzmtcxFt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzmtcxFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721095160; x=1752631160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3usyLHTSVgdqmeWZbublzRKpUhC9mYrT9RTjdgkkhw=;
  b=hzmtcxFtiXy5/7cOsN4VjyB2hfG+E0QLl1HezCpCzzjxu+uFIHHWrcpU
   auP44j2LZsRV/nBLWmIDb/Q3Dkt9jEpgKALma+D5j2BBNXOHnYg3soQkf
   INOtzrjuVzQ3Cn/35ZQZVQHGcX57J/1e34Cre7cWs3N+1VtoTNjvA44VR
   AY129zebrGrfN0tiG21lVP/+PIJKaNZawCh5+tSL2K1tfziy/0km+lpdd
   TggT84VPedZau1WmgwP0k/33hYg2DNQcZpPbaMN9kd7PCsnqbwBru8itc
   UJHjCJnQir9ZVld6S86DemgxV4gkae8U7GhgAlJ0PD78oSbbIcJ0s3FMX
   g==;
X-CSE-ConnectionGUID: yKAYqao4RwWYKWX+d2a9ag==
X-CSE-MsgGUID: UD+e+fEATmGKG8dHq1rWuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22373158"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22373158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:59:19 -0700
X-CSE-ConnectionGUID: MPdeyw3PQQebOibiT+Vf1Q==
X-CSE-MsgGUID: Kped9E2oQkaPzrDAy3KPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49724101"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jul 2024 18:59:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTXTI-000el4-0k;
	Tue, 16 Jul 2024 01:59:16 +0000
Date: Tue, 16 Jul 2024 09:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 38/44]
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: pinctrl@4301c068:
 'wkup_gpio_pins_default' does not match any of the regexes:
 '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
Message-ID: <202407160901.qDhTcU43-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Manorit Chawdhry <m-chawdhry@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   57a6017c36af1015d5e7ac626d8ab1de0ccb6c22
commit: 8636139a4976bc9076db79c08dfbf82230fdcfe0 [38/44] arm64: dts: ti: Introduce J742S2 SoC and EVM
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20240716/202407160901.qDhTcU43-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160901.qDhTcU43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407160901.qDhTcU43-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:2773.34-2782.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: pinctrl@4301c068: 'wkup_gpio_pins_default' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: video-codec@4210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: pinctrl@a40000: 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: mux-controller: idle-state: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
