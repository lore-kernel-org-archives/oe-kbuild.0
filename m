Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA63F9D2
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737304426; cv=none; b=qZlPf5Cw2oihF0Vld6jwMr5jK717fx90t169crzqONkcu3xFR4K9hV0rJY0j9NA5PYeaiJ7Kba4IOIT/JRg7zvQkk+cYRL3Kaear1NfKnj0rc+VoqNmzQL2BoDlRJ3cYTCfXWnvbocqSTYtX2uJ8PvfYWLUZSB8NEKVw1Dgvclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737304426; c=relaxed/simple;
	bh=JHtGBDMzjwQqzPgADZL/3YVRnI53/+BIuEHBpUeK22c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBxZSMe3+UvF4m1lMfGQGD9ayp+XL42mIJpkzkcBjHwIoCdTpQ96+fJ/cqW+ULSdPweQj7L+z7NWtZWtWYCBYc9jR0XKB0kOHLEf9d/1NhNVv7KaLHNA1NdGvvd/O45B+av8n980r3OPbWp61cYPj9zqk52G1W0Z6znhMCc0eMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kirQC32j; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kirQC32j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737304424; x=1768840424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHtGBDMzjwQqzPgADZL/3YVRnI53/+BIuEHBpUeK22c=;
  b=kirQC32jqt3vSLY0mEqXbsDulS+/jZdEmaRE3Mj48ngD5Z/qIo7EUD7h
   AiiDlov+Mkk7rT+zlMYLeBw3sKFDmIFO7F9/dm369BbgYU1ODfoIEGk8U
   67EfP5c+iqQ6Vw6CgQ47mOwB08QrwsXxLnHYmPQmNRyhvhJtxdcvEC2Cg
   w0FW1dZUyqKK9cyrp5nkQDzqOiRwDYQoukH/Mz4cLRo5SkxQki2WB2Ud/
   gBKHxcDWYptjS3nNi3js2p7tYsPq2aACh2dsS2F+N/ORfP5TUmV7HEpfN
   3cf9JxDY9v4KmXRp6O8hR8+ya/vcHkNQuqUr9WwJbSaL5NQnDqzcBfgQ7
   w==;
X-CSE-ConnectionGUID: hzlAjBX2SqmPSwlgKYQkGA==
X-CSE-MsgGUID: k2/P2Mp9Qlmxgj/xenrTSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="40480558"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="40480558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 08:33:43 -0800
X-CSE-ConnectionGUID: YFhjtjnCRWSx3pCqG8ZQsg==
X-CSE-MsgGUID: ALUmi7vGQjuC4z4BLMyY6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="106857279"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jan 2025 08:33:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZYF2-000VcF-0a;
	Sun, 19 Jan 2025 16:33:40 +0000
Date: Mon, 20 Jan 2025 00:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] sunrpc: Add a sysfs file for adding a new xprt
Message-ID: <202501200000.40Rg2rc6-lkp@intel.com>
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
In-Reply-To: <20250108213632.260498-4-anna@kernel.org>
References: <20250108213632.260498-4-anna@kernel.org>
TO: Anna Schumaker <anna@kernel.org>
TO: linux-nfs@vger.kernel.org
TO: trond.myklebust@hammerspace.com
CC: anna@kernel.org

