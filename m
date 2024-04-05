Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A948EAC5
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712294251; cv=none; b=daxU8JLfAhMy3lsko0m+oPvqUq2Yisa1HKWVXldTnbEzLcxvvD7mfbzf8pCNanVH9Es1z9ulgugM0yvf2yYd4ctAdtL0dmZiwOTFm3xcGM4EN4XS5+RxnPZz+oe65q+CSkpH7QuixveC9xZPIGxTUgR0cwklhT4qGvejjCSJDWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712294251; c=relaxed/simple;
	bh=hUUNTOoiPYpquAYlrJ/YGONU2RPWutTlMvd/62JNIyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SO+dAGwG3fZnVThHDUtuFtcxsaCrkGBv5NMnlVWAGLVMPl1tTZOqsOddZjpEV/nrZWSeoLgl7hKruu4NFfEPxfP4R0+gyAx/M4zg0YXiK733oUqgquzY0Qg+Db1PSmBZxTMnrAu92xM/vaibtxV7Czxf+YkSY1qmbpjhuycx2cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuZCa+7I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuZCa+7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712294249; x=1743830249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUUNTOoiPYpquAYlrJ/YGONU2RPWutTlMvd/62JNIyM=;
  b=TuZCa+7IItTUIMAgv4pq+Vh8kaM5UzftW/oYVurGF2y+SiMb91QWY4L7
   2PvwAgMtHXsHb4oH6646QzLZkLKc0qcJA4LItz4BgB8GMpKso3SOOPgUY
   YVxdo9hyisbGReu5yPoPJ43AmSc8bs/JlykswG0z76e51obLboQYs3Yg0
   LOw31XlwM/j05q5bVG27CGM8sCIk0RmGPOj9W2bXXYbKHjkTKKDi4qLgN
   X73gmPetl885yTgRf7upORE5MH0uGKh10GN3ESzApN4bb7MmThESMU7Is
   5LERi3m7Cw/9SQcb8XLJ8NRSP4vz2dtV/LX86CtSrVyGpz3GcXfXZMKeC
   A==;
X-CSE-ConnectionGUID: VPJRIuFfTJS1fbD7ZmzcwQ==
X-CSE-MsgGUID: NTgVvpq2QlqWLMd5k2G40g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18753010"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18753010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 22:17:29 -0700
X-CSE-ConnectionGUID: I5pnANlGQOGyX8YdiyXmhw==
X-CSE-MsgGUID: wjaHx7ukRGyFAQCTEQphUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23777721"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Apr 2024 22:17:28 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsbx7-0001vW-1P;
	Fri, 05 Apr 2024 05:17:25 +0000
Date: Fri, 5 Apr 2024 13:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2720/3921] lib/alloc_tag.c:142 alloc_tag_init()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202404051340.7Wo7oiJ5-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: 9e2dcefa791e9d14006b360fba3455510fd3325d [2720/3921] lib: add allocation tagging support for memory allocation profiling
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-r081-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051340.7Wo7oiJ5-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404051340.7Wo7oiJ5-lkp@intel.com/

smatch warnings:
lib/alloc_tag.c:142 alloc_tag_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +142 lib/alloc_tag.c

9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  131  
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  132  static int __init alloc_tag_init(void)
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  133  {
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  134  	const struct codetag_type_desc desc = {
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  135  		.section	= "alloc_tags",
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  136  		.tag_size	= sizeof(struct alloc_tag),
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  137  		.module_unload	= alloc_tag_module_unload,
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  138  	};
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  139  
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  140  	alloc_tag_cttype = codetag_register_type(&desc);
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  141  	if (IS_ERR_OR_NULL(alloc_tag_cttype))
9e2dcefa791e9d Suren Baghdasaryan 2024-03-21 @142  		return PTR_ERR(alloc_tag_cttype);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
