Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11078205AB9
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181796; cv=none; b=jp19gCSZddTznurMIv/vuhrUZWyEQ24AvQmVCVfC2z14dxeHHMhUZPFcATZI5q3odkBdXjDgTb94i9Eck3ElS5Eb1ho7BspjSG459WHnhgc8FEgwWP57TWkOWaKffgyv46ohzV4qvNBc3OKhY9YvVjxrYumCvb+4dvRYMBroTik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181796; c=relaxed/simple;
	bh=yYixFNSPpZiCscq0ivfz3RlXna4HWE4Rd4QHRxEg4+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMRu4pcPI5L2K72FqpjjcSU70lXxgiiF8CVNcyIA8+X9AZSOQcfxnD/f+WF8Un+WpzcodRCluK34rCUMUeA9PaAAeN+XGK0qYlWlAJG8K9G5RLKVil/uyxa1SYHLLwMjZYqTY1IrMPyuNt+iOyrWdTBqwJH7hnauDxOm3nYkUw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxjLUNS6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxjLUNS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746181794; x=1777717794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yYixFNSPpZiCscq0ivfz3RlXna4HWE4Rd4QHRxEg4+I=;
  b=UxjLUNS6gNIZnpapjtK2HgUhZY+zC7/iHOJB4JIne4uXMkr/CzGoL9Ne
   vEyP9e1kwyeyXXxFMG9LYhsbtCsl+olWm9jWF9uMn39PwZY9ArN+4Ti8i
   nIGdccGx/WFDK36g9g0r01KIz3v/0QI/z0TVW5epwztzE8v6bWJpfyHMj
   ghOM5No3XOjf5K7DR3bmfk4hAg3XvkFAIa8JHTqBTJ8MMQXTANkG7qm7t
   VwJ5jkkdlSJF/L9oSJ0kjltiKTGGxvqXXKnMEXEOZXooajfPmdVgWN/ox
   KrVCbAWrS/rH4Gj9STfBmv+ga0OzI2gnCRUMF8xRFCxUyyFDIkHOLHqln
   w==;
X-CSE-ConnectionGUID: 230qGr0RTB+jIDqkqxoNrQ==
X-CSE-MsgGUID: MbfcNlFsTXm0Vt9r4Jp5xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47751029"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47751029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 03:29:53 -0700
X-CSE-ConnectionGUID: saUdd2DvTfC2SkGqccqnDQ==
X-CSE-MsgGUID: s0EKg1t+RiiTpUMxDTnW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139751499"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 May 2025 03:29:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAneQ-0004gX-1j;
	Fri, 02 May 2025 10:29:50 +0000
Date: Fri, 2 May 2025 18:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD
 card timeout
Message-ID: <202505021728.k6KXBSMu-lkp@intel.com>
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
In-Reply-To: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
References: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
TO: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
TO: krzk+dt@kernel.org
TO: tarang.raval@siliconsignals.io
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Himanshu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himanshu-Bhavani/arm64-dts-imx8mp-var-som-Fix-LDO5-shutdown-causing-SD-card-timeout/20250501-134717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250501054604.23368-1-himanshu.bhavani%40siliconsignals.io
patch subject: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021728.k6KXBSMu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021728.k6KXBSMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505021728.k6KXBSMu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: regulator-usdhc2-vqmmc (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: regulator-usdhc2-vqmmc (regulator-gpio): Unevaluated properties are not allowed ('gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
