Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927719755B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771400060; cv=none; b=QO2dBH5SHgzlqwDxSmW96sHK/gxtLgakrq7C5Oc4CSg7Hej/EWBBrAKNmXLJZvQ5Boh7xUo4N2oAIUUNOYOxLdek1rYMt5j03p6ENyQyhStict/0lVErxJwNF7NJE84ZGs7KTSuO9APcFx5o0H0N+T15nygXKyz2Z0JOcWNvxtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771400060; c=relaxed/simple;
	bh=+VKKbm93GrhVxz6GR4sSjYGz5IlEYCsm9dfJaczfGUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCDshmw2c0TOe94DNIjOC/YYmkMfJFm80riOIGWQmpQerPNYdRzdXzvSNXhmU9NJvY5RJ008i3LqBwnVxAyFk/TrEe5NZb4BRfwT6ppLdWyHc15iCiFAz5AZNIdsBmGGQxioaOrqEEikWqhPqj4BBYbEdrFMluzwR1CWmpbcdt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7gZ/LDl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7gZ/LDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771400058; x=1802936058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VKKbm93GrhVxz6GR4sSjYGz5IlEYCsm9dfJaczfGUk=;
  b=l7gZ/LDlZXRSxqvJkD0U6J0ezj4Jg2/NNa2Pqyxg0ggU67/V/a/jWl4m
   iKOZ9vY5wjZEPAzf0FMFN4aSSeCsicg4xc29LaSo1NByhKm8z4J9eBvtQ
   bFxKq977wvxzWbWfrHod2cO+ciJIby9VPQFxgEf6q/HdnSrAKkiMPLW+t
   zHxNA9fyGm8RHFpWROZKES/LmP5LDjg0ZFfBESx067GZWVCzLq+YYg4TC
   eumdM73Q4HUxJMi5pOl0p4UnfUBdSf+XgX1uFQ4OKzVi6eJ6VEN+xfX21
   oKsWJCoQQL1ZeIorZ7zgedjnlfA0qM+gW97gA0ynln3iDXvCnLNrHPV0E
   A==;
X-CSE-ConnectionGUID: KI8fc4sEQ36sMAhICUB76g==
X-CSE-MsgGUID: bYDuzSqCRwqO9ivEWlsMyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72519775"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72519775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 23:34:18 -0800
X-CSE-ConnectionGUID: 82UWbCNSQFWlhF3OmxgEqg==
X-CSE-MsgGUID: YlrdEo+QT6W/YlH43Rm/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="242975239"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2026 23:34:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsc4d-000000003XN-1Hf6;
	Wed, 18 Feb 2026 07:34:15 +0000
Date: Wed, 18 Feb 2026 08:33:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make
 reset optional
Message-ID: <202602180808.ngAym04C-lkp@intel.com>
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
In-Reply-To: <20260217173457.18628-3-akhilrajeev@nvidia.com>
References: <20260217173457.18628-3-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>
TO: dmaengine@vger.kernel.org
TO: linux-tegra@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: vkoul@kernel.org
CC: Frank.Li@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: thierry.reding@gmail.com
CC: jonathanh@nvidia.com
CC: p.zabel@pengutronix.de
CC: Akhil R <akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next tegra/for-next linus/master v6.19 next-20260217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-dma-nvidia-tegra186-gpc-dma-Add-iommu-map-property/20260218-014114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260217173457.18628-3-akhilrajeev%40nvidia.com
patch subject: [PATCH 2/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make reset optional
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: microblaze-randconfig-2051-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180808.ngAym04C-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180808.ngAym04C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602180808.ngAym04C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml: maintainers:0: 'Frank Li <Frank Li@nxp.com>' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml: maintainers:2: 'Seung-Woo Kim <sw0312.kim@samsung.com' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml: maintainers:0: 'Christopher Ruehl chris.ruehl@gtsys.com.hk' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml: allOf:1: 'then' is a dependency of 'if'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml: allOf:1:if: 'if' is a dependency of 'then'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
   Documentation/devicetree/bindings/input/syna,rmi4.yaml: maintainers:1: 'Matthias Schiffer <matthias.schiffer@ew.tq-group.com' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
