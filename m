Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14B4C6D
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 01:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721008141; cv=none; b=I5Mc1pPCUfLrOYvQQNAs2weUtUutwW/UKHUF1huiW0gglQnnGj/eVuFye4yDxFAhbydYEm51SYTOnvBkLhRVITxac1m7znZFl4N2VX7MFqrdXIFEoGTC0gmMvVjEwdecarju1JhjblMqygexf16qCTXPZennTCTlXzbmoVez484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721008141; c=relaxed/simple;
	bh=ct9l7SvN0cTPklTOlAeWdwJ8RnQwfpDBlTbr5o6yX+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adRP3PvL2Ew70awlYA37OdbG41fXXiIGwyjYb1smkPZkIOti3TgxCqGaVmBGcYKJPCD5WlYVkL1uo+Qk1rufobC0FkhBsco1gbi7ZTRQTXDbyKZjgqo67/DW1zj/gWtfXdE04jilGK47SiLbYFF0TbaQxAgHbAeNPhzJ67ECBmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmV56EUT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmV56EUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721008139; x=1752544139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ct9l7SvN0cTPklTOlAeWdwJ8RnQwfpDBlTbr5o6yX+U=;
  b=FmV56EUTsas7uIXLNAck1esK7Tk2Vp6HN7B9uFQ8ysD6zotKSIW2bvzS
   kbHEDnIEKEdhzpUlvz7hdp8eXXQDJ1/t7CwoUnETnYHdksfzp1+H05cMp
   MRnybSVXRgaY93ejSercfn1SFnMDyVqRbQTc25Z2pJwk+p6IQOSsLj6iG
   +EWBgpCe045dW9CThFqcCEsgHljd+P3zhteCHEBrCD+zt+wKwfV7oS8/Y
   /jRGQb+kg12TLMaxla8DoW/hMDWXCu2CHF2ezlXBMIESqG9r6W6YxHNT5
   IIA/DG1EPmb8rUJVX9G+DmDFYO664ZJVKsuL60DA341byL1/71c+ETyeA
   g==;
X-CSE-ConnectionGUID: mTMRvdFPSRmVWPOe1QItzQ==
X-CSE-MsgGUID: IUFxMzgBSRGm5fhDfbZilg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="28976286"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="28976286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 18:48:58 -0700
X-CSE-ConnectionGUID: hI+HWqePSuugCdPlM5enjg==
X-CSE-MsgGUID: WusGLoT1QRSkudYZzpbk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="54388757"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jul 2024 18:48:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTApj-000drm-0W;
	Mon, 15 Jul 2024 01:48:55 +0000
Date: Mon, 15 Jul 2024 09:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 35/38] lib/math/div64.c:219:25: sparse:
 sparse: division by zero
Message-ID: <202407150910.Xp56C1Ju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/math/div64.c:219:25: sparse: sparse: division by zero"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nicolas Pitre <npitre@baylibre.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   8f9dade5906a8da18aa33bb35aff52f619a1b7aa
commit: 79276c254b6ca4e064431027eb3d62dd62e26d19 [35/38] mul_u64_u64_div_u64: avoid undefined shift value
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-061-20240714 (https://download.01.org/0day-ci/archive/20240715/202407150910.Xp56C1Ju-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150910.Xp56C1Ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407150910.Xp56C1Ju-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/math/div64.c:219:25: sparse: sparse: division by zero

vim +219 lib/math/div64.c

e4e9f524e7b1a8 Nicolas Pitre 2024-07-07  214  
79276c254b6ca4 Nicolas Pitre 2024-07-12  215  	/* make sure c is not zero, trigger exception otherwise */
79276c254b6ca4 Nicolas Pitre 2024-07-12  216  #pragma GCC diagnostic push
79276c254b6ca4 Nicolas Pitre 2024-07-12  217  #pragma GCC diagnostic ignored "-Wdiv-by-zero"
79276c254b6ca4 Nicolas Pitre 2024-07-12  218  	if (unlikely(c == 0))
79276c254b6ca4 Nicolas Pitre 2024-07-12 @219  		return 1/0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
