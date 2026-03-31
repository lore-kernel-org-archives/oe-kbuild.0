Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E643A5E83
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990492; cv=none; b=qaXFBQT7u02H4QM2iCTT3UmZ6OTAnRHgupPfSvxS0jP16efJAWkUUS9egaD3dUaKDQofadRBMIF8Ee2kPAhD8ZPqYhZppQ98VNL24Kry1neJV1347q03PCqFxjNskZCh7yz4VnpnB2FWL7mTPOVAYXyMMDlWM/wDFUrUi9bAoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990492; c=relaxed/simple;
	bh=axV7M9a/Py2R6886ZlakXeiS2zhMSzh0f2WJYge/6ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQWKXaIL5jpCLA0X+ee3PqVL/O/vhUNMZFw3OSk6DtUG9SfWqj8Hq9JoDj9Mn9t030fEqkpa71SWpbebvKM9frQwxadDxcqWX21idXPKrUceNn8qdioJgDEhcF46FBg7tRsJAwPy3m3oMzgosU4Q1L0tt3jp9vVkPFK4uJ1lc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STfxMKZ4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STfxMKZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774990491; x=1806526491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axV7M9a/Py2R6886ZlakXeiS2zhMSzh0f2WJYge/6ZM=;
  b=STfxMKZ44i7WgKzCBcXxUNgOoSomyM32SHWwO10o36A0muxxACMgnWnL
   bvXaklLxxjG7BX8gDz69V50RMAWeIdtvh0LZ0J0CEcxiIxhsG1sHz3U4u
   OsSjO4E0LUy3hsallf7/GJL5ixYC2POrhz4Ev25yY4omz5bDo0ggzYFn3
   foKZZ3h41/qX+FehxSkSmqGvX6dauSYSp8o8h6KsU8v0eOHChKHVq5IeO
   6Lnn5sNiq2ikpYUlEVkfx/oxCUX1QS+nD/ytCL3I7FqUBV3puEVk+r5e4
   l8f+CJhj98WWZdY+19grf3bNR2K+CibbeezDLWrk88JvBIACiEJgMu5+8
   Q==;
X-CSE-ConnectionGUID: kswEw0N4QoeJU0l0BH7ZiA==
X-CSE-MsgGUID: bL++OTBYRBCfmXIYP1Q47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75902331"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75902331"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 13:54:51 -0700
X-CSE-ConnectionGUID: sriv2lbMSVq0VgC3I2XLIg==
X-CSE-MsgGUID: LLkuRnxmQwaous6FYy+dKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226721797"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 13:54:50 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7g6p-000000008VV-3hjw;
	Tue, 31 Mar 2026 20:54:47 +0000
Date: Tue, 31 Mar 2026 22:54:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 09/11] dt-bindings: mfd: ti,omap-usb-host: Add
 'pbias-supply' property
Message-ID: <202603312212.0MnDpMIc-lkp@intel.com>
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
In-Reply-To: <20260330-omap4-fix-usb-support-v2-9-1c1e11b190dc@bootlin.com>
References: <20260330-omap4-fix-usb-support-v2-9-1c1e11b190dc@bootlin.com>
TO: Thomas Richard <thomas.richard@bootlin.com>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Roger Quadros <rogerq@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: linux-omap@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Thomas Richard <thomas.richard@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7aaa8047eafd0bd628065b15757d9b48c5f9c07d]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/dt-bindings-regulator-ti-pbias-regulator-Convert-to-DT-schema/20260331-191717
base:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
patch link:    https://lore.kernel.org/r/20260330-omap4-fix-usb-support-v2-9-1c1e11b190dc%40bootlin.com
patch subject: [PATCH v2 09/11] dt-bindings: mfd: ti,omap-usb-host: Add 'pbias-supply' property
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: microblaze-randconfig-2051-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312212.0MnDpMIc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312212.0MnDpMIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603312212.0MnDpMIc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/ti,omap-usb-host.yaml: properties:pbias-supply: '$ref' is not one of ['description', 'deprecated']
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
