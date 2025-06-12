Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AED28F1
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 02:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749696543; cv=none; b=JP24AYVKzzluNshBaaH2L/J+o3QsdF2ypLVfcIVCUGvdKnXPSbMtqXDfQMoPpcrByacMM7Lt9SDZrzi67/XitRM//OFsPkNNICkTOPoFyJhuBHwtPPNdskmUWrW7MK+y/UdBN0y0Ixldtw50kTjrLFpXdORoxpQclTKOOMFYj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749696543; c=relaxed/simple;
	bh=62tLAw+wt14ReB42b/1L3g9A/7eu7Rwnr3xoQcsXVxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NDo/sKOKkeBG6w1a1F/eNUfexHBwLnEagqwgDEy5RXDJAGMt2PEoIxfNgN5H6dDrbyMAm6Sp6fd79u/CK4HlWL0KHRgImNNjnfYPvPL2N6Ze4NWMpQW702o6uiRFGOZLgycTZHlYVqHmHndUoOaL++F5ySHTgb+u4xQwoFBhDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY/Nk/04; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY/Nk/04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749696541; x=1781232541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62tLAw+wt14ReB42b/1L3g9A/7eu7Rwnr3xoQcsXVxQ=;
  b=nY/Nk/04TAqVoyVkVAqnFfeqh8Le3Yz4hGrGD/X6roixjhC4+pwcRFZm
   oeIhR6yEXTEgFINKkgca0DARblDl1B92e3Gb4v42E/BQtoOLfFaLaLXfO
   mRTNkHzubyIBsMhRWbLqBJNGWYgAKse2U/eNLVSIbMylL3r98P0qh8+hX
   kX5W9Ok4WYaZGeNe8VFQEoXFOAI/gkRfrSwAST09+prn3mArjKfMZ/AtD
   qw1u4OWMM9WGvr6jKNPmGsmpBxt86XGTs4Lpy8iwJZibYLs0ds6WLvSeV
   DVuhCi0y7OK8PL6j0FwdJ+ToqdlsbnEJRMiDowpkuLk0aIFPz5BFKRhdb
   A==;
X-CSE-ConnectionGUID: xQoMMXkQR1qv7dHs8oYp2w==
X-CSE-MsgGUID: SOuwQOUeTE6xb4Gn57Vx5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51848815"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51848815"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 19:49:01 -0700
X-CSE-ConnectionGUID: OM75WsnfQSKZWc4M/duLaw==
X-CSE-MsgGUID: nrfjE6z4Rr+IZJ71JPXvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147371002"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 19:49:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPXzt-000B2w-1v;
	Thu, 12 Jun 2025 02:48:57 +0000
Date: Thu, 12 Jun 2025 10:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] net: Add new iccnet driver
Message-ID: <202506121049.bVPJrQof-lkp@intel.com>
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
In-Reply-To: <20250611155402.1260634-1-khalid.mughal@intel.com>
References: <20250611155402.1260634-1-khalid.mughal@intel.com>
TO: Khalid Mughal <khalid.mughal@intel.com>
TO: intel-wired-lan@lists.osuosl.org
CC: netdev@vger.kernel.org
CC: Khalid Mughal <khalid.mughal@intel.com>
CC: Sridhar Samudrala <sridhar.samudrala@intel.com>

Hi Khalid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master horms-ipvs/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Mughal/net-Add-new-iccnet-driver/20250611-235621
base:   net/main
patch link:    https://lore.kernel.org/r/20250611155402.1260634-1-khalid.mughal%40intel.com
patch subject: [PATCH] net: Add new iccnet driver
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-051-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121049.bVPJrQof-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121049.bVPJrQof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506121049.bVPJrQof-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Documentation/devicetree/bindings/net/intel,iccnet.yaml: rxring-offset: missing type definition
>> Documentation/devicetree/bindings/net/intel,iccnet.yaml: txring-offset: missing type definition
>> Documentation/devicetree/bindings/net/intel,iccnet.yaml: ipc-reg: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
