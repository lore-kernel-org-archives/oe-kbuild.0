Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663072;
	b=jl7/hb7fGLd/Hq91yrgmWUYmRY95i43Q8wG7Agqb4Y1GQbrmaFlYG1mjWn1MOq35/gl1
	 e66f0OzucfW3kkXcg25Yo9aVTIMDIraVd9tZIJtLA712alqIrI2U+WYKt6UPe1oH5LLjE
	 YkBxR+eK1+7xRNsQxEHyDuufpMcT0mBkta65mJ269ClV7UoenMOJVUqBqzm8IQRUVgeCl
	 /tKbJAp3WRCu0BF00FS27RBKAaZVdAPwY9VM1AuXkQ7wfjT73oinFiSMQ9UlI545UONZk
	 NMJ+F2QBfJKBF+LwuCRDtfRkIWiIZKB+JbXEBnSOY2gqxNGTvgv2LdAg+1JGtJg2k5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663072;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rA8B3EgB/KZw5PLxip5hwKzcHwkyN1yONeuxdrEM2/M=;
	b=U9dvvGS1ufaSoIdikh3eLITbTbmLypXagDIJAnrvUZ69GoH8H/0xDVh8GUCaszkYi3pr
	 OzydnPWgCbJIZzsfA8lG6vyVrgSQGvAdIKKX7y8hII454DbI+E1NlmA8MEeSqHN9NrK0e
	 ls0eG6yOeHZ2pAeUlP9GMxFx4a29Ek3B8KLyzOi6eXiXxh9BHF0O2kiP/0divU4Ojb+Z0
	 w+NlLabFC7yEHbZVf7Shuu+5CyxIe+F8PrQPFt7EiiVvRV6e7ORaUFIfA6UxoSCgWD3jf
	 kK5tRQki5aDp0xJnrbGNEpV5jk5n/v5+eletnwYTcN2gsnRGmo4Jy5DDGvyClCaDYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AumDYQgv;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B1606A319
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Oct 2026 09:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019B1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AumDYQgv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792663071; x=1824199071;
  h=date:from:to:cc:subject:message-id;
  bh=Rf97vEowp5Q3IfThjh80MPqiK5rJR/OL+iyCBwlC+UQ=;
  b=AumDYQgv08UlUFRrZmvjYrK/RvIuAw7co+RvGUbY3zSjVdd4mQfE8XLt
   C6UfKQxHhn4HwI4/MTqL2DYcEyK/FKhMXsxana0bfM3X4la0s4kCgA+n3
   zUVIJmNz1y8hJjKX/CJvD3Z3WCRxCGgDqte6JzMrcjcCgN/I1HcdXe9nb
   xYpoa1qQodWubYUf9JDvSe3PHgpVQjjw2OHPau4qVjomq031pt3pHXzYF
   XVrmaiRspWbbIdLkGqVhZczDXv4xswpnHxQdkP/o6EQUTyCR0TQKrhT8y
   hNz/0Df8Qf3CCspgTPyfxhEFL2fipu/sAiu4kg1K+S9aieCkkGFQafUJe
   Q==;
X-CSE-ConnectionGUID: IZ2WsEKNTbq1uXx1guEHdA==
X-CSE-MsgGUID: ERCdTrnrTDultJbgEI+AMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1281903"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1281903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 02:57:50 -0700
X-CSE-ConnectionGUID: 4UqP3PiCSLC09NBCMjcQmQ==
X-CSE-MsgGUID: scyAQRbHQ7KdpZ9wU1oQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3244809"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2026 02:57:49 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJpYQ-000000000Hv-49xs;
	Thu, 22 Oct 2026 09:57:47 +0000
Date: Thu, 22 Oct 2026 11:57:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [harry:b4/memalloc-prof-dont-waste-slabobj-ext-metadata
 18/18] mm/slab_common.c:362 __kmem_cache_create_args() warn: bitwise AND
 condition is false here
