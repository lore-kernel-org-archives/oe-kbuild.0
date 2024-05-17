Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB661FC8
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715970404; cv=none; b=YSvGHj/SUrE2SUrJrFiyThnSTkKsfwEsEyoDuZ5oSsRFdQz8fUHmSefBiT9P+QY6GoVDn3lUJ4wtmLzkoSSWYaCwQRkY02F78CHMApmysjyI0UlRw2g62pD21tNry5reqHHP2bt4e9M+baY8aTJ5TJsARCic7Ah7E+fdRO34Cro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715970404; c=relaxed/simple;
	bh=gmv66FqmKYjwGhsx6yyQGpXmP0uknYgCFk5av/c+tf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/K7B7TdgcSgClBRcoA9shl8j4F4n+miMOfUmFHjhdboWZ5TN/Jye+scXcaCvoDzMryRAhplOp7n3O1GmhZ7+Nhj6oOnQeNJgAFgwuzVMCAd7/dksxMpU01gLAgahP4EHv9O84GuIKMsKOWYBV5PBPmhFdtSKYyeXAZUuTwyiy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5IiIUKh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5IiIUKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715970403; x=1747506403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gmv66FqmKYjwGhsx6yyQGpXmP0uknYgCFk5av/c+tf4=;
  b=b5IiIUKhT6mu/Z8BDXImfybwCZiZzk5I7rU8HX6lVxYvKxWX/ZTJHoYx
   skHlvzwsO0K9Mm5n9uKbQizrtPlHFZJP7mutiAJckEyiuxD1UryKgvEJA
   NuN2W9V1KWF+9EoL+Yxdrv/cPbMK9OB4Typmh/MZSEjvshaxNxyEgw8Kl
   0FibcTaAxXDhgFQAP3fxXzVKQveHuYKxyNAF9322q4hP+Ueqq1mIORgKD
   3MqoLcZJQmC/YVE4JA4P/EpSlKL12ID86xByoBkwTEndg6M+He2X59rsa
   gUu6W80DDX/8UmYIU1vPjPqaaHq91P0aDjFjT050c8pv32B5cReYKwgzr
   g==;
X-CSE-ConnectionGUID: AX6Mht8HSwquCaWFiya+CA==
X-CSE-MsgGUID: fhp//rKITciwGjgsRsN4KQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15997103"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="15997103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 11:26:43 -0700
X-CSE-ConnectionGUID: E0Zz+VF5SWOiswn6NAHVvg==
X-CSE-MsgGUID: CVHH+JYRT/K/AUaDG4AR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="36608646"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2024 11:26:42 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s82Hu-00010u-2y;
	Fri, 17 May 2024 18:26:38 +0000
Date: Sat, 18 May 2024 02:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/tegra/dp.c:738:22-33: opportunity for
 str_plural(link -> lanes)
