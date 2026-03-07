Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62351DE3B7
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772896635; cv=none; b=fcwH8yDL+P0YRxPG1ZjKfQw57kj6MTSu8zXf3l1Jy4xC1FF+7rtPF6YJ2nJI8i89jgctdWa4Woea/u4N87/nU1GKcszh5gA5EbPxlh2I/v8poKGDJQ28ffmQ2d4oMOA2L1WcGGBzigN1W4gW4W+PF2+0E5HOrYI8W6pCdJ911vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772896635; c=relaxed/simple;
	bh=bqnIFURb2/FpFFtqTjdotIzbayFKCHqpugjMCuZIL0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8lFeb3wJG0J/74Nej/LL5HyBUCuDEbqNMu0DniWZjhkWEb4Mu4ZcOAegFxGANeMFNyCAFpyHPsVpQWgnfvA3EZyCJMNu9td6GH9max6oYv1MSw5OwaNtjw/a1L09Z4awNqhX5rOoobuXp4Ys5RH1Ct2EbQanMPoty+S9Xok4KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFnNtk5i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFnNtk5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772896633; x=1804432633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bqnIFURb2/FpFFtqTjdotIzbayFKCHqpugjMCuZIL0Q=;
  b=CFnNtk5iCXf+Z2g1vVcHgTkeaVqHQrTOyCFt6Hw796PnDqvZ/Tz+tOp/
   qymNKL5tqu2VkmY96ZxbS/sxAUQYOGIUCYGCrJUNoF1iSAR87X7K+M83x
   w0gZT3lQXnrjiT+4Hm9GMKqQT7649K59CSdyMFyYEggrX84OsGc00Qsm4
   uMjyuiFXXMqcOU5JB8hwTYEYrlnwucMWUvZH717FbGX5qqp1NkOTGOH94
   h29Xo5X8XL9qsoPpko2dcGPZxZfuUqf4FKDHSOKFfZCUdKfG872zhFo5K
   8P9cFIWTDo4SutnDUbx4FmJGPd5qDm2IMMCVEqz/x+ousreLxe66jt6V1
   A==;
X-CSE-ConnectionGUID: J+TaAVr4SyG4woWo2A7xcw==
X-CSE-MsgGUID: /Bn0ioGdRjmVb8uiAaU2ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73886155"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73886155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 07:17:12 -0800
X-CSE-ConnectionGUID: Y25c1ZZeR7GowrJPqtDSkQ==
X-CSE-MsgGUID: bB8BJdeUTlGNtX+Q0c6bRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="215906963"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2026 07:17:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vytOu-000000002VV-0uuK;
	Sat, 07 Mar 2026 15:17:08 +0000
Date: Sat, 7 Mar 2026 16:16:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add shaping nodes for rk3576
Message-ID: <202603071602.C6BmMe6z-lkp@intel.com>
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
In-Reply-To: <1772782832-216867-4-git-send-email-shawn.lin@rock-chips.com>
References: <1772782832-216867-4-git-send-email-shawn.lin@rock-chips.com>
TO: Shawn Lin <shawn.lin@rock-chips.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: linux-pm@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Shawn Lin <shawn.lin@rock-chips.com>

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next krzk/for-next krzk-dt/for-next linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/dt-bindings-power-rockchip-Add-pm_shaping-support/20260306-162446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1772782832-216867-4-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH 3/3] arm64: dts: rockchip: Add shaping nodes for rk3576
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2051-20260306 (https://download.01.org/0day-ci/archive/20260307/202603071602.C6BmMe6z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071602.C6BmMe6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071602.C6BmMe6z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1306.30-1328.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f05088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f06088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f08188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f08208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f0a108: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f0a188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f0c088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f0f088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f10288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f10308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f10388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f10408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f10488: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f12908: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f12988: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f13288: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f13308: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f13388: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f13408: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f20088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f21088: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f22188: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/shaping@27f22208: failed to match any schema with compatible: ['rockchip,rk3576-shaping', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
