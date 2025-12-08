Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2093101DA
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190569; cv=none; b=gybR/dBSXtfiGAmRp6Lrsd2QTcOLf2/76WH7HcKcMfwJnes49Vr9/T5FOQ2MEzMeswSpS09R7I1FcKVrhiVt2cnqokFpMSTsewJ4/UI5IHQ6jeLirWp6Y8xrevhvYxMqylJZNCogmrUoQiIb+/yiKHkmV+c4+QKuFcQpby1z/qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190569; c=relaxed/simple;
	bh=3Ogg/52vHkcfQKGzFdQ9aTCI1BM70YvhiBgTWrsRFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXHIg350iQkDyPv18GOEEF33uQ8y44PtSwm+4jCOqwBe7hfz5wa+89TkzOBFseyyVjA8ZvOVkbfIFnyi/Hi+2Ov0i0I3qhg7Mk4+vQlPOQUxzo4LDWrOL0vbAQJALjDixYUkCArdqbhwlN7eTIYBf/ObFtwUgLQ+m6Zm2pO6occ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ny/UpKnK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ny/UpKnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765190567; x=1796726567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Ogg/52vHkcfQKGzFdQ9aTCI1BM70YvhiBgTWrsRFoA=;
  b=Ny/UpKnKQy6A84YNUY8+MCnstp1UQfRmoQUnO8CaSVYpp5wQxHGTdN/1
   yRQo7YNwVRgIA6xb8yCGHuhqNcUQBTl/iIgU2K5GqX0hN0n2/6rnJ/FS4
   HTUsHD6v8VrsCWucixCEoHrz5JNbwRihRiJQSTlz5kxthOBphc7NBsxOH
   KCQCcgR15l2LFLS6RTyDPCwa4QxNxyiOivkugpb9EXk8qP10M+zJMBaa9
   xtSib0mCORlFzX/P26TD93wiwukGgB7HodMdKUVr/pPDFWl5riTTcOy68
   3zl2CfNyklKeGjmaZfQtQLikcRaZar7luAR3eFNTbM4Gz004TP6F+at8A
   A==;
X-CSE-ConnectionGUID: fajVxGXMR+S6o0Q5+BQY8w==
X-CSE-MsgGUID: GPvhG2xZSheIIHhvwoZqhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="54669451"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="54669451"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 02:42:45 -0800
X-CSE-ConnectionGUID: FjXFN6Y9TGGjEwDMK7L9QQ==
X-CSE-MsgGUID: vz+WI0uWTrGFb4Zn0IcxYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="195704013"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 02:42:44 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSYhV-0000000003t-2E6r;
	Mon, 08 Dec 2025 10:42:41 +0000
Date: Mon, 8 Dec 2025 11:41:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11884/13721] ../../kselftest.h:53:10: fatal
 error: errno.h: No such file or directory
Message-ID: <202512081128.mJTpPbUS-lkp@intel.com>
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
TO: Deepak Gupta <debug@rivosinc.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Charlie Jenkins <charlie@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: 0f226cf6026f3756022e387a869c031add683365 [11884/13721] kselftest/riscv: add kselftest for user mode cfi
:::::: branch date: 9 hours ago
:::::: commit date: 11 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512081128.mJTpPbUS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081128.mJTpPbUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512081128.mJTpPbUS-lkp@intel.com/

Note: the linux-next/master HEAD 82bcd04d124a4d84580ea4a8ba6b120db5f512e7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from cfitests.c:3:
>> ../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   In file included from shadowstack.c:3:
>> ../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
