Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A44477E4D
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984301; cv=none; b=STweBG43jnXTmkpHNNOW2oekPk2l+z+tAHPVtH+qUN/Vj+EyXyVEQkOJrFD3yMWgOgCPeeWCgbjDRjNlH3sLyqE7UNsCe0H6Sw4U5INTzsAMeVSLqr8g436vSU6tLuGcndU8vMdPCqjAYFumzp+tRnjTA5D1eOBV/1sq8NbyG9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984301; c=relaxed/simple;
	bh=hPxdfOlxzlMprgSaVtRaWs2is3k4mnaNMHtzW6GH4GU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U96fqhhBskhP7Z7amsDnV8ciE5IeLMfUBjf6mXS+eslpGB8pX6L+a8lk/zZ2m86UPP6WBMYsrJBPIm7hArB6d/pgyyxAQIAF4yHT1Eb8DI4n9oZCQFGJmvcJCxDj/o8u7XDVAp6H+SE89keFMB/FP0WOjaMtDDCPEBDA2+oI9DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEF8nrx/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEF8nrx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782984298; x=1814520298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPxdfOlxzlMprgSaVtRaWs2is3k4mnaNMHtzW6GH4GU=;
  b=jEF8nrx//jBN73JemXE+D51U2Kt96/yqKQWN3r8t1y89xsRttCfOAXEp
   bYkWzTkr7fx7uuE7a9h8261gEdMAtX1NX0Q6Ik3otiE8DkkKCaPzbgO+3
   lsrUK3X/9I3tHE/tsxBNzlWp1W3JYPoclZpgqzsROK9p80WHLOULWTne/
   h58nbp5VfO5uJfpno9oQ44LMyJcmw0wtbwfH+I+7EM5bTH5SEM0Vub1j6
   KKm+wmNzMcl4rOP06ppr6s6jNLreyXvj4NmDZdvvbHuMH2RoMLjF+B9bL
   tVsq/KHbcZaqX0zBhdJ//W7vptGiu2VdMzZcqbMNghUBWeF93Bpo+p+iq
   Q==;
X-CSE-ConnectionGUID: dlK1z/4VQ06/G/dy8QITqA==
X-CSE-MsgGUID: g0pbMchvSsS49aweWMo8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83603184"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83603184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:24:58 -0700
X-CSE-ConnectionGUID: m+eAfZaBRk6xnLXspO6MHw==
X-CSE-MsgGUID: mdlx+peUSjyJVUaj4c8NSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248833019"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2026 02:24:57 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfDfD-000000001CT-1280;
	Thu, 02 Jul 2026 09:24:55 +0000
Date: Thu, 2 Jul 2026 11:23:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Message-ID: <202607021130.mtumIui2-lkp@intel.com>
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
In-Reply-To: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
TO: Loic Poulain <loic.poulain@oss.qualcomm.com>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>

Hi Loic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/dt-bindings-leds-nxp-pca963x-add-multicolor-LED-support/20260701-003134
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260629-monza-leds-v1-3-0cf7c0a7dc14%40oss.qualcomm.com
patch subject: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller LEDs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260701 (https://download.01.org/0day-ci/archive/20260702/202607021130.mtumIui2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021130.mtumIui2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021130.mtumIui2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: pca9635@68 (nxp,pca9635): 'usb2@5', 'usb3_1@6', 'usb3_2@7', 'wan_amber@0', 'wan_white@1', 'wlan_2g@2', 'wlan_5g@3', 'wps_amber@9', 'wps_white@8' do not match any of the regexes: '^led@[0-9a-f]+$', '^multi-led@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca963x.yaml
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: pca9635@68 (nxp,pca9635): 'usb2@5', 'usb3_1@6', 'usb3_2@7', 'wan_amber@0', 'wan_white@1', 'wlan_2g@2', 'wlan_5g@3', 'wps_amber@9', 'wps_white@8' do not match any of the regexes: '^led@[0-9a-f]+$', '^multi-led@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca963x.yaml
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: pca9635@68 (nxp,pca9635): 'usb2@5', 'usb3_1@6', 'usb3_2@7', 'wan_amber@0', 'wan_white@1', 'wps_amber@9', 'wps_white@8' do not match any of the regexes: '^led@[0-9a-f]+$', '^multi-led@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca963x.yaml
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: pca9635@68 (nxp,pca9635): 'usb2@5', 'usb3_1@6', 'usb3_2@7', 'wan_amber@0', 'wan_white@1', 'wlan_2g@2', 'wlan_5g@3', 'wps_amber@9', 'wps_white@8' do not match any of the regexes: '^led@[0-9a-f]+$', '^multi-led@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca963x.yaml
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
