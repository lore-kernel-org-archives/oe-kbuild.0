Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E12D592F
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241727; cv=none; b=k+41+M4bdZ9DUYfIV50FPMAeZO2rHJttzT0whHZWx2jlPY7aONwlL2VL8y8zBCt3r/M+Fj4O8G7sTS84KxBlpocnZL3hRxOfDw8FdVjpA6YO0ajkvubBiEDmNp6Gv9EdMYstHjaQmJEDdbZHGqwAgUFeWQrwGpprDPe3pPaagNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241727; c=relaxed/simple;
	bh=Io7VUUmHV4/TWhkmZQEqwhSGkMyubKTEgUKyxjQxnUo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZkExk9t7kCjMbVdVApP/JfjA9gAx4opIy7oeFMKkt9Tm7gR45NCNc6K2e/llqoxl1knjvLrYK+vHLS1hPhg+nM7L/IVX30FlU1pgSQ0NwRVW1Pgeoz6gVpzhLZZxDzd8watszQO4lzuHpmQYVAyphgUP4r+02aHKCEXIBqtMU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESS8C8pO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESS8C8pO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771241725; x=1802777725;
  h=date:from:to:subject:message-id:mime-version;
  bh=Io7VUUmHV4/TWhkmZQEqwhSGkMyubKTEgUKyxjQxnUo=;
  b=ESS8C8pOPOfKZ+29w6puuV69HUyS3P2LFtfyREcx/0ueqGuLYYvnmscl
   S06eCXc2Qjj401StKaYjm8COZ+1KRKOLPnq/r0NUzbXaQWB9Ki/1dAE0g
   C66VrAhBLIxymsdgWcUbd1iBxKHo16Xhmg6rKNQlRDvb+SZlH869VJXYX
   qM4kEzp2iW0Z9YhaOyMTIHFhkOFDYugIgu+dPaPYYXZzqR7nOLsLUG1ro
   JhroSOcgIaqq+YXkNp4gksvgntCQ7i2oaJ95onjdfh/FVaXoa6ZqC91u3
   kHYxBIBDZkMh+n88a0V5JXJY6OiS0MRagESMdMyNH6YnYCoYrDUwk+EvQ
   Q==;
X-CSE-ConnectionGUID: 2nMFvqgQTXWkShqpGAAZ9A==
X-CSE-MsgGUID: MRSDTAg6RtWH+06/wHdaLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71520511"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="71520511"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:35:25 -0800
X-CSE-ConnectionGUID: U/xICY2iTuaOQjdS4u8mUA==
X-CSE-MsgGUID: 2vLudV8ISJWf7T8GBtCCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="251243215"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2026 03:35:25 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrwss-000000002Pt-1rOt
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 11:35:22 +0000
Date: Mon, 16 Feb 2026 12:35:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private
 stack
Message-ID: <202602161230.JTOEAOX1-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260216152234.36632-1-adubey@linux.ibm.com>
References: <20260216152234.36632-1-adubey@linux.ibm.com>
TO: adubey@linux.ibm.com
TO: bpf@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[cannot apply to bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adubey-linux-ibm-com/selftests-bpf-Enable-private-stack-tests-for-powerpc64/20260216-182353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260216152234.36632-1-adubey%40linux.ibm.com
patch subject: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private stack
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602161230.JTOEAOX1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#239: FILE: arch/powerpc/net/bpf_jit_comp64.c:212:
+		priv_frame_ptr = (void*) ctx->priv_sp + PRIV_STACK_GUARD_SZ +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
