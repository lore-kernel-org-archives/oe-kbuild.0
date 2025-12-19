Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DFD2C0299
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 03:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766114903; cv=none; b=QiOEVaIOpjo1U05gVUKrFjlETc7Ae+NLsbXlUVhA0JkFID8XCLnBD3ysDcLvGJNI9weQOUeMnMtOPCsv4+Oz3xev5glnX3Hd8TF4fZeNOtJexMlGX2GPFWzwmcJVIPNRFXbT4Ge4MYTfKIZgarpp1/TChXg35jY1RUEGEf9/nqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766114903; c=relaxed/simple;
	bh=t3ifgGs3gIpeG/Hbf1zm0HtW1ze3dCf+lrSAXHSopK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kb4DMXSXIZhWKpO5P+ZiShQZgt+cMa0234i2X0Ni6e4GZ6ZuhOFdyJWHFKQKq09M/seb0nNfqtQWEtHVnqqf7LzafX0g2Wo7uvnfhNy+Gtd6oYZt7bPnB8Nw9peijWRXh/fUXDXv8n8I/+K9SCdWrGMsY038Uv+W3kW2jZK1XL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGu0uq1w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGu0uq1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766114901; x=1797650901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3ifgGs3gIpeG/Hbf1zm0HtW1ze3dCf+lrSAXHSopK0=;
  b=XGu0uq1wGCHqjtJMIwQF+KuAR40Jd/KhtF2KjUMUIsCaP4rCe8SIriMq
   uujPuNv50PUp7Q798CDpv6V2biqWOeYtF43HNJr5udeln5uKLDtpFM2p2
   BFAnjvkIj3GwWUkgRn8/d0h6ZKZ1k6lQNDAaVf6tJj3oyRcQYcSj1xocT
   o1DHn2gbishurYoiUZ/l/qjMgJ6T6a4TSIljKyPEcU1JgQm9Mo7ycRxHZ
   qoEiHR9dOkpIWf2MgHDHcPJJpr9FHOtJs/shRAN8h+tnsoag3Rq8ClP4U
   P3cvrBToITBppVQdSc476haYAu3fzMhtPkYT82oCc5UCLi/oXA8Koi1JA
   g==;
X-CSE-ConnectionGUID: GCrFtN6tTDuGNiMSeuYs6g==
X-CSE-MsgGUID: ZzMPXSgJQcqk/aMKBJna+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78790576"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78790576"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:28:20 -0800
X-CSE-ConnectionGUID: bNBtCCp8TAuR7npufSIzmg==
X-CSE-MsgGUID: fGj8ibcaRZCYNJtKzGiH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203268027"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2025 19:28:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWRA8-0000000049E-0i3X;
	Fri, 19 Dec 2025 03:28:16 +0000
Date: Fri, 19 Dec 2025 04:28:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: Fix dt-schema warnings
Message-ID: <202512190431.oPEwsSfM-lkp@intel.com>
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
In-Reply-To: <20251211080311.242771-1-chou.cosmo@gmail.com>
References: <20251211080311.242771-1-chou.cosmo@gmail.com>
TO: Cosmo Chou <chou.cosmo@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: joel@jms.id.au
TO: andrew@codeconstruct.com.au
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: cosmo.chou@quantatw.com
CC: Cosmo Chou <chou.cosmo@gmail.com>

Hi Cosmo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc1]
[cannot apply to next-20251218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmo-Chou/ARM-dts-aspeed-bletchley-Fix-dt-schema-warnings/20251211-160848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251211080311.242771-1-chou.cosmo%40gmail.com
patch subject: [PATCH] ARM: dts: aspeed: bletchley: Fix dt-schema warnings
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-2052-20251215 (https://download.01.org/0day-ci/archive/20251219/202512190431.oPEwsSfM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190431.oPEwsSfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512190431.oPEwsSfM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: sdram@1e6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
