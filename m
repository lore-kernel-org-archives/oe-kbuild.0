Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5A25F984
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737098; cv=none; b=mF0vTGbhVclyorBD3KhnpjfndJ4nI/ZXdRnb6/ZDHEXTHwns+6f67zmugjlRjtVkdQhH/k00MUi0cluwx2JzvgImt0lwplk7GaV7kW48OocbIzcbFUAXqVpVNYzhTACP18iUhPA3/ReNF+EsP4sMH2OMVQ3L4ah7uzrAz2yVZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737098; c=relaxed/simple;
	bh=G3nvhzLiWWrpb17WzVjls1Ks6rf4s1iIJOLDs4YjG6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RJ4DeU6ktzICriuXbOm30AOR2SjHXTKsqJqhAQas5+TboqjdnjgsGESQKY+MyL/DeG6fuNMwGKdi/DcgdGOvDJH2/R7ewDPbVw3uRP/GJ9gZAdDhATskZpzpBgPb/hb58/dVS3+wF+k2vKlRim/Mm2bVtAkAABy159vS8/BqIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEZcbsPh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEZcbsPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780737096; x=1812273096;
  h=date:from:to:cc:subject:message-id;
  bh=G3nvhzLiWWrpb17WzVjls1Ks6rf4s1iIJOLDs4YjG6s=;
  b=FEZcbsPhQxTCF/ol+7hOnfVwPVGbMPle95dKD4wSVB07zooaJYTqk+V5
   sr03ouB1aZzwzqIhOucBOpd7h0+x0a4JPjlr4AE262dOu+xveKxG9TB97
   oI0Fh0Dvn0okNsCe9QUVWn1e/OBtApDfiQgc3qDHCX3nUM4y4/CgFLr75
   22s8bVyAtN256+VKHHDXIpK4xekt2ix52I9m90N8avVrZqW/+8xZIUXd9
   M9Vfb2O1ZLZOAjwfVva/LFLG1+2YVMqmPeS4sCUV1O1zdpmudTGj4xpac
   kLs3K8AknesTUD1NAIEXEOecDiINnCDiPnKivfwkHIN9FrJ3mtAS5FSST
   w==;
X-CSE-ConnectionGUID: IlyoeOCcQxqlTrAmXT9oQA==
X-CSE-MsgGUID: 0/FjyqnVRBafj2o/NU3fKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="84133406"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="84133406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 02:11:35 -0700
X-CSE-ConnectionGUID: KSl3mJBqSj2TL2ZN0/Iwsg==
X-CSE-MsgGUID: vPVYK+VKQvStLfHx1N6JQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="248980363"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Jun 2026 02:11:34 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVn3z-000000002oD-1uWf;
	Sat, 06 Jun 2026 09:11:31 +0000
Date: Sat, 06 Jun 2026 11:11:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8] progs/hid.c:487:18:
 error: incompatible pointer types passing 'struct bpf_wq *' to parameter of
 type 'struct bpf_wq___not_used *'
Message-ID: <202606061101.dICGZpY1-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   468e09dd6f52610d73a09cbbb28a2e7d4b940431
commit: 9cd1005cecfcc92143e4c64f11864a9606038524 [8/8] selftests/hid: fix compilation when bpf_wq and hid_device are not exported
:::::: branch date: 13 hours ago
:::::: commit date: 2 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260606/202606061101.dICGZpY1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606061101.dICGZpY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606061101.dICGZpY1-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 468e09dd6f52610d73a09cbbb28a2e7d4b940431 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:126:12: error: conflicting types for 'bpf_wq_init'
     126 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:111703:12: note: previous declaration is here
    111703 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
           |            ^
   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:127:12: error: conflicting types for 'bpf_wq_start'
     127 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:111705:12: note: previous declaration is here
    111705 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
           |            ^
   In file included from progs/hid.c:3:
   progs/hid_bpf_helpers.h:128:12: error: conflicting types for 'bpf_wq_set_callback_impl'
     128 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:111704:12: note: previous declaration is here
    111704 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq, int (*callback_fn)(void *, int *, void *), unsigned int flags, void *aux__ign) __weak __ksym;
           |            ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq___not_used *' [-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   tools/testing/selftests/hid/tools/include/vmlinux.h:111703:39: note: passing argument to parameter 'wq' here
    111703 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
           |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq___not_used *' [-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   tools/testing/selftests/hid/tools/include/vmlinux.h:111704:52: note: passing argument to parameter 'wq' here
    111704 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq, int (*callback_fn)(void *, int *, void *), unsigned int flags, void *aux__ign) __weak __ksym;
           |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq___not_used *' [-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   tools/testing/selftests/hid/tools/include/vmlinux.h:111705:40: note: passing argument to parameter 'wq' here
    111705 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
           |                                        ^
   6 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
