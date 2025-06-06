Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE52868A2
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202056; cv=none; b=RDV5hQ3gHZ/2FYA4eI0MHLuG1rMN4iWcVvhOyZlHo3I5F/Ifx97sl9pasYqIBuFi2nQMLxGCMDmB/J3TLEth1VVbUvbRxg7/dUSwonNRyJfUq1ND75nYtqk1KAMixZNxPbEV89DkVndJXNczmTVvIIT06hFzDB4bOtRHyf0qNSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202056; c=relaxed/simple;
	bh=cN1FgowBUBYlFbIJXXyiTEY3veHcZooj7I346THXJD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQPETNO4dH4cX9LirQ8E0QSDA1lq8CatIM9Yb8GWSsOuBjOIOjiAVFeLHB46BO1tlkA4VRAPS+dH/rgBsilN/hzRdwpN3ZR8gXNMmtkYRgcHJ/2GMlHbvRHjjxNAo6ED8hGaY8c2XYPdcgVcgP21wDXAk3D2tIi0BFbGDjdCTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP1iUwJI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP1iUwJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749202053; x=1780738053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cN1FgowBUBYlFbIJXXyiTEY3veHcZooj7I346THXJD4=;
  b=GP1iUwJI8p4OtyYA8qGFw3Fj8pxjrP567X1zjFCHF9okGDP4jHlHdYsn
   vqT7jXLNA8k7ySYQs2fIZsAo667fp5gPcc4yO1ZM9h7o1OP2QStuNxB5p
   GDBhgq1dAZue90R4AmZlKqADXEIU0dAWHdq14Y+xlxQWGCx1f2t1Vc36T
   92FxNe5zhDJK2pXJfN8xDk9WJ+r/uGmSu0icg3+7/P2azB3VQycUpvhrB
   2oA9VM1BYlYKWWtmWScA6qcucLOVgm9AD0h+MIeEUiWJ8S0AbzzC0Mi+y
   koe6lOm1eV8KwqcfOyl1uxk7qp2LIafNiGPmn/kgs5wcCbltIOWTGsZu7
   A==;
X-CSE-ConnectionGUID: HWNMOCMkSg+H5neR4WG+BQ==
X-CSE-MsgGUID: /wyJjm25Rxu65xOkMHP8Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68787492"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="68787492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 02:27:32 -0700
X-CSE-ConnectionGUID: 5ArJQI2vSEq8ON+yA1oi8w==
X-CSE-MsgGUID: jamkD++YQ1exMI5nzbPKgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146132181"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 02:27:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNTMH-0004tB-11;
	Fri, 06 Jun 2025 09:27:29 +0000
Date: Fri, 6 Jun 2025 17:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] kbuild: extract modules.builtin.modinfo from
 vmlinux.unstripped
Message-ID: <202506061718.9bJ7PyNy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250606041029.614348-5-masahiroy@kernel.org>
References: <20250606041029.614348-5-masahiroy@kernel.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: linux-kbuild@vger.kernel.org
CC: Petr Pavlu <petr.pavlu@suse.com>
CC: Alexey Gladkov <legion@kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>
CC: linux-kernel@vger.kernel.org
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15 next-20250606]
[cannot apply to herbert-cryptodev-2.6/master herbert-crypto-2.6/master arnd-asm-generic/master mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/module-remove-meaningless-name-parameter-from-__MODULE_INFO/20250606-121255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250606041029.614348-5-masahiroy%40kernel.org
patch subject: [PATCH 4/4] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-buildonly-randconfig-004-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061718.9bJ7PyNy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061718.9bJ7PyNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506061718.9bJ7PyNy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'vmlinux', needed by 'arch/x86/boot/compressed/vmlinux.bin'.
   make[4]: Target 'arch/x86/boot/compressed/vmlinux' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
