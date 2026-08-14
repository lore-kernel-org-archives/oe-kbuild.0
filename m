Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3972459EA
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673877; cv=none; b=Jn+/bt4RvO1ElO8rLQab6Yupzu5VYqqoidaVsiPW7U3LV01zduTfhh05cMwnPE19Q6SEYgTsW+7ofnFtkzkrjWtZ6shPpDGJAA+psHrc7sW009PVv5IASS+N7E+ly92+AnD0iI5bWp6MMy7dwR3sOWPvzv6ieCm6MDhvwbHPaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673877; c=relaxed/simple;
	bh=M8l+wCFpuZryQfY+HwlnykXDBHON0O74m3EP0cTfTNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UTcZ7+au36+h482xM3YN2A866Xca0EoFIQBDOWbH90IgkV22OpIglMp5541LjxBD4cuMpFabOhS/0c70Sz4SQKgsjJEltQpvmkYLimSU7+z36RwQ0Pb7m8pQ5Q4Rh/8FCm9N6krGDDdZfD1tM/2quSIkFVyKNLCXRkQ8N47GCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQW8dqQg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQW8dqQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786673874; x=1818209874;
  h=date:from:to:cc:subject:message-id;
  bh=M8l+wCFpuZryQfY+HwlnykXDBHON0O74m3EP0cTfTNI=;
  b=DQW8dqQgEQ4bky4PrCTXfCcMsrs219tkC70SypGe3hlcwnoxzY66v5Y6
   skMLoREoUlf73B6v9n+Ut7tB8ZIh1dFGKHkKzSLa7wvCr/Yv9pnBd/sOy
   Nt8o1a5wPn5POJ9TkLD4apI1p9Qk/IKDuev2xNga6ZB6DCDtlm/H5Qx/2
   BFFV9p2JmroR47Pi15689zNqA0k2yhdmXHK2xiYA2z+LZJPt9780qabts
   CLGeycG5rw2O7LtBn/ISJU4krJgulJwJTqL0DtQ1B014AS7+COBFfiEaN
   Nsf3/UVuXX/SGVHfrpQZujfKwYd0nrjD43fK6GSYDVhEyTP33m3SVOUOZ
   w==;
X-CSE-ConnectionGUID: /4p+ygmTR3S+HhsIBihNeA==
X-CSE-MsgGUID: BRZfjXrpScSj5ILHyy49fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97846377"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97846377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 19:17:53 -0700
X-CSE-ConnectionGUID: lG7GTkC3SO2pPYYJ30PXkw==
X-CSE-MsgGUID: +h/iUXLUTTqVsQxydjeSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="287580694"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Aug 2026 19:17:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuhUU-00000000XPs-2Cda;
	Fri, 14 Aug 2026 02:17:50 +0000
Date: Fri, 14 Aug 2026 10:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ceph/osdmap.c:297 decode_array_32_alloc() warn:
 potential user controlled sizeof overflow 'len * 4' '1-u32max * 4'
Message-ID: <202608141016.LXq2zvlH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   3 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-r073-20260813 (https://download.01.org/0day-ci/archive/20260814/202608141016.LXq2zvlH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608141016.LXq2zvlH-lkp@intel.com/

New smatch warnings:
net/ceph/osdmap.c:297 decode_array_32_alloc() warn: potential user controlled sizeof overflow 'len * 4' '1-u32max * 4'

Old smatch warnings:
net/ceph/osdmap.c:530 crush_decode() warn: potential user controlled sizeof overflow 'b->size * 4' '0-u32max * 4'

vim +297 net/ceph/osdmap.c

5cf9c4a9959b62 Ilya Dryomov 2017-06-22  280  
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  281  static u32 *decode_array_32_alloc(void **p, void *end, u32 *plen)
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  282  {
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  283  	u32 *a = NULL;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  284  	u32 len;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  285  	int ret;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  286  
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  287  	ceph_decode_32_safe(p, end, len, e_inval);
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  288  	if (len) {
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  289  		u32 i;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  290  
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  291  		a = kmalloc_array(len, sizeof(u32), GFP_NOIO);
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  292  		if (!a) {
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  293  			ret = -ENOMEM;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  294  			goto fail;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  295  		}
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  296  
5cf9c4a9959b62 Ilya Dryomov 2017-06-22 @297  		ceph_decode_need(p, end, len * sizeof(u32), e_inval);
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  298  		for (i = 0; i < len; i++)
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  299  			a[i] = ceph_decode_32(p);
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  300  	}
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  301  
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  302  	*plen = len;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  303  	return a;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  304  
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  305  e_inval:
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  306  	ret = -EINVAL;
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  307  fail:
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  308  	kfree(a);
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  309  	return ERR_PTR(ret);
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  310  }
5cf9c4a9959b62 Ilya Dryomov 2017-06-22  311  

:::::: The code at line 297 was first introduced by commit
:::::: 5cf9c4a9959b6273675310d14a834ef14fbca37c libceph, crush: per-pool crush_choose_arg_map for crush_do_rule()

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
