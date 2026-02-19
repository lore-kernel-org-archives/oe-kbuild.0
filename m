Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18282ECE91
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496682; cv=none; b=RsQX7CnPCAbP3InjgQEXvnyNQ9EzPWeD8i3UB7d3lS2WCSbRtdOlIbOEr9p3PmPXQwsKH6KfztTBxdbvBxIWL1CVq2XfHogy4OthsFurDj7EMiqpEQr/gmo/RsrPaxa7L73w9dgBTZ0EaWhSM8FMnKn6hJl2E5QGIowxQyAYOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496682; c=relaxed/simple;
	bh=dMyzoGvslpu3UTV+O+AirQWd59IAl6+WttuQexDOLVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUFzRT4bghRncUGKTSR+O2so6i70tSs6wh1FgXM0KMEdpzHobEfPgCdB1TY3pWgw7y+EoqYAiWi+lVwO7d8018ZxsM7/wLaz2Ir/8clfz6rRScDzjOe37odrSLL564+1LvkSGknio3gjxEKg62tPRNZ6VbXwIb+bnh+fo9/aGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkTGcIII; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkTGcIII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771496680; x=1803032680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMyzoGvslpu3UTV+O+AirQWd59IAl6+WttuQexDOLVA=;
  b=dkTGcIIIwfu6KvppeWvaYcjkgyXx2M5Rfruv6SymQ+3hBgSxeZ54YJg/
   bIhfTCuMJ9kHgC4zV9aCYvno3HAJX6O4rQHBhDYF4TgsgUoq+aaz1Kq7p
   1f35mVETenUE40myS+T5tlEHYKqsgs4jpd5W9uoFqBIEBr5hgwzFJfnG2
   s5uBuQsv68veVNgZCFf9RLgbkgnx21BlKPRns9ngT8IR9SVH3EiaJGAaz
   L/ngOINVg/GV1Y4LpyTs54DViapZRVrkcZ8KJd4s6ewn93uPDdVEouuTl
   kY6UTN1Rkdui57xx5gurSE/gLvvLl/ilS4aPPB4t2ogOBifjCYUtPBnBJ
   g==;
X-CSE-ConnectionGUID: dPveYRiQS+u1S9Wr+Ks2wQ==
X-CSE-MsgGUID: CTEimGXpSpCBPrQG5OZjpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83297462"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="83297462"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 02:24:40 -0800
X-CSE-ConnectionGUID: MqhrNPbkT7ahGVUwn8N94w==
X-CSE-MsgGUID: 27E+MqAHSByvPFCu/BXwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="214583180"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 02:24:39 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt1D2-000000003xZ-0per;
	Thu, 19 Feb 2026 10:24:36 +0000
Date: Thu, 19 Feb 2026 11:24:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/7] arm64: dts: amlogic: Add EMMC for T7 khadas VIM4
Message-ID: <202602191136.AmriN9O4-lkp@intel.com>
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
In-Reply-To: <20260218102124.35669-1-linux-kernel-dev@aliel.fr>
References: <20260218102124.35669-1-linux-kernel-dev@aliel.fr>
TO: Ronald Claveau <linux-kernel-dev@aliel.fr>
TO: linux-amlogic@lists.infradead.org
CC: Ronald Claveau <linux-kernel-dev@aliel.fr>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ronald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master next-20260218]
[cannot apply to robh/for-next v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ronald-Claveau/dt-bindings-clk-meson-Add-Amlogic-T7-fix-pll-support/20260218-183657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260218102124.35669-1-linux-kernel-dev%40aliel.fr
patch subject: [PATCH 7/7] arm64: dts: amlogic: Add EMMC for T7 khadas VIM4
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2052-20260218 (https://download.01.org/0day-ci/archive/20260219/202602191136.AmriN9O4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191136.AmriN9O4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602191136.AmriN9O4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:8: 'fdiv7' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:9: 'hifi' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names: ['xtal', 'fdiv2', 'fdiv2p5', 'fdiv3', 'fdiv4', 'fdiv5', 'hifi', 'mpll2', 'mpll3', 'gp0'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clocks: [[12], [13, 3], [13, 5], [13, 7], [13, 9], [13, 11], [14, 1], [15, 6], [15, 8], [16, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@8040 (amlogic,t7-fpll): clock-names:0: 'in0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: mmc@8c000 (amlogic,meson-axg-mmc): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
