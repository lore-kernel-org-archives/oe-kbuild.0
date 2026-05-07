Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF4D379EDF
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145425; cv=none; b=OQxtIUCk+FG/43b5shtM6M6uFfewz+jUISzHeAOztw+GsCvHw+rzCTGAWP9uenzA6G8xqoPa4aYbXbegirhwZXQasoUoyj2ojIPJo8joAYglKBDSriMksqItI7fNcrCTRkxHzBpSjOjYz2MpW6n17H77q6nArN1PIQpfH2zfrVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145425; c=relaxed/simple;
	bh=uOO/rQe90s7bmCcQE0uA06t1miNcTS9bYVdJlgiT5J8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U0OqoAozX/ImTdCh8CFRkyTVRmMB9ruNSRclGOHouzszHzVMesMFYj87fwwJ1G47TyxNDdJPm1tHFXZu1fRFusKaMO2LXte/wMBlYMuM/r/FvdQgeh902FRYRIr/X5Kf/xmnGLvepBughhG08PnymEpGDT0yj9xm90uQdz7kXPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kz8gwv5n; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kz8gwv5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778145419; x=1809681419;
  h=date:from:to:cc:subject:message-id;
  bh=uOO/rQe90s7bmCcQE0uA06t1miNcTS9bYVdJlgiT5J8=;
  b=kz8gwv5n8LTN/vMC2jEQ0DiHtdR//CGTIwU/2dgQSZyBLhvyrTeV6k4h
   5Rsn6xeNHZbiZ+VQdNvAzHN2lcTHHcKBFZqP/aujGfYQXI9DLNQI3lUkI
   SWjIH0okL5Hn0ZZ+lwoeygYUd7RMwu6tDAmWYkLI2mkwdwMfFu9ZV5H7y
   LZDEA06VDoMdvrD6b2lzWJwqBpysu8OQyVAAsyBabLVK1WIvmAQCHzxTL
   PKA8XvugxJHOvIHfrqJGAjrNV9EG6obI5YrzeB5YEo++pIXM9c6GkZ3xx
   tvqFJtRk5ZkcmdfnHP2F99MzcB7/RQ+BlDnC9rupIB1LjxJtRGo3CdKo6
   g==;
X-CSE-ConnectionGUID: GLklCKgRTq6G1LxCABMMWQ==
X-CSE-MsgGUID: s30xz4F1Q/aX/H+a2YkgyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96658951"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96658951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:16:56 -0700
X-CSE-ConnectionGUID: XLHtU59YTgKuhQyKJ4VVhQ==
X-CSE-MsgGUID: DLPdx5+cRNWwuLWcozlOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230023822"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 02:16:55 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuqj-0000000009F-1dU2;
	Thu, 07 May 2026 09:16:53 +0000
Date: Thu, 07 May 2026 17:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ljs:project/cow-context 4/18] mm/cow_context.c:102
 __dynarray_dup() warn: variable dereferenced before check 'arr' (see line 91)
Message-ID: <202605071712.tNPizmiC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Stoakes <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 86c4a37b876ec7ed8a5b42d5c3f7b3c4b0bd5c03 [4/18] mm: add simple dynamic array implementation
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arc-randconfig-r072-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071712.tNPizmiC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605071712.tNPizmiC-lkp@intel.com/

smatch warnings:
mm/cow_context.c:102 __dynarray_dup() warn: variable dereferenced before check 'arr' (see line 91)

vim +/arr +102 mm/cow_context.c

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   88  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   89  static struct dynarray *__dynarray_dup(struct dynarray *arr, int cap, gfp_t gfp)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   90  {
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  @91  	const int nr = __dynarray_nr(arr);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   92  	struct dynarray *ret;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   93  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   94  	ret = kmalloc_flex(*arr, contents, cap, gfp);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   95  	if (!ret)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   96  		return NULL;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   97  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   98  	/* Just allocated, safe to assign. */
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   99  	ret->nr = nr;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  100  	ret->cap = cap;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  101  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01 @102  	if (arr)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  103  		memcpy(ret->contents, arr->contents, sizeof(void *) * nr);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  104  	return ret;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  105  }
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
