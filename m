Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E795274FE3
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551593; cv=none; b=n0mqijMAcdEoCGQW1WHROzE98b9bX/Yx27kPflSxujzE+XCth349bfaAbWblURILTcM40TeSbwb2ZKbgV30odzNyzqRtZ6V4i/Z1J3Tz2lwbtbR3PE2iDZP4RCPCcwe8TEhvpA6iGWbr+4w8KBobNL7mDj04YWdCELmxwEGeBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551593; c=relaxed/simple;
	bh=2jwWKjnxdJSBNHssrmwiHWPUPaJ83fyf+eDmGMyEzMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kZaeQSKSd+VAIfp1izC2/9uF+lWl3AzzCuFNM9yCMEipilVtMnv/3xRWFr+eH8hAsB6LC1qTNEOaX013gNkEr534ZgIvUVO3KYbx4QdBwIKBGPlnVF2uwkqjiIH96FnkN0Vx4SP1moT/nblBTYVm6k8m1rQo7j3gMyxfOEdsJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bByQx1w6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bByQx1w6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768551589; x=1800087589;
  h=date:from:to:cc:subject:message-id;
  bh=2jwWKjnxdJSBNHssrmwiHWPUPaJ83fyf+eDmGMyEzMc=;
  b=bByQx1w60RLpKNr6deeGPu2jUW+CHjtyOIH4GLhbqdUR9SkRsojzV2b2
   NKaiGFlYnUCy4pRHPAH5lJWhHqrFjIiXTwz+klAacHdWhUG6rIqcgk+Mc
   bI0NTklNW8sGXlJnlAA5/ssuPbUfSR1hWjsuSJSLtk6hLIdsdgW8zGfx7
   0zRy9CuYkt7PmB04N5YqtNftyM7uXYDK6QKQa7bbOmuj7d/N4HnGWFnoj
   EgIhfr7pkcLBJhQpNYOh7jS1wJ0BRusvjSxGFV7S8iwX9+gAH2mx3nSDI
   ZLAIqfqd1mXuXHkdJdxQMtOdRYiqGLXGQx8NYpLtHiYqkpNl81HzOap19
   g==;
X-CSE-ConnectionGUID: n5pnARdbTeue7pLjvOaJMw==
X-CSE-MsgGUID: xvsSZxE1QQy43kYNKkbfMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69778476"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69778476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 00:19:47 -0800
X-CSE-ConnectionGUID: bJnrHddOTT6uqycodJ3EFw==
X-CSE-MsgGUID: ZWnpJ/h9QuuPmogEXgYfPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="210049807"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 00:19:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgf3Y-00000000KZY-1ja9;
	Fri, 16 Jan 2026 08:19:44 +0000
Date: Fri, 16 Jan 2026 16:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [vireshk:virtio/msg-xen 7/17]
 drivers/virtio/virtio_msg_loopback.c:366:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601161638.n9qSegnr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_msg_loopback.c:366:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   2978a84b82627a16bee8e2cd5718a51de47e7d5e
commit: b7c1464853a66536efb17d2415bdce759a8d7e87 [7/17] virtio-msg: Add loopback bus for testing
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: sh-randconfig-r133-20260115 (https://download.01.org/0day-ci/archive/20260116/202601161638.n9qSegnr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161638.n9qSegnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601161638.n9qSegnr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg.c:672:1: sparse: sparse: bad integer constant expression
   drivers/virtio/virtio_msg.c:672:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/virtio/virtio_msg.c:673:1: sparse: sparse: bad integer constant expression
   drivers/virtio/virtio_msg.c:673:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/virtio/virtio_msg.c:674:1: sparse: sparse: bad integer constant expression
   drivers/virtio/virtio_msg.c:674:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/virtio/virtio_msg_loopback.c:366:1: sparse: sparse: bad integer constant expression
   drivers/virtio/virtio_msg_loopback.c:366:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/virtio/virtio_msg_loopback.c:367:1: sparse: sparse: bad integer constant expression
   drivers/virtio/virtio_msg_loopback.c:367:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/virtio/virtio_msg_loopback.c:368:1: sparse: sparse: bad integer constant expression
   drivers/virtio/virtio_msg_loopback.c:368:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +366 drivers/virtio/virtio_msg_loopback.c

b7c1464853a665 Viresh Kumar 2024-12-10  365  
b7c1464853a665 Viresh Kumar 2024-12-10 @366  MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.org>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
