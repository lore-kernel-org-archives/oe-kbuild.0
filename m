Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8F194A5A
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702928; cv=none; b=ULiYeOMyLivi7Kqmu7wL9zX3t1u987yfBzOKzKtYcB14+03w2O5t6t3HRYVuuHivKt+KQKJPPpAglelk2w7E/C2g1ozCSQO8zXi7t58D11YUr6UBo5VZpLMqDcgVT7sYiVlJjM8Uh7he2Pj+7M6Xy4VSqxRNo4vpV4M6Fzm6TqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702928; c=relaxed/simple;
	bh=LadL94l74+0YlWPliDiY2OIoYAxLAKelx+eJg/LUBa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o91haWol4i/sfmxIDE9gtMxbnQ1/T6vlpFfvoCUfXJcvvG5UTtq+S4fkbZf1dEqe9aKJ9KpukZY9rIbnTW/Zj/LoETXvs7J+5NWiKjh4Ro0xFNVGUVSES+oyoGFkt7FIy6iam/iN9dwGMZzSumOOrqQoC0GLOolMlhSpEyeMreg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntfovnXP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntfovnXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732702926; x=1764238926;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LadL94l74+0YlWPliDiY2OIoYAxLAKelx+eJg/LUBa4=;
  b=ntfovnXPBo4E8ghpStYxUdqgLbECuytWdbHoB3FTA68Z9BOOOT/aSBoT
   xr6OeigIFOPbJuccmQCFBy3kG5oN+cRRsWAHjztaO7rfXpcJIJNhp8PHl
   ph6r27FUsTjdEIgtanlf1VtULNTG9MX2XXqTKLjE0Ezc+A/y/Z7xecYpN
   eENV5hcT5m3adS8oF8zh+WJwNQJLxaPt+NLwxLVidorlXxnKk/05iuUWb
   XVJLIT+qr3CoYW2ZIFckAgpToeVThPRzrirLhjrwvWDou6jcijEMBgq3N
   4qnt8GtlTsNSULVRQ6L56NttSoCT2iMAQOsU8OUY8w58pWZ2AwIGQyj6y
   w==;
X-CSE-ConnectionGUID: VG2rLyjaQruInmwTvC2EGg==
X-CSE-MsgGUID: OU39FbSERE+QGIml7ChlWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36565303"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36565303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 02:22:06 -0800
X-CSE-ConnectionGUID: fikkV99nRq+kCmVhvbNccA==
X-CSE-MsgGUID: S1ezrpFYQ3S+zyfglUcG8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92220373"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2024 02:22:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGFBK-0007uN-2C;
	Wed, 27 Nov 2024 10:22:02 +0000
Date: Wed, 27 Nov 2024 18:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 5/5] ARM: dts: suniv: f1c100s: Add support for DMA
Message-ID: <202411271802.oIlmnXO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241122161128.2619172-6-csokas.bence@prolan.hu>
References: <20241122161128.2619172-6-csokas.bence@prolan.hu>
TO: "Csókás, Bence" <csokas.bence@prolan.hu>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-sunxi@lists.linux.dev
TO: linux-kernel@vger.kernel.org
CC: Mesih Kilinc <mesihkilinc@gmail.com>
CC: "Csókás, Bence" <csokas.bence@prolan.hu>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: "Chen-Yu Tsai" <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>

Hi Bence,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next vkoul-dmaengine/next arm/for-next arm/fixes linus/master v6.12 next-20241126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cs-k-s-Bence/dma-engine-sun4i-Add-a-quirk-to-support-different-chips/20241125-104046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20241122161128.2619172-6-csokas.bence%40prolan.hu
patch subject: [PATCH v6 5/5] ARM: dts: suniv: f1c100s: Add support for DMA
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241127/202411271802.oIlmnXO9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271802.oIlmnXO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411271802.oIlmnXO9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dtb: dma-controller@1c02000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/allwinner,sun4i-a10-dma.yaml#
--
>> arch/arm/boot/dts/allwinner/suniv-f1c200s-lctech-pi.dtb: dma-controller@1c02000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/allwinner,sun4i-a10-dma.yaml#
--
>> arch/arm/boot/dts/allwinner/suniv-f1c200s-popstick-v1.1.dtb: dma-controller@1c02000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/allwinner,sun4i-a10-dma.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
