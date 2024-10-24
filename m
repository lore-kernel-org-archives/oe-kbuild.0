Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C39189F3E
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807111; cv=none; b=Z6Mp2+RfU3Wjokh4a6brG2FIYoZVS/s1f409MU6Otb/fPqMRaD9I1Qs0TgVEJpB8of2MPrJs/jgEMIgYML4l9RZuv8hwcMk3mPAa+Y86g/We9QZ3NfsiDRA91ThmraB/bWLs7Fs15JUT33gZkypmcvGfl20zEbvYAeFbYHbho0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807111; c=relaxed/simple;
	bh=kdami/2xAQl7FSah2fvdRe4KvsOuYn7Aa69RWOFY0xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kNDYCBcEqvvtlEuvrahQRTp4f5GsrJhLr8BVYZpXKfXMpBK8fgREH7zt8PyTwIZrCdAnf7TZsJBFD+Ick7OQw8SLzZFTwJqjE0EzR+6PAYLS+wQ5FPOHwtHXTRnjfL87stuMNP9e986f2RYTEqVqfXf3aXqxe4hb3ajK4uNfDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLUfGZh4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLUfGZh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729807109; x=1761343109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kdami/2xAQl7FSah2fvdRe4KvsOuYn7Aa69RWOFY0xg=;
  b=KLUfGZh4NWRYMzFN8GKPORjENa2zcgdxzvxsu98gvy5Sh+CFFuucScu/
   oGlZce9qBi+mXmpEGEXlWsup822u9qVHYZbp6I/O2lc8X2aQrn7JrBJAw
   ywkPL9y14pZivwNWw+Kn1amp8wzquXcy6/ZuRAvznZhSO673EGibub1+W
   1/7HOiIovJoS8ERWCINxM+14GM75zuG/pj2j3draqSo58HyTSENUTQcpo
   oEuqVewYMlbxcz5y1Mmn7P3EdrmygbaIq3F4ncgEBv2s6VTjPC6aI/sk2
   z/LPFMNSjxM6eOTQvnfpuqtcjBdEr2fdvrpq4QL27yNAYx4fqmCF8lpv8
   A==;
X-CSE-ConnectionGUID: NR3/GY2qSoKIv4wybGs3sA==
X-CSE-MsgGUID: DXK8LsdbR4a86dcSNpf/4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52016476"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52016476"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 14:58:25 -0700
X-CSE-ConnectionGUID: ANsThX+bQCahQhqwGDzwWQ==
X-CSE-MsgGUID: uG7UqIobTROQMSdL+mLEqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="84685135"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 14:58:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t45qX-000XBe-2r;
	Thu, 24 Oct 2024 21:58:21 +0000
Date: Fri, 25 Oct 2024 05:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/mm/fault.c:566 do_secure_storage_access() warn:
 inconsistent returns '&mm->mmap_lock'.
Message-ID: <202410250552.XsMLl1sx-lkp@intel.com>
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
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 7c194d84a9ce662426b2ecb59da54bb80c6b1d91 s390/mm,fault: remove VM_FAULT_BADMAP and VM_FAULT_BADACCESS
date:   1 year ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year ago
config: s390-randconfig-r072-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250552.XsMLl1sx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250552.XsMLl1sx-lkp@intel.com/

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
