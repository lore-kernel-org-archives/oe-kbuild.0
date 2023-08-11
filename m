Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9449917FE
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691734602; x=1723270602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARzkH2k43e06hgLTWWbYC8SvBtui0Y3FS482OPLUY1E=;
  b=KpEqqiMhi8Ze8GU2AVsi72Hy6uMrz7PYpgMcznX/uT3Auwdu754IBlHz
   LQKN0btSRM7dmHKHRWNR0PJvUcUTTQaHCxF+tmFvOqcrx1Yz3nXK8nHkv
   icjufnUT6IFY/igydaRQ8pqXeWxYU6njD/ARtnrJmIHTmiGG1we4hU7/V
   /Sl8XVhwlQ6J5EGi7LXxraBUO1gFK2pCGFQW/rZ0fTcH+hZNSS6OGtg2r
   cgJjc6Bu+OxJT0/yK7Hm7lDFPdbwCQLR2O/oO47Ybfd8luCS1U0njGSjz
   GAECRH1BZGyFgXXYDJth4HiXArkjYpgEV5ujFBDsHvDJV4tbKUYNd9FqG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437944222"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="437944222"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 23:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906328905"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="906328905"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Aug 2023 23:16:33 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qULRo-0007Yv-14;
	Fri, 11 Aug 2023 06:16:32 +0000
Date: Fri, 11 Aug 2023 14:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterator
 kfuncs
Message-ID: <202308111423.MRMNWfoF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230810183513.684836-3-davemarchevsky@fb.com>
References: <20230810183513.684836-3-davemarchevsky@fb.com>
TO: Dave Marchevsky <davemarchevsky@fb.com>
TO: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <martin.lau@kernel.org>
CC: Kernel Team <kernel-team@fb.com>
CC: Dave Marchevsky <davemarchevsky@fb.com>
CC: Nathan Slingerland <slinger@meta.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/bpf-Explicitly-emit-BTF-for-struct-bpf_iter_num-not-btf_iter_num/20230811-023615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230810183513.684836-3-davemarchevsky%40fb.com
patch subject: [PATCH bpf-next 2/3] bpf: Introduce task_vma open-coded iterator kfuncs
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230811/202308111423.MRMNWfoF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111423.MRMNWfoF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308111423.MRMNWfoF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/task_iter.c:837:17: warning: no previous prototype for 'bpf_iter_task_vma_new' [-Wmissing-prototypes]
     837 | __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:869:36: warning: no previous prototype for 'bpf_iter_task_vma_next' [-Wmissing-prototypes]
     869 | __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:878:18: warning: no previous prototype for 'bpf_iter_task_vma_destroy' [-Wmissing-prototypes]
     878 | __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_task_vma_new +837 kernel/bpf/task_iter.c

35129a6b021441 Dave Marchevsky 2023-08-10  836  
35129a6b021441 Dave Marchevsky 2023-08-10 @837  __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
35129a6b021441 Dave Marchevsky 2023-08-10  838  				      struct task_struct *task, u64 addr)
35129a6b021441 Dave Marchevsky 2023-08-10  839  {
35129a6b021441 Dave Marchevsky 2023-08-10  840  	struct bpf_iter_task_vma_kern *i = (void *)it;
35129a6b021441 Dave Marchevsky 2023-08-10  841  	bool irq_work_busy = false;
35129a6b021441 Dave Marchevsky 2023-08-10  842  
35129a6b021441 Dave Marchevsky 2023-08-10  843  	BUILD_BUG_ON(sizeof(struct bpf_iter_task_vma_kern) != sizeof(struct bpf_iter_task_vma));
35129a6b021441 Dave Marchevsky 2023-08-10  844  	BUILD_BUG_ON(__alignof__(struct bpf_iter_task_vma_kern) != __alignof__(struct bpf_iter_task_vma));
35129a6b021441 Dave Marchevsky 2023-08-10  845  
35129a6b021441 Dave Marchevsky 2023-08-10  846  	BTF_TYPE_EMIT(struct bpf_iter_task_vma);
35129a6b021441 Dave Marchevsky 2023-08-10  847  
35129a6b021441 Dave Marchevsky 2023-08-10  848  	/* NULL i->mm signals failed bpf_iter_task_vma initialization.
35129a6b021441 Dave Marchevsky 2023-08-10  849  	 * i->work == NULL is valid.
35129a6b021441 Dave Marchevsky 2023-08-10  850  	 */
35129a6b021441 Dave Marchevsky 2023-08-10  851  	i->mm = NULL;
35129a6b021441 Dave Marchevsky 2023-08-10  852  	if (!task)
35129a6b021441 Dave Marchevsky 2023-08-10  853  		return -ENOENT;
35129a6b021441 Dave Marchevsky 2023-08-10  854  
35129a6b021441 Dave Marchevsky 2023-08-10  855  	i->mm = task->mm;
35129a6b021441 Dave Marchevsky 2023-08-10  856  	if (!i->mm)
35129a6b021441 Dave Marchevsky 2023-08-10  857  		return -ENOENT;
35129a6b021441 Dave Marchevsky 2023-08-10  858  
35129a6b021441 Dave Marchevsky 2023-08-10  859  	irq_work_busy = bpf_mmap_unlock_get_irq_work(&i->work);
35129a6b021441 Dave Marchevsky 2023-08-10  860  	if (irq_work_busy || !mmap_read_trylock(i->mm)) {
35129a6b021441 Dave Marchevsky 2023-08-10  861  		i->mm = NULL;
35129a6b021441 Dave Marchevsky 2023-08-10  862  		return -EBUSY;
35129a6b021441 Dave Marchevsky 2023-08-10  863  	}
35129a6b021441 Dave Marchevsky 2023-08-10  864  
35129a6b021441 Dave Marchevsky 2023-08-10  865  	vma_iter_init(&i->vmi, i->mm, addr);
35129a6b021441 Dave Marchevsky 2023-08-10  866  	return 0;
35129a6b021441 Dave Marchevsky 2023-08-10  867  }
35129a6b021441 Dave Marchevsky 2023-08-10  868  
35129a6b021441 Dave Marchevsky 2023-08-10 @869  __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
35129a6b021441 Dave Marchevsky 2023-08-10  870  {
35129a6b021441 Dave Marchevsky 2023-08-10  871  	struct bpf_iter_task_vma_kern *i = (void *)it;
35129a6b021441 Dave Marchevsky 2023-08-10  872  
35129a6b021441 Dave Marchevsky 2023-08-10  873  	if (!i->mm) /* bpf_iter_task_vma_new failed */
35129a6b021441 Dave Marchevsky 2023-08-10  874  		return NULL;
35129a6b021441 Dave Marchevsky 2023-08-10  875  	return vma_next(&i->vmi);
35129a6b021441 Dave Marchevsky 2023-08-10  876  }
35129a6b021441 Dave Marchevsky 2023-08-10  877  
35129a6b021441 Dave Marchevsky 2023-08-10 @878  __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
35129a6b021441 Dave Marchevsky 2023-08-10  879  {
35129a6b021441 Dave Marchevsky 2023-08-10  880  	struct bpf_iter_task_vma_kern *i = (void *)it;
35129a6b021441 Dave Marchevsky 2023-08-10  881  
35129a6b021441 Dave Marchevsky 2023-08-10  882  	if (i->mm)
35129a6b021441 Dave Marchevsky 2023-08-10  883  		bpf_mmap_unlock_mm(i->work, i->mm);
35129a6b021441 Dave Marchevsky 2023-08-10  884  }
35129a6b021441 Dave Marchevsky 2023-08-10  885  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
