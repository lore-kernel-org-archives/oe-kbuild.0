Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951053F8C7
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Mar 2024 17:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711214713; cv=none; b=UYC6/eVUi3A5TP9Y34LXVfk1pp3W2iUPdTiSvVW03dZZF0tUMERZIXRSehcQQvhDNOn5YY7WSOvBDhXUTq2+wPB0nkJHmSSvBKpeTgIFE3FFKcMBBFbZKL9ZHHKjBiQfj+SzopTL6n6bcid3QK6C1mssqczJ0Up/Z7Zsos0TD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711214713; c=relaxed/simple;
	bh=2FhQARLxIU4+uqUV3vDQ/8zlK0IomaRGk2KhGGJiluY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KsIQtF3Pn7ZwbUG+bav9V9jNxrzhVnNm2GpfTdeHMajeICxJzdmaXXn4vRwk4Q8ZjRi7zEEzOmunB2sjQxOFez/C0cwRLvJXzwD/pbkWN6049jgdE38DdJYyg62+rqJxAPpnIzF5STSHEMwRTapRZyqvzGI3tOTghkam+0r3C2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5M8nurl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5M8nurl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711214711; x=1742750711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FhQARLxIU4+uqUV3vDQ/8zlK0IomaRGk2KhGGJiluY=;
  b=I5M8nurlPQLOu+EUmpAe4k/Eo5uREdYdqM2vcyxSA76H2ZAZHTlhTdE4
   NOFZL3r7sK4qhZgRdlypLXX5mEDqLyybZ78puhNYF4x1SL9pkJpw0e3tR
   Ui4EgdxhpC/jsyA9WmjsH3MsxCryggQ8hfTP1Am9Lw0B3H52UbJPF274I
   rrj2mrFUBDJleJqr81CfeTFWoXelBo721DY9f/vefewt/kyZqq/562A2j
   r8cqXXZRhr0t9dkpf2hpeoVA0/WE9gOG7GGuVi6hgG8wtL8EDXTBG4C6z
   ySUnBe/HEp9Z196/NcsUlmkuA+zlfJCq0FiyvFc2lq91TwiA5TKO7cpx8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="17395655"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="17395655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 10:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="52658720"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Mar 2024 10:25:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro57C-000LMV-21;
	Sat, 23 Mar 2024 17:25:06 +0000
Date: Sun, 24 Mar 2024 01:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
Message-ID: <202403240146.Pv4gVc5N-lkp@intel.com>
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
In-Reply-To: <20240322060947.3254967-2-tujinjiang@huawei.com>
References: <20240322060947.3254967-2-tujinjiang@huawei.com>
TO: Jinjiang Tu <tujinjiang@huawei.com>
TO: akpm@linux-foundation.org
TO: david@redhat.com
TO: shr@devkernel.io
TO: hannes@cmpxchg.org
TO: riel@surriel.com
TO: wangkefeng.wang@huawei.com
TO: sunnanyong@huawei.com
TO: linux-mm@kvack.org
CC: tujinjiang@huawei.com

