Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA72E56A
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 01:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766884911; cv=none; b=CU9sZlmo2mRg+/y8jIjfi4prA9j0kjTCydL/f8rWZqW/nAGmHU8IeoxqseVOQtObJGxf387FJbmpfIxHqaNH5x3UNXCvRmJUIC6fHx6399j4j3AGRAQ5I+mKKlHF609x+V/YylbIJEsOkB3jxt5gkLMFBHsHx7SJz1heCVxXsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766884911; c=relaxed/simple;
	bh=qHd9xS7jF8IoNZoBBJxTuKV04Cn+1o7fISqUeHbFBXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTDfHsjl0XrydVMT2f0HS85wozHs5LOtxiGtmwJ1+bIgCCb9xik790/9/iKJq9gLOIUCMgJMOoJPqkmwQ1djbSgnM3i2ugKtLzJ9NkzooJXAbHXh3ZUTNyOM1Y1c+imYaRsvZpZEKWCMEfKYB0jlQfxL15bhsrO0Unf27KmvW+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONhjqUBN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONhjqUBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766884909; x=1798420909;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qHd9xS7jF8IoNZoBBJxTuKV04Cn+1o7fISqUeHbFBXA=;
  b=ONhjqUBNKJLAV0TPlrxeVNcPjBDyBI7vUs3WYm4RvBhMp/26zjjrpwth
   PB27DorgYcnjUKWEGqxBgL8Xetw6+YA9VwbMH9fHfHnC/J1WJS1xy+D6H
   LQYQxVtTKhoR9sBHGoowfBCDtSYryg1gK95MqhAGF/UfYKs4c0ExJcL7u
   8z+TTjc8g98qL9zahdWQBFG5IZbj71OZrOoTFKQw+83pQIkTs9hkrlYGD
   RfGb2TAJRqhgdeviIwRMy8oSrP3qvs9goODJ8B0vkTNsjRy7ZYkvS6KeI
   zOVpFhEY5jcBM9KJkUNVO5hxaBh/hIz4jQ0R8l9xVCMd/pgbN9EDedWi3
   A==;
X-CSE-ConnectionGUID: kEL/aSEKTVakw8atnZuJQg==
X-CSE-MsgGUID: leV8SrfUSTGNk87E3LNaeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68719974"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="68719974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 17:21:48 -0800
X-CSE-ConnectionGUID: zrb6OudhRbCXmj2PGj9Qmw==
X-CSE-MsgGUID: mu2fXPGbTaOFzuv+9OZDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="199861797"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2025 17:21:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZfTb-000000007LM-2eoH;
	Sun, 28 Dec 2025 01:21:43 +0000
Date: Sun, 28 Dec 2025 02:20:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/128]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776):
 Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
Message-ID: <202512280212.qJJuVGpN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>
CC: James Calligeros <jcalligeros99@gmail.com>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 12aa35de5a6694fbd8c2ff2597ae4758df8e3a52 [27/128] arm64: dts: apple: t600x-jxxx: Put in audio nodes
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251228/202512280212.qJJuVGpN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280212.qJJuVGpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512280212.qJJuVGpN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: smc@290400000 (apple,t6000-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: smc@290400000 (apple,t6000-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: smc@290400000 (apple,t6000-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: smc@290400000 (apple,t6000-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
