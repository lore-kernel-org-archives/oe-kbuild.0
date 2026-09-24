Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5E2E5429
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277066; cv=none; b=UUzE/TSkAoCjUJe/lrz9nDJtjgzT8h1eOfak0xBjaLwYINOxXGLUnHs4bnKh8Nj2hEKVVEVZXea0AgEDuxlQZEOHJFC5M2e93iAb8xjGLjb6ocZtEJukmsio6dOFJCTFdPV+vJ99H9DMayS/J9bL4H+33e2+5sCVoXgIJA6JZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277066; c=relaxed/simple;
	bh=91BJbsF9NdhZV+DsMzYfmslHZpUnYU8bk+5thp70svk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYkLu2a1EdiuEzwRxRmJSYzQ+Ld1qMwY0OJqXZ9AKWH7GlloqKuEeZQMir4InAfu5X/wJwhLjNNn+m8hpGscD+59K7Rri6qAqZfxhHH4c9w8qm0/yUtOJrxxaQ8M8agVwncsoVIHNf5W8rXuXZCC/GiWustEiNSCpgQfKYefgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mr/SkqnZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mr/SkqnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790277064; x=1821813064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91BJbsF9NdhZV+DsMzYfmslHZpUnYU8bk+5thp70svk=;
  b=Mr/SkqnZsPP0xfL84XiGlNamqN9BuY9Jg+OOLOEbgSGqnakm2r6jVUcq
   vhSmNt+BdwEENjqI/dGDGVLD1xbw4kGm0opTTLQvzAFNxvrdDCtk5URyV
   iqwK5ui7xRcpPsgI9p+qi+QOb/Pyz/jIS1HHo70Jlt4+fOXGPPZWs+XXD
   hYXA4N8tyUtT2TiP5gh0dwJAcAsgGUbCw36GUGDfWMqcieOGKBsGP9CkF
   Qb07Meoj1OzN5GHZ5BcLhVT7eSABxVTwFGGyeQ1ffR0l3CscPGTmnGogM
   UQBrxMw38STsxRNRZBYbjXXoDwzJTYkCYdaCXD6YYujtFqPByAE0/2EaQ
   A==;
X-CSE-ConnectionGUID: X/AHdRYQS3+VWMK8ds0JBw==
X-CSE-MsgGUID: z5ksXNyWSkS+lTnywx6owg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101721343"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="101721343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 12:11:03 -0700
X-CSE-ConnectionGUID: 9V4NX9qNQSuKdgfNhOVi4Q==
X-CSE-MsgGUID: ZUs15p0BSjaRcBWGsXa7Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="303642544"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2026 12:11:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9oqS-00000000JUI-1EwK;
	Thu, 24 Sep 2026 19:11:00 +0000
Date: Fri, 25 Sep 2026 03:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re:
Message-ID: <202609250323.yQe7Gsus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <202609250323.yQe7Gsus-lkp@intel.com>
References: <202609250323.yQe7Gsus-lkp@intel.com>

Hi Jeff,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Johnson/scripts-kernel-doc-fix-false-pointer-to-function-match-for-array-members/20260923-103902
base:   
patch link:    https://lore.kernel.org/r/202609250323.yQe7Gsus-lkp%40intel.com
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250323.yQe7Gsus-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250323.yQe7Gsus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250323.yQe7Gsus-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_guc_submit_types.h:143 Excess struct member 'wq' description in 'xe_guc_submit_exec_queue_snapshot' (did you mean one of: 'parallel.wq', 'guc.wqi_head', 'guc.wqi_tail', 'parallel.wq_desc', 'parallel.wq_desc.head', 'parallel.wq_desc.tail', 'parallel.wq_desc.status')
>> Warning: drivers/gpu/drm/xe/xe_guc_submit_types.h:143 Excess struct member 'wq' description in 'xe_guc_submit_exec_queue_snapshot' (did you mean one of: 'parallel.wq', 'guc.wqi_head', 'guc.wqi_tail', 'parallel.wq_desc', 'parallel.wq_desc.head', 'parallel.wq_desc.tail', 'parallel.wq_desc.status')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
