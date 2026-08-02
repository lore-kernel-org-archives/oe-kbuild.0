Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3230C63B
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785667157; cv=none; b=jUkrtJYKHQS+loArZmUQv8mrqmuk9S5jC7NQx8qJXItsDGN+DbNIeYF1rP2dWY5Myug7uEeIaRJE6tZ4ug2/s7FT57ugZ1qtocR/I0lh3Gz6lCa5pUd7pdouB1gn8tHsLq7g9jbOmzTCUECCe2OBoX1s+9ld3bYFi/tF5yDyZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785667157; c=relaxed/simple;
	bh=3cMfL+tkUQhc7wUg4LUOJK2lEpcDqoA3+tlTTY6Im6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sdhCyk4LC7tA/RPyBLlF3bHySy4SB86zNb179kSYNo3M+6XMW2ZNWJmBvCQoNUb4JfI9aQUOIHsvMVOq0w6GFNCwBMENfTb5Sv3MGlRuVhyNYK8nxKM7rr/OsB6u30auhYMEb4WfrPdLX0r2FZVZdsGxcHPaulCt9FnerBoaUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MN/a0G6u; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MN/a0G6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785667154; x=1817203154;
  h=date:from:to:cc:subject:message-id;
  bh=3cMfL+tkUQhc7wUg4LUOJK2lEpcDqoA3+tlTTY6Im6U=;
  b=MN/a0G6uDan8gX/ZICTImwOe3ARBuc+ObFsqJI6ERwk4q0sMWk+dxRJA
   +dc/i8rBCIEaoEbj1Tw3CHdIpWhE1/DcG9wR9BGJn97agpsDYd8s+hqSH
   AkS94uiHxY1ZQV8LfwMyM4vyC/FdrYk6/ZnxF3+IjxFIGYMaUUUYuxQwf
   5Yl3AD9pSsHLMN5v8lCZjb2Rx9q/v1BJZ2X8O9smOyKMGu+5LcJqFHhgG
   k6civKqJtM5pJsELTW1wYoPNEWNz1XdN7tUvyfc5yT6U0wyiO+dnfmusM
   NJELfeFGh+gq6qEon4+dzSXutf/RjfGuYal+TFnaCJI2xPyeom222TwRx
   w==;
X-CSE-ConnectionGUID: YcuNmCvxQQe7AREC0lBptw==
X-CSE-MsgGUID: x4f7nB1SR6GPtr2YqqOD/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="90041209"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="90041209"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 03:39:14 -0700
X-CSE-ConnectionGUID: MDepjWXgSrCITsrqY425fA==
X-CSE-MsgGUID: qsC1E/hrQDqV0OiqcSEn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="264786841"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2026 03:39:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqTb4-000000004q4-2GlZ;
	Sun, 02 Aug 2026 10:39:10 +0000
Date: Sun, 02 Aug 2026 18:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/gntdev-dmabuf.c:743
 gntdev_ioctl_dmabuf_exp_from_refs() warn: potential user controlled sizeof
 overflow '4 * op.count' '4 * 0-u32max'
Message-ID: <202608021852.qJUwYbVH-lkp@intel.com>
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
head:   02dc699f83d04069fdabc996fc22d47cda47a4a9
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   3 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-r072-20260802 (https://download.01.org/0day-ci/archive/20260802/202608021852.qJUwYbVH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608021852.qJUwYbVH-lkp@intel.com/

New smatch warnings:
drivers/xen/gntdev-dmabuf.c:743 gntdev_ioctl_dmabuf_exp_from_refs() warn: potential user controlled sizeof overflow '4 * op.count' '4 * 0-u32max'

Old smatch warnings:
drivers/xen/gntdev-dmabuf.c:793 gntdev_ioctl_dmabuf_imp_to_refs() warn: potential user controlled sizeof overflow '4 * op.count' '4 * 0-u32max'

vim +743 drivers/xen/gntdev-dmabuf.c

932d6562179efe Oleksandr Andrushchenko 2018-07-20  720  
2ea7a5bcc4cfca Juergen Gross           2025-08-26  721  long gntdev_ioctl_dmabuf_exp_from_refs(struct gntdev_priv *priv,
932d6562179efe Oleksandr Andrushchenko 2018-07-20  722  				       struct ioctl_gntdev_dmabuf_exp_from_refs __user *u)
932d6562179efe Oleksandr Andrushchenko 2018-07-20  723  {
932d6562179efe Oleksandr Andrushchenko 2018-07-20  724  	struct ioctl_gntdev_dmabuf_exp_from_refs op;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  725  	u32 *refs;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  726  	long ret;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  727  
2ea7a5bcc4cfca Juergen Gross           2025-08-26  728  	if (xen_pv_domain()) {
2ea7a5bcc4cfca Juergen Gross           2025-08-26  729  		pr_debug("Cannot provide dma-buf in a PV domain\n");
932d6562179efe Oleksandr Andrushchenko 2018-07-20  730  		return -EINVAL;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  731  	}
932d6562179efe Oleksandr Andrushchenko 2018-07-20  732  
932d6562179efe Oleksandr Andrushchenko 2018-07-20  733  	if (copy_from_user(&op, u, sizeof(op)) != 0)
932d6562179efe Oleksandr Andrushchenko 2018-07-20  734  		return -EFAULT;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  735  
3b06ac6707c196 Juergen Gross           2019-11-07  736  	if (unlikely(gntdev_test_page_count(op.count)))
932d6562179efe Oleksandr Andrushchenko 2018-07-20  737  		return -EINVAL;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  738  
932d6562179efe Oleksandr Andrushchenko 2018-07-20  739  	refs = kcalloc(op.count, sizeof(*refs), GFP_KERNEL);
932d6562179efe Oleksandr Andrushchenko 2018-07-20  740  	if (!refs)
932d6562179efe Oleksandr Andrushchenko 2018-07-20  741  		return -ENOMEM;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  742  
932d6562179efe Oleksandr Andrushchenko 2018-07-20 @743  	if (copy_from_user(refs, u->refs, sizeof(*refs) * op.count) != 0) {
932d6562179efe Oleksandr Andrushchenko 2018-07-20  744  		ret = -EFAULT;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  745  		goto out;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  746  	}
932d6562179efe Oleksandr Andrushchenko 2018-07-20  747  
932d6562179efe Oleksandr Andrushchenko 2018-07-20  748  	ret = dmabuf_exp_from_refs(priv, op.flags, op.count,
932d6562179efe Oleksandr Andrushchenko 2018-07-20  749  				   op.domid, refs, &op.fd);
932d6562179efe Oleksandr Andrushchenko 2018-07-20  750  	if (ret)
932d6562179efe Oleksandr Andrushchenko 2018-07-20  751  		goto out;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  752  
932d6562179efe Oleksandr Andrushchenko 2018-07-20  753  	if (copy_to_user(u, &op, sizeof(op)) != 0)
932d6562179efe Oleksandr Andrushchenko 2018-07-20  754  		ret = -EFAULT;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  755  
932d6562179efe Oleksandr Andrushchenko 2018-07-20  756  out:
932d6562179efe Oleksandr Andrushchenko 2018-07-20  757  	kfree(refs);
932d6562179efe Oleksandr Andrushchenko 2018-07-20  758  	return ret;
932d6562179efe Oleksandr Andrushchenko 2018-07-20  759  }
932d6562179efe Oleksandr Andrushchenko 2018-07-20  760  

:::::: The code at line 743 was first introduced by commit
:::::: 932d6562179efe8e2460a0343dbe0fcacf288a9e xen/gntdev: Add initial support for dma-buf UAPI

:::::: TO: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
:::::: CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
