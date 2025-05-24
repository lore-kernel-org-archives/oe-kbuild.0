Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1342745E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748072724; cv=none; b=Tvc1bimYxaX6iheN0fUa4U8WNQ3n4mxuPY+Xn4CwtOxUgYqY9Yv7r2vE0FO5ZjOb2uxKglaVmTR75nMjUO4Hq+xcydV3UcvpuW8+qPF7Muexa/SlMgovCP+krxcB3AQxc3lWQlc6lHOw3yEUDV9QOeHh1H67D1gEmtBTG7iaIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748072724; c=relaxed/simple;
	bh=8TqgYNHWjZyRN7INdGJ8P/lq8WKjVtMdtpOc+9fZQnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1rRU7b9xRFgDX3UHgIe8UcXOSzqlNSOaaqDQ2xfSEdR6qukIuQNcXQGMHhwAEDX5/xgAUniNkC9nBlxK7fu3GZ+XlbvsveAclZw1rLkkIU+0U3CGrxBwLl7SDUm/m5VUDw5JOmekR7HGwUXQ1ZckkPI7h69klcNdm2CleiH6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGCmZD2U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGCmZD2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748072722; x=1779608722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8TqgYNHWjZyRN7INdGJ8P/lq8WKjVtMdtpOc+9fZQnM=;
  b=fGCmZD2UOWk+u1aUCyKm2r7RuedJsCVzvL6+uFOGstJJy5UbwpuzppT7
   OANo8cbXimCLOki6BqGKvd8ujf27Pzb2mrsal3e+87UnOw6Cqa1oao/5B
   9BLInL7u4TcHqhE/W7tIy1EqTKR+fg4AUUv0A62o27aY1QBdF/dNG4pQf
   gfOKOBRWuRz9f1EDcZ3jD4dR2HoX9k/QxH+UM/rLHRQ/6NaFO9QbsPFE2
   KFkLCTyIrKutDWUXXdmVqtDPTbqSYEUWEpvB84uoTrOsw82XD39I0OWLM
   uZ1nBavbujlWor/r+GUKSn/obrLXT9kGTXoSikfq5aBIrQ4dyRMkhUhy0
   g==;
X-CSE-ConnectionGUID: wtkngOXBS/SL5vNM2wIr7g==
X-CSE-MsgGUID: oTOc9fthToetX0pILZ0cHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49238820"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49238820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:45:20 -0700
X-CSE-ConnectionGUID: kXccGbQ8T/Cbjpm95UmmFg==
X-CSE-MsgGUID: 7rmGRZMNTJmy8dAbddW6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142029811"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 24 May 2025 00:45:19 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjZE-0001cQ-2X;
	Sat, 24 May 2025 07:45:16 +0000
Date: Sat, 24 May 2025 15:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 33/236]
 arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/backlight@20e200010: failed
 to match any schema with compatible: ['apple,s5l8960x-dwi-bl',
 'apple,dwi-bl']
Message-ID: <202505241545.foN9GYSg-lkp@intel.com>
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
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@svenpeter.dev>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   25a6e10c983dcd254c925e79298049dfb29c1d9f
commit: 25483fd13994ac5dfea570064044688b56defff0 [33/236] arm64: dts: apple: s5l8960x: Add backlight nodes
:::::: branch date: 8 days ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-2051-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241545.foN9GYSg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241545.foN9GYSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505241545.foN9GYSg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
--
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/backlight@20e200010: failed to match any schema with compatible: ['apple,s5l8960x-dwi-bl', 'apple,dwi-bl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
