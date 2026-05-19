Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20648C8BC
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200900; cv=none; b=R+h3i5Z4YsR0gqVul6ZNb3iWACn9ksHJ9pC1gVJYHUbioJZEIecxv8Hgx7BsMBJTMmH69UyR6X6t2ij9sWQMOYhvccvmiqEE2OM1goqtdHQkvG89K/iHWudFJDxs178uoZS0eXJgd/2d6hAWbz1sBPckdEoAObjy8kFBCkOsSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200900; c=relaxed/simple;
	bh=Aer5VLa0QcN+kSLv3wKK3YTc0DgSz5o4FIoJCpo++Ag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U3pF9i2oZvWswv+3eErOk93hf0otkh1VbzDXW7llAJXtwd8XuyXtPzUdBvFcWc8Dh9aO75mxcYTIU5L9LVVXZFM1qcQNbiHVtVWDH2BF4QjXkHM6vbgcry00AZMVY6rBlo1f/fs/ovG5OexZMY131adMTqUANjxPK5p2VNehELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9WYx02R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9WYx02R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779200899; x=1810736899;
  h=date:from:to:cc:subject:message-id;
  bh=Aer5VLa0QcN+kSLv3wKK3YTc0DgSz5o4FIoJCpo++Ag=;
  b=E9WYx02RV4A/pD35lHl3e8XRvGhMPYnZJjMwc0FNvkEoJVvUjVMLI0G1
   KrDb800Rku4Abi26dLFlds/FHSAhUV3sa76mCJp/WfHCSGwJUOmONYVtC
   Fa1+OlPdmEpP/90Y9GQYpAiBbWZ11/srJ3UXMHQCbd9+6HCha9SGJ7XV+
   ty9wtTeV5m2s14lOLYtmwIJ9wFFTCcQZ9uTAdaWzb4QUxqvX2TcIc6I3n
   xw2JAk6AkLlkwhPm2f86aZU5w2nUxZyZ2D+sOz8+Eks2mY3H9fxAr3PxP
   JfoG9EwoALsx5AtDGeASu++PZXdug5TnQoyHZCHNvhEQbG72a3Y87PdJR
   w==;
X-CSE-ConnectionGUID: 9MAg01aiTV+xevNS88JVrQ==
X-CSE-MsgGUID: awNYMTAnSaiQKS3dEZ4HBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91546016"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91546016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:28:18 -0700
X-CSE-ConnectionGUID: VYAqOVLIRmauqPSR7a38Rw==
X-CSE-MsgGUID: bcMYZ2xETL697kgFL1Ge9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="236775425"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2026 07:28:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPLQd-00000000ADl-1lRR;
	Tue, 19 May 2026 14:28:15 +0000
Date: Tue, 19 May 2026 16:27:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 18/114]
 arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000
 (apple,t6000-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202605191621.rbKQRNyp-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 2018d483c33b7863aaccac24dec45003091743cb [18/114] arm64: dts: apple: t6001-j375c: Add USB3 hub GPIO initialization
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260519/202605191621.rbKQRNyp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191621.rbKQRNyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605191621.rbKQRNyp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000 (apple,t6000-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /sound: failed to match any schema with compatible: ['apple,j375-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /sound: failed to match any schema with compatible: ['apple,j375-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
