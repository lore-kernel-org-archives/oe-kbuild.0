Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633038332B
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 22:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539938; cv=none; b=WdmcXpYVGTF7i03giE/IvbbLLliUa6tkhAE3EhpO5GyKM7tqOsrDHZ7WVa2jxxByoTSYwUbXzq/fIwKbVfZND8JvAzSC/rZEvL1tna/YASYR4v89g7IcFy/odn7AudxTV3lXMEkdihNiCZXcwkHFDVfr6lAyTHW5ekqbJOKFnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539938; c=relaxed/simple;
	bh=qtmELz9+yW8AOr/hmjgH3UExfrpGOI8OMTcEgnmgXHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q1HPHJKi3iY4Bf3Pnu4c6R+5LzPsEOFJky8UYDddRUp8LMjLobqdb0lGppOvsrsXp0jl73BnQjPHT3zhQhOr3QSL3bWKU/bHkytuKsL/XMdcLOcm8XTCDOsXl3w0qgCvATegDdNtLVGHWQPWbV5CR4VoLNpvrzuDi8Pq6KS48lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNr2r+ne; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNr2r+ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778539937; x=1810075937;
  h=date:from:to:cc:subject:message-id;
  bh=qtmELz9+yW8AOr/hmjgH3UExfrpGOI8OMTcEgnmgXHQ=;
  b=FNr2r+neUwJcRD65HWYdh675wF9fMu1St6QUDV69ROjp92MnoPT+eJ0y
   OU8FC1J6DMIbcgaPyt1rBhY5xuiPZbTezo4aKaO//Kpm/ckEFiOe+/tii
   mUc4GpkdOaY/+jwhwksN+HDEgdP3Dlaw/TRXeZ8yGwPZu3uFmr7gG6EkN
   3RatAFfC8T7ePApcvKAtatyl6McnopUF4Jz8jovgne3s7ALK/ps1VNr0w
   51T8wVzBY+91sOOCa1z28wjVIMOQ3+PnU1n336KZraUBTq7vK1IilphCD
   SqEbwKk+/0GLEAZ8d4woiep7S5QOdvn5AH6eeGfgG70EhXtGjj+/PwYG1
   Q==;
X-CSE-ConnectionGUID: T0QJNfjCQPeXSN7F73UhOw==
X-CSE-MsgGUID: 0JY30IP1SDW1w3qcsQh6IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82003283"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="82003283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 15:52:16 -0700
X-CSE-ConnectionGUID: s80Us8hpQOepyBBSK0yI2A==
X-CSE-MsgGUID: Ij4j4CjGSdentgbfJaY5zQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 May 2026 15:52:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMZTw-0000000084H-3tkF;
	Mon, 11 May 2026 22:52:12 +0000
Date: Tue, 12 May 2026 00:51:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/dt-for-7.2 2/4]
 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb:
 /soc/hstimer@3008000: failed to match any schema with compatible:
 ['allwinner,sun20i-d1-hstimer']
Message-ID: <202605120025.XWqjOxZK-lkp@intel.com>
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
TO: Michal Piekos <michal.piekos@mmpsystems.pl>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-7.2
head:   cb8eba42e31854c07f7891a0c9955e7ae8be2d93
commit: 003ff312269cc9defdd6b12462b1e89f4c9423d7 [2/4] riscv: dts: allwinner: d1s-t113: add hstimer node
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-2051-20260511 (https://download.01.org/0day-ci/archive/20260512/202605120025.XWqjOxZK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120025.XWqjOxZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605120025.XWqjOxZK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
