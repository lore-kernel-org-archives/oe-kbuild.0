Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B0925F7A9
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 01:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779240991; cv=none; b=MZ9nD7nZhSUGakqRMFecVaOapAzX1VYA8zegNHLnChkMeCsPHgYdWsXK3OmzJxLaDRTXhDGQgECX13FvPd0hbUKH36md4yIJT4UWmS1IWkFWpLjDUGiXIai8H1q7FI019QpsMZDq5w4G4qnQBIOEYqBOYZ0/qDS3EfXbc8olVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779240991; c=relaxed/simple;
	bh=vnMpXuEBmCHIhELAT7No5pQviaiwHlv4HM8ZFgxj02o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qEFxzOFecUF5yTlH4edLRuoDGvQw282n0ukl0M2MKulSjBFTDah2yXanG61rpxYGPEwSIG4VkgEnOvoNhj+/YXbPG9ZuHOvA5uIIgpIu5J67gfIt+0upu2ltXtrueoMLWVD4Lw/NC2X2UoNK63KR3mB7gMGD9yOMkeMkErKtkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMPmAXn1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMPmAXn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779240989; x=1810776989;
  h=date:from:to:cc:subject:message-id;
  bh=vnMpXuEBmCHIhELAT7No5pQviaiwHlv4HM8ZFgxj02o=;
  b=XMPmAXn1L+5kwVkn6+NbPLQQJ8tX3AwEROPAh11lo/7xGHbRIMPm3bZq
   ql0G2QuvNqPk8eqEE9q17IBPnezz7QHISzXu88X6GP6V+PYSnKBCWEfBr
   /6AHA0QzQl3QRredmkC/c1JalfFLWYtNhyqxcr70KqRiiNBnz8hB6FNQq
   aAaZTJU95QXhIzVrxd2Iw514VeicaB+NHiGq3FbNhnsVdfcnXvvTcfrbt
   HpC7Do7126RqExPtzgQQNW7w8BghqjXhCuBwkWL1DqN3mgP9WDl3b+ktB
   f+0rnBW3djtu/MPJzAl7Sr5EwD5urehIvdmFhvY8PII9NVLQw9YSrNRfy
   A==;
X-CSE-ConnectionGUID: HAcZ+yD9TBe6KCd4VjtXRw==
X-CSE-MsgGUID: muuIKF2KTAGTdq7EEV2kDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91599513"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91599513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 18:36:28 -0700
X-CSE-ConnectionGUID: /hDrIva3QiO2bye/lgQzsw==
X-CSE-MsgGUID: BlXAqWd4RP2MbP4vSu9z1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237355500"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 18:36:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPVrF-00000000AOj-0oLD;
	Wed, 20 May 2026 01:36:25 +0000
Date: Wed, 20 May 2026 03:36:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 1/114]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@38 (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605200318.zmIMnDKO-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260520/202605200318.zmIMnDKO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200318.zmIMnDKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605200318.zmIMnDKO-lkp@intel.com/

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
