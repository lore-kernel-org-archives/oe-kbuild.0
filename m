Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB2872614
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759179861; cv=none; b=U5aq4/4uOSW1g6nw382LaQQaDSubH1lynRMbOyw/vuVvWGejY1dGuAS0ZpqfIjDDlQOYMT/rWOnpxNs3V9rbCmGpmezTDG9I3UgiF7om5rSyNsJ9gp5zkv+UmaDqQ8/9hcBIiZhslCaNiE01o9W7K2w4xqQhdVu53pAi4V0Zmi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759179861; c=relaxed/simple;
	bh=Df9nv9PDdL302P0Fc4/KYlOdE3WKfxOd133R+XvS1NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8FiXqFgpcXX7MoPN6ZXym5sqat7m78oNYdvB+iIp2CQsyakAyPHGSpeVsb6TNp+i1spfd99/pX74JAmllyUCXMnvJHtfTNw33WyGaJVTAGy5aEzwRm1dxBKEoh4TwKl9IlNc2njBubZCKqKkAjrI9KW5Bc+3H29Y7UuBv3gB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH9djJy3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH9djJy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759179859; x=1790715859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Df9nv9PDdL302P0Fc4/KYlOdE3WKfxOd133R+XvS1NA=;
  b=IH9djJy3tL4Su6QK6EIVS/nMreFUQgETR78s+OaPQMCgjNJ1/va1CYSN
   +WAURw5EHS/PSMB3zlsvrnhX4qLOV1tAuzWF85KDTJTK6+LQKlAnEWs1b
   /8S5V+qMEkGrl87RIl3W1ddaU5wllfjAkkX6Yqxcod4dIT90QyHYNvkyP
   JD5sdGKqDQbUL4uG1AADP4t0QK81UcGt+kb36b2RPRTT0IffDZ+boTuAV
   dsPP6fIzgtMlXOsppXYXK139pa8fY2GruLx/YK6CN31BDtc4HqkVb10EJ
   ySoES3BviKSkBEouF8VeG/y99X+o/V4rwwevhsFn8B5LgbKKHub0xXbP9
   g==;
X-CSE-ConnectionGUID: QvxUI8C6SWGSEiK7/iZ93A==
X-CSE-MsgGUID: hcv7GeivTFa4OEIp82kM8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72792850"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="72792850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 14:04:16 -0700
X-CSE-ConnectionGUID: Z3eJzr4zSESYyEZnX/gcvw==
X-CSE-MsgGUID: VXGxFW3aTHOlvl/QNclM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="177596470"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Sep 2025 14:04:15 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3L2a-0000fz-1t;
	Mon, 29 Sep 2025 21:04:12 +0000
Date: Tue, 30 Sep 2025 05:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos7870-a2corelte: enable display
 panel support
Message-ID: <202509300423.jtPmwAkD-lkp@intel.com>
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
In-Reply-To: <20250928-exynos7870-drm-dts-v3-5-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-5-bb7d8e570860@disroot.org>
TO: Kaustabh Chakraborty <kauschluss@disroot.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kaustabh Chakraborty <kauschluss@disroot.org>

Hi Kaustabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 262858079afde6d367ce3db183c74d8a43a0e83f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaustabh-Chakraborty/dt-bindings-samsung-exynos-sysreg-add-exynos7870-sysregs/20250929-015945
base:   262858079afde6d367ce3db183c74d8a43a0e83f
patch link:    https://lore.kernel.org/r/20250928-exynos7870-drm-dts-v3-5-bb7d8e570860%40disroot.org
patch subject: [PATCH v3 5/6] arm64: dts: exynos7870-a2corelte: enable display panel support
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250929 (https://download.01.org/0day-ci/archive/20250930/202509300423.jtPmwAkD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cd4c5280c73d42fd41819cc8927d00787ade88e0)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300423.jtPmwAkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509300423.jtPmwAkD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/exynos7870.dtsi:707.10-718.6: Warning (graph_child_address): /soc@0/dsi@14800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4101-panel']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
