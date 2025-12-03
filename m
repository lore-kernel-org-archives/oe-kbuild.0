Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2161C84BB
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768038; cv=none; b=UHiZjjFbjDuOvug7vMtUmLsl6vxVHq+2PuM0pAzKwCOu1hIy1I7QebLAXz5D4q5jNyq2z6vqaDrHgOgokhkUIQQI3LDqFeRgrFaaz8O9Uoi7goX8w42Ty6oqUGIMLuhsGaeCLwvEgvmtFGcqv35dyb3x795u2qBeI/HyM12ZGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768038; c=relaxed/simple;
	bh=D2+zp+C+TgP6BIF9JAl5BMYDdA+UNdDrg+1crFHPod4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NJasVhziigi2P78wgOuGGvAE6c92VdqJN7ocHk/vvX5t6haWlWwL9VCzYW86Sa1RnKczDNUnaTlQpBWH3bq/1C/4O1eCZiqhkemYpnrWl/S34hG2xC8hlfgohasEhzVghH9bn0V2zowuirukMmUfApSE9khIXMV5L8eWXpbELj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CW2BRZG5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CW2BRZG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764768037; x=1796304037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D2+zp+C+TgP6BIF9JAl5BMYDdA+UNdDrg+1crFHPod4=;
  b=CW2BRZG5WrV6rQTFwmHljcbS1lfz0nZ+9m/VuKamzRxYbZSA5zTMw5vG
   De98NfTy4fFGZgA/UKK01rAKrRprMhu0LmOkI81RLXjXXRt1G8zvziK+a
   8diGW1q5SwU0uwLRUwud+ptKvJy1Vsm6OcxRGL0ayc6/4KnsDIfYcIHKC
   dpRAVpdBDoX/hkfOzbv4Ni3vAqRkBkg8YIau06mb2LGmLK7T+kX0674qd
   wbRQHCW9S3zHS0sgG8GVmFs2hLO2eJfNCjfp0nkspjzNQnfv7/uUru+WE
   D/NY8aNy74NPsPj2uUVOSEEfoxnTwVkvRXbrlNRZVc2o0rMkvPmwd0FGL
   w==;
X-CSE-ConnectionGUID: 3HOYvHyXR5OPA18XJh5mIQ==
X-CSE-MsgGUID: u/OIifOMSRykYuoBhrLOnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84351984"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="84351984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:20:36 -0800
X-CSE-ConnectionGUID: 51D5Rb84QAKKyWBSJKBtdQ==
X-CSE-MsgGUID: pXFcOwnPSJ6Lq/EvdyqIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194702240"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 05:20:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQmmW-00000000B0P-3FrK;
	Wed, 03 Dec 2025 13:20:32 +0000
Date: Wed, 3 Dec 2025 21:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `i_private` on type `bindings::inode`
Message-ID: <202512032105.aR0ahAN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "arm-randconfig-r121-20251201 results in various rust failures"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matthew Maurer <mmaurer@google.com>
CC: Danilo Krummrich <dakr@kernel.org>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 5e40b591cb46c0379d5406fa5548c9b2a3801353 rust: debugfs: Add support for read-only files
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512032105.aR0ahAN8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032105.aR0ahAN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512032105.aR0ahAN8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `i_private` on type `bindings::inode`
   --> rust/kernel/debugfs/file_ops.rs:77:34
   |
   77 |     let data = unsafe { (*inode).i_private };
   |                                  ^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `private` on type `bindings::seq_file`
   --> rust/kernel/debugfs/file_ops.rs:99:35
   |
   99 |     let data = unsafe { &*((*seq).private.cast::<T>()) };
   |                                   ^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:115:13
   |
   115 |             read: Some(bindings::seq_read),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `bindings::file_operations` has no field named `llseek`
   --> rust/kernel/debugfs/file_ops.rs:116:13
   |
   116 |             llseek: Some(bindings::seq_lseek),
   |             ^^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
