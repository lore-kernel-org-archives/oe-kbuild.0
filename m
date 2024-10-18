Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9C202F91
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283347; cv=none; b=h+WKjklaMJgLddUwdJFMLAMHPsZAHVcPEkxlPtG1tVxPyxwT2C3Y7ol22505yQE3xdIJq0NPK32qZDHcO8PYLh4nT8/48r7ZEsrGLE+c7jZJXQmw1+xQ5Frxoh5ZPzcdafzXUi6/lZG6m/XsgW9dQDTleoJwnPC73kDzV4GD6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283347; c=relaxed/simple;
	bh=3b9j609Ouh1G1GSZfKvIZEW02fJ/s28KWWnWrjCzN28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=io97HS70YCsL76d7a5rUsI/3JpjCh+t7SoLbtkqgKzajcWblRm5Jl1oFtKWuDRHTXO4W+wZiuHEWoeqoodPLNO2ag42Jy5yrB9C0r48fQQ8iHR3Pm+wzk81Cu8XgfY5yapuGa+/1ODf1ff5sMP0+N9kKhwksLhodpUFydFB+Glg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItSvowTh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItSvowTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729283343; x=1760819343;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3b9j609Ouh1G1GSZfKvIZEW02fJ/s28KWWnWrjCzN28=;
  b=ItSvowTh6dop18GaI9PKVWK9Qb/h79d7nS1ac5caII4+Urzw8InJMzii
   XnjqXjgINTEA6LmRhEqdJobo0FWioLau0WHvs1kKUDjubNLN0unmT7okP
   gd14//O3HMr8kJHkd2ERjFT8Qx5g1jGUnzNQfrgpsBGGGX1KyqRgbpYw5
   7p0ZDFowtrIM3QLWCx7SuXlfvriHkZQeEvBLy/2MnuR3ntHr0Sj51yf4/
   SJ7/HDIW+5oLHEg7SkGO2gLoom1aTMWYjUVj8DN7MyvjUjblYNr1ovvks
   nu+JdSVNKDlQnATRXO7cZNzVt+UspmTa7jKDzYXKyYfv4GtM2aa2DJxGG
   Q==;
X-CSE-ConnectionGUID: SWBSZCHeSH+H8MEWJAj/hA==
X-CSE-MsgGUID: iHrKGcEtTVet2eeXWdXb4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32514171"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32514171"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 13:29:02 -0700
X-CSE-ConnectionGUID: FoL3/uo6SMiP8UCGrZEXtA==
X-CSE-MsgGUID: uOTi19dMQoGqib9x7qk8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109793999"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 13:29:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1tal-000OHh-0X;
	Fri, 18 Oct 2024 20:28:59 +0000
Date: Sat, 19 Oct 2024 04:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/ci20.dtb: efuse@d0: Unevaluated
 properties are not allowed ('eth-mac-addr@22' was unexpected)
Message-ID: <202410190447.ITm5JtPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rafał Miłecki" <rafal@milecki.pl>
CC: Rob Herring <robh@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b04ae0f45168973edb658ac2385045ac13c5aca7
commit: c5330723d5a0c77299a38a46e5611a584e887b87 dt-bindings: nvmem: move deprecated cells binding to its own file
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-052-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190447.ITm5JtPk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190447.ITm5JtPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410190447.ITm5JtPk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000: $nodename:0: 'nemc@13410000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-nemc', 'simple-mfd'] is too long
   	'ingenic,jz4725b-nemc' was expected
   	'ingenic,jz4740-nemc' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000: 'efuse@d0' does not match any of the regexes: '.*@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml#
>> arch/mips/boot/dts/ingenic/ci20.dtb: efuse@d0: Unevaluated properties are not allowed ('eth-mac-addr@22' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: dm9000@6: $nodename:0: 'dm9000@6' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/davicom,dm9000.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: dm9000@6: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/davicom,dm9000.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: dma@13420000: $nodename:0: 'dma@13420000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/ingenic,dma.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: /bch@134d0000: failed to match any schema with compatible: ['ingenic,jz4780-bch']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
