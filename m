Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E363373BF8
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 01:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772501535; cv=none; b=KscewT1WWrqt5Spr9Ym9cGNU1Ts7HrtIMbITF/DZveZ2D7JsV1BgzDYFb3XhJ+2o6OOlJAYcpLEEYCBSwDOf33VSc+3ACQG45GF5hSDgQ1klMaCxWkwJfFqxyA1hE9ZzlIH8uraeadLHFiIx1lOfNJH9BU6S/ipSOqY4K/D4ZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772501535; c=relaxed/simple;
	bh=5ifKyszCzUTOwFe7OfwI3KpuHZdWKvtXq+qbWOpruBQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/qsaO7M/pLa9L85ZubOi7X28LdbtHQ/o+85s7SgEOQTv3Sfe3fESc+R13Gwk0cl5g2ppUWFCyVFSWQKP9XTROH165yp2n+kJIHufbAwpEeuo3xGy9AxFzLQJi8/eUx9QrqaLEc5OHvk7ekmxl3qb0P2QvsH9gI+9IFBXefWp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFQY2+yp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFQY2+yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772501533; x=1804037533;
  h=date:from:to:subject:message-id:mime-version;
  bh=5ifKyszCzUTOwFe7OfwI3KpuHZdWKvtXq+qbWOpruBQ=;
  b=dFQY2+yp0x1gRNfYURzr9DlWM/ZlZwEVQj39Fb9FOM2XKd+sWN2u7w/r
   r7+Sipxris8FhdZa9xs50E5gCAvdKdYM1+Ooyznq6YT8fbuYbkH/PCZJS
   hLndNA1xhYKXbXJBgNSdwrp63IOfGr2WtMTn+9jJDfN162bDGJVmLMX+8
   oOe11cR8iZWu2DlpIY/Lmfx2L8qTjULYTkmX3m986Eg425CQEncn6LsSo
   kYGP9w3Y3Qwjg3KVEPkxHnzM7fNI4M06NEyHwyMizDF0LbIvIO31ft8Lk
   qp/w6+AjURgwPNb8OVL74pJg33e6GSVGAIWmEyXNeEUTHSTe56RbmHqT0
   g==;
X-CSE-ConnectionGUID: ZJSkP91oTxGpLIbMoW3qRQ==
X-CSE-MsgGUID: LVfVz3/KQpCsp1Rzh3ocxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84163683"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="84163683"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:32:11 -0800
X-CSE-ConnectionGUID: G/QObWPsStmebiD3JZL+rQ==
X-CSE-MsgGUID: +pWcz0YuS6GACZiI1sHM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="221995929"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 02 Mar 2026 17:32:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxEcK-000000001KZ-32JX
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 01:32:08 +0000
Date: Tue, 3 Mar 2026 02:31:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v7 15/26] KVM: nSVM: Add missing consistency check for
 nCR3 validity
Message-ID: <202603030219.j3PrYjYk-lkp@intel.com>
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
In-Reply-To: <20260303003421.2185681-16-yosry@kernel.org>
References: <20260303003421.2185681-16-yosry@kernel.org>
TO: Yosry Ahmed <yosry@kernel.org>
TO: Sean Christopherson <seanjc@google.com>

Hi Yosry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 183bb0ce8c77b0fd1fb25874112bc8751a461e49]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-nSVM-Avoid-clearing-VMCB_LBR-in-vmcb12/20260303-084832
base:   183bb0ce8c77b0fd1fb25874112bc8751a461e49
patch link:    https://lore.kernel.org/r/20260303003421.2185681-16-yosry%40kernel.org
patch subject: [PATCH v7 15/26] KVM: nSVM: Add missing consistency check for nCR3 validity
:::::: branch date: 37 minutes ago
:::::: commit date: 37 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030219.j3PrYjYk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#24: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
