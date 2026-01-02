Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2402652A4
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357667; cv=none; b=PCuIyU+Bz6T5Fqp1y0wee5z8JSLtKiHbmTquyHzEE1LeY9w8uGWpNSbwXuDAQg3xZtmXZZHnGGNcn0dp+9GQpJkXWl/v30AevhaClHe5z6wsILCMiw9etpvcINkgr2Rn+f4zOVJ+t9vIQ+cJl4+iObSBVhwvd64j36qLRjjdH8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357667; c=relaxed/simple;
	bh=6znGg6ZoVK60pJM1BCmXqC7ci5Nzm7C/kLNxg8ycU/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dol+Cir09oUu8lpIu/r8dP2I8nTp1yOScnRD/iuRtKu43udsZCGQmIZ5Yz8DqxusDTeojr/L4OUvDhfPKwDdkaN+Lfb58glDXX+e3B2+TZtuBmI9T6jlKW7zPfMSs3/wBrY+oXyQK+WEm/TpTTfG4fPspFgAZWgZRPvTpuT4tJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7pnAndB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7pnAndB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767357665; x=1798893665;
  h=date:from:to:cc:subject:message-id;
  bh=6znGg6ZoVK60pJM1BCmXqC7ci5Nzm7C/kLNxg8ycU/A=;
  b=C7pnAndBrivTGVreDCL4W0FvuCB6lQHhnpkfpJmzsg09Xii4ymIaeqS1
   /jgsqo2bHL+mWCoEe0LH8xIUnOMe1wg2pIlFPsVmScKmieIM0yamB0EiF
   dC8XIK+Qq96OwkEzeRjBH1/1VOfgFK0MknH4wJ7d7JJ1CCtvRHI6G8/DH
   l73EnzYAcXllSBqtdbUqeymsfwybAkXZAyqtZTZgfvXmuzUxveXkF/QDM
   FHqibqr1O3iDeg3dOw0o9ep72zSgHMb9aWb+W9VzDJJ0LGJqkcQwjlrh+
   bfvgu87kFBSMTDkpk/RDNXIogcpnwCvAGE56jaWU+/PYvNEVjqXDPvftf
   A==;
X-CSE-ConnectionGUID: l02P3wPcT9m61cM9oxugBA==
X-CSE-MsgGUID: 9/QliXVBQquwa8GQsH0ZZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68752700"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68752700"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:41:03 -0800
X-CSE-ConnectionGUID: aIrJStWtT7qVWhC+iYrhzw==
X-CSE-MsgGUID: r7Yogk3pTNeKDR1KiWYf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="201041281"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jan 2026 04:41:02 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbeSi-000000002Fh-0cdQ;
	Fri, 02 Jan 2026 12:41:00 +0000
Date: Fri, 02 Jan 2026 20:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/char/ipmi/ipmi_msghandler.c:2374:1-7: preceding lock
 on line 2322
Message-ID: <202601022049.Lgqsg2gc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Corey Minyard <corey@minyard.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 6f7f6605c9aeb472b5d4101b263b1fc5dc3cf623 ipmi:msghandler: Export and fix panic messaging capability
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601022049.Lgqsg2gc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601022049.Lgqsg2gc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/ipmi/ipmi_msghandler.c:2374:1-7: preceding lock on line 2322

vim +2374 drivers/char/ipmi/ipmi_msghandler.c

