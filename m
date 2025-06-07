Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D072F3E
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Jun 2025 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331060; cv=none; b=TNg1J7qd6EeNwpemnnRUUvEblEKJ0D4YJyGzjB6HW6owCw1CXRThAtyPIuHPareG4tWYJhFGJ2m32c16C4HJD/D3x56Q3AcctDNxLg36HfDeNeV92Yrq68uMlSNW+tQwPaKCUo4SIaRIVpPQDsz+jJ+flQUrSilwyB/xwVIh/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331060; c=relaxed/simple;
	bh=0P3t15FJ4/oyZQAgQz34h9VBueIreUKMUviqg80UBbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=li55S9glYRhNF0ZXHmjTGyRJmsJKffV8ssQl5+55/WczaPxxJB+ohauahZCP23STKBVM0bby8SXwaKUYKxMdKlJMo+A82DxRMdZhzJU1yvN/67L9OGaEi4qcq9bDFIygTB5VZeeYRAIQbuu33g3wmQ4qjo1O37W+H4K+cAyDCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XloQPeKJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XloQPeKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749331058; x=1780867058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0P3t15FJ4/oyZQAgQz34h9VBueIreUKMUviqg80UBbA=;
  b=XloQPeKJom73sIyvkzLEIIha6V/2nQgHNocmo6/IxTaxmBUaJVXDgFuW
   tI2t0Z/cldAS6vZCJ2kQpZb7Oam/jAbFdjubvx5c3FojfYPC+uPIfgo3a
   OkUXwAHAAI/qAzbq9ykH1uYCAah7ZVYGnr0VgTy4pM6WF4wcQOZOXSVJx
   T3irMWDrWA9hSZBS7WLi0T2CjT62zZ7zChNzYKEgKO8+C4LdDS7f9Cc0a
   zelNJF9IE6d1Ne+ZhRyFPEQjtaMFBTvXqth706Lp91vF7OEBtDigoxM6x
   YEUhJI91v1vfdoBsqX4zmakVWz6540W3TbacJWvSCm55fn4MixyxrInrj
   A==;
X-CSE-ConnectionGUID: G5dgXyX7SPW0VN+TUFIMog==
X-CSE-MsgGUID: hg27p+l1SeS0W7sHMt56eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="54083776"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="54083776"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 14:17:37 -0700
X-CSE-ConnectionGUID: AZ3vHoulQlKfl4GCnmwzVw==
X-CSE-MsgGUID: tDhcfZN0TQm7QtPasfLIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="147076651"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jun 2025 14:17:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO0v0-00060H-0T;
	Sat, 07 Jun 2025 21:17:34 +0000
Date: Sun, 8 Jun 2025 05:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/codecs/snd-soc-aw88399.o: warning: objtool:
 aw_dev_dsp_update_cfg: unexpected end of section .text.aw_dev_dsp_update_cfg
Message-ID: <202506080552.Nm8DNS7m-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8630c59e99363c4b655788fd01134aef9bcd9264
commit: c5995abe15476798b2e2f0163a33404c41aafc8f objtool: Improve error handling
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: x86_64-buildonly-randconfig-005-20250608 (https://download.01.org/0day-ci/archive/20250608/202506080552.Nm8DNS7m-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506080552.Nm8DNS7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506080552.Nm8DNS7m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/snd-soc-aw88399.o: warning: objtool: aw_dev_dsp_update_cfg: unexpected end of section .text.aw_dev_dsp_update_cfg

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
