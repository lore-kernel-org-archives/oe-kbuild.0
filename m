Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6E2F1FF1
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767289324; cv=none; b=CHn3cEEg73L52ZLB5S2WfIpLOaRb7mSkvsj3XL0aAdtHHVQ1Kd3YROSbT/ohOL9/Ol5KB01WDyJEiAxhQR20IK8Cpi96R5v1HPu/N6hRw1dgL6VDqSxzDAMopxG4q9BETn6RcBoDde77/goYxaDfhjU1tur3JJtuxrZEEIgV4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767289324; c=relaxed/simple;
	bh=cKNFvWX7fuPkp4RI52rsbBxti9ouJhJ703wJB1C5hqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mtle0K5p6n6J5diySsUJY2+SFyAExxiSleuuA0GSz5Z5aOPnXHwtrjaksjaZ4I7E7o/6FQtMt1VOHye8v00kkldIr9HTSJ9RlRy6yyLZTdbbFeG+8S/OjSb9DR1KQKZ5yE/Izq9SL2OyBiUwlVBxheviK02ozAevPfN0FTQJGWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSJ1XHqf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSJ1XHqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767289322; x=1798825322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKNFvWX7fuPkp4RI52rsbBxti9ouJhJ703wJB1C5hqQ=;
  b=nSJ1XHqf84AdAwcxNo2bdV3mGjkB4sRm9c5UPb3H1noIoUIz85S0NDsz
   8wI0hMmr0EDGlFhpOuIGOg6B+bvhPSQaLzl5UZqUbU84rcEEvtjByEzou
   Eyks8MS2/DxX2DnY5faER1m4EROr3boHsjtfgs5cSk9JmL62duwE9sqpz
   Cdf+/jW2JHN2WB51DNR37pRUQ5MRxQtlRO6qsi7VgEzVg430Wt0ox9/Gx
   7R8bAbv13mpHyZx50OBf2pyM9gCJmrAu6aUElGLe45AFUcXJniy/nNpxl
   WeNmAtebKNvM33bnNQR29Rv+MzbX9S8KdIzhUFeJiLTmX+atZFHChGpDA
   Q==;
X-CSE-ConnectionGUID: hTo3NmDCQkWR1v9LVwGT4A==
X-CSE-MsgGUID: KqHa/NUnQ5Gyv5WFfZqWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72444789"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="72444789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 09:42:01 -0800
X-CSE-ConnectionGUID: fmxm8y3aRcm6Fx2WYzrbew==
X-CSE-MsgGUID: Qj1xFPOmQq6uzAr6l44I1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201558252"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jan 2026 09:42:00 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbMgQ-000000000Iz-0TaM;
	Thu, 01 Jan 2026 17:41:58 +0000
Date: Thu, 1 Jan 2026 18:41:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec
 HD702E
Message-ID: <202601011834.LvX8xfZf-lkp@intel.com>
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
In-Reply-To: <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
References: <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
TO: Robin Murphy <robin.murphy@arm.com>
TO: heiko@sntech.de
TO: neil.armstrong@linaro.org
TO: dianders@chromium.org
TO: thierry.reding@gmail.com
TO: sam@ravnborg.org
CC: jesszhan0024@gmail.com
CC: dri-devel@lists.freedesktop.org
CC: linux-rockchip@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org

Hi Robin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/dt-bindings-display-panel-Move-FriendlyElec-HD702E-to-eDP/20251231-012249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy%40arm.com
patch subject: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011834.LvX8xfZf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011834.LvX8xfZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601011834.LvX8xfZf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: dp@ff970000 (rockchip,rk3399-edp): aux-bus: 'edp-panel' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: dp@ff970000 (rockchip,rk3399-edp): aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: aux-bus: 'edp-panel' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
