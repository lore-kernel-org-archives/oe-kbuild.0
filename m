Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8F348866
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012222; cv=none; b=ipi33GIeyi9UnqfW2FqIDJZQmlDfPtgV+3WYttGGKSK09a3VkAD5QvUvfHfLHwGeLYgQIeYR9CwBUZ90RdWU619Dh5xwygRgv3u9dHrajMm7OwlnD7lHWgVgNIFNCHVe2oEZFSwNBspJY/yh6L3hoeHiITjekWdLcZw50vy6FeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012222; c=relaxed/simple;
	bh=6Epd5gopNO5kRGyyFZEHmqyBItO9OpyH4P265Oz6uCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g92n+XARVYuyRAn+Nsk2KTyb0qXxO7q1rALPNupYNEHKpbgHH+1xY9S+O/k4JGKTPm1GqTg0VeJMRGpbq5EiYidfPI35lTOPye6N+Z79ra6wTY5EQOKWMBatE4hHtB7omtCt5NxwhPKz15/W6eMDNejCbRMfVLDzNWmj/rxDcQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJCUi9z6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJCUi9z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779012221; x=1810548221;
  h=date:from:to:cc:subject:message-id;
  bh=6Epd5gopNO5kRGyyFZEHmqyBItO9OpyH4P265Oz6uCo=;
  b=WJCUi9z6Pi25DkT8PNgEEDUFsmb7sNBv8k8triBL+VWcgcUNqyctZ/V6
   OfmA+5fPNXPeiUINlD45zopjsR2SGV7y8KGPSirtx3r0DUIFtKm/BdqI2
   XTbElC/ic4aEW5Hk+YGOp5sEPJSLkw+aJQy7o9plW42NGYbDc110lPpqz
   g962qqsQRPsobqTIXrQlu/Wh/H8V9U6FWvMC7C9jM31Udeaxis4tkgF5N
   4pawOBsoIV96dRGGcBC1I1WmCxsZ28PTevj7QhdnNzEqVExxi7jS3iUXX
   XRTrDJQYlQf9MG2/uQrZlZUSrTLuOMsJwIMNTGh3YzfbmcNGtXl5DlEH9
   w==;
X-CSE-ConnectionGUID: sDBvK8icRHWA1/1ZYQCNzQ==
X-CSE-MsgGUID: ojCZSo+kTIOdPEWJsHA1WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="105352759"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="105352759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:03:40 -0700
X-CSE-ConnectionGUID: +Q/o3/NvSr+4Tn2Zw7oybQ==
X-CSE-MsgGUID: Xd0z9+WKTnKMKnK3hqEp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244106737"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2026 03:03:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOYLR-000000009VR-1qtv;
	Sun, 17 May 2026 10:03:37 +0000
Date: Sun, 17 May 2026 12:03:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 1/114]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605171117.taVcGYu1-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260517/202605171117.taVcGYu1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171117.taVcGYu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605171117.taVcGYu1-lkp@intel.com/

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
