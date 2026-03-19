Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666FC3A3838
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905661; cv=none; b=lrzyHxY77YJYImRAmgbn5cZkK2M7M+qH9HlIppDCdst9RQcxnckT9wqqyrX2d/BkRqqNDFGxfZS1VSegr48GHVCBjvPTxAbtZSu1mLJqCzyXCP+ekI71imsz2XM8svdztxu8pliWyIc1WH8rFDMGIpjih2XXVXeYEDmmGT6Rcbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905661; c=relaxed/simple;
	bh=GexxD+lhSM5Xws61Mi3Ev9oLrKsQjv5ejlevmLaPlX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uuIQK2eGoe+9uGUKpMDZo9qrVjMn4fcxmIC2NOxQA1olUwl1r7jes5vHFouiuh3LZ9zCklzHci7oDdphaBEQDoAZ2hgHSufnBa0kktFh63B3b2VRduUBiUSLKNeiISv2P+pm5o9K+0G7c59LhzgCRK3F5lNjRHTEEbKc01djFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUIvNcHB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUIvNcHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773905659; x=1805441659;
  h=date:from:to:cc:subject:message-id;
  bh=GexxD+lhSM5Xws61Mi3Ev9oLrKsQjv5ejlevmLaPlX4=;
  b=MUIvNcHBP8I4HkqaAhR85lv9gPJpDMUbPyLVyng5wWILsYFcH0wHp+bC
   JTijY1TGqQz/p6kSyt5awBrtZEi4JoQwdZmtcqY4uY7UllGrZKMNw0SN+
   ORtP5wWwlvw0iuPomGIcs7RF+bFYo9peTvdBOGcmc9AqBteNSGJ7by1+K
   dXdBJ/am3GVlmTpgYt9thSaOlsXhEU6O0aZo8mQiz3MAhO5UAbxoYJkEp
   h84iBscV8VXcHyEqBCfA/R289ChnWAMHFZ8cfPw6nzywAj7HbS5zILG+I
   zApOLNYTQ896myecaZplNaT/MA4g04UKvtDNZD1e1mh+QvUyPfO5kXqXq
   w==;
X-CSE-ConnectionGUID: kWqtQLDZQiS9v9od2ijytQ==
X-CSE-MsgGUID: tHcblbyiQfiINTPQKioc9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75004014"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75004014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:34:18 -0700
X-CSE-ConnectionGUID: QBxocix1TYeps+Og6kcDFQ==
X-CSE-MsgGUID: FMbg/TS6Q0SXmFzbgvD3NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="245907604"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2026 00:34:17 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w37tX-000000004nN-2Ria;
	Thu, 19 Mar 2026 07:34:15 +0000
Date: Thu, 19 Mar 2026 08:34:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:intel-6.6-turbostat-20251202-ANBZ29699
 244/244] diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or
 directory
Message-ID: <202603190825.StD85oMs-lkp@intel.com>
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
TO: aubrey.li@linux.intel.com

Hi Ingo,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-turbostat-20251202-ANBZ29699
head:   620dcaf654cffcc62ad2b00dc312eb49a59a4471
commit: 0028489c58bea4559be1ef503b566d40157b5d02 [244/244] x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260319/202603190825.StD85oMs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190825.StD85oMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603190825.StD85oMs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
