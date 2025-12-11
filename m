Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EBE2327A3
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765463714; cv=none; b=b9KErUG36wlc9Af8Omt6l3ZBnjl+5lQejAAeKLn20xoHuNHJU7Py1M7lX4BbuVtsxldPwVDFPtNYLV6j74Kc6AW0Mf0NJ62mVE1lsbgz/5LR30vPCozklIUUtzqFrSutonPO83oeM5kZFzchW5WMqd7yF8WKdwNapEzJPaKkotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765463714; c=relaxed/simple;
	bh=lg2saF6c4u5KLr/y6spD+5JZZQ6tH3SoV7xdluMc8vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEVFK44TJ8Uz3EhyQ9l0As1F/Wdda7YAGTOqwCOf/HFcZnSrSbUe3PT4rtk0TzSVbM/iLKmHhTmDvDNeKMqcwYTS/uHOvhyQQ9zogjjXdrzE7D/pjsHIYrOiutwhh2lkMQJ571kMPGtD+IXEdi2jZfPhFk/sQ8k/EItNjsJCzdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HokIZF8x; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HokIZF8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765463713; x=1796999713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lg2saF6c4u5KLr/y6spD+5JZZQ6tH3SoV7xdluMc8vE=;
  b=HokIZF8xE2SYnqPTm1vX2NjU95+K6qF7dUlvp6DKgygaTHTXtm8JamFY
   mioPg4IPia0pZADe8/1r4CiKeXBqJefXYhavvFr6RxlFbCNblcuoLyOrE
   nbjXo45bgYNggkhgZo+0OG8tEGtVIETQNGM2iDG4aQYAnjuBH8EZIAF9j
   ZVE4PlfOAsOFy/Vo7Fo5gmob2p6jgHKw0V4QweeIDEZsdVyHdm1RPFxpM
   B+ZsMdx8vYudPdGIya0JG90i6FhgETZKB4AmpgpogUVbDV7j404Z00w4W
   /Cxgpvavw7GAMB4vj894d61NfR4AZp9BGMXzjjyY+dCHDIQesLqs96RTU
   w==;
X-CSE-ConnectionGUID: P1YwMiZqRgqxf8xf2udrYQ==
X-CSE-MsgGUID: SIdce018R6GJlO1EKSCB6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67493796"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67493796"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:35:12 -0800
X-CSE-ConnectionGUID: esFYfJRfRH6Q3L7PIqYbRg==
X-CSE-MsgGUID: 3S+Pi0w/SVyLx70Sp9K8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197287460"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 06:35:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vThl2-000000004mH-2r9q;
	Thu, 11 Dec 2025 14:35:04 +0000
Date: Thu, 11 Dec 2025 22:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202512112218.13vaWK3b-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Anna Schumaker <anna.schumaker@oracle.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: Benjamin Coddington <bcodding@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: df210d9b0951d714c1668c511ca5c8ff38cf6916 sunrpc: Add a sysfs file for adding a new xprt
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251211/202512112218.13vaWK3b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512112218.13vaWK3b-lkp@intel.com/

New smatch warnings:
net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
net/sunrpc/sysfs.c:57 rpc_sysfs_object_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 51
net/sunrpc/sysfs.c:482 rpc_sysfs_init() warn: Calling kobject_put|get with state->initialized unset from line: 473
net/sunrpc/sysfs.c:627 rpc_sysfs_client_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 620
net/sunrpc/sysfs.c:649 rpc_sysfs_xprt_switch_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 640
net/sunrpc/sysfs.c:668 rpc_sysfs_xprt_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 660

vim +/PTR_ERR +343 net/sunrpc/sysfs.c

df210d9b0951d7 Anna Schumaker 2025-02-07  314  
df210d9b0951d7 Anna Schumaker 2025-02-07  315  static ssize_t rpc_sysfs_xprt_switch_add_xprt_store(struct kobject *kobj,
df210d9b0951d7 Anna Schumaker 2025-02-07  316  						    struct kobj_attribute *attr,
df210d9b0951d7 Anna Schumaker 2025-02-07  317  						    const char *buf, size_t count)
df210d9b0951d7 Anna Schumaker 2025-02-07  318  {
df210d9b0951d7 Anna Schumaker 2025-02-07  319  	struct rpc_xprt_switch *xprt_switch =
df210d9b0951d7 Anna Schumaker 2025-02-07  320  		rpc_sysfs_xprt_switch_kobj_get_xprt(kobj);
df210d9b0951d7 Anna Schumaker 2025-02-07  321  	struct xprt_create xprt_create_args;
df210d9b0951d7 Anna Schumaker 2025-02-07  322  	struct rpc_xprt *xprt, *new;
df210d9b0951d7 Anna Schumaker 2025-02-07  323  
df210d9b0951d7 Anna Schumaker 2025-02-07  324  	if (!xprt_switch)
df210d9b0951d7 Anna Schumaker 2025-02-07  325  		return 0;
df210d9b0951d7 Anna Schumaker 2025-02-07  326  
df210d9b0951d7 Anna Schumaker 2025-02-07  327  	xprt = rpc_xprt_switch_get_main_xprt(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  328  	if (!xprt)
df210d9b0951d7 Anna Schumaker 2025-02-07  329  		goto out;
df210d9b0951d7 Anna Schumaker 2025-02-07  330  
df210d9b0951d7 Anna Schumaker 2025-02-07  331  	xprt_create_args.ident = xprt->xprt_class->ident;
df210d9b0951d7 Anna Schumaker 2025-02-07  332  	xprt_create_args.net = xprt->xprt_net;
df210d9b0951d7 Anna Schumaker 2025-02-07  333  	xprt_create_args.dstaddr = (struct sockaddr *)&xprt->addr;
df210d9b0951d7 Anna Schumaker 2025-02-07  334  	xprt_create_args.addrlen = xprt->addrlen;
df210d9b0951d7 Anna Schumaker 2025-02-07  335  	xprt_create_args.servername = xprt->servername;
df210d9b0951d7 Anna Schumaker 2025-02-07  336  	xprt_create_args.bc_xprt = xprt->bc_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  337  	xprt_create_args.xprtsec = xprt->xprtsec;
df210d9b0951d7 Anna Schumaker 2025-02-07  338  	xprt_create_args.connect_timeout = xprt->connect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  339  	xprt_create_args.reconnect_timeout = xprt->max_reconnect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  340  
df210d9b0951d7 Anna Schumaker 2025-02-07  341  	new = xprt_create_transport(&xprt_create_args);
df210d9b0951d7 Anna Schumaker 2025-02-07  342  	if (IS_ERR_OR_NULL(new)) {
df210d9b0951d7 Anna Schumaker 2025-02-07 @343  		count = PTR_ERR(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  344  		goto out_put_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  345  	}
df210d9b0951d7 Anna Schumaker 2025-02-07  346  
df210d9b0951d7 Anna Schumaker 2025-02-07  347  	rpc_xprt_switch_add_xprt(xprt_switch, new);
df210d9b0951d7 Anna Schumaker 2025-02-07  348  	xprt_put(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  349  
df210d9b0951d7 Anna Schumaker 2025-02-07  350  out_put_xprt:
df210d9b0951d7 Anna Schumaker 2025-02-07  351  	xprt_put(xprt);
df210d9b0951d7 Anna Schumaker 2025-02-07  352  out:
df210d9b0951d7 Anna Schumaker 2025-02-07  353  	xprt_switch_put(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  354  	return count;
df210d9b0951d7 Anna Schumaker 2025-02-07  355  }
df210d9b0951d7 Anna Schumaker 2025-02-07  356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
