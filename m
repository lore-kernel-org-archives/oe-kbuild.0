Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9625A354
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Jul 2025 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151930; cv=none; b=NkIP+WpQgBtfXIMni6lcBX7r310giP8RLZhubf53iHGz1Uk/rSvGpIENE0xyv2QNa7e6+dHtWqG/yYLUmSZZD4DZeXKI7+qMvQRfoA9DvW9+eBELPw2xTCKVKUgsp7ao6c8o4KdqVA5cpQ8+5vX1+4sg8IHDprBqTAur73VxUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151930; c=relaxed/simple;
	bh=hJI6Y1ISmjEvsKF4M5oiBZUc3OElPeNizWb31zXpyfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6ajUg4Tj99z145U88Mh+HGyFIemWHJl8JDyiVqWsUAvibAFqwxTlnYigOSq5XpD4jo6z9WBQLQHQkSFOCqb+9nIAI8NcrUlQoCjgCYE845jyxIC3Sk3t2hXQ9tqTHOuG6/kmNLdB4tY1KLMvirOBWwcrWXiIaE/cwonTQ2p/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoDDmfM9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoDDmfM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752151928; x=1783687928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJI6Y1ISmjEvsKF4M5oiBZUc3OElPeNizWb31zXpyfs=;
  b=UoDDmfM9lC53SfJwGGh6eF6YO9RBf4sRXnnybbSp1DAnOl5oa7NG5i03
   JIMNNlCX+wT+dWB1rikbCfNtTJ7IB4C56GHeVZoPrNQK8MZd+B3Bm/C/2
   05U0mkcGxGS48U+18/BBL5zKo9/QZlDMsycXNJgKtDrHSqX1HVzPrSFZE
   sSWfJyith0jH2KZlAL0bhHMNIAmUhhjpFYgPRJc7GuaCFCJ6Kox0xARkY
   75D2p0v5ZOwtGYsfDE75HoU1dPKDQqW9IzxNKNHFn9oSqdr9LNEdM8FoU
   yjrK+6/Tmx1U4suenUFOMywWiCzVR2weDcB10femAl24t8QuYqIOKcD/k
   Q==;
X-CSE-ConnectionGUID: WMzvlwWuQACnm6QeiGiydg==
X-CSE-MsgGUID: eFVXLTkHSqmdHoqMIycL9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54306516"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54306516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 05:52:08 -0700
X-CSE-ConnectionGUID: J4dWWXzYSbuLFrgTL0P8ZQ==
X-CSE-MsgGUID: Oi7RA6HCTTiN1pN8S9yxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156552233"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jul 2025 05:52:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZqks-00052N-2z;
	Thu, 10 Jul 2025 12:52:02 +0000
Date: Thu, 10 Jul 2025 20:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH for-next v2 1/3] RDMA/uverbs: Add a common way to create
 CQ with umem
