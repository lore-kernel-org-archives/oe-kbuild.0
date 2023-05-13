Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2682261D
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684012046; x=1715548046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KI/es0KvCfwdwCdERxVf+lC6TwMd2x/mUlENTiq68Es=;
  b=kGiNOYm1XSOTKCkliHzb5VyC0OYtavbAWKYbOB5kJcdHccNi2FFy4h22
   2kqoeNekhxgnVk+Mpv4My60GWl6DeswkrEZ9MQHVEerhbksFTBNwEJOs3
   jQyDPfwFtgY+ODbxNdiXKTch6aWavyXjhljQUKn3IAnlZULjPJkuyqCqD
   jSG/TdUq2fxWbTzaUduIYvU3dzPYjTQpfxDQ3n6Vwq/AfJcaQER682vfZ
   867rcPOXvGnXpCG6P7wxZ6k9eUEORUPWx1anzwMSJ/TFDnCaDaB9/Bnto
   oT4fmigdVg1iFllPp8CK3hwXe/OxsRZkDNhfX5jgyqemVTUVFwjCAxS5q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="349829897"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="349829897"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 14:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="731186578"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="731186578"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 May 2023 14:07:16 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxwSS-0005gC-0Z;
	Sat, 13 May 2023 21:07:16 +0000
Date: Sun, 14 May 2023 05:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:io_uring-ring-alloc 4/4] io_uring/io_uring.c:2743
 __io_uaddr_map() warn: ambiguous units merge 'nr_pages' 'page' or
 'array_size'
Message-ID: <202305140542.F8spjpxo-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-alloc
head:   9a0ed62063789a5109bfbcd8cfd7a82bbd7c4ee7
commit: 9a0ed62063789a5109bfbcd8cfd7a82bbd7c4ee7 [4/4] io_uring: support for user allocated memory for rings/sqes
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230514/202305140542.F8spjpxo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305140542.F8spjpxo-lkp@intel.com/

smatch warnings:
io_uring/io_uring.c:2743 __io_uaddr_map() warn: ambiguous units merge 'nr_pages' 'page' or 'array_size'
io_uring/io_uring.c:2743 __io_uaddr_map() warn: ambiguous units merge 'nr_pages' 'array_size' or 'page'

vim +2743 io_uring/io_uring.c

9a0ed62063789a Jens Axboe 2021-11-05  2725  
9a0ed62063789a Jens Axboe 2021-11-05  2726  static void *__io_uaddr_map(struct page ***pages, unsigned short *npages,
9a0ed62063789a Jens Axboe 2021-11-05  2727  			    unsigned long uaddr, size_t size)
9a0ed62063789a Jens Axboe 2021-11-05  2728  {
9a0ed62063789a Jens Axboe 2021-11-05  2729  	struct page **page_array;
9a0ed62063789a Jens Axboe 2021-11-05  2730  	unsigned int nr_pages;
9a0ed62063789a Jens Axboe 2021-11-05  2731  	int ret;
9a0ed62063789a Jens Axboe 2021-11-05  2732  
9a0ed62063789a Jens Axboe 2021-11-05  2733  	*npages = 0;
9a0ed62063789a Jens Axboe 2021-11-05  2734  
9a0ed62063789a Jens Axboe 2021-11-05  2735  	if (uaddr & (PAGE_SIZE - 1) || !size)
9a0ed62063789a Jens Axboe 2021-11-05  2736  		return ERR_PTR(-EINVAL);
9a0ed62063789a Jens Axboe 2021-11-05  2737  
9a0ed62063789a Jens Axboe 2021-11-05  2738  	nr_pages = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
9a0ed62063789a Jens Axboe 2021-11-05  2739  	if (nr_pages > USHRT_MAX)
9a0ed62063789a Jens Axboe 2021-11-05  2740  		return ERR_PTR(-EINVAL);
9a0ed62063789a Jens Axboe 2021-11-05  2741  	page_array = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL);
9a0ed62063789a Jens Axboe 2021-11-05  2742  	if (!page_array)
9a0ed62063789a Jens Axboe 2021-11-05 @2743  		return ERR_PTR(-ENOMEM);
9a0ed62063789a Jens Axboe 2021-11-05  2744  
9a0ed62063789a Jens Axboe 2021-11-05  2745  	ret = pin_user_pages_fast(uaddr, nr_pages, FOLL_WRITE | FOLL_LONGTERM,
9a0ed62063789a Jens Axboe 2021-11-05  2746  					page_array);
9a0ed62063789a Jens Axboe 2021-11-05  2747  	if (ret != nr_pages) {
9a0ed62063789a Jens Axboe 2021-11-05  2748  err:
9a0ed62063789a Jens Axboe 2021-11-05  2749  		io_pages_free(&page_array, ret > 0 ? ret : 0);
9a0ed62063789a Jens Axboe 2021-11-05  2750  		return ret < 0 ? ERR_PTR(ret) : ERR_PTR(-EFAULT);
9a0ed62063789a Jens Axboe 2021-11-05  2751  	}
9a0ed62063789a Jens Axboe 2021-11-05  2752  	/*
9a0ed62063789a Jens Axboe 2021-11-05  2753  	 * Should be a single page. If the ring is small enough that we can
9a0ed62063789a Jens Axboe 2021-11-05  2754  	 * use a normal page, that is fine. If we need multiple pages, then
9a0ed62063789a Jens Axboe 2021-11-05  2755  	 * userspace should use a huge page. That's the only way to guarantee
9a0ed62063789a Jens Axboe 2021-11-05  2756  	 * that we get contigious memory, outside of just being lucky or
9a0ed62063789a Jens Axboe 2021-11-05  2757  	 * (currently) having low memory fragmentation.
9a0ed62063789a Jens Axboe 2021-11-05  2758  	 */
9a0ed62063789a Jens Axboe 2021-11-05  2759  	if (page_array[0] != page_array[ret - 1])
9a0ed62063789a Jens Axboe 2021-11-05  2760  		goto err;
9a0ed62063789a Jens Axboe 2021-11-05  2761  	*pages = page_array;
9a0ed62063789a Jens Axboe 2021-11-05  2762  	*npages = nr_pages;
9a0ed62063789a Jens Axboe 2021-11-05  2763  	return page_to_virt(page_array[0]);
9a0ed62063789a Jens Axboe 2021-11-05  2764  }
9a0ed62063789a Jens Axboe 2021-11-05  2765  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
