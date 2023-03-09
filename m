Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88C622
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 06:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678343654; x=1709879654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPZHRb5TskPOk9/yxxxZhVml1DBS15QLwj360gqO9f0=;
  b=Q2X38rs8Dpg7dJPU8R+H/GYdysWulKfA5OCVlPvVgzYdjeBGdUEpJ6Uq
   26pPjBrkTgLHS57bp+5lQ+1+4kSgDioGXC9ikRnfwy6m42cupYZ1od/kc
   y6QEKIZx9IjKqUVnJ3M4a3x7b6ViGu/LApPlT7PD79hKPEBnLDl9QRlCg
   3I4qxfZf1IHN9wKRpf3yrHnmLvSf52IDg6uMxoXKxAoePaAkUbyYsvC69
   FGEThsUWJPQU/dpzkePQ6FpNdRNEubAnz7RiMsN04kEBAm2/lGsJJiV1l
   DAJhNT9sRQ7BJGn/GLJGvUoCYbEy4vl+fugbgEo2eDARiw8inlD/I52Ya
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316024905"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316024905"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741429966"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="741429966"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 22:34:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa9qu-0002i5-15;
	Thu, 09 Mar 2023 06:34:12 +0000
Date: Thu, 9 Mar 2023 14:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH V2 12/17] block: ublk_drv: cleanup ublk_copy_user_pages
Message-ID: <202303091446.8Qq0qZi9-lkp@intel.com>
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
In-Reply-To: <20230307141520.793891-13-ming.lei@redhat.com>
References: <20230307141520.793891-13-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring@vger.kernel.org
CC: linux-block@vger.kernel.org
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: ZiyangZhang <ZiyangZhang@linux.alibaba.com>
CC: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
CC: Bernd Schubert <bschubert@ddn.com>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc1 next-20230309]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-add-IO_URING_F_FUSED-and-prepare-for-supporting-OP_FUSED_CMD/20230307-222928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230307141520.793891-13-ming.lei%40redhat.com
patch subject: [PATCH V2 12/17] block: ublk_drv: cleanup ublk_copy_user_pages
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-c041-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091446.8Qq0qZi9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303091446.8Qq0qZi9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/ublk_drv.c:491:6-9: WARNING: Unsigned expression compared with zero: len     <=     0

vim +491 drivers/block/ublk_drv.c

71f28f3136aff5 Ming Lei 2022-07-13  469  
c375364124e3c6 Ming Lei 2023-03-07  470  /*
c375364124e3c6 Ming Lei 2023-03-07  471   * Copy data between request pages and io_iter, and 'offset'
c375364124e3c6 Ming Lei 2023-03-07  472   * is the start point of linear offset of request.
c375364124e3c6 Ming Lei 2023-03-07  473   */
c375364124e3c6 Ming Lei 2023-03-07  474  static size_t ublk_copy_user_pages(const struct request *req,
c375364124e3c6 Ming Lei 2023-03-07  475  		struct iov_iter *uiter, int dir)
71f28f3136aff5 Ming Lei 2022-07-13  476  {
71f28f3136aff5 Ming Lei 2022-07-13  477  	struct ublk_io_iter iter = {
c375364124e3c6 Ming Lei 2023-03-07  478  		.bio	= req->bio,
c375364124e3c6 Ming Lei 2023-03-07  479  		.iter	= req->bio->bi_iter,
71f28f3136aff5 Ming Lei 2022-07-13  480  	};
c375364124e3c6 Ming Lei 2023-03-07  481  	size_t done = 0;
c375364124e3c6 Ming Lei 2023-03-07  482  
c375364124e3c6 Ming Lei 2023-03-07  483  	while (iov_iter_count(uiter) && iter.bio) {
c375364124e3c6 Ming Lei 2023-03-07  484  		unsigned nr_pages;
c375364124e3c6 Ming Lei 2023-03-07  485  		size_t len, off;
c375364124e3c6 Ming Lei 2023-03-07  486  		int i;
c375364124e3c6 Ming Lei 2023-03-07  487  
c375364124e3c6 Ming Lei 2023-03-07  488  		len = iov_iter_get_pages2(uiter, iter.pages,
c375364124e3c6 Ming Lei 2023-03-07  489  				iov_iter_count(uiter),
c375364124e3c6 Ming Lei 2023-03-07  490  				UBLK_MAX_PIN_PAGES, &off);
c375364124e3c6 Ming Lei 2023-03-07 @491  		if (len <= 0)
c375364124e3c6 Ming Lei 2023-03-07  492  			return done;
c375364124e3c6 Ming Lei 2023-03-07  493  
c375364124e3c6 Ming Lei 2023-03-07  494  		ublk_copy_io_pages(&iter, len, off, dir);
c375364124e3c6 Ming Lei 2023-03-07  495  		nr_pages = DIV_ROUND_UP(len + off, PAGE_SIZE);
c375364124e3c6 Ming Lei 2023-03-07  496  		for (i = 0; i < nr_pages; i++) {
c375364124e3c6 Ming Lei 2023-03-07  497  			if (dir == ITER_DEST)
71f28f3136aff5 Ming Lei 2022-07-13  498  				set_page_dirty(iter.pages[i]);
71f28f3136aff5 Ming Lei 2022-07-13  499  			put_page(iter.pages[i]);
71f28f3136aff5 Ming Lei 2022-07-13  500  		}
c375364124e3c6 Ming Lei 2023-03-07  501  		done += len;
71f28f3136aff5 Ming Lei 2022-07-13  502  	}
71f28f3136aff5 Ming Lei 2022-07-13  503  
71f28f3136aff5 Ming Lei 2022-07-13  504  	return done;
71f28f3136aff5 Ming Lei 2022-07-13  505  }
71f28f3136aff5 Ming Lei 2022-07-13  506  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
