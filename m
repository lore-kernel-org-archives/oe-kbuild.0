Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C431E573
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 19:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367860; cv=none; b=bZVSDw99M6B8z4Vv+AHPnqzeRFMjtiaNSL8thkFzBFcLbn+aLUmOBBdGP8nlBuG+FSBM9yBDKbR1p0HIYS+CCsJw3eI5w3lEoGJbtaRrfeB3H7ycmMP5Eza1dcrWoCme5djdEy3P0OaHGr4OEpbWNT+w+5EwNgt/tJHuSy1nG6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367860; c=relaxed/simple;
	bh=tCBONorwJOl2ONSCQJ1eHnAmU66nhBcasa5yGBMveMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJOchiXqxilInJhKh4DdY6dCtMD4qiGcWo7O3sBpCpK0FPnXH+4nQ3Flu//a0jUP859TiDKMur+XwnZMCpB149W3KnFxQD6ezaKi9pNL4v/quhB621fARFsNbmgeG8HV+RoxfhC3QzPyhGv+ViHqsD20JNdidjRJvTudmlkWYro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e51QBHen; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e51QBHen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722367858; x=1753903858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCBONorwJOl2ONSCQJ1eHnAmU66nhBcasa5yGBMveMg=;
  b=e51QBHenwoedNNdSDuxUca1aZuKmuKHZHvUbTBHNoWrS6AMfl5Or+2OO
   eRwySlO3nq/uKQ4do7LvtD3rPCjEOttCBpQo5zlNsm3nvHiTXNzV0ZwA1
   xvk0lBfdJe7ZWRjCAqW/WzOsVO6HU1UL+rRlZ0koX8ptrZjhBCCFAu31D
   Q5xpLKs1ONzCwIEY9zQFBdbXtoTedSDg6zThFbsF4cOjabH/+Mw2jFaXP
   hRI8M5hlJpjzirksimUwv7+0QMuhPrissObix68lTFhT2/9SuLIgyBlEn
   1DZZr8O5g1Gx0bENeOd6eWkXLAZj8O8nB78l++KRzpUhLEnrSK7EcCz1c
   g==;
X-CSE-ConnectionGUID: YMZtCAaJT0KkM01j+mRzdA==
X-CSE-MsgGUID: X2m08QjwT3GE1/whUwODQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20158988"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20158988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 12:30:57 -0700
X-CSE-ConnectionGUID: 6RNLw/R6TlqzZslO1SRm9A==
X-CSE-MsgGUID: V557b7X2Q7Gcj8GZA4LPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54437821"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2024 12:30:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYsYf-000tGt-1d;
	Tue, 30 Jul 2024 19:30:53 +0000
Date: Wed, 31 Jul 2024 03:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62p: Add gpio-ranges for
 mcu_gpio0
Message-ID: <202407310312.P1ufCXBz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi:144.3-19: ERROR (duplicate_property_names): /bus@f0000/bus@4000000/gpio@4201000:ti,ngpio: Duplicate property name"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240730143324.114146-2-j-mcarthur@ti.com>
References: <20240730143324.114146-2-j-mcarthur@ti.com>
TO: Jared McArthur <j-mcarthur@ti.com>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Tero Kristo <kristo@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Jared McArthur <j-mcarthur@ti.com>

Hi Jared,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next linus/master v6.11-rc1 next-20240730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jared-McArthur/arm64-dts-ti-k3-am62p-Add-gpio-ranges-for-mcu_gpio0/20240730-234822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240730143324.114146-2-j-mcarthur%40ti.com
patch subject: [PATCH 1/3] arm64: dts: ti: k3-am62p: Add gpio-ranges for mcu_gpio0
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310312.P1ufCXBz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310312.P1ufCXBz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310312.P1ufCXBz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi:144.3-19: ERROR (duplicate_property_names): /bus@f0000/bus@4000000/gpio@4201000:ti,ngpio: Duplicate property name
   ERROR: Input tree has errors, aborting (use -f to force output)

vim +144 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi

b5080c7c1f7e4c arch/arm64/boot/dts/ti/k3-am62p-mcu.dtsi Vignesh Raghavendra 2023-10-19 @144  		ti,ngpio = <24>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
