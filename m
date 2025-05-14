Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB981ACEDE
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237727; cv=none; b=d/qdLD+FJe9l2q9f7cNFZ538Hl92vWSEmEG4O6ZgQqw8WJuQ81Df5s5JLMemk5gYmYy5JzHM6uJ6DG68AQvuIJlT+qw/5lXixHfute/teIklQFOnMYp0mUcjqK4cZ9wluDuDeccXhCMvg4N/6SkqR08C4fXTr5Jl1LFjBCrJwMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237727; c=relaxed/simple;
	bh=ZLq3EVz7Uy+a9GmXQFtokL34n52l4KS1fXlSprmdgss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+TE1W4ejiIy6westHQi3Bslcu8TXshiueld52E/Sh1FGuaPbo83dPzg/FuZ/S1YHW+5awvVaYVWhnQ2U12GJJpk+b666hQPHmvz7j8Gd2GDpoJ5o4N59LTnRSF4KMjzVsZWAsPGjmRlvaTSq4NvtKBJ7XsTR7R66uu2pvDT5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9Lv4DRL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9Lv4DRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747237725; x=1778773725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZLq3EVz7Uy+a9GmXQFtokL34n52l4KS1fXlSprmdgss=;
  b=D9Lv4DRLx2/FvJs0J7ysXdBApGSCFJeazV63NUt5H1wLR9+uSFsafiWP
   RiOH+G6oP7XPZWhs4vUAgqQUtnZRJpcH2W01jCH6Nk5Hnsue40fv1CcsW
   1+X0xFQP1GsxYaUM+CoNalRz34aXvsU1B6fhQyWmD+Xsqg42sUDW7l2bJ
   duZOrdN5PnynZB28PubY2T5dheTDjCHOQAcu87mIRCxmbLFxwTExg8ZBL
   hvn6XVWAz758PYQolaGhtC1WhZKT+TqkzDM7Cxk6Q1Y3HykUie5M2iX53
   WlT8zSTBTxwEOso7zbnrhNAFKNpYhrXSCUoKUdhni/rCqz7ElI5vICALZ
   Q==;
X-CSE-ConnectionGUID: r/WG0qiNStGYBbifSkDHvA==
X-CSE-MsgGUID: 2+lQ1TpzTnqXcbBAHM6y3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59369301"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="59369301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:48:44 -0700
X-CSE-ConnectionGUID: s56iszvxQRqKklpwQnkZeQ==
X-CSE-MsgGUID: KwtxAvgUT+m1BGrj1BK50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138495761"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2025 08:48:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFELZ-000HIN-0d;
	Wed, 14 May 2025 15:48:41 +0000
Date: Wed, 14 May 2025 23:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cxl:cxl-acquire 1/7] include/linux/mutex.h:202
 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202505142325.5YTmSwRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-cxl@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git cxl-acquire
head:   8b6078f03a61a162ea390c80585942f6cd9e60f4
commit: 56c3e1a5d70f361b572ec4a88e95bf8b4ec1c5b7 [1/7] cleanup: ACQUIRE() proposal
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r071-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142325.5YTmSwRa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505142325.5YTmSwRa-lkp@intel.com/

smatch warnings:
include/linux/mutex.h:202 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +202 include/linux/mutex.h

b1fca26631f76a Eric Paris     2009-03-23  200  
54da6a0924311c Peter Zijlstra 2023-05-26  201  DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17 @202  DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
56c3e1a5d70f36 Peter Zijlstra 2025-05-12  203  DEFINE_GUARD_COND(mutex, _intr, mutex_lock_interruptible(_T), _RET == 0)
54da6a0924311c Peter Zijlstra 2023-05-26  204  

:::::: The code at line 202 was first introduced by commit
:::::: e4ab322fbaaaf84b23d6cb0e3317a7f68baf36dc cleanup: Add conditional guard support

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
