Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DF521FF3C
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092720; cv=none; b=hK70Ymi1LavUqosnbSrFZqU1VDeZnwwk0hzKGAqF1HiZARTspmu68pDHYVadFOGUjP7rei1MV/PS5X+fNiAa2388rkjTwlklM+rt6A9QFbiE5ZKAMYp2N71eiTeEbo4jz1D5WGFJmGTYOekdbD3efs9ZOeLa8LDTsWHb8KmVeXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092720; c=relaxed/simple;
	bh=VzTu4P7mSOK4JQn3mk4QiLG115YYxO1GsjExJqNr+xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KSN3grxtPoFV6S43hzrZCXID4Tk3FCCBN+2MOY6KdVOT2taPOIPKvZlL1HU0bSw+wUFRXvUWCuau4XBe42c3tXR7+n6YOaVPQJM6RBox0BzJ+Al03OXFwu+B+nmggcsRplx8ckQ0kOT15q3t/uP9RlbprWzSp5SbDIZga7yCq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUdlkI+k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUdlkI+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752092718; x=1783628718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzTu4P7mSOK4JQn3mk4QiLG115YYxO1GsjExJqNr+xw=;
  b=GUdlkI+kD+u5ZNE5a7+EA7qjTelGWHGrFx/X6BiDzEdU+VKXdxFgG86e
   CQUDqXP0VFbPmRH2GQ32v5HK1wRRKue8GplToxJu4E3gQaoQinwIaGX6Y
   b1Kon15ge+gf810oW6vtn6QB0qFlBGBKdtkzh8VsX8K9JgGUSLF4OTeig
   wNYENtYjgtJuS8QeQV8jkmTbGA8URu2kA7UyFr0lIR0loHnUGkCjEIDCk
   Fg/qVPIGtHJDNEEcLMdmLtSAcOufVbdygKRabMe6eWfhD0y3XvT/q2X39
   TIAnUHMLYCqnNMc+1W9LOrqfJA8HmKrTjMcb7J+rc4MhJUMsmZKmcmuox
   A==;
X-CSE-ConnectionGUID: acmGaUzbTyK+CV3nchjhww==
X-CSE-MsgGUID: c+PpM3mORcKHqVEThj7nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79801849"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="79801849"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:25:18 -0700
X-CSE-ConnectionGUID: /asnaaRUTL6BKTU7X2eJrg==
X-CSE-MsgGUID: Jfp7NfCpQyew48EtkBkZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="156009947"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2025 13:25:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZbLu-00042Z-0i;
	Wed, 09 Jul 2025 20:25:14 +0000
Date: Thu, 10 Jul 2025 04:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 6/6] kernel/fork.c:2318
 copy_dmabuf_info() warn: sleeping in atomic context
Message-ID: <202507100414.f3Yyuj82-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a9597c7b32ec09bdaf13909f77b203e77b4fbb69
commit: f44d593749dcbd4e1013121fa615ecca412d1cb3 [6/6] ANDROID: Track per-process dmabuf RSS
:::::: branch date: 12 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100414.f3Yyuj82-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507100414.f3Yyuj82-lkp@intel.com/

smatch warnings:
kernel/fork.c:2318 copy_dmabuf_info() warn: sleeping in atomic context

vim +2318 kernel/fork.c

