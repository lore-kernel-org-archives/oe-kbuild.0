Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31B3BED4D
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645675; cv=none; b=ALhpExOaQWCKpmH2myU+tQl8JHOTE6+XSTieV6lE3TjwomZO4XzzMThHZjnDCyPhPRJpG60n/5aXD14j3u7UvWS0nEmG4BJjyG35zsS7Gd983T7svKUd9L2SHyMjwnbvkTodDejZe0VwBlWqLONI4Svsz4WXQg0WBqwsknkbTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645675; c=relaxed/simple;
	bh=eFAsljY7werVyZ3RdtXIq5ag+QO7oZiLiPJDim0accU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bmrHnrBKfMcm2cE5eb53WxQfL9YhCOXgejOKPGg1zkjkMxPGRvbfm4Z4Korn5yskMsl5WbgdnYsAq+bo4Ida5uk62oy36z43PMqWYnMujyCkW9A4t8H31eE81ADemC2CCrg9uSpfCJIePqtyz7CDqzZn02WympspVWebZ9LO6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSs8qTU4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSs8qTU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772645673; x=1804181673;
  h=date:from:to:cc:subject:message-id;
  bh=eFAsljY7werVyZ3RdtXIq5ag+QO7oZiLiPJDim0accU=;
  b=jSs8qTU4fCJhbc9Ef/F5BKA1MPpigioAlJO3l1PM4+1eVGZkNjHLqIh0
   f6iKGeN4c3/YO4Q74fY4gpOnfIlRWxelg9VJFQ2+fnVzVA9qsvczM6GwN
   FEGQ1py0JXE9xEb6v/m/JmfynqWdY6cHeM4rAD13rA7/6Vwi8EhcJSCLG
   DCfkSKTF/qdHKkfIxpp+g4V2MhQSZ5ZZ0tob02mBF5CHV7vFP8C3MLV+p
   3Cdf4t67ElsbVVEZ7QdvjjbqcwxqjG3ZyI0kaUy1wYDZX/Os9xvitfGxT
   96RCggY5W0oyjINsD/6mZ6iEMHB6ivRjOaRi2ix/x9TLwIdZd6lq8n4gg
   A==;
X-CSE-ConnectionGUID: Tkz8su3SQQ25gxZwyn7BVA==
X-CSE-MsgGUID: Rk+JBUCtRjSZqT78gJa1Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73839509"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73839509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:34:33 -0800
X-CSE-ConnectionGUID: snu18UZZTZaVN3GL/SJGPg==
X-CSE-MsgGUID: 2EWmc3gNQiWHL6KY8CUTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222904306"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2026 09:34:32 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxq7B-000000001kn-2z8s;
	Wed, 04 Mar 2026 17:34:29 +0000
Date: Wed, 04 Mar 2026 18:34:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:upstream-linux-6.12.y 955/955]
 ../../../mm/vma.c:329:9: error: implicit declaration of function 'vma_close';
 did you mean 'SYS_close'?
Message-ID: <202603041857.pcya8dvg-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: 4080ef1579b2413435413988d14ac8c68e4d42c8 [955/955] mm: unconditionally close VMAs on error
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260304/202603041857.pcya8dvg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041857.pcya8dvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603041857.pcya8dvg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from vma_internal.h:26,
                    from vma.c:8:
   ../../include/linux/mm.h: In function 'virt_to_phys':
   ../../include/linux/mm.h:31:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      31 |         return (phys_addr_t)address;
         |                ^
   In file included from vma.c:23:
   ../../../mm/vma.c: In function 'remove_vma':
>> ../../../mm/vma.c:329:9: error: implicit declaration of function 'vma_close'; did you mean 'SYS_close'? [-Wimplicit-function-declaration]
     329 |         vma_close(vma);
         |         ^~~~~~~~~
         |         SYS_close

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
