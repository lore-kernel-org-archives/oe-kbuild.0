Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EEA320CD3
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781315478; cv=none; b=hObmtx6c2vGdiXFCvLvS6ipvk69leQREm5kCYmrOlj6YxNGYgyisK7um4GNnj6/S5ni8fOuigDiB0b6GVcT+lXE07E4zYzZyI/7hruzxNWzi1/ge9Nv1eIAqstO+PiiwCS2qXV+reNCf6cfTDSJ17AlDfKnZY3W82V/dIJIvckA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781315478; c=relaxed/simple;
	bh=CwaWofDj7yvMXpNcv/0LjkOpHxwwi/IMfSu2jBerfEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iKPE/H3UqOxtD+NtJnWQUpDcyZsepsylpyfkU3RoMBWWNrmWcjT550/DkbpltFJ36tXiDECNxN82xMMo1rSDsM1XeZmg4mXl2xtoRCPRgjO4CXgg1YSEqJfQCaC1LIC3FoLl8D+CTqgGcnCPoCpUWNlbgfSMjhlfN2M/R0+TkAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWQ/Mdty; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWQ/Mdty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781315477; x=1812851477;
  h=date:from:to:cc:subject:message-id;
  bh=CwaWofDj7yvMXpNcv/0LjkOpHxwwi/IMfSu2jBerfEI=;
  b=OWQ/MdtyCl+7jBRY/LmJcstNHY4Nodb8XhVKemUlHJ0ejqTBHYhuvN4r
   eDkKuf5a5GaAI82GOswS0ffiopDA4MjGvWGJCxgvGUrTDa1WSLUtJxKY+
   DYIIPP3wAzFig/uCATm02fGgjj50Xc9OY9aqI1toiq0OTJMGgYoPWr2SD
   Zx7Q2AGJwgCm9PtrWNxn8IAheN7SeHEQDjoZTBg8kq9TYFjYB2sjYOTSv
   2nAegKNnHp1iR/mVGopAYYz4xU0hPyLlSxLXXeluBE3qLZDwx1cgm5lNI
   Hjh9A9XykBovq5xpHj3SATsIIUGQ3Kg5J2zlraHfnEx/IlDbUkJz7dg5X
   g==;
X-CSE-ConnectionGUID: MpxH1hOHRjmzjnom5eNQSg==
X-CSE-MsgGUID: ew1Po6yTR2G8kL8BFTxV3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85784342"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="85784342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 18:51:17 -0700
X-CSE-ConnectionGUID: kp5ZZiGxSdeCbRogkgzCMQ==
X-CSE-MsgGUID: 8Yn97q5vSoymntgMGgmrfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="277164786"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 18:51:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYDWj-000000004On-0KHg;
	Sat, 13 Jun 2026 01:51:13 +0000
Date: Sat, 13 Jun 2026 03:50:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/android_v 1/1] ncdevmem.c:398:55: warning:
 format '%llu' expects argument of type 'long long unsigned int', but argument
 2 has type '__u64' {aka 'long unsigned int'}
Message-ID: <202606130333.xGD2LPjp-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 6.12/android_v
head:   68a638ff668a1d42dda25aab102975b86d6fc10b
commit: 85585b4bc8d80095a825028e2088b568035ac467 [1/1] selftests: add ncdevmem, netcat for devmem TCP
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 9 months ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260613/202606130333.xGD2LPjp-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130333.xGD2LPjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 85585b4bc8d8 ("selftests: add ncdevmem, netcat for devmem TCP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130333.xGD2LPjp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ncdevmem.c: In function 'do_server':
>> ncdevmem.c:398:55: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     398 |                         printf("received frag_page=%llu, in_page_offset=%llu, frag_offset=%llu, frag_size=%u, token=%u, total_received=%lu, dmabuf_id=%u\n",
         |                                                    ~~~^
         |                                                       |
         |                                                       long long unsigned int
         |                                                    %lu
   ncdevmem.c:398:76: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     398 |                         printf("received frag_page=%llu, in_page_offset=%llu, frag_offset=%llu, frag_size=%u, token=%u, total_received=%lu, dmabuf_id=%u\n",
         |                                                                         ~~~^
         |                                                                            |
         |                                                                            long long unsigned int
         |                                                                         %lu
     399 |                                dmabuf_cmsg->frag_offset >> PAGE_SHIFT,
     400 |                                dmabuf_cmsg->frag_offset % getpagesize(),
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
         |                                                         |
         |                                                         __u64 {aka long unsigned int}
   ncdevmem.c:398:94: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     398 |                         printf("received frag_page=%llu, in_page_offset=%llu, frag_offset=%llu, frag_size=%u, token=%u, total_received=%lu, dmabuf_id=%u\n",
         |                                                                                           ~~~^
         |                                                                                              |
         |                                                                                              long long unsigned int
         |                                                                                           %lu
   ......
     401 |                                dmabuf_cmsg->frag_offset, dmabuf_cmsg->frag_size,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~                                       
         |                                           |
         |                                           __u64 {aka long unsigned int}
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: tools/testing/selftests/net/libynl.a(ynl.o): Relocations in generic ELF (EM: 62)
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: tools/testing/selftests/net/libynl.a(ynl.o): Relocations in generic ELF (EM: 62)
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: tools/testing/selftests/net/libynl.a(ynl.o): Relocations in generic ELF (EM: 62)
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: tools/testing/selftests/net/libynl.a: error adding symbols: file in wrong format
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
