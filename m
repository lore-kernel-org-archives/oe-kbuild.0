Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4238BE2
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Aug 2023 04:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692332499; x=1723868499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wehWNc1S5IC/f3euXyVJIe4peURGLIKHqHuP2rg4hZg=;
  b=DlCjHwbIMiTDHBazG8/6mmy7z+K47QlkJRBdjmriaQd8YnoJZYVlvF2H
   Tp7StEDPsuSXwHWbtKawK7+q091WN0zFJj+woS0Q0Xn3Kw8GLhu9Jv2bo
   jLbhpvCemqZ8pPZ9/ywrPHd8Svln38gTnl9cE93oaSELvPa6EdYgaYOD+
   z6Yl3NkRSj1MGe4G64nwyfVTR6/k+R2jt+XAtaXgwQB2cAnKF3WUR7MsB
   Rk7u5nnnPads5yRhbH3ld1YdpXwYNLu4fhGGH3TaMKCgC/TSC5b8esn6X
   1Joz7QAJXH2M1wInT9Wu+W7yAsFmV4Rnb226C3EqhROpt9xVZMhBxR2Sp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459363859"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="459363859"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 21:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858528611"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="858528611"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 21:21:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWqzK-00025Y-2B;
	Fri, 18 Aug 2023 04:21:32 +0000
Date: Fri, 18 Aug 2023 12:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/bnxt_re/ib_verbs.c:4189
 bnxt_re_handler_BNXT_RE_METHOD_ALLOC_PAGE() error: uninitialized symbol
 '_val'.
