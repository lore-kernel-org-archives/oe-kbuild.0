Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F007146D7F
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712305599; cv=none; b=pp+lEqhamD6ZfTYbQHtRLCr1vZPwvCT8mws9mMyqP+nMOD2SYiHu9zHqsag4+l68Xi4u6EyAMYwqx4NkFPIx/p14+qbFLVOqbl6vPn5i33EPkNjlCvRe6nA0jXYiPYLn0Z1w6WIAvSNHGGbM8RHm5HZbiKrlErQ5a5wFla8WSkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712305599; c=relaxed/simple;
	bh=MqFFI75GZrqV4mtjX56anf8Ll9gzqackUJibZfDzPhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqhbM+0QoMxgfHEwHAWnn15EFmkOjHdd+hy2c4zEd6KXjQIUAXospduhZ4Pjh7kRfXzmZqoh32QCtxRJ18F7wu2MrHreH+Q8PEt7SnFamIKzHK2KhGxohT9g4knKWSY232FtchSfo3KYqtNqR944ScoaRoj9DBk+hSrDZOeOpR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNdjuEYY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNdjuEYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712305597; x=1743841597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqFFI75GZrqV4mtjX56anf8Ll9gzqackUJibZfDzPhM=;
  b=hNdjuEYYyY25PTAjDRZzCK5wQfm9sT3kPw68Hc6HzHfGcr880QwyUaNe
   m9x+i4L31aJnH1zF35PPiqQ7W7IkEab7y6JnCL+W0rR4d1ZhcmvKU9peh
   RoB3XzdFXZgSotQQHQQtxiR6FH/pb1XSTVjJ0E2VQdjPawEP8fIUcuvja
   t4AnfrJlN7gZ9XryuKihJaRLUxGx8qU4HCgiQYXQUBG+XOdegilISRNEH
   nBvmexI6/tZsY0Q+rq9LgCIVrEk2S/BKAIhsVS/TYpglVCquGKEdDVSFs
   NNMeTOx3AuQzrD+n/UKvL7u74XAcRIvHv6CkWExnS6NjUsMD3gbU3aWEy
   A==;
X-CSE-ConnectionGUID: 9bchfN7vQ9a2qYzJSRuKag==
X-CSE-MsgGUID: flT9TYQUSJidmtNFz38hag==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8205965"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="8205965"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 01:26:35 -0700
X-CSE-ConnectionGUID: ZicPojHMSim3rESBMXMdhQ==
X-CSE-MsgGUID: TTkOOxt5Sv2r1Dfa5Ym/EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19501406"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Apr 2024 01:26:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rseu8-00022s-04;
	Fri, 05 Apr 2024 08:26:32 +0000
Date: Fri, 5 Apr 2024 16:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/afs/file.c:420:48-49: WARNING: atomic_add_unless
Message-ID: <202404051635.si5VKXoE-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cb4a9a82b21623dbb4b3051dd30d98356cf95bc
commit: 275655d3207b9e65d1561bf21c06a622d9ec1d43 afs: fix __afs_break_callback() / afs_drop_open_mmap() race
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: parisc-randconfig-r063-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051635.si5VKXoE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404051635.si5VKXoE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   fs/afs/file.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.
>> fs/afs/file.c:420:48-49: WARNING: atomic_add_unless

vim +420 fs/afs/file.c

6e0e99d58a6530 David Howells 2021-09-02  417  
6e0e99d58a6530 David Howells 2021-09-02  418  static void afs_drop_open_mmap(struct afs_vnode *vnode)
6e0e99d58a6530 David Howells 2021-09-02  419  {
275655d3207b9e Al Viro       2023-09-29 @420  	if (atomic_add_unless(&vnode->cb_nr_mmap, -1, 1))
6e0e99d58a6530 David Howells 2021-09-02  421  		return;
6e0e99d58a6530 David Howells 2021-09-02  422  
453924de6212ac David Howells 2023-11-08  423  	down_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530 David Howells 2021-09-02  424  
275655d3207b9e Al Viro       2023-09-29  425  	read_seqlock_excl(&vnode->cb_lock);
275655d3207b9e Al Viro       2023-09-29  426  	// the only place where ->cb_nr_mmap may hit 0
275655d3207b9e Al Viro       2023-09-29  427  	// see __afs_break_callback() for the other side...
275655d3207b9e Al Viro       2023-09-29  428  	if (atomic_dec_and_test(&vnode->cb_nr_mmap))
6e0e99d58a6530 David Howells 2021-09-02  429  		list_del_init(&vnode->cb_mmap_link);
275655d3207b9e Al Viro       2023-09-29  430  	read_sequnlock_excl(&vnode->cb_lock);
6e0e99d58a6530 David Howells 2021-09-02  431  
453924de6212ac David Howells 2023-11-08  432  	up_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530 David Howells 2021-09-02  433  	flush_work(&vnode->cb_work);
6e0e99d58a6530 David Howells 2021-09-02  434  }
6e0e99d58a6530 David Howells 2021-09-02  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
