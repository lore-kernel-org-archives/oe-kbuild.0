Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32175336EE2
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868119; cv=none; b=c1u9kfPqj1P/8Zs3CqMvaKxf4L4i5aafTJIp00K4AkFESnVuLTfvk/dqcGwqZQmIfz/RfpM6pMCVYlnkmRKHxukNcTWjYjzW9Cz6DjnD6y/w7YuEdEZfGZOmE5UwoO02tLkWkR3lVlQM8S9kh8593BtlSoHD1KjjVCxu9pW7H04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868119; c=relaxed/simple;
	bh=xqbjtFxDgH7SAn8j/wcW+s6H8F2Boy41qBnF64q3ERg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciZMCBwhTVZBotIrvdzU9miMPdvNTHQwdOw+WgTmMfZ0tJ6W2Al/rQujiHR4XK9TAhvJ4uOZHR+0OYwMbEel7kxAxAnLRl/NnXJy/vVTpfB3dNZ08myrU9RYcNwFhxExK9qwEcNz1gsLVE9uwcdUHJvDQoBYul946rVna+nolqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZDUIaNN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZDUIaNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765868117; x=1797404117;
  h=date:from:to:subject:message-id:mime-version;
  bh=xqbjtFxDgH7SAn8j/wcW+s6H8F2Boy41qBnF64q3ERg=;
  b=iZDUIaNNLAvepsWZ27znS3Pii1Uc8MZNqfYEP/+KpaQB4o4RvS++aR34
   HFenYjPqzxq1QGsNioMZzsACpUqRyPmfHoCsrfmxeZYvXzrD96W7hwH96
   7ZH93dGbeWBrrRJJbqERnNe5lpl5T+R2TWoPM1Zz5TLb1zPz0RTmJQrWh
   uD1CsjiitP2RXnYqoy0RH6udrZTs1aUfKpM31/GMv0HNpq5t7d4xj6inf
   fuLJ1Z63xDSdrYDBjxLfCqIaxLeiaCs6nj64XpkTggN/li4dh6bRgdg6/
   MlCRE/XgYqVio7jWoHg4VKdwzaVIl6zY+uaNKpCrvUAjRcr4HeboEempW
   Q==;
X-CSE-ConnectionGUID: 4OVum+R4Qbah066AZg81Rw==
X-CSE-MsgGUID: uQylU9EYQZWpD70XG3kulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67533683"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67533683"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 22:55:14 -0800
X-CSE-ConnectionGUID: C03dM/vvT/C+DbCoZIeGfA==
X-CSE-MsgGUID: 2MKp70gpS0q/GdPmnulgMQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Dec 2025 22:55:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVOxj-0000000032K-15fX
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 06:55:11 +0000
Date: Tue, 16 Dec 2025 07:54:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 17/26] KVM: nSVM: Add missing consistency check for
 hCR0.PG and NP_ENABLE
Message-ID: <202512160754.SzvSuLmF-lkp@intel.com>
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
In-Reply-To: <20251215192722.3654335-19-yosry.ahmed@linux.dev>
References: <20251215192722.3654335-19-yosry.ahmed@linux.dev>
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
patch link:    https://lore.kernel.org/r/20251215192722.3654335-19-yosry.ahmed%40linux.dev
patch subject: [PATCH v3 17/26] KVM: nSVM: Add missing consistency check for hCR0.PG and NP_ENABLE
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160754.SzvSuLmF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#18: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
