Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC462609CC
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197583; cv=none; b=Hsg3yh430lZ/1FaqVR0fLw9S9NM4yKex4yHrXoewR6Y/b6dgMxz2o255n8zgoYdZf+Oj7PhnHdE5VKj2YsGQPs1k9+armM/+WwMVfxHahG6uP1UKptSh+Pn5OizealklOSqVWbxRk5JPfkpjd59ZWLISJjp1hlRndWjaq9BnXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197583; c=relaxed/simple;
	bh=7KvOXKrLnFl+dSEpJ1Vzq1TqqYZQw2py5stR5WBYfAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mKFb31U3/YAOTcy507uPEXpYltecEtHvpKRFcmC1g8pelRlGAyiYX+vX0RwFkdcqhPnC4cPDzzQJowHsanpnIEvsz9ixVT/PTbn2BQr2jwg/KLShoek5Fd5gnNHJYKJYHzNqZMVLQkBtMvCdToZSb+wFrfgubyoPymqXPVOU5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWZLzyW2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWZLzyW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769197583; x=1800733583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KvOXKrLnFl+dSEpJ1Vzq1TqqYZQw2py5stR5WBYfAA=;
  b=bWZLzyW2fOjtA+8oISvYrR5nkpTrNqqa8IXdO2/WOqEanyAPIwBn+MSo
   kSLSaJznuQ0Ni9jQuXCSeDQsocCWwzDjjk8UsGIVVWnP/a2fKH864ErG1
   iSuI8yL1eUQl2poa1NNRzoR6Omu0ciBYERljag5v0uP5PzxpndiDCsdEm
   BaN2l+Z3tsf0D5ATECCMfPNMMQl6t8RDKnqMiF9iY92ZbG/lr1MCQAEKO
   5klKrU/ns5Zf+Wv4ABcCpckd1x41ONEDq8zbsyVcSjOaSexchcW02CafS
   z9oRXcy5NNRkwcLV3VYR8Bf9oSoDQtMvEl5ODWmrge9lWVjAjdsa8blca
   Q==;
X-CSE-ConnectionGUID: K+iyMe4PQwKrB/Uf0GHS7Q==
X-CSE-MsgGUID: X5LQRkeRTnaAI7N/cWvUSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74087687"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74087687"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 11:46:22 -0800
X-CSE-ConnectionGUID: 4NtFyPHkTOO6p5bSPFKl6A==
X-CSE-MsgGUID: S//iAyYFSfCMQ0LgEnGmvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207161762"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jan 2026 11:46:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjN6o-00000000UOO-0FcX;
	Fri, 23 Jan 2026 19:46:18 +0000
Date: Sat, 24 Jan 2026 03:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 4/5] clk: amlogic: Add A5 PLL clock controller driver
Message-ID: <202601240324.eP4o4B3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/meson/a5-pll.c:475:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-a5-clk-v6-4-6d3bbf0ec1ea@amlogic.com>
References: <20260123-a5-clk-v6-4-6d3bbf0ec1ea@amlogic.com>
TO: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
TO: Chuan Liu <chuan.liu@amlogic.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Xianwei Zhao <xianwei.zhao@amlogic.com>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-amlogic@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org

Hi Chuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A5-SCMI-clock-controller-support/20260123-135746
base:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
patch link:    https://lore.kernel.org/r/20260123-a5-clk-v6-4-6d3bbf0ec1ea%40amlogic.com
patch subject: [PATCH v6 4/5] clk: amlogic: Add A5 PLL clock controller driver
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-r121-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240324.eP4o4B3m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240324.eP4o4B3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240324.eP4o4B3m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/meson/a5-pll.c:475:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-pll.c:475:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-pll.c:476:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-pll.c:476:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-pll.c:477:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-pll.c:477:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-pll.c:477:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-pll.c:477:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-pll.c:478:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-pll.c:478:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +475 drivers/clk/meson/a5-pll.c

a0e21583d7e90e Chuan Liu 2026-01-23  474  
a0e21583d7e90e Chuan Liu 2026-01-23 @475  MODULE_DESCRIPTION("Amlogic A5 PLL Clock Controller driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
