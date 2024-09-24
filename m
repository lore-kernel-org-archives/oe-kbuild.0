Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3923D7
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160130; cv=none; b=lHM37fO6ddpOcTtxppDXT3HNqVDdF01ciMcbEjMasoeMzFuaNiBGWCA2yE27AlmBfxbFsPFoBW7HvauS1gaw7DBTjme+UfFINcE1gYMqQcdvMJ62t6dJ+CaUCDRfRYItlkR0DBd3iz9/y3BqoG0A97dfbHcdv01Y5r1noENAgMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160130; c=relaxed/simple;
	bh=JnDQHjVdM0wP+1hVPp0lkjk8Jd0ZdNySlKiKK5aakK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3vN+A9xeZOKaq8Jatg5MyMVBn0CbFOjbrbcl8lD55LJ+bF3rT0YGhdQ8yoIbfTF1stvI1XhAnfnuHzuxoQylrvopp6az0w8xLTShj1jSiiJKTQK4KZAafvwBDAMk313KJ4jmvXc+jdDm32K4p23Uo4Utwj8ChZf0CaHXwyoIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAwerLfg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAwerLfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727160128; x=1758696128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnDQHjVdM0wP+1hVPp0lkjk8Jd0ZdNySlKiKK5aakK4=;
  b=YAwerLfgmtEOUGdCT5q581SYNzo4ODZzxeOt+yBvRKLB/wxgFfw25Z3d
   3xGz/9LPVZgJJ1TSaLqAPF1u14bPM0OkClJlWIT8a6aeCOe5BEYt1BjF1
   sqBOR2wGfw56KpsBQLgwmvNcDJTq+f87XaI3/665y8Y3RHTXuVKYxPdz1
   yjZzimZNiyNGnBaOZUSVs2Sva+jCQ7fJwmh0TajIJRYG6rr9A5HsMi9Ey
   3fAGLQBV1eF89MvaJkj2tPvvF+U//8Q9vYATVm/FhFf2Xn7jWLrwEIn6t
   ea1HEGay5NMjBKdHhxwHCrvBam1ss6ur8HMNbVOAFvTN6O2MGMZkzeziw
   Q==;
X-CSE-ConnectionGUID: LZQ+udUZTia0VKQmySU1WQ==
X-CSE-MsgGUID: Y2H0hLW6QUCt7N9kgUDdvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36721111"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="36721111"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 23:42:07 -0700
X-CSE-ConnectionGUID: Y9MBfn/rQx24LRxnwnM0sw==
X-CSE-MsgGUID: vckbgWrjSKi+gWYrtxRG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="75835288"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2024 23:42:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sszFL-000I2O-20;
	Tue, 24 Sep 2024 06:42:03 +0000
Date: Tue, 24 Sep 2024 14:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/mm/fault.c:566 do_secure_storage_access() warn:
 inconsistent returns '&mm->mmap_lock'.
Message-ID: <202409241449.CmMqcFbJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: 7c194d84a9ce662426b2ecb59da54bb80c6b1d91 s390/mm,fault: remove VM_FAULT_BADMAP and VM_FAULT_BADACCESS
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240924/202409241449.CmMqcFbJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241449.CmMqcFbJ-lkp@intel.com/

smatch warnings:
arch/s390/mm/fault.c:566 do_secure_storage_access() warn: inconsistent returns '&mm->mmap_lock'.

vim +566 arch/s390/mm/fault.c

