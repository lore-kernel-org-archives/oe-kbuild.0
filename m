Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B03093CB
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144073; cv=none; b=PwN7XL4JhbadwkgQDlZ5Kz6zsBoJcY+QBc2oMH5bfrg+ryXf1Jbqhe/M/mfxX+ip3b24Bc2DBpMEi4+8B2ucmV8RURX7Fxmdv7zMg+mhWsA75J1ziv8m9oPA/w4Amt4IVs6gJvOrRaec/TtUZVWsqsIqvrS1eXr3JLGCeqqC3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144073; c=relaxed/simple;
	bh=THOrfHbzJvluV+u2NJpSbwTCmD2Q/MLpI0NGd/6sh4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTtRoDGX1MFWm8SX9ZSxxyRUJTkVT2WVBGgidU3lux5kKbvTHWZJTAZyRCvI454EMQpO0euWMGB+tBPxHp4Lm/93eGs6q0Ng5LDMtqOr0xzEPwrD3pcQhcvAsE2h4VeoKAcUqN/TPVo0SuiIP3qyUWYJTqwy+pwv0d0pPjBBfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HacTVUpV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HacTVUpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792144070; x=1823680070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=THOrfHbzJvluV+u2NJpSbwTCmD2Q/MLpI0NGd/6sh4w=;
  b=HacTVUpVaTT9ZBavVZoEUCy0Z1OtdSFMh+3kVYV43JNG1kktTECvUnB8
   Su7IBLfcUVato+95lNi//5gYK4fnDHkWEjPVjG9UfnHbi5XzojQ1eQpFG
   2mPGGgCcsyYWtICxSyPSW+fAMNJNC0t8RHe6c3kCtRs3/Bw4gCFcdvQfd
   LnBAnTKlu0LyoLicJVRli1lybpNvwwVBkC2WiKOsRVT0CdryJG8m7ySqR
   QXFMMOuSc++mKEZQPvFuBa0ztBVuCkLOa6mAASVfFxwiEpX2HfaVpbJRa
   E/zWIv3Tlsc+Glr6sMf02dOzdJCqmHGReweIZ1DEy9UMdRiyON3ZHbHsW
   Q==;
X-CSE-ConnectionGUID: YelzNA3NRGuumZn+wgbBFA==
X-CSE-MsgGUID: N9trW4tQRn6GeXRc7Gz8pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="828730"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="828730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 02:47:49 -0700
X-CSE-ConnectionGUID: nLvtNLghTrKr68x+i4cqQA==
X-CSE-MsgGUID: iLjQoryySc+Q0NeHbTWkgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1903609"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2026 02:47:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHeXQ-00000000CAZ-3osy;
	Fri, 16 Oct 2026 09:47:44 +0000
Date: Fri, 16 Oct 2026 11:47:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lkdtm: Add more EFI runtime tests
Message-ID: <202610161151.q2leW0N3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/firmware/efi/runtime-wrappers.c:358:64: sparse: sparse: expression expected before '{'"
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.3-rc7 next-20261015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/lkdtm-Add-more-EFI-runtime-tests/20261011-134014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20261011114013.1130-2-ardb%40kernel.org
patch subject: [PATCH] lkdtm: Add more EFI runtime tests
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-2302-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161151.q2leW0N3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161151.q2leW0N3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610161151.q2leW0N3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/efi/runtime-wrappers.c:358:17: sparse: sparse: typename in expression
   drivers/firmware/efi/runtime-wrappers.c:358:24: sparse: sparse: Expected ; at end of statement
   drivers/firmware/efi/runtime-wrappers.c:358:24: sparse: sparse: got {
>> drivers/firmware/efi/runtime-wrappers.c:358:64: sparse: sparse: expression expected before '{'
   drivers/firmware/efi/runtime-wrappers.c:358:66: sparse: sparse: Expected ; at end of statement
   drivers/firmware/efi/runtime-wrappers.c:358:66: sparse: sparse: got {
>> drivers/firmware/efi/runtime-wrappers.c:361:17: sparse: sparse: break/continue not in iterator scope
   drivers/firmware/efi/runtime-wrappers.c:365:54: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:365:54: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: got (
>> drivers/firmware/efi/runtime-wrappers.c:373:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Expected ) in nested declarator
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: got volatile
>> drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Trying to use reserved word 'const' as identifier
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:373:13: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:376:21: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:376:21: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:377:18: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:377:18: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:379:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:379:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got "\001"
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:386:24: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:386:24: sparse: sparse: got 7
>> drivers/firmware/efi/runtime-wrappers.c:386:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:387:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:387:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:390:21: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:390:21: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:391:21: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:391:21: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:392:21: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:392:21: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:394:25: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:394:25: sparse: sparse: got &
>> drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got {
>> drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ) in nested declarator
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ) in nested declarator
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:401:13: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:401:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:402:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:402:17: sparse: sparse: got "\001"
   drivers/firmware/efi/runtime-wrappers.c:402:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:402:17: sparse: sparse: got }
