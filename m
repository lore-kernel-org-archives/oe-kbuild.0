Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E0734D917
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071679; cv=none; b=qc8fPOV2YzXsms55jR3GROpexJe0EFCZAv+dFJP/fYEBHPstEedFwEePoCTRRWuK6oSYvNJKulugIVABp0fZr740BpqhZtVYIYTB9Jrawng42t6zHBgT1u3nMt4VNKUNMiohrBmx8JmLwts2yXLKX57xmZlzRjYDAsOrPzAnnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071679; c=relaxed/simple;
	bh=O9rllVN0vpoxUIP+tmuJ7S9K8SSzPi57N2qxi4w+f8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hhq5ySz4HbfH5ZphhE6pQnC/irlCZtkt2mpeq8XV4J+GvITgYSQ9t3s04dyAThOBXRYnOcMINZ8bZtVElf+LZ4fvaDbqlxnYeeHLE0UIHEDQGLPMp6y1yjY9J0Be6m4kjXqkpaHGobwA6hNDBmi37WO9IdRzFvcw1Re3dcuKuAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2dcWkBC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2dcWkBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761071678; x=1792607678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O9rllVN0vpoxUIP+tmuJ7S9K8SSzPi57N2qxi4w+f8A=;
  b=k2dcWkBCnrI5x+jHwJCBPuYtdkPiYbMd+y8alFlMw4s0EyIpuCw+t8yJ
   /oouT5nbuqbUMA/rgxatjg5PIQVcs9Fg0a5j5bAPllFjJzt6timAlspDF
   WNi7wC89PfmYPEWvMimqPKzCW4aykWr7Fe2NbawWz/ihTK6SOepuitFf2
   HA9QCLqAiFiJgj9tfm1+bkxzFmxCqHrloW93oKq+fX4ihj7R98DH14MQN
   ohrr8HnG7A9/dn/5v26XlzGHun/GpTtIyG3+xUpigqS8jaEiwEtAdf1hO
   JMq4Y2vLGl60E9NF9uYVFQqAcnJeXgHcqTWwJtXYMtqCGHKINaaKIDWNk
   Q==;
X-CSE-ConnectionGUID: T6BUVafPS5K9XForoy5SPA==
X-CSE-MsgGUID: qoqK1nkTT/2Xjom4wpYTPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63131477"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63131477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 11:34:38 -0700
X-CSE-ConnectionGUID: kR15UUb2QYKLz/yvLj175Q==
X-CSE-MsgGUID: fGPVfF8eRK6HqPr9IyYtSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="184067516"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2025 11:34:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBHBq-000BBN-1w;
	Tue, 21 Oct 2025 18:34:34 +0000
Date: Wed, 22 Oct 2025 02:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: clang-16: error: unsupported option '-fsanitize=kernel-memory' for
 target 's390x-unknown-linux-gnu'
Message-ID: <202510220236.AVuXXCYy-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 5ff8c11775c744dc5076ce126eb1b3adce0a70ae KMSAN: Remove tautological checks
date:   8 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r133-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220236.AVuXXCYy-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220236.AVuXXCYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510220236.AVuXXCYy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang-16: error: unsupported option '-fsanitize=kernel-memory' for target 's390x-unknown-linux-gnu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
