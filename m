Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3B227B88
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753987853; cv=none; b=cPIySCzI0m78VaU+iUyer+csu8CEJ2ZXOp4sMjGyfyzQbun2Shr5t0aiVT05zD5F0Ng3/2pHeD6sOSDVUYvxfPd9/8dRHSvaEvRFHJcpBY/o4m8Fh+qRdt/BaV0ZkqG7hAnvI4vGKAZwT6F9Fy5tzxTCBLwPf7qy5XWE9Ng7Q6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753987853; c=relaxed/simple;
	bh=YNFYiEwNkDZ0X46muRBPBlH9rXW1oRc9qSD8FJWdLl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfKzKQ06ijgNLgQzj4NP755poi+hCJAAfttT3dvEx5zigTBFSqN+HGEJKhYa51WHXWl356FdRT8YIjVVapuTfwLEFp97dv/j+lbl5D4CELGxcX5UdVBjGGc9TG2+3i8da+8NHG2bFZHzQkzRZkIqbNd4rfzvrEk0pmhnDwJge/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5/j9tXx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5/j9tXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753987852; x=1785523852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNFYiEwNkDZ0X46muRBPBlH9rXW1oRc9qSD8FJWdLl0=;
  b=i5/j9tXxR2AlZoOSGozMl8NrAnPw5wDtr6HYu+TAb7uv2/NcIBGVKTrU
   i2qskrFIEIDQqq6krJ6HJ+Oi56xiK2x1AkK+bsFhx7Sx2M3k8tfbrvhgb
   dJhIYHoECTAyZ2p8YjkWvEW7C/UAYkbOzq6iQb/xJjxr3CvlwcGqK7Lhp
   17c6bbDf6EkcDBTuH6S8qD+qWC15/6CM2ORyrudW6juUoIBqljODqTcSu
   MhN4eHtvBgBPKw9uI0kZqwKY7NmL4kmChbZatkJCGZbUmMj0E2mnjqeUJ
   INParG1jIon5nrFVcLQMYW4Qqt/E5nHlyeC/iOWpAcK8Y9/GF5KpVPYr9
   g==;
X-CSE-ConnectionGUID: u1348OL3SPCRHCwkMlyAcw==
X-CSE-MsgGUID: HHJRF/UqRUySuYuEuM2bGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56288062"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56288062"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 11:50:51 -0700
X-CSE-ConnectionGUID: NbkJX3+9SaSmDDFZReotXw==
X-CSE-MsgGUID: gAMryijVQGC3n1YdUtxqXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="187024181"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2025 11:50:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhYMa-000147-0k;
	Thu, 31 Jul 2025 18:50:48 +0000
Date: Thu, 31 Jul 2025 20:50:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/rv.h: linux/types.h is included more than once.
Message-ID: <202507312017.oyD08TL5-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Nam Cao <namcao@linutronix.de>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   260f6f4fda93c8485c8037865c941b42b9cba5d2
commit: 24cbfe18d55a6866bc2e27fda74306f4a1b5cb01 rv: Merge struct rv_monitor_def into struct rv_monitor
date:   6 days ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507312017.oyD08TL5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/rv.h: linux/types.h is included more than once.

vim +10 include/linux/rv.h

     9	
  > 10	#include <linux/types.h>
    11	#include <linux/list.h>
    12	
    13	#define MAX_DA_NAME_LEN	32
    14	
    15	#ifdef CONFIG_RV
    16	#include <linux/bitops.h>
  > 17	#include <linux/types.h>
    18	#include <linux/array_size.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
