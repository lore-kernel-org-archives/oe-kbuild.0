Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B1320E330
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631892; cv=none; b=h++DU/7FWC1On1Bo4SKFF1u3FXmOv509t8vjY0HL1yKm745zXfzth11LeUu9tsCWayym0BY50Fug5Np6PMpO3Fr9V8MdfX8ljxun550qDJUy8PZeNPxRf6rwSVAXOgBVrRLD4nIIMQFuULci/npfddZpshHwpaqpYBM9eVbdXQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631892; c=relaxed/simple;
	bh=NQCFNpo8D7oeCUAZpkodDhaUlz3oIBfhM4GoNplF5T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WEt/pQBkZAOESyUCy4Don7kXPxrz2lXP6ZKOu286lgj3l5eDWB2JQVrInScQj3zWBYoDmGq0oQFM5VsNXpX0neb0b0Og/DF+19ck4JrnRHagXSnLrv4+F5Up1xweFr7Wx28TxqpmwYhsLxt/NlYxHyxchA1kMU4r9EE/1IXk0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hp8XMGwB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hp8XMGwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748631890; x=1780167890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQCFNpo8D7oeCUAZpkodDhaUlz3oIBfhM4GoNplF5T0=;
  b=hp8XMGwBcDGfbkHJF4oUo0ARKbXlhw5nmiPyEh6A6UK/lyb+8HIASj3J
   rlusoUlaeCe490MimX6J8P5MjBdxnuItHPtKMYWnT5gNay/5c7P0P3SA7
   ASRLerjFLAoO9UFQ96LB/M++d+cAZRClFEo2+MjVWAhRYx3vn7440ln2W
   Q2btwYtZvw1m05qCmzOt4xAFkgQ2hZpF8dMRw8p75DXIpLEdN7dytm2y0
   L+Cb7AMc+lbZ7AmhxkJKyq78qAZQRrFTGaNNdp66Bcc+vIXTZkWIWo5en
   brGb0w2dVhJ1cqvTEFLObXXz4DMXk6B3Z+qj0lE9w9m+YdGs6W7I2aXie
   w==;
X-CSE-ConnectionGUID: MEOHhVLYQhqkzWE/qH6YDw==
X-CSE-MsgGUID: FJevytP+RxOs6uqzErqV8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="73265263"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="73265263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 12:04:49 -0700
X-CSE-ConnectionGUID: /E7zgaatRlqCiR2ztYlBIA==
X-CSE-MsgGUID: JyEwYd5NSHmfC7Q0+XaLKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143801485"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2025 12:04:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL526-000XtY-0a;
	Fri, 30 May 2025 19:04:46 +0000
Date: Sat, 31 May 2025 03:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 02/13] writeback: add support to initialize and free
 multiple writeback ctxs
Message-ID: <202505310258.RgxJ9oQA-lkp@intel.com>
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
In-Reply-To: <20250529111504.89912-3-kundan.kumar@samsung.com>
References: <20250529111504.89912-3-kundan.kumar@samsung.com>
TO: Kundan Kumar <kundan.kumar@samsung.com>
TO: jaegeuk@kernel.org
TO: chao@kernel.org
TO: viro@zeniv.linux.org.uk
TO: brauner@kernel.org
TO: jack@suse.cz
TO: miklos@szeredi.hu
TO: agruenba@redhat.com
TO: trondmy@kernel.org
TO: anna@kernel.org
TO: akpm@linux-foundation.org
TO: willy@infradead.org
TO: mcgrof@kernel.org
TO: clm@meta.com
TO: david@fromorbit.com
TO: amir73il@gmail.com
TO: axboe@kernel.dk
TO: hch@lst.de
TO: ritesh.list@gmail.com
TO: djwong@kernel.org
TO: dave@stgolabs.net
TO: p.raghav@samsung.com
TO: da.gomez@samsung.com
CC: linux-f2fs-devel@lists.sourceforge.net
CC: linux-fsdevel@vger.kernel.org
CC: gfs2@lists.linux.dev
CC: linux-nfs@vger.kernel.org
CC: linux-mm@kvack.org
CC: gost.dev@samsung.com
CC: Kundan Kumar <kundan.kumar@samsung.com>
CC: Anuj Gupta <anuj20.g@samsung.com>

Hi Kundan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on akpm-mm/mm-everything jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.15]
[cannot apply to next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kundan-Kumar/writeback-add-infra-for-parallel-writeback/20250529-193523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250529111504.89912-3-kundan.kumar%40samsung.com
patch subject: [PATCH 02/13] writeback: add support to initialize and free multiple writeback ctxs
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310258.RgxJ9oQA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505310258.RgxJ9oQA-lkp@intel.com/

smatch warnings:
mm/backing-dev.c:853 cgwb_bdi_init() error: uninitialized symbol 'ret'.

vim +/ret +853 mm/backing-dev.c

52ebea749aaed19 Tejun Heo    2015-05-22  835  
a13f35e87140091 Tejun Heo    2015-07-02  836  static int cgwb_bdi_init(struct backing_dev_info *bdi)
52ebea749aaed19 Tejun Heo    2015-05-22  837  {
a13f35e87140091 Tejun Heo    2015-07-02  838  	int ret;
b70a489734e0b9c Kundan Kumar 2025-05-29  839  	struct bdi_writeback_ctx *bdi_wb_ctx;
a13f35e87140091 Tejun Heo    2015-07-02  840  
b70a489734e0b9c Kundan Kumar 2025-05-29  841  	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
31244c9dd7b2c22 Kundan Kumar 2025-05-29  842  		INIT_RADIX_TREE(&bdi_wb_ctx->cgwb_tree, GFP_ATOMIC);
3ee7e8697d5860b Jan Kara     2018-06-18  843  		mutex_init(&bdi->cgwb_release_mutex);
31244c9dd7b2c22 Kundan Kumar 2025-05-29  844  		init_rwsem(&bdi_wb_ctx->wb_switch_rwsem);
a13f35e87140091 Tejun Heo    2015-07-02  845  
31244c9dd7b2c22 Kundan Kumar 2025-05-29  846  		ret = wb_init(&bdi_wb_ctx->wb, bdi, GFP_KERNEL);
a13f35e87140091 Tejun Heo    2015-07-02  847  		if (!ret) {
31244c9dd7b2c22 Kundan Kumar 2025-05-29  848  			bdi_wb_ctx->wb.memcg_css = &root_mem_cgroup->css;
31244c9dd7b2c22 Kundan Kumar 2025-05-29  849  			bdi_wb_ctx->wb.blkcg_css = blkcg_root_css;
b70a489734e0b9c Kundan Kumar 2025-05-29  850  		} else
b70a489734e0b9c Kundan Kumar 2025-05-29  851  			return ret;
a13f35e87140091 Tejun Heo    2015-07-02  852  	}
a13f35e87140091 Tejun Heo    2015-07-02 @853  	return ret;
52ebea749aaed19 Tejun Heo    2015-05-22  854  }
52ebea749aaed19 Tejun Heo    2015-05-22  855  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
