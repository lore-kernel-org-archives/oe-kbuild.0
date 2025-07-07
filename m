Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F1186A
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751927321; cv=none; b=NH1oZZLd9NTPVBCqlNh5BiT8Sfz0TGndW6ooJQwLhtrXNzxWK6UZZHG0XEkh+nlPZjz7b8RG1a0vGEic0fktaiac+lQAuq/Ohunj4ae2qJqX6sJCsp59lIaVTJSQx/4agbvt5GzTcd0Dov2WlrvalCd8zRrlmsHYX3FY5xkO3dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751927321; c=relaxed/simple;
	bh=3KQ9rJTmCdRVJ6ggg+D6aQ4FoT6njunGPWVRjTIJPww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9QQ+NwWQnt1+gO5fasZ06BG2mZne2/FhW71totT7vsDQukCZPoPeoTMoV1e8SO5oCc/GCDGd4m8QkKpxl3fsq//J94914RAww3lvqomn6l/tsElx72efUJ0gUWrmAgm3korgOJpS9QnpYZC3NgmcEqZo9pKpyzGmecCg8bFUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oE1i3aJ7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oE1i3aJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751927318; x=1783463318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KQ9rJTmCdRVJ6ggg+D6aQ4FoT6njunGPWVRjTIJPww=;
  b=oE1i3aJ7Y9gwlbH7Fk9AUxaWglhZqidAztOvEgYzbuGlKLJ4rWzSwQX6
   oCoIR0Oh/P4BefClqIo8kqB7+3cmMDeL1tUtNbWiCindZ1aoMB03cAre4
   IBYY00CEWfVvqttuJE0DRag2ayzr4/7YF41lgkxIEv2ZSyEqjKoRAaJC0
   DDuUIy/OA+aTD7MASm/M3bRXt+5Rml/vSFqrNHaaXU7mCvxtOzciHnPHQ
   bOc4YpLNEeNaOL46lGhPX/3Cs49+y+E3W9v9yXbbVNBDXfIFnSbUg8o4d
   iSLGR51/kcNYcLgYZ3aWiKWrB0+FbdiO3u7RUxCb0Uw6svASm5w+n9pYi
   g==;
X-CSE-ConnectionGUID: qXRB0KhRSZGzqb16P8uVQg==
X-CSE-MsgGUID: Pue2qsOdR+iojJTIZiz1WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64748690"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="64748690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 15:28:38 -0700
X-CSE-ConnectionGUID: p++058rLSI26S9CYwAAOZA==
X-CSE-MsgGUID: 8Ez+ShjvQZCLGnIeGKoAYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155683025"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jul 2025 15:28:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYuKB-0000mx-1e;
	Mon, 07 Jul 2025 22:28:35 +0000
Date: Tue, 8 Jul 2025 06:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 8/8] arm64: dts: allwinner: A523: Add thermal sensors
 and zones
Message-ID: <202507080619.kvChYdbj-lkp@intel.com>
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
In-Reply-To: <20250703151132.2642378-9-iuncuim@gmail.com>
References: <20250703151132.2642378-9-iuncuim@gmail.com>
TO: iuncuim <iuncuim@gmail.com>
TO: Srinivas Kandagatla <srini@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Vasily Khoruzhick <anarsoul@gmail.com>
TO: Yangtao Li <tiny.windzz@gmail.com>
TO: "Rafael J . Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maxime Ripard <mripard@kernel.org>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-sunxi@lists.linux.dev
TO: linux-kernel@vger.kernel.org
TO: linux-pm@vger.kernel.org

Hi iuncuim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next linus/master v6.16-rc5 next-20250704]
[cannot apply to rafael-pm/thermal]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/dt-bindings-nvmem-SID-Add-binding-for-A523-SID-controller/20250703-232411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250703151132.2642378-9-iuncuim%40gmail.com
patch subject: [PATCH v2 8/8] arm64: dts: allwinner: A523: Add thermal sensors and zones
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250707 (https://download.01.org/0day-ci/archive/20250708/202507080619.kvChYdbj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080619.kvChYdbj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507080619.kvChYdbj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:112.6-689.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-sensor@2009400 (allwinner,sun55i-a523-ths1): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-sensor@200a000 (allwinner,sun55i-a523-ths0): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:112.6-689.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-sensor@2009400 (allwinner,sun55i-a523-ths1): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-sensor@200a000 (allwinner,sun55i-a523-ths0): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:112.6-689.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-sensor@2009400 (allwinner,sun55i-a523-ths1): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-sensor@200a000 (allwinner,sun55i-a523-ths0): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
