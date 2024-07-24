Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B724C84
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jul 2024 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721802491; cv=none; b=YGvosSsO5MnNHuPa1pVA3BNp/p898yiSCYZuLVDwBSIYv/qUIDQUpwmVialXug7dlvHJv1i/X0lsZdzlP+oO2XqZoCTc4UjFnktUwFb8yrFzYZ/6DAT8bwFGlCM7U1wWm1HoXfiMfn8SjMjAHctKTBaUb3LPopE18Pnsi4O5J58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721802491; c=relaxed/simple;
	bh=zpfR+CMgiYYRE5/a3XtkQXvK1EhtawCCIwdV1E4kSyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbolUBuDHYJQ4lCT+e7mYI2LXpanWdOhPTLCmu2jcEb+kUf85Ux96ZbDqFayuFN1PQi5W4wWmXhfYthFP3CerIaOeu63UqmbTPsKdOIqZg9QV34A98N+SA4fJAy+adLQg1qMjD7oSdQFWe/JrXSDHSwXYdmL0OdpUNrPGOOWfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdx2DNy1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdx2DNy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721802490; x=1753338490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpfR+CMgiYYRE5/a3XtkQXvK1EhtawCCIwdV1E4kSyE=;
  b=fdx2DNy1MW68guF89XBZOdo7TtT5ajF1dGz+J0JJV7ivQ9nOm4Yix/x+
   cWwP+pd3Ladpo+a78IVDGSayZ+VFaD1OGO2zBwAtnj7svqcbIbhmVMjqt
   RHPbrCpK8r3c6pTjjxeKZjFj6kdDSMczFovM1z8HFVjRD+MdZ0ByAI9Ax
   RONEElJQ6SysxtUutvsN+6Dol4ZMfCcouYbTX8LLPYJixeaj5Cfn9B4TM
   Vs3wOnTJNDIpofixV4s4ZRtoHDhXjNILk3f77hEDDITBAEmZvOmYMMQ/Z
   5aY/4Y6IbskjVcxvjC4YH0p6CDljdpFS9o9t/dH6zyt8T04FaMbqKbF/C
   w==;
X-CSE-ConnectionGUID: +bClpaqxTvuDW8QAhPeGKg==
X-CSE-MsgGUID: 1f8KnCgXQ9iHwiWtwBJWHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19335278"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19335278"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 23:28:09 -0700
X-CSE-ConnectionGUID: ScCu7jomRpCGYl631ukyiw==
X-CSE-MsgGUID: 55oh+PlnTs2Da8xaBTK3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52358153"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jul 2024 23:28:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWVTq-000mkK-1k;
	Wed, 24 Jul 2024 06:28:06 +0000
Date: Wed, 24 Jul 2024 14:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
Message-ID: <202407241429.CIWKIQVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Petr Machata <petrm@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Nikolay Aleksandrov <razor@blackwall.org>
CC: David Ahern <dsahern@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   786c8248dbd33a5a7a07f7c6e55a7bfc68d2ca48
commit: 4ee2a8cace3fb9a34aea6a56426f89d26dd514f3 net: ipv4: Add a sysctl to set multipath hash seed
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: alpha-randconfig-r111-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241429.CIWKIQVa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240724/202407241429.CIWKIQVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407241429.CIWKIQVa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/route.c:2342:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 @@
   net/ipv6/route.c:2342:39: sparse:     expected unsigned int [usertype] flow_label
   net/ipv6/route.c:2342:39: sparse:     got restricted __be32
   net/ipv6/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute6.h):
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar

vim +539 include/net/ip_fib.h

3e453ca122d483 Petr Machata 2024-06-07  532  
4ee2a8cace3fb9 Petr Machata 2024-06-07  533  static inline u32 fib_multipath_hash_from_keys(const struct net *net,
4ee2a8cace3fb9 Petr Machata 2024-06-07  534  					       struct flow_keys *keys)
4ee2a8cace3fb9 Petr Machata 2024-06-07  535  {
4ee2a8cace3fb9 Petr Machata 2024-06-07  536  	siphash_aligned_key_t hash_key;
4ee2a8cace3fb9 Petr Machata 2024-06-07  537  	u32 mp_seed;
4ee2a8cace3fb9 Petr Machata 2024-06-07  538  
4ee2a8cace3fb9 Petr Machata 2024-06-07 @539  	mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;
4ee2a8cace3fb9 Petr Machata 2024-06-07  540  	fib_multipath_hash_construct_key(&hash_key, mp_seed);
4ee2a8cace3fb9 Petr Machata 2024-06-07  541  
4ee2a8cace3fb9 Petr Machata 2024-06-07  542  	return flow_hash_from_keys_seed(keys, &hash_key);
4ee2a8cace3fb9 Petr Machata 2024-06-07  543  }
4ee2a8cace3fb9 Petr Machata 2024-06-07  544  #else
3e453ca122d483 Petr Machata 2024-06-07  545  static inline u32 fib_multipath_hash_from_keys(const struct net *net,
3e453ca122d483 Petr Machata 2024-06-07  546  					       struct flow_keys *keys)
3e453ca122d483 Petr Machata 2024-06-07  547  {
3e453ca122d483 Petr Machata 2024-06-07  548  	return flow_hash_from_keys(keys);
3e453ca122d483 Petr Machata 2024-06-07  549  }
4ee2a8cace3fb9 Petr Machata 2024-06-07  550  #endif
3e453ca122d483 Petr Machata 2024-06-07  551  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
