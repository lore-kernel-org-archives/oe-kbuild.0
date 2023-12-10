Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854BE7472
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTL2KAgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702203708; x=1733739708;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f4vrKSGP03UQjhdGppmkLiWKLEzo31siuLjCRcvqLDE=;
  b=QTL2KAgM8CAZTADqA5UHrpRaSJwjhw2UB0DrQuOhxEvP4SVRZOeF3gkg
   r9VKhzDChyCJrhegpn6iomjrLUjvzaqXQYb6BxJXtJZhx2PNfNJxkIp3U
   VBr24f/JINbzpOLH9DsKOeGmHujL9dFqYllEKhZEFEhhdIfOxTLU76B11
   MMeptS71AKUSiQZ9BDhTOvNtso2qNUkHFj1Ymb2oagTNEenUXWmES26/F
   MWhW5FHNapFlT8PUXenFxvCpf7fPdNlvKSUU9qH0DNnfSVnP1MSFEGTTX
   TLsNsj2TmlYDgT/aitcKj9SoNA8RWMLB/iw92itCTJ+CXT+CZihnjvToU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="384957649"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="384957649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 02:21:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="838650600"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="838650600"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Dec 2023 02:21:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCGwQ-000Gha-1s;
	Sun, 10 Dec 2023 10:21:42 +0000
Date: Sun, 10 Dec 2023 18:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/migrate.c:236:33: sparse: sparse: cast to non-scalar
Message-ID: <202312101844.0hxf3E2I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/migrate.c:236:33: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: dee081bf8f824cabeb7c7495367d5dad0a444eb1 READ_ONCE: Drop pointer qualifiers when reading from scalar types
date:   3 years, 8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 years, 8 months ago
config: alpha-randconfig-r131-20231116 (https://download.01.org/0day-ci/archive/20231210/202312101844.0hxf3E2I-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101844.0hxf3E2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312101844.0hxf3E2I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/migrate.c:236:33: sparse: sparse: cast to non-scalar
>> mm/migrate.c:236:33: sparse: sparse: cast from non-scalar
   mm/migrate.c:824:9: sparse: sparse: context imbalance in '__buffer_migrate_page' - different lock contexts for basic block
--
   kernel/sched/fair.c:882:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:882:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:882:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:4835:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:4835:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:4835:22: sparse:    struct task_struct *
   kernel/sched/fair.c:5598:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair.c:5599:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair.c:6529:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6529:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:6529:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6648:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6648:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:6648:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6850:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6850:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6850:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7101:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7101:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7101:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8059:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8059:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:8059:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:8552:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8552:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8552:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9796:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9796:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9796:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9456:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9456:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:9456:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9875:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9875:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9875:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:10475:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10475:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:10475:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:10679:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10679:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10679:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10812:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10812:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10812:30: sparse:    struct task_struct *
>> kernel/sched/fair.c:3883:30: sparse: sparse: cast to non-scalar
>> kernel/sched/fair.c:3883:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:4549:31: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *

vim +236 mm/migrate.c

616b8371539a6c Zi Yan             2017-09-08  234  
0697212a411c1d Christoph Lameter  2006-06-23  235  		get_page(new);
6d2329f8872f23 Andrea Arcangeli   2016-10-07 @236  		pte = pte_mkold(mk_pte(new, READ_ONCE(vma->vm_page_prot)));
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  237  		if (pte_swp_soft_dirty(*pvmw.pte))
c3d16e16522fe3 Cyrill Gorcunov    2013-10-16  238  			pte = pte_mksoft_dirty(pte);
d3cb8bf6081b8b Mel Gorman         2014-10-02  239  
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  240  		/*
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  241  		 * Recheck VMA as permissions can change since migration started
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  242  		 */
3fe87967c536e8 Kirill A. Shutemov 2017-02-24  243  		entry = pte_to_swp_entry(*pvmw.pte);
0697212a411c1d Christoph Lameter  2006-06-23  244  		if (is_write_migration_entry(entry))
d3cb8bf6081b8b Mel Gorman         2014-10-02  245  			pte = maybe_mkwrite(pte, vma);
f45ec5ff16a75f Peter Xu           2020-04-06  246  		else if (pte_swp_uffd_wp(*pvmw.pte))
f45ec5ff16a75f Peter Xu           2020-04-06  247  			pte = pte_mkuffd_wp(pte);
d3cb8bf6081b8b Mel Gorman         2014-10-02  248  
df6ad69838fc9d Jérôme Glisse      2017-09-08  249  		if (unlikely(is_zone_device_page(new))) {
df6ad69838fc9d Jérôme Glisse      2017-09-08  250  			if (is_device_private_page(new)) {
a5430dda8a3a1c Jérôme Glisse      2017-09-08  251  				entry = make_device_private_entry(new, pte_write(pte));
a5430dda8a3a1c Jérôme Glisse      2017-09-08  252  				pte = swp_entry_to_pte(entry);
f45ec5ff16a75f Peter Xu           2020-04-06  253  				if (pte_swp_uffd_wp(*pvmw.pte))
f45ec5ff16a75f Peter Xu           2020-04-06  254  					pte = pte_mkuffd_wp(pte);
df6ad69838fc9d Jérôme Glisse      2017-09-08  255  			}
d2b2c6dd227ba5 Lars Persson       2019-03-28  256  		}
a5430dda8a3a1c Jérôme Glisse      2017-09-08  257  

:::::: The code at line 236 was first introduced by commit
:::::: 6d2329f8872f23e46a19d240930571510ce525eb mm: vm_page_prot: update with WRITE_ONCE/READ_ONCE

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
