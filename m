Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6CD27EFE3
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405801; cv=none; b=cybakhyCQUsjUk9rjT8uXL9avhkfYlEojWxs4AjnZnfdyh+M8pgCVTfhb6nmL4QLkXjkMBObtE4KwSGkYbBMU8hoqhTd9GysR7ANb1KvnMmM62VxfwQOGOWcFFBYTnHWLu5zwzovghKNQbWpDJO1ppyqDoSP7zSe4rzZ1CpI88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405801; c=relaxed/simple;
	bh=nZEEJdl8c6pP2Eqpm7fjJ4cJ2peFKXZnCm7BjohBqOo=;
	h=Date:From:To:Subject:Message-ID; b=pR6yHYQ0KtTe0YlOYfJRg4Y7z1PIO+tY0doXT5khwRgxSUgLMMrZaQcvOkZQegVPQQp4Q7WkgnU0X99qXetF9gyr2PYgUDLHxOk40jM6h0Mnax0WmTTrRoxrdKGzEohena3W+acwnFTAzyylLYvBvYJFQBcjQohn3xWKg8KRcoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6V9pUMq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6V9pUMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768405799; x=1799941799;
  h=date:from:to:subject:message-id;
  bh=nZEEJdl8c6pP2Eqpm7fjJ4cJ2peFKXZnCm7BjohBqOo=;
  b=Q6V9pUMq/OyO80b1vXNYVHMnq8KvNb6mvf8lNnPqz9bBkYpUCgGXFfkV
   ptuJJrt6LO21zTjiWBe9SOu5tAiQKGooZTWhMU50LeURZz4eVJMrOzMEC
   nPrULSjFygOrjmlkNWWSDwHHHRg12NIqRerhMZjFM4eKbIywjaxUj/8E7
   n/DmaNuvKoDhXoKBShAUsblvkPqQXsYM+bOMjJcSBSFZfNssNjALRU067
   Q0+MzowTXxtIdcoAL9CxigQF9E0evknDWZiLOEDMVpzS6k7hZXHHuVBTj
   86DADRw+p7r+idIMU2imNlEv/UVN9PXc4a01TPOFUQZb0UexzCIBOIc3m
   A==;
X-CSE-ConnectionGUID: iDlUSgVdRmuhn7K87r+6Tw==
X-CSE-MsgGUID: +1vq+zwKRKy6/Ztf5vbIjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92376750"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="92376750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 07:49:59 -0800
X-CSE-ConnectionGUID: MFSTyK6GTQulyU/TKcR4QA==
X-CSE-MsgGUID: eazRqVh+RR6WPkc1xsxrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="203845610"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2026 07:49:59 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg388-000000001QL-0bOM
	for oe-kbuild@lists.linux.dev;
	Wed, 14 Jan 2026 15:49:56 +0000
Date: Wed, 14 Jan 2026 16:48:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:vmx/vmcs12_fields_hardware 4/5] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Xin Li <xin@zytor.com'
Message-ID: <202601141632.Sr1hXtjw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux vmx/vmcs12_fields_hardware
head:   bdf0ce61e3f3d9aa2523ab36c65f50f8a07f8ff1
commit: 010be31261f04ac3030bcb601b11c56b83cde97f [4/5] KVM: nVMX: Disallow access to vmcs12 fields that aren't supported by "hardware"
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260114/202601141632.Sr1hXtjw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Xin Li <xin@zytor.com'
#34: 
Reviewed-by: Xin Li <xin@zytor.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
