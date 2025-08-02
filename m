Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677701D63EE
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754164904; cv=none; b=TcwJrYuh8mgcH8aFOe6Lamu/lD8l38xWxU9F4w2o7Qz7Sja6NE047H8VUEtvVKFCxUcgTP6+nLfEHM3hSoGAPgcvfRCch7Gk8jG2Es97+1ycUdtBV2hQkAGLucPaRaUkSPjQKRSnsXfe/9RxivqhCnEZfEgHq01m/98cek4cw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754164904; c=relaxed/simple;
	bh=Hh5Ic3CekfKx3Werhmj0Iu8+yeyoNM1c5A9SoQ3p6+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOhNCVD6AYrn/CmPzITXQcPPiNnfWfkVY2paURscCroVhYjFYrrrMmLU7i46Kpg2z8Cx2DCELG4NjCEs7FC8l5VG3xXTqCD0fO5KjMt96cMFM/kfLfpCMYDJIkmCj06Rafvr1Te1+LtQr8IKADp2LW1EGIBhgM6lIF4FqoFGT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QB0HrSx/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QB0HrSx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754164902; x=1785700902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hh5Ic3CekfKx3Werhmj0Iu8+yeyoNM1c5A9SoQ3p6+E=;
  b=QB0HrSx/GI8BBVB6FmPYwL2c7ArYg0aX68FeKkjDdgZZCFhHq1LqF6bi
   4J0fwrUUp1uH4DRH6bzFf+e/akYF81B4boJ/PJ3ypzgqGX8ZQnRa3lCT8
   8DbzBQhAeo2Ro9B4hPaqk76i9Z8eIUqw2qer1VWR8XMB1e49gOig+fznp
   1jhUIDpvl0uXi/7d/R8jAcHPiqXMeJisc9rrtQrhZaJH3mYlS0JUbQ3+l
   Rmuhg10c0kfqwyYVRIfRFTGFGf4pEwC/QSpwehKZzxAHEl1Qd7b80RlmP
   CFjKbGY48mzsgEDzzzTC4rjyzIsh0FNkbgrDb5jPqjrZbNMWYVhSSPy5m
   w==;
X-CSE-ConnectionGUID: /b2QlRmDT06z5rkeb0Vb0A==
X-CSE-MsgGUID: SxEiHte8Tf+pfjczywDAtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56350025"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56350025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 13:01:39 -0700
X-CSE-ConnectionGUID: v8kcncXOReWhr3PH/j4rVw==
X-CSE-MsgGUID: hPstVNg3TvWRa6wG66zevg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194783971"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Aug 2025 13:01:39 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiIQC-0005aE-1C;
	Sat, 02 Aug 2025 20:01:36 +0000
Date: Sun, 3 Aug 2025 04:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 14/33] include/net/sock.h:2180 sk_dst_set()
 error: uninitialized symbol 'old_dst'.
Message-ID: <202508030314.lXosscjI-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 20516295fa8be1f4447326d6b8fa1b1c5e236951 [14/33] rcu: Support Clang's capability analysis
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030314.lXosscjI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508030314.lXosscjI-lkp@intel.com/

smatch warnings:
include/net/sock.h:2180 sk_dst_set() error: uninitialized symbol 'old_dst'.

vim +/old_dst +2180 include/net/sock.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  2171  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2172  static inline void
^1da177e4c3f41 Linus Torvalds 2005-04-16  2173  sk_dst_set(struct sock *sk, struct dst_entry *dst)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2174  {
7f502361531e9e Eric Dumazet   2014-06-30  2175  	struct dst_entry *old_dst;
7f502361531e9e Eric Dumazet   2014-06-30  2176  
7f502361531e9e Eric Dumazet   2014-06-30  2177  	sk_tx_queue_clear(sk);
eb44ad4e635132 Eric Dumazet   2023-09-21  2178  	WRITE_ONCE(sk->sk_dst_pending_confirm, 0);
b4cb4a1391dcdc Eric Dumazet   2024-06-04  2179  	old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
7f502361531e9e Eric Dumazet   2014-06-30 @2180  	dst_release(old_dst);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2181  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2182  

:::::: The code at line 2180 was first introduced by commit
:::::: 7f502361531e9eecb396cf99bdc9e9a59f7ebd7f ipv4: irq safe sk_dst_[re]set() and ipv4_sk_update_pmtu() fix

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
