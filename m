Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4D31ED9F
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769056902; cv=none; b=jQaF23rCZMXX5PGCaEqHLJnVFeKnzW7Z7cMbf+/2DQVtI1AaMhsjChT0zd+wYRCBiovc92zac4Ufqb92WzPseVnKSGqoM1teWVNfPLnfUoe1azNia53eMK60Cb9uYguQktYRIdF73TLpQgY6C0GOCnK7rYYTlcAVOZ6X+M5++2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769056902; c=relaxed/simple;
	bh=amSom30ipYfUjcakq+RqCD9H4rCAUyr8efI7biv693M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Az1bG+AUDrXXDrUwsgBdpjoq09iReudebZjj66Qb6e8lB7PgLgu2pKt4WJnC/aV9IYl3L0/CnrL6a9wfqyxVaUxz5+vr5WPfXT5b+p6QR9xkxglShPddxTtlfkq44BqXlMm1Sk+PcgIFfxqVIMPeZ0Ak3jfdRFyNVv8mN/usECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXo5sepV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXo5sepV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769056901; x=1800592901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=amSom30ipYfUjcakq+RqCD9H4rCAUyr8efI7biv693M=;
  b=HXo5sepVpPUO6Axf+qviz0ew84x0g7uA0fu/g9B2WSF2pDy2tARNxgIs
   9cBBX5XzbHkwsu0lYB35a5MdWmSckq+hsz89ya78mzM77wdx2PkyhNuJ7
   mH8alU0wEsYkfhv3/mVCYTbPZ0RzrAtRmytWIidqSto3cB4Jjvbhuw1LJ
   987AcN0bapfvK5pU8bTAoiVV3E9qiBDfkCtkxFSScNc8hsgvoeXqF8i7C
   dpMuqKOOAjyWekKq7jH9G7qHlaVj8H6lqglnIjvS67UlNuzYr2qR0c6FW
   ne1g7MX6gZ//8En7cyrGP0jQ5MH2rLoZQPNu5yZSxURWPZTP7NNEagkgk
   Q==;
X-CSE-ConnectionGUID: VUkW7OQ4R5qb8D67U2Dy0Q==
X-CSE-MsgGUID: vApakSYDTua9qYzl9YLwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="92958126"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="92958126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:41:38 -0800
X-CSE-ConnectionGUID: CXZS6m8URgGZjs+mEpfFhA==
X-CSE-MsgGUID: CLMME7ClR6KnrNkkqi8S6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206692850"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jan 2026 20:41:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vimVh-00000000SR7-2LO3;
	Thu, 22 Jan 2026 04:41:33 +0000
Date: Thu, 22 Jan 2026 12:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
Message-ID: <202601221232.7AERi6Wa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:202:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: "Chen-Yu Tsai" <wens@kernel.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Ripard <mripard@kernel.org>
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-rtc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Junhui Liu <junhui.liu@pigmoral.tech>

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-rtc-sun6i-Add-Allwinner-A733-support/20260121-192151
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260121-a733-rtc-v1-7-d359437f23a7%40pigmoral.tech
patch subject: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-r133-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221232.7AERi6Wa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221232.7AERi6Wa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601221232.7AERi6Wa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:202:1: sparse: sparse: bad integer constant expression
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:202:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:203:1: sparse: sparse: bad integer constant expression
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:203:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:204:1: sparse: sparse: bad integer constant expression
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:204:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:204:1: sparse: sparse: bad integer constant expression
   drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c:204:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +202 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c

4d3467b15a1dcec Junhui Liu 2026-01-21  201  
4d3467b15a1dcec Junhui Liu 2026-01-21 @202  MODULE_IMPORT_NS("SUNXI_CCU");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
