Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364702BD03
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 02:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756003625; cv=none; b=oV1wPQbfvKyLFaxzyNEvZqngA0eEvmglR0eDXf3puNAuJsGQ5wzveCJAmFAuHYE8koQDC1vDHjVbZF/M8kThu/kxBCFfDgs51ds6LPYhbJ6raivKOwCsefzEHazyDA/j59S9Zpo/uDtwT0tmnyoiEf6zQ6AHtkgGzOKTH4KkK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756003625; c=relaxed/simple;
	bh=kpA7TiOcaZnG4MA0gOHsq1Ts+Io6IZrLPZTBpXzZVgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2Vg4Glcag41+44lOHG/wfcjOLpiF0l6/ZdQG22bIX+diKGpgB28bNam5CbZq4fqC0/OrJiz5z1sAyA0zql8A2ffaxjb8OlJ4cKnhxOsF1yVeKh5BDRJ3/cD4Np51SvFILhJQm3tZnfPCJlW5Va8O4MIIi8V6nFnvjcABmfZWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvBZ32Jr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvBZ32Jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756003624; x=1787539624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpA7TiOcaZnG4MA0gOHsq1Ts+Io6IZrLPZTBpXzZVgo=;
  b=XvBZ32JrxJw4mNJyCPiwuyyPQssTV/oCldRVzDzEqhBeMW0j3vlEtqvc
   asYnSprdwlfGcjKYksXUmRa2gju6oHHTqwsAV3hPUiaq94hhNQ8yYK49c
   nZ1mQg3OiAeZ2em6Drw8n6TLdsRHIVajqDE/YTTRkYXxNlQgldPV5deII
   4C9qGAjMyDQrx7946SO1G5uAXdhHSl0elCiKUxXvdNa7uLb4OZGhjTRfx
   WD6u1jpheCy5VFRjPOZ3LO8ceWpOd2Shtm4JvDi/okIZkqKc9pswd0T2K
   fRIxZkLU4CAu+XKJIyhaQ7wk4zT9B3ucrlB9YIeBReVDP+VW/WfmsuLDW
   A==;
X-CSE-ConnectionGUID: wH4ZNHFERZqLzcIsqaVz0Q==
X-CSE-MsgGUID: V6CpcDH0RTmWmNbgw8VYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58119472"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58119472"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 19:47:03 -0700
X-CSE-ConnectionGUID: WfB5ILXvRc6pBT5Llg574A==
X-CSE-MsgGUID: KChQx6wrR22M9UuPMuRYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192672932"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 19:47:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq0l1-000MiR-2k;
	Sun, 24 Aug 2025 02:46:59 +0000
Date: Sun, 24 Aug 2025 10:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 13/14] dt-bindings: dma: dma350: Support ARM DMA-250
Message-ID: <202508241020.sMhMcQ9K-lkp@intel.com>
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
In-Reply-To: <20250823154009.25992-14-jszhang@kernel.org>
References: <20250823154009.25992-14-jszhang@kernel.org>
TO: Jisheng Zhang <jszhang@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-14-jszhang%40kernel.org
patch subject: [PATCH 13/14] dt-bindings: dma: dma350: Support ARM DMA-250
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-051-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241020.sMhMcQ9K-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241020.sMhMcQ9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508241020.sMhMcQ9K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/dma/arm,dma-350.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
