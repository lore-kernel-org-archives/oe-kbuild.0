Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08159318BBB
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950733; cv=none; b=uUcbT71Bv8bHbZuC/wKsv4wJ7HkstJ8c2MtaJcEmLTJz7rN0eq8IQfU2BuwOcgL6bI9DNxxmUL9esvql/l+qZ5pdxhvv8bLRmR2uKY3u3QZ0pFZXcMpmUWRvWlWjf5EnaBHYwUeptPtZ5ybkSBfsX1it5KwDsxUKo9QK+qCa6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950733; c=relaxed/simple;
	bh=v03ImVdeQ/It4LaEsfP6A934UdDWIUS6ufu/1PxMK5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g3Kqm8Roz5msQ3tPoSnEmkF1ZxIpPxXznMK2aPFz2K65VsqYdlCiNlh4DcXSuzTbH2e8Vrdn6AzRktljjWNaHXi57hpUpcW8LZjil1oSzi4Q61GvkXciX4/5en3tcUEG/PSAoy7En7EHl+7RO1W6YKTvOVgywrRNDz4II95MWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvlQPWYN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvlQPWYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767950732; x=1799486732;
  h=date:from:to:cc:subject:message-id;
  bh=v03ImVdeQ/It4LaEsfP6A934UdDWIUS6ufu/1PxMK5c=;
  b=XvlQPWYNeFv72qkJgHB98JMFu+qc7B3oAvVmS2wq6yIACVrPOIrhOT0J
   7hRA62v0WBwpzH7Qvv8oCE/g6jpFGn3vjRs87ArNmyEE5AdQKTfN6+YMv
   o79oDR2CDoFzbwB3FWPY81BuS2w9lvXzM5fAFC5LIDconsTdzwm0zoE1H
   tbuwuGs6PpJeXaKur4+vD6d/ZtXBY9SoxVI5HARgFnoCQPNthZvtRSUzj
   HrUb3c+peEa09zeXBu8MF0TxOZonw8HUakmeXhtvIEilGCp63cqs5kxeX
   0m/X+hotAjMhqGsldAMnmP2v1cXyOnlE13bMdCWV47W1j5pdloMbtwGAP
   g==;
X-CSE-ConnectionGUID: IPV2aFXaSVe/qK661RBFgQ==
X-CSE-MsgGUID: oltRBLeOQu6yFNP6/QHcvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69380326"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69380326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:25:31 -0800
X-CSE-ConnectionGUID: uKdBLCtVTgClc3rtgEroLg==
X-CSE-MsgGUID: Grs+H7QFRvO0IQW1IX1UNw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2026 01:25:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve8kK-000000005gy-1iQc;
	Fri, 09 Jan 2026 09:25:28 +0000
Date: Fri, 09 Jan 2026 17:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.filename 15/59] fs/namei.c:160 getname_long()
 warn: the 'EMBEDDED_NAME_MAX' macro might need parens
Message-ID: <202601091728.qaU51LaE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-fsdevel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.filename
head:   30ba070760d3eb039c6eb91ad17d8c1e13335a7b
commit: 2a0db5f7653b3576c430f8821654f365aaa7f178 [15/59] struct filename: saner handling of long names
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: powerpc64-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091728.qaU51LaE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601091728.qaU51LaE-lkp@intel.com/

New smatch warnings:
fs/namei.c:160 getname_long() warn: the 'EMBEDDED_NAME_MAX' macro might need parens

Old smatch warnings:
fs/namei.c:161 getname_long() warn: the 'EMBEDDED_NAME_MAX' macro might need parens
fs/namei.c:162 getname_long() warn: the 'EMBEDDED_NAME_MAX' macro might need parens
arch/powerpc/include/asm/mmu.h:223 early_mmu_has_feature() warn: bitwise AND condition is false here
fs/namei.c:1706 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1819 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:3711 lock_rename() warn: inconsistent returns '&p1->d_sb->s_vfs_rename_mutex'.

vim +/EMBEDDED_NAME_MAX +160 fs/namei.c

611851010c7404 Mateusz Guzik 2025-03-13  151  
2a0db5f7653b35 Al Viro       2025-11-19  152  static int getname_long(struct filename *name, const char __user *filename)
b8000a3628d80e Al Viro       2025-11-19  153  {
b8000a3628d80e Al Viro       2025-11-19  154  	int len;
2a0db5f7653b35 Al Viro       2025-11-19  155  	char *p __free(kfree) = kmalloc(PATH_MAX, GFP_KERNEL);
b8000a3628d80e Al Viro       2025-11-19  156  	if (unlikely(!p))
2a0db5f7653b35 Al Viro       2025-11-19  157  		return -ENOMEM;
b8000a3628d80e Al Viro       2025-11-19  158  
2a0db5f7653b35 Al Viro       2025-11-19  159  	memcpy(p, &name->iname, EMBEDDED_NAME_MAX);
2a0db5f7653b35 Al Viro       2025-11-19 @160  	len = strncpy_from_user(p + EMBEDDED_NAME_MAX,
b8000a3628d80e Al Viro       2025-11-19  161  				filename + EMBEDDED_NAME_MAX,
b8000a3628d80e Al Viro       2025-11-19  162  				PATH_MAX - EMBEDDED_NAME_MAX);
b8000a3628d80e Al Viro       2025-11-19  163  	if (unlikely(len < 0))
2a0db5f7653b35 Al Viro       2025-11-19  164  		return len;
b8000a3628d80e Al Viro       2025-11-19  165  	if (unlikely(len == PATH_MAX - EMBEDDED_NAME_MAX))
2a0db5f7653b35 Al Viro       2025-11-19  166  		return -ENAMETOOLONG;
2a0db5f7653b35 Al Viro       2025-11-19  167  	name->name = no_free_ptr(p);
2a0db5f7653b35 Al Viro       2025-11-19  168  	return 0;
b8000a3628d80e Al Viro       2025-11-19  169  }
b8000a3628d80e Al Viro       2025-11-19  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
