Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E02BEC23
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785062013; cv=none; b=KFXWLP5Pfbwtwy/2C8EH3qydj92G0i87uoMPSC/iEpd6W5TrPxwGrM5o6Q4JKno4dAm/g7upPu2j9KaLvpxVyHwaolByPkOkIllQ0ZuvPb6xYXp9xyWXa0oL0DQb+kzWh2Qh3ro/sCMmo31sB614axRpK0ttdOToYYuvkvPdgRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785062013; c=relaxed/simple;
	bh=po7dtt3OEUFWJqwblqzEtIKt+AbWL+ILysHdn8juBoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cQb8TTWdkGLx6VYS7QUnKus0q+YWA57OzTPdW4QQzpSnZt4zvpOHidMXOkvKcZXEhMpW5IwJycvt7hWhmCM3kVVXvA3oN5RInP4yqG3Sm/RhVu00chYip7ctYKoEWotx9Qbrg++CpbgqfzXvR7BFp57bOwce6+AimeAzdUI+QLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddgJ3NuJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddgJ3NuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785062011; x=1816598011;
  h=date:from:to:cc:subject:message-id;
  bh=po7dtt3OEUFWJqwblqzEtIKt+AbWL+ILysHdn8juBoE=;
  b=ddgJ3NuJDJSixh7Z/zUYojLo8I+n30paloP5CNKykl6oiHsT4x+SnfbC
   odJOf2H2Vrcg02zqPPfrpSt9r46dqkQdKeu8Jh2DpA+cJWZYKP5l3z2cB
   fDXkQXcump87Lx5BlMcqm3oqJFnMS9A1FvuNwCRnbS9SL1keuemY5LSy6
   HO/kZYUkzdMlMhBBFk4t+4MJ95oGwdIgKBfTuKacni0fYKn9o9dOLKmik
   iXQpN+d08TOgnPdvkWplK+Pdj6hGdmWSyryXllUVf5wmyYSMY7lJ9oNFt
   CBbRdSiIrjsiBi8ydY2R69K4ElKTTHv6XWa6XUZnQouItt6Qu02jT7vKI
   A==;
X-CSE-ConnectionGUID: 7vq1X59+QYGyghwollZrhw==
X-CSE-MsgGUID: xbyf2zqWTEuMEJb69GTCQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96318351"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="96318351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 03:33:30 -0700
X-CSE-ConnectionGUID: 8o5hueI/RJ246HwikHagLA==
X-CSE-MsgGUID: 1uNOD4GITRamwcRq17UQKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="282473616"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jul 2026 03:33:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnwAh-000000001QA-1XPt;
	Sun, 26 Jul 2026 10:33:27 +0000
Date: Sun, 26 Jul 2026 12:33:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 16/21]
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1
 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match
 '^ethernet-phy(@[a-f0-9]+)?$'
Message-ID: <202607261250.DwdhgV0b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Yixun Lan <dlan@kernel.org>
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Yixun Lan <dlan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git dt-for-next
head:   31efde747b5e5d2c185e06d872a9ef9b87f505ac
commit: 7c6f6c5de4c093671b555dd928a2706d5bc9e4b4 [16/21] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
:::::: branch date: 2 hours ago
:::::: commit date: 22 hours ago
config: riscv-randconfig-2051-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261250.DwdhgV0b-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261250.DwdhgV0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607261250.DwdhgV0b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): compatible: ['ethernet-phy-id001c.c916', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
