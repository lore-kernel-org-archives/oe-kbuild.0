Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E033EBF31
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 20:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201486; cv=none; b=d06hp4vwmVqkLJoW9hPH3NBV+stiOfz0eyrXcjCLfXvAX7eVu9iSoC6UQHu09SwOjeJT4hIio8svqmbcuE0lPVLKxmedDfphdi5Yvtw1psdesXSenFn6F6us04iFIlEhyd2jBx0L7UkbDh7NAN55baVmOptBvjXSOC3u/SHS3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201486; c=relaxed/simple;
	bh=HJ86e1aBtylWmk4WI04vdomX0JRzSb7jste/ZDxOELE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4JKF2b5qiXcWfXNB1onT9NmwLqxUrKL37A/54KOG1VgVx0AqovmV4gvjmAQnzm9GaE78yerdwR6XJy/vY5B77J3ZVc5b1s2WbXkhzCvbYTmdKOrY0+gvagyL5Ovral37In29K9UK1vU0Qe4bXxSqwyyiKiFqgjmJnUuzIVDIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aY2bSqDf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY2bSqDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769201485; x=1800737485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJ86e1aBtylWmk4WI04vdomX0JRzSb7jste/ZDxOELE=;
  b=aY2bSqDfxGRuUICXPVe+56BCSNuTu3+WvcQsl/EFdNhxUnNgzLoQygDR
   alz5sUvFa6Ho7bRWEfeUREWw2ni/XGC+N0oAoqr4s2m9uYm4ccz67V4J2
   cTWYVOLc32TuqNJEofOZaIIwYMvtG1absr4h9fLuf0rNop3EqYxlF9qZO
   8TgkPc78ITB8ytyck1FhOxEAb5RZroHNh2MXSJHln5KDpEZ7jB2Z/g0QU
   biBJShbkSy32qG1Swhuixs2NIX4cMvXWRee8Vi0PHcyrI2nfso8iH0OvW
   CbU59I/xhREC4a19xNpGVMzg0hn3nP7FEHWbSOT54ws3gsyg/A4rAHfMF
   w==;
X-CSE-ConnectionGUID: O2yabDdaSMqO90or0+dwxg==
X-CSE-MsgGUID: 2IfE/SF+Rw60CUFC57j5pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81571865"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81571865"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 12:51:24 -0800
X-CSE-ConnectionGUID: AlPhbGNhRfimRaPqzXxbxw==
X-CSE-MsgGUID: rUaEgnACQ8uh7k4LhJDdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211575253"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 12:51:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjO7k-00000000USM-2KTY;
	Fri, 23 Jan 2026 20:51:20 +0000
Date: Sat, 24 Jan 2026 04:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 5/5] clk: amlogic: Add A5 clock peripherals controller
 driver
Message-ID: <202601240405.xRri6yc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/meson/a5-peripherals.c:778:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-a5-clk-v6-5-6d3bbf0ec1ea@amlogic.com>
References: <20260123-a5-clk-v6-5-6d3bbf0ec1ea@amlogic.com>
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
patch link:    https://lore.kernel.org/r/20260123-a5-clk-v6-5-6d3bbf0ec1ea%40amlogic.com
patch subject: [PATCH v6 5/5] clk: amlogic: Add A5 clock peripherals controller driver
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-r121-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240405.xRri6yc6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240405.xRri6yc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240405.xRri6yc6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/meson/a5-peripherals.c:778:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-peripherals.c:778:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-peripherals.c:779:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-peripherals.c:779:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-peripherals.c:780:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-peripherals.c:780:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-peripherals.c:780:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-peripherals.c:780:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/clk/meson/a5-peripherals.c:781:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/a5-peripherals.c:781:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +778 drivers/clk/meson/a5-peripherals.c

1a4d0bd930beb7 Chuan Liu 2026-01-23  777  
1a4d0bd930beb7 Chuan Liu 2026-01-23 @778  MODULE_DESCRIPTION("Amlogic A5 Peripherals Clock Controller driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
