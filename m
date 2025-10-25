Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9932D5928
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373976; cv=none; b=rtMCgxgXN9h1AG0XAPv5kA4gYXbXvlPN71Pnvt7u+CiSY7eCV0gCF5exN+0kguroON8pMsbpg4ROFGxjq+AyevqdKDorIXAij9Pqaml8cCdTXrClLutuyr1tgiU4UwS4sZGe8L7sAkyTa3EiMwm1xCOmd2+eI0fjg0TA9RW4B6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373976; c=relaxed/simple;
	bh=Kg3pal68c4chIXy+2njFfZmoiGkAexRCDF4njdDq5vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vd8OKk+MeDh3f21dSJXW56QyifpLdQbLuNYhVNTD1Hkr3rZ1YrojYkg/zLM5FL+HLmBI7NuULE7eTopKriZxo23cGZ+Oa8BDBV83bhOibVFmmnyFlCRmpbESxhPrzxNiE5bKRI3DAJV4ufUUGUAFCe2pYxv/I/dL9j2mYrsB/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bt+0ZvMH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bt+0ZvMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761373975; x=1792909975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kg3pal68c4chIXy+2njFfZmoiGkAexRCDF4njdDq5vs=;
  b=bt+0ZvMHBZ5nXEO01tazO1MNEIx3R5YZUzGDO0pIQF/9ZOsz/58vCrK8
   aX1l4Qzje4pwyRcH2U/f6BWzTisXNbmhqiSZtWy4Km3VnpETLINkvPszc
   kfX4ajl16mY9tir1YuE0EbC6os+AJGEKvX0sCGp4TYZLGgvvL0SEbA0I0
   72HrnvsSG9PCvQj0yrMExKYmuRHdzb8too/QRrjBklzeX8PVvTufqDvgQ
   oFOtVz8ybCJqWyFvQ1ytZGcUGDZ+WBHhflgnCVazh5RavbWRMlZlCCUyb
   Tkf5dZULeruxDm5Z6hB2whck3OzbdyJbjrUDkcNO5DElcFnANXE6UVlee
   A==;
X-CSE-ConnectionGUID: skkXQHGyRnSmgbtFXVshww==
X-CSE-MsgGUID: Nsj44VQuR/aZ9FT4gP1i3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63245011"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63245011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 23:32:54 -0700
X-CSE-ConnectionGUID: kefHUGVZRIyrJUlb5fWZ8w==
X-CSE-MsgGUID: 8/Em1mkcRg+zqNl3dn0Lyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184509630"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2025 23:32:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCXpa-000F9G-1t;
	Sat, 25 Oct 2025 06:32:50 +0000
Date: Sat, 25 Oct 2025 14:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39] arch/arc/boot/dts/axs101.dtb:
 /axs10x_mb/sound_playback: failed to match any schema with compatible:
 ['simple-audio-card']
Message-ID: <202510251458.V1ds51QV-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251458.V1ds51QV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251458.V1ds51QV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251458.V1ds51QV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: /axs10x_mb/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/axs101.dtb: /axs10x_mb/sound_playback: failed to match any schema with compatible: ['simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: /axs10x_mb/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/axs103.dtb: /axs10x_mb/sound_playback: failed to match any schema with compatible: ['simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/sound_playback: failed to match any schema with compatible: ['simple-audio-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
