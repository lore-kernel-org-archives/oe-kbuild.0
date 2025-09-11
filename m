Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D86173
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 02:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757556238; cv=none; b=n2zeQOOBWPgvUac/wUrt8JVvJ7MJiUprluoiLB02mpuzueAt78VHZg96UhzCe3am7pqXqKdA1yJ4lslr813XloKJuiAPBt1aVXmcTvlGy/VS34Xb2SUsKw51TO+RSJCFBf3+jqtDWgIUgJDSZIdyUJ2GsXpRMXVcV/0rBTl/sfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757556238; c=relaxed/simple;
	bh=UtkI0F1iMpvcqth8QyZfZ1fNn6QjJVXpoGaMWgOl0vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKtVagZsybZk6nt7Y0C4ZJhNWHSCs8gDZE+8BvJOK969ZoynStDcRSCf+ltlPEMbJ6seg4lnbhbmFPRSrP/Fe3Q+b2SFZosmV/jXyw2wFHVQ6kUF9JBxWGSZjc+EN69HHdPmDeh31s6XLwz8xylyTBXx5n+4y4Sl2O7pPG5QWA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6UnY6FN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6UnY6FN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757556236; x=1789092236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtkI0F1iMpvcqth8QyZfZ1fNn6QjJVXpoGaMWgOl0vU=;
  b=d6UnY6FNHZVir8csz8B/UFfVxOZOHBX7NMywkjKyPuvIK4anHH6y1vW6
   tpifvt0YEBAsfAtX4/KAcOJze/005IyTMEBa6Xm0978WbjimkuQPRUhE0
   OLIhKhx3t1hxOsEvhk8czePvcz8PIgy2gqa5HbCz0qXGpuDT+z3JEqSw/
   s1X4184/V8wg9kP2AK5eozeb43o1KRsN3Bgl48x1dfsaeNcBPd6QdFzGK
   9DntdRuGjYPfJvlqeR800DtlPdb/KtivLpexc4Qm1dfPCWrLBejQJFpUD
   XmcKqCNb0YDV8r8/plBuBK38nvbyEFThEJ4jrKvvN4K7iqyIFA4tDRabx
   A==;
X-CSE-ConnectionGUID: +GBQPkZVSyqzezrRQvFbpA==
X-CSE-MsgGUID: 8WwGBvULR3O4O5vkAFCqWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59816146"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59816146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 19:03:55 -0700
X-CSE-ConnectionGUID: NPCLCpWwS0+GWA7rlqv8tA==
X-CSE-MsgGUID: iPIVkXgnTeW36lZBbvbdSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="173456090"
Received: from lkp-server01.sh.intel.com (HELO b9b8c76d6e3f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2025 19:03:54 -0700
Received: from kbuild by b9b8c76d6e3f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwWfA-00003l-0i;
	Thu, 11 Sep 2025 02:03:52 +0000
Date: Thu, 11 Sep 2025 10:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT
 schema
Message-ID: <202509110951.OkX2vN3y-lkp@intel.com>
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
In-Reply-To: <20250909142201.3209482-1-robh@kernel.org>
References: <20250909142201.3209482-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc5 next-20250910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-watchdog-Convert-nuvoton-npcm-wdt-to-DT-schema/20250909-222349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250909142201.3209482-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT schema
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110951.OkX2vN3y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110951.OkX2vN3y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509110951.OkX2vN3y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: system-controller@f0800000 (nuvoton,npcm845-gcr): compatible: ['nuvoton,npcm845-gcr', 'syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb (simple-bus): apb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000 (nuvoton,npcm845-reset): '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000 (nuvoton,npcm845-reset): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: timer@8000 (nuvoton,npcm845-timer): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-timer.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: watchdog@901c (nuvoton,npcm845-wdt): Unevaluated properties are not allowed ('syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/nuvoton,npcm750-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
