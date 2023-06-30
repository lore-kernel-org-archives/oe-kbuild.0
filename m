Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361515A6
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jun 2023 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688087469; x=1719623469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lkGgBSHIN+q31nOcqjGTAq5HOD/6CrYh7I5TR8rZN/8=;
  b=nwFTn0Zszxb+njmZY2/qcfoT9BAUYyemjULwGvjqir7TcsXyemYpFRSF
   gBkeCHcivJiEf49yBsW3Hael708fdOjSk0CbT+PoJXAhqeWuE+ROsl1s4
   YdvsawzS0K2XWqGZNHvp/H/s3l3YRXNA8NvPsxsg7s/QIDUBfR9OEBwkU
   KHrSdfkNqdv+8ZuZbjdc+J363aj/mnVaaGTZIG8A+Wy21t9y6Y1zABzDk
   qRC6Ez1p1no7eryZePNNXhG6qdW8Bj4a89uYRdKDWsKY8MvsBEMrgVTKI
   N5QG16gEUG56vMN9HX9ivdmCkycKnWfE8irvWGJY88TfwU4UZB0/6OV8k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="341861586"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="341861586"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 18:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="807565094"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="807565094"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2023 18:11:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF2fC-000EZN-0A;
	Fri, 30 Jun 2023 01:11:06 +0000
Date: Fri, 30 Jun 2023 09:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] fuse: add a new fuse init flag to relax restrictions
 in no cache mode
Message-ID: <202306300807.6nFdb8tj-lkp@intel.com>
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
In-Reply-To: <20230629081733.11309-1-hao.xu@linux.dev>
References: <20230629081733.11309-1-hao.xu@linux.dev>
TO: Hao Xu <hao.xu@linux.dev>
TO: fuse-devel@lists.sourceforge.net
CC: miklos@szeredi.hu
CC: bernd.schubert@fastmail.fm
CC: linux-fsdevel@vger.kernel.org
CC: Wanpeng Li <wanpengli@tencent.com>
CC: cgxu519@mykernel.net

Hi Hao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.4]
[also build test WARNING on linus/master]
[cannot apply to mszeredi-fuse/for-next next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Xu/fuse-add-a-new-fuse-init-flag-to-relax-restrictions-in-no-cache-mode/20230629-162139
base:   v6.4
patch link:    https://lore.kernel.org/r/20230629081733.11309-1-hao.xu%40linux.dev
patch subject: [PATCH v2] fuse: add a new fuse init flag to relax restrictions in no cache mode
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-m021-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300807.6nFdb8tj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300807.6nFdb8tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306300807.6nFdb8tj-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:2516 fuse_file_mmap() warn: maybe use && instead of &

vim +2516 fs/fuse/file.c

3be5a52b30aa5c Miklos Szeredi  2008-04-30  2502  
3be5a52b30aa5c Miklos Szeredi  2008-04-30  2503  static int fuse_file_mmap(struct file *file, struct vm_area_struct *vma)
3be5a52b30aa5c Miklos Szeredi  2008-04-30  2504  {
55752a3aba1387 Miklos Szeredi  2019-01-24  2505  	struct fuse_file *ff = file->private_data;
fad410b49bfb66 Hao Xu          2023-06-29  2506  	struct fuse_conn *fc = ff->fm->fc;
b6aeadeda22a9a Miklos Szeredi  2005-09-09  2507  
2a9a609a0c4a3b Stefan Hajnoczi 2020-08-19  2508  	/* DAX mmap is superior to direct_io mmap */
2a9a609a0c4a3b Stefan Hajnoczi 2020-08-19  2509  	if (FUSE_IS_DAX(file_inode(file)))
2a9a609a0c4a3b Stefan Hajnoczi 2020-08-19  2510  		return fuse_dax_mmap(file, vma);
2a9a609a0c4a3b Stefan Hajnoczi 2020-08-19  2511  
55752a3aba1387 Miklos Szeredi  2019-01-24  2512  	if (ff->open_flags & FOPEN_DIRECT_IO) {
fad410b49bfb66 Hao Xu          2023-06-29  2513  		/* Can't provide the coherency needed for MAP_SHARED
fad410b49bfb66 Hao Xu          2023-06-29  2514  		 * if FUSE_DIRECT_IO_RELAX isn't set.
fad410b49bfb66 Hao Xu          2023-06-29  2515  		 */
fad410b49bfb66 Hao Xu          2023-06-29 @2516  		if (!(ff->open_flags & fc->direct_io_relax) &&
fad410b49bfb66 Hao Xu          2023-06-29  2517  		    vma->vm_flags & VM_MAYSHARE)
fc280c9692031e Miklos Szeredi  2009-04-02  2518  			return -ENODEV;
fc280c9692031e Miklos Szeredi  2009-04-02  2519  
3121bfe7631126 Miklos Szeredi  2009-04-09  2520  		invalidate_inode_pages2(file->f_mapping);
3121bfe7631126 Miklos Szeredi  2009-04-09  2521  
fc280c9692031e Miklos Szeredi  2009-04-02  2522  		return generic_file_mmap(file, vma);
fc280c9692031e Miklos Szeredi  2009-04-02  2523  	}
fc280c9692031e Miklos Szeredi  2009-04-02  2524  
55752a3aba1387 Miklos Szeredi  2019-01-24  2525  	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
55752a3aba1387 Miklos Szeredi  2019-01-24  2526  		fuse_link_write_file(file);
55752a3aba1387 Miklos Szeredi  2019-01-24  2527  
55752a3aba1387 Miklos Szeredi  2019-01-24  2528  	file_accessed(file);
55752a3aba1387 Miklos Szeredi  2019-01-24  2529  	vma->vm_ops = &fuse_file_vm_ops;
55752a3aba1387 Miklos Szeredi  2019-01-24  2530  	return 0;
55752a3aba1387 Miklos Szeredi  2019-01-24  2531  }
55752a3aba1387 Miklos Szeredi  2019-01-24  2532  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
