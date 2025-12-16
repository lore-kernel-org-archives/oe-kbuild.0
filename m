Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3104A1D5170
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844216; cv=none; b=FPAUEUfjM2tCG1T/7hsy8WqnnY85plrnjxwuwp/mq7TExMy7ogdk6XSQgz+OPDR4x+Wd9Yy69lC+gosznvzOvRsNDGQOYrLB06nnyFGOiT+LVkHAgjtZpFYXVNczjrwjP1+bqJeRZG2RnVymRNOJ/JE1h8XaoQ47EYDAEoy3iYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844216; c=relaxed/simple;
	bh=UWaQ1yNGinbCmhp3tgo131ul/gNp4KDfhjV5PcIIv78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ss4rMDo0yEl68U0HB07DAc6z7K4tUjEac6uaLGJyWBwBPdjxhuDE5umGvU6dEJyfa5dbQ39pjPVeIA1GOWQiKdL2Dmc2esxUMTV/08HbPEn46Ff6nEAIVxLxFjlpxuoaeo6724jfLGL2A7WyVCHnIiS+UMy+COZQfe6DyKfd1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPQnZ5qm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPQnZ5qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765844214; x=1797380214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWaQ1yNGinbCmhp3tgo131ul/gNp4KDfhjV5PcIIv78=;
  b=iPQnZ5qmfO6SEWXegjTsvfr2ukFt1UWKVZG+j/Mkf1HMHTJEEm7hWClX
   tRplcz7AP3aEA6OZAL4o8ovCZ4OuMFH1v1zX/UDoly6XTSmUOhw27vbV4
   4eFB4MRL/ri/68HC1asCN2CKRMbb6hm4YBywqDLvADQtLCoLJ2qetX9jk
   pbTL3lwhgad7btlUfqrNIxhGX4OuLjC+NKwj7ZNHLaV4xg2XVToNoGwNm
   VIyAEBZ+hZVThrwgyLXheyXmmAWGDjIHJrjFQZ6TceXZ8y43+4LRWCAo9
   1IcWc6VONsBqH2P8gnjTxyuaaClZbmWRlrO8+n6l+EUwXu6sLZsFt4UWJ
   w==;
X-CSE-ConnectionGUID: w8re7Q+UTj6wEg5ZR5gQEQ==
X-CSE-MsgGUID: jIi3RrqZQ9OhbS8IuYPshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78067067"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78067067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 16:16:54 -0800
X-CSE-ConnectionGUID: ZGhQl9TAR0mpWyDtoHMiMg==
X-CSE-MsgGUID: +2QfDDYPR5WQdiAiSvxTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197857349"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 16:16:53 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVIkE-000000000xi-0A6z;
	Tue, 16 Dec 2025 00:16:50 +0000
Date: Tue, 16 Dec 2025 08:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/core/uverbs_std_types_cq.c:195
 ib_uverbs_handler_UVERBS_METHOD_CQ_CREATE() error: we previously assumed
 'ib_dev->ops.create_cq' could be null (see line 81)
Message-ID: <202512160829.r81Wp8D1-lkp@intel.com>
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
TO: Michael Margolin <mrgolin@amazon.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 1a40c362ae265ca4004f7373b34c22af6810f6cb RDMA/uverbs: Add a common way to create CQ with umem
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251216/202512160829.r81Wp8D1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160829.r81Wp8D1-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/uverbs_std_types_cq.c:195 ib_uverbs_handler_UVERBS_METHOD_CQ_CREATE() error: we previously assumed 'ib_dev->ops.create_cq' could be null (see line 81)

vim +195 drivers/infiniband/core/uverbs_std_types_cq.c

