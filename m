Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9929917A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839015; cv=none; b=nEuyn7Uj0OKymPCjwTSZ8eSmVJuidexNobfj7OWfkc5rCrYkjABTNNBNX0jutIDDJBfa3y/VwuGQTw6+szIeuasAv0JPTy7Sn9A0sV9WYoz5rcPxvECU2P3Yq68l8jEzakW22fDNBxm1MAKzS8QNqrlyE5T9GLbmafB0qRODo4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839015; c=relaxed/simple;
	bh=trABoEnhEVMw0DCsm1p2DyUVfSfJWvkhVz588PL698g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hF4aLZFg5PVrq0N6gNDxq1f0f4agDj0OFnaXTBeWCSVlsr9wQKxzYWxkQWHrXKO/5wJLIxUZlBifs8bN2Z6w2JSHxsWs/9waW1zbaIbZ+4x0Z5mdxmPMZ0j/WuovGoqhXKVeSeU0a8wghV9ZvyfMW0kw4FAukN6hX/s52gC/1CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9LHrAHZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9LHrAHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765839012; x=1797375012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trABoEnhEVMw0DCsm1p2DyUVfSfJWvkhVz588PL698g=;
  b=e9LHrAHZg+MRCg69xRuZnsKBTfKbETFufxwc0rFBJrNLxIHQ0Rg3My60
   xMquHwkNRYCM/Ai/IrIUke2xVvPMcwzP9qPKdaohuWioD2EBQNDjb99jQ
   3b+CA+qxekEZsxxkzhGAccaQ0VHFuTCz6tn/5maH/Kaby7NZZri+tmU5N
   nmU7VKn7vd33D60qFkm1eGAODbNzjosJJzFdkf5QfoVyDProdbZPNE4K9
   UZJpPuU2R198HQ5yz12Tw5Ck/V/hXb21nv/aoUD487DxVOh1aIOd8Xing
   4UyPSri6wl3ZCGUZwT1sFEa2An1KzpSn/pQHNj5xk0KDB9024fYuenrE2
   Q==;
X-CSE-ConnectionGUID: PJpqfBrPSRadqqfg0V+abw==
X-CSE-MsgGUID: GhncAUq8Sv6fVF1jllNQKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67787300"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67787300"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 14:50:12 -0800
X-CSE-ConnectionGUID: qWcCf0vsSwaVPbCsUNp1Ew==
X-CSE-MsgGUID: gJdGmwqVSNmE1HonhfuE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="198109433"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Dec 2025 14:50:11 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVHOL-000000000t7-00bd;
	Mon, 15 Dec 2025 22:50:09 +0000
Date: Tue, 16 Dec 2025 06:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 12/21] clk: mediatek: Add MT8189 i2c clock support
Message-ID: <202512160633.IhGrJRKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/mediatek/clk-mt8189-iic.c:117:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215034944.2973003-13-irving-ch.lin@mediatek.com>
References: <20251215034944.2973003-13-irving-ch.lin@mediatek.com>
TO: "irving.ch.lin" <irving-ch.lin@mediatek.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: netdev@vger.kernel.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: sirius.wang@mediatek.com
CC: vince-wl.liu@mediatek.com
CC: jh.hsu@mediatek.com
CC: irving-ch.lin@mediatek.com

Hi irving.ch.lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251215]
[cannot apply to clk/clk-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/irving-ch-lin/dt-bindings-clock-mediatek-Add-MT8189-clock-definitions/20251215-120357
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215034944.2973003-13-irving-ch.lin%40mediatek.com
patch subject: [PATCH v4 12/21] clk: mediatek: Add MT8189 i2c clock support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: nios2-randconfig-r111-20251216 (https://download.01.org/0day-ci/archive/20251216/202512160633.IhGrJRKs-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160633.IhGrJRKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160633.IhGrJRKs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-mt8189-iic.c:117:1: sparse: sparse: bad integer constant expression
   drivers/clk/mediatek/clk-mt8189-iic.c:117:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/mediatek/clk-mt8189-iic.c:118:1: sparse: sparse: bad integer constant expression
   drivers/clk/mediatek/clk-mt8189-iic.c:118:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/mediatek/clk-mt8189-iic.c:118:1: sparse: sparse: bad integer constant expression
   drivers/clk/mediatek/clk-mt8189-iic.c:118:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +117 drivers/clk/mediatek/clk-mt8189-iic.c

f8bd45d004cc54 Irving-CH Lin 2025-12-15  115  
f8bd45d004cc54 Irving-CH Lin 2025-12-15  116  module_platform_driver(clk_mt8189_iic_drv);
f8bd45d004cc54 Irving-CH Lin 2025-12-15 @117  MODULE_DESCRIPTION("MediaTek MT8189 iic clocks driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
