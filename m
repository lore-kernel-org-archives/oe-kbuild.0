Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130926F47D
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804087; cv=none; b=eT6uGLaquqpSzQlGG1mt58p3hrGx7ri4HuS3eHI/IUEQ0H526EGW5sVVZlBp0wMpQmIONymGaYAmz2Re242F10s66Ot9X8WjRhNGKTpiYdL1LT+P9eXiK0j2wHHBknFGU62MzsQjvydnTnH57UXoAU7Bu8YMRZRswS7XlFaw+RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804087; c=relaxed/simple;
	bh=SmXQNXNYP9/CSbPRAJhkC3TOu3MeoEPrlCxdSSknDrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DtZxr6gOXsEi7Dwaq5Ly1Q+pOtjobzd1ixGs/gCg+ObLN1oyTOrlm4FpFTVeEBZtdy8C/8EeEUAFgu5RPBuR6zpfS/mVtj+Z9+jy145Vz9OsfoWEK9Cj/Hsp+CzcQ1a9w5k372VN+QwMdPnDo7ITZeaWO7CLQFos23/EY+yaXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCoe0PR3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCoe0PR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770804086; x=1802340086;
  h=date:from:to:cc:subject:message-id;
  bh=SmXQNXNYP9/CSbPRAJhkC3TOu3MeoEPrlCxdSSknDrM=;
  b=RCoe0PR3vzIxW1C/0KS2z4kiY54j6eyfR5JsEwfHVgzxnxypRn7hNmCj
   83bfLvZHUhU34pADLOXKkOP3ut478Dp9zMB5L6MpF2NwDdBbZjUGhJ8ak
   8k+B+RImUKWPFWFr+ruN6XAmQjErJEEBfrQ/D6iNE/jrQw5vn2QYowjOo
   49apfvZDUEIVVJ1E/EP33Y4m/V+3Ugg75YrYgffqTH5txO8GHEMSikDyr
   5VnKYbmfbgk4B4cxwHnEsaxyYL2pM3CO9Cser85TWt16paPyMLiYtopYP
   mSrTfn1ASIV68mr5mUN7F+Ej8dq/MqLk+CpERjW6djOno4TEPdQQWEghY
   Q==;
X-CSE-ConnectionGUID: XI3NP8mAQF+dR1cXvX8H4w==
X-CSE-MsgGUID: y13kEQjPRlmTfmxU+Vwr8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="59516506"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59516506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 02:01:25 -0800
X-CSE-ConnectionGUID: E8NY2OlCTqGxCvDlqHBxrQ==
X-CSE-MsgGUID: 3QOivqokTb6gyHuVyN7esw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="235186877"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 02:01:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq72A-0000000013N-1yJk;
	Wed, 11 Feb 2026 10:01:22 +0000
Date: Wed, 11 Feb 2026 11:00:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9592/12487] ../../kselftest.h:53:10:
 fatal error: errno.h: No such file or directory
Message-ID: <202602111117.TGkw9BQk-lkp@intel.com>
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
TO: Deepak Gupta <debug@rivosinc.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Charlie Jenkins <charlie@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd9678829d6dd0c10fde080b536abf4b1121c346
commit: d30c1683aaecb93d2ab95685dc4300a33d3cea7a [9592/12487] kselftest/riscv: add kselftest for user mode CFI
:::::: branch date: 12 hours ago
:::::: commit date: 13 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111117.TGkw9BQk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111117.TGkw9BQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602111117.TGkw9BQk-lkp@intel.com/

Note: the linux-next/master HEAD fd9678829d6dd0c10fde080b536abf4b1121c346 builds fine.
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
