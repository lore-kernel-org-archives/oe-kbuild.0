Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A12EC0A2
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440022; cv=none; b=T81eo11glePN0af3tcujdcWq94Agn0i6j1s8lUGFZHxQfA6krSlCH0LVqcDOWm6ROUEiSh4CZjSE0lE7iG/v0F7YRtWp/SBPbSoa4wqH/izvKP6SDDE+c7aOvYV+U+OZDLR+9YrVPFFzFezz8yOdyDA+EmoBG5sl5CwKXEDxO/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440022; c=relaxed/simple;
	bh=N4CsTymKwh4cI8nkMxi4N8Uy2oaI40M+VZO00c2T4L4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b+6T/RSHYsAWp22W3ynYnqdKXTboVIv7GI61+L+Ls0FNfdJJYzfVL1O1cteGwvfwXaJmDM8ptvgPUv7+AJCVp1FAlq5qn+lwyLP25Zx/SDQuJTKGhnPXk/7N/SZigi15g1n28XB57UNmbA+8t1hCM61OT1SCcTXxNz9bpO/MRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7IUj0EF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7IUj0EF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781440020; x=1812976020;
  h=date:from:to:cc:subject:message-id;
  bh=N4CsTymKwh4cI8nkMxi4N8Uy2oaI40M+VZO00c2T4L4=;
  b=c7IUj0EFtFK1nS70StSyudlyci/qVVfApr//cGmlz/p5kGzl3Y9TiyRk
   70CVuTI8a1DMcHCaudVE38EMiLSGCu6SpThCtwGDh7DNdA8rr75dfPXuH
   7Qbx05jtQcJet5/vZV54+Rjzrpoon21H7H7a0DR9vI4T7Ugrw3Ka9rs2O
   UPkzExp6cTveFLkFPIT5H5lJ70iwaHJtUa0/oy+4HkyXAUPQx8jehibkP
   yJPfs3boAXp0zhBCEofGNJudHF1JJNg+KPWOser1TETqLVOqPddIKRWsJ
   /DWoPZnCzi4NGj7RZsBzINZzM+dehHozNAqAxXlYiQal1h/Dff2lhKriu
   A==;
X-CSE-ConnectionGUID: NiO6k9oCT4urNgjcMrIu+w==
X-CSE-MsgGUID: yFtpfEJgRUyhsi3C2IJVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93591149"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93591149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 05:27:00 -0700
X-CSE-ConnectionGUID: 5Xmfqu0FSuSotv7ObBiLMg==
X-CSE-MsgGUID: +K6IZwzzRaqUR6UABNgM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="246342656"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2026 05:26:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYjvU-00000000QnS-0NAy;
	Sun, 14 Jun 2026 12:26:56 +0000
Date: Sun, 14 Jun 2026 20:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13691/13763] mm/list_lru.c:613
 __memcg_list_lru_alloc() error: calling 'spin_unlock_irqrestore()' with bogus
 flags
Message-ID: <202606141924.r9U2xais-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 97d344d7e7959b6a6f804362cc54467cd5ecc55a [13691/13763] Merge branch 'master' of git://git.code.sf.net/p/tomoyo/tomoyo.git
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141924.r9U2xais-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606141924.r9U2xais-lkp@intel.com/

smatch warnings:
mm/list_lru.c:613 __memcg_list_lru_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +613 mm/list_lru.c

