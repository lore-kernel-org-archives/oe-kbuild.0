Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88063157A5A;
	Mon, 25 Mar 2024 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711348427; cv=none; b=ZSVALEm9S5zAFdwx+sRK+TEK7nVlqq/N/Aat31LG/XfsVNJL19CM4dbe2ABpxJadqlO3AmSDhGFHYquu4RKtLbdX6eaVCCfnKLyv0CdnbiOnOL8N5LbiI5Stk2lk/TTpXhdX9FuyfPFUVZ4WtvOcCeQZIQjvGfmo6Wx57mmccMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711348427; c=relaxed/simple;
	bh=GaENQly2w4XKpES52BvJy2zfDu4vm/g2xKjB2n7ebh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eda9DLNle/ApYuQZ78HfR5sKG8BcRkrp6ucM8QPIRiFsosuab1Sm2P5aRDxK0GO6tUkWheJ70GctKhJRz7S0p3qn2S9XyxDgHgIuiMbw8EVm3IfCbQBNTB+fnrm04Gm2C8DeAcIKsuaU4Jp1cVu13CwyELIaz1E9HrvzzuOuYSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V333N3Dn9z1R7sw;
	Mon, 25 Mar 2024 14:30:56 +0800 (CST)
Received: from dggpeml500011.china.huawei.com (unknown [7.185.36.84])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CC041A016C;
	Mon, 25 Mar 2024 14:33:34 +0800 (CST)
Received: from [10.174.179.13] (10.174.179.13) by
 dggpeml500011.china.huawei.com (7.185.36.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 14:33:33 +0800
Message-ID: <75cc40ee-38b3-0bee-7b41-15ab5fc6dc17@huawei.com>
Date: Mon, 25 Mar 2024 14:33:33 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
	<akpm@linux-foundation.org>, <david@redhat.com>, <shr@devkernel.io>,
	<hannes@cmpxchg.org>, <riel@surriel.com>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>, <linux-mm@kvack.org>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
References: <4005efd4-06a5-4c91-845a-f0ad2cc792e2@moroto.mountain>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <4005efd4-06a5-4c91-845a-f0ad2cc792e2@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500011.china.huawei.com (7.185.36.84)


在 2024/3/25 13:44, Dan Carpenter 写道:
> Hi Jinjiang,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-ksm-fix-ksm-exec-support-for-prctl/20240322-141317
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240322060947.3254967-2-tujinjiang%40huawei.com
> patch subject: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
> config: openrisc-randconfig-r081-20240322 (https://download.01.org/0day-ci/archive/20240324/202403240146.Pv4gVc5N-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403240146.Pv4gVc5N-lkp@intel.com/
>
> smatch warnings:
> fs/exec.c:305 __bprm_mm_init() error: uninitialized symbol 'err'.
>
> vim +/err +305 fs/exec.c
>
> b6a2fea39318e43 Ollie Wild                  2007-07-19  255  static int __bprm_mm_init(struct linux_binprm *bprm)
> b6a2fea39318e43 Ollie Wild                  2007-07-19  256  {
> eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  257  	int err;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  258  	struct vm_area_struct *vma = NULL;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  259  	struct mm_struct *mm = bprm->mm;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  260
> 490fc053865c9cc Linus Torvalds              2018-07-21  261  	bprm->vma = vma = vm_area_alloc(mm);
> b6a2fea39318e43 Ollie Wild                  2007-07-19  262  	if (!vma)
> eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  263  		return -ENOMEM;
> bfd40eaff5abb9f Kirill A. Shutemov          2018-07-26  264  	vma_set_anonymous(vma);
> b6a2fea39318e43 Ollie Wild                  2007-07-19  265
> d8ed45c5dcd455f Michel Lespinasse           2020-06-08  266  	if (mmap_write_lock_killable(mm)) {
> f268dfe905d4682 Michal Hocko                2016-05-23  267  		err = -EINTR;
> f268dfe905d4682 Michal Hocko                2016-05-23  268  		goto err_free;
> f268dfe905d4682 Michal Hocko                2016-05-23  269  	}
> b6a2fea39318e43 Ollie Wild                  2007-07-19  270
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  271  	/*
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  272  	 * Need to be called with mmap write lock
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  273  	 * held, to avoid race with ksmd.
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  274  	*/
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  275  	if (ksm_execve(mm))
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  276  		goto err_ksm;
>
> "err" not set before the goto.

The code should be:

err = ksm_execve(mm);
if (err)
     goto err_ksm;

I will fix in the next version.

>
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  277
> b6a2fea39318e43 Ollie Wild                  2007-07-19  278  	/*
> b6a2fea39318e43 Ollie Wild                  2007-07-19  279  	 * Place the stack at the largest stack address the architecture
> b6a2fea39318e43 Ollie Wild                  2007-07-19  280  	 * supports. Later, we'll move this to an appropriate place. We don't
> b6a2fea39318e43 Ollie Wild                  2007-07-19  281  	 * use STACK_TOP because that can depend on attributes which aren't
> b6a2fea39318e43 Ollie Wild                  2007-07-19  282  	 * configured yet.
> b6a2fea39318e43 Ollie Wild                  2007-07-19  283  	 */
> aacb3d17a73f644 Michal Hocko                2011-07-26  284  	BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
> b6a2fea39318e43 Ollie Wild                  2007-07-19  285  	vma->vm_end = STACK_TOP_MAX;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  286  	vma->vm_start = vma->vm_end - PAGE_SIZE;
> 1c71222e5f2393b Suren Baghdasaryan          2023-01-26  287  	vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
> 3ed75eb8f1cd895 Coly Li                     2007-10-18  288  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> 462e635e5b73ba9 Tavis Ormandy               2010-12-09  289
> b6a2fea39318e43 Ollie Wild                  2007-07-19  290  	err = insert_vm_struct(mm, vma);
> eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  291  	if (err)
> b6a2fea39318e43 Ollie Wild                  2007-07-19  292  		goto err;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  293
> b6a2fea39318e43 Ollie Wild                  2007-07-19  294  	mm->stack_vm = mm->total_vm = 1;
> d8ed45c5dcd455f Michel Lespinasse           2020-06-08  295  	mmap_write_unlock(mm);
> b6a2fea39318e43 Ollie Wild                  2007-07-19  296  	bprm->p = vma->vm_end - sizeof(void *);
> b6a2fea39318e43 Ollie Wild                  2007-07-19  297  	return 0;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  298  err:
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  299  	ksm_exit(mm);
> d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  300  err_ksm:
> d8ed45c5dcd455f Michel Lespinasse           2020-06-08  301  	mmap_write_unlock(mm);
> f268dfe905d4682 Michal Hocko                2016-05-23  302  err_free:
> b6a2fea39318e43 Ollie Wild                  2007-07-19  303  	bprm->vma = NULL;
> 3928d4f5ee37cdc Linus Torvalds              2018-07-21  304  	vm_area_free(vma);
> b6a2fea39318e43 Ollie Wild                  2007-07-19 @305  	return err;
> b6a2fea39318e43 Ollie Wild                  2007-07-19  306  }
>
