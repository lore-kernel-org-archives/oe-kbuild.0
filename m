Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66215E97
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757222060; cv=none; b=f8wh2je5d4bGocWu2wtxl9H+nw15exit0hTNXOvXILPD6KTNHklVg0wXJLsvf4oguVTYgkjov7LFLA+wIVrDj1wEK7XwvEfKt4c6XQuZ2386lwHRj78FP8lKYr4RxQXhDdp6IEbNhdl0mgS+YPaZga/xuK87m73wPlf3fdw8wig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757222060; c=relaxed/simple;
	bh=LrCIjIDHqZ6NUszT4RfNSGsesCR+6XqePQ3tQGDe6j4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKyMDZ9Yx72qoYRZfaUUmXAyHMR5yh/U9Jyn/JYL4hm8uv4+39QOsPevfLdp6ZrkhQmAlPYSDT4qUtoeGSxfPDYz0ywmuFweEcDgtcEvycIbaTLj2aU+cwNFesh1mupGl4wxGwGVOhdKvX1gWb6y6mtzEny0yPEfSRsXx+pQQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRl7LiQE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRl7LiQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757222058; x=1788758058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrCIjIDHqZ6NUszT4RfNSGsesCR+6XqePQ3tQGDe6j4=;
  b=BRl7LiQEfVszENylOSt51Le8Ghpr1UpVNXT9SBB/lo3Oyf3XCl1kCihn
   uHLQ2Uu6K84rZtHIh3FzyFPMfcvIDNAhRLSQSRw5g6fRj0rTJ2MTqeZ9b
   OAMLJvqNN1ByPmbX9zVL+NCuwIne/J+HfJSOsf5Tybc9cmoocHni5eVae
   C1nj1LrsIlMHokGiDzgcjF5ZULV2KA4XjCQ8beLHDcuaHPodTOHFsH5Nk
   E3zEhSFLYqLPznuo4c2g1GSZPO0kzx2TWYh3R4I+h7/uEm+4Z4Y4wIXpD
   Xrbo7YpIpMcLxgtoKvqyOrKpSbNkQk9jYe+AqOZ05HQA6+JJuSZ+Ufh3g
   A==;
X-CSE-ConnectionGUID: HJluMzcMScK3f4TRPJ9RwA==
X-CSE-MsgGUID: IJI6Nj9kTwaOD3oY20xswA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63341065"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63341065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 22:14:17 -0700
X-CSE-ConnectionGUID: WM0pECfrRnOXERtTcNfJmQ==
X-CSE-MsgGUID: olsW7bDJSn2a4RWSIQnxzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="177698453"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2025 22:14:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv7jB-000239-0D;
	Sun, 07 Sep 2025 05:14:13 +0000
Date: Sun, 7 Sep 2025 13:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the
 ROC-RK3588-RT
Message-ID: <202509071225.m8acuUvA-lkp@intel.com>
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
In-Reply-To: <20250905090115.718622-1-dkx@t-chip.com.cn>
References: <20250905090115.718622-1-dkx@t-chip.com.cn>
TO: Kaison Deng <dkx@t-chip.com.cn>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Wayne Chou <zxf@t-chip.com.cn>
CC: Quentin Schulz <quentin.schulz@cherry.de>
CC: Dragan Simic <dsimic@manjaro.org>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: FUKAUMI Naoki <naoki@radxa.com>
CC: Peter Robinson <pbrobinson@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Kaison Deng <dkx@t-chip.com.cn>

Hi Kaison,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6cc18e940db6731556843b7fa2924eb2efcef53f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaison-Deng/arm64-dts-rockchip-Add-devicetree-for-the-ROC-RK3588-RT/20250905-170318
base:   6cc18e940db6731556843b7fa2924eb2efcef53f
patch link:    https://lore.kernel.org/r/20250905090115.718622-1-dkx%40t-chip.com.cn
patch subject: [PATCH] arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250906 (https://download.01.org/0day-ci/archive/20250907/202509071225.m8acuUvA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509071225.m8acuUvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509071225.m8acuUvA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts:1047.7-1055.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: / (firefly,rk3588-roc-rt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['firefly,rk3588-roc-rt', 'rockchip,rk3588'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'firefly,rk3588-roc-rt' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
   	'firefly,rk3588-roc-rt' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
   	'ariaboard,photonicat' was expected
   	'armsom,sige1' was expected
   	'armsom,sige5' was expected
   	'armsom,sige7' was expected
--
   	'rockchip,px5' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3562' was expected
   	'rockchip,rk3588' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
   	'tsd,px30-cobra' was expected
   	'tsd,px30-pp1516' was expected
   	'tsd,rk3588-tiger' was expected
   	'xunlong,orangepi-3b' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /: failed to match any schema with compatible: ['firefly,rk3588-roc-rt', 'rockchip,rk3588']
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /npu@fdab0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /npu@fdac0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /npu@fdad0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /dp@fde50000: failed to match any schema with compatible: ['rockchip,rk3588-dp']
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /dp@fde60000: failed to match any schema with compatible: ['rockchip,rk3588-dp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
