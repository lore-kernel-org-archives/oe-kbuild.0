Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29975336EE0
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 06:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868074; cv=none; b=kavfPERrMOl96jvVkstksGk9ROGEN3/Nt6BvRaXOtvjsVrZgyw8Q3svXfF9l8vTrGXnt3i3W2i5I4Dbp4ozgHPnmJOUICurVT16iv5b5VRvXt3N8nKCzub+Tcd0LuRpOxdVnjJ/dUwuCXyeIG0ZS/iqskG9uC5ZAjqwMn/NmwoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868074; c=relaxed/simple;
	bh=2Au//Et04+GeS4w/lCbxUbFgpRWsfQeNbZgoyzs14fI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPtUUSBGV+OReNFT0mLuudg1EJ7RXvQL/S3qDodaUVLQCgCEY3sagY0eU3mcltebZXayhVMW+7VbYCCugp2CTl78/e2q/EwsEIWKt/dBNQZ8J7NPFYTFyVOMklTZzY7h0SXMQNDMDxhyaA/zE/98XcCca24BafJ4tlwBVdIyUCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mywGz35r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mywGz35r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765868066; x=1797404066;
  h=date:from:to:subject:message-id:mime-version;
  bh=2Au//Et04+GeS4w/lCbxUbFgpRWsfQeNbZgoyzs14fI=;
  b=mywGz35rIrwWDF2KvvkyXlKfehl4dn4QgQbNzPB1qDgQGik9SpyWXmb5
   PfXTlPozczYrvrzeu7BVNcoIBAznmTYAjUt1gAEeKO6cLOZjmGnSqjeTh
   ZF8EPou5o4dXgzniwTWS653C1qzspJstpOlNCm5fkGh0gj5HEwupYgkJW
   RlVMI3aYfS6ZPyFLwy1nVxpIjq6KUo4PP6wdZUvqh3NNjuX8RrO5sO2LS
   WBEqsNlPQDbtLC601qplgNAa9NwcSwtj5pvS1uh4h6JdjJ5x34CG7zSFr
   jAQ2orevOIMUQ+t338hHKgsgulL4XSNdu6jAMiYVCXkNgN0oDsYoErwck
   A==;
X-CSE-ConnectionGUID: W18u4ZW0R2CEV6x87pt2Ew==
X-CSE-MsgGUID: nNtkTzUFSXi6CAggn980ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71408743"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="71408743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 22:54:14 -0800
X-CSE-ConnectionGUID: LQ2sYjCbRI2R9EohXaWnmQ==
X-CSE-MsgGUID: ve5Gar4KRmSdz8eEfZWwbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197034763"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2025 22:54:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVOwl-0000000032C-0kpf
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 06:54:11 +0000
Date: Tue, 16 Dec 2025 07:53:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 15/26] KVM: nSVM: Drop the non-architectural
 consistency check for NP_ENABLE
Message-ID: <202512160704.zDIigO5w-lkp@intel.com>
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
In-Reply-To: <20251215192722.3654335-17-yosry.ahmed@linux.dev>
References: <20251215192722.3654335-17-yosry.ahmed@linux.dev>
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
patch link:    https://lore.kernel.org/r/20251215192722.3654335-17-yosry.ahmed%40linux.dev
patch subject: [PATCH v3 15/26] KVM: nSVM: Drop the non-architectural consistency check for NP_ENABLE
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160704.zDIigO5w-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#23: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