792575348ff70e Daniel Bristot de Oliveira 2022-07-29  2291  
f44d593749dcbd T.J. Mercier               2025-06-25  2292  static int copy_dmabuf_info(u64 clone_flags, struct task_struct *p)
f44d593749dcbd T.J. Mercier               2025-06-25  2293  {
f44d593749dcbd T.J. Mercier               2025-06-25  2294  	struct task_dma_buf_record *rec, *copy;
f44d593749dcbd T.J. Mercier               2025-06-25  2295  
f44d593749dcbd T.J. Mercier               2025-06-25  2296  	if (current->dmabuf_info && (clone_flags & (CLONE_VM | CLONE_FILES))
f44d593749dcbd T.J. Mercier               2025-06-25  2297  						== (CLONE_VM | CLONE_FILES)) {
f44d593749dcbd T.J. Mercier               2025-06-25  2298  		/*
f44d593749dcbd T.J. Mercier               2025-06-25  2299  		 * Both MM and FD references to dmabufs are shared with the parent, so
f44d593749dcbd T.J. Mercier               2025-06-25  2300  		 * we can share a RSS counter with the parent.
f44d593749dcbd T.J. Mercier               2025-06-25  2301  		 */
f44d593749dcbd T.J. Mercier               2025-06-25  2302  		refcount_inc(&current->dmabuf_info->refcnt);
f44d593749dcbd T.J. Mercier               2025-06-25  2303  		p->dmabuf_info = current->dmabuf_info;
f44d593749dcbd T.J. Mercier               2025-06-25  2304  		return 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2305  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2306  
f44d593749dcbd T.J. Mercier               2025-06-25  2307  	p->dmabuf_info = kmalloc(sizeof(*p->dmabuf_info), GFP_KERNEL);
f44d593749dcbd T.J. Mercier               2025-06-25  2308  	if (!p->dmabuf_info)
f44d593749dcbd T.J. Mercier               2025-06-25  2309  		return -ENOMEM;
f44d593749dcbd T.J. Mercier               2025-06-25  2310  
f44d593749dcbd T.J. Mercier               2025-06-25  2311  	refcount_set(&p->dmabuf_info->refcnt, 1);
f44d593749dcbd T.J. Mercier               2025-06-25  2312  	spin_lock_init(&p->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2313  	INIT_LIST_HEAD(&p->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier               2025-06-25  2314  	if (current->dmabuf_info) {
f44d593749dcbd T.J. Mercier               2025-06-25  2315  		spin_lock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2316  		p->dmabuf_info->rss = current->dmabuf_info->rss;
f44d593749dcbd T.J. Mercier               2025-06-25  2317  		list_for_each_entry(rec, &current->dmabuf_info->dmabufs, node) {
f44d593749dcbd T.J. Mercier               2025-06-25 @2318  			copy = kmalloc(sizeof(*copy), GFP_KERNEL);
f44d593749dcbd T.J. Mercier               2025-06-25  2319  			if (!copy) {
f44d593749dcbd T.J. Mercier               2025-06-25  2320  				spin_unlock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2321  				goto err_list_copy;
f44d593749dcbd T.J. Mercier               2025-06-25  2322  			}
f44d593749dcbd T.J. Mercier               2025-06-25  2323  
f44d593749dcbd T.J. Mercier               2025-06-25  2324  			copy->dmabuf = rec->dmabuf;
f44d593749dcbd T.J. Mercier               2025-06-25  2325  			copy->refcnt = rec->refcnt;
f44d593749dcbd T.J. Mercier               2025-06-25  2326  			list_add(&copy->node, &p->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier               2025-06-25  2327  		}
f44d593749dcbd T.J. Mercier               2025-06-25  2328  		spin_unlock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2329  	} else {
f44d593749dcbd T.J. Mercier               2025-06-25  2330  		p->dmabuf_info->rss = 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2331  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2332  
f44d593749dcbd T.J. Mercier               2025-06-25  2333  	return 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2334  
f44d593749dcbd T.J. Mercier               2025-06-25  2335  err_list_copy:
f44d593749dcbd T.J. Mercier               2025-06-25  2336  	list_for_each_entry_safe(rec, copy, &p->dmabuf_info->dmabufs, node) {
f44d593749dcbd T.J. Mercier               2025-06-25  2337  		list_del(&rec->node);
f44d593749dcbd T.J. Mercier               2025-06-25  2338  		kfree(rec);
f44d593749dcbd T.J. Mercier               2025-06-25  2339  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2340  	kfree(p->dmabuf_info);
f44d593749dcbd T.J. Mercier               2025-06-25  2341  	return -ENOMEM;
f44d593749dcbd T.J. Mercier               2025-06-25  2342  }
f44d593749dcbd T.J. Mercier               2025-06-25  2343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
