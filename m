Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864617BCA
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768785636; cv=none; b=IPvc/faQ8QgVI5f+94gk3iXmC8UP8iK++slsFEJCzj66y53PDkdaQseZQPCTCbpam92D4ttVs5yonAQaQlAG8HakKp/JQOPgLlp597EidXPdTPzVSh4G9Yb+/AwuPqDjg5H248buAw0qzS0PnRnorjeurfp8WVcWeloNgZ2MY/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768785636; c=relaxed/simple;
	bh=YwcOI+cKK6FoPi8MLlLwJ8Fjb3kWCyUNaoc1Y0X9w1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=frbMmV/WAp9nSTQxHIQlRY04HHr5hbSkLp954Ez+McsAaIg0n6Tq/JDHDI7aLmKDWZYJMRLrvAJxHp1jd5ddSTqlZdxLcyQQmb4VaE+GRXuDjvWMUnqsiFi3yatfbuE7JvzBSYmNYphuJp3wueaeG2boAMmAtdP6V24QEJruD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcWLrJdm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcWLrJdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768785633; x=1800321633;
  h=date:from:to:cc:subject:message-id;
  bh=YwcOI+cKK6FoPi8MLlLwJ8Fjb3kWCyUNaoc1Y0X9w1w=;
  b=gcWLrJdmo1mXtUA65JNI4SG3tcY/Tprw3DfFNt8mXzIOGzhyNaW3D0jz
   r91xS7dTiS/vgBHnGJkdhTuWHK1Ipb/vudL0x21wgfcxBiSQvJ681fg5c
   K2YusIfXMsbzT2iVtKLulZOLtQo7++c/t723HXww90OHQl9IQlzndVDzl
   RF1N2XyCqIXmhZxaP9eBzZfkBJAHIhPDpQbFD+dgp6c0vJl+sSKPT6V5Z
   I00xmsi1iGlbvM8lXPdYGXMiD5ieAnzX5o7OX9asb6lstamtZC7Op05AM
   1t769uwp78LH4g1zvVnBU8+EkrtKOrLrTG8MTpnY2U48AWjcb68P3j4Yy
   Q==;
X-CSE-ConnectionGUID: nwMXgTmcTbeY88wzODhphA==
X-CSE-MsgGUID: OPE0XWQSSkCEmoUcoG/1MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70047798"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70047798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 17:20:32 -0800
X-CSE-ConnectionGUID: jsT+PYS2RSyUnhIiAfnGUg==
X-CSE-MsgGUID: QpFG1n+BR2a7I65/vjJV6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210233781"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2026 17:20:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhdwS-00000000NL3-25QZ;
	Mon, 19 Jan 2026 01:20:28 +0000
Date: Mon, 19 Jan 2026 09:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:uffd/refactor/v0.2 5/11] mm/userfaultfd.c:930
 mfill_atomic() warn: variable dereferenced before check 'state.vma' (see line
 879)
Message-ID: <202601190953.KfihIx7W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.2
head:   2db3a86a6de3247449e068d998305d26481c5522
commit: 7ff11efe416b9de07f10978d2945864f128e46e3 [5/11] userfaultfd: retry copying with locks dropped in mfill_atomic_pte_copy()
:::::: branch date: 6 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190953.KfihIx7W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601190953.KfihIx7W-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:930 mfill_atomic() warn: variable dereferenced before check 'state.vma' (see line 879)

vim +930 mm/userfaultfd.c

