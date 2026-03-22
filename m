Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971A3164A9
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 23:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774220838; cv=none; b=CdM0HCVHomQEs8ynbzZTIqEnV9edhDJP0u6NhZ8YUf/+rJpf5lMnfjIkvurYfICWRbzrXPrPKA6fPK+eNFzSjVqI4N/UWCOV1fM/I+eT8U5JoLSrjnz69IMZpDny2RQ0VOv75yyzoy0mCrToddk+NB4vxXxTruXOttK5RO5B6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774220838; c=relaxed/simple;
	bh=MrAM7DzI99aQ2QeXITSRt2wohKkdPECsGvRUWjxoNDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D2tkqIR2GxR2W7jRdNLw1E2F8LMoJGHgDlhO+GWezrYxvMez8zJJ+lFp4Qg6OlN+zH+RYfe2uInuRpJEjrPFrhuAaq62XVZ/twmVB0261jnvA5v28yX+4ODzaFWfuxJVUnka/W/tI2pemCAq6spoKE9wBqhNU5HUWMxPEY78FIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNsnlsqi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNsnlsqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774220836; x=1805756836;
  h=date:from:to:cc:subject:message-id;
  bh=MrAM7DzI99aQ2QeXITSRt2wohKkdPECsGvRUWjxoNDk=;
  b=LNsnlsqi1fZT4JkPE4i2EPhlZrjWcEyOJaL9hKFdKanJ1V2hizODXOYa
   5C6t2rhz7HRUJky/wRWm+ViqGYLoU1Uz4/pe/PbksW7Gz+vK4EoXxgyca
   cTB1MxWAx8HsjnR9LME3RWkBuVBlirF9bRQLgUbsePEArlS6FL8nYURUg
   mIChkER8bmQR4aPsqH0PwbehXijc+/4TJlWH6Dd3Jeevl9sHchfhz/+7C
   zHHTVoMQnJ0s+2K94nBzOEjvzVFVJ44HRunTyqartyNT/mkpLgf0fub5R
   BXbr3lznlsoKt36Htf3/S2yoHz4PHPaxb90AygcCpzqWBZKSWADpTuZzF
   w==;
X-CSE-ConnectionGUID: 5emoRr2oTouapKgD1MAJzQ==
X-CSE-MsgGUID: sRlSi4tWR4CiBL/CIATlaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86697833"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="86697833"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 16:07:16 -0700
X-CSE-ConnectionGUID: M0ilBVahRYq7IZRURp+1UA==
X-CSE-MsgGUID: osyZmjEVRCWOjV9q2BPXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="220625918"
Received: from lkp-server02.sh.intel.com (HELO 391eea459618) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2026 16:07:14 -0700
Received: from kbuild by 391eea459618 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Rsw-0000000006R-0CGw;
	Sun, 22 Mar 2026 23:07:08 +0000
Date: Mon, 23 Mar 2026 07:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sunrpc/sysfs.c:343
 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'
Message-ID: <202603230618.haJICSqp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anna Schumaker <anna.schumaker@oracle.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: Benjamin Coddington <bcodding@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec69c9e88315c4be70c283f18c2ff130da6320b5
commit: df210d9b0951d714c1668c511ca5c8ff38cf6916 sunrpc: Add a sysfs file for adding a new xprt
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230618.haJICSqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603230618.haJICSqp-lkp@intel.com/

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
