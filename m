Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1C13126DA
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774734671; cv=none; b=suU7nD062C4ppXjkdlvJsL/m3rSCema0r+2Yuf4V8/1N/WQlIRVbKZTvKWVW7yQDCehmm/+S/rpeRwdVlmroinlJdBZgWPrPX9AroAHJ8wvh1d2198kq79CzQTPNtbemFv6zaJAGdXVypbMJyy6YfngBYmkHy1qYGXtAxueDyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774734671; c=relaxed/simple;
	bh=zbKELklwMlE45qwzj2ajDDaIsYVF4zGt3BtGU9Ca0o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mj+b1eGx1JdAwtDiaXV91YEXpQOb3tvdffD5q1UX0hgjP2Lk+eisfn4/6CG+MNXK+DbWeUsmCxEMXvVeWXzcF7OeYgVLStudGLT5Huty4P3iUnS6rBRQmkDVM6MUvruTRAvqY53gk45D/ENSx4wFVhSJaTnS/U0zQjMOq7tBrcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXCzSS/s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXCzSS/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774734670; x=1806270670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbKELklwMlE45qwzj2ajDDaIsYVF4zGt3BtGU9Ca0o4=;
  b=cXCzSS/sHUUI+WjZVBOjr6Q7ZQ2yGG3V1zuI+gWQF4nHcY5bfU4cUWXg
   2vwlsbFVRDG2v7Xxij81GXIpH/gYNo6wjwdxGpYUsQcnA6l4k8CtDM74g
   i4BVEZ4LDLorlxrzZHo6/+uzpPT4/P5lB6ASdM4OIsg026i011P1WJfSP
   wplusZrBfVl3CTt3bLPJiuSnRIlelGu/4Eix7wkZ1SCs8rE7MMIbOFaXf
   b22rGA4GdWLMI9ef9Q+U/2EhRW9+Siatvk7A9wILW+2Ou1sqJJNakEnWk
   EilW9X+m/pWYFQ68563dfcnfX8upExH/mvUHyklGXy6G/gD9m+xqfKnMJ
   g==;
X-CSE-ConnectionGUID: 19tr8xuGQkqgLs79jNyINw==
X-CSE-MsgGUID: Fws/TwrjThmXesOUK9VjlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74806249"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="74806249"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 14:51:09 -0700
X-CSE-ConnectionGUID: 2ueGK8uyTR2fDY6Ve8zy7g==
X-CSE-MsgGUID: d6S0nrudQcW2QSbQaySxLQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2026 14:51:08 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6bYf-000000007kj-3qR0;
	Sat, 28 Mar 2026 21:51:05 +0000
Date: Sat, 28 Mar 2026 22:50:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Add AP6275P wireless support
 for Khadas Edge 2L
Message-ID: <202603282237.SC4XPIst-lkp@intel.com>
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
In-Reply-To: <20260325054614.1497147-3-gray.huang@wesion.com>
References: <20260325054614.1497147-3-gray.huang@wesion.com>
TO: Gray Huang <gray.huang@wesion.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: heiko@sntech.de
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: nick@khadas.com
CC: Gray Huang <gray.huang@wesion.com>

Hi Gray,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on next-20260327]
[cannot apply to linus/master v7.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gray-Huang/arm64-dts-rockchip-Add-PMIC-support-for-Khadas-Edge-2L/20260328-091622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20260325054614.1497147-3-gray.huang%40wesion.com
patch subject: [PATCH 2/6] arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2051-20260328 (https://download.01.org/0day-ci/archive/20260328/202603282237.SC4XPIst-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282237.SC4XPIst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603282237.SC4XPIst-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3576-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	'rockchip,rk3576-spdif' is not one of ['rockchip,rk3588-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/spdif-tx@2a680000: failed to match any schema with compatible: ['rockchip,rk3576-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: hym8563@51 (haoyu,hym8563): $nodename:0: 'hym8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
