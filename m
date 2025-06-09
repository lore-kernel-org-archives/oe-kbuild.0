Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8BE55E69
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Jun 2025 18:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493070; cv=none; b=G/KEgHYZM6rTR5C6gn8WUfE+N9pv5uC0q9l/0H76kLJ/t2oZXc1wKvLUFAXPiWj5ha1wKcrvkfP6FuKf+2q+4gBkyEu1xSnZn+CbJtr+QQQutffSkL2F3r/P8MTvxuLVgIBPv1aKJbLJN/gY3ktjYt5NSr4GO7gATY9iHNZKiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493070; c=relaxed/simple;
	bh=8Z1ialGhZLfl3Fa+CNWcYtXopGU9g9lJg5RVuhaVctM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1wyibk/4v5JSjVtKaPMFIgoL7KWQUm3oyY42Xzh5ber4yI2zDSh9g+FdWAyeWcI+GxH2hG8CJn548tohKtOyOSUa2HAPrZ0pzWDm9bRMZz59k7QljoQCO8YuvnDbtjNQbDuRTi3U7c4dImJ95xA5Rbdp0CBgE0IwsI/WeK61h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Abc5ajta; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Abc5ajta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749493069; x=1781029069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Z1ialGhZLfl3Fa+CNWcYtXopGU9g9lJg5RVuhaVctM=;
  b=Abc5ajtaU24bCUc6qupnF6fHOke5cH/kJUXA8LcwBDvTnRVrPfEwdMnM
   rX3zY5Z6sNqw7ABbeNEcdmqzXml3dDo33WFzp3J4PQechjm/DoCMsS03p
   NEr2RDvA0iOQ/3+hJhh7IbFCbOMtEDLIKv7qxov0uyXUSfzXEKz8eD3N5
   lmbvDIXcOmPvcZjUJwkywxsOB4TzCayRXCHe/T9PTl9Dus1WgljNOFW7Z
   TKrjOiI3h6r9KpShFpaGrnqegPLUBFmBnWqht4pkyk2iPDi5I3juKvmDF
   rJrw/K1UzvckRk18Lpi4PU/WP8HRnTSSOzcDBnlQ5mkW8grwUz8JTuKKK
   A==;
X-CSE-ConnectionGUID: FKZE1pjoQ6u6EvXVFotzXg==
X-CSE-MsgGUID: Z9AI8KDzTwSqWNhQ8kl3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51292415"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51292415"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 11:17:49 -0700
X-CSE-ConnectionGUID: GTVRP6J2TGeQKvuorwVe1w==
X-CSE-MsgGUID: 3UXu8vMcSzm1d8XVP0cXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151396276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 11:17:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOh45-0007JB-1k;
	Mon, 09 Jun 2025 18:17:45 +0000
Date: Tue, 10 Jun 2025 02:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build 29/62] samples/ftrace/ftrace-ops.o: warning:
 objtool: __cfi_init_module size 8 != 16
Message-ID: <202506100232.pcTHUvQ3-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   e751180ffe5aa8f7d0c478c866c8ed4267336bd5
commit: 104616b4dbe48e6abc87820a1af06c19bc142f1b [29/62] objtool: Mark prefix functions
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-076-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100232.pcTHUvQ3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100232.pcTHUvQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506100232.pcTHUvQ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/ftrace/ftrace-ops.o: warning: objtool: __cfi_init_module size 8 != 16
>> samples/ftrace/ftrace-ops.o: warning: objtool: __cfi_cleanup_module size 8 != 16
--
>> kernel/rcu/refscale.o: warning: objtool: __cfi_init_module size 8 != 16
--
>> crypto/asymmetric_keys/x509_selftest.o: warning: objtool: __cfi_init_module size 8 != 16
>> crypto/asymmetric_keys/x509_selftest.o: warning: objtool: __cfi_fips_signature_selftest_rsa size 8 != 16
--
>> net/core/failover.o: warning: objtool: __cfi_init_module size 8 != 16
>> net/core/failover.o: warning: objtool: __cfi_cleanup_module size 8 != 16
--
>> lib/kunit/kunit-example-test.o: warning: objtool: __cfi_example_init_test size 8 != 16
--
>> net/dns_resolver/dns_resolver.o: warning: objtool: __cfi_init_module size 8 != 16
>> net/dns_resolver/dns_resolver.o: warning: objtool: __cfi_cleanup_module size 8 != 16
--
>> drivers/comedi/drivers/tests/ni_routes_test.o: warning: objtool: __cfi_init_module size 8 != 16
>> drivers/comedi/drivers/tests/ni_routes_test.o: warning: objtool: __cfi_cleanup_module size 8 != 16
--
>> kernel/locking/locktorture.o: warning: objtool: __cfi_init_module size 8 != 16
--
>> fs/smb/client/cifs.o: warning: objtool: __cfi_init_module size 8 != 16
>> fs/smb/client/cifs.o: warning: objtool: __cfi_cleanup_module size 8 != 16
--
>> drivers/usb/misc/usbtest.o: warning: objtool: __cfi_init_module size 8 != 16
>> drivers/usb/misc/usbtest.o: warning: objtool: __cfi_cleanup_module size 8 != 16
--
>> drivers/gpu/drm/drm_buddy.o: warning: objtool: __cfi_init_module size 8 != 16
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
