Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F2E2FCBE5
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766079383; cv=none; b=KuyWb+jorJNQ7snQDd7WLXGQcdYzNYQ5ByTv7JlbCPFcn0jgsByntyQRzBlEJtvBnKYrGMRp1MXJh4cttekMmxcmFvnL5OiIpzR2N0u4URk91xi1ZvVqjMqN8E7AsR4lmlriV75uC1PSsviplIFsKMj8qEsVpATKx4knvuN7VLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766079383; c=relaxed/simple;
	bh=jrvZVsNceOWbhopdf+dogDo4KSpwCA9CVWJBbM+5hVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWig+sbmuBJxkNcMES4yRkiB5reFtirOx1du8UhQpYex+Sdgf7kcJlf/laU2UMovQkWBtfD2VQ4cj6kOI2Wetzk6VECVXsbiKqTFKcERyFFnwank/FgnaBoTp8waEGWIvOEtV14rtM5PN6l88exbR8SV2hk0j/SD9WTDcgo+C1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA6zeYUg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA6zeYUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766079381; x=1797615381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrvZVsNceOWbhopdf+dogDo4KSpwCA9CVWJBbM+5hVo=;
  b=LA6zeYUgn1vr+qg9zkk3o7F+KGAAfCRVfx3hO0fWLW1a4VZDehWGn9TI
   hkhW8t5WbHzlb3TugwymCvefTGxFHFyYfdzmVUvSA6wxZEQdEBHIVZuDl
   FclIBH7XaSX4fkIHcOU9zkipFT9/aNgbiPvi2qMnE18MIsi+//Nkd8a6y
   PCsHqLB6L7MXFkL0Ou5Be7RG3bhQ+P6634qQLQ96kp46KpBeO4/QcUZQX
   ouLiQdjjWNy0kAC76H0eJ2AwYV+pYcOMp5q1tNdp7V/rA1Jph+Q+SFHfJ
   gEQHaHm5DEzCsj3Hv2Tm79Rd43eEwLoXpvvtk6kqpP6YiSI6RHLMjZ0fJ
   g==;
X-CSE-ConnectionGUID: GpjV8b5ARy+xGx6VrB12wg==
X-CSE-MsgGUID: q5WZKq4xRe+X/tHdqRP9ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85626432"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="85626432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 09:36:20 -0800
X-CSE-ConnectionGUID: ulz1OHXiRyOmLv+hHnUpog==
X-CSE-MsgGUID: z62g7yA1QGeltP0XStlR9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229310840"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2025 09:36:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWHvE-000000002O3-3DFQ;
	Thu, 18 Dec 2025 17:36:16 +0000
Date: Fri, 19 Dec 2025 01:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1946/1946]
 include/linux/string.h:348:9: warning: 'list' may be used uninitialized in
 this function
Message-ID: <202512190122.U1WZhmDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: f828b65afdf2bda865c9eb3d8671a687adace842 [1946/1946] hda: add phytium hda driver
:::::: branch date: 34 hours ago
:::::: commit date: 2 years, 2 months ago
config: arm64-randconfig-r062-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190122.U1WZhmDs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190122.U1WZhmDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512190122.U1WZhmDs-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:49,
                    from include/asm-generic/qrwlock.h:23,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from arch/arm64/include/asm/spinlock.h:19,
                    from include/linux/spinlock.h:88,
                    from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from sound/pci/hda/hda_codec.c:24:
   sound/pci/hda/hda_codec.c: In function 'snd_hda_get_connections':
>> include/linux/string.h:348:9: warning: 'list' may be used uninitialized in this function [-Wmaybe-uninitialized]
     348 |  return __builtin_memcpy(p, q, size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:223:19: note: 'list' was declared here
     223 |  const hda_nid_t *list;
         |                   ^~~~
   sound/pci/hda/hda_codec.c: In function 'snd_hda_get_conn_index':
   sound/pci/hda/hda_codec.c:280:19: warning: 'conn' may be used uninitialized in this function [-Wmaybe-uninitialized]
     280 |  const hda_nid_t *conn;
         |                   ^~~~
   sound/pci/hda/hda_codec.c:897: warning: Function parameter or member 'card' not described in 'snd_hda_codec_new'


vim +/list +348 include/linux/string.h

6974f0c4555e28 Daniel Micay 2017-07-12  335  
6974f0c4555e28 Daniel Micay 2017-07-12  336  __FORTIFY_INLINE void *memcpy(void *p, const void *q, __kernel_size_t size)
6974f0c4555e28 Daniel Micay 2017-07-12  337  {
6974f0c4555e28 Daniel Micay 2017-07-12  338  	size_t p_size = __builtin_object_size(p, 0);
6974f0c4555e28 Daniel Micay 2017-07-12  339  	size_t q_size = __builtin_object_size(q, 0);
6974f0c4555e28 Daniel Micay 2017-07-12  340  	if (__builtin_constant_p(size)) {
6974f0c4555e28 Daniel Micay 2017-07-12  341  		if (p_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  342  			__write_overflow();
6974f0c4555e28 Daniel Micay 2017-07-12  343  		if (q_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  344  			__read_overflow2();
6974f0c4555e28 Daniel Micay 2017-07-12  345  	}
6974f0c4555e28 Daniel Micay 2017-07-12  346  	if (p_size < size || q_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  347  		fortify_panic(__func__);
6974f0c4555e28 Daniel Micay 2017-07-12 @348  	return __builtin_memcpy(p, q, size);
6974f0c4555e28 Daniel Micay 2017-07-12  349  }
6974f0c4555e28 Daniel Micay 2017-07-12  350  

:::::: The code at line 348 was first introduced by commit
:::::: 6974f0c4555e285ab217cee58b6e874f776ff409 include/linux/string.h: add the option of fortified string.h functions

:::::: TO: Daniel Micay <danielmicay@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
