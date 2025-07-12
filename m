Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9317993
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 02:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752286788; cv=none; b=ao4SgX+aGJ9N81W87DCxfT99NIxg1NrnPc8GIciq1cu0fjNW9MLNwydhESpXzo8zeJ/MfC1xPHS0mfUvTyTv+h9lVCQUrTZhUn8eTAw0XyTIikYwLttR6/2Z8Q5Kuo9bY2vnq5+ixlBGVGRw3wpkmqqMOmLLVqudwZ18Ip9ExCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752286788; c=relaxed/simple;
	bh=5Hj8x0PmfcCU/Mb10xtw4QpDMkntus+WtguaIE6qbCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqQnq82qcvF/5wgvPCtvNC1+gbdM0DsGAir/l0+WNkLlEtKjcrGf3/3PzqSasnveQE2PWArBQEo+FlH34nnDrtjgk2IBkDI03ksN3fGt7wMuBvySV3f+c3M2Sy0OkamqlqGqVXBml5izheZlT8vBJhRrJBeNXolOxhvCENn8x/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSQW6WfW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSQW6WfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752286787; x=1783822787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Hj8x0PmfcCU/Mb10xtw4QpDMkntus+WtguaIE6qbCo=;
  b=VSQW6WfWcOTH3faEurMFxIheOzV/7PfnKWrR68l5nhIR93ZPVYHtw/c6
   djNQQzYkcOUsuMrziDuROqNc8z46DR70TGUi9aLj4vHqTtwfCxg1tJFVy
   brJzFblnT7tsRfS9nXjlCsWC5+KHvEkqBFBr6KSPca0iVixZDxodBoml7
   TZGptVlQDHaI0BOPztLuQOQx8g4PmfnNF+OcjgxtA7HftPTn2PZAFd/Je
   SLXtv8blbRggO2ipNHZDmzJNLU2SvJ5xUzJSo/yYR5tCK177yqFspnMod
   a4wbXu8X7qmXxeq9FNZuvSrQosHb4FQKoup6rhPcnFpo3qsE/1G1afYOD
   A==;
X-CSE-ConnectionGUID: fQPwYLg8RkOUgAYKa1Pqpw==
X-CSE-MsgGUID: pPUlBc1+RsqQGYL4p5wvtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53801795"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="53801795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 19:19:46 -0700
X-CSE-ConnectionGUID: KPEOxzikQQm4ToA+1+nXsg==
X-CSE-MsgGUID: qMC71Rp4Sx+eC9jdKEnXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="156833672"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2025 19:19:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaPq2-0006zn-2M;
	Sat, 12 Jul 2025 02:19:42 +0000
Date: Sat, 12 Jul 2025 10:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] phy: dw-dphy-rx: Add dt bindings for Synopsys MIPI
 D-PHY RX
Message-ID: <202507121032.KsCQDI5A-lkp@intel.com>
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
In-Reply-To: <20250709221724.1276428-2-kpoduval@lab126.com>
References: <20250709221724.1276428-2-kpoduval@lab126.com>
TO: Karthik Poduval <kpoduval@lab126.com>
TO: jyxiong@amazon.com
TO: miguel.lopes@synopsys.com
TO: anishkmr@amazon.com
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-phy@lists.infradead.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
CC: Karthik Poduval <kpoduval@lab126.com>

Hi Karthik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthik-Poduval/phy-dw-dphy-rx-Add-dt-bindings-for-Synopsys-MIPI-D-PHY-RX/20250710-062001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250709221724.1276428-2-kpoduval%40lab126.com
patch subject: [PATCH 2/2] phy: dw-dphy-rx: Add dt bindings for Synopsys MIPI D-PHY RX
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-051-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121032.KsCQDI5A-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121032.KsCQDI5A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507121032.KsCQDI5A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.yaml: ignoring, error in schema: properties: reg

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
