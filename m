Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1838DF9
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731142364; cv=none; b=LetN5uEYkJO6lOBhkyq2MK2T906mvCbYmy69o8ZjL2zhL9v0TDfOBBgkeaLXAul4FHKpasPG5RXKSkpZtfzN5GINf0ahHlbCwb6z/TKclQ5olsQEHhgkl1zl/eY8ED8gyF4142rvT9ETIQk8wf/ZUZCXAOecpfbn7GdBfB0NmGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731142364; c=relaxed/simple;
	bh=i+QPe1uLLlR5SUzwuyCRVUNkKd0iMKTfhGAGkiSvYWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QvF5bvwVy5qPO0bU4aQdRXv3svfHR3Gj+xURb0fiQj3DkTNo42Vx7LMro+PEdo+osz73ORYwdXSwbbzZA9NVmTDiGo+0OAOXVCKXPFxgkCIUQYuMyfpUg70HPaZ9WulTPyuLRgcbPkkQQKOceO23FA33mQJnzpB+faNQ3B9DY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXJkwH/v; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXJkwH/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731142362; x=1762678362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+QPe1uLLlR5SUzwuyCRVUNkKd0iMKTfhGAGkiSvYWU=;
  b=YXJkwH/vjOD9WEELy30ZjdaF3nanxa2+2NUf5R0PuSCAKJjpGfrel40i
   HZMVs/bgppCbuK21CXtf7m9AgZMhrQyQyGGZbvIu4X7EJNfeneAYW+fEw
   VhMO37Jh0coBUIHHIvnfeQLBdqfbZZsdOvF+YTKJdMfH+CiMKMmG7Fv0H
   EniMo9fMO1R8V0M8i2ZQ/YmicfLRBV9dkmdjnpns4FZm0+mw3zbZbJKTg
   huVRfQuHJBD5kHEdf05CO4IyvA1ACpKLDiSxTTAv294K+oGDE+VXkvn00
   Jx66Ag5MA5c3A4CfDE129JgU4ORlLE60wSiCrWN2XqqaFt6gHp8tCWzyD
   g==;
X-CSE-ConnectionGUID: 7R9GB4nJSxGApTIujXGerw==
X-CSE-MsgGUID: ktooUwGlRJCu9oEaA85UMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18646741"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="18646741"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 00:52:41 -0800
X-CSE-ConnectionGUID: vu/2pSjHQvaviPqQRzvM2w==
X-CSE-MsgGUID: l3WmWSVnTXCW4FWtE/o68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="109243724"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2024 00:52:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9hCv-000sEu-1q;
	Sat, 09 Nov 2024 08:52:37 +0000
Date: Sat, 9 Nov 2024 16:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v5 09/16] fuse: {uring} Add uring sqe commit and
 fetch support
Message-ID: <202411091639.9TrH6yhu-lkp@intel.com>
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
In-Reply-To: <20241107-fuse-uring-for-6-10-rfc4-v5-9-e8660a991499@ddn.com>
References: <20241107-fuse-uring-for-6-10-rfc4-v5-9-e8660a991499@ddn.com>
TO: Bernd Schubert <bschubert@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-to-fuse_dev_end_requests-and-make-non-static/20241108-013957
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20241107-fuse-uring-for-6-10-rfc4-v5-9-e8660a991499%40ddn.com
patch subject: [PATCH RFC v5 09/16] fuse: {uring} Add uring sqe commit and fetch support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241109 (https://download.01.org/0day-ci/archive/20241109/202411091639.9TrH6yhu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411091639.9TrH6yhu-lkp@intel.com/

smatch warnings:
fs/fuse/dev_uring.c:251 fuse_uring_copy_from_ring() warn: maybe return -EFAULT instead of the bytes remaining?

vim +251 fs/fuse/dev_uring.c

7940d4237db3ce Bernd Schubert 2024-11-07  237  
7940d4237db3ce Bernd Schubert 2024-11-07  238  static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
7940d4237db3ce Bernd Schubert 2024-11-07  239  				     struct fuse_req *req,
7940d4237db3ce Bernd Schubert 2024-11-07  240  				     struct fuse_ring_ent *ent)
7940d4237db3ce Bernd Schubert 2024-11-07  241  {
7940d4237db3ce Bernd Schubert 2024-11-07  242  	struct fuse_copy_state cs;
7940d4237db3ce Bernd Schubert 2024-11-07  243  	struct fuse_args *args = req->args;
7940d4237db3ce Bernd Schubert 2024-11-07  244  	struct iov_iter iter;
7940d4237db3ce Bernd Schubert 2024-11-07  245  	int err;
7940d4237db3ce Bernd Schubert 2024-11-07  246  	int res_arg_len;
7940d4237db3ce Bernd Schubert 2024-11-07  247  
7940d4237db3ce Bernd Schubert 2024-11-07  248  	err = copy_from_user(&res_arg_len, &ent->headers->in_out_arg_len,
7940d4237db3ce Bernd Schubert 2024-11-07  249  			     sizeof(res_arg_len));
7940d4237db3ce Bernd Schubert 2024-11-07  250  	if (err)
7940d4237db3ce Bernd Schubert 2024-11-07 @251  		return err;
7940d4237db3ce Bernd Schubert 2024-11-07  252  
7940d4237db3ce Bernd Schubert 2024-11-07  253  	err = import_ubuf(ITER_SOURCE, ent->payload, ent->max_arg_len, &iter);
7940d4237db3ce Bernd Schubert 2024-11-07  254  	if (err)
7940d4237db3ce Bernd Schubert 2024-11-07  255  		return err;
7940d4237db3ce Bernd Schubert 2024-11-07  256  
7940d4237db3ce Bernd Schubert 2024-11-07  257  	fuse_copy_init(&cs, 0, &iter);
7940d4237db3ce Bernd Schubert 2024-11-07  258  	cs.is_uring = 1;
7940d4237db3ce Bernd Schubert 2024-11-07  259  	cs.req = req;
7940d4237db3ce Bernd Schubert 2024-11-07  260  
7940d4237db3ce Bernd Schubert 2024-11-07  261  	return fuse_copy_out_args(&cs, args, res_arg_len);
7940d4237db3ce Bernd Schubert 2024-11-07  262  }
7940d4237db3ce Bernd Schubert 2024-11-07  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
