Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F42F6931
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 23:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761583; cv=none; b=d/AHR/gno0I9EHmUJebiuGCzCGhWQlAvMqW18t8XwOM5NrHrPEWn2NqAtPj4FydUU9/a5v22i/VQT6JUC9EOm9xFqOPkdxDAqYja/yRZQOuCFjR//MtMlXGFG9SDcCsc4PAAuJ+mOfsZiLvE9NMtLkohNQ1SpzdbTWKXh9ObdkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761583; c=relaxed/simple;
	bh=B8ISUUPZIyePZ2VjGJV3qK7SR1hyhd19iAlZDv6lMdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2todJQ26PO3IDxMSlkl4pGqpee87b1moy/zkMRkXDIVjwB52kojturL9KM7PCiV+HTn9PSAzIAzqFC23koeSaQ+6lTJTwfi5h32CXojBRFZF8zmV2b5JZXUVujQ9/WDeO4cAud/6Y+NHhvGc7i0YipLOWq8Xk/SOUPk7A46qGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRccbI+Y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRccbI+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784761581; x=1816297581;
  h=date:from:to:cc:subject:message-id;
  bh=B8ISUUPZIyePZ2VjGJV3qK7SR1hyhd19iAlZDv6lMdw=;
  b=iRccbI+YmkFbg+njyAorrDNNVnL9hRIhsoUbP/VwLemDOc4Xxoz0CyFa
   Uxcw+W/PBScQTXNT0vxUMR/0shTroeTShXjl9JMxOdrCoT2FU4fCyY2v+
   IzVDLKM9tEvAgydQJenxy/Z/4CVpwBAmcljWUVt3iJnbadqNkhhmYJo3l
   esAh4s1T1KdDYx1zSgohfdvrPUy42NgNDXF4Do2W8Y2bbIM5gn0LeMrB8
   9fsV+avnGdLfSlVWFU1Y08Czu+MKrJD3v2UXRgurvvDbYqkCyqHUpvoNO
   aOT3Z4rTSqRs9Mod1IlyOfCC6XLKNQSO/9Jd8CT/oJYBB5akBZaIalYom
   Q==;
X-CSE-ConnectionGUID: eTngp6HqRi+gAPfwe8ZOGQ==
X-CSE-MsgGUID: FLah8hPTTQuFlVdHlx4lQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85426804"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="85426804"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 16:06:20 -0700
X-CSE-ConnectionGUID: HyQZoV+AQ8qWP1JI1sztuw==
X-CSE-MsgGUID: EU2N8jBzQR6TozTi7Q5rcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="253865916"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2026 16:06:19 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmg13-000000000Zm-0q0Y;
	Wed, 22 Jul 2026 23:06:17 +0000
Date: Thu, 23 Jul 2026 01:06:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dlech:b4/iio-adc-ti-ads122c14 1/12]
 arch/arm64/boot/dts/ti/k3-am67a7-beagley-ai-ads122c14.dtb: chosen: 'overlays'
 does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
Message-ID: <202607230136.psKKHhmF-lkp@intel.com>
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
TO: "David Lechner (TI)" <dlechner@baylibre.com>

tree:   https://github.com/dlech/linux b4/iio-adc-ti-ads122c14
head:   1b758cfa3856fafb248c77ca00ba70eb4a10fa8a
commit: a702b94c580d47838fbfc8a82aee9242293eee2d [1/12] WIP
:::::: branch date: 22 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2051-20260722 (https://download.01.org/0day-ci/archive/20260723/202607230136.psKKHhmF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ba2be3f8add2e63266686cb1bcd40c9fab07de7b)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230136.psKKHhmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607230136.psKKHhmF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am67a7-beagley-ai-ads122c14.dtb: chosen: 'overlays' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml
--
>> arch/arm64/boot/dts/ti/k3-am67a7-beagley-ai-ads122c14-clk.dtb: chosen: 'overlays' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml
--
>> arch/arm64/boot/dts/ti/k3-am67a7-beagley-ai-ads122c14-drdy.dtb: chosen: 'overlays' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
