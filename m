Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C2336EF4
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868064; cv=none; b=RXqUfjYMJhUrDb+Wi/ucJ3pY7aZc8+plnnSOcLZEhojd+cnL0xZhJI4KC/YG5XLmLJhwf31OgDqr3mfivKsirSqGiuzzTrtW5wiZFi44gO3JbzCuUutsByxCseYdMcMVEKQCD3I86gpBk3yKTqhN0A6n+ymBNvIAMLmc289POoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868064; c=relaxed/simple;
	bh=rNns8UdytnBqaVA0NxcQJj/IqBjMYikLy2qupJAE7cw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/bm1qUgjzjuK6fkDFtJ8NcZ+x3GeU5obyhQRS96HWvyvog1SnStsVFvGO9fi5bTzkrJx2u4bnaTya22Pb7bLdcSaygYsVB5Qo8AFfGWt3cXbN0WsMmccZaL491ihf8Z38Uiq3Zr2gaZrzEL1MxrGqSjK2JlJo0Yb/mXG7PIw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9T7Y72e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9T7Y72e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765868059; x=1797404059;
  h=date:from:to:subject:message-id:mime-version;
  bh=rNns8UdytnBqaVA0NxcQJj/IqBjMYikLy2qupJAE7cw=;
  b=A9T7Y72eEo4FI+2aDww9z3LtXS63TJ6JVxm+uVlaq4HdGsS+mzNYuVc7
   ptXAL1GkIND2tsowvzPYZKQj8w3wDDLbganFlakavbAVPekfCa+tCxRkn
   eQztJMiueIYLc5vxamkBFPVuYrj5gjRL9nVKfiniCTR72K+AGqowUOEKw
   SSlt819D4dPWFGUIfzEBV1kAx+Rt/TjhsVANyav2q4Tj6T3dVNLLbI3J1
   59N1+VnY6fT6rG72R5Dj6bBPRDCkx7QLhSLM0dc6nyg3Ry33AdltoVoJv
   hPDW8jtmWCazvPzNqB5nr6TsBh+CPcXZgUOB2/OCyKi6NOw/UlJPWF4wO
   w==;
X-CSE-ConnectionGUID: 3mo1LfLRRgqb1bRDLqyrgQ==
X-CSE-MsgGUID: wv9B0qM5RPyq8HLOV0104A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71408742"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="71408742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 22:54:13 -0800
X-CSE-ConnectionGUID: aSzyqCq+SaSGoy1HkB4pHg==
X-CSE-MsgGUID: 7As6bZS0TNCStqQBpdZHZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197034761"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2025 22:54:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVOwl-0000000032E-0vYX
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 06:54:11 +0000
Date: Tue, 16 Dec 2025 07:54:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 16/26] KVM: nSVM: Add missing consistency check for
 nCR3 validity
Message-ID: <202512160726.jsII8QjX-lkp@intel.com>
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
In-Reply-To: <20251215192722.3654335-18-yosry.ahmed@linux.dev>
References: <20251215192722.3654335-18-yosry.ahmed@linux.dev>
TO: Yosry Ahmed <yosry.ahmed@linux.dev>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Sean Christopherson <seanjc@google.com>

Hi Yosry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251215]
[cannot apply to kvm/queue kvm/next linus/master kvm/linux-next v6.19-rc1 v6.18 v6.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-SVM-Add-missing-save-restore-handling-of-LBR-MSRs/20251216-073015
base:   next-20251215
patch link:    https://lore.kernel.org/r/20251215192722.3654335-18-yosry.ahmed%40linux.dev
patch subject: [PATCH v3 16/26] KVM: nSVM: Add missing consistency check for nCR3 validity
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160726.jsII8QjX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#24: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
