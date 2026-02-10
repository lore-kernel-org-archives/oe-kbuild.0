Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E2318BBB
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770722596; cv=none; b=fiAssCMXMFcmfsF6dyuEiv1MAQPLMoi++Mu+PMxxAFFQjO58l/tM1PVxEpKO97wRQSSSKeTpTVnp0vrbAbAH3FIMJCnYR4IuO6gXjgSbKzPw+qSgGg/fKptqhoPxD/FuGIrXKYxWozttjB0KuGoZ3VAaWiO2MxdO6jlux/Eln1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770722596; c=relaxed/simple;
	bh=XnG1YdL1GasoJKecR8QGXiKht7tXLqlwdJZsgi10now=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K+jLqnld5Q/ivn/5OBHexi787rSJjBVvrSqQv5+Djxah4x2ucdzC19VZJJmaSLZ1b/xUQ46BAgkG7HXVckZzfGmeyZAhZQBc8Wc8eu5jOJnJ6oCUUMWatHt/78HzwpncZ02IDMER0e2K4iR2rfLTCVa8FmcGbBJsZj/FRw/gSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ol8zbs+P; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ol8zbs+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770722595; x=1802258595;
  h=date:from:to:cc:subject:message-id;
  bh=XnG1YdL1GasoJKecR8QGXiKht7tXLqlwdJZsgi10now=;
  b=Ol8zbs+PNYMrl3s2GtFSbzbCM7kmpW4s4YJXAdG5KrvobfzA9wQqtwvR
   7mlGXl1QoQ971m/glsKEpwFYoIvFH6/SLjRm+4cbrko89IFyQd5pYi/nt
   esbAE6Whs+7qp5t5JPX1tbVT+90BJDWNyGOcNtGA9Eq2f54Lk4Qxhwdek
   jY/aWHYxfa3qvW9jhconQajlC2CU+VYD3eEHO1TqRFDij934f1G4s2sy2
   gHTh5g74T8FwdHUpYjJJg3VK/ol3lwHU7h4RQ4YXEZedcoukpYbyNdtlX
   KggK1ulWIbO7COGMc+j90As/Pe1w88IhrXp4KNRjYV5MQGuKYff3jRrA4
   A==;
X-CSE-ConnectionGUID: c9spnwzXTu271/lcErIwjg==
X-CSE-MsgGUID: gj7/L5cGR36SZUofsmUrjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83286560"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83286560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 03:23:14 -0800
X-CSE-ConnectionGUID: IMGKKU3wQiSKA32msEVfAA==
X-CSE-MsgGUID: hcUNrN37SjmMjgWdd8Z5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216855900"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 03:23:13 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vplpn-000000000nB-1uTt;
	Tue, 10 Feb 2026 11:23:11 +0000
Date: Tue, 10 Feb 2026 12:22:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 1/1] ../../../mm/vma.c:10:10:
 fatal error: trace/hooks/mm.h: No such file or directory
Message-ID: <202602101218.tUAe93u5-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7675adc72fb0567775623633e603d79ef25cd23a
commit: 290d379399c6815ce2fd2a22dff095e89ee2bdc7 [1/1] ANDROID: vendor_hooks: Add hook in mmap_region()
:::::: branch date: 77 minutes ago
:::::: commit date: 4 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602101218.tUAe93u5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101218.tUAe93u5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101218.tUAe93u5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from vma.c:33:
>> ../../../mm/vma.c:10:10: fatal error: trace/hooks/mm.h: No such file or directory
      10 | #include <trace/hooks/mm.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
