Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A17396D03
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 04:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003310; cv=none; b=Dgg5PRKzBem0YRf4WbF7lytD5yGpM18gQ0uwv1BsI5qu7uBbwHi8KJajmhD8CMAxE6C6PQLT7BotkwC4Fkffv1u1c9eq2UYsD+ryESs6wgTlJIdLwq3UEIVUTA7B3VDPWNk/p4XnpfwxgnteR9CcxVd/JC0myzQ6yW3L6tWzToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003310; c=relaxed/simple;
	bh=U2bVXRw6KBTDC9b3O8kbHzbsVTOWDq1swMxsaHvwhPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZICt36tVCa3NuP3sFutaY6877HcyZfPFtgUtQ5YAg/5Ajv6CuG+OjEY5Lray3PqGxxz5vTyDUkilTjug3qj3UTqnNQODEKh6xSxqxc+/ryAGy5da+UTCUWurasKAgR4k5FXmA+9Bt0b8P//yqXWVRcKHxggsGLYTC8oabWo+zcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImfejSon; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImfejSon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791003303; x=1822539303;
  h=date:from:to:cc:subject:message-id;
  bh=U2bVXRw6KBTDC9b3O8kbHzbsVTOWDq1swMxsaHvwhPs=;
  b=ImfejSon+i89150/YcPBwpz4Se+xDbjEt3gpE/iRfcK1qlToNQT4BdjP
   hz5pnJdJfQZHVARQ6k+O1iiFP7W4tK5Ks/7pAYe9bkp5X4TszCh/siOnN
   0dPpe1S+Q2GQ428Mdg4Rlrf3UQCZXJ2FWfl8s7qTHBLrHyH4qRI7bGiI6
   anuc0M5fX7Gyx6P/ZRIdzzKjZkWI6+C06ofB16n62jCC6SisD0FHx+4Yc
   bx+bBhCmW0VEHAOTfF+XOmz5Uhs8b/JnvaCUlszezL+G1Ww9q2BfGvP7e
   sQ0bGk7Vp33/qZstzeR0sCR4eA0sfk4fh1eVaaNQeqONsjl6YcLwJ7o+l
   A==;
X-CSE-ConnectionGUID: mzfveXi4T3aVqTqIY3tZew==
X-CSE-MsgGUID: n+YkBZtaQOSazNHvB53Xig==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="109251353"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109251353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 21:54:52 -0700
X-CSE-ConnectionGUID: Yca0FqhoTb6n1DOUXQfmsQ==
X-CSE-MsgGUID: r9ztXK5FRwO2Aqb0KCwcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="304349307"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2026 21:54:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCrlp-00000000TkB-0zNn;
	Sat, 03 Oct 2026 04:54:49 +0000
Date: Sat, 03 Oct 2026 12:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sparc/include/asm/string.h:15:25: warning:
 '__builtin_memcpy' forming offset [5, 8] is out of the bounds [0, 4] of
 object 'k' with type 'long unsigned int'
Message-ID: <202610031215.ybqsLvSp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/T-J-Mercier/bpf-htab-Split-htab_elem_lru-and-htab_elem_pcpu-off-of-htab_elem/20261002-091734, commit: ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "T.J. Mercier" <tjmercier@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/bpf-htab-Split-htab_elem_lru-and-htab_elem_pcpu-off-of-htab_elem/20261002-091734
head:   ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78
commit: ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78 bpf: htab: Reduce elem_size by 8 bytes for small key sizes
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: sparc-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031215.ybqsLvSp-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031215.ybqsLvSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031215.ybqsLvSp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:12,
                    from kernel/bpf/hashtab.c:5:
   In function '__lookup_elem_raw',
       inlined from 'lookup_nulls_elem_raw' at kernel/bpf/hashtab.c:843:6,
       inlined from '__htab_lookup' at kernel/bpf/hashtab.c:866:6,
       inlined from '__htab_map_lookup_elem_u64' at kernel/bpf/hashtab.c:890:9:
>> arch/sparc/include/asm/string.h:15:25: warning: '__builtin_memcpy' forming offset [5, 8] is out of the bounds [0, 4] of object 'k' with type 'long unsigned int' [-Warray-bounds]
    #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c:812:3: note: in expansion of macro 'memcpy'
      memcpy(&k, key, key_size);
      ^~~~~~
   kernel/bpf/hashtab.c: In function '__htab_map_lookup_elem_u64':
   kernel/bpf/hashtab.c:810:17: note: 'k' declared here
      unsigned long k = 0;
                    ^


vim +15 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  13  
70a6fcf3283a0a Al Viro 2016-01-17  14  #define __HAVE_ARCH_MEMCPY
70a6fcf3283a0a Al Viro 2016-01-17 @15  #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
70a6fcf3283a0a Al Viro 2016-01-17  16  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
