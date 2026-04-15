Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5E332919
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258801; cv=none; b=l76b4pfMVhFxSyqq3l211RKOMhcdptE6KEj8efqkyBOFLV5MC7D5J888dbpHc/+qXrMDq5qe2l4QBzdfpgEVkf68z9H8IIs7lYDfCEZITaD9+Cbqy9JAYcsoWl1OptDG05AdvTm9wIpUg8plZrs6LDDBdO/Oa10XMGCNsZ/O7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258801; c=relaxed/simple;
	bh=qjy35cK3lsVNzScjcV/cmcPJd2KsjTdpHBlky1IxtM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b1+wE9GnHBAX6RVl/82/QCNaYrW+YjyUoQHtNXZgNidhkT7lg0oXl03o2sWZxb0lztGxMmFtf1pxnF9tT6zflcmicBREQ2Mk5x0EQ9vj1nytXYwcwifSUHA5CAstBekBW8QvMgRZ6TIxAz2pgoMde+HyjVqoKvulPJ2D3ZRVW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VstYtM7J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VstYtM7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776258800; x=1807794800;
  h=date:from:to:cc:subject:message-id;
  bh=qjy35cK3lsVNzScjcV/cmcPJd2KsjTdpHBlky1IxtM0=;
  b=VstYtM7Jd+PGxQlCq8xczxjuHa7tvMiWCCAEoR2GbL2vix8/1QZTaZxL
   d0SSaaRN2OvLig7ltQZIXstMgIPwWs66Ej1dweZ/dbN+e1X1KuebyZ5+3
   WsGILSZooGlCGMv9c0P04Gcr/D2jepRag9dIKm/CG/Bk6Se5UmJb7UnsW
   VsAMkKAmqRG0HURIqmLDFyRwQGwqRiXq1DaEu15dmKXtGjMt8cIbAdpBI
   VIFjDFAMqclb7ZTrf7KaUPn/BFC9hhTkmv5sqaOWvsL7cuu6KoiPmUhOY
   bjy9ogSRFFrL0T6X20+nrWfogaL1FFdujC4ANqc/44z14JZ7JLqkrhQeE
   A==;
X-CSE-ConnectionGUID: 8huspi4DRQ2i4yOLur1xuQ==
X-CSE-MsgGUID: Wni1lBqYQ9OPUH4S2wsb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77305465"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77305465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:13:20 -0700
X-CSE-ConnectionGUID: aBYXTIftT8+spcpcrfSjWA==
X-CSE-MsgGUID: OT2pmowWRLelif1XR1Xm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234445273"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 06:13:18 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD03R-000000000kr-1jez;
	Wed, 15 Apr 2026 13:13:17 +0000
Date: Wed, 15 Apr 2026 15:12:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: membarrier_rseq_stress.c:43:3: warning: #warning
 "Unsupported architecture - using dummy RSEQ_SIG and skipping at runtime"
Message-ID: <202604151516.Vc7Ro4LP-lkp@intel.com>
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
TO: Aniket Gattani <aniketgattani@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aniket-Gattani/sched-membarrier-Use-per-CPU-mutexes-for-targeted-commands/20260415-000609
head:   117d22599fbe523427aa80a9839a2a0f5801cb32
commit: 117d22599fbe523427aa80a9839a2a0f5801cb32 selftests/membarrier: Add rseq stress test for CFS throttle interactions
date:   21 hours ago
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260415/202604151516.Vc7Ro4LP-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151516.Vc7Ro4LP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604151516.Vc7Ro4LP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> membarrier_rseq_stress.c:43:3: warning: #warning "Unsupported architecture - using dummy RSEQ_SIG and skipping at runtime" [-Wcpp]
      43 | # warning "Unsupported architecture - using dummy RSEQ_SIG and skipping at runtime"
         |   ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