17a363dcd2f745 Heiko Carstens    2021-04-09  497  
084ea4d611a3d0 Vasily Gorbik     2020-01-21  498  void do_secure_storage_access(struct pt_regs *regs)
084ea4d611a3d0 Vasily Gorbik     2020-01-21  499  {
5be05c35e72f74 Heiko Carstens    2023-10-12  500  	union teid teid = { .val = regs->int_parm_long };
9641613f48bbf8 Heiko Carstens    2023-10-12  501  	unsigned long addr = get_fault_address(regs);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  502  	struct vm_area_struct *vma;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  503  	struct mm_struct *mm;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  504  	struct page *page;
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  505  	struct gmap *gmap;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  506  	int rc;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  507  
85b18d7b5e7ffe Janosch Frank     2021-01-12  508  	/*
3aad8c04429779 Heiko Carstens    2023-10-12  509  	 * Bit 61 indicates if the address is valid, if it is not the
3aad8c04429779 Heiko Carstens    2023-10-12  510  	 * kernel should be stopped or SIGSEGV should be sent to the
3aad8c04429779 Heiko Carstens    2023-10-12  511  	 * process. Bit 61 is not reliable without the misc UV feature,
3aad8c04429779 Heiko Carstens    2023-10-12  512  	 * therefore this needs to be checked too.
85b18d7b5e7ffe Janosch Frank     2021-01-12  513  	 */
5be05c35e72f74 Heiko Carstens    2023-10-12  514  	if (uv_has_feature(BIT_UV_FEAT_MISC) && !teid.b61) {
85b18d7b5e7ffe Janosch Frank     2021-01-12  515  		/*
85b18d7b5e7ffe Janosch Frank     2021-01-12  516  		 * When this happens, userspace did something that it
85b18d7b5e7ffe Janosch Frank     2021-01-12  517  		 * was not supposed to do, e.g. branching into secure
85b18d7b5e7ffe Janosch Frank     2021-01-12  518  		 * memory. Trigger a segmentation fault.
85b18d7b5e7ffe Janosch Frank     2021-01-12  519  		 */
85b18d7b5e7ffe Janosch Frank     2021-01-12  520  		if (user_mode(regs)) {
85b18d7b5e7ffe Janosch Frank     2021-01-12  521  			send_sig(SIGSEGV, current, 0);
85b18d7b5e7ffe Janosch Frank     2021-01-12  522  			return;
85b18d7b5e7ffe Janosch Frank     2021-01-12  523  		}
85b18d7b5e7ffe Janosch Frank     2021-01-12  524  		/*
3aad8c04429779 Heiko Carstens    2023-10-12  525  		 * The kernel should never run into this case and
3aad8c04429779 Heiko Carstens    2023-10-12  526  		 * there is no way out of this situation.
85b18d7b5e7ffe Janosch Frank     2021-01-12  527  		 */
85b18d7b5e7ffe Janosch Frank     2021-01-12  528  		panic("Unexpected PGM 0x3d with TEID bit 61=0");
85b18d7b5e7ffe Janosch Frank     2021-01-12  529  	}
084ea4d611a3d0 Vasily Gorbik     2020-01-21  530  	switch (get_fault_type(regs)) {
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  531  	case GMAP_FAULT:
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  532  		mm = current->mm;
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  533  		gmap = (struct gmap *)S390_lowcore.gmap;
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  534  		mmap_read_lock(mm);
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  535  		addr = __gmap_translate(gmap, addr);
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  536  		mmap_read_unlock(mm);
7c194d84a9ce66 Heiko Carstens    2023-10-12  537  		if (IS_ERR_VALUE(addr))
7c194d84a9ce66 Heiko Carstens    2023-10-12  538  			return handle_fault_error_nolock(regs, SEGV_MAPERR);
b108f7f0a29b24 Claudio Imbrenda  2022-06-28  539  		fallthrough;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  540  	case USER_FAULT:
084ea4d611a3d0 Vasily Gorbik     2020-01-21  541  		mm = current->mm;
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  542  		mmap_read_lock(mm);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  543  		vma = find_vma(mm, addr);
7c194d84a9ce66 Heiko Carstens    2023-10-12  544  		if (!vma)
7c194d84a9ce66 Heiko Carstens    2023-10-12  545  			return handle_fault_error(regs, SEGV_MAPERR);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  546  		page = follow_page(vma, addr, FOLL_WRITE | FOLL_GET);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  547  		if (IS_ERR_OR_NULL(page)) {
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  548  			mmap_read_unlock(mm);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  549  			break;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  550  		}
084ea4d611a3d0 Vasily Gorbik     2020-01-21  551  		if (arch_make_page_accessible(page))
084ea4d611a3d0 Vasily Gorbik     2020-01-21  552  			send_sig(SIGSEGV, current, 0);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  553  		put_page(page);
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  554  		mmap_read_unlock(mm);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  555  		break;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  556  	case KERNEL_FAULT:
084ea4d611a3d0 Vasily Gorbik     2020-01-21  557  		page = phys_to_page(addr);
cd1adf1b63a112 Linus Torvalds    2021-09-07  558  		if (unlikely(!try_get_page(page)))
084ea4d611a3d0 Vasily Gorbik     2020-01-21  559  			break;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  560  		rc = arch_make_page_accessible(page);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  561  		put_page(page);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  562  		if (rc)
084ea4d611a3d0 Vasily Gorbik     2020-01-21  563  			BUG();
084ea4d611a3d0 Vasily Gorbik     2020-01-21  564  		break;
084ea4d611a3d0 Vasily Gorbik     2020-01-21  565  	default:
ae626f686351d2 Heiko Carstens    2023-10-12 @566  		unreachable();
084ea4d611a3d0 Vasily Gorbik     2020-01-21  567  	}
084ea4d611a3d0 Vasily Gorbik     2020-01-21  568  }
084ea4d611a3d0 Vasily Gorbik     2020-01-21  569  NOKPROBE_SYMBOL(do_secure_storage_access);
084ea4d611a3d0 Vasily Gorbik     2020-01-21  570  

:::::: The code at line 566 was first introduced by commit
:::::: ae626f686351d220d5eab746dc3a19e90bb1de9a s390/mm,fault: replace WARN_ON_ONCE() with unreachable()

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
