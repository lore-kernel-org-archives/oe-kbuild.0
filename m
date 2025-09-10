Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3630AAD3
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489446; cv=none; b=eNNXeN69qCLQiaUbJhWaiUQloafNJOZzYQj8mptyna5Q7JmFgxDKnNdh94cGBagbA/8im3FzBeIQ003TZaDaMCP9OEY2AGRwvkkwggShNE9u53fTjzQmvXboStcEaHSod9oN4ijgYkY2WcuDuR54f6Z1ITPb96MTpeLwtEUekk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489446; c=relaxed/simple;
	bh=SSjFFQ+jvOJKAqGFOFpQGIxgEALSJdETQr3zTPPiVNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gShTzteKiGPaC0FDA1rV5WFyOkxTG1ZqtH3yb6mRM9rLkIUZ88QTCN4x9N/Rpu99xAWPIsesOqhlUpV9M1dPfx1ocppONg3joOmkMa02WploEu6i/blyfJLJECaqNAzsmNAStWS7x1XCwyNddW+XGODmEcoNF0AuxL8/bIPwl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxV00T/m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxV00T/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757489445; x=1789025445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSjFFQ+jvOJKAqGFOFpQGIxgEALSJdETQr3zTPPiVNQ=;
  b=YxV00T/mWHRvr5BF1qKVwrarRqWVyXm5XgtTnmppEXR1KCifkBi5zIJ3
   fbftpf5BQYO4ru+AD3rHtGQZyXQzIZZlg8l7Q2oNYsprRa+P3Kunsu4lQ
   xLx1jL683XYd7Qs5yR9tv/bBVQZRaFZKRsbCFYr8JtY/fcN9VeMgeGzg1
   +BCT32fFzZ1/hcIibkhegBxgKBesk6WZZPssGlis5s02pUn4HyqoT43al
   LeZm2Dq3amSRyuNx/ASrq7IYl5ZxsIh6p6MjoOYrY4dRfi8TJCZNqFjH2
   OkJjQ98RH1nbzNBhSORo+QsXApa505lzHa9uBDYzqSuLbFvlvAe9UJK2x
   g==;
X-CSE-ConnectionGUID: jfvTL9SATramc+0IJOwldA==
X-CSE-MsgGUID: hffgqwIEQgaDhfD52ZFRzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77244733"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="77244733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:30:45 -0700
X-CSE-ConnectionGUID: QKO7IwZES3e3rwUBPPZ+lQ==
X-CSE-MsgGUID: ylR5GzAVTGendmkqmnIoFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="173698086"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2025 00:30:44 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwFHt-0005e3-1q;
	Wed, 10 Sep 2025 07:30:41 +0000
Date: Wed, 10 Sep 2025 15:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/r8a78000-v1 4/4]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720):
 Unevaluated properties are not allowed ('l1-cache-controller-0',
 'l2-cache-controller-0' were unexpected)
Message-ID: <202509101511.R5JCH5H7-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a78000-v1
head:   2f45b9fe8dc3290f5a40ac68b84f754b9c5ca30b
commit: 2f45b9fe8dc3290f5a40ac68b84f754b9c5ca30b [4/4] arm64: renesas: Add R8A78000 Ironhide board code
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101511.R5JCH5H7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101511.R5JCH5H7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509101511.R5JCH5H7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720): Unevaluated properties are not allowed ('l1-cache-controller-0', 'l2-cache-controller-0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0 (cache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0 (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l1-cache-controller-0 (cache): Unevaluated properties are not allowed ('next-level-cache' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: l2-cache-controller-0 (cache): 'cache-level' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
