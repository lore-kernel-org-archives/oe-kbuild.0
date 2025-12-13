Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A72BD024
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645958; cv=none; b=QX1rosuvDRMk2dsuJH4Hwuuj3nfwEzfqGti4GtSmP+K/q0mnBdISGAdfJSM28PXYl6E2IKja/VpV8hI/fgXsn/5GZHGV1EQ88ykkFFuMvjB73dHOdrGbJjaDOKqG8Q8w+VUqN/EQMjPYXUXlTYlwCx1spVmXMJVLs9Qmvflw1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645958; c=relaxed/simple;
	bh=kL3j9f710ds+e51hzLSwe1FMmJJWQi4GKzYHbpll3QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TlEj6wouQlN1Ied7gF70P8WDFcuGLySBSP7+zFYNFBF0MmEc6zu4Nd5JptydVTJoCHrqLxiD5STYt0EtElSNOm3WWtuAIVONDxGSuD0XT4N0uzeyZKx42w6iv1JrEkFND90p7XfGGeJXbU3bv2+zmrf7hfHDR5QvAL9nzB8tS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=got1kXf6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="got1kXf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765645956; x=1797181956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kL3j9f710ds+e51hzLSwe1FMmJJWQi4GKzYHbpll3QE=;
  b=got1kXf6NAdNu9zMbOtw2+dfLB/17/8ulQbxh2K/Ct+xr6BOapmeFwYC
   RPf49sJNqlTc6vz67hAu8OeiXbYNbO43BbfWaGu83IdpfqoiUvWr/QO9Y
   wOZUWYpwHnXG10AnBZYk4M9b2ZcTdNpykx1HgIpixMdG0ofiuaIyk8zB0
   XMFkTVkMHXvCy1uBtytbKEbKTtVUp3GxOlgJbyBYqbUxvjoNO8pnCDBFc
   WRzjT4uU0Kg5KSzspLVAmCxgWaFeBZ4EaShiEiFSoEjUcMGoq+gETrETc
   QKBiCSbSpeprz1D2unKJhq1vhsL6xgutImW84gb01QRfpJDRRjQqliLCR
   A==;
X-CSE-ConnectionGUID: v27VmaVTS6GyepWUoQgE4w==
X-CSE-MsgGUID: idOD4F7GTO+XObkUl8cY6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78256656"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78256656"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:12:35 -0800
X-CSE-ConnectionGUID: Wy4D2XfjQMq4r0PGQ32vTw==
X-CSE-MsgGUID: jy836KkFSDiAOkxPfzatdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196622718"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 09:12:34 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTAV-0000000028O-1qCX;
	Sat, 13 Dec 2025 17:12:31 +0000
Date: Sat, 13 Dec 2025 18:11:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1942/1942] str_error.c:3:10: fatal
 error: string.h: No such file or directory
Message-ID: <202512131819.YzGFDlUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 6d41907c630d3196be89c9ed5a7f8258486b3eaf [1942/1942] tools lib bpf: Provide wrapper for strerror_r to build in !_GNU_SOURCE systems
:::::: branch date: 10 hours ago
:::::: commit date: 7 years ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131819.YzGFDlUS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131819.YzGFDlUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512131819.YzGFDlUS-lkp@intel.com/

All errors (new ones prefixed by >>):

   bpf.c:24:10: fatal error: stdlib.h: No such file or directory
      24 | #include <stdlib.h>
         |          ^~~~~~~~~~
   compilation terminated.
   libbpf.c:26:10: fatal error: stdlib.h: No such file or directory
      26 | #include <stdlib.h>
         |          ^~~~~~~~~~
   compilation terminated.
   nlattr.c:14:10: fatal error: errno.h: No such file or directory
      14 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   cat: tools/testing/selftests/bpf/.bpf.o.d: No such file or directory
   make[3]: *** [tools/build/Makefile.build:97: tools/testing/selftests/bpf/bpf.o] Error 1
   cat: tools/testing/selftests/bpf/.libbpf.o.d: No such file or directory
   make[3]: *** [tools/build/Makefile.build:97: tools/testing/selftests/bpf/libbpf.o] Error 1
   btf.c:4:10: fatal error: stdlib.h: No such file or directory
       4 | #include <stdlib.h>
         |          ^~~~~~~~~~
   compilation terminated.
   cat: tools/testing/selftests/bpf/.nlattr.o.d: No such file or directory
   make[3]: *** [tools/build/Makefile.build:97: tools/testing/selftests/bpf/nlattr.o] Error 1
   libbpf_errno.c:23:10: fatal error: stdio.h: No such file or directory
      23 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
   cat: tools/testing/selftests/bpf/.btf.o.d: No such file or directory
   make[3]: *** [tools/build/Makefile.build:97: tools/testing/selftests/bpf/btf.o] Error 1
>> str_error.c:3:10: fatal error: string.h: No such file or directory
       3 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.
   cat: tools/testing/selftests/bpf/.libbpf_errno.o.d: No such file or directory
   make[3]: *** [tools/build/Makefile.build:97: tools/testing/selftests/bpf/libbpf_errno.o] Error 1
   cat: tools/testing/selftests/bpf/.str_error.o.d: No such file or directory
   make[3]: *** [tools/build/Makefile.build:97: tools/testing/selftests/bpf/str_error.o] Error 1
   make[3]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
