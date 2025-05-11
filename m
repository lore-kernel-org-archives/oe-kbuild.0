Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AB32C85
	for <oe-kbuild@lists.linux.dev>; Sun, 11 May 2025 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747001498; cv=none; b=Qne+qXVR1KI8FwmCrej9c8H1Tjmvo+SnSRlsgGffUGgtEGbHGUFomtigSISVrOg4veL1J4kC6/PU2Dg+SaH8jcv8dh9kmS4J/3qBSEQUIg2dcOAPl4//2Tqt8JGErjzJfu6ruqoeUAiWv3MIwHSox3pRKESDGMrVNcagk35JkqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747001498; c=relaxed/simple;
	bh=iTLC74BRRfAZlY9BBapAm8fI+yNeYAQHaPxjRePrk8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6a5pznvaRDUxT0KsddS4oN1pXskBlso5A43Kd9wPoOid8cCvar5Hi37Udqgc/46slHHJ6IdvY90wMBqTvn4wGJooFSlEQVXFi3RlcdSnZnnvWglrdYazg+DVxM2HI0rJnbp+T0fM38QVm4IYKb6NME59Z9XHBA9zH2YxlQWelQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3Ga/0oD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3Ga/0oD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747001496; x=1778537496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTLC74BRRfAZlY9BBapAm8fI+yNeYAQHaPxjRePrk8Q=;
  b=Z3Ga/0oDsj4YiLiFsDUSQnnJ1ShxqYlu1E2UufFeyjz874JflZdw1q6s
   H7iXrjBr0AzBHKhRBSkuDpuah8dNsj/rHw6sJzOFshPcviUpuuXTOLTko
   WUuyJQCM+aUZY3m/pJ9Qz/OfO2E4ZvJcaeM22rOknmJHvAL1IuPawngxF
   JlmB5RAmCAcF0DR6lThbrvyRhRN4kWxP4nJhItSUE1hasn6KsHeq3kDVs
   QCrhtAsu4vcK/nxbY7r20HRPv7qbgc33DBKwqs9+YCRAf8YfDTQcF289C
   E6z7njfFaYGtFpZQ9EymE3G3dnyXfnF/BRiOTN2F+LZnBfsWjz4DSC/xi
   Q==;
X-CSE-ConnectionGUID: 1eaE6HNqT5C4x2NIVo76qg==
X-CSE-MsgGUID: 4y5hoPD2RruF7VZ+2nk0KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="51442980"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="51442980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 15:11:35 -0700
X-CSE-ConnectionGUID: X+EPXZvOR66xDenbZhu2Hw==
X-CSE-MsgGUID: aEE2zQJFSwmvOvRUC8D0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="168274017"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 May 2025 15:11:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEEtQ-000E1n-22;
	Sun, 11 May 2025 22:11:32 +0000
Date: Mon, 12 May 2025 06:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/netfs/fscache_cookie.o: warning: objtool:
 __fscache_relinquish_cookie+0x280: unreachable instruction
Message-ID: <202505120649.vexs3icn-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cd802e7e5f1e77ae68cd98653fb70a97189eb937
commit: 5fb70e7275a61dd404f684370e1add7fe0ebe9c5 netfs, 9p: Implement helpers for new write code
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505120649.vexs3icn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120649.vexs3icn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505120649.vexs3icn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/fscache_cookie.o: warning: objtool: __fscache_relinquish_cookie+0x280: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
