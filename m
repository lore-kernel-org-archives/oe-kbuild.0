Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35496378D8C
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681641; cv=none; b=e1MSy+r/OFQnlHqSglxoRkreVEpMhc8ckPM6xle0f0KZ+fUHeh7lVA8ArYFZj2F0w5YCx0PIDTAezzMkiuKcOonMdTzg0ZoodQz1tIvxOAnU+u7P10OqZpcFa3LH8eIIqe/yQlLnBBFV3NK/hGKqvwrW7/BYPHizmaKp84zju54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681641; c=relaxed/simple;
	bh=vf5KHo07770TxHVKUSBVraUBHR+ZSuB3ERAZPv9eZsQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ej5iceJyhQ4iDLoKytgBXmHvkleHVyBuZnpIKKCmeBDb2b8+hZuPJL8cwijz8SBkwbcebU4HluEDLD3iBYDRhvjLC62em2LxAgbG/Vz2F4L1wXRSL+Itcl4FbnOfdwm2EE2Sr2I2GLLtqUKmjZWnm3Yx+RRg2iU6xaDiNAKrYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGCAjErA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGCAjErA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769681639; x=1801217639;
  h=date:from:to:subject:message-id:mime-version;
  bh=vf5KHo07770TxHVKUSBVraUBHR+ZSuB3ERAZPv9eZsQ=;
  b=fGCAjErAN4DbC2R1y8SRg67HE6cvGnOLdNZEzOBViz68Vfh04q54N/eU
   TTfn7ttCe1KV2R4ZXEDe2RfRvGwZYeEA0GC36Wz86p/2jlmzfC57Vtl/e
   6SVdGHJeJY3jlsXsC5Azw0pHG8x3M7IXdgxWO8sRQ6kw2Cq+2bJuQS5UK
   74BldUZ3gcPBzXCtX+wMgF1XPWIhOo6J1GmxtgNOLTpMonbMNkWRtmhPP
   M6I5WfQLdlW/q+pA8OUfr3YRfdH6GVY67YR85G4ZK8aMmw/RcBMB1p1Z3
   +hWbZvyYy60omx9jifmuKL15ewJ48rl+WboUBxco8GCT9EtA1UyEEdDmb
   g==;
X-CSE-ConnectionGUID: gi7EMAzjTqW4kHLcfzWhKA==
X-CSE-MsgGUID: 3elqkmN+R4WAaGNj4jKiZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93576646"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="93576646"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 02:13:56 -0800
X-CSE-ConnectionGUID: 9idfRLzhTtaHsGC04Q7hsQ==
X-CSE-MsgGUID: ixzpgsmZTD+0328CpR1Kow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207654796"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2026 02:13:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlP28-000000002Ev-2ai8
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 10:13:52 +0000
Date: Thu, 29 Jan 2026 11:13:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] rust: nvmem: Add an abstraction for nvmem
 providers
Message-ID: <202601291107.dmYvIvQQ-lkp@intel.com>
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
In-Reply-To: <20260128182925.13225-3-linkmauve@linkmauve.fr>
References: <20260128182925.13225-3-linkmauve@linkmauve.fr>
TO: Link Mauve <linkmauve@linkmauve.fr>

Hi Link,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Link-Mauve/nvmem-Document-enum-nvmem_type-and-its-variants/20260129-023240
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260128182925.13225-3-linkmauve%40linkmauve.fr
patch subject: [RFC PATCH 2/3] rust: nvmem: Add an abstraction for nvmem providers
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601291107.dmYvIvQQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'bytes'
#122: FILE: rust/kernel/nvmem.rs:61:
+            // SAFETY: val should be non-null, and allocated for bytes bytes.

WARNING:REPEATED_WORD: Possible repeated word: 'bytes'
#142: FILE: rust/kernel/nvmem.rs:81:
+            // SAFETY: val should be non-null, and allocated for bytes bytes.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
