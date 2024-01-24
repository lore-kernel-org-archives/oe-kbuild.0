Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4931C63AA
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jan 2024 04:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706068855; cv=none; b=sI6J3mw0bBTso0/Haj751QQAjIxAKzpkZjX3mcOwxSCjQEQJF+Nqbx4eEjegriyyyxOohosmCWCLl0quEO4R7w+Vaaq7pOSJZS1mF8WQ9AJkbGdrfZAIPS9GrL+lFtVswOJeoSwNEmAGWBDmzc7mPn0DWd9iqR6njT51kJ6KCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706068855; c=relaxed/simple;
	bh=Z9fTZqEK8+MdEDKJozHYlzBEWFV/wA78zCbWGteG5Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E6xO5y5pZh27CPPBNDAEH1oqeX5/DUj7EBs0BfyH6xJqP7f5likdiazzSHeLXQg9nVWqKghBGsS38vyJt7O+o3PloB75ohBfkg4mxuUiW0qNA02tW2C3tlrhjpmM4py4u2tObNf6FSxIL2D41G3VJNVwxDk3eyyC/uI0tn8iWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ga9WBv/b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ga9WBv/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706068853; x=1737604853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9fTZqEK8+MdEDKJozHYlzBEWFV/wA78zCbWGteG5Bo=;
  b=Ga9WBv/bE8H43S1uB7QKj4as0NwK1I0tuVT4icyFJaCkoZdoW28/F0+d
   9R7VQYHLQmdFsT1hQDYmRDqKs3Ex7sRmI96GknGupX642bamH5mhmwRX5
   m4767lYr6kP0i3I3blZFvCDMMSx1a9saBiTOH/Hg0fPxWRsMaxCWDMdoc
   yN+MUpXY+4D/0fZ2N27BuL2dhACsC+u2FoQKoA8f57vgtELYJvwUsvbVL
   oZIfneUhQyQj2z1QgfkKZMmlTiaUoujM+OkkhIsUjlXeTX7WhGUpz3sK5
   ubX08F1tJe0qMrVg4hzQslSLBpqa84bGh6eJMcXDFj/coSV7qlFhhc0At
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8492009"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8492009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 20:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="27971222"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2024 20:00:51 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSURU-0007rN-1a;
	Wed, 24 Jan 2024 04:00:48 +0000
Date: Wed, 24 Jan 2024 12:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /opt/cross/clang-a31a600747/lib/clang/18/include/arm_neon.h:28:2:
 sparse: sparse: "NEON intrinsics not available with the soft-float ABI.
 Please use -mfloat-abi=softfp or -mfloat-abi=hard"
Message-ID: <202401241133.y6ONIn8c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-a31a600747/lib/clang/18/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   615d300648869c774bd1fe54b4627bb0c20faed4
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r132-20240123 (https://download.01.org/0day-ci/archive/20240124/202401241133.y6ONIn8c-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce: (https://download.01.org/0day-ci/archive/20240124/202401241133.y6ONIn8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401241133.y6ONIn8c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid6/recov_neon_inner.c: note: in included file:
>> /opt/cross/clang-a31a600747/lib/clang/18/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/recov_neon_inner.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/recov_neon_inner.c:28:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/recov_neon_inner.c:28:50: sparse: sparse: got *
   lib/raid6/recov_neon_inner.c:33:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:33:20: sparse: sparse: got pm1
   lib/raid6/recov_neon_inner.c:34:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:34:20: sparse: sparse: got qm0
   lib/raid6/recov_neon_inner.c:35:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:35:20: sparse: sparse: got qm1
   lib/raid6/recov_neon_inner.c:36:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:36:20: sparse: sparse: got x0f
   lib/raid6/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid6/recov_neon_inner.c:50:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid6/recov_neon_inner.c:51:28: sparse: sparse: Expected ; at end of statement
   lib/raid6/recov_neon_inner.c:51:28: sparse: sparse: got vx
   lib/raid6/recov_neon_inner.c:76:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:76:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:82:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:82:20: sparse: sparse: got qm1
   lib/raid6/recov_neon_inner.c:83:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:83:20: sparse: sparse: got x0f
   lib/raid6/recov_neon_inner.c:92:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid6/recov_neon_inner.c:92:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid6/recov_neon_inner.c:93:28: sparse: sparse: Expected ; at end of statement
   lib/raid6/recov_neon_inner.c:93:28: sparse: sparse: got vx
   lib/raid6/recov_neon_inner.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:111:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:53:17: sparse: sparse: undefined identifier 'px'
   lib/raid6/recov_neon_inner.c:53:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:54:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:54:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:56:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:56:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:57:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:57:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:58:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:58:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:59:17: sparse: sparse: undefined identifier 'qx'
   lib/raid6/recov_neon_inner.c:59:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:61:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:61:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:62:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:62:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:63:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:63:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:64:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:64:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:65:17: sparse: sparse: undefined identifier 'db'
   lib/raid6/recov_neon_inner.c:65:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:67:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:68:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:71:17: sparse: sparse: undefined identifier 'p'
   lib/raid6/recov_neon_inner.c:72:17: sparse: sparse: undefined identifier 'q'
   lib/raid6/recov_neon_inner.c:73:17: sparse: sparse: undefined identifier 'dp'
   lib/raid6/recov_neon_inner.c:74:17: sparse: sparse: undefined identifier 'dq'
   lib/raid6/recov_neon_inner.c:95:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:95:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:97:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:97:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:98:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:98:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:99:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:99:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:100:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:100:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:101:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:101:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:103:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:104:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:107:17: sparse: sparse: undefined identifier 'p'
   lib/raid6/recov_neon_inner.c:108:17: sparse: sparse: undefined identifier 'q'
   lib/raid6/recov_neon_inner.c:109:17: sparse: sparse: undefined identifier 'dq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
