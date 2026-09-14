Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9AF9C0
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 00:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344072; cv=none; b=PCr45vYc5+dqCrJuRqBu5VMc50Bv+B/qI6RghmzWvuUNUNQoEzev1MDZqFIQcYSDel1glzL65P1X8U37NCIGkFiOpquLmMsABL4DsLWVI5I2n64yavpuDAVWjmGIoQaZmDBwV5vLH1Y+uR7oOOfsFKFSRRNkvcwfzsqUnfZW7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344072; c=relaxed/simple;
	bh=bFLQKShb4zD4evw1B2jhHt0HZt4AlWpWhREzahKQ/MI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KisPCt+CtPBLtfGtLiPueprOdpum2as307pwBKA0hI/7n5Y3xIz3QoEId+eNhxAV7sGu3Z0aB11RWamUmUE1O4Wk9FOvPj1ELeVbM4+8CfHaaFsnVQMmJCZNfzRPNbZ5xAg+Ck0MsGFHT5PnqOBPw6NotSJK+BFuHXS3nwiuvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgs9maCS; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgs9maCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789344070; x=1820880070;
  h=date:from:to:cc:subject:message-id;
  bh=bFLQKShb4zD4evw1B2jhHt0HZt4AlWpWhREzahKQ/MI=;
  b=Qgs9maCSEQdso435a6bNeykO1mWQxa8EDW+8gdtAUtTl0VexqkZpWpUg
   Q95zw/kqDJEIuk/vBwmflb6yl8Z5cy0HfdL4+afXnZeReMgLRnySXjlEa
   XEyQzewqjB3DSsY5lodDBBdhDHHhvkyjZBNwPItHPTx00DnPYgwTmMWfJ
   4cHymMjutsqnHx6jAGrirS2EDAHYwr7G7jbj9HBHiRMN7vwFVIOhNbGYy
   cq8Mt76yAM7W6nrlJ29pcdRttjEJhRlcNlOPDAvyRBl7hp8hqJNz27QEe
   /CEM11dxoWHK+UWCLRie2BwjFeSfs751YGVgzQBlmPRWzntWq3/YpYfi2
   g==;
X-CSE-ConnectionGUID: L751IJyWQjqd/BAA7/SX2w==
X-CSE-MsgGUID: x04NCaiHRo+JTw45BnA9RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="210731"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="210731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 17:01:09 -0700
X-CSE-ConnectionGUID: FVuzBIwkSSSEhCzBjjxhmw==
X-CSE-MsgGUID: aPpd1b79RgOdqVNgcjr2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="277737431"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2026 17:01:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5u8A-000000001QB-2c97;
	Mon, 14 Sep 2026 00:01:06 +0000
Date: Mon, 14 Sep 2026 08:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/edac/octeon_edac-pc.c:33 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609140719.nTyOIyRd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cba2348ab114391f5b1a00fa65c5b739f13f0563
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   8 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 8 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260914/202609140719.nTyOIyRd-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140719.nTyOIyRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609140719.nTyOIyRd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/edac/octeon_edac-pc.c:33 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * EDAC CPU cache error callback

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
