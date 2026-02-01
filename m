Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A71F4180
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769913808; cv=none; b=oL2IoqXv27d+00MNz55PECrX+RX4FKzAwXAx/9REYQGNDnfD2hfWMAhnPtQgyUvPjo5TE5gVVCiESX0aRI+1IzkdiWyZoS5jVkVIUfCNGfs7FpngBC09LLp3A62gwUBDIkc1qckiW93JstEgJwAvmfU+tZFjXsumqytHQzir79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769913808; c=relaxed/simple;
	bh=UA0A3mY+AQVfF0k/qwhIZnRE46gIeuHxO1LGdP3a+y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOwJM5V02TlKEDyuR/kZkocyisZah79mrsmrAOgBJ7glayHtZsxoF2hMlf5DYpEGpvpHccVOGn2RRNcX8xM2vyeGg5wWbAdg1EQkxae0emC97/JXBLkC6NkV42PhARHz0dZ5EKH1jPr5pWyjsWABzJe4crD2XivNWeDZxpvsAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYPqPN2L; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYPqPN2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769913807; x=1801449807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UA0A3mY+AQVfF0k/qwhIZnRE46gIeuHxO1LGdP3a+y8=;
  b=JYPqPN2LACx9aSP0OAN+VMNDRprqW+NW2+qVCvZKfbHwpGv5oHfZUu/Z
   L0MhHjUKjdTLS1Dfgq8fo1Q/Zs/aZRfRrCBUQ7FiBL2s3+k1Xf5s98onJ
   FtEPX9xr48agvlBvyE9RJO2aTWYoqICl4Ll4y74njzkDPJmUoLbTgjqBo
   MRLM6/UzLW+0qm1tzsOYwaUryWYwNxtszYMcg5tNpHX1yK/T9Jd69cdnj
   U3XcPDEU5M/hz8YtiRRSPStrCQzWb3Gfa0OfFSHPjOuSje6329749NHlG
   J8LMJdmOZ1EW+GbSvv9f6IJB5Pz/xKKU2wq/oe9sHyZirIjFbrh5682d0
   w==;
X-CSE-ConnectionGUID: vnVC27fRRpiMwACFSTIjnw==
X-CSE-MsgGUID: uZvqYMaqTLq/44mA+8W3bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71277562"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71277562"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 18:43:27 -0800
X-CSE-ConnectionGUID: S7EgHUp7Sq6/dTt3cEpglg==
X-CSE-MsgGUID: GwIafamtSMqVxOlcCkeo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209268573"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Jan 2026 18:43:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmNQo-000000002tp-1vtR;
	Sun, 01 Feb 2026 02:43:22 +0000
Date: Sun, 1 Feb 2026 03:43:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: media: Add bindings for dim2 compatible
 strings.
Message-ID: <202602010321.0ycYXCDy-lkp@intel.com>
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
In-Reply-To: <20260130141442.139640-1-harshdaniel66356@gmail.com>
References: <20260130141442.139640-1-harshdaniel66356@gmail.com>
TO: harshdaniel66356@gmail.com
TO: parthiban.veerasooran@microchip.com
TO: christian.gromm@microchip.com
TO: gregkh@linuxfoundation.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-staging@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Harsh Daniel <harshdaniel66356@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/harshdaniel66356-gmail-com/dt-bindings-media-Add-bindings-for-dim2-compatible-strings/20260130-221618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260130141442.139640-1-harshdaniel66356%40gmail.com
patch subject: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010321.0ycYXCDy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010321.0ycYXCDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602010321.0ycYXCDy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/fsl,imx6q-mlb150.yaml: properties:clock-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const': 'mlb'}, {'const': 'pll8_mlb'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