Hi Anna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Schumaker/NFS-Add-implid-to-sysfs/20250109-053732
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20250108213632.260498-4-anna%40kernel.org
patch subject: [PATCH 3/3] sunrpc: Add a sysfs file for adding a new xprt
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-r073-20250119 (https://download.01.org/0day-ci/archive/20250120/202501200000.40Rg2rc6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501200000.40Rg2rc6-lkp@intel.com/

New smatch warnings:
net/sunrpc/sysfs.c:288 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
net/sunrpc/sysfs.c:57 rpc_sysfs_object_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 51
net/sunrpc/sysfs.c:427 rpc_sysfs_init() warn: Calling kobject_put|get with state->initialized unset from line: 418
net/sunrpc/sysfs.c:554 rpc_sysfs_client_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 547
net/sunrpc/sysfs.c:576 rpc_sysfs_xprt_switch_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 567
net/sunrpc/sysfs.c:595 rpc_sysfs_xprt_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 587

vim +/PTR_ERR +288 net/sunrpc/sysfs.c

2b155d9a088aee Anna Schumaker 2025-01-08  259  
2b155d9a088aee Anna Schumaker 2025-01-08  260  static ssize_t rpc_sysfs_xprt_switch_add_xprt_store(struct kobject *kobj,
2b155d9a088aee Anna Schumaker 2025-01-08  261  						    struct kobj_attribute *attr,
2b155d9a088aee Anna Schumaker 2025-01-08  262  						    const char *buf, size_t count)
2b155d9a088aee Anna Schumaker 2025-01-08  263  {
2b155d9a088aee Anna Schumaker 2025-01-08  264  	struct rpc_xprt_switch *xprt_switch =
2b155d9a088aee Anna Schumaker 2025-01-08  265  		rpc_sysfs_xprt_switch_kobj_get_xprt(kobj);
2b155d9a088aee Anna Schumaker 2025-01-08  266  	struct xprt_create xprt_create_args;
2b155d9a088aee Anna Schumaker 2025-01-08  267  	struct rpc_xprt *xprt, *new;
2b155d9a088aee Anna Schumaker 2025-01-08  268  
2b155d9a088aee Anna Schumaker 2025-01-08  269  	if (!xprt_switch)
2b155d9a088aee Anna Schumaker 2025-01-08  270  		return 0;
2b155d9a088aee Anna Schumaker 2025-01-08  271  
2b155d9a088aee Anna Schumaker 2025-01-08  272  	xprt = rpc_xprt_switch_get_main_xprt(xprt_switch);
2b155d9a088aee Anna Schumaker 2025-01-08  273  	if (!xprt)
2b155d9a088aee Anna Schumaker 2025-01-08  274  		goto out;
2b155d9a088aee Anna Schumaker 2025-01-08  275  
2b155d9a088aee Anna Schumaker 2025-01-08  276  	xprt_create_args.ident = xprt->xprt_class->ident;
2b155d9a088aee Anna Schumaker 2025-01-08  277  	xprt_create_args.net = xprt->xprt_net;
2b155d9a088aee Anna Schumaker 2025-01-08  278  	xprt_create_args.dstaddr = (struct sockaddr *)&xprt->addr;
2b155d9a088aee Anna Schumaker 2025-01-08  279  	xprt_create_args.addrlen = xprt->addrlen;
2b155d9a088aee Anna Schumaker 2025-01-08  280  	xprt_create_args.servername = xprt->servername;
2b155d9a088aee Anna Schumaker 2025-01-08  281  	xprt_create_args.bc_xprt = xprt->bc_xprt;
2b155d9a088aee Anna Schumaker 2025-01-08  282  	xprt_create_args.xprtsec = xprt->xprtsec;
2b155d9a088aee Anna Schumaker 2025-01-08  283  	xprt_create_args.connect_timeout = xprt->connect_timeout;
2b155d9a088aee Anna Schumaker 2025-01-08  284  	xprt_create_args.reconnect_timeout = xprt->max_reconnect_timeout;
2b155d9a088aee Anna Schumaker 2025-01-08  285  
2b155d9a088aee Anna Schumaker 2025-01-08  286  	new = xprt_create_transport(&xprt_create_args);
2b155d9a088aee Anna Schumaker 2025-01-08  287  	if (IS_ERR_OR_NULL(new)) {
2b155d9a088aee Anna Schumaker 2025-01-08 @288  		count = PTR_ERR(new);
2b155d9a088aee Anna Schumaker 2025-01-08  289  		goto out_put_xprt;
2b155d9a088aee Anna Schumaker 2025-01-08  290  	}
2b155d9a088aee Anna Schumaker 2025-01-08  291  
2b155d9a088aee Anna Schumaker 2025-01-08  292  	rpc_xprt_switch_add_xprt(xprt_switch, new);
2b155d9a088aee Anna Schumaker 2025-01-08  293  	xprt_put(new);
2b155d9a088aee Anna Schumaker 2025-01-08  294  
2b155d9a088aee Anna Schumaker 2025-01-08  295  out_put_xprt:
2b155d9a088aee Anna Schumaker 2025-01-08  296  	xprt_put(xprt);
2b155d9a088aee Anna Schumaker 2025-01-08  297  out:
2b155d9a088aee Anna Schumaker 2025-01-08  298  	xprt_switch_put(xprt_switch);
2b155d9a088aee Anna Schumaker 2025-01-08  299  	return count;
2b155d9a088aee Anna Schumaker 2025-01-08  300  }
2b155d9a088aee Anna Schumaker 2025-01-08  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
