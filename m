Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262E13BAFA
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465379; cv=none; b=MDFFIf79YH2ojiI04QyKnPhFS1rkbIuNWkAyrXEEn6rNGzLWyAJM3JJb0EvtafEGD+rb8Jaq+LAMV3NB1hzwdbRZIZKGRgq1t9l33z9mAfDbd78mNwco65pdZJpDqzcjOq+63TVzbQDmALTfNCIlgoQLrxH8pJOcl7OSlf0aMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465379; c=relaxed/simple;
	bh=d7MgYVHMxuzny0y6v1pBUgPgd0F8ZGrVNeEP3BzPQVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5wfq6DFYbyq/CnCFt8g/skEpVnd2E++hzad8MmptTTYT/Ak2xGBpkQqsLwGD3YO0Jdcq1KqE6NvEAUWMPGfzEUtqF6NWPISyAcgjfqjIfFQScWMois6YK7cTYrCWhwIWAzo2/tT6XxlfDJQw+3H285MmSK8v3JfDfhLQA80VZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OD8TOyfn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OD8TOyfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716465377; x=1748001377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d7MgYVHMxuzny0y6v1pBUgPgd0F8ZGrVNeEP3BzPQVM=;
  b=OD8TOyfnsoYZ08LdQclODtmgBr/5y8f/gnwjYTtcTKXSgwJvZIhqpNkz
   KOZ91j9od6RbAi3XjjWbO2tjnZ6NNY9/bR1J4rB4bWWwCxGuA1+mscoE5
   lbeVwmRCju0vzva9GCCkYxkihdEPVY+sOezhcb1pP4beHmijjftm5taGN
   OTYyP3NKpJLRvpOWCacx/uyawHGWPLTuNrQjboidMGrrVnsatW70eO7I4
   +LCwhhyISTWNQKNTF8cI4ixZrfiqFPuwyVTx1WdlWk/DgzVHJLq+rZVT1
   xgSgwEmAI8h7B+zKSKXIp/UXHqCbPIZAtWrMy/yZEPV9m048s69XePuX7
   w==;
X-CSE-ConnectionGUID: 0qCCJctCSKiCNJ4fRuqJKg==
X-CSE-MsgGUID: hHZZRclBRMCExme67uKASA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11660499"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="11660499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 04:56:17 -0700
X-CSE-ConnectionGUID: 9YoGMk5wT8CzkHKoGGmQxA==
X-CSE-MsgGUID: jygHJpDpTPmfOM8673VLgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="56875889"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 May 2024 04:56:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA73N-0002oH-1P;
	Thu, 23 May 2024 11:56:13 +0000
Date: Thu, 23 May 2024 19:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:zcrx/next 47/68] net/ipv4/tcp.c:2373 tcp_xa_pool_refill()
 error: uninitialized symbol 'err'.
Message-ID: <202405231907.2Pa5F0cE-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zcrx/next
head:   9b5718278c90658985f5d335dff91dd589b3d4c7
commit: 63ab49256a5efea098be7c827c8516220d8c21ae [47/68] tcp: RX path for devmem TCP
:::::: branch date: 17 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231907.2Pa5F0cE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405231907.2Pa5F0cE-lkp@intel.com/

New smatch warnings:
net/ipv4/tcp.c:2373 tcp_xa_pool_refill() error: uninitialized symbol 'err'.

Old smatch warnings:
net/ipv4/tcp.c:2688 tcp_recvmsg_locked() error: uninitialized symbol 'peek_seq'.

vim +/err +2373 net/ipv4/tcp.c

63ab49256a5efe Mina Almasry 2024-05-10  2350  
63ab49256a5efe Mina Almasry 2024-05-10  2351  static int tcp_xa_pool_refill(struct sock *sk, struct tcp_xa_pool *p,
63ab49256a5efe Mina Almasry 2024-05-10  2352  			      unsigned int max_frags)
63ab49256a5efe Mina Almasry 2024-05-10  2353  {
63ab49256a5efe Mina Almasry 2024-05-10  2354  	int err, k;
63ab49256a5efe Mina Almasry 2024-05-10  2355  
63ab49256a5efe Mina Almasry 2024-05-10  2356  	if (p->idx < p->max)
63ab49256a5efe Mina Almasry 2024-05-10  2357  		return 0;
63ab49256a5efe Mina Almasry 2024-05-10  2358  
63ab49256a5efe Mina Almasry 2024-05-10  2359  	xa_lock_bh(&sk->sk_user_frags);
63ab49256a5efe Mina Almasry 2024-05-10  2360  
63ab49256a5efe Mina Almasry 2024-05-10  2361  	tcp_xa_pool_commit(sk, p, false);
63ab49256a5efe Mina Almasry 2024-05-10  2362  	for (k = 0; k < max_frags; k++) {
63ab49256a5efe Mina Almasry 2024-05-10  2363  		err = __xa_alloc(&sk->sk_user_frags, &p->tokens[k],
63ab49256a5efe Mina Almasry 2024-05-10  2364  				 XA_ZERO_ENTRY, xa_limit_31b, GFP_KERNEL);
63ab49256a5efe Mina Almasry 2024-05-10  2365  		if (err)
63ab49256a5efe Mina Almasry 2024-05-10  2366  			break;
63ab49256a5efe Mina Almasry 2024-05-10  2367  	}
63ab49256a5efe Mina Almasry 2024-05-10  2368  
63ab49256a5efe Mina Almasry 2024-05-10  2369  	xa_unlock_bh(&sk->sk_user_frags);
63ab49256a5efe Mina Almasry 2024-05-10  2370  
63ab49256a5efe Mina Almasry 2024-05-10  2371  	p->max = k;
63ab49256a5efe Mina Almasry 2024-05-10  2372  	p->idx = 0;
63ab49256a5efe Mina Almasry 2024-05-10 @2373  	return k ? 0 : err;
63ab49256a5efe Mina Almasry 2024-05-10  2374  }
63ab49256a5efe Mina Almasry 2024-05-10  2375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