41b2a71fc848e2 Matan Barak      2018-03-19   60  
e83f0ecdc40f2c Jason Gunthorpe  2018-07-25   61  static int UVERBS_HANDLER(UVERBS_METHOD_CQ_CREATE)(
15a1b4becba886 Jason Gunthorpe  2018-11-25   62  	struct uverbs_attr_bundle *attrs)
41b2a71fc848e2 Matan Barak      2018-03-19   63  {
e83f0ecdc40f2c Jason Gunthorpe  2018-07-25   64  	struct ib_ucq_object *obj = container_of(
e83f0ecdc40f2c Jason Gunthorpe  2018-07-25   65  		uverbs_attr_get_uobject(attrs, UVERBS_ATTR_CREATE_CQ_HANDLE),
4ec1dcfcdf3756 Jason Gunthorpe  2020-01-08   66  		typeof(*obj), uevent.uobject);
1a40c362ae265c Michael Margolin 2025-07-08   67  	struct ib_uverbs_completion_event_file *ev_file = NULL;
feec576a6af299 Jason Gunthorpe  2019-04-01   68  	struct ib_device *ib_dev = attrs->context->device;
1a40c362ae265c Michael Margolin 2025-07-08   69  	struct ib_umem_dmabuf *umem_dmabuf;
41b2a71fc848e2 Matan Barak      2018-03-19   70  	struct ib_cq_init_attr attr = {};
41b2a71fc848e2 Matan Barak      2018-03-19   71  	struct ib_uobject *ev_file_uobj;
1a40c362ae265c Michael Margolin 2025-07-08   72  	struct ib_umem *umem = NULL;
1a40c362ae265c Michael Margolin 2025-07-08   73  	u64 buffer_length;
1a40c362ae265c Michael Margolin 2025-07-08   74  	u64 buffer_offset;
1a40c362ae265c Michael Margolin 2025-07-08   75  	struct ib_cq *cq;
1a40c362ae265c Michael Margolin 2025-07-08   76  	u64 user_handle;
1a40c362ae265c Michael Margolin 2025-07-08   77  	u64 buffer_va;
1a40c362ae265c Michael Margolin 2025-07-08   78  	int buffer_fd;
1a40c362ae265c Michael Margolin 2025-07-08   79  	int ret;
41b2a71fc848e2 Matan Barak      2018-03-19   80  
1a40c362ae265c Michael Margolin 2025-07-08  @81  	if ((!ib_dev->ops.create_cq && !ib_dev->ops.create_cq_umem) || !ib_dev->ops.destroy_cq)
41b2a71fc848e2 Matan Barak      2018-03-19   82  		return -EOPNOTSUPP;
41b2a71fc848e2 Matan Barak      2018-03-19   83  
41b2a71fc848e2 Matan Barak      2018-03-19   84  	ret = uverbs_copy_from(&attr.comp_vector, attrs,
41b2a71fc848e2 Matan Barak      2018-03-19   85  			       UVERBS_ATTR_CREATE_CQ_COMP_VECTOR);
41b2a71fc848e2 Matan Barak      2018-03-19   86  	if (!ret)
41b2a71fc848e2 Matan Barak      2018-03-19   87  		ret = uverbs_copy_from(&attr.cqe, attrs,
41b2a71fc848e2 Matan Barak      2018-03-19   88  				       UVERBS_ATTR_CREATE_CQ_CQE);
41b2a71fc848e2 Matan Barak      2018-03-19   89  	if (!ret)
41b2a71fc848e2 Matan Barak      2018-03-19   90  		ret = uverbs_copy_from(&user_handle, attrs,
41b2a71fc848e2 Matan Barak      2018-03-19   91  				       UVERBS_ATTR_CREATE_CQ_USER_HANDLE);
41b2a71fc848e2 Matan Barak      2018-03-19   92  	if (ret)
41b2a71fc848e2 Matan Barak      2018-03-19   93  		return ret;
41b2a71fc848e2 Matan Barak      2018-03-19   94  
bccd06223f2165 Jason Gunthorpe  2018-07-26   95  	ret = uverbs_get_flags32(&attr.flags, attrs,
bccd06223f2165 Jason Gunthorpe  2018-07-26   96  				 UVERBS_ATTR_CREATE_CQ_FLAGS,
bccd06223f2165 Jason Gunthorpe  2018-07-26   97  				 IB_UVERBS_CQ_FLAGS_TIMESTAMP_COMPLETION |
bccd06223f2165 Jason Gunthorpe  2018-07-26   98  					 IB_UVERBS_CQ_FLAGS_IGNORE_OVERRUN);
bccd06223f2165 Jason Gunthorpe  2018-07-26   99  	if (ret)
bccd06223f2165 Jason Gunthorpe  2018-07-26  100  		return ret;
41b2a71fc848e2 Matan Barak      2018-03-19  101  
3efa38125b81fb Matan Barak      2018-05-31  102  	ev_file_uobj = uverbs_attr_get_uobject(attrs, UVERBS_ATTR_CREATE_CQ_COMP_CHANNEL);
3efa38125b81fb Matan Barak      2018-05-31  103  	if (!IS_ERR(ev_file_uobj)) {
41b2a71fc848e2 Matan Barak      2018-03-19  104  		ev_file = container_of(ev_file_uobj,
41b2a71fc848e2 Matan Barak      2018-03-19  105  				       struct ib_uverbs_completion_event_file,
d0259e82e7d214 Jason Gunthorpe  2018-07-04  106  				       uobj);
41b2a71fc848e2 Matan Barak      2018-03-19  107  		uverbs_uobject_get(ev_file_uobj);
41b2a71fc848e2 Matan Barak      2018-03-19  108  	}
41b2a71fc848e2 Matan Barak      2018-03-19  109  
cda9ee494248b8 Yishai Hadas     2020-05-19  110  	obj->uevent.event_file = ib_uverbs_get_async_event(
cda9ee494248b8 Yishai Hadas     2020-05-19  111  		attrs, UVERBS_ATTR_CREATE_CQ_EVENT_FD);
98a8890f734894 Yishai Hadas     2020-05-19  112  
15a1b4becba886 Jason Gunthorpe  2018-11-25  113  	if (attr.comp_vector >= attrs->ufile->device->num_comp_vectors) {
41b2a71fc848e2 Matan Barak      2018-03-19  114  		ret = -EINVAL;
41b2a71fc848e2 Matan Barak      2018-03-19  115  		goto err_event_file;
41b2a71fc848e2 Matan Barak      2018-03-19  116  	}
41b2a71fc848e2 Matan Barak      2018-03-19  117  
41b2a71fc848e2 Matan Barak      2018-03-19  118  	INIT_LIST_HEAD(&obj->comp_list);
4ec1dcfcdf3756 Jason Gunthorpe  2020-01-08  119  	INIT_LIST_HEAD(&obj->uevent.event_list);
41b2a71fc848e2 Matan Barak      2018-03-19  120  
1a40c362ae265c Michael Margolin 2025-07-08  121  	if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_VA)) {
1a40c362ae265c Michael Margolin 2025-07-08  122  
1a40c362ae265c Michael Margolin 2025-07-08  123  		ret = uverbs_copy_from(&buffer_va, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_VA);
1a40c362ae265c Michael Margolin 2025-07-08  124  		if (ret)
1a40c362ae265c Michael Margolin 2025-07-08  125  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  126  
1a40c362ae265c Michael Margolin 2025-07-08  127  		ret = uverbs_copy_from(&buffer_length, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_LENGTH);
1a40c362ae265c Michael Margolin 2025-07-08  128  		if (ret)
1a40c362ae265c Michael Margolin 2025-07-08  129  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  130  
1a40c362ae265c Michael Margolin 2025-07-08  131  		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_FD) ||
1a40c362ae265c Michael Margolin 2025-07-08  132  		    uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_OFFSET) ||
1a40c362ae265c Michael Margolin 2025-07-08  133  		    !ib_dev->ops.create_cq_umem) {
1a40c362ae265c Michael Margolin 2025-07-08  134  			ret = -EINVAL;
1a40c362ae265c Michael Margolin 2025-07-08  135  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  136  		}
1a40c362ae265c Michael Margolin 2025-07-08  137  
1a40c362ae265c Michael Margolin 2025-07-08  138  		umem = ib_umem_get(ib_dev, buffer_va, buffer_length, IB_ACCESS_LOCAL_WRITE);
1a40c362ae265c Michael Margolin 2025-07-08  139  		if (IS_ERR(umem)) {
1a40c362ae265c Michael Margolin 2025-07-08  140  			ret = PTR_ERR(umem);
1a40c362ae265c Michael Margolin 2025-07-08  141  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  142  		}
1a40c362ae265c Michael Margolin 2025-07-08  143  	} else if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_FD)) {
1a40c362ae265c Michael Margolin 2025-07-08  144  
1a40c362ae265c Michael Margolin 2025-07-08  145  		ret = uverbs_get_raw_fd(&buffer_fd, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_FD);
1a40c362ae265c Michael Margolin 2025-07-08  146  		if (ret)
1a40c362ae265c Michael Margolin 2025-07-08  147  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  148  
1a40c362ae265c Michael Margolin 2025-07-08  149  		ret = uverbs_copy_from(&buffer_offset, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_OFFSET);
1a40c362ae265c Michael Margolin 2025-07-08  150  		if (ret)
1a40c362ae265c Michael Margolin 2025-07-08  151  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  152  
1a40c362ae265c Michael Margolin 2025-07-08  153  		ret = uverbs_copy_from(&buffer_length, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_LENGTH);
1a40c362ae265c Michael Margolin 2025-07-08  154  		if (ret)
1a40c362ae265c Michael Margolin 2025-07-08  155  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  156  
1a40c362ae265c Michael Margolin 2025-07-08  157  		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_VA) ||
1a40c362ae265c Michael Margolin 2025-07-08  158  		    !ib_dev->ops.create_cq_umem) {
1a40c362ae265c Michael Margolin 2025-07-08  159  			ret = -EINVAL;
1a40c362ae265c Michael Margolin 2025-07-08  160  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  161  		}
1a40c362ae265c Michael Margolin 2025-07-08  162  
1a40c362ae265c Michael Margolin 2025-07-08  163  		umem_dmabuf = ib_umem_dmabuf_get_pinned(ib_dev, buffer_offset, buffer_length,
1a40c362ae265c Michael Margolin 2025-07-08  164  							buffer_fd, IB_ACCESS_LOCAL_WRITE);
1a40c362ae265c Michael Margolin 2025-07-08  165  		if (IS_ERR(umem_dmabuf)) {
1a40c362ae265c Michael Margolin 2025-07-08  166  			ret = PTR_ERR(umem_dmabuf);
1a40c362ae265c Michael Margolin 2025-07-08  167  			goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  168  		}
1a40c362ae265c Michael Margolin 2025-07-08  169  		umem = &umem_dmabuf->umem;
1a40c362ae265c Michael Margolin 2025-07-08  170  	} else if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_OFFSET) ||
1a40c362ae265c Michael Margolin 2025-07-08  171  		   uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_LENGTH) ||
1a40c362ae265c Michael Margolin 2025-07-08  172  		   !ib_dev->ops.create_cq) {
1a40c362ae265c Michael Margolin 2025-07-08  173  		ret = -EINVAL;
1a40c362ae265c Michael Margolin 2025-07-08  174  		goto err_event_file;
1a40c362ae265c Michael Margolin 2025-07-08  175  	}
1a40c362ae265c Michael Margolin 2025-07-08  176  
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  177  	cq = rdma_zalloc_drv_obj(ib_dev, ib_cq);
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  178  	if (!cq) {
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  179  		ret = -ENOMEM;
1a40c362ae265c Michael Margolin 2025-07-08  180  		ib_umem_release(umem);
41b2a71fc848e2 Matan Barak      2018-03-19  181  		goto err_event_file;
41b2a71fc848e2 Matan Barak      2018-03-19  182  	}
41b2a71fc848e2 Matan Barak      2018-03-19  183  
41b2a71fc848e2 Matan Barak      2018-03-19  184  	cq->device        = ib_dev;
5bd48c18c8cea0 Jason Gunthorpe  2020-01-08  185  	cq->uobject       = obj;
41b2a71fc848e2 Matan Barak      2018-03-19  186  	cq->comp_handler  = ib_uverbs_comp_handler;
41b2a71fc848e2 Matan Barak      2018-03-19  187  	cq->event_handler = ib_uverbs_cq_event_handler;
41b2a71fc848e2 Matan Barak      2018-03-19  188  	cq->cq_context    = ev_file ? &ev_file->ev_queue : NULL;
41b2a71fc848e2 Matan Barak      2018-03-19  189  	atomic_set(&cq->usecnt, 0);
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  190  
13ef5539def732 Leon Romanovsky  2020-09-22  191  	rdma_restrack_new(&cq->res, RDMA_RESTRACK_CQ);
b09c4d70122091 Leon Romanovsky  2020-09-22  192  	rdma_restrack_set_name(&cq->res, NULL);
b09c4d70122091 Leon Romanovsky  2020-09-22  193  
1a40c362ae265c Michael Margolin 2025-07-08  194  	ret = umem ? ib_dev->ops.create_cq_umem(cq, &attr, umem, attrs) :
1a40c362ae265c Michael Margolin 2025-07-08 @195  		ib_dev->ops.create_cq(cq, &attr, attrs);
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  196  	if (ret)
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  197  		goto err_free;
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  198  
4ec1dcfcdf3756 Jason Gunthorpe  2020-01-08  199  	obj->uevent.uobject.object = cq;
4ec1dcfcdf3756 Jason Gunthorpe  2020-01-08  200  	obj->uevent.uobject.user_handle = user_handle;
b09c4d70122091 Leon Romanovsky  2020-09-22  201  	rdma_restrack_add(&cq->res);
0ac8903cbbe618 Jason Gunthorpe  2020-05-19  202  	uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_CREATE_CQ_HANDLE);
41b2a71fc848e2 Matan Barak      2018-03-19  203  
41b2a71fc848e2 Matan Barak      2018-03-19  204  	ret = uverbs_copy_to(attrs, UVERBS_ATTR_CREATE_CQ_RESP_CQE, &cq->cqe,
41b2a71fc848e2 Matan Barak      2018-03-19  205  			     sizeof(cq->cqe));
0ac8903cbbe618 Jason Gunthorpe  2020-05-19  206  	return ret;
41b2a71fc848e2 Matan Barak      2018-03-19  207  
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  208  err_free:
13ef5539def732 Leon Romanovsky  2020-09-22  209  	rdma_restrack_put(&cq->res);
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  210  	kfree(cq);
41b2a71fc848e2 Matan Barak      2018-03-19  211  err_event_file:
98a8890f734894 Yishai Hadas     2020-05-19  212  	if (obj->uevent.event_file)
98a8890f734894 Yishai Hadas     2020-05-19  213  		uverbs_uobject_put(&obj->uevent.event_file->uobj);
41b2a71fc848e2 Matan Barak      2018-03-19  214  	if (ev_file)
41b2a71fc848e2 Matan Barak      2018-03-19  215  		uverbs_uobject_put(ev_file_uobj);
41b2a71fc848e2 Matan Barak      2018-03-19  216  	return ret;
41b2a71fc848e2 Matan Barak      2018-03-19  217  };
41b2a71fc848e2 Matan Barak      2018-03-19  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
