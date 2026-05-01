Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AA189F43
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777596961; cv=none; b=pyY7hW7AS2iEv1W5bEy+TcH6y1+wyEVjB7FY1RA8ppbu1yEqbYu67xIS3l6wXp/tgbWeFf0os0qRupBvzi2jjzJhj1MT5i2VmPB39q/9p/nKhKpyGGUnZ2kZCfptSLDPWU4CxwgfajtuHXLIihvTCX29y98SCsiHvQM4V3tMm9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777596961; c=relaxed/simple;
	bh=ZOL4K3crm1r2s7h/UCT6QlO3TCM4ZMe4YE4HIh0FzbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UeuuCFBCaJWFqimkN60ujufiT3symo5+6F2UPd13Qt43oGq9L/YOCNfD8cWzw59u2I83tA4DSwca5BgQb9DdU3Cd9hKmZUc+9UDqgROxrRzqk3oXS0XnXT4qDv92Pi7XGnuxTbk/PtkLLgbx7OusXO+5ojxg1xXZrU38DbH4sMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGbOMikQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGbOMikQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777596959; x=1809132959;
  h=date:from:to:cc:subject:message-id;
  bh=ZOL4K3crm1r2s7h/UCT6QlO3TCM4ZMe4YE4HIh0FzbY=;
  b=YGbOMikQxqkEeqCg6QYjQJRLVFkLWigrFPmWM3HjwvV2RhrsrN30+pJm
   pHUZb9XxN6yjyq3i8F4L4qt2+iyY1HeJ+hrxJgRDkBjpYq2e7D5dslaw3
   9CLXbqB13jZ7QpjzPyYuwo0/HGYre5W0MApfuwuM5jMKw0ccphGOmf4Z/
   ZtRQ4SlLGeRTqeohe02joxeK6Gtis6Eyu8iklN9MXvjWmSNNJe7bxqOSq
   hHsJjU8o7LASGIHGzVljNFnZNoC2QagbiNs8iES1SdiJyObkHWBEoCNJH
   QEvfMLt1ugBvd5Fp15P2oCsQVVURUZsboDybsht4ZcDTVtamSH+SIyjk/
   Q==;
X-CSE-ConnectionGUID: KnS7W/GBTl2eKIsLg6Rvrg==
X-CSE-MsgGUID: M/CSm+KVTxmTWzxTHQuzzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="77733036"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="77733036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 17:55:58 -0700
X-CSE-ConnectionGUID: 0uNH6cXJQ0CWj41UVX4Z3w==
X-CSE-MsgGUID: Yy1pkfRrSuiXYftpH/EFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="234633764"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 17:55:57 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIcAZ-00000000DBq-1KOV;
	Fri, 01 May 2026 00:55:51 +0000
Date: Fri, 01 May 2026 08:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:alloc-token 3/4] net/ceph/osdmap.c:297
 decode_array_32_alloc() warn: potential user controlled sizeof overflow 'len
 * 4' '1-u32max * 4'
Message-ID: <202605010849.3YiZsHq9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   3a674f33fa09193cbf94df7fa514768d77a09974
commit: c7703023e2a2b049bacbe66cfb5c7d2b0957cc3a [3/4] slab: support for compiler-assisted type-based slab cache partitioning
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: sparc-randconfig-r072-20260430 (https://download.01.org/0day-ci/archive/20260501/202605010849.3YiZsHq9-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605010849.3YiZsHq9-lkp@intel.com/

New smatch warnings:
net/ceph/osdmap.c:297 decode_array_32_alloc() warn: potential user controlled sizeof overflow 'len * 4' '1-u32max * 4'

Old smatch warnings:
net/ceph/osdmap.c:204 decode_crush_names() warn: potential spectre issue 'cn->cn_name' [w]
net/ceph/osdmap.c:386 decode_choose_args() warn: potential spectre issue 'arg_map->args' [r] (local cap)
net/ceph/osdmap.c:530 crush_decode() warn: potential user controlled sizeof overflow 'b->size * 4' '0-u32max * 4'
net/ceph/osdmap.c:1877 decode_new_up_state_weight() warn: potential spectre issue 'map->osd_weight' [w] (local cap)
net/ceph/osdmap.c:1884 decode_new_up_state_weight() warn: potential spectre issue 'map->osd_state' [w] (local cap)
net/ceph/osdmap.c:1947 decode_new_up_state_weight() warn: potential spectre issue 'map->osd_addr' [w] (local cap)

vim +297 net/ceph/osdmap.c

5cf9c4a9959b627 Ilya Dryomov 2017-06-22  280  
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  281  static u32 *decode_array_32_alloc(void **p, void *end, u32 *plen)
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  282  {
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  283  	u32 *a = NULL;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  284  	u32 len;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  285  	int ret;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  286  
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  287  	ceph_decode_32_safe(p, end, len, e_inval);
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  288  	if (len) {
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  289  		u32 i;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  290  
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  291  		a = kmalloc_array(len, sizeof(u32), GFP_NOIO);
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  292  		if (!a) {
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  293  			ret = -ENOMEM;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  294  			goto fail;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  295  		}
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  296  
5cf9c4a9959b627 Ilya Dryomov 2017-06-22 @297  		ceph_decode_need(p, end, len * sizeof(u32), e_inval);
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  298  		for (i = 0; i < len; i++)
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  299  			a[i] = ceph_decode_32(p);
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  300  	}
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  301  
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  302  	*plen = len;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  303  	return a;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  304  
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  305  e_inval:
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  306  	ret = -EINVAL;
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  307  fail:
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  308  	kfree(a);
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  309  	return ERR_PTR(ret);
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  310  }
5cf9c4a9959b627 Ilya Dryomov 2017-06-22  311  

:::::: The code at line 297 was first introduced by commit
:::::: 5cf9c4a9959b6273675310d14a834ef14fbca37c libceph, crush: per-pool crush_choose_arg_map for crush_do_rule()

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
