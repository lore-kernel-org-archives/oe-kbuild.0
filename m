Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822A467E96
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 19:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daM8K/xc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701804287; x=1733340287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5jbSrGvBpHkPxDKGjj0YdfFoZQwIn30GS254to3gY7s=;
  b=daM8K/xcL+99IK6QgIJ3V8xc3T5TY5mFUYWreHuFzoN3pWgOIPqj+o5k
   66NkQYw3qpw0qN8kD65ZaQNkY8a3Rnj/d15cuTZi+m3VvQBOcThfxJ/UZ
   6HJDoH34PX9ZdQksXSyhGkD3/jQQ/v7SMoNrMitEcXZt0j7JKELQA9YsL
   dJOXNnWGx7HmfO4tBw7NqwjRq0+r1vYrUkmYWpTgH2rfG5IdglUOtjnvT
   u50oHnVG4g8ytDasvX1B+KDlbE/fNKIa2w2LR+XKIH6pusTLDN5/AoHLW
   5X+8s8rJXzQHL3cYxdiqW8Snzxb3w02MXgK7PbtAugaaJG6nHGgUBf8ts
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15497068"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="15497068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:24:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720822564"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="720822564"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 11:24:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAb2A-0009bn-37;
	Tue, 05 Dec 2023 19:24:42 +0000
Date: Wed, 6 Dec 2023 03:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/alloc_foreground.c:1023:12-13: WARNING opportunity for
 min()
Message-ID: <202312060356.jQs1ZR5V-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 7635e1a6d6740ce76e1c2204f9237f01c98153b3 bcachefs: Rework open bucket partial list allocation
date:   6 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-104-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060356.jQs1ZR5V-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060356.jQs1ZR5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060356.jQs1ZR5V-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/alloc_foreground.c:1023:12-13: WARNING opportunity for min()

vim +1023 fs/bcachefs/alloc_foreground.c

7635e1a6d6740c Kent Overstreet 2023-02-25   989  
7635e1a6d6740c Kent Overstreet 2023-02-25   990  static int open_bucket_add_buckets(struct btree_trans *trans,
7635e1a6d6740c Kent Overstreet 2023-02-25   991  			struct open_buckets *ptrs,
7635e1a6d6740c Kent Overstreet 2023-02-25   992  			struct write_point *wp,
7635e1a6d6740c Kent Overstreet 2023-02-25   993  			struct bch_devs_list *devs_have,
7635e1a6d6740c Kent Overstreet 2023-02-25   994  			u16 target,
7635e1a6d6740c Kent Overstreet 2023-02-25   995  			unsigned erasure_code,
7635e1a6d6740c Kent Overstreet 2023-02-25   996  			unsigned nr_replicas,
7635e1a6d6740c Kent Overstreet 2023-02-25   997  			unsigned *nr_effective,
7635e1a6d6740c Kent Overstreet 2023-02-25   998  			bool *have_cache,
7635e1a6d6740c Kent Overstreet 2023-02-25   999  			enum alloc_reserve reserve,
7635e1a6d6740c Kent Overstreet 2023-02-25  1000  			unsigned flags,
7635e1a6d6740c Kent Overstreet 2023-02-25  1001  			struct closure *cl)
7635e1a6d6740c Kent Overstreet 2023-02-25  1002  {
7635e1a6d6740c Kent Overstreet 2023-02-25  1003  	int ret;
7635e1a6d6740c Kent Overstreet 2023-02-25  1004  
7635e1a6d6740c Kent Overstreet 2023-02-25  1005  	if (erasure_code) {
7635e1a6d6740c Kent Overstreet 2023-02-25  1006  		ret = __open_bucket_add_buckets(trans, ptrs, wp,
7635e1a6d6740c Kent Overstreet 2023-02-25  1007  				devs_have, target, erasure_code,
7635e1a6d6740c Kent Overstreet 2023-02-25  1008  				nr_replicas, nr_effective, have_cache,
7635e1a6d6740c Kent Overstreet 2023-02-25  1009  				reserve, flags, cl);
7635e1a6d6740c Kent Overstreet 2023-02-25  1010  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart) ||
7635e1a6d6740c Kent Overstreet 2023-02-25  1011  		    bch2_err_matches(ret, BCH_ERR_operation_blocked) ||
7635e1a6d6740c Kent Overstreet 2023-02-25  1012  		    bch2_err_matches(ret, BCH_ERR_freelist_empty) ||
7635e1a6d6740c Kent Overstreet 2023-02-25  1013  		    bch2_err_matches(ret, BCH_ERR_open_buckets_empty))
7b3f84ea7d3f9b Kent Overstreet 2018-10-06  1014  			return ret;
7635e1a6d6740c Kent Overstreet 2023-02-25  1015  		if (*nr_effective >= nr_replicas)
7635e1a6d6740c Kent Overstreet 2023-02-25  1016  			return 0;
7635e1a6d6740c Kent Overstreet 2023-02-25  1017  	}
7635e1a6d6740c Kent Overstreet 2023-02-25  1018  
7635e1a6d6740c Kent Overstreet 2023-02-25  1019  	ret = __open_bucket_add_buckets(trans, ptrs, wp,
7635e1a6d6740c Kent Overstreet 2023-02-25  1020  			devs_have, target, false,
7635e1a6d6740c Kent Overstreet 2023-02-25  1021  			nr_replicas, nr_effective, have_cache,
7635e1a6d6740c Kent Overstreet 2023-02-25  1022  			reserve, flags, cl);
7635e1a6d6740c Kent Overstreet 2023-02-25 @1023  	return ret < 0 ? ret : 0;
7b3f84ea7d3f9b Kent Overstreet 2018-10-06  1024  }
7b3f84ea7d3f9b Kent Overstreet 2018-10-06  1025  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