Message-ID: <202507102045.cmQITbYo-lkp@intel.com>
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
In-Reply-To: <20250708202308.24783-2-mrgolin@amazon.com>
References: <20250708202308.24783-2-mrgolin@amazon.com>
TO: Michael Margolin <mrgolin@amazon.com>
TO: jgg@nvidia.com
TO: leon@kernel.org
TO: linux-rdma@vger.kernel.org
CC: sleybo@amazon.com
CC: matua@amazon.com
CC: gal.pressman@linux.dev

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Margolin/RDMA-uverbs-Add-a-common-way-to-create-CQ-with-umem/20250709-042457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20250708202308.24783-2-mrgolin%40amazon.com
patch subject: [PATCH for-next v2 1/3] RDMA/uverbs: Add a common way to create CQ with umem
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250710 (https://download.01.org/0day-ci/archive/20250710/202507102045.cmQITbYo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507102045.cmQITbYo-lkp@intel.com/

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
982a89ae42c92d Michael Margolin 2025-07-08   67  	struct ib_uverbs_completion_event_file *ev_file = NULL;
feec576a6af299 Jason Gunthorpe  2019-04-01   68  	struct ib_device *ib_dev = attrs->context->device;
982a89ae42c92d Michael Margolin 2025-07-08   69  	struct ib_umem_dmabuf *umem_dmabuf;
41b2a71fc848e2 Matan Barak      2018-03-19   70  	struct ib_cq_init_attr attr = {};
41b2a71fc848e2 Matan Barak      2018-03-19   71  	struct ib_uobject *ev_file_uobj;
982a89ae42c92d Michael Margolin 2025-07-08   72  	struct ib_umem *umem = NULL;
982a89ae42c92d Michael Margolin 2025-07-08   73  	u64 buffer_length;
982a89ae42c92d Michael Margolin 2025-07-08   74  	u64 buffer_offset;
982a89ae42c92d Michael Margolin 2025-07-08   75  	struct ib_cq *cq;
982a89ae42c92d Michael Margolin 2025-07-08   76  	u64 user_handle;
982a89ae42c92d Michael Margolin 2025-07-08   77  	u64 buffer_va;
982a89ae42c92d Michael Margolin 2025-07-08   78  	int buffer_fd;
982a89ae42c92d Michael Margolin 2025-07-08   79  	int ret;
41b2a71fc848e2 Matan Barak      2018-03-19   80  
982a89ae42c92d Michael Margolin 2025-07-08  @81  	if ((!ib_dev->ops.create_cq && !ib_dev->ops.create_cq_umem) || !ib_dev->ops.destroy_cq)
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
982a89ae42c92d Michael Margolin 2025-07-08  121  	if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_VA)) {
982a89ae42c92d Michael Margolin 2025-07-08  122  
982a89ae42c92d Michael Margolin 2025-07-08  123  		ret = uverbs_copy_from(&buffer_va, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_VA);
982a89ae42c92d Michael Margolin 2025-07-08  124  		if (ret)
982a89ae42c92d Michael Margolin 2025-07-08  125  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  126  
982a89ae42c92d Michael Margolin 2025-07-08  127  		ret = uverbs_copy_from(&buffer_length, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_LENGTH);
982a89ae42c92d Michael Margolin 2025-07-08  128  		if (ret)
982a89ae42c92d Michael Margolin 2025-07-08  129  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  130  
982a89ae42c92d Michael Margolin 2025-07-08  131  		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_FD) ||
982a89ae42c92d Michael Margolin 2025-07-08  132  		    uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_OFFSET) ||
982a89ae42c92d Michael Margolin 2025-07-08  133  		    !ib_dev->ops.create_cq_umem) {
982a89ae42c92d Michael Margolin 2025-07-08  134  			ret = -EINVAL;
982a89ae42c92d Michael Margolin 2025-07-08  135  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  136  		}
982a89ae42c92d Michael Margolin 2025-07-08  137  
982a89ae42c92d Michael Margolin 2025-07-08  138  		umem = ib_umem_get(ib_dev, buffer_va, buffer_length, IB_ACCESS_LOCAL_WRITE);
982a89ae42c92d Michael Margolin 2025-07-08  139  		if (IS_ERR(umem)) {
982a89ae42c92d Michael Margolin 2025-07-08  140  			ret = PTR_ERR(umem);
982a89ae42c92d Michael Margolin 2025-07-08  141  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  142  		}
982a89ae42c92d Michael Margolin 2025-07-08  143  	} else if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_FD)) {
982a89ae42c92d Michael Margolin 2025-07-08  144  
982a89ae42c92d Michael Margolin 2025-07-08  145  		ret = uverbs_get_raw_fd(&buffer_fd, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_FD);
982a89ae42c92d Michael Margolin 2025-07-08  146  		if (ret)
982a89ae42c92d Michael Margolin 2025-07-08  147  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  148  
982a89ae42c92d Michael Margolin 2025-07-08  149  		ret = uverbs_copy_from(&buffer_offset, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_OFFSET);
982a89ae42c92d Michael Margolin 2025-07-08  150  		if (ret)
982a89ae42c92d Michael Margolin 2025-07-08  151  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  152  
982a89ae42c92d Michael Margolin 2025-07-08  153  		ret = uverbs_copy_from(&buffer_length, attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_LENGTH);
982a89ae42c92d Michael Margolin 2025-07-08  154  		if (ret)
982a89ae42c92d Michael Margolin 2025-07-08  155  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  156  
982a89ae42c92d Michael Margolin 2025-07-08  157  		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_VA) ||
982a89ae42c92d Michael Margolin 2025-07-08  158  		    !ib_dev->ops.create_cq_umem) {
982a89ae42c92d Michael Margolin 2025-07-08  159  			ret = -EINVAL;
982a89ae42c92d Michael Margolin 2025-07-08  160  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  161  		}
982a89ae42c92d Michael Margolin 2025-07-08  162  
982a89ae42c92d Michael Margolin 2025-07-08  163  		umem_dmabuf = ib_umem_dmabuf_get_pinned(ib_dev, buffer_offset, buffer_length,
982a89ae42c92d Michael Margolin 2025-07-08  164  							buffer_fd, IB_ACCESS_LOCAL_WRITE);
982a89ae42c92d Michael Margolin 2025-07-08  165  		if (IS_ERR(umem_dmabuf)) {
982a89ae42c92d Michael Margolin 2025-07-08  166  			ret = PTR_ERR(umem_dmabuf);
982a89ae42c92d Michael Margolin 2025-07-08  167  			goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  168  		}
982a89ae42c92d Michael Margolin 2025-07-08  169  		umem = &umem_dmabuf->umem;
982a89ae42c92d Michael Margolin 2025-07-08  170  	} else if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_OFFSET) ||
982a89ae42c92d Michael Margolin 2025-07-08  171  		   uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUFFER_LENGTH) ||
982a89ae42c92d Michael Margolin 2025-07-08  172  		   !ib_dev->ops.create_cq) {
982a89ae42c92d Michael Margolin 2025-07-08  173  		ret = -EINVAL;
982a89ae42c92d Michael Margolin 2025-07-08  174  		goto err_event_file;
982a89ae42c92d Michael Margolin 2025-07-08  175  	}
982a89ae42c92d Michael Margolin 2025-07-08  176  
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  177  	cq = rdma_zalloc_drv_obj(ib_dev, ib_cq);
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  178  	if (!cq) {
e39afe3d6dbd90 Leon Romanovsky  2019-05-28  179  		ret = -ENOMEM;
982a89ae42c92d Michael Margolin 2025-07-08  180  		ib_umem_release(umem);
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
982a89ae42c92d Michael Margolin 2025-07-08  194  	ret = umem ? ib_dev->ops.create_cq_umem(cq, &attr, umem, attrs) :
982a89ae42c92d Michael Margolin 2025-07-08 @195  		ib_dev->ops.create_cq(cq, &attr, attrs);
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