42c2dc7e66a72f Corey Minyard       2018-04-05  2264  
42c2dc7e66a72f Corey Minyard       2018-04-05  2265  /*
42c2dc7e66a72f Corey Minyard       2018-04-05  2266   * Separate from ipmi_request so that the user does not have to be
42c2dc7e66a72f Corey Minyard       2018-04-05  2267   * supplied in certain circumstances (mainly at panic time).  If
42c2dc7e66a72f Corey Minyard       2018-04-05  2268   * messages are supplied, they will be freed, even if an error
42c2dc7e66a72f Corey Minyard       2018-04-05  2269   * occurs.
42c2dc7e66a72f Corey Minyard       2018-04-05  2270   */
2911c9886c8d54 Corey Minyard       2018-04-05  2271  static int i_ipmi_request(struct ipmi_user     *user,
a567b6230066e3 Corey Minyard       2018-04-05  2272  			  struct ipmi_smi      *intf,
42c2dc7e66a72f Corey Minyard       2018-04-05  2273  			  struct ipmi_addr     *addr,
42c2dc7e66a72f Corey Minyard       2018-04-05  2274  			  long                 msgid,
42c2dc7e66a72f Corey Minyard       2018-04-05  2275  			  struct kernel_ipmi_msg *msg,
42c2dc7e66a72f Corey Minyard       2018-04-05  2276  			  void                 *user_msg_data,
42c2dc7e66a72f Corey Minyard       2018-04-05  2277  			  void                 *supplied_smi,
42c2dc7e66a72f Corey Minyard       2018-04-05  2278  			  struct ipmi_recv_msg *supplied_recv,
42c2dc7e66a72f Corey Minyard       2018-04-05  2279  			  int                  priority,
42c2dc7e66a72f Corey Minyard       2018-04-05  2280  			  unsigned char        source_address,
42c2dc7e66a72f Corey Minyard       2018-04-05  2281  			  unsigned char        source_lun,
42c2dc7e66a72f Corey Minyard       2018-04-05  2282  			  int                  retries,
42c2dc7e66a72f Corey Minyard       2018-04-05  2283  			  unsigned int         retry_time_ms)
42c2dc7e66a72f Corey Minyard       2018-04-05  2284  {
42c2dc7e66a72f Corey Minyard       2018-04-05  2285  	struct ipmi_smi_msg *smi_msg;
42c2dc7e66a72f Corey Minyard       2018-04-05  2286  	struct ipmi_recv_msg *recv_msg;
6f7f6605c9aeb4 Corey Minyard       2025-04-22  2287  	int run_to_completion = READ_ONCE(intf->run_to_completion);
42c2dc7e66a72f Corey Minyard       2018-04-05  2288  	int rv = 0;
42c2dc7e66a72f Corey Minyard       2018-04-05  2289  
333730e456fa67 Corey Minyard       2022-03-28  2290  	if (user) {
333730e456fa67 Corey Minyard       2022-03-28  2291  		if (atomic_add_return(1, &user->nr_msgs) > max_msgs_per_user) {
333730e456fa67 Corey Minyard       2022-03-28  2292  			/* Decrement will happen at the end of the routine. */
333730e456fa67 Corey Minyard       2022-03-28  2293  			rv = -EBUSY;
333730e456fa67 Corey Minyard       2022-03-28  2294  			goto out;
333730e456fa67 Corey Minyard       2022-03-28  2295  		}
333730e456fa67 Corey Minyard       2022-03-28  2296  	}
333730e456fa67 Corey Minyard       2022-03-28  2297  
42c2dc7e66a72f Corey Minyard       2018-04-05  2298  	if (supplied_recv)
42c2dc7e66a72f Corey Minyard       2018-04-05  2299  		recv_msg = supplied_recv;
42c2dc7e66a72f Corey Minyard       2018-04-05  2300  	else {
42c2dc7e66a72f Corey Minyard       2018-04-05  2301  		recv_msg = ipmi_alloc_recv_msg();
e86ee2d44b4405 Corey Minyard       2018-04-05  2302  		if (recv_msg == NULL) {
e86ee2d44b4405 Corey Minyard       2018-04-05  2303  			rv = -ENOMEM;
e86ee2d44b4405 Corey Minyard       2018-04-05  2304  			goto out;
e86ee2d44b4405 Corey Minyard       2018-04-05  2305  		}
42c2dc7e66a72f Corey Minyard       2018-04-05  2306  	}
42c2dc7e66a72f Corey Minyard       2018-04-05  2307  	recv_msg->user_msg_data = user_msg_data;
42c2dc7e66a72f Corey Minyard       2018-04-05  2308  
42c2dc7e66a72f Corey Minyard       2018-04-05  2309  	if (supplied_smi)
5396ccbd79ab03 Yu Zhe              2022-04-21  2310  		smi_msg = supplied_smi;
42c2dc7e66a72f Corey Minyard       2018-04-05  2311  	else {
42c2dc7e66a72f Corey Minyard       2018-04-05  2312  		smi_msg = ipmi_alloc_smi_msg();
42c2dc7e66a72f Corey Minyard       2018-04-05  2313  		if (smi_msg == NULL) {
2033f6858970b9 Corey Minyard       2019-08-16  2314  			if (!supplied_recv)
42c2dc7e66a72f Corey Minyard       2018-04-05  2315  				ipmi_free_recv_msg(recv_msg);
e86ee2d44b4405 Corey Minyard       2018-04-05  2316  			rv = -ENOMEM;
e86ee2d44b4405 Corey Minyard       2018-04-05  2317  			goto out;
42c2dc7e66a72f Corey Minyard       2018-04-05  2318  		}
42c2dc7e66a72f Corey Minyard       2018-04-05  2319  	}
42c2dc7e66a72f Corey Minyard       2018-04-05  2320  
6f7f6605c9aeb4 Corey Minyard       2025-04-22  2321  	if (!run_to_completion)
84fe1ebcc92cf3 Corey Minyard       2025-03-21 @2322  		mutex_lock(&intf->users_mutex);
42c2dc7e66a72f Corey Minyard       2018-04-05  2323  	if (intf->in_shutdown) {
42c2dc7e66a72f Corey Minyard       2018-04-05  2324  		rv = -ENODEV;
42c2dc7e66a72f Corey Minyard       2018-04-05  2325  		goto out_err;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2326  	}
42c2dc7e66a72f Corey Minyard       2018-04-05  2327  
42c2dc7e66a72f Corey Minyard       2018-04-05  2328  	recv_msg->user = user;
42c2dc7e66a72f Corey Minyard       2018-04-05  2329  	if (user)
e86ee2d44b4405 Corey Minyard       2018-04-05  2330  		/* The put happens when the message is freed. */
42c2dc7e66a72f Corey Minyard       2018-04-05  2331  		kref_get(&user->refcount);
42c2dc7e66a72f Corey Minyard       2018-04-05  2332  	recv_msg->msgid = msgid;
42c2dc7e66a72f Corey Minyard       2018-04-05  2333  	/*
42c2dc7e66a72f Corey Minyard       2018-04-05  2334  	 * Store the message to send in the receive message so timeout
42c2dc7e66a72f Corey Minyard       2018-04-05  2335  	 * responses can get the proper response data.
42c2dc7e66a72f Corey Minyard       2018-04-05  2336  	 */
42c2dc7e66a72f Corey Minyard       2018-04-05  2337  	recv_msg->msg = *msg;
42c2dc7e66a72f Corey Minyard       2018-04-05  2338  
42c2dc7e66a72f Corey Minyard       2018-04-05  2339  	if (addr->addr_type == IPMI_SYSTEM_INTERFACE_ADDR_TYPE) {
42c2dc7e66a72f Corey Minyard       2018-04-05  2340  		rv = i_ipmi_req_sysintf(intf, addr, msgid, msg, smi_msg,
42c2dc7e66a72f Corey Minyard       2018-04-05  2341  					recv_msg, retries, retry_time_ms);
42c2dc7e66a72f Corey Minyard       2018-04-05  2342  	} else if (is_ipmb_addr(addr) || is_ipmb_bcast_addr(addr)) {
42c2dc7e66a72f Corey Minyard       2018-04-05  2343  		rv = i_ipmi_req_ipmb(intf, addr, msgid, msg, smi_msg, recv_msg,
42c2dc7e66a72f Corey Minyard       2018-04-05  2344  				     source_address, source_lun,
42c2dc7e66a72f Corey Minyard       2018-04-05  2345  				     retries, retry_time_ms);
059747c245f0e9 Corey Minyard       2021-09-24  2346  	} else if (is_ipmb_direct_addr(addr)) {
059747c245f0e9 Corey Minyard       2021-09-24  2347  		rv = i_ipmi_req_ipmb_direct(intf, addr, msgid, msg, smi_msg,
059747c245f0e9 Corey Minyard       2021-09-24  2348  					    recv_msg, source_lun);
42c2dc7e66a72f Corey Minyard       2018-04-05  2349  	} else if (is_lan_addr(addr)) {
42c2dc7e66a72f Corey Minyard       2018-04-05  2350  		rv = i_ipmi_req_lan(intf, addr, msgid, msg, smi_msg, recv_msg,
42c2dc7e66a72f Corey Minyard       2018-04-05  2351  				    source_lun, retries, retry_time_ms);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2352  	} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2353  	    /* Unknown address type. */
b2655f2615e92e Konstantin Baydarov 2008-04-29  2354  		ipmi_inc_stat(intf, sent_invalid_commands);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2355  		rv = -EINVAL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2356  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2357  
42c2dc7e66a72f Corey Minyard       2018-04-05  2358  	if (rv) {
42c2dc7e66a72f Corey Minyard       2018-04-05  2359  out_err:
42c2dc7e66a72f Corey Minyard       2018-04-05  2360  		ipmi_free_smi_msg(smi_msg);
42c2dc7e66a72f Corey Minyard       2018-04-05  2361  		ipmi_free_recv_msg(recv_msg);
42c2dc7e66a72f Corey Minyard       2018-04-05  2362  	} else {
b2c6941a5cf4a6 Corey Minyard       2022-04-13  2363  		dev_dbg(intf->si_dev, "Send: %*ph\n",
b2c6941a5cf4a6 Corey Minyard       2022-04-13  2364  			smi_msg->data_size, smi_msg->data);
b2c03941b50944 Corey Minyard       2006-12-06  2365  
7ea0ed2b5be817 Corey Minyard       2014-11-06  2366  		smi_send(intf, intf->handlers, smi_msg, priority);
42c2dc7e66a72f Corey Minyard       2018-04-05  2367  	}
6f7f6605c9aeb4 Corey Minyard       2025-04-22  2368  	if (!run_to_completion)
84fe1ebcc92cf3 Corey Minyard       2025-03-21  2369  		mutex_unlock(&intf->users_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2370  
e86ee2d44b4405 Corey Minyard       2018-04-05  2371  out:
333730e456fa67 Corey Minyard       2022-03-28  2372  	if (rv && user)
333730e456fa67 Corey Minyard       2022-03-28  2373  		atomic_dec(&user->nr_msgs);
^1da177e4c3f41 Linus Torvalds      2005-04-16 @2374  	return rv;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2375  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  2376  

:::::: The code at line 2374 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