Message-ID: <202308181216.NYHDqB4l-lkp@intel.com>
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
TO: Selvin Xavier <selvin.xavier@broadcom.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16931859a6500d360b90aeacab3b505a3560a3ed
commit: 360da60d6c6edb9740de7a8e6d8969d62ceff956 RDMA/bnxt_re: Enable low latency push
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-m031-20230816 (https://download.01.org/0day-ci/archive/20230818/202308181216.NYHDqB4l-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181216.NYHDqB4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308181216.NYHDqB4l-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/bnxt_re/ib_verbs.c:4189 bnxt_re_handler_BNXT_RE_METHOD_ALLOC_PAGE() error: uninitialized symbol '_val'.

vim +/_val +4189 drivers/infiniband/hw/bnxt_re/ib_verbs.c

360da60d6c6edb Selvin Xavier 2023-06-13  4169  
360da60d6c6edb Selvin Xavier 2023-06-13  4170  static int UVERBS_HANDLER(BNXT_RE_METHOD_ALLOC_PAGE)(struct uverbs_attr_bundle *attrs)
360da60d6c6edb Selvin Xavier 2023-06-13  4171  {
360da60d6c6edb Selvin Xavier 2023-06-13  4172  	struct ib_uobject *uobj = uverbs_attr_get_uobject(attrs, BNXT_RE_ALLOC_PAGE_HANDLE);
360da60d6c6edb Selvin Xavier 2023-06-13  4173  	enum bnxt_re_alloc_page_type alloc_type;
360da60d6c6edb Selvin Xavier 2023-06-13  4174  	struct bnxt_re_user_mmap_entry *entry;
360da60d6c6edb Selvin Xavier 2023-06-13  4175  	enum bnxt_re_mmap_flag mmap_flag;
360da60d6c6edb Selvin Xavier 2023-06-13  4176  	struct bnxt_qplib_chip_ctx *cctx;
360da60d6c6edb Selvin Xavier 2023-06-13  4177  	struct bnxt_re_ucontext *uctx;
360da60d6c6edb Selvin Xavier 2023-06-13  4178  	struct bnxt_re_dev *rdev;
360da60d6c6edb Selvin Xavier 2023-06-13  4179  	u64 mmap_offset;
360da60d6c6edb Selvin Xavier 2023-06-13  4180  	u32 length;
360da60d6c6edb Selvin Xavier 2023-06-13  4181  	u32 dpi;
360da60d6c6edb Selvin Xavier 2023-06-13  4182  	u64 dbr;
360da60d6c6edb Selvin Xavier 2023-06-13  4183  	int err;
360da60d6c6edb Selvin Xavier 2023-06-13  4184  
360da60d6c6edb Selvin Xavier 2023-06-13  4185  	uctx = container_of(ib_uverbs_get_ucontext(attrs), struct bnxt_re_ucontext, ib_uctx);
360da60d6c6edb Selvin Xavier 2023-06-13  4186  	if (IS_ERR(uctx))
360da60d6c6edb Selvin Xavier 2023-06-13  4187  		return PTR_ERR(uctx);
360da60d6c6edb Selvin Xavier 2023-06-13  4188  
360da60d6c6edb Selvin Xavier 2023-06-13 @4189  	err = uverbs_get_const(&alloc_type, attrs, BNXT_RE_ALLOC_PAGE_TYPE);
360da60d6c6edb Selvin Xavier 2023-06-13  4190  	if (err)
360da60d6c6edb Selvin Xavier 2023-06-13  4191  		return err;
360da60d6c6edb Selvin Xavier 2023-06-13  4192  
360da60d6c6edb Selvin Xavier 2023-06-13  4193  	rdev = uctx->rdev;
360da60d6c6edb Selvin Xavier 2023-06-13  4194  	cctx = rdev->chip_ctx;
360da60d6c6edb Selvin Xavier 2023-06-13  4195  
360da60d6c6edb Selvin Xavier 2023-06-13  4196  	switch (alloc_type) {
360da60d6c6edb Selvin Xavier 2023-06-13  4197  	case BNXT_RE_ALLOC_WC_PAGE:
360da60d6c6edb Selvin Xavier 2023-06-13  4198  		if (cctx->modes.db_push)  {
360da60d6c6edb Selvin Xavier 2023-06-13  4199  			if (bnxt_qplib_alloc_dpi(&rdev->qplib_res, &uctx->wcdpi,
360da60d6c6edb Selvin Xavier 2023-06-13  4200  						 uctx, BNXT_QPLIB_DPI_TYPE_WC))
360da60d6c6edb Selvin Xavier 2023-06-13  4201  				return -ENOMEM;
360da60d6c6edb Selvin Xavier 2023-06-13  4202  			length = PAGE_SIZE;
360da60d6c6edb Selvin Xavier 2023-06-13  4203  			dpi = uctx->wcdpi.dpi;
360da60d6c6edb Selvin Xavier 2023-06-13  4204  			dbr = (u64)uctx->wcdpi.umdbr;
360da60d6c6edb Selvin Xavier 2023-06-13  4205  			mmap_flag = BNXT_RE_MMAP_WC_DB;
360da60d6c6edb Selvin Xavier 2023-06-13  4206  		} else {
360da60d6c6edb Selvin Xavier 2023-06-13  4207  			return -EINVAL;
360da60d6c6edb Selvin Xavier 2023-06-13  4208  		}
360da60d6c6edb Selvin Xavier 2023-06-13  4209  
360da60d6c6edb Selvin Xavier 2023-06-13  4210  		break;
360da60d6c6edb Selvin Xavier 2023-06-13  4211  
360da60d6c6edb Selvin Xavier 2023-06-13  4212  	default:
360da60d6c6edb Selvin Xavier 2023-06-13  4213  		return -EOPNOTSUPP;
360da60d6c6edb Selvin Xavier 2023-06-13  4214  	}
360da60d6c6edb Selvin Xavier 2023-06-13  4215  
360da60d6c6edb Selvin Xavier 2023-06-13  4216  	entry = bnxt_re_mmap_entry_insert(uctx, dbr, mmap_flag, &mmap_offset);
360da60d6c6edb Selvin Xavier 2023-06-13  4217  	if (IS_ERR(entry))
360da60d6c6edb Selvin Xavier 2023-06-13  4218  		return PTR_ERR(entry);
360da60d6c6edb Selvin Xavier 2023-06-13  4219  
360da60d6c6edb Selvin Xavier 2023-06-13  4220  	uobj->object = entry;
360da60d6c6edb Selvin Xavier 2023-06-13  4221  	uverbs_finalize_uobj_create(attrs, BNXT_RE_ALLOC_PAGE_HANDLE);
360da60d6c6edb Selvin Xavier 2023-06-13  4222  	err = uverbs_copy_to(attrs, BNXT_RE_ALLOC_PAGE_MMAP_OFFSET,
360da60d6c6edb Selvin Xavier 2023-06-13  4223  			     &mmap_offset, sizeof(mmap_offset));
360da60d6c6edb Selvin Xavier 2023-06-13  4224  	if (err)
360da60d6c6edb Selvin Xavier 2023-06-13  4225  		return err;
360da60d6c6edb Selvin Xavier 2023-06-13  4226  
360da60d6c6edb Selvin Xavier 2023-06-13  4227  	err = uverbs_copy_to(attrs, BNXT_RE_ALLOC_PAGE_MMAP_LENGTH,
360da60d6c6edb Selvin Xavier 2023-06-13  4228  			     &length, sizeof(length));
360da60d6c6edb Selvin Xavier 2023-06-13  4229  	if (err)
360da60d6c6edb Selvin Xavier 2023-06-13  4230  		return err;
360da60d6c6edb Selvin Xavier 2023-06-13  4231  
360da60d6c6edb Selvin Xavier 2023-06-13  4232  	err = uverbs_copy_to(attrs, BNXT_RE_ALLOC_PAGE_DPI,
360da60d6c6edb Selvin Xavier 2023-06-13  4233  			     &dpi, sizeof(length));
360da60d6c6edb Selvin Xavier 2023-06-13  4234  	if (err)
360da60d6c6edb Selvin Xavier 2023-06-13  4235  		return err;
360da60d6c6edb Selvin Xavier 2023-06-13  4236  
360da60d6c6edb Selvin Xavier 2023-06-13  4237  	return 0;
360da60d6c6edb Selvin Xavier 2023-06-13  4238  }
360da60d6c6edb Selvin Xavier 2023-06-13  4239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
