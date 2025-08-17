Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE6173
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755388945; cv=none; b=VS/xyFz+oQ2q30qRnEdp8ToinpYO33KuiatcF2C5ywBr/MmNNEcVW29yT73Rz/IHu8CUlZmQ8WznwkF4Z9AgvvM9Cz3pEcNXoHrUmM+utVfeZVGc630eIMS2+TQqfws4D5sbAOe8jt9CjMDFgX91uHgJrlTwpdqm1xFwjdHMUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755388945; c=relaxed/simple;
	bh=wQKmmMcshs19CieixHRNi/sVf7J0LsQdkf+EQf0f+hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RvJqLw8E3WzH0rv0XUS+GOEoY4bMELsSCTmsyAYhrA/SXwspg7ZxwvPfS5G2ghU/Kl+SinsEzTJgbS4Ghg5K9NLXWy9u6zczYuMQiPm7QIZN1pOtCWB7TF51Ie2vf7Q+eSWXMUfw1whfBSxP7EuQhgCgcqbqFH2zzIkYw4coY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doa6Mh5O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doa6Mh5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755388943; x=1786924943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQKmmMcshs19CieixHRNi/sVf7J0LsQdkf+EQf0f+hs=;
  b=doa6Mh5OKfECh9zJPuNJ3say3qGiVudF6nyEMbyeYHOU5sGJaDwhaRlY
   6+r/8MCWAk7ATX+nCNKa4lYBpXmcXum9oGlYwtibv+/4yab6cgMTf4Ynk
   r8Xwccysr+yRp+f6m9LL20ojdB8nd2wWdOQYnGKSDaol/ZrCdzJyO0R57
   XrYVGQaNZKyJEST1Sk8P++PbOw4dZW6bmVV5ldFOywdwNvw2szHxMcJIZ
   QwyXfelR3KZE5z5QhYUsIcIeIor/urW+pIhwySAcTQLZ91exe92llQcQq
   PvGPz9JpLNxGLQ8CG3j7CKm1McTaxeQMGn0atxFphBLZfiOiMn9qXWalj
   g==;
X-CSE-ConnectionGUID: k7ZuFscGTXWCXZf/tNnIlw==
X-CSE-MsgGUID: dT+66s3eTi+qIPQeUBFvzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57807078"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57807078"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 17:02:23 -0700
X-CSE-ConnectionGUID: 2+u8Z60GTVSit2hI3QNj4w==
X-CSE-MsgGUID: C2tnH1pESXiHHwbz0WzrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167660941"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2025 17:02:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unQqf-000DGh-0T;
	Sun, 17 Aug 2025 00:02:12 +0000
Date: Sun, 17 Aug 2025 08:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/decompress.c:132:8: error: call to undeclared
 function '__decompress'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202508170746.HXl5nSAm-lkp@intel.com>
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
TO: Nathan Chancellor <nathan@kernel.org>

Hi Nathan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90d970cade8e67e20b09bbfdc2f0b52064322921
commit: 84ffc79bfbf70c779e60218563f2f3ad45288671 kbuild: Add '-fno-builtin-wcslen'
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: powerpc64-randconfig-001-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170746.HXl5nSAm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170746.HXl5nSAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508170746.HXl5nSAm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function '__decompress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
         |               ^
   1 error generated.


vim +/__decompress +132 arch/powerpc/boot/decompress.c

1b7898ee276b39 Oliver O'Halloran 2016-09-22   97  
1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
6efc2f1a64ef62 Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  120  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  126  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  131  
1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,

:::::: The code at line 132 was first introduced by commit
:::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
