Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8442ABE
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 02:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729131426; cv=none; b=NhdubPXMnIk5VgIcnpo//G7kdvD/qDvbMqu3y+SQwFvhGftoHdPsTLd2zDGHi1eypt6YyGsAiFayBkwMwWNpJyKazZ+DXVOt5MowjncHLb4X7a5WZjBplJGNo67mxSddJJUWPITC8241y2PBZVm3SFJaHkkshS0O2caJbG1/SBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729131426; c=relaxed/simple;
	bh=In5L9gGXVHOJzqib+Q6CtQRH39ddYZAlfm+JlEpApk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMPGsyHkNrpU7+K44D6900i7pMFBQxUU2yOjeW/2Y06fKxFzEo51lX2fMZkR/4IYl9PqYs6nAM8LB7/adDh8vHWz+bgE/ioLJF3Jj+e2VT8cRuglwOm+AKk3klWWEE+nTNcB0GrIvtX2zoev32r3VJAdbnTwmPCfbWwBwEX3Jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMEb7lLZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMEb7lLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729131424; x=1760667424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=In5L9gGXVHOJzqib+Q6CtQRH39ddYZAlfm+JlEpApk4=;
  b=aMEb7lLZHIstV4jP/IkVA990xcy9+ZmP+Iq6wNCZp3pAvP6+JwUdVzlQ
   Ju27XTrLibWOdQHcYFQ3+z0g43a9q99f9W2opTGBr2ySNuTerxBLwFIW/
   m+608hFvzHUEBiPZfuFjSUH1QzPkRRwHM7/VDfEEtwdalGJNSXEkYHeE+
   VjF37hb0b9LhHuHAe6YcwTxra/FzCH7/EVXWdsVscbIljCWs4DiabO3my
   XQ7PtKVI8JjvCoBweoxdoJs0ts/iW/B/Ahk5Ur+qYlmT9LeG7SsJ/rSXH
   7+qLp2nlrr/8hbbpMY3QwJrEUE8pRh0tj/aQkmWwfDWbboAIuBq3frugA
   w==;
X-CSE-ConnectionGUID: 1oTZ2WyASx655gywE+55ow==
X-CSE-MsgGUID: 8TksUcRFQGKqYDtzabpQsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51146537"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51146537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 19:17:03 -0700
X-CSE-ConnectionGUID: 54T8BIjFR6e/pDAue2hc4w==
X-CSE-MsgGUID: ZrU4uHO8T7CR+xmjlHl7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="78431033"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Oct 2024 19:16:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1G4H-000Ld5-39;
	Thu, 17 Oct 2024 02:16:49 +0000
Date: Thu, 17 Oct 2024 10:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/coco/core.c:128 cc_mkenc() warn: bitwise AND condition is
 false here
Message-ID: <202410171005.EqBeyT5k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c964ced7726294d40913f2127c3f185a92cb4a41
commit: 54f5f47b6055c6b57cbc41a440f8ca8b2ec4275a x86/kvm/Kconfig: Have KVM_AMD_SEV select ARCH_HAS_CC_PLATFORM
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241016 (https://download.01.org/0day-ci/archive/20241017/202410171005.EqBeyT5k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410171005.EqBeyT5k-lkp@intel.com/

smatch warnings:
arch/x86/coco/core.c:128 cc_mkenc() warn: bitwise AND condition is false here
arch/x86/coco/core.c:144 cc_mkdec() warn: bitwise AND condition is false here

vim +128 arch/x86/coco/core.c

655a0fa34b4f7a Kirill A. Shutemov    2022-02-22  116  
b577f542f93cbb Kirill A. Shutemov    2022-02-22  117  u64 cc_mkenc(u64 val)
b577f542f93cbb Kirill A. Shutemov    2022-02-22  118  {
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  119  	/*
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  120  	 * Both AMD and Intel use a bit in the page table to indicate
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  121  	 * encryption status of the page.
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  122  	 *
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  123  	 * - for AMD, bit *set* means the page is encrypted
812b0597fb4043 Michael Kelley        2023-03-26  124  	 * - for AMD with vTOM and for Intel, *clear* means encrypted
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  125  	 */
3d91c537296794 Borislav Petkov (AMD  2023-03-18  126) 	switch (cc_vendor) {
b577f542f93cbb Kirill A. Shutemov    2022-02-22  127  	case CC_VENDOR_AMD:
812b0597fb4043 Michael Kelley        2023-03-26 @128  		if (sev_status & MSR_AMD64_SNP_VTOM)
812b0597fb4043 Michael Kelley        2023-03-26  129  			return val & ~cc_mask;
812b0597fb4043 Michael Kelley        2023-03-26  130  		else
b577f542f93cbb Kirill A. Shutemov    2022-02-22  131  			return val | cc_mask;
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  132  	case CC_VENDOR_INTEL:
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  133  		return val & ~cc_mask;
b577f542f93cbb Kirill A. Shutemov    2022-02-22  134  	default:
b577f542f93cbb Kirill A. Shutemov    2022-02-22  135  		return val;
b577f542f93cbb Kirill A. Shutemov    2022-02-22  136  	}
b577f542f93cbb Kirill A. Shutemov    2022-02-22  137  }
b577f542f93cbb Kirill A. Shutemov    2022-02-22  138  
b577f542f93cbb Kirill A. Shutemov    2022-02-22  139  u64 cc_mkdec(u64 val)
b577f542f93cbb Kirill A. Shutemov    2022-02-22  140  {
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  141  	/* See comment in cc_mkenc() */
3d91c537296794 Borislav Petkov (AMD  2023-03-18  142) 	switch (cc_vendor) {
b577f542f93cbb Kirill A. Shutemov    2022-02-22  143  	case CC_VENDOR_AMD:
812b0597fb4043 Michael Kelley        2023-03-26 @144  		if (sev_status & MSR_AMD64_SNP_VTOM)
812b0597fb4043 Michael Kelley        2023-03-26  145  			return val | cc_mask;
812b0597fb4043 Michael Kelley        2023-03-26  146  		else
b577f542f93cbb Kirill A. Shutemov    2022-02-22  147  			return val & ~cc_mask;
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  148  	case CC_VENDOR_INTEL:
41394e33f3a0ce Kirill A. Shutemov    2022-04-06  149  		return val | cc_mask;
b577f542f93cbb Kirill A. Shutemov    2022-02-22  150  	default:
b577f542f93cbb Kirill A. Shutemov    2022-02-22  151  		return val;
b577f542f93cbb Kirill A. Shutemov    2022-02-22  152  	}
b577f542f93cbb Kirill A. Shutemov    2022-02-22  153  }
b577f542f93cbb Kirill A. Shutemov    2022-02-22  154  EXPORT_SYMBOL_GPL(cc_mkdec);
99485c4c026f02 Jason A. Donenfeld    2024-03-26  155  

:::::: The code at line 128 was first introduced by commit
:::::: 812b0597fb4043240724e4c7bed7ba1fe15c0e3f x86/hyperv: Change vTOM handling to use standard coco mechanisms

:::::: TO: Michael Kelley <mikelley@microsoft.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