88f2ef73fd6649 Muchun Song     2022-03-22  573  
ae64f07a6a4018 Johannes Weiner 2026-05-27  574  static int __memcg_list_lru_alloc(struct mem_cgroup *memcg,
ae64f07a6a4018 Johannes Weiner 2026-05-27  575  				  struct list_lru *lru, gfp_t gfp)
88f2ef73fd6649 Muchun Song     2022-03-22  576  {
88f2ef73fd6649 Muchun Song     2022-03-22  577  	unsigned long flags;
b9585a3f3e0b30 Zeng Jingxiang  2025-02-27  578  	struct list_lru_memcg *mlru = NULL;
28e98022b31efd Kairui Song     2024-11-05  579  	struct mem_cgroup *pos, *parent;
bbca91cca9a902 Muchun Song     2022-03-22  580  	XA_STATE(xas, &lru->xa, 0);
88f2ef73fd6649 Muchun Song     2022-03-22  581  
88f2ef73fd6649 Muchun Song     2022-03-22  582  	gfp &= GFP_RECLAIM_MASK;
88f2ef73fd6649 Muchun Song     2022-03-22  583  	/*
88f2ef73fd6649 Muchun Song     2022-03-22  584  	 * Because the list_lru can be reparented to the parent cgroup's
88f2ef73fd6649 Muchun Song     2022-03-22  585  	 * list_lru, we should make sure that this cgroup and all its
d70110704d2d52 Muchun Song     2022-03-22  586  	 * ancestors have allocated list_lru_memcg.
88f2ef73fd6649 Muchun Song     2022-03-22  587  	 */
28e98022b31efd Kairui Song     2024-11-05  588  	do {
28e98022b31efd Kairui Song     2024-11-05  589  		/*
28e98022b31efd Kairui Song     2024-11-05  590  		 * Keep finding the farest parent that wasn't populated
28e98022b31efd Kairui Song     2024-11-05  591  		 * until found memcg itself.
28e98022b31efd Kairui Song     2024-11-05  592  		 */
28e98022b31efd Kairui Song     2024-11-05  593  		pos = memcg;
28e98022b31efd Kairui Song     2024-11-05  594  		parent = parent_mem_cgroup(pos);
28e98022b31efd Kairui Song     2024-11-05  595  		while (!memcg_list_lru_allocated(parent, lru)) {
28e98022b31efd Kairui Song     2024-11-05  596  			pos = parent;
28e98022b31efd Kairui Song     2024-11-05  597  			parent = parent_mem_cgroup(pos);
88f2ef73fd6649 Muchun Song     2022-03-22  598  		}
88f2ef73fd6649 Muchun Song     2022-03-22  599  
b9585a3f3e0b30 Zeng Jingxiang  2025-02-27  600  		if (!mlru) {
fb56fdf8b9a2f7 Kairui Song     2024-11-05  601  			mlru = memcg_init_list_lru_one(lru, gfp);
28e98022b31efd Kairui Song     2024-11-05  602  			if (!mlru)
28e98022b31efd Kairui Song     2024-11-05  603  				return -ENOMEM;
b9585a3f3e0b30 Zeng Jingxiang  2025-02-27  604  		}
28e98022b31efd Kairui Song     2024-11-05  605  		xas_set(&xas, pos->kmemcg_id);
28e98022b31efd Kairui Song     2024-11-05  606  		do {
bbca91cca9a902 Muchun Song     2022-03-22  607  			xas_lock_irqsave(&xas, flags);
28e98022b31efd Kairui Song     2024-11-05  608  			if (!xas_load(&xas) && !css_is_dying(&pos->css)) {
bbca91cca9a902 Muchun Song     2022-03-22  609  				xas_store(&xas, mlru);
28e98022b31efd Kairui Song     2024-11-05  610  				if (!xas_error(&xas))
28e98022b31efd Kairui Song     2024-11-05  611  					mlru = NULL;
bbca91cca9a902 Muchun Song     2022-03-22  612  			}
bbca91cca9a902 Muchun Song     2022-03-22 @613  			xas_unlock_irqrestore(&xas, flags);
28e98022b31efd Kairui Song     2024-11-05  614  		} while (xas_nomem(&xas, gfp));
28e98022b31efd Kairui Song     2024-11-05  615  	} while (pos != memcg && !css_is_dying(&pos->css));
88f2ef73fd6649 Muchun Song     2022-03-22  616  
b9585a3f3e0b30 Zeng Jingxiang  2025-02-27  617  	if (unlikely(mlru))
b9585a3f3e0b30 Zeng Jingxiang  2025-02-27  618  		kfree(mlru);
b9585a3f3e0b30 Zeng Jingxiang  2025-02-27  619  
bbca91cca9a902 Muchun Song     2022-03-22  620  	return xas_error(&xas);
88f2ef73fd6649 Muchun Song     2022-03-22  621  }
ae64f07a6a4018 Johannes Weiner 2026-05-27  622  

:::::: The code at line 613 was first introduced by commit
:::::: bbca91cca9a902de2e9907370e9c1e0a3d1aab0f mm: list_lru: replace linear array with xarray

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
