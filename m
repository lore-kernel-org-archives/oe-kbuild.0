Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055EE2F7F07
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791754454; cv=none; b=Yjtl8rSJruulAsZY4Npx1qqd5ELjS+xuUKbC0EHzpwQttpZ6UdQt/g7jTljj7nB5bWbbumAKylcHgdk5s7Og8q0P2Hjx+oi9lBZYnCBP3WdFE9n/au+X0WfJVKSz+5zDlqQcEAllrqP4KW2IRVpJEcRMkBMGMQNzS6MgmGQ4Ysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791754454; c=relaxed/simple;
	bh=HPIJLV1D4A1vDh9AS8HcQiSctnZEiiUBXKr0bfzo4C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/LGuBwsBohnIIQp1ag2KVO2OpXt02tAO/4MfQLXtKSy/gv2ArK/Y0GABiGz/GK7TWQwfkzq3O+SdgaLargsbogPYUZH+wLiCnhMXE1QTZJxS/xJ+PixGZwRlNtWqJjW0jFHssy+ovY9tYUY1CP0roy0hOnFk5Qy3SjzQei7ndE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/kG96tq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/kG96tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791754452; x=1823290452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPIJLV1D4A1vDh9AS8HcQiSctnZEiiUBXKr0bfzo4C4=;
  b=Q/kG96tq1H0WorURKvpgvDXpn5a8rZ30AMTKwA6MAMebiZkxfSvwccoC
   tlr35pN0mzFw+37Lua1vVNB7mjjgKw+pnqTHmDELtaeEuOZgW+NWx3zFy
   mqbdSbTsmzJ+fYzVU/i6Vi4oyeopCxJBa/JcvTft1L6hFgphDOKUK+FfA
   v6jygGFeqiwWjD8yo5z+Q9RKGEyBdCPupsROfs2NXAoo105OmhpB2gA0T
   PXglbTCcFcUmZpUvsh5RREuhfqIrXdFJZ+jtT3H3XyziqdeTV8qy9RJKq
   OjvyLB74wpLm3YxQ/I3P7XI920O2NjhuwfNIe6SFICdUzVn4NEsd72B5n
   A==;
X-CSE-ConnectionGUID: NAKiLIqHT/CVoVnNvq7Mvw==
X-CSE-MsgGUID: TeX6lWFjRLSSggTp/KSAZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="575380"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="575380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 14:34:11 -0700
X-CSE-ConnectionGUID: c7CPoIRvQ+qETzdqvWqApQ==
X-CSE-MsgGUID: Hjy8NYIERMqHTIkKFjB2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="827276"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2026 14:34:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG1BI-00000000Amh-1EpX;
	Sun, 11 Oct 2026 21:34:08 +0000
Date: Mon, 12 Oct 2026 05:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lkdtm: Add more EFI runtime tests
Message-ID: <202610120509.XpNwjH6O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "maintainer prefers to test the version of patch actually in efi/next"
:::::: Manual check reason: "code appeared briefly on ardb's branch, may never have been submitted for review"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261011114013.1130-2-ardb@kernel.org>
References: <20261011114013.1130-2-ardb@kernel.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: linux-efi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kees@kernel.org
CC: Ard Biesheuvel <ardb@kernel.org>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.3-rc6 next-20261009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/lkdtm-Add-more-EFI-runtime-tests/20261011-134014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20261011114013.1130-2-ardb%40kernel.org
patch subject: [PATCH] lkdtm: Add more EFI runtime tests
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20261012/202610120509.XpNwjH6O-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120509.XpNwjH6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610120509.XpNwjH6O-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/lkdtm/bugs.c: In function 'efi_rt_test':
>> drivers/misc/lkdtm/bugs.c:846:34: error: 'struct efi' has no member named 'lkdtm_rt_test'
     846 |         efi_status_t status = efi.lkdtm_rt_test(id);
         |                                  ^
   drivers/misc/lkdtm/bugs.c: In function 'lkdtm_EFI_RUNTIME_WRITE_TO_RO':
>> drivers/misc/lkdtm/bugs.c:857:21: error: 'EFI_LKDTM_RUNTIME_RO_TEST' undeclared (first use in this function)
     857 |         efi_rt_test(EFI_LKDTM_RUNTIME_RO_TEST, "write to RO");
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:857:21: note: each undeclared identifier is reported only once for each function it appears in
   drivers/misc/lkdtm/bugs.c: In function 'lkdtm_EFI_RUNTIME_BRANCH_TO_NX':
>> drivers/misc/lkdtm/bugs.c:862:21: error: 'EFI_LKDTM_RUNTIME_NX_TEST' undeclared (first use in this function)
     862 |         efi_rt_test(EFI_LKDTM_RUNTIME_NX_TEST, "branch to NX");
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +846 drivers/misc/lkdtm/bugs.c

a34039981e6deb0 Ard Biesheuvel 2026-05-01  843  
c118951036e5315 Ard Biesheuvel 2026-10-11  844  static void efi_rt_test(enum efi_rts_ids id, const char *desc)
c118951036e5315 Ard Biesheuvel 2026-10-11  845  {
c118951036e5315 Ard Biesheuvel 2026-10-11 @846  	efi_status_t status = efi.lkdtm_rt_test(id);
c118951036e5315 Ard Biesheuvel 2026-10-11  847  
c118951036e5315 Ard Biesheuvel 2026-10-11  848  	if (status == EFI_UNSUPPORTED)
c118951036e5315 Ard Biesheuvel 2026-10-11  849  		pr_err("XFAIL: Test not supported on this configuration\n");
c118951036e5315 Ard Biesheuvel 2026-10-11  850  	else if (status != EFI_ABORTED || efi_enabled(EFI_RUNTIME_SERVICES))
c118951036e5315 Ard Biesheuvel 2026-10-11  851  		pr_err("FAIL: EFI %s memory not caught (%#lx)\n",
c118951036e5315 Ard Biesheuvel 2026-10-11  852  		       desc, status);
c118951036e5315 Ard Biesheuvel 2026-10-11  853  }
c118951036e5315 Ard Biesheuvel 2026-10-11  854  
c118951036e5315 Ard Biesheuvel 2026-10-11  855  static void __maybe_unused lkdtm_EFI_RUNTIME_WRITE_TO_RO(void)
c118951036e5315 Ard Biesheuvel 2026-10-11  856  {
c118951036e5315 Ard Biesheuvel 2026-10-11 @857  	efi_rt_test(EFI_LKDTM_RUNTIME_RO_TEST, "write to RO");
c118951036e5315 Ard Biesheuvel 2026-10-11  858  }
c118951036e5315 Ard Biesheuvel 2026-10-11  859  
c118951036e5315 Ard Biesheuvel 2026-10-11  860  static void __maybe_unused lkdtm_EFI_RUNTIME_BRANCH_TO_NX(void)
c118951036e5315 Ard Biesheuvel 2026-10-11  861  {
c118951036e5315 Ard Biesheuvel 2026-10-11 @862  	efi_rt_test(EFI_LKDTM_RUNTIME_NX_TEST, "branch to NX");
c118951036e5315 Ard Biesheuvel 2026-10-11  863  }
c118951036e5315 Ard Biesheuvel 2026-10-11  864  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