Message-ID: <202405180249.j8XWqlXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Christian König" <christian.koenig@amd.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff2632d7d08edc11e8bd0629e9fcfebab25c78b4
commit: f75d19827b731c6f24930ef77e5a46cf2242bc68 drm/tegra: Allow compile test on !ARM v2
date:   1 year, 1 month ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-r052-20240517 (https://download.01.org/0day-ci/archive/20240518/202405180249.j8XWqlXt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405180249.j8XWqlXt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tegra/dp.c:738:22-33: opportunity for str_plural(link -> lanes)
   drivers/gpu/drm/tegra/dp.c:794:22-33: opportunity for str_plural(link -> lanes)
--
>> drivers/gpu/drm/tegra/sor.c:939:11-16: opportunity for str_plural(lanes)

vim +738 drivers/gpu/drm/tegra/dp.c

078c445733c1e8 Thierry Reding 2015-07-07  731  
078c445733c1e8 Thierry Reding 2015-07-07  732  static int drm_dp_link_train_full(struct drm_dp_link *link)
078c445733c1e8 Thierry Reding 2015-07-07  733  {
078c445733c1e8 Thierry Reding 2015-07-07  734  	int err;
078c445733c1e8 Thierry Reding 2015-07-07  735  
078c445733c1e8 Thierry Reding 2015-07-07  736  retry:
078c445733c1e8 Thierry Reding 2015-07-07  737  	DRM_DEBUG_KMS("full-training link: %u lane%s at %u MHz\n",
078c445733c1e8 Thierry Reding 2015-07-07 @738  		      link->lanes, (link->lanes > 1) ? "s" : "",
078c445733c1e8 Thierry Reding 2015-07-07  739  		      link->rate / 100);
078c445733c1e8 Thierry Reding 2015-07-07  740  
078c445733c1e8 Thierry Reding 2015-07-07  741  	err = drm_dp_link_configure(link->aux, link);
078c445733c1e8 Thierry Reding 2015-07-07  742  	if (err < 0) {
078c445733c1e8 Thierry Reding 2015-07-07  743  		DRM_ERROR("failed to configure DP link: %d\n", err);
078c445733c1e8 Thierry Reding 2015-07-07  744  		return err;
078c445733c1e8 Thierry Reding 2015-07-07  745  	}
078c445733c1e8 Thierry Reding 2015-07-07  746  
078c445733c1e8 Thierry Reding 2015-07-07  747  	err = drm_dp_link_clock_recovery(link);
078c445733c1e8 Thierry Reding 2015-07-07  748  	if (err < 0) {
078c445733c1e8 Thierry Reding 2015-07-07  749  		DRM_ERROR("clock recovery failed: %d\n", err);
078c445733c1e8 Thierry Reding 2015-07-07  750  		goto out;
078c445733c1e8 Thierry Reding 2015-07-07  751  	}
078c445733c1e8 Thierry Reding 2015-07-07  752  
078c445733c1e8 Thierry Reding 2015-07-07  753  	if (!link->train.clock_recovered) {
078c445733c1e8 Thierry Reding 2015-07-07  754  		DRM_ERROR("clock recovery failed, downgrading link\n");
078c445733c1e8 Thierry Reding 2015-07-07  755  
078c445733c1e8 Thierry Reding 2015-07-07  756  		err = drm_dp_link_downgrade(link);
078c445733c1e8 Thierry Reding 2015-07-07  757  		if (err < 0)
078c445733c1e8 Thierry Reding 2015-07-07  758  			goto out;
078c445733c1e8 Thierry Reding 2015-07-07  759  
078c445733c1e8 Thierry Reding 2015-07-07  760  		goto retry;
078c445733c1e8 Thierry Reding 2015-07-07  761  	}
078c445733c1e8 Thierry Reding 2015-07-07  762  
078c445733c1e8 Thierry Reding 2015-07-07  763  	DRM_DEBUG_KMS("clock recovery succeeded\n");
078c445733c1e8 Thierry Reding 2015-07-07  764  
078c445733c1e8 Thierry Reding 2015-07-07  765  	err = drm_dp_link_channel_equalization(link);
078c445733c1e8 Thierry Reding 2015-07-07  766  	if (err < 0) {
078c445733c1e8 Thierry Reding 2015-07-07  767  		DRM_ERROR("channel equalization failed: %d\n", err);
078c445733c1e8 Thierry Reding 2015-07-07  768  		goto out;
078c445733c1e8 Thierry Reding 2015-07-07  769  	}
078c445733c1e8 Thierry Reding 2015-07-07  770  
078c445733c1e8 Thierry Reding 2015-07-07  771  	if (!link->train.channel_equalized) {
078c445733c1e8 Thierry Reding 2015-07-07  772  		DRM_ERROR("channel equalization failed, downgrading link\n");
078c445733c1e8 Thierry Reding 2015-07-07  773  
078c445733c1e8 Thierry Reding 2015-07-07  774  		err = drm_dp_link_downgrade(link);
078c445733c1e8 Thierry Reding 2015-07-07  775  		if (err < 0)
078c445733c1e8 Thierry Reding 2015-07-07  776  			goto out;
078c445733c1e8 Thierry Reding 2015-07-07  777  
078c445733c1e8 Thierry Reding 2015-07-07  778  		goto retry;
078c445733c1e8 Thierry Reding 2015-07-07  779  	}
078c445733c1e8 Thierry Reding 2015-07-07  780  
078c445733c1e8 Thierry Reding 2015-07-07  781  	DRM_DEBUG_KMS("channel equalization succeeded\n");
078c445733c1e8 Thierry Reding 2015-07-07  782  
078c445733c1e8 Thierry Reding 2015-07-07  783  out:
078c445733c1e8 Thierry Reding 2015-07-07  784  	drm_dp_link_train_disable(link);
078c445733c1e8 Thierry Reding 2015-07-07  785  	return err;
078c445733c1e8 Thierry Reding 2015-07-07  786  }
078c445733c1e8 Thierry Reding 2015-07-07  787  

:::::: The code at line 738 was first introduced by commit
:::::: 078c445733c1e8092e23391b251cad6b12f6156e drm/tegra: dp: Add DisplayPort link training helper

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
