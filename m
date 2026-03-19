Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675F9402B83
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773956187; cv=none; b=O3JlbA2mjP184I1whVs78HTCltrSVdo+Dwul+PuO1ld7i5Wun32zfflEDgZf7M6nW/E6iDjVhHWVnC0pXy9RDhAs1vReKW8R7BPqSFzMkzkq60zY2DnRIuK/uk8PTf4xo99joRbFJPSDnSttdG0bSpmCJALg6VP+qO6oQfqPibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773956187; c=relaxed/simple;
	bh=kKr1k2D/4ORYG8gwyN5myqQ3RS5PZdxXpJAZXaARbnU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mqmlYcuxcCvR49eIC62wPpN8vTMESAKKVMHUUQOOp69gHiGAJ5hc+19UZbdL55aQeBHSy7vbX2PQ+xBLQFO6QJBH416K6Z9sLHpNyfCgQyygRtYARNG9zpOV8kqCZGSPkMyfe5GiJ48IGN40Jj46CBLzK0Iocf26zfBDAVsaj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhwEoaYn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhwEoaYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773956184; x=1805492184;
  h=date:from:to:subject:message-id:mime-version;
  bh=kKr1k2D/4ORYG8gwyN5myqQ3RS5PZdxXpJAZXaARbnU=;
  b=OhwEoaYnCIt3t8EtlYPTI+WDRVJysVo8q74mmIR8Cl35zxwwEeu/WC//
   HSsvoAUhd6pJ920OMpcHBdtJTnI/oqqqppGZhz/7CG4/qep9aeZMxeNZf
   Ls2kx2PY8/4A+FYXJMhfrZQPRJRCmu8Yh0DMkZnuCZY3xZ+dCqaKLj8mY
   ZylfUZT7t3yTbHMP6XP8Lxoi6VSEypFTvZKSR16Tpui8RP5djXHIqR4zw
   yR2QpFAJv3kDZ/YbOu2qh6uAkG5Grsw7FYVTDl21tZRWQ9u0piCsci/jb
   LYRaI6bAJx74K6iBh2PZHUCFQvbb3p9F8q+JfUSwkfwnphGPqPQA+V2Tq
   w==;
X-CSE-ConnectionGUID: Z5QN4Ve1Q+yxf1WBmPzLzg==
X-CSE-MsgGUID: 7YxXGri9R0KFYfjIIFiijg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75009674"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75009674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:36:24 -0700
X-CSE-ConnectionGUID: admIAz5YRXWP3p5ewLrLbQ==
X-CSE-MsgGUID: M2c3kWDsR4qeXxO335PPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227799995"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 14:36:23 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3L2T-000000004tl-11JD
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Mar 2026 21:36:21 +0000
Date: Thu, 19 Mar 2026 22:36:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 17/23] mm: convert do_brk_flags() to use vma_flags_t
Message-ID: <202603192235.6ua33kJi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <981ed1afcd19115432e61778e7d226a36f8f5c2b.1773846935.git.ljs@kernel.org>
References: <981ed1afcd19115432e61778e7d226a36f8f5c2b.1773846935.git.ljs@kernel.org>
TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260318]
[cannot apply to akpm-mm/mm-everything powerpc/next powerpc/fixes kees/for-next/execve linus/master v7.0-rc4 v7.0-rc3 v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-Oracle/mm-vma-add-vma_flags_empty-vma_flags_and-vma_flags_diff_pair/20260319-170349
base:   next-20260318
patch link:    https://lore.kernel.org/r/981ed1afcd19115432e61778e7d226a36f8f5c2b.1773846935.git.ljs%40kernel.org
patch subject: [PATCH v3 17/23] mm: convert do_brk_flags() to use vma_flags_t
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603192235.6ua33kJi-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Paul Moore <paul@paul-moore.com>	[SELinux]', should be: 'Paul Moore <paul@paul-moore.com> (SELinux)'
#44: 
Acked-by: Paul Moore <paul@paul-moore.com>	[SELinux]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
