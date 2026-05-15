Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F634F24A
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848602; cv=none; b=A+tR9WpmXIZF6svSrurX7D2iYY9IYKHHu5Z3xZLNnwU1Tba1hGbzpvwlNMzkt+hGQgQtXI5P8cH1SONwDeR4R9LqMk44vsKls+PHSTC6RXKYE+N9MTY8uRJtIbCU2eT7kq87auw6ZbTr0d1uqhOzUPRuxO8INh0VrZ6px2oMgvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848602; c=relaxed/simple;
	bh=qfBKWakoR6Gm5KI9w+k6k1ZSJ5nGMQ/QcvQoEVeinJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lPsqoHfK/p1Ev2IAUivUbHilCEI8Ij3YvSZqoaMU14dTZH7DA8YOV3m6DlIKcDT6bcs/u+O/Jr4x+0y/QNkXkV+ndLonw5K3Yel+q+WILF+Cd2ZCQi7Wg6evKhjSGQBerT9gEIKG1qyJVvg8zzzC68CZmmiMw0R+FcfjiUj2cNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfYXqatj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfYXqatj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778848600; x=1810384600;
  h=date:from:to:cc:subject:message-id;
  bh=qfBKWakoR6Gm5KI9w+k6k1ZSJ5nGMQ/QcvQoEVeinJ0=;
  b=KfYXqatjk0wawRtvJuqgCE/TxcS3QdyGHjp0H3XsfyFjoW+qeX7yeBLg
   hz6/T/UAoulv254ZlZB1y+uYfCfAsirpXnNc+MALuAVAyE1fF3FciyX5R
   susPI8MHA53+jTnYP6Xhi0d+aqNfs4FCdgEhzMlwirM2GYNwHbfp65a0U
   Bhb/uPcG3kDShj2ID0N7D6SqvVaJqdMA5TfN1AGyGnxn4UtJ5poWrDeRB
   d9an8Fp/c+c673Dyfu31TUADP6ouJ+NhSo5YB3cYk22t2UVp9Py6U5QcX
   NGnedWIq1W/71/vuCfuT3+u/MlzNI9hUCY51Th5/qGRW6jxXa3bV96tCq
   Q==;
X-CSE-ConnectionGUID: eQpvcdOyShWvDbfBcB7mQw==
X-CSE-MsgGUID: xuEv4KKPTNO6p5aLEX8CEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79922383"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79922383"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 05:36:40 -0700
X-CSE-ConnectionGUID: ZOOMK58vT0yArM4tKL5Icg==
X-CSE-MsgGUID: 6qZKeIxqSEOgy6eBRnVZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262438646"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 05:36:39 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNrmB-000000001YV-16OJ;
	Fri, 15 May 2026 12:36:26 +0000
Date: Fri, 15 May 2026 20:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/infiniband/core/ib_core_uverbs.c:550:16: warning: no
 previous prototype for function '_uverbs_alloc'
