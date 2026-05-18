Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B722FF155
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092459; cv=none; b=janCJR+K2oULIgYGWufZ1xSdBdtXlfHzbLv+YJKkoYIQL4Dslp/GNemfmGEDhCNW+S0bdrGMAg3h9SXyhJRFH5BJfjcB5LPUgrbRuIfRH2fPYCs9ICCSCJlzKPVt1qH+CuURU16pnLb02+D0n/v/AcTQci8+dZwPnLEDm6WyLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092459; c=relaxed/simple;
	bh=TrG/JKahzz8qGdvUwYVPQYjkJvlxtwbRRwX1rk8Mjg8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R1zrPixd5U/5dGT6PofkSeslenJoa5zTYAfXUw70o3yY7JGuOOn5RlBer4TvkWD6GRlKixYx3H+uE6m48iVQMHBVKEdFs78E8/iR7f5gqHM7BvwI6lc4YLJ5A+jROlkbbxlnXsC1s3mLSx0fhD7QmAhN11DGce9/egqlkdMmJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RO5ri8qz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RO5ri8qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779092456; x=1810628456;
  h=date:from:to:cc:subject:message-id;
  bh=TrG/JKahzz8qGdvUwYVPQYjkJvlxtwbRRwX1rk8Mjg8=;
  b=RO5ri8qzsrVTxJMZ3qQGwooXG/qjea6g7jELVxNcMlJ6fU/fCNjI7cGY
   JEwS3HWyQKpgKg+2jrz7YuaMNYNVwvxZdD/NQ1BgPIupDivREnpp1KFsT
   uy7H8MRgE0Wf9VOHN9VFf/39cj86I2ddAybdeZ8dXaEZlfCT3K8GQPQzm
   c7M5CvrqyjShkHYsSksSD1VHngQ6JIhAd9UydliacUQPMTM4CvWbDagoY
   i9Ll2Wnk46EISdIgOfkgDD3SuZPDIM+GSuq1X0RSx9kWIxXM3Zp8j6SzI
   ruxrWHRVqC0nu5mXFqvfMQt+1mGN8U+v6GUyUI5xnma4CTOLFBBMLGPXE
   w==;
X-CSE-ConnectionGUID: ogLRf0kBRequscpYUu3OMA==
X-CSE-MsgGUID: HNP8yZmQTbK0yznR0q7rrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80061028"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="80061028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:20:55 -0700
X-CSE-ConnectionGUID: 3Pd3+FDETWKkqUDxMru5Vg==
X-CSE-MsgGUID: TyeJjWdTRDm9Gw6M0MmJ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="234901574"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 01:20:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOtDY-000000009lp-1b9Q;
	Mon, 18 May 2026 08:20:52 +0000
Date: Mon, 18 May 2026 10:20:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 13/114]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000
 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605181011.6EDVvo6A-lkp@intel.com>
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
commit: 35f54dcd0f7374d7d69af856e58172400944d7ab [13/114] arm64: dts: apple: t8103: Mark MCA power states as externally-clocked
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260518/202605181011.6EDVvo6A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181011.6EDVvo6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605181011.6EDVvo6A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
