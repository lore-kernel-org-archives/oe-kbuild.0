Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAF13CA92
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760759; cv=none; b=gT6XGqck3Fy2zAClgFAjnw3UQaDf85WGP53Zy1e3erAK5JqEqaBTYmYpRFZqc77ujiRVK6H8AONb9+iVdpAZRgnyIunG+j6XasP8GacQ5jEzR3HKdG8i2vBHHZpdLMXk1M7nSp28APd6o/pTudhhZdHRFfxoElJOawX3Qtll4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760759; c=relaxed/simple;
	bh=yx5EMgo4x+MXOr/58wRPvqcXNsffQqWgQpLuXHXYhps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekSNkt1DIrjk7HwW6GpZT7+kWq6JmBhbgK1/VicEBjxERCdd8R26EiRbhyEQepeSkUQiDaQ9UnzrBe9o0IgjIqaA5p90s337fOTnF9ld5NVHLtY60beDtW6iZGcHqSjcWrpUxYwvIberzbz9STT3jtkaI9NbfL9R2enKIurL1DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3wPypu5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3wPypu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791760757; x=1823296757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yx5EMgo4x+MXOr/58wRPvqcXNsffQqWgQpLuXHXYhps=;
  b=g3wPypu5xVtqZLsA/Pg4UksbucdNvm11TPKr+gASaRraumYlj+JZX0yt
   eKxSUrPrhK/u5zddq3pS4JvZiRPomU6HC1Y85ib6xzaRZkRuVFTOUrHAj
   d1f1aZw28VX5jZZQeU3MtYDkH0ZYV9PspbxKgqarc9WFGETMFVeCaQ1Ng
   mFiOUBeI2c2xOBAm3ji7p2gvsZq/cK3qk0MXJJEvlJc4SifxbrVNgZDht
   kXgy3hdRRhzsabKp2jyP3VMsWWymbE+SPYD8TXobC8v3oTLg3xsy6TirX
   ZdwyVPZRuqzyaNMIRHuMLJLShLc7QSdq42RV+cLeYyrevvWa3Md1k24Fr
   Q==;
X-CSE-ConnectionGUID: ssGfQ8YKS+ilZocTSs0nIQ==
X-CSE-MsgGUID: /zaTP/W4R5Ge6kv6llcuyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="343177"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="343177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 16:19:16 -0700
X-CSE-ConnectionGUID: 0+fHHpevRR2s1qMo+vsoug==
X-CSE-MsgGUID: NY/9jPokRU2notWrB1x6TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="890302"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2026 16:19:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG2oy-00000000AqR-2gpC;
	Sun, 11 Oct 2026 23:19:12 +0000
Date: Mon, 12 Oct 2026 07:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lkdtm: Add more EFI runtime tests
Message-ID: <202610120736.AeXVWn3u-lkp@intel.com>
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
CC: llvm@lists.linux.dev
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
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-1002-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120736.AeXVWn3u-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120736.AeXVWn3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610120736.AeXVWn3u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/bugs.c:846:28: error: no member named 'lkdtm_rt_test' in 'struct efi'
     846 |         efi_status_t status = efi.lkdtm_rt_test(id);
         |                               ~~~ ^
>> drivers/misc/lkdtm/bugs.c:857:14: error: use of undeclared identifier 'EFI_LKDTM_RUNTIME_RO_TEST'
     857 |         efi_rt_test(EFI_LKDTM_RUNTIME_RO_TEST, "write to RO");
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/lkdtm/bugs.c:862:14: error: use of undeclared identifier 'EFI_LKDTM_RUNTIME_NX_TEST'
     862 |         efi_rt_test(EFI_LKDTM_RUNTIME_NX_TEST, "branch to NX");
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


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