>> drivers/firmware/efi/runtime-wrappers.c:403:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   drivers/firmware/efi/runtime-wrappers.c:403:22: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:403:22: sparse: sparse: got exit
   drivers/firmware/efi/runtime-wrappers.c:404:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:404:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:408:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:408:17: sparse: sparse: got "\001"
   drivers/firmware/efi/runtime-wrappers.c:408:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:408:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:410:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:411:27: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:411:27: sparse: sparse: got 3
   drivers/firmware/efi/runtime-wrappers.c:412:24: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:412:24: sparse: sparse: got 21
   drivers/firmware/efi/runtime-wrappers.c:412:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:413:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:413:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:415:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:416:5: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:416:5: sparse: sparse: got :
   drivers/firmware/efi/runtime-wrappers.c:418:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:418:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:418:16: sparse: sparse: got efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:419:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:419:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:425:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:425:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:425:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:428:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:428:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:429:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:429:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:429:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:430:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:430:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:436:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:436:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:436:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:439:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:439:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:440:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:440:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:440:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:441:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:441:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:449:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:449:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:449:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:452:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:452:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:453:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:453:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:453:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:454:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:454:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:460:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:460:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:460:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:463:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:463:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:464:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:464:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:464:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:465:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:465:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:475:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:475:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:475:9: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   drivers/firmware/efi/runtime-wrappers.c:531:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:531:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:532:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:532:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:542:16: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:542:16: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:542:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:545:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:545:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:545:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:549:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:549:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:550:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:550:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:550:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:551:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:551:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:559:16: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:559:16: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:559:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:562:25: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:562:25: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:562:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:565:13: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:565:13: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:565:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:567:24: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:567:24: sparse: sparse: got 7
   drivers/firmware/efi/runtime-wrappers.c:567:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:568:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:568:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:575:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:575:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:576:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:576:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:576:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:577:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:577:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:583:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:583:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:583:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:586:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:586:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:587:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:587:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:587:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:588:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:588:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:595:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:595:17: sparse: sparse: got "\001"
   drivers/firmware/efi/runtime-wrappers.c:595:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:595:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:597:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:598:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:598:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:601:17: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:601:17: sparse: sparse: got "\001"
   drivers/firmware/efi/runtime-wrappers.c:601:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:601:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:602:20: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:602:20: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:603:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:604:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:604:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:608:21: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:608:21: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse: sparse: Expected ) in nested declarator
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:613:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:613:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:614:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:614:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:622:16: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:622:16: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:622:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:625:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:625:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:625:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:628:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:628:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:629:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:629:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:629:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:630:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:630:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:639:16: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:639:16: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:639:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:642:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:642:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:642:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:646:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:646:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:647:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:647:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:647:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:648:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:648:1: sparse: sparse: got }
>> drivers/firmware/efi/runtime-wrappers.c:655:9: sparse: sparse: Trying to use reserved word 'switch' as identifier
>> drivers/firmware/efi/runtime-wrappers.c:655:17: sparse: sparse: missing type declaration for parameter 'id'
>> drivers/firmware/efi/runtime-wrappers.c:656:9: sparse: sparse: not in switch scope
   drivers/firmware/efi/runtime-wrappers.c:661:9: sparse: sparse: not in switch scope
   drivers/firmware/efi/runtime-wrappers.c:665:17: sparse: sparse: break/continue not in iterator scope
   drivers/firmware/efi/runtime-wrappers.c:666:9: sparse: sparse: not in switch scope
   drivers/firmware/efi/runtime-wrappers.c:670:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:670:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:670:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:673:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:673:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:674:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:674:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:674:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:675:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:675:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:681:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:681:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:682:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:682:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:683:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:683:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:684:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:684:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:685:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:685:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:686:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:686:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:687:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:687:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:688:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:688:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:689:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:689:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:690:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:690:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:691:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:691:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:692:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:692:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:693:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:693:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:696:12: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:696:12: sparse: sparse: got .
   drivers/firmware/efi/runtime-wrappers.c:698:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:698:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:708:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:708:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:708:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:712:12: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:712:12: sparse: sparse: got &
   drivers/firmware/efi/runtime-wrappers.c:713:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:713:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:713:16: sparse: sparse: got status
   drivers/firmware/efi/runtime-wrappers.c:714:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:714:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got !
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:720:9: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:721:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:721:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:728:31: sparse: sparse: Expected ) in function declarator
   drivers/firmware/efi/runtime-wrappers.c:728:31: sparse: sparse: got (
   drivers/firmware/efi/runtime-wrappers.c:728:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/firmware/efi/runtime-wrappers.c:731:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> drivers/firmware/efi/runtime-wrappers.c:731:13: sparse: sparse: missing type declaration for parameter 'enable'
>> drivers/firmware/efi/runtime-wrappers.c:738:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   drivers/firmware/efi/runtime-wrappers.c:738:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:738:16: sparse: sparse: got {
   drivers/firmware/efi/runtime-wrappers.c:743:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:743:17: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:748:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/firmware/efi/runtime-wrappers.c:748:16: sparse: sparse: Expected ; at end of declaration
   drivers/firmware/efi/runtime-wrappers.c:748:16: sparse: sparse: got ret
   drivers/firmware/efi/runtime-wrappers.c:749:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/firmware/efi/runtime-wrappers.c:749:1: sparse: sparse: got }
   drivers/firmware/efi/runtime-wrappers.c:358:17: sparse: sparse: undefined identifier 'struct'
   drivers/firmware/efi/runtime-wrappers.c:360:26: sparse: sparse: undefined identifier 's'
   drivers/firmware/efi/runtime-wrappers.c:360:26: sparse: sparse: cast from unknown type
   drivers/firmware/efi/runtime-wrappers.c:376:9: sparse: sparse: symbol 'efi_rts_work' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:376:9: sparse:    int [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse:    struct efi_runtime_work [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:378:9: sparse: sparse: symbol 'efi_runtime_lock_owner' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:378:9: sparse:    int static [toplevel] efi_runtime_lock_owner
   drivers/firmware/efi/runtime-wrappers.c:219:27: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:219:27: sparse:    struct task_struct *static [assigned] [toplevel] efi_runtime_lock_owner
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: undefined identifier '__ret_do_once'
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: symbol '__ret_once' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:385)
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: sparse: symbol '__ret_once' redeclared with different type (different type sizes):
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse:    int [addressable] [toplevel] __ret_once
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:385:17: sparse:    bool [addressable] [toplevel] [usertype] __ret_once
   drivers/firmware/efi/runtime-wrappers.c:390:9: sparse: sparse: symbol 'efi_rts_work' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:390:9: sparse:    int [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse:    struct efi_runtime_work [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:391:9: sparse: sparse: symbol 'efi_rts_work' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:391:9: sparse:    int [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse:    struct efi_runtime_work [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:392:9: sparse: sparse: symbol 'efi_rts_work' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:392:9: sparse:    int [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse:    struct efi_runtime_work [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:394:9: sparse: sparse: symbol 'init_completion' redeclared with different type (different argument counts):
   drivers/firmware/efi/runtime-wrappers.c:394:9: sparse:    int static [signed] [toplevel] init_completion( ... )
   drivers/firmware/efi/runtime-wrappers.c: note: in included file (through include/linux/shrinker.h, include/linux/list_lru.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/completion.h:84:20: sparse: note: previously declared as:
   include/linux/completion.h:84:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] init_completion( ... )
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: symbol 'lockdep_init_map' redeclared with different type (different argument counts):
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse:    int static [signed] [toplevel] lockdep_init_map( ... )
   drivers/firmware/efi/runtime-wrappers.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, ...):
   include/linux/lockdep.h:145:20: sparse: note: previously declared as:
   include/linux/lockdep.h:145:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] lockdep_init_map( ... )
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse: sparse: symbol 'INIT_LIST_HEAD' redeclared with different type (different argument counts):
   drivers/firmware/efi/runtime-wrappers.c:395:9: sparse:    int static [signed] [toplevel] INIT_LIST_HEAD( ... )
   drivers/firmware/efi/runtime-wrappers.c: note: in included file (through include/linux/random.h, include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, ...):
   include/linux/list.h:51:20: sparse: note: previously declared as:
   include/linux/list.h:51:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] INIT_LIST_HEAD( ... )
   drivers/firmware/efi/runtime-wrappers.c:411:17: sparse: sparse: symbol 'clear_bit' redeclared with different type (different argument counts):
   drivers/firmware/efi/runtime-wrappers.c:411:17: sparse:    int static [signed] [toplevel] clear_bit( ... )
   drivers/firmware/efi/runtime-wrappers.c: note: in included file (through arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/getorder.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:39:29: sparse: note: previously declared as:
   include/asm-generic/bitops/instrumented-atomic.h:39:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] clear_bit( ... )
   drivers/firmware/efi/runtime-wrappers.c:427:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:438:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:438:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:427)
   drivers/firmware/efi/runtime-wrappers.c:451:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:451:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:438)
   drivers/firmware/efi/runtime-wrappers.c:462:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:462:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:451)
   drivers/firmware/efi/runtime-wrappers.c:477:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:477:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:462)
   drivers/firmware/efi/runtime-wrappers.c:491:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:491:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:477)
   drivers/firmware/efi/runtime-wrappers.c:506:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:506:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:491)
   drivers/firmware/efi/runtime-wrappers.c:527:18: sparse: sparse: undefined identifier 'name'
   drivers/firmware/efi/runtime-wrappers.c:527:18: sparse: sparse: undefined identifier 'name'
   drivers/firmware/efi/runtime-wrappers.c:527:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:506)
   drivers/firmware/efi/runtime-wrappers.c:529:9: sparse: sparse: symbol 'efi_runtime_lock_owner' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:378)
   drivers/firmware/efi/runtime-wrappers.c:529:9: sparse: sparse: symbol 'efi_runtime_lock_owner' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:529:9: sparse:    int static [toplevel] efi_runtime_lock_owner
   drivers/firmware/efi/runtime-wrappers.c:219:27: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:219:27: sparse:    struct task_struct *static [assigned] [toplevel] efi_runtime_lock_owner
   drivers/firmware/efi/runtime-wrappers.c:547:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:547:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:527)
   drivers/firmware/efi/runtime-wrappers.c:571:18: sparse: sparse: undefined identifier 'attr'
   drivers/firmware/efi/runtime-wrappers.c:571:18: sparse: sparse: undefined identifier 'attr'
   drivers/firmware/efi/runtime-wrappers.c:571:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:547)
   drivers/firmware/efi/runtime-wrappers.c:574:9: sparse: sparse: symbol 'efi_runtime_lock_owner' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:529)
   drivers/firmware/efi/runtime-wrappers.c:574:9: sparse: sparse: symbol 'efi_runtime_lock_owner' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:574:9: sparse:    int static [toplevel] efi_runtime_lock_owner
   drivers/firmware/efi/runtime-wrappers.c:219:27: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:219:27: sparse:    struct task_struct *static [assigned] [toplevel] efi_runtime_lock_owner
   drivers/firmware/efi/runtime-wrappers.c:585:18: sparse: sparse: undefined identifier '__efi_queue_work'
   drivers/firmware/efi/runtime-wrappers.c:585:9: sparse: sparse: symbol 'status' has multiple initializers (originally initialized at drivers/firmware/efi/runtime-wrappers.c:571)
   drivers/firmware/efi/runtime-wrappers.c:608:9: sparse: sparse: symbol 'efi_rts_work' redeclared with different type (different base types):
   drivers/firmware/efi/runtime-wrappers.c:608:9: sparse:    int [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse: note: previously declared as:
   drivers/firmware/efi/runtime-wrappers.c:119:25: sparse:    struct efi_runtime_work [addressable] [toplevel] efi_rts_work
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse: sparse: undefined identifier 'reset_type'
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse: sparse: symbol 'ibt_restore' redeclared with different type (incompatible argument 1 (different base types)):
   drivers/firmware/efi/runtime-wrappers.c:609:9: sparse:    int static [signed] [toplevel] ibt_restore( ... )
   drivers/firmware/efi/runtime-wrappers.c: note: in included file (through arch/x86/include/asm/linkage.h, include/linux/linkage.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   arch/x86/include/asm/ibt.h:105:20: sparse: note: previously declared as:

vim +358 drivers/firmware/efi/runtime-wrappers.c

ecbccdbdab5d31e Breno Leitao   2026-06-16  240  
3eb420e70d879ce Sai Praneeth   2018-07-11  241  /*
3eb420e70d879ce Sai Praneeth   2018-07-11  242   * Calls the appropriate efi_runtime_service() with the appropriate
3eb420e70d879ce Sai Praneeth   2018-07-11  243   * arguments.
3eb420e70d879ce Sai Praneeth   2018-07-11  244   */
99280413a5b785f Ard Biesheuvel 2024-06-04  245  static void __nocfi efi_call_rts(struct work_struct *work)
3eb420e70d879ce Sai Praneeth   2018-07-11  246  {
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  247  	const union efi_rts_args *args = efi_rts_work.args;
3eb420e70d879ce Sai Praneeth   2018-07-11  248  	efi_status_t status = EFI_NOT_FOUND;
3c17ae4161093fa Ard Biesheuvel 2023-08-08  249  	unsigned long flags;
3c17ae4161093fa Ard Biesheuvel 2023-08-08  250  
60618389de92444 Breno Leitao   2026-06-16  251  	if (!efi_enabled(EFI_RUNTIME_SERVICES))
60618389de92444 Breno Leitao   2026-06-16  252  		efi_rts_park_worker();
60618389de92444 Breno Leitao   2026-06-16  253  
a2860501203cf7a Ard Biesheuvel 2025-10-15  254  	efi_runtime_lock_owner = current;
a2860501203cf7a Ard Biesheuvel 2025-10-15  255  
3c17ae4161093fa Ard Biesheuvel 2023-08-08  256  	arch_efi_call_virt_setup();
3c17ae4161093fa Ard Biesheuvel 2023-08-08  257  	flags = efi_call_virt_save_flags();
3eb420e70d879ce Sai Praneeth   2018-07-11  258  
9dbbedaa6171247 Sai Praneeth   2018-09-11  259  	switch (efi_rts_work.efi_rts_id) {
5c418dc789a3898 Anders Roxell  2019-02-15  260  	case EFI_GET_TIME:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  261  		status = efi_call_virt(get_time,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  262  				       args->GET_TIME.time,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  263  				       args->GET_TIME.capabilities);
3eb420e70d879ce Sai Praneeth   2018-07-11  264  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  265  	case EFI_SET_TIME:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  266  		status = efi_call_virt(set_time,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  267  				       args->SET_TIME.time);
3eb420e70d879ce Sai Praneeth   2018-07-11  268  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  269  	case EFI_GET_WAKEUP_TIME:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  270  		status = efi_call_virt(get_wakeup_time,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  271  				       args->GET_WAKEUP_TIME.enabled,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  272  				       args->GET_WAKEUP_TIME.pending,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  273  				       args->GET_WAKEUP_TIME.time);
3eb420e70d879ce Sai Praneeth   2018-07-11  274  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  275  	case EFI_SET_WAKEUP_TIME:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  276  		status = efi_call_virt(set_wakeup_time,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  277  				       args->SET_WAKEUP_TIME.enable,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  278  				       args->SET_WAKEUP_TIME.time);
3eb420e70d879ce Sai Praneeth   2018-07-11  279  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  280  	case EFI_GET_VARIABLE:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  281  		status = efi_call_virt(get_variable,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  282  				       args->GET_VARIABLE.name,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  283  				       args->GET_VARIABLE.vendor,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  284  				       args->GET_VARIABLE.attr,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  285  				       args->GET_VARIABLE.data_size,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  286  				       args->GET_VARIABLE.data);
3eb420e70d879ce Sai Praneeth   2018-07-11  287  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  288  	case EFI_GET_NEXT_VARIABLE:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  289  		status = efi_call_virt(get_next_variable,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  290  				       args->GET_NEXT_VARIABLE.name_size,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  291  				       args->GET_NEXT_VARIABLE.name,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  292  				       args->GET_NEXT_VARIABLE.vendor);
3eb420e70d879ce Sai Praneeth   2018-07-11  293  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  294  	case EFI_SET_VARIABLE:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  295  		status = efi_call_virt(set_variable,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  296  				       args->SET_VARIABLE.name,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  297  				       args->SET_VARIABLE.vendor,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  298  				       args->SET_VARIABLE.attr,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  299  				       args->SET_VARIABLE.data_size,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  300  				       args->SET_VARIABLE.data);
3eb420e70d879ce Sai Praneeth   2018-07-11  301  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  302  	case EFI_QUERY_VARIABLE_INFO:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  303  		status = efi_call_virt(query_variable_info,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  304  				       args->QUERY_VARIABLE_INFO.attr,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  305  				       args->QUERY_VARIABLE_INFO.storage_space,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  306  				       args->QUERY_VARIABLE_INFO.remaining_space,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  307  				       args->QUERY_VARIABLE_INFO.max_variable_size);
3eb420e70d879ce Sai Praneeth   2018-07-11  308  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  309  	case EFI_GET_NEXT_HIGH_MONO_COUNT:
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  310  		status = efi_call_virt(get_next_high_mono_count,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  311  				       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
3eb420e70d879ce Sai Praneeth   2018-07-11  312  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  313  	case EFI_UPDATE_CAPSULE:
3eb420e70d879ce Sai Praneeth   2018-07-11  314  		status = efi_call_virt(update_capsule,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  315  				       args->UPDATE_CAPSULE.capsules,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  316  				       args->UPDATE_CAPSULE.count,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  317  				       args->UPDATE_CAPSULE.sg_list);
3eb420e70d879ce Sai Praneeth   2018-07-11  318  		break;
5c418dc789a3898 Anders Roxell  2019-02-15  319  	case EFI_QUERY_CAPSULE_CAPS:
3eb420e70d879ce Sai Praneeth   2018-07-11  320  		status = efi_call_virt(query_capsule_caps,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  321  				       args->QUERY_CAPSULE_CAPS.capsules,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  322  				       args->QUERY_CAPSULE_CAPS.count,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  323  				       args->QUERY_CAPSULE_CAPS.max_size,
c7c7bce093c8837 Ard Biesheuvel 2023-07-02  324  				       args->QUERY_CAPSULE_CAPS.reset_type);
3eb420e70d879ce Sai Praneeth   2018-07-11  325  		break;
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  326  	case EFI_ACPI_PRM_HANDLER:
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  327  #ifdef CONFIG_ACPI_PRMT
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  328  		status = arch_efi_call_virt(args, ACPI_PRM_HANDLER.acpi_prm_handler,
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  329  					    args->ACPI_PRM_HANDLER.param_buffer_addr,
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  330  					    args->ACPI_PRM_HANDLER.context);
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  331  		break;
5894cf571e14fb3 Ard Biesheuvel 2023-07-02  332  #endif
3eb420e70d879ce Sai Praneeth   2018-07-11  333  	default:
3eb420e70d879ce Sai Praneeth   2018-07-11  334  		/*
3eb420e70d879ce Sai Praneeth   2018-07-11  335  		 * Ideally, we should never reach here because a caller of this
3eb420e70d879ce Sai Praneeth   2018-07-11  336  		 * function should have put the right efi_runtime_service()
3eb420e70d879ce Sai Praneeth   2018-07-11  337  		 * function identifier into efi_rts_work->efi_rts_id
3eb420e70d879ce Sai Praneeth   2018-07-11  338  		 */
3eb420e70d879ce Sai Praneeth   2018-07-11  339  		pr_err("Requested executing invalid EFI Runtime Service.\n");
c118951036e5315 Ard Biesheuvel 2026-10-11  340  		break;
c118951036e5315 Ard Biesheuvel 2026-10-11  341  
c118951036e5315 Ard Biesheuvel 2026-10-11  342  #ifdef CONFIG_LKDTM
c118951036e5315 Ard Biesheuvel 2026-10-11  343  	case EFI_LKDTM_RUNTIME_RO_TEST:
c118951036e5315 Ard Biesheuvel 2026-10-11  344  		/*
c118951036e5315 Ard Biesheuvel 2026-10-11  345  		 * Call GetTime() with the output argument pointing to
c118951036e5315 Ard Biesheuvel 2026-10-11  346  		 * executable memory, which should be mapped read-only in the
c118951036e5315 Ard Biesheuvel 2026-10-11  347  		 * EFI page tables.
c118951036e5315 Ard Biesheuvel 2026-10-11  348  		 */
c118951036e5315 Ard Biesheuvel 2026-10-11  349  		status = arch_efi_call_virt(efi.runtime, get_time,
c118951036e5315 Ard Biesheuvel 2026-10-11  350  					    (void *)efi.runtime->set_time,
c118951036e5315 Ard Biesheuvel 2026-10-11  351  					    NULL);
c118951036e5315 Ard Biesheuvel 2026-10-11  352  		break;
c118951036e5315 Ard Biesheuvel 2026-10-11  353  	case EFI_LKDTM_RUNTIME_NX_TEST:
c118951036e5315 Ard Biesheuvel 2026-10-11  354  		/*
c118951036e5315 Ard Biesheuvel 2026-10-11  355  		 * Call efi.runtime, which points to a data object in a EFI
c118951036e5315 Ard Biesheuvel 2026-10-11  356  		 * runtime region, as if it were a function pointer.
c118951036e5315 Ard Biesheuvel 2026-10-11  357  		 */
c118951036e5315 Ard Biesheuvel 2026-10-11 @358  		struct { efi_status_t (__efiapi *fn)(int); } s = { (void *)efi.runtime };
c118951036e5315 Ard Biesheuvel 2026-10-11  359  
c118951036e5315 Ard Biesheuvel 2026-10-11  360  		status = arch_efi_call_virt((&s), fn, 0);
c118951036e5315 Ard Biesheuvel 2026-10-11 @361  		break;
c118951036e5315 Ard Biesheuvel 2026-10-11  362  #endif
3eb420e70d879ce Sai Praneeth   2018-07-11  363  	}
3c17ae4161093fa Ard Biesheuvel 2023-08-08  364  
3c17ae4161093fa Ard Biesheuvel 2023-08-08  365  	efi_call_virt_check_flags(flags, efi_rts_work.caller);
3c17ae4161093fa Ard Biesheuvel 2023-08-08  366  	arch_efi_call_virt_teardown();
3c17ae4161093fa Ard Biesheuvel 2023-08-08  367  
191c12e9a71687b Ard Biesheuvel 2026-10-09  368  	/*
191c12e9a71687b Ard Biesheuvel 2026-10-09  369  	 * EFI runtime services may also have been disabled because the
191c12e9a71687b Ard Biesheuvel 2026-10-09  370  	 * firmware faulted, but the caller is still waiting for us in that
191c12e9a71687b Ard Biesheuvel 2026-10-09  371  	 * case. Only park the worker if the caller has given up on it.
191c12e9a71687b Ard Biesheuvel 2026-10-09  372  	 */
191c12e9a71687b Ard Biesheuvel 2026-10-09 @373  	if (READ_ONCE(efi_rts_abandoned))
4b2c033b5bc971a Breno Leitao   2026-06-16  374  		efi_rts_park_worker();
4b2c033b5bc971a Breno Leitao   2026-06-16  375  
9dbbedaa6171247 Sai Praneeth   2018-09-11  376  	efi_rts_work.status = status;
9dbbedaa6171247 Sai Praneeth   2018-09-11  377  	complete(&efi_rts_work.efi_rts_comp);
a2860501203cf7a Ard Biesheuvel 2025-10-15  378  	efi_runtime_lock_owner = NULL;
3eb420e70d879ce Sai Praneeth   2018-07-11  379  }
3eb420e70d879ce Sai Praneeth   2018-07-11  380  
c99ba6e54652652 Ard Biesheuvel 2023-07-02  381  static efi_status_t __efi_queue_work(enum efi_rts_ids id,
c99ba6e54652652 Ard Biesheuvel 2023-07-02  382  				     union efi_rts_args *args)
c99ba6e54652652 Ard Biesheuvel 2023-07-02  383  {
7f64cb373f3dcc2 Breno Leitao   2026-06-16  384  	if (!efi_enabled(EFI_RUNTIME_SERVICES)) {
7f64cb373f3dcc2 Breno Leitao   2026-06-16  385  		pr_warn_once("EFI Runtime Services are disabled!\n");
7f64cb373f3dcc2 Breno Leitao   2026-06-16 @386  		return EFI_DEVICE_ERROR;
7f64cb373f3dcc2 Breno Leitao   2026-06-16  387  	}
7f64cb373f3dcc2 Breno Leitao   2026-06-16  388  
c99ba6e54652652 Ard Biesheuvel 2023-07-02  389  	efi_rts_work.efi_rts_id = id;
c99ba6e54652652 Ard Biesheuvel 2023-07-02  390  	efi_rts_work.args = args;
3c17ae4161093fa Ard Biesheuvel 2023-08-08  391  	efi_rts_work.caller = __builtin_return_address(0);
c99ba6e54652652 Ard Biesheuvel 2023-07-02  392  	efi_rts_work.status = EFI_ABORTED;
c99ba6e54652652 Ard Biesheuvel 2023-07-02  393  
c99ba6e54652652 Ard Biesheuvel 2023-07-02  394  	init_completion(&efi_rts_work.efi_rts_comp);
c99ba6e54652652 Ard Biesheuvel 2023-07-02 @395  	INIT_WORK(&efi_rts_work.work, efi_call_rts);
c99ba6e54652652 Ard Biesheuvel 2023-07-02  396  
c99ba6e54652652 Ard Biesheuvel 2023-07-02  397  	/*
c99ba6e54652652 Ard Biesheuvel 2023-07-02  398  	 * queue_work() returns 0 if work was already on queue,
c99ba6e54652652 Ard Biesheuvel 2023-07-02  399  	 * _ideally_ this should never happen.
c99ba6e54652652 Ard Biesheuvel 2023-07-02  400  	 */
c554d4e534bbfc9 Breno Leitao   2026-06-16  401  	if (!queue_work(efi_rts_wq, &efi_rts_work.work)) {
c99ba6e54652652 Ard Biesheuvel 2023-07-02  402  		pr_err("Failed to queue work to efi_rts_wq.\n");
c554d4e534bbfc9 Breno Leitao   2026-06-16 @403  		goto exit;
c554d4e534bbfc9 Breno Leitao   2026-06-16  404  	}
c554d4e534bbfc9 Breno Leitao   2026-06-16  405  
60618389de92444 Breno Leitao   2026-06-16  406  	if (!wait_for_completion_timeout(&efi_rts_work.efi_rts_comp,
60618389de92444 Breno Leitao   2026-06-16  407  					 EFI_RTS_TIMEOUT)) {
60618389de92444 Breno Leitao   2026-06-16  408  		pr_err("EFI runtime service %d wedged in firmware; disabling EFI runtime services\n",
60618389de92444 Breno Leitao   2026-06-16  409  		       id);
191c12e9a71687b Ard Biesheuvel 2026-10-09  410  		WRITE_ONCE(efi_rts_abandoned, true);
60618389de92444 Breno Leitao   2026-06-16  411  		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
60618389de92444 Breno Leitao   2026-06-16  412  		return EFI_ABORTED;
60618389de92444 Breno Leitao   2026-06-16  413  	}
c99ba6e54652652 Ard Biesheuvel 2023-07-02  414  
c99ba6e54652652 Ard Biesheuvel 2023-07-02  415  	WARN_ON_ONCE(efi_rts_work.status == EFI_ABORTED);
c99ba6e54652652 Ard Biesheuvel 2023-07-02  416  exit:
c99ba6e54652652 Ard Biesheuvel 2023-07-02  417  	efi_rts_work.efi_rts_id = EFI_NONE;
c99ba6e54652652 Ard Biesheuvel 2023-07-02  418  	return efi_rts_work.status;
c99ba6e54652652 Ard Biesheuvel 2023-07-02  419  }
c99ba6e54652652 Ard Biesheuvel 2023-07-02  420  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
