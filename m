Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DE1482E8
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 04:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775623546; cv=none; b=dAstlqZ6rmQTOH+KctejYB5Vf91jWJkuLYjbQX3AUld9gMFMv9IzXm9XFWcTFxLbmwTXIV6dl7LxGrPd8/4gTh+ED9dnboCeECXF9S+CM9mBTtixyuyYjog2rjGdKKbmyrs5C5no5zyMqMO11kntFbBalIm1C4o9aDCtkFgebv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775623546; c=relaxed/simple;
	bh=+mLvWr22H7d5Ngz8KK1gN2nOANsmherDN1HkfAzWRsk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tYanKUgPzt18SMgk4RTVrKiQObkSPzIPjwzdJGASJLkG4oAB6Xz59Tqis8CWzZT9qidjlSS8Tdpt18WZFI+5R+keb3qwrGLXFwtMbTF90VkUjMqVmQLe92UlT25FUvTWe3zMZKxSggBMTJPMFWpbL9XDtI4e+jrXjHeYiQHne9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoljFFGi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoljFFGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775623545; x=1807159545;
  h=date:from:to:cc:subject:message-id;
  bh=+mLvWr22H7d5Ngz8KK1gN2nOANsmherDN1HkfAzWRsk=;
  b=BoljFFGiRLhmJIlPTM2g2+reNABQhMFaMzEHy9ENJYcutbHV2HFrjqUM
   tEFgMAoIrheAawHIGwFTDW9xsc9dsO8D/6p+Imi1oST31bqf0eIKMQjNP
   iotRFdmmgzI1l1PyC/hYKLrkuPcooHKEHf3B7vPSgSakorzx4ZheFMrmP
   j94nUxKcYLK4dKTXrpasNB2H/6174vFPColIZQX5wfmh2gwgROHNxwjU9
   QKKTIdvq0cBGyxcZDw6QM+P5T7Dg79SR+JZ+1F1o45OYqmUy5odguOpdv
   oW19pV0zuJ0NBTTQumSlrZz/96zYNd//tYQ61nnkVe7NpEneZH4htn5+X
   g==;
X-CSE-ConnectionGUID: iORa7ptKTcm1KeM30oBe6w==
X-CSE-MsgGUID: V4cr0Hn0SI2gtb/7ZGeW0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80457451"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="80457451"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 21:45:44 -0700
X-CSE-ConnectionGUID: pswBdxivQPGLEEYA/g70iw==
X-CSE-MsgGUID: nviFredEQOGGGm+ggRkLFA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2026 21:45:43 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAKnN-00000000AP7-0RzV;
	Wed, 08 Apr 2026 04:45:41 +0000
Date: Wed, 08 Apr 2026 06:45:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dwmw2:vgic-iidr-group-fixes 3/3]
 include/kvm_util.h:1139:16: warning: passing argument 1 of 'memcpy' discards
 'volatile' qualifier from pointer target type
Message-ID: <202604080614.wKKMYdgW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Woodhouse <dwmw@amazon.co.uk>

tree:   git://git.infradead.org/users/dwmw2/linux vgic-iidr-group-fixes
head:   89879757040970ab272f17b4ec2fb7d6a7986372
commit: c1ec22a93f919c6d3bee511832ca8422f9e61471 [3/3] KVM: arm64: selftests: Add vgic IIDR revision test
:::::: branch date: 8 hours ago
:::::: commit date: 9 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260408/202604080614.wKKMYdgW-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080614.wKKMYdgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080614.wKKMYdgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arm64/vgic_group_iidr.c:13:
   arm64/vgic_group_iidr.c: In function 'run_test':
>> include/kvm_util.h:1139:16: warning: passing argument 1 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                ^~
   arm64/vgic_group_iidr.c:87:9: note: in expansion of macro 'sync_global_to_guest'
      87 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/test_util.h:17,
                    from arm64/vgic_group_iidr.c:12:
   /usr/aarch64-linux-gnu/include/string.h:43:39: note: expected 'void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                      ~~~~~~~~~~~~~~~~~^~~~~~
   include/kvm_util.h:1139:20: warning: passing argument 2 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                    ^~~~
   arm64/vgic_group_iidr.c:87:9: note: in expansion of macro 'sync_global_to_guest'
      87 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/string.h:43:70: note: expected 'const void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> include/kvm_util.h:1139:16: warning: passing argument 1 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                ^~
   arm64/vgic_group_iidr.c:89:9: note: in expansion of macro 'sync_global_to_guest'
      89 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/string.h:43:39: note: expected 'void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                      ~~~~~~~~~~~~~~~~~^~~~~~
   include/kvm_util.h:1139:20: warning: passing argument 2 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                    ^~~~
   arm64/vgic_group_iidr.c:89:9: note: in expansion of macro 'sync_global_to_guest'
      89 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/string.h:43:70: note: expected 'const void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
