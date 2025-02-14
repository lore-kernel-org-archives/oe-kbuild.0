Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246D134AB
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739559664; cv=none; b=VLbO1k8lNbG1tXijbbsiewvo2lJOP0y5jANF16lfso/8Vyx6/lSnjUN48+nnvVAuS6k4F8P8Thlu3hYcth2b+sMg/LVxOJ8hj8hZ3/RALK5AuD1KDX8AGbQOXSVeWfeoUdbzBc84y1bpRY0mXZ3oJFW8E9pTBPS6/FiZXgppAN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739559664; c=relaxed/simple;
	bh=SZg/FOxTDL/E0O45x6H7MLOFqKLFnnt1c4sAN0YKQXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKFuWQ2v/3QkZ9+4slDCiIcEnW5cy9dnJWxDYgqJhRrfNAFRBsLXPDpiNu8QJE33A84RSHNuOCJ1XpZr07X96x520EFdUQYglFfnf9sz3qbgScSeuVFXSh+Y2zx+GrEosibvQem5fnvsVDXXnbo65NdL+SS34zngkv0zhy6mJnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/ANflzm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/ANflzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739559662; x=1771095662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZg/FOxTDL/E0O45x6H7MLOFqKLFnnt1c4sAN0YKQXw=;
  b=j/ANflzmXV7jywEjM+U6sGpMYJrrD2Vi6ZG1D/DiF2YX8m046KGi4xz+
   g1yUMnDEe9nM/HMrfjao0anvKVF9zECOEzaHiVdYBC7oTL/HRf7G1IFC0
   zMH9yrPMlOaKivykT8rwRZYllPTy27LhKvLCRZNaLJ/fvXxQGcxc+3sY3
   3MIA/y/g6KGwYZtCFj/1e/HgLebcwkcLw9ZItvhrphRklWsx+P+OqaN3W
   v8VCJntQM7BRsf+TOHXARq2MrySMAlemudMnnPu1lhgZAbcWnp+cea4cx
   SI5wMzAySqJZMkZ7xWuUGXPPhSqLHzGELWX5puwOpo3ZnQOwNjVTctsIV
   w==;
X-CSE-ConnectionGUID: oeUF/hLRRIqvPL6LdjLAag==
X-CSE-MsgGUID: Toz1zCYFQJWiehNcKSHO6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57849502"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="57849502"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:01:01 -0800
X-CSE-ConnectionGUID: dJHpD464SCm9mPFiWXinmA==
X-CSE-MsgGUID: +3o6AlcCS/q7KZcLmIdIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118736107"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2025 11:01:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj0vq-001A3p-1G;
	Fri, 14 Feb 2025 19:00:58 +0000
Date: Sat, 15 Feb 2025 03:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15 1/1] mm/memory.c: trace/hooks/mm.h is
 included more than once.
Message-ID: <202502150237.YtHxDecO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   e54e4b92f05a724e68b922eb427f02a0ff6c5e5d
commit: d1acc7198cb709f4bc90a549e9fae2e6b6f8469d [1/1] ANDROID: vendor_hooks: add hooks to modify pageflags
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502150237.YtHxDecO-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/memory.c: trace/hooks/mm.h is included more than once.

vim +77 mm/memory.c

  > 77	#include <trace/hooks/mm.h>
    78	
    79	#include <trace/events/kmem.h>
    80	
    81	#undef CREATE_TRACE_POINTS
  > 82	#include <trace/hooks/mm.h>
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
