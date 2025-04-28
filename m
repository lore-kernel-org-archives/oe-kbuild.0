Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3811953A1
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889582; cv=none; b=vEN4q/y/KvjMEq04moyVV6t9eTpsTJV1JW8hQKcvB/0cYz7A0kuBB9N/xuBAw/xO4xz09EQ9uRKlFeGQBMUTZpIb2Nd7M67JXTTuhpjA6hK8G9ajVdOOM2xB1YndrFdYJjWv1FgD44/TJCmT3AqTMWhT9FV2UFAoA+25rukgFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889582; c=relaxed/simple;
	bh=Fd52qdDZNT6l0JhPCEFfRH/jPgdnnrMybquj3biiUig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQ6I6x60mK3bxuQM12n+q0DILNC6TXlzlwHljDt7Mo1Z5m7r98Pfcn4E6bKza0ZSeeloVC1s96fYUrVQi5H5XgGT4HjOP40t9IgSVZa/97413OV53F8jwOrcaMVfL/8jCJyaeQCMvPrT0QLwyi2ruUW1vJjdN0xlaupSUgpvR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP29Ahy9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP29Ahy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889580; x=1777425580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fd52qdDZNT6l0JhPCEFfRH/jPgdnnrMybquj3biiUig=;
  b=ZP29Ahy973B2BWiLiPyNh6YDUGJkU21uQIXgayIZihfuFFQniPelsg7u
   IE9gV8HjMyvA2pIR23jV2c0zHLXS4ZAQVJutBRvBTkOwnmCo1lYVXR52f
   QiSDfv+fgOsDlq9liiy7Fg3X5HyFfUhA3rKTz6f9RgCZGbkiGihwZh4Uv
   O5HPPPf11jcJ6OOcoR3qvc0+ac7iQLCOmzmoiglLkeJckgqO9GfGRwNdN
   TORoiZ/HXakvZXmayjpicAPuYs7WjSrLLGLJiSyzP5p2rqF++iJgv+e0f
   XAQftLvElUwPrxLlmBWb7xEltsjBEo/C3hb1hF/OFkWiPAHozt+8Xo/wm
   w==;
X-CSE-ConnectionGUID: 2LqEQJumQ9OLGMqwiHW6/g==
X-CSE-MsgGUID: mMvNn8tjRUSBX94hPLmG7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51313345"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51313345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:39 -0700
X-CSE-ConnectionGUID: okYfOX7vT7StrVLpnpVBtw==
X-CSE-MsgGUID: J/y63NjQSRuvJcIxF6a89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164637885"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 18:19:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdI-0000Lt-0N;
	Tue, 29 Apr 2025 01:19:36 +0000
Date: Tue, 29 Apr 2025 02:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb:
 i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match
 '^i2c(@.+|-[a-z0-9]+)?$'
Message-ID: <202504290246.GOpYV0HH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 0ce1d34678e5d214746ee4887f9f7714c39e331f riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290246.GOpYV0HH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290246.GOpYV0HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290246.GOpYV0HH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: syscon@3000000 (allwinner,sun20i-d1-system-control): 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@54' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
