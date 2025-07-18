Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B451799F
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752879140; cv=none; b=ejrBIZuTTS5obUnS4yGQUDkh+kzhOMTghDPJM2VMMFWMYb+7LvxMGxHzZSbHHZ/z7fcWwH6c4s4d4tiBSs4DWm9hYfGAtKRhhXip5AVOoX7uQlBliID781eoXxqTZNnmiLOBh4L+w5J63D00x8cSHfO79j9W11LaeQYh+y6maVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752879140; c=relaxed/simple;
	bh=uWMzOFh4YS8RLw0HKhSethkCfcc8gfSQTFdya7ErQAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=te2RzEF0PpmcfG+a3dSIHGnT2zjHlc7rGsoseQVlYl3Vt+yQqHFz5k44mR8VX/3c3BIkOR5X0N0LTz2bGJI4DcAyQ9awXH9bTf3C3s2yh/vfK5KAMCa5NXbYJoQ9EO09FCtAtsuIPu42n7Kc8gqB+yvZ/jB4ybG+DvGyztjb7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P619ByRu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P619ByRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752879138; x=1784415138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWMzOFh4YS8RLw0HKhSethkCfcc8gfSQTFdya7ErQAw=;
  b=P619ByRuJpXoVM9HkSIA+wXYFIbwQx7p5t3ml7tjwDcx+U2xglVVhdyt
   eA6KMG/DDZpWoBsAoz4GjKg/NXbWv3Dqq59EB5p9MYJl9/Ec0V90xgn8Z
   d7hecd48sjJDaqyQdif/wOmyieo3Quw7BbuNALe5kiljryWgyaaFwsZuH
   zZFkANR4PqQsVvIOYmoF5vWeoqzXvQjUOeWArbEzu5g1bihguUbPJ3/Zt
   pqyd5zokUcjzdc15hxwzt4I2MveHMuuV5wIpc//N4hu3+E+N9veStZgZa
   EsNum/SAB8S9/6vkU6s1Bpdcc5TXEAIRVHDyRBX0pU+0GDsaifTvJlEqw
   w==;
X-CSE-ConnectionGUID: 8IXEr3zeT/KOgzX6jHXE1w==
X-CSE-MsgGUID: BB3elgwETNCBQFXzz5dPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54895108"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="54895108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 15:52:08 -0700
X-CSE-ConnectionGUID: k0r7P/+QRlebmkjh23U85w==
X-CSE-MsgGUID: VycIqHNxRIyGv6+181SR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="159023411"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jul 2025 15:52:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uctvu-000F6p-2b;
	Fri, 18 Jul 2025 22:52:02 +0000
Date: Sat, 19 Jul 2025 06:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0
 (cfi-flash): Unevaluated properties are not allowed ('partition@0',
 'partition@200000', 'partition@400000', 'partition@7fe000' were unexpected)
Message-ID: <202507190641.vk5g78uq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c7de79e662b8681f54196c107281f1e63c26a3db
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap: Ensure all properties are defined
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-052-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190641.vk5g78uq-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190641.vk5g78uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507190641.vk5g78uq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: serial@1180000000c00 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@0: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@4: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@5: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@6: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@200000', 'partition@400000', 'partition@7fe000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/led-display@4,0: failed to match any schema with compatible: ['avago,hdsp-253x']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/compact-flash@5,0: failed to match any schema with compatible: ['cavium,ebt3000-compact-flash']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/dma-engine@1180000000100: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/dma-engine@1180000000108: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/uctl@118006f000000: failed to match any schema with compatible: ['cavium,octeon-6335-uctl']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ehci@16f0000000000 (cavium,octeon-6335-ehci): $nodename:0: 'ehci@16f0000000000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ohci@16f0000000400 (cavium,octeon-6335-ohci): $nodename:0: 'ohci@16f0000000400' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