3217d3c79b5d7aa Mike Rapoport             2017-09-06  842  
5e4c24a57b0c126 Lokesh Gidra              2024-02-15  843  static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
c1a4de99fada21e Andrea Arcangeli          2015-09-04  844  					    unsigned long dst_start,
c1a4de99fada21e Andrea Arcangeli          2015-09-04  845  					    unsigned long src_start,
c1a4de99fada21e Andrea Arcangeli          2015-09-04  846  					    unsigned long len,
d9712937037e0ce Axel Rasmussen            2023-03-14  847  					    uffd_flags_t flags)
c1a4de99fada21e Andrea Arcangeli          2015-09-04  848  {
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  849) 	struct mfill_state state = (struct mfill_state){
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  850) 		.ctx = ctx,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  851) 		.dst_start = dst_start,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  852) 		.src_start = src_start,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  853) 		.flags = flags,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  854) 
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  855) 		.src_addr = src_start,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  856) 		.dst_addr = dst_start,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  857) 	};
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  858) 	long copied = 0;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  859  	ssize_t err;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  860  
c1a4de99fada21e Andrea Arcangeli          2015-09-04  861  	/*
c1a4de99fada21e Andrea Arcangeli          2015-09-04  862  	 * Sanitize the command parameters:
c1a4de99fada21e Andrea Arcangeli          2015-09-04  863  	 */
31defc3b01d907e Tal Zussman               2025-06-19  864  	VM_WARN_ON_ONCE(dst_start & ~PAGE_MASK);
31defc3b01d907e Tal Zussman               2025-06-19  865  	VM_WARN_ON_ONCE(len & ~PAGE_MASK);
c1a4de99fada21e Andrea Arcangeli          2015-09-04  866  
c1a4de99fada21e Andrea Arcangeli          2015-09-04  867  	/* Does the address range wrap, or is the span zero-sized? */
31defc3b01d907e Tal Zussman               2025-06-19  868  	VM_WARN_ON_ONCE(src_start + len <= src_start);
31defc3b01d907e Tal Zussman               2025-06-19  869  	VM_WARN_ON_ONCE(dst_start + len <= dst_start);
c1a4de99fada21e Andrea Arcangeli          2015-09-04  870  
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  871  retry:
a729e934555ea5c Mike Rapoport (Microsoft  2025-07-07  872) 	err = mfill_get_vma(&state);
a729e934555ea5c Mike Rapoport (Microsoft  2025-07-07  873) 	if (err)
867a43a34ff8a38 Lokesh Gidra              2024-02-15  874  		goto out;
72981e0e7b609c7 Andrea Arcangeli          2020-04-06  875  
60d4d2d2b40e44c Mike Kravetz              2017-02-22  876  	/*
60d4d2d2b40e44c Mike Kravetz              2017-02-22  877  	 * If this is a HUGETLB vma, pass off to appropriate routine
60d4d2d2b40e44c Mike Kravetz              2017-02-22  878  	 */
a729e934555ea5c Mike Rapoport (Microsoft  2025-07-07 @879) 	if (is_vm_hugetlb_page(state.vma))
a729e934555ea5c Mike Rapoport (Microsoft  2025-07-07  880) 		return  mfill_atomic_hugetlb(ctx, state.vma, dst_start,
5e4c24a57b0c126 Lokesh Gidra              2024-02-15  881  					     src_start, len, flags);
60d4d2d2b40e44c Mike Kravetz              2017-02-22  882  
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  883) 	while (state.src_addr < src_start + len) {
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  884) 		VM_WARN_ON_ONCE(state.dst_addr >= dst_start + len);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  885  
a3257fdad5098bb Mike Rapoport (Microsoft  2025-07-07  886) 		err = mfill_get_pmd(&state);
a3257fdad5098bb Mike Rapoport (Microsoft  2025-07-07  887) 		if (err)
c1a4de99fada21e Andrea Arcangeli          2015-09-04  888  			break;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  889  
4828d207dc5161d Jann Horn                 2024-08-13  890  		/*
4828d207dc5161d Jann Horn                 2024-08-13  891  		 * For shmem mappings, khugepaged is allowed to remove page
4828d207dc5161d Jann Horn                 2024-08-13  892  		 * tables under us; pte_offset_map_lock() will deal with that.
4828d207dc5161d Jann Horn                 2024-08-13  893  		 */
c1a4de99fada21e Andrea Arcangeli          2015-09-04  894  
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  895) 		err = mfill_atomic_pte(&state);
c1a4de99fada21e Andrea Arcangeli          2015-09-04  896  		cond_resched();
c1a4de99fada21e Andrea Arcangeli          2015-09-04  897  
9e368259ad98835 Andrea Arcangeli          2018-11-30  898  		if (unlikely(err == -ENOENT)) {
d7be6d7eee1bbf9 ZhangPeng                 2023-04-10  899  			void *kaddr;
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  900  
a729e934555ea5c Mike Rapoport (Microsoft  2025-07-07  901) 			mfill_put_vma(&state);
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  902) 			VM_WARN_ON_ONCE(!state.folio);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  903  
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  904) 			kaddr = kmap_local_folio(state.folio, 0);
d7be6d7eee1bbf9 ZhangPeng                 2023-04-10  905  			err = copy_from_user(kaddr,
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  906) 					     (const void __user *)state.src_addr,
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  907  					     PAGE_SIZE);
d7be6d7eee1bbf9 ZhangPeng                 2023-04-10  908  			kunmap_local(kaddr);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  909  			if (unlikely(err)) {
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  910  				err = -EFAULT;
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  911  				goto out;
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  912  			}
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  913) 			flush_dcache_folio(state.folio);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  914  			goto retry;
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  915  		} else
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  916) 			VM_WARN_ON_ONCE(state.folio);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  917  
c1a4de99fada21e Andrea Arcangeli          2015-09-04  918  		if (!err) {
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  919) 			state.dst_addr += PAGE_SIZE;
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  920) 			state.src_addr += PAGE_SIZE;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  921  			copied += PAGE_SIZE;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  922  
c1a4de99fada21e Andrea Arcangeli          2015-09-04  923  			if (fatal_signal_pending(current))
c1a4de99fada21e Andrea Arcangeli          2015-09-04  924  				err = -EINTR;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  925  		}
c1a4de99fada21e Andrea Arcangeli          2015-09-04  926  		if (err)
c1a4de99fada21e Andrea Arcangeli          2015-09-04  927  			break;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  928  	}
c1a4de99fada21e Andrea Arcangeli          2015-09-04  929  
7ff11efe416b9de Mike Rapoport (Microsoft  2026-01-11 @930) 	if (state.vma)
a729e934555ea5c Mike Rapoport (Microsoft  2025-07-07  931) 		mfill_put_vma(&state);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  932  out:
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  933) 	if (state.folio)
375eb8947b4c3ca Mike Rapoport (Microsoft  2026-01-11  934) 		folio_put(state.folio);
31defc3b01d907e Tal Zussman               2025-06-19  935  	VM_WARN_ON_ONCE(copied < 0);
31defc3b01d907e Tal Zussman               2025-06-19  936  	VM_WARN_ON_ONCE(err > 0);
31defc3b01d907e Tal Zussman               2025-06-19  937  	VM_WARN_ON_ONCE(!copied && !err);
c1a4de99fada21e Andrea Arcangeli          2015-09-04  938  	return copied ? copied : err;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  939  }
c1a4de99fada21e Andrea Arcangeli          2015-09-04  940  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
