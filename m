Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78113B284
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 02:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758334800; cv=none; b=XAOPo6s66PQiY1ciETnLT4Niv8zmgfmSO5XwVwisq/YSdedeWbO3a+JhoO5eHI6l00nI9veyOEHJFBU01zwjTmdIK2413Ts+1ZZKPhZJEJd/OVOE5FRu2hZy0lVivxFygtlA/OEmLXfrNB1jBRFQcdO0vClLA2SDc0ADFMEvpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758334800; c=relaxed/simple;
	bh=/VBMuCfQxp3AgKGF9B8Ii5TsdwMuKRwyqVcq5dzkAw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHRCulf4jRJ9zKHZFbT564ncNPGMTAQ0XJ/x1ItC21jnCnAZBugQW5omaVc8ZT3YmLxZdscBHYq6wRDOlsx2Rf0RaFwxbYxoeY/1VFRqKzH/Gvles0HKp3ar8IVjhHiOXJtXd1o2fTb/dm77KYBEnhvCkXzkcstV4t9DYPkgseQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpkcl0eW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpkcl0eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758334798; x=1789870798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VBMuCfQxp3AgKGF9B8Ii5TsdwMuKRwyqVcq5dzkAw0=;
  b=Xpkcl0eWFLbqTQVmvcAiTzvNPvqQCXrX+jPrTd523lOnrrK94gPCihS3
   cfg/cx0WXbBDiO0y2uM+e/971fDPoaLgS5YtjRLrexhfFRptRB03eXJyA
   H/mrlyZxFivccp6k6ghZ/WfwPcrkerR/qLZ5AzZ9LqMQCjffM23RftC7i
   HORsdlKiguCJ09lJ8ii55BrOD243fMWTZv0dTDNWvG9IMuj5mGcPS9v4r
   W9UEw+Wlhnl4wQ/RxhpkwY7iiKCcDh0W1062QJLTPZXWoNCPPZtPiqcOP
   aqVEf9Lvp4172xLuOpHXGWm+PijHPnHYLQpmNTjHq5JyvrYY9YTnMzKOo
   w==;
X-CSE-ConnectionGUID: GnZ458CxQC6R2hjrbCVwBA==
X-CSE-MsgGUID: XjMVAeJsTL6rAlp8zWRg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71788869"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="71788869"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 19:19:57 -0700
X-CSE-ConnectionGUID: 1owttPU1SwW+WwGo7bxHYw==
X-CSE-MsgGUID: eGKbuqkHR4CZQdhEkMAiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="175109287"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Sep 2025 19:19:56 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uznCb-0004yB-2N;
	Sat, 20 Sep 2025 02:19:53 +0000
Date: Sat, 20 Sep 2025 10:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: R8A78000: Add initial
 Ironhide support
Message-ID: <202509201014.po1DWWws-lkp@intel.com>
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
In-Reply-To: <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
References: <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on geert-renesas-devel/next linus/master v6.17-rc6]
[cannot apply to acme/perf/core next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/arm64-cputype-Add-Cortex-A725AE-definitions/20250917-173332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/875xdhabml.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v4 5/5] arm64: dts: renesas: R8A78000: Add initial Ironhide support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201014.po1DWWws-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201014.po1DWWws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201014.po1DWWws-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000.dtsi:649.9-657.5: Warning (simple_bus_reg): /soc/timer: missing or empty reg/ranges property
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /: failed to match any schema with compatible: ['renesas,ironhide', 'renesas,r8a78000']
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /: failed to match any schema with compatible: ['renesas,ironhide', 'renesas,r8a78000']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@100: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@200: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@300: failed to match any schema with compatible: ['arm,cortex-a720ae']
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70100: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70200: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /cpus/cpu@70300: failed to match any schema with compatible: ['arm,cortex-a720ae']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: soc (simple-bus): timer: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r8a78000', 'renesas,scif'] is too long
   	['renesas,scif-r8a78000', 'renesas,scif'] is too short
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
