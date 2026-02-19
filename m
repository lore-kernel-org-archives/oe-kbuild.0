Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD62FB97A
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771501782; cv=none; b=fwVuF/AfLEyCHA5FZz7EtAe0ZkDoah1EzMXmXPR/YmBwbc8kGEHRAMbEHr6+HEzHAk9CecW9+HW7MO5kV6j2Nmu3t4e4YSoIGFgX1ISixFs8A8zMPizpz5SGz10yqQOZtYDtg8bjHFq/+adeNoV8vbPoCZ+S6q4PXycVtlDw3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771501782; c=relaxed/simple;
	bh=c/ES/dTVmDVV5hFBqgNQ5NB059sXsU6I5hcQPPj0oJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieNkZ5+Sumv5nfoCHRsLjdxXF0w7mPnMlcaZndNtMbE7WpOmlTjWU4iDC2NdKLXKj9zcC/aEzSnS5nZpx/XrONbYgB3QJSLI54qmTW26fyzer47Y8ko4Sm8y2DXrWTfeGrDx9lyr/BKD+bM3AJ0IUFWMKsWN87K7O+3MHYDRsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNdy5Ity; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNdy5Ity"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771501780; x=1803037780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/ES/dTVmDVV5hFBqgNQ5NB059sXsU6I5hcQPPj0oJQ=;
  b=ZNdy5ItyHmcTb1wY4wU5NHGsOeIemdFchotlbvSWa7hLhsD6lUJAuVvU
   +11HCDBVWQUNZijS1d3o9nSpES31e5aPVb+G+jda7ZYOWvKIvAeRo8B5h
   qZDCDeMnmxeZ7v/mNWGnU5iTgYp03QE7ZZtRJwew9Dp8quqS0QRwoTXrf
   t+Z5bKldQv6blok0p/xaDWE3T1hnaO4szX4xnU3PqPXP+/Zg4hX1kki8z
   9120l9VnaOp/geFbwfkTgT6aENt7Ztkiigix3AUjZAN7KdZRwk9d/NjSL
   pMGIsHOWAnuEbFFvjSYEUJZVrP6LwHXZfBYopVFhzOVjv4Abrz0LdTrhj
   g==;
X-CSE-ConnectionGUID: AiB/14gPQROdUDep4psZwA==
X-CSE-MsgGUID: K0E+woEOQFq502HdMGhdaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72485008"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72485008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 03:49:40 -0800
X-CSE-ConnectionGUID: IP3oZ5edS6KwGKT5WDrVjw==
X-CSE-MsgGUID: /gsiCbTKRQ6b6H2RwfVAHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="214601643"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 03:49:39 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt2XI-000000003xx-2L9s;
	Thu, 19 Feb 2026 11:49:36 +0000
Date: Thu, 19 Feb 2026 12:49:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC
 and RTC
Message-ID: <202602191235.1lj4lkpI-lkp@intel.com>
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
In-Reply-To: <20260218132519.74570-4-frieder@fris.de>
References: <20260218132519.74570-4-frieder@fris.de>
TO: Frieder Schrempf <frieder@fris.de>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
TO: Frieder Schrempf <frieder.schrempf@kontron.de>
TO: imx@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Shawn Guo <shawnguo@kernel.org>
CC: Annette Kobou <annette.kobou@kontron.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>

Hi Frieder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/arm64-dts-imx8mp-kontron-Fix-touch-reset-configuration-on-DL-devices/20260218-213335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260218132519.74570-4-frieder%40fris.de
patch subject: [PATCH 3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2055-20260218 (https://download.01.org/0day-ci/archive/20260219/202602191235.1lj4lkpI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191235.1lj4lkpI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602191235.1lj4lkpI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: rtc@52 (microcrystal,rv3028): Unevaluated properties are not allowed ('vdd-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: rtc@52 (microcrystal,rv3028): Unevaluated properties are not allowed ('vdd-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: rtc@52 (microcrystal,rv3028): Unevaluated properties are not allowed ('vdd-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
