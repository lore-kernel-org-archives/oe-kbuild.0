Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0D3D27E
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728112564; cv=none; b=eYU6GXr4J8PYYXXIOLzZFCUm/s4k9dawOvaI3NVwhokcfed2o5IfRG/m7P0RfhCLqQP+aMl95vZquG/ydv3vuwULyEC2x6LamQL60rI1UFq41z8TZxsmaqp3X7h9ItlZ/Orgl5+1V5PJEth9L9aF1sGjFuX2yj3kJdSe9MyYHDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728112564; c=relaxed/simple;
	bh=MDgJ+iUMFbEOpsmpmJx1u8UtSwzJcFvTsv/2tZ2DIl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gx55/SzKAQQV6+1IzBkzzUxj5U/uOq8cKKDtD0Mbd3cP2rEK0KKFbf356WctdqG8vbHkMkghL86vyc8dbnhhAfG+W/h9z7EioR1UgRqJg1C0cS2q2O4paUK42b/dV/4W2P9eHe98ZnUc+Muvc8tkIyuAxz3XNcmwtimKtYk60Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdYiRppo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdYiRppo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728112563; x=1759648563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDgJ+iUMFbEOpsmpmJx1u8UtSwzJcFvTsv/2tZ2DIl4=;
  b=OdYiRppog3ZKmf92uyMRmwbWlmDAP5wdnD120eoMrje6XZYb8axDxGC2
   Krn6NykhkrNCCeKRUQeql2WFiZrci+SDm93WZY0hROOA8VNyP0n3vd7Rh
   ap5ixfZvQ8G05A+uDr+r0oSC8SD9o0Hn4NNaNXBXQoQKjGSFANgxFPPSu
   E5r1cYwbQ48EpR4QFxgY8Za+mJBCTaZCiR/RjS/Ku7nsct1MG/mWGVpXL
   Rp56+N9fPsErJAPQ28wyfI7BHi8UdvyINW+MmnoeFQioviCJUZ8/5fB47
   FAtcweiCWp8PIGp3goiQ4SxV3n2l6dZn0cs7YcBEmWd9icFvZCDTW2C0h
   Q==;
X-CSE-ConnectionGUID: 7t124+QVSDWl36n63sPv7w==
X-CSE-MsgGUID: S4ST6N/vS0aEsYBO+B28Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37901007"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="37901007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:16:02 -0700
X-CSE-ConnectionGUID: lmtKUEKAQb6Zn3tJPawl7w==
X-CSE-MsgGUID: JlYwkpPPTviZgsJzUPBe5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="75358344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Oct 2024 00:16:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swz1D-0002j4-0F;
	Sat, 05 Oct 2024 07:15:59 +0000
Date: Sat, 5 Oct 2024 15:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH kselftest 3/3] selftests: vDSO: improve getrandom and
 chacha error messages
Message-ID: <202410051432.uAzAV7yV-lkp@intel.com>
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
In-Reply-To: <20241003031307.2236454-4-Jason@zx2c4.com>
References: <20241003031307.2236454-4-Jason@zx2c4.com>
TO: "Jason A. Donenfeld" <Jason@zx2c4.com>
TO: skhan@linuxfoundation.org
TO: greg@kroah.com
TO: linux-kselftest@vger.kernel.org
CC: "Jason A. Donenfeld" <Jason@zx2c4.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-A-Donenfeld/selftests-vDSO-condition-chacha-build-on-chacha-implementation/20241003-111508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20241003031307.2236454-4-Jason%40zx2c4.com
patch subject: [PATCH kselftest 3/3] selftests: vDSO: improve getrandom and chacha error messages
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051432.uAzAV7yV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410051432.uAzAV7yV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:274:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     274 |                 else if (WSTOPSIG(status) == (SIGTRAP | 0x80)) {
         |                 ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