Hi Jinjiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-ksm-fix-ksm-exec-support-for-prctl/20240322-141317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240322060947.3254967-2-tujinjiang%40huawei.com
patch subject: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: openrisc-randconfig-r081-20240322 (https://download.01.org/0day-ci/archive/20240324/202403240146.Pv4gVc5N-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403240146.Pv4gVc5N-lkp@intel.com/

smatch warnings:
fs/exec.c:305 __bprm_mm_init() error: uninitialized symbol 'err'.

vim +/err +305 fs/exec.c

b6a2fea39318e43 Ollie Wild                  2007-07-19  254  
b6a2fea39318e43 Ollie Wild                  2007-07-19  255  static int __bprm_mm_init(struct linux_binprm *bprm)
b6a2fea39318e43 Ollie Wild                  2007-07-19  256  {
eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  257  	int err;
b6a2fea39318e43 Ollie Wild                  2007-07-19  258  	struct vm_area_struct *vma = NULL;
b6a2fea39318e43 Ollie Wild                  2007-07-19  259  	struct mm_struct *mm = bprm->mm;
b6a2fea39318e43 Ollie Wild                  2007-07-19  260  
490fc053865c9cc Linus Torvalds              2018-07-21  261  	bprm->vma = vma = vm_area_alloc(mm);
b6a2fea39318e43 Ollie Wild                  2007-07-19  262  	if (!vma)
eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  263  		return -ENOMEM;
bfd40eaff5abb9f Kirill A. Shutemov          2018-07-26  264  	vma_set_anonymous(vma);
b6a2fea39318e43 Ollie Wild                  2007-07-19  265  
d8ed45c5dcd455f Michel Lespinasse           2020-06-08  266  	if (mmap_write_lock_killable(mm)) {
f268dfe905d4682 Michal Hocko                2016-05-23  267  		err = -EINTR;
f268dfe905d4682 Michal Hocko                2016-05-23  268  		goto err_free;
f268dfe905d4682 Michal Hocko                2016-05-23  269  	}
b6a2fea39318e43 Ollie Wild                  2007-07-19  270  
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  271  	/*
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  272  	 * Need to be called with mmap write lock
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  273  	 * held, to avoid race with ksmd.
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  274  	*/
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  275  	if (ksm_execve(mm))
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  276  		goto err_ksm;
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  277  
b6a2fea39318e43 Ollie Wild                  2007-07-19  278  	/*
b6a2fea39318e43 Ollie Wild                  2007-07-19  279  	 * Place the stack at the largest stack address the architecture
b6a2fea39318e43 Ollie Wild                  2007-07-19  280  	 * supports. Later, we'll move this to an appropriate place. We don't
b6a2fea39318e43 Ollie Wild                  2007-07-19  281  	 * use STACK_TOP because that can depend on attributes which aren't
b6a2fea39318e43 Ollie Wild                  2007-07-19  282  	 * configured yet.
b6a2fea39318e43 Ollie Wild                  2007-07-19  283  	 */
aacb3d17a73f644 Michal Hocko                2011-07-26  284  	BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
b6a2fea39318e43 Ollie Wild                  2007-07-19  285  	vma->vm_end = STACK_TOP_MAX;
b6a2fea39318e43 Ollie Wild                  2007-07-19  286  	vma->vm_start = vma->vm_end - PAGE_SIZE;
1c71222e5f2393b Suren Baghdasaryan          2023-01-26  287  	vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
3ed75eb8f1cd895 Coly Li                     2007-10-18  288  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
462e635e5b73ba9 Tavis Ormandy               2010-12-09  289  
b6a2fea39318e43 Ollie Wild                  2007-07-19  290  	err = insert_vm_struct(mm, vma);
eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  291  	if (err)
b6a2fea39318e43 Ollie Wild                  2007-07-19  292  		goto err;
b6a2fea39318e43 Ollie Wild                  2007-07-19  293  
b6a2fea39318e43 Ollie Wild                  2007-07-19  294  	mm->stack_vm = mm->total_vm = 1;
d8ed45c5dcd455f Michel Lespinasse           2020-06-08  295  	mmap_write_unlock(mm);
b6a2fea39318e43 Ollie Wild                  2007-07-19  296  	bprm->p = vma->vm_end - sizeof(void *);
b6a2fea39318e43 Ollie Wild                  2007-07-19  297  	return 0;
b6a2fea39318e43 Ollie Wild                  2007-07-19  298  err:
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  299  	ksm_exit(mm);
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  300  err_ksm:
d8ed45c5dcd455f Michel Lespinasse           2020-06-08  301  	mmap_write_unlock(mm);
f268dfe905d4682 Michal Hocko                2016-05-23  302  err_free:
b6a2fea39318e43 Ollie Wild                  2007-07-19  303  	bprm->vma = NULL;
3928d4f5ee37cdc Linus Torvalds              2018-07-21  304  	vm_area_free(vma);
b6a2fea39318e43 Ollie Wild                  2007-07-19 @305  	return err;
b6a2fea39318e43 Ollie Wild                  2007-07-19  306  }
b6a2fea39318e43 Ollie Wild                  2007-07-19  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
