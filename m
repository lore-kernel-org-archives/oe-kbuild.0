Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7583822B5
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503722; cv=none; b=iLJJohP9RW0qGtFkmPXJKwSy5JZF8Ey8dl42Y6rp9bMZfqRy2T+Hk9zwQZusiRF7VvbP3CcbJ37Uc9AjjdcZWE5bKaTy2U9Oi6PwFCO+ohqrgX6xaRs64x8zdg73Rc3+hCVf3qnFTX2E4AoGr1UppSqGFYhJptSaOc4KQBgSyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503722; c=relaxed/simple;
	bh=p7G5rnlGvBc0o42tEyEZzuQVcfOgGtBJPU3eFrjq/90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uL41S3rPNHgUvxG1WUL28cTE2z3IFnt8NDfLxlqtsIgiFp6fZPodItiuWsczuljWH/eiE99ZAwUmweo/joJbrm55oMpm4TQ6Kq/d8jXsikGOMzy2HXH1h9QF0AmQ6X5wWzhdxMV7aDHM1RUnDcxwbNdeBgCiCKnoiarfypuydYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3fOUFwq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3fOUFwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790503721; x=1822039721;
  h=date:from:to:cc:subject:message-id;
  bh=p7G5rnlGvBc0o42tEyEZzuQVcfOgGtBJPU3eFrjq/90=;
  b=c3fOUFwqIzQMAlIZoVPp4ni7fhiWwBSw8IU5ffdR4k0O7TSK1uNHWSsh
   pcRS+LPuz2qqgKKhCviQOCSrk9XZsO4xCfI4IPPWN2VnLapOKqgUYogpT
   XaOYUrtiAwf5ZKCsYpjxcnW3JN++qOk4MPox7IX5vJsJzhevPtPiO9fbn
   ffoJ1xT94fe/sxxnxtqNmSeYbPHJduOqGogoR/BvBZb3Bnv2pZCmSH52e
   dFgcYp+Ztg7OPVMiwstxSkz0p9YkN0Hr6OwgM4ydpidVjDG1cl9m8DHDm
   Z4gCkUdJGUIe4omc+60C3tmzbLVJk8pp4wZ8uRSUoIQB4MRl4Z61mtZMM
   g==;
X-CSE-ConnectionGUID: qF3PeEksT0WLcLOUNbm4aQ==
X-CSE-MsgGUID: HE7HA91XS965k/HtBQ1ueA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="78788343"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="78788343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 03:08:40 -0700
X-CSE-ConnectionGUID: m68e6BInSQGRo8Dl4cFkpA==
X-CSE-MsgGUID: TEM7GFwPQ1+HdXy92lWPlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="312698483"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2026 03:08:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAloC-000000000Wx-26FB;
	Sun, 27 Sep 2026 10:08:36 +0000
Date: Sun, 27 Sep 2026 12:08:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-nonuma
 43/51] cram_perf_tool.c:289:13: error: implicit declaration of function
 'cram_pageout'
Message-ID: <202609271232.JQGSshY2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-nonuma
head:   f1fcedacbd06c5213a7e01f7a087588e24b47a61
commit: ddcbe8cef481b29f8349e19ca7be93e2023e6bbf [43/51] selftests/dax: benchmark CRAM fault behavior
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260927/202609271232.JQGSshY2-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271232.JQGSshY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609271232.JQGSshY2-lkp@intel.com/

Note: the gourryinverse/scratch/gourry/managed_nodes/rfc6-nonuma HEAD f1fcedacbd06c5213a7e01f7a087588e24b47a61 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   cram_perf_tool.c: In function 'arm_batch':
>> cram_perf_tool.c:289:13: error: implicit declaration of function 'cram_pageout' [-Wimplicit-function-declaration]
     289 |         if (cram_pageout(p, len))
         |             ^~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
