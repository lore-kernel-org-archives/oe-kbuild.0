Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BFA349CF1
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532064; cv=none; b=EOzRLGToRB16jNlhrc6KcadVAYYEqwWZX7NDQpgVI7FHtGNaUT7KMXZkBTuh7Fsj9Q/OLKsY0LAru9mCfWh7OsYHW0AvQP64Gaa88/6WTQe8u8qORHyyVijZpYpvowASfJTsB//S/1LV1OzPqNiP1D3yvxAeJoBD6C2d8FiI3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532064; c=relaxed/simple;
	bh=AtUxCBQp23c6KbzEwLidaSb7Me+7OW7HPF+lzNMSg80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUAP2BIUNWMYh+3V9ozco8zpDeK86lP2sOstY+3Q6/mMaGaIJRe0NnV0EI2/jpGJPu/BxccHcS4VAe5Q/jwB9QAp9YNSHwq3g4KwnGbs+lymkk4i3rBaHoVwAoPHuLElRA7LBLGEru8Yn3mz6l66PFRrE0dUYDcdKjwErjLs4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+lMzCKv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+lMzCKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779532063; x=1811068063;
  h=date:from:to:cc:subject:message-id;
  bh=AtUxCBQp23c6KbzEwLidaSb7Me+7OW7HPF+lzNMSg80=;
  b=J+lMzCKv2C45osxxOMM9Ez1uEGPxi4QWSlp9mWNSW/nl6L6Eaxgmro2/
   fohffil79ewvYsbEf20lSUYHdGC/7bMT64T9w8Z4DXNUKrgBd0+EyiJ2U
   Mn52dVFFS370JaB3QCRMmkw4CKJocTozAys0PUajyEO5v2WHtabEerqcR
   Z1v1iZvYQ2Wo2uq7Eny/u8F8xXNxl7bGhxIFqtydv6PyJus8zh6N504Ms
   xSeZAh2bbVEJYxk7GDVv4RjrUNQBBfMOWonqbmeNAQB3ALtFXf87WMpPY
   2SmbkGhz56jozTesISVean01UidZcU/86OByTy3m0gTy3fIsIuEhn8Y5s
   w==;
X-CSE-ConnectionGUID: n5iOJxAjS9OgBOdxcKmZOA==
X-CSE-MsgGUID: 6i4BgjMAQKiQE+DK2kyW9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91128379"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="91128379"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 03:27:43 -0700
X-CSE-ConnectionGUID: 21SffCq5RxSjINy9GtjO7Q==
X-CSE-MsgGUID: T7k5IsQNT6CzQ6bYnvjKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="236919405"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2026 03:27:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQjZz-00000000BZp-2TWs;
	Sat, 23 May 2026 10:27:39 +0000
Date: Sat, 23 May 2026 12:27:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 1/114]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605231238.tkERVkEm-lkp@intel.com>
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
commit: 6a9d24ffd63e1cc4a564c95b44ae532cef1c87c7 [1/114] arm64: dts: apple: t6022-j180d: Add audio nodes
:::::: branch date: 9 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260523/202605231238.tkERVkEm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231238.tkERVkEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231238.tkERVkEm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6022-j180d.dts:569.14-585.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6022-j180d.dts:587.14-596.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /sound: failed to match any schema with compatible: ['apple,j180-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /sound: failed to match any schema with compatible: ['apple,j180-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
