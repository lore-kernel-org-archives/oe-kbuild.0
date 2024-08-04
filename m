Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B46FB9
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 21:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808235; cv=none; b=s/9i/StTbhFH3Ccev5mIXYCLp4ZrgRRdvXSfLxI7T3W0tv8PxVIYvZeLKFCBxFUy5kdE3pJj5OV0Lfb3KjU137K/s/wE8NZ0gdqvNLLxvNc/C0yB8obJXI7tDT/c/rJ7NSb2UrrQmo2h/IA4TMkfqk35mefRhUARSEu07ojU9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808235; c=relaxed/simple;
	bh=Thc7SSXKhRVntTAQL4SSUDFrVvqb6RvVW5r4g2lCgLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kll/X5GYePqijohVEI2EiNZa63sPZjKnPoLgY4U3nbkPLNDE9cWCeg2uDkA6+U/8AFR0rtxbhlXLK+ahdKc3Z9KzGiZGdS9lUPwvuhovfeSeRnTd/59O89iO8IwTxxNi6KHvljqEEq7dyjr5SfCidH8gfEh0khTWOWmNtlm4L5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLExOFVw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLExOFVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722808232; x=1754344232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Thc7SSXKhRVntTAQL4SSUDFrVvqb6RvVW5r4g2lCgLc=;
  b=FLExOFVwbuaePw6RQTSJnohrRqcHRT9sWcAXWXsjkD//ZoSWi4PDiWfH
   NmVvxiJaA8mSNtjV0raL7fNIzzT7uykA0QcW7nxVCbyiRnqolMGf7jMZo
   vEwwDgd7tJqxXmWGvkz64jK16aiIcHJnRXgIlNK+YDSimgSWPECbqDkgq
   nRMpz8X4D/edZpFgXmcP2A0AF5raXz7rZvXKEXsY7uBDfmEJMMRGOwPql
   kQnHRbMeueKT/85LN1F1DuJFjAhmzwppku6qXG4vax1Rq1CUFU360Urtb
   ySbIWevwJR93Wb9/B/r4Vy4bQSWYXhgDG9boeAQQCo/P3Nvz4zs9aVBpC
   g==;
X-CSE-ConnectionGUID: xIyBWvqSTxGfHmORKdnAOQ==
X-CSE-MsgGUID: fe0NQUpXQZm7x5wo7A5VEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="43279452"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="43279452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 14:50:30 -0700
X-CSE-ConnectionGUID: rkGou2JWQ9StYONtKYgx/A==
X-CSE-MsgGUID: /uqcK9sYS5KpfU00+jexyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="79240576"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2024 14:50:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saj7S-0001ce-2h;
	Sun, 04 Aug 2024 21:50:26 +0000
Date: Mon, 5 Aug 2024 05:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/seccomp.o: warning: objtool: seccomp_sync_threads+0x50:
 unreachable instruction
Message-ID: <202408050512.CRRcyM29-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrei Vagin <avagin@google.com>
CC: Kees Cook <kees@kernel.org>
CC: Oleg Nesterov <oleg@redhat.com>
CC: Tycho Andersen <tandersen@netflix.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17712b7ea0756799635ba159cc773082230ed028
commit: bfafe5efa9754ebc991750da0bcca2a6694f3ed3 seccomp: release task filters when the task exits
date:   5 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r112-20240802 (https://download.01.org/0day-ci/archive/20240805/202408050512.CRRcyM29-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240805/202408050512.CRRcyM29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050512.CRRcyM29-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/seccomp.o: warning: objtool: seccomp_sync_threads+0x50: unreachable instruction


objdump-func vmlinux.o seccomp_sync_threads:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
