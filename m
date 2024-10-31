Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200A150981
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362207; cv=none; b=XrjD5bRBgLnaruaT+gLC9LAKOMrQ/6jZiHYrEVQInuE0zJNK4R3b5R2n4Fn3uy9meGjmY1iplcZkUu1eUhF7Qa5LXKcIuJAgvQ7DDMUOcGDO3oMvd0OdDVgHtNHJMyTMaq1fgXSMwP5hcTFFsiAdgZWccQtK+5uZ0Lb7Ygl4sk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362207; c=relaxed/simple;
	bh=ppRPre1ntYEDwYLAhWt+1NZjKjsBL0aMOQxSyL/OK7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYjqysQCccDgKo9tDZnRcdwIHMjdFX4JX+kCq5NCT5LXdepPxVH08sxDv4sQL3vow3UlPSJysgMXPP9jTlZMDOuQorcaeXotTEMS0ANWCwl2Hnmmy+6Cnw2QCaFVMW4KngK/ylXwQ4vUNQ25xlQkT0AvGlyYGDznS61GDrq5r6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8jzPeaB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8jzPeaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730362205; x=1761898205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ppRPre1ntYEDwYLAhWt+1NZjKjsBL0aMOQxSyL/OK7k=;
  b=T8jzPeaBopbey14Cb/SEk7eMZ8A/HTjri8dBAKbfRqHa5NqY0U7j2ts4
   UjF9XfH7l/1mSFDApARAAPELhFGM7iWVQyhDW9cTc+Rr3IJvUBZGW3avX
   1AL4U8K+Xae6hYueFCrPUj4YBmNCbZ4nJNZUwZh6U+gD55ryA+VEZhBMG
   rgedFakbfbWRJP8Uheqezu44JEdqQIBoboaixNoWwpmX3oRW6A0t04+/4
   EUAlrjXuaakX0/UoChd5NT/np4JSk9lOduU8pvI87nZZn47EeYzCTjpNd
   pUpSH9zgpsgUHgT1P/zO8srOGQXuN9+S3veB07z5O92IotdUZpOPtM32F
   w==;
X-CSE-ConnectionGUID: q5kN0gi/TDmUlLzZz/QGBg==
X-CSE-MsgGUID: OvlsVz2XSP6DCvyOPfVUaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29526519"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="29526519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 01:10:02 -0700
X-CSE-ConnectionGUID: CRjGn9GLRXai8fdfb1Hleg==
X-CSE-MsgGUID: rTl7s1LfRgqH22chHhmQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87107107"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 01:10:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6QFj-000fqE-17;
	Thu, 31 Oct 2024 08:09:59 +0000
Date: Thu, 31 Oct 2024 16:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/6] arm/dts: Add initial support for Galaxy Tab 2 7.0
Message-ID: <202410311521.5QsvEdLl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/boot/dts/ti/omap/twl6032.dtsi:67.37-70.4: ERROR (phandle_references): /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: Reference to non-existent node or label "ldosb""
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241030194136.297648-5-bavishimithil@gmail.com>
References: <20241030194136.297648-5-bavishimithil@gmail.com>
TO: Mithil Bavishi <bavishimithil@gmail.com>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Roger Quadros <rogerq@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-omap@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org

Hi Mithil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tmlind-omap/for-next linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mithil-Bavishi/ARM-dts-twl6032-Add-DTS-file-for-TWL6032-PMIC/20241031-034352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241030194136.297648-5-bavishimithil%40gmail.com
patch subject: [PATCH v1 4/6] arm/dts: Add initial support for Galaxy Tab 2 7.0
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-003-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311521.5QsvEdLl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311521.5QsvEdLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410311521.5QsvEdLl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/ti/omap/twl6032.dtsi:67.37-70.4: ERROR (phandle_references): /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: Reference to non-existent node or label "ldosb"

vim +/ldosb +67 arch/arm/boot/dts/ti/omap/twl6032.dtsi

d7a498dd74017f2 Mithil Bavishi 2024-10-30 @67  	twl_usb_comparator: usb-comparator {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