Message-ID: <202605152054.6DrTMMYd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Jason-Gunthorpe/RDMA-core-Move-the-_ib_copy_validate_udata-functions-to-ib_core_uverbs/20260515-124950, commit: 85679f249e00acc1b4de2adba5710a243a30ab7a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/RDMA-core-Move-the-_ib_copy_validate_udata-functions-to-ib_core_uverbs/20260515-124950
head:   977f5904705ca589d536ed5c49d433817ce73366
commit: 85679f249e00acc1b4de2adba5710a243a30ab7a RDMA/core: Move many of the little EXPORTs from uverbs_ioctl into ib_core_uverbs
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260515/202605152054.6DrTMMYd-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152054.6DrTMMYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605152054.6DrTMMYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/core/ib_core_uverbs.c:433:5: error: redefinition of '_ib_copy_validate_udata_in'
     433 | int _ib_copy_validate_udata_in(struct ib_udata *udata, void *req,
         |     ^
   include/rdma/uverbs_ioctl.h:961:19: note: previous definition is here
     961 | static inline int _ib_copy_validate_udata_in(struct ib_udata *udata, void *req,
         |                   ^
   drivers/infiniband/core/ib_core_uverbs.c:483:5: error: redefinition of '_ib_respond_udata'
     483 | int _ib_respond_udata(struct ib_udata *udata, const void *src, size_t len)
         |     ^
   include/rdma/uverbs_ioctl.h:968:19: note: previous definition is here
     968 | static inline int _ib_respond_udata(struct ib_udata *udata, const void *src,
         |                   ^
   drivers/infiniband/core/ib_core_uverbs.c:531:5: error: redefinition of 'uverbs_destroy_def_handler'
     531 | int uverbs_destroy_def_handler(struct uverbs_attr_bundle *attrs)
         |     ^
   include/rdma/ib_verbs.h:4931:19: note: previous definition is here
    4931 | static inline int uverbs_destroy_def_handler(struct uverbs_attr_bundle *attrs)
         |                   ^
>> drivers/infiniband/core/ib_core_uverbs.c:550:16: warning: no previous prototype for function '_uverbs_alloc' [-Wmissing-prototypes]
     550 | __malloc void *_uverbs_alloc(struct uverbs_attr_bundle *bundle, size_t size,
         |                ^
   drivers/infiniband/core/ib_core_uverbs.c:550:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
     550 | __malloc void *_uverbs_alloc(struct uverbs_attr_bundle *bundle, size_t size,
         |          ^
         |          static 
   drivers/infiniband/core/ib_core_uverbs.c:581:5: error: redefinition of 'uverbs_copy_to'
     581 | int uverbs_copy_to(const struct uverbs_attr_bundle *bundle, size_t idx,
         |     ^
   include/rdma/uverbs_ioctl.h:917:19: note: previous definition is here
     917 | static inline int uverbs_copy_to(const struct uverbs_attr_bundle *attrs_bundle,
         |                   ^
   drivers/infiniband/core/ib_core_uverbs.c:598:5: error: redefinition of 'uverbs_copy_to_struct_or_zero'
     598 | int uverbs_copy_to_struct_or_zero(const struct uverbs_attr_bundle *bundle,
         |     ^
   include/rdma/uverbs_ioctl.h:940:1: note: previous definition is here
     940 | uverbs_copy_to_struct_or_zero(const struct uverbs_attr_bundle *bundle,
         | ^
   drivers/infiniband/core/ib_core_uverbs.c:615:5: error: redefinition of '_uverbs_get_const_unsigned'
     615 | int _uverbs_get_const_unsigned(u64 *to,
         |     ^
   include/rdma/uverbs_ioctl.h:954:1: note: previous definition is here
     954 | _uverbs_get_const_unsigned(u64 *to,
         | ^
   drivers/infiniband/core/ib_core_uverbs.c:638:5: error: redefinition of '_uverbs_get_const_signed'
     638 | int _uverbs_get_const_signed(s64 *to,
         |     ^
   include/rdma/uverbs_ioctl.h:946:1: note: previous definition is here
     946 | _uverbs_get_const_signed(s64 *to,
         | ^
   drivers/infiniband/core/ib_core_uverbs.c:662:5: error: redefinition of 'uverbs_get_flags64'
     662 | int uverbs_get_flags64(u64 *to, const struct uverbs_attr_bundle *attrs_bundle,
         |     ^
   include/rdma/uverbs_ioctl.h:906:1: note: previous definition is here
     906 | uverbs_get_flags64(u64 *to, const struct uverbs_attr_bundle *attrs_bundle,
         | ^
   drivers/infiniband/core/ib_core_uverbs.c:695:5: error: redefinition of 'uverbs_get_flags32'
     695 | int uverbs_get_flags32(u32 *to, const struct uverbs_attr_bundle *attrs_bundle,
         |     ^
   include/rdma/uverbs_ioctl.h:912:1: note: previous definition is here
     912 | uverbs_get_flags32(u32 *to, const struct uverbs_attr_bundle *attrs_bundle,
         | ^
   1 warning and 9 errors generated.


vim +/_uverbs_alloc +550 drivers/infiniband/core/ib_core_uverbs.c

85679f249e00ac Jason Gunthorpe 2026-05-13  536  
85679f249e00ac Jason Gunthorpe 2026-05-13  537  /**
85679f249e00ac Jason Gunthorpe 2026-05-13  538   * _uverbs_alloc() - Quickly allocate memory for use with a bundle
85679f249e00ac Jason Gunthorpe 2026-05-13  539   * @bundle: The bundle
85679f249e00ac Jason Gunthorpe 2026-05-13  540   * @size: Number of bytes to allocate
85679f249e00ac Jason Gunthorpe 2026-05-13  541   * @flags: Allocator flags
85679f249e00ac Jason Gunthorpe 2026-05-13  542   *
85679f249e00ac Jason Gunthorpe 2026-05-13  543   * The bundle allocator is intended for allocations that are connected with
85679f249e00ac Jason Gunthorpe 2026-05-13  544   * processing the system call related to the bundle. The allocated memory is
85679f249e00ac Jason Gunthorpe 2026-05-13  545   * always freed once the system call completes, and cannot be freed any other
85679f249e00ac Jason Gunthorpe 2026-05-13  546   * way.
85679f249e00ac Jason Gunthorpe 2026-05-13  547   *
85679f249e00ac Jason Gunthorpe 2026-05-13  548   * This tries to use a small pool of pre-allocated memory for performance.
85679f249e00ac Jason Gunthorpe 2026-05-13  549   */
85679f249e00ac Jason Gunthorpe 2026-05-13 @550  __malloc void *_uverbs_alloc(struct uverbs_attr_bundle *bundle, size_t size,
85679f249e00ac Jason Gunthorpe 2026-05-13  551  			     gfp_t flags)
85679f249e00ac Jason Gunthorpe 2026-05-13  552  {
85679f249e00ac Jason Gunthorpe 2026-05-13  553  	struct bundle_priv *pbundle =
85679f249e00ac Jason Gunthorpe 2026-05-13  554  		container_of(&bundle->hdr, struct bundle_priv, bundle);
85679f249e00ac Jason Gunthorpe 2026-05-13  555  	size_t new_used;
85679f249e00ac Jason Gunthorpe 2026-05-13  556  	void *res;
85679f249e00ac Jason Gunthorpe 2026-05-13  557  
85679f249e00ac Jason Gunthorpe 2026-05-13  558  	if (check_add_overflow(size, pbundle->internal_used, &new_used))
85679f249e00ac Jason Gunthorpe 2026-05-13  559  		return ERR_PTR(-EOVERFLOW);
85679f249e00ac Jason Gunthorpe 2026-05-13  560  
85679f249e00ac Jason Gunthorpe 2026-05-13  561  	if (new_used > pbundle->internal_avail) {
85679f249e00ac Jason Gunthorpe 2026-05-13  562  		struct bundle_alloc_head *buf;
85679f249e00ac Jason Gunthorpe 2026-05-13  563  
85679f249e00ac Jason Gunthorpe 2026-05-13  564  		buf = kvmalloc_flex(*buf, data, size, flags);
85679f249e00ac Jason Gunthorpe 2026-05-13  565  		if (!buf)
85679f249e00ac Jason Gunthorpe 2026-05-13  566  			return ERR_PTR(-ENOMEM);
85679f249e00ac Jason Gunthorpe 2026-05-13  567  		buf->next = pbundle->allocated_mem;
85679f249e00ac Jason Gunthorpe 2026-05-13  568  		pbundle->allocated_mem = buf;
85679f249e00ac Jason Gunthorpe 2026-05-13  569  		return buf->data;
85679f249e00ac Jason Gunthorpe 2026-05-13  570  	}
85679f249e00ac Jason Gunthorpe 2026-05-13  571  
85679f249e00ac Jason Gunthorpe 2026-05-13  572  	res = (void *)pbundle->internal_buffer + pbundle->internal_used;
85679f249e00ac Jason Gunthorpe 2026-05-13  573  	pbundle->internal_used =
85679f249e00ac Jason Gunthorpe 2026-05-13  574  		ALIGN(new_used, sizeof(*pbundle->internal_buffer));
85679f249e00ac Jason Gunthorpe 2026-05-13  575  	if (want_init_on_alloc(flags))
85679f249e00ac Jason Gunthorpe 2026-05-13  576  		memset(res, 0, size);
85679f249e00ac Jason Gunthorpe 2026-05-13  577  	return res;
85679f249e00ac Jason Gunthorpe 2026-05-13  578  }
85679f249e00ac Jason Gunthorpe 2026-05-13  579  EXPORT_SYMBOL(_uverbs_alloc);
85679f249e00ac Jason Gunthorpe 2026-05-13  580  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