Message-ID: <202610221102.1ITKXBWg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Harry Yoo (Meta)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git b4/memalloc-prof-dont-waste-slabobj-ext-metadata
head:   4eb758f1c30dafac114e68279058434bf6e617d9
commit: 4eb758f1c30dafac114e68279058434bf6e617d9 [18/18] mm/slab: do not set SLAB_MAY_ACCOUNT for all caches
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: xtensa-randconfig-r2201-20261022 (https://download.01.org/0day-ci/archive/20261022/202610221102.1ITKXBWg-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610221102.1ITKXBWg-lkp@intel.com/

New smatch warnings:
mm/slab_common.c:362 __kmem_cache_create_args() warn: bitwise AND condition is false here

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +362 mm/slab_common.c

afe0c26d1968fe Vlastimil Babka        2021-05-14  342  
aff8518575715b Vlastimil Babka        2026-01-23  343  	/*
aff8518575715b Vlastimil Babka        2026-01-23  344  	 * Caches with specific capacity are special enough. It's simpler to
aff8518575715b Vlastimil Babka        2026-01-23  345  	 * make them unmergeable.
aff8518575715b Vlastimil Babka        2026-01-23  346  	 */
aff8518575715b Vlastimil Babka        2026-01-23  347  	if (args->sheaf_capacity)
aff8518575715b Vlastimil Babka        2026-01-23  348  		flags |= SLAB_NO_MERGE;
aff8518575715b Vlastimil Babka        2026-01-23  349  
b920536aa0a4fd Pekka Enberg           2012-08-16  350  	mutex_lock(&slab_mutex);
686d550d222e8f Christoph Lameter      2012-09-05  351  
879fb3c274c12c Christian Brauner      2024-09-05  352  	err = kmem_cache_sanity_check(name, object_size);
3aa24f519e48e0 Andrew Morton          2014-10-09  353  	if (err) {
3965fc36522446 Vladimir Davydov       2014-01-23  354  		goto out_unlock;
3aa24f519e48e0 Andrew Morton          2014-10-09  355  	}
686d550d222e8f Christoph Lameter      2012-09-05  356  
e70954fd6d4b46 Thomas Garnier         2016-12-12  357  	if (flags & ~SLAB_FLAGS_PERMITTED) {
e70954fd6d4b46 Thomas Garnier         2016-12-12  358  		err = -EINVAL;
e70954fd6d4b46 Thomas Garnier         2016-12-12  359  		goto out_unlock;
e70954fd6d4b46 Thomas Garnier         2016-12-12  360  	}
e70954fd6d4b46 Thomas Garnier         2016-12-12  361  
4eb758f1c30daf Harry Yoo (Meta        2026-10-14 @362) 	if (flags & SLAB_ACCOUNT)
7def2e8549e518 Vlastimil Babka (SUSE  2026-07-27  363) 		flags |= SLAB_MAY_ACCOUNT;
4eb758f1c30daf Harry Yoo (Meta        2026-10-14  364) 	if (mem_cgroup_kmem_disabled())
4eb758f1c30daf Harry Yoo (Meta        2026-10-14  365) 		flags &= ~SLAB_MAY_ACCOUNT;
7def2e8549e518 Vlastimil Babka (SUSE  2026-07-27  366) 
8eb8284b412906 David Windsor          2017-06-10  367  	/* Fail closed on bad usersize of useroffset values. */
346907ceb9d11b Vlastimil Babka        2022-11-16  368  	if (!IS_ENABLED(CONFIG_HARDENED_USERCOPY) ||
879fb3c274c12c Christian Brauner      2024-09-05  369  	    WARN_ON(!args->usersize && args->useroffset) ||
879fb3c274c12c Christian Brauner      2024-09-05  370  	    WARN_ON(object_size < args->usersize ||
879fb3c274c12c Christian Brauner      2024-09-05  371  		    object_size - args->usersize < args->useroffset))
879fb3c274c12c Christian Brauner      2024-09-05  372  		args->usersize = args->useroffset = 0;
879fb3c274c12c Christian Brauner      2024-09-05  373  
8598351edc42f3 Vlastimil Babka        2026-01-23  374  	s = __kmem_cache_alias(name, object_size, flags, args);
cbb79694d592e9 Christoph Lameter      2012-09-05  375  	if (s)
3965fc36522446 Vladimir Davydov       2014-01-23  376  		goto out_unlock;
cbb79694d592e9 Christoph Lameter      2012-09-05  377  
3dec16ea38afce Andrzej Hajda          2015-02-13  378  	cache_name = kstrdup_const(name, GFP_KERNEL);
794b1248be4e7e Vladimir Davydov       2014-04-07  379  	if (!cache_name) {
3965fc36522446 Vladimir Davydov       2014-01-23  380  		err = -ENOMEM;
3965fc36522446 Vladimir Davydov       2014-01-23  381  		goto out_unlock;
794b1248be4e7e Vladimir Davydov       2014-04-07  382  	}
3965fc36522446 Vladimir Davydov       2014-01-23  383  
34410a906080e7 Christian Brauner      2024-09-05  384  	args->align = calculate_alignment(flags, args->align, object_size);
34410a906080e7 Christian Brauner      2024-09-05  385  	s = create_cache(cache_name, object_size, args, flags);
794b1248be4e7e Vladimir Davydov       2014-04-07  386  	if (IS_ERR(s)) {
794b1248be4e7e Vladimir Davydov       2014-04-07  387  		err = PTR_ERR(s);
3dec16ea38afce Andrzej Hajda          2015-02-13  388  		kfree_const(cache_name);
794b1248be4e7e Vladimir Davydov       2014-04-07  389  	}
db265eca77000c Christoph Lameter      2012-09-04  390  
3965fc36522446 Vladimir Davydov       2014-01-23  391  out_unlock:
20cea9683ecc6d Christoph Lameter      2012-07-06  392  	mutex_unlock(&slab_mutex);
03afc0e25f7fc0 Vladimir Davydov       2014-06-04  393  
ba3253c78d7443 Dave Jones             2014-01-29  394  	if (err) {
686d550d222e8f Christoph Lameter      2012-09-05  395  		if (flags & SLAB_PANIC)
4acaa7d5045e21 gumingtao              2021-06-28  396  			panic("%s: Failed to create slab '%s'. Error %d\n",
4acaa7d5045e21 gumingtao              2021-06-28  397  				__func__, name, err);
686d550d222e8f Christoph Lameter      2012-09-05  398  		else {
4acaa7d5045e21 gumingtao              2021-06-28  399  			pr_warn("%s(%s) failed with error %d\n",
4acaa7d5045e21 gumingtao              2021-06-28  400  				__func__, name, err);
686d550d222e8f Christoph Lameter      2012-09-05  401  			dump_stack();
686d550d222e8f Christoph Lameter      2012-09-05  402  		}
686d550d222e8f Christoph Lameter      2012-09-05  403  		return NULL;
686d550d222e8f Christoph Lameter      2012-09-05  404  	}
039363f38bfe5f Christoph Lameter      2012-07-06  405  	return s;
794b1248be4e7e Vladimir Davydov       2014-04-07  406  }
879fb3c274c12c Christian Brauner      2024-09-05  407  EXPORT_SYMBOL(__kmem_cache_create_args);
3965fc36522446 Vladimir Davydov       2014-01-23  408  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
