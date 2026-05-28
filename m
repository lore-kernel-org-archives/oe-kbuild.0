Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3993F9F2E
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990052; cv=none; b=QyK2hJKIXRN3z0sAzw3xPA049DUBT/Pu83pZ1RJCrU5D24mwDUp5J51Wp+GdD9NV9QtLjchXVaPi/8gqhSUCMUVqh1u45BDeHFsWxU1t1DISl1z2qmZdKnRnT+xz2Wvzm6+MA6g2JNVbup2ZMkKh9bzYWr1PAWlibzKkJ79Sr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990052; c=relaxed/simple;
	bh=KazeYklcqF2WY6HMUDkcb7JO435OLelVBIdVfdF9DjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhFpuF5NoEf9pY2OgUTG85aM8OhbDBRXa3eJQ9ZyUVS/hQlHp1zJOrdo4uKMHJJkKWhGUub1BlJ+1Z2q0DmYkkOO9QfxZ0NyJqITGz0LjmuqR25vvf5jKdLxG9cl03YPp1DD/1JbWEuN9Vqzb/RaVDJ4SOfSlh3EQ2+bT7yxGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/zU+s6S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/zU+s6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779990050; x=1811526050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KazeYklcqF2WY6HMUDkcb7JO435OLelVBIdVfdF9DjQ=;
  b=h/zU+s6Srp6PKWYAyZAp2PajEOFTEb29lB/UnM1UzOaE4U3L3Wu/J3Rl
   jE75hhyVe3wcnUUU6ySRJWs1xX6c3F7k3FttpH2N+20Yzb5pzI9GiQeuI
   i6IDK9BBqqeMXN4ODYwfYMhf1qWyEPbUWZ3LaY7lXgUs7pH+b2qpFFexv
   XZQoQn5bQaB9npQFlTThXUaS50wpMTw7iklE1OFPF8IIzTVO7ezZIYTaH
   0nq7fiFQXj6Z3d1G62DWpXZiF5IgZfF21gfGvnoFyNcY1pKAy7vIoQo1z
   IHUynZBfb/wGgra5cbP4kNrRD+YObDvPWiK7DzPdYHwiBJ8gwFm7YGI35
   g==;
X-CSE-ConnectionGUID: qoHTI8ZhQauH0wQmk+OizA==
X-CSE-MsgGUID: 4eb29jSlRA27rJsQlfRTdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80691684"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80691684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:40:49 -0700
X-CSE-ConnectionGUID: w6FOlpVhTOmkFxiEm/xILQ==
X-CSE-MsgGUID: iIvI+odIQJ6WNmgwUqH4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="242463380"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2026 10:40:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSeir-000000006FO-2aEw;
	Thu, 28 May 2026 17:40:45 +0000
Date: Fri, 29 May 2026 01:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH rdma-next v4] RDMA: Change capability fields in
 ib_device_attr from int to u32
Message-ID: <202605290151.HsFkD57P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260526194225.1338210-1-ernis@linux.microsoft.com>
References: <20260526194225.1338210-1-ernis@linux.microsoft.com>
TO: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
TO: Jason Gunthorpe <jgg@ziepe.ca>
TO: Leon Romanovsky <leon@kernel.org>
TO: linux-rdma@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Erni Sri Satya Vennela <ernis@linux.microsoft.com>

Hi Erni,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Erni-Sri-Satya-Vennela/RDMA-Change-capability-fields-in-ib_device_attr-from-int-to-u32/20260527-040218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20260526194225.1338210-1-ernis%40linux.microsoft.com
patch subject: [PATCH rdma-next v4] RDMA: Change capability fields in ib_device_attr from int to u32
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260529/202605290151.HsFkD57P-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290151.HsFkD57P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605290151.HsFkD57P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/ulp/srpt/ib_srpt.c:1888:29: error: call to '__compiletime_assert_1048' declared with 'error' attribute: min(sq_size / 2, attrs->max_qp_wr) signedness error
    1888 |         qp_init->cap.max_send_wr = min(sq_size / 2, attrs->max_qp_wr);
         |                                    ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:38:1: note: expanded from here
      38 | __compiletime_assert_1048
         | ^
   1 error generated.


vim +1888 drivers/infiniband/ulp/srpt/ib_srpt.c

