Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999591DE3C0
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Mar 2025 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740851909; cv=none; b=G4dEQkNMaE5qpOEqATfvaUQTdVsjpocXIbcOSaXi5pSkzzofcUFSK8HkUQpnMZwgsoLYr8tke+A1mY45UoSXUQJZbh7AN+nScrqSRg7VDoPjvhOKkBgfIk8VgpRC14O70WklP2VdBk0UTAzPbSvscMsCry515I29PWCNLCvdDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740851909; c=relaxed/simple;
	bh=CPMeOqQjPI9IbaE2EFOaDtVp8PF1pIN0/qm3T3lZYV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eoiv6sMhJnj5h4MVQs7cPlndspdcx1pRMZS3TZoqU8NXgM4/rLjLs4zr++cKi6dT3sSfpo85NluVeEQlxRcL1y9V1ekGu/g6MCM6lqxoQHbs4dLpiNtxr3CstxGcaVHyXnBlIJZ09IaG9EqTZxDOkqZ5sDcnE3EMbjiypsG+lkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJF7Lbzs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJF7Lbzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740851908; x=1772387908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPMeOqQjPI9IbaE2EFOaDtVp8PF1pIN0/qm3T3lZYV8=;
  b=kJF7Lbzsp+b6xLMLAYwJA79CB+oqywQDwTUr0Q7GFfx5PNEF3rdUatlP
   51ofop24TWdCdLU+yJSTbf2SNKVVLfqNgbSscGzldKa334o7LCWgNgTzb
   /lcnGcsSYBIvq6M00quEGTlCjWtVZz2TzK8q3u+nkzoe9DSSbnnZdZqII
   4I9gg+7PdL3XRekyx6/0ix09Z3hBBWujfvAjjCEpp48zh4sb/p7zdfMCW
   eeT7pb1822be57F9MzOGCmbso88QVw1iY2bCRlVIrpuGXpayrNJudMdnW
   pcGcY3Z84K/J9UdfoiJT42q20sfOKasid+tEY1IG3dRqPXKUe/wSLImCQ
   g==;
X-CSE-ConnectionGUID: Bq5gyws8TcGuM7zThRCJsg==
X-CSE-MsgGUID: YuxVIKvaSb+JEzuE+wx1SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41685051"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="41685051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 09:58:27 -0800
X-CSE-ConnectionGUID: dK+CkzpNR/qcxNTPDH9mZA==
X-CSE-MsgGUID: sebI9ARyTh6Ekk25PZftnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="117373425"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2025 09:58:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toR6W-000GX8-07;
	Sat, 01 Mar 2025 17:58:24 +0000
Date: Sun, 2 Mar 2025 01:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
Message-ID: <202503020123.i6oEIOxT-lkp@intel.com>
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
In-Reply-To: <20250227170012.124768-2-marex@denx.de>
References: <20250227170012.124768-2-marex@denx.de>
TO: Marek Vasut <marex@denx.de>
TO: linux-arm-kernel@lists.infradead.org
CC: Marek Vasut <marex@denx.de>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Sebastian Reichel <sre@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Simona Vetter <simona@ffwll.ch>
CC: Steven Price <steven.price@arm.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: devicetree@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: imx@lists.linux.dev

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-reset-imx95-gpu-blk-ctrl-Document-Freescale-i-MX95-GPU-reset/20250228-011031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250227170012.124768-2-marex%40denx.de
patch subject: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU reset
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-052-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020123.i6oEIOxT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020123.i6oEIOxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503020123.i6oEIOxT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml: ignoring, error in schema: properties: compatible

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
