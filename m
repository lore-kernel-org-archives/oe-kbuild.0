Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD073804
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728813350; cv=none; b=t+6x+CDrfoRwAhs1j3PVscVGLDjvWAO9Lydk1CkW/SRtaw/RCLKZUvJUwSiFDNswo0+yLVlDzO8tFAOTAVfds/yXN9WdC5B5iyrYy+KyCAr5rrQ7BKFUghhMIyKmPGlUCMdrLSFcr3fuoXRBt4tq37hLgrxYRaEZ17WHrck7aDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728813350; c=relaxed/simple;
	bh=/UhpOnTKmWPhPT4Ya3egKVTS2mXisOY3EvnesIELZ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tW6JcKM40VvGwpPZd50mr8a1ZnsZT0zX79XcIMd5ak+i6qMOUJutdQ+n76bB7tmTt6WfufTyfZHFaf5swogBBmmV3aZJupBHZh/cJuJHrfdzrGGo8eXcrTTqUD9DqRyngpCH9o3Ymwtk6PGkrV15XqwZg4MBsKA9EUNezdGP6Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvkGIpbI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvkGIpbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728813349; x=1760349349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UhpOnTKmWPhPT4Ya3egKVTS2mXisOY3EvnesIELZ0A=;
  b=JvkGIpbIVsQEGyl0kvvbfIJw26+PsqyLfApLTIp+KOUsr4DDLLI/U8YN
   0gLLl23gQtt60r1icSBzyZHlJb4UriA9iWb9X5ViwBwmapwYun3fp1xAE
   T+moX3DRz3smauGkFkcToWmQwkiKBbaXQqmWEOK4h/UtnWYgLWb9oMnYo
   NrycR0QAYK/gLRyafG0PYQriZIllYvuqJceYwuNytoZsrzbPiOG5EzGYT
   43zinb6YtufjfeaPuCV7TBBQTnj38IIninePOi2T0BVwqSpL3GOvhwyVf
   Bh31IICju6fhbLxWqPBGMykDZutmD7jawA3+jD8KP4ZuGgPWQyDiPo10t
   A==;
X-CSE-ConnectionGUID: TUKC6XrNQV6M0uYX1owbSw==
X-CSE-MsgGUID: /2S/9VSBRvma22GchjNYjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45646573"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45646573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 02:55:45 -0700
X-CSE-ConnectionGUID: L4OX1OG9ToaugCaD7pVyqg==
X-CSE-MsgGUID: JqJwGNz3SOasNRwK4TJvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="108051972"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2024 02:55:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szvK8-000EGr-1P;
	Sun, 13 Oct 2024 09:55:40 +0000
Date: Sun, 13 Oct 2024 17:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by
 free on line 167
Message-ID: <202410131754.wXplnZk0-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36c254515dc6592c44db77b84908358979dd6b50
commit: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 bcachefs: rcu_pending now works in userspace
date:   5 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 weeks ago
config: sparc64-randconfig-r053-20241012 (https://download.01.org/0day-ci/archive/20241013/202410131754.wXplnZk0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410131754.wXplnZk0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by free on line 167

vim +167 fs/bcachefs/rcu_pending.c

8e973a4f3c7482 Kent Overstreet 2024-06-10  162  
d2ed0f206a9d8b Kent Overstreet 2024-08-23  163  #ifndef __KERNEL__
d2ed0f206a9d8b Kent Overstreet 2024-08-23  164  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b Kent Overstreet 2024-08-23  165  {
d2ed0f206a9d8b Kent Overstreet 2024-08-23  166  	while (nr--)
d2ed0f206a9d8b Kent Overstreet 2024-08-23 @167  		kfree(*p);
d2ed0f206a9d8b Kent Overstreet 2024-08-23  168  }
d2ed0f206a9d8b Kent Overstreet 2024-08-23  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