a42d985bd5b234d Bart Van Assche   2011-10-14  1843  
a42d985bd5b234d Bart Van Assche   2011-10-14  1844  /**
10eac19bb272415 Bart Van Assche   2018-01-08  1845   * srpt_create_ch_ib - create receive and send completion queues
10eac19bb272415 Bart Van Assche   2018-01-08  1846   * @ch: SRPT RDMA channel.
a42d985bd5b234d Bart Van Assche   2011-10-14  1847   */
a42d985bd5b234d Bart Van Assche   2011-10-14  1848  static int srpt_create_ch_ib(struct srpt_rdma_ch *ch)
a42d985bd5b234d Bart Van Assche   2011-10-14  1849  {
a42d985bd5b234d Bart Van Assche   2011-10-14  1850  	struct ib_qp_init_attr *qp_init;
a42d985bd5b234d Bart Van Assche   2011-10-14  1851  	struct srpt_port *sport = ch->sport;
a42d985bd5b234d Bart Van Assche   2011-10-14  1852  	struct srpt_device *sdev = sport->sdev;
30c6d8773de0687 Bart Van Assche   2016-07-21  1853  	const struct ib_device_attr *attrs = &sdev->device->attrs;
ed262287e2b4692 Bart Van Assche   2018-01-08  1854  	int sq_size = sport->port_attrib.srp_sq_size;
dea262094cdf629 Bart Van Assche   2017-10-11  1855  	int i, ret;
a42d985bd5b234d Bart Van Assche   2011-10-14  1856  
a42d985bd5b234d Bart Van Assche   2011-10-14  1857  	WARN_ON(ch->rq_size < 1);
a42d985bd5b234d Bart Van Assche   2011-10-14  1858  
a42d985bd5b234d Bart Van Assche   2011-10-14  1859  	ret = -ENOMEM;
bf4afc53b77aeaa Linus Torvalds    2026-02-21  1860  	qp_init = kzalloc_obj(*qp_init);
a42d985bd5b234d Bart Van Assche   2011-10-14  1861  	if (!qp_init)
a42d985bd5b234d Bart Van Assche   2011-10-14  1862  		goto out;
a42d985bd5b234d Bart Van Assche   2011-10-14  1863  
ab477c1ff5e0a74 Bart Van Assche   2014-10-19  1864  retry:
c804af2c1d3152c Yamin Friedman    2020-07-22  1865  	ch->cq = ib_cq_pool_get(sdev->device, ch->rq_size + sq_size, -1,
20cf4e026730104 Chuck Lever       2019-07-29  1866  				 IB_POLL_WORKQUEUE);
a42d985bd5b234d Bart Van Assche   2011-10-14  1867  	if (IS_ERR(ch->cq)) {
a42d985bd5b234d Bart Van Assche   2011-10-14  1868  		ret = PTR_ERR(ch->cq);
4b6b6233f50f723 Leon Romanovsky   2025-09-18  1869  		pr_err("failed to create CQ cqe= %d ret= %pe\n",
4b6b6233f50f723 Leon Romanovsky   2025-09-18  1870  		       ch->rq_size + sq_size, ch->cq);
a42d985bd5b234d Bart Van Assche   2011-10-14  1871  		goto out;
a42d985bd5b234d Bart Van Assche   2011-10-14  1872  	}
c804af2c1d3152c Yamin Friedman    2020-07-22  1873  	ch->cq_size = ch->rq_size + sq_size;
a42d985bd5b234d Bart Van Assche   2011-10-14  1874  
a42d985bd5b234d Bart Van Assche   2011-10-14  1875  	qp_init->qp_context = (void *)ch;
eb5c7465c324015 Arnd Bergmann     2024-02-13  1876  	qp_init->event_handler = srpt_qp_event;
a42d985bd5b234d Bart Van Assche   2011-10-14  1877  	qp_init->send_cq = ch->cq;
a42d985bd5b234d Bart Van Assche   2011-10-14  1878  	qp_init->recv_cq = ch->cq;
a42d985bd5b234d Bart Van Assche   2011-10-14  1879  	qp_init->sq_sig_type = IB_SIGNAL_REQ_WR;
a42d985bd5b234d Bart Van Assche   2011-10-14  1880  	qp_init->qp_type = IB_QPT_RC;
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1881  	/*
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1882  	 * We divide up our send queue size into half SEND WRs to send the
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1883  	 * completions, and half R/W contexts to actually do the RDMA
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1884  	 * READ/WRITE transfers.  Note that we need to allocate CQ slots for
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1885  	 * both both, as RDMA contexts will also post completions for the
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1886  	 * RDMA READ case.
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1887  	 */
ed262287e2b4692 Bart Van Assche   2018-01-08 @1888  	qp_init->cap.max_send_wr = min(sq_size / 2, attrs->max_qp_wr);
ed262287e2b4692 Bart Van Assche   2018-01-08  1889  	qp_init->cap.max_rdma_ctxs = sq_size / 2;
e0cca8b456e2319 Bart Van Assche   2020-05-25  1890  	qp_init->cap.max_send_sge = attrs->max_send_sge;
66ced2eb2ab95f6 Bart Van Assche   2020-05-25  1891  	qp_init->cap.max_recv_sge = 1;
b99f8e4d7bcd3bf Christoph Hellwig 2016-05-03  1892  	qp_init->port_num = ch->sport->port;
66ced2eb2ab95f6 Bart Van Assche   2020-05-25  1893  	if (sdev->use_srq)
dea262094cdf629 Bart Van Assche   2017-10-11  1894  		qp_init->srq = sdev->srq;
66ced2eb2ab95f6 Bart Van Assche   2020-05-25  1895  	else
dea262094cdf629 Bart Van Assche   2017-10-11  1896  		qp_init->cap.max_recv_wr = ch->rq_size;
a42d985bd5b234d Bart Van Assche   2011-10-14  1897  
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1898  	if (ch->using_rdma_cm) {
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1899  		ret = rdma_create_qp(ch->rdma_cm.cm_id, sdev->pd, qp_init);
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1900  		ch->qp = ch->rdma_cm.cm_id->qp;
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1901  	} else {
a42d985bd5b234d Bart Van Assche   2011-10-14  1902  		ch->qp = ib_create_qp(sdev->pd, qp_init);
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1903  		if (!IS_ERR(ch->qp)) {
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1904  			ret = srpt_init_ch_qp(ch, ch->qp);
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1905  			if (ret)
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1906  				ib_destroy_qp(ch->qp);
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1907  		} else {
a42d985bd5b234d Bart Van Assche   2011-10-14  1908  			ret = PTR_ERR(ch->qp);
ab477c1ff5e0a74 Bart Van Assche   2014-10-19  1909  		}
ab477c1ff5e0a74 Bart Van Assche   2014-10-19  1910  	}
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1911  	if (ret) {
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1912  		bool retry = sq_size > MIN_SRPT_SQ_SIZE;
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1913  
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1914  		if (retry) {
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1915  			pr_debug("failed to create queue pair with sq_size = %d (%d) - retrying\n",
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1916  				 sq_size, ret);
c804af2c1d3152c Yamin Friedman    2020-07-22  1917  			ib_cq_pool_put(ch->cq, ch->cq_size);
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1918  			sq_size = max(sq_size / 2, MIN_SRPT_SQ_SIZE);
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1919  			goto retry;
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1920  		} else {
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1921  			pr_err("failed to create queue pair with sq_size = %d (%d)\n",
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1922  			       sq_size, ret);
a42d985bd5b234d Bart Van Assche   2011-10-14  1923  			goto err_destroy_cq;
a42d985bd5b234d Bart Van Assche   2011-10-14  1924  		}
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1925  	}
a42d985bd5b234d Bart Van Assche   2011-10-14  1926  
a42d985bd5b234d Bart Van Assche   2011-10-14  1927  	atomic_set(&ch->sq_wr_avail, qp_init->cap.max_send_wr);
a42d985bd5b234d Bart Van Assche   2011-10-14  1928  
090fa24bf239ce1 Bart Van Assche   2018-01-16  1929  	pr_debug("%s: max_cqe= %d max_sge= %d sq_size = %d ch= %p\n",
a42d985bd5b234d Bart Van Assche   2011-10-14  1930  		 __func__, ch->cq->cqe, qp_init->cap.max_send_sge,
090fa24bf239ce1 Bart Van Assche   2018-01-16  1931  		 qp_init->cap.max_send_wr, ch);
a42d985bd5b234d Bart Van Assche   2011-10-14  1932  
321e329b9c0b332 Mike Marciniszyn  2017-11-03  1933  	if (!sdev->use_srq)
321e329b9c0b332 Mike Marciniszyn  2017-11-03  1934  		for (i = 0; i < ch->rq_size; i++)
321e329b9c0b332 Mike Marciniszyn  2017-11-03  1935  			srpt_post_recv(sdev, ch, ch->ioctx_recv_ring[i]);
321e329b9c0b332 Mike Marciniszyn  2017-11-03  1936  
a42d985bd5b234d Bart Van Assche   2011-10-14  1937  out:
a42d985bd5b234d Bart Van Assche   2011-10-14  1938  	kfree(qp_init);
a42d985bd5b234d Bart Van Assche   2011-10-14  1939  	return ret;
a42d985bd5b234d Bart Van Assche   2011-10-14  1940  
a42d985bd5b234d Bart Van Assche   2011-10-14  1941  err_destroy_cq:
63cf1a902c9dd6b Bart Van Assche   2018-03-02  1942  	ch->qp = NULL;
c804af2c1d3152c Yamin Friedman    2020-07-22  1943  	ib_cq_pool_put(ch->cq, ch->cq_size);
a42d985bd5b234d Bart Van Assche   2011-10-14  1944  	goto out;
a42d985bd5b234d Bart Van Assche   2011-10-14  1945  }
a42d985bd5b234d Bart Van Assche   2011-10-14  1946  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
