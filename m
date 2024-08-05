Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398463A
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 03:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722829091; cv=none; b=H3YoPiS5RsgEHXMvEK7gRkg4OcCxTBhOZ1lXd/0wQWSewSqQTcadCoW3ZVDW0v//V3Pbqfmz0FrTUVIOzes4/AhRKYa+fQ4A7GmtKAY61W+TmGRmDQXgSNpOg7fs+KcIPzaaS/yLutA1sgIx6MjsSVs6rJ/z66MJciOIQejD4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722829091; c=relaxed/simple;
	bh=z7FJDRMn2eG96ZA2b2JhfNSuNV/oUAjGfn/eGWj+xlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3BLflnfw6bvf0dgH3+XXP2UC7czZG+xT0YWzib+RddhFrSBltZS4Mq+iTAljGf+cdo371bN7uXCazlM+Xtr++e4OO8fSNr28B1mszDAvxDFbkF45iNuMqSfhzmjg1tkdyTTuCfWScMvFjwCe81ce6IeRpJCg7LfKdBwevLtbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/QWBRCS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/QWBRCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722829090; x=1754365090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7FJDRMn2eG96ZA2b2JhfNSuNV/oUAjGfn/eGWj+xlc=;
  b=W/QWBRCSxjl26JQ70NRZLERkAandGN8xzAXc2spsAr8oOsvpHb55A7ZY
   3N5Tn86d67OmO/raRULM6jtwDyxCU9aIzrrhNvJqaECt8kENVCOvQXIqm
   vN4LgRrtJjXuQpN7eqtnzCw+3nO0khwnvYAXu2MxwHlA0Upf6GHm9aH2y
   JqLJkEA5vaGG478S6W8S+zkFnA2TF7Go+XSaN2B2jPartepcRnbrE52N8
   WwuwBfLnb0iOpGJzEhiky1Vpk4OOaTk2v1bjeLlKxLHEt0Ax6rWNm0gqf
   JXaqUzqljQvyCvG9cjP1mE/y72NplXiAmsaNnpFNxvcHGMem22W3N1J49
   A==;
X-CSE-ConnectionGUID: XGcYdAC/SjG0mY4ET9comw==
X-CSE-MsgGUID: GyY4xKTWQguGjslmOl7cGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="12866141"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="12866141"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 20:38:09 -0700
X-CSE-ConnectionGUID: hUEUzUDMQqWe3U4zm9y1fA==
X-CSE-MsgGUID: PZ6vqntdSy2p5XRNHKTeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="55969420"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2024 20:38:08 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saoXu-0001gi-02;
	Mon, 05 Aug 2024 03:38:06 +0000
Date: Mon, 5 Aug 2024 11:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sj:damon/next 10/44] mm/damon/core.o: warning: objtool:
 kdamond_merge_regions+0x108: unreachable instruction
Message-ID: <202408051110.prmpLcCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   fec73193b080d068291509554d3e4b21622ede2d
commit: 24414085e4db9c12293ea7230139fdab80e529ce [10/44] mm/damon: Add debug code
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240805/202408051110.prmpLcCI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051110.prmpLcCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408051110.prmpLcCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.o: warning: objtool: kdamond_merge_regions+0x108: unreachable instruction


objdump-func vmlinux.o kdamond_merge_regions:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
