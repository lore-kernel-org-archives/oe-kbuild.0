Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D12F068E
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 23:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764025478; cv=none; b=mbUR04+7VzPXXOrwJQHYe198zygqA6Pt5hHEblcVJBggeLNIS5V4efwMq5Xxwq+09zG7SZYTFcbYAS7sKXZ1Sf0jb00dZHh8JVB1dztiVeIxI2aaExdPmz0yDRQCY0XEKgeapQVJGfLUgeOn78CVD4UVBT3YjiI/DdLh1xRN8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764025478; c=relaxed/simple;
	bh=VQV1PBXZjofKVR3gbDptM2etlK9T/yj2jQBvnGtTGF0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OmjR21epRqNqD/RVFS+UUx6DO8zPH4J5nfOaS0Gu0AR9YRewbOlAteY7cO1QTasiLmbzN7Gm89R/nU3bA/FbLIxZVaY3s+orddK0npQZqz363pf8oR8fX8N7i8/9MRdkGHc3H4a0aMtj2E9kgn7waup8FXA6/Ybg3FogQLItuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+J4YutD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+J4YutD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764025478; x=1795561478;
  h=date:from:to:subject:message-id:mime-version;
  bh=VQV1PBXZjofKVR3gbDptM2etlK9T/yj2jQBvnGtTGF0=;
  b=I+J4YutDg7U4SOwEGXIZQNz7e7tmzXzQ8SNBbRpFQzXKlgQvETsBkXNT
   SDiVhvGyOSEhfzmfPFmU4OXocAiVf3ar2YWhmjHp+RaxNvX8DdpI+A9Qo
   xtoRuF8BcyJxpBZKs1Gp+BH+El9ihF6qcV3Ep6kuJG1PER8GB9iGR5RHd
   w9qZwXYTiEtVTWbOgYv6I9JqhaoFlIvR/vTjDGQq2rUHvEbFP/rBOQzig
   WzhhCSfSGQpttPTYkaW9EvY+JBT29aEjMasS1/ukaR7F+lmL3CBvmXciu
   l/ErN0w4PEJoxBOIQYaTeoS8R1tnPa44VY1UeJM9ihqJkO3Z9rZoz/iWt
   g==;
X-CSE-ConnectionGUID: ag9VJCSRSpGvMOiq/rCXkA==
X-CSE-MsgGUID: Hd6dmGaWQKe+EoUcYTHG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66069280"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="66069280"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:04:35 -0800
X-CSE-ConnectionGUID: KuvzdtrPRy2jlGpeTSsG7g==
X-CSE-MsgGUID: Lf0ejFwuSb6ep1RKE3mr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="196752076"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 15:04:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNfbk-000000000LJ-0598
	for oe-kbuild@lists.linux.dev;
	Mon, 24 Nov 2025 23:04:32 +0000
Date: Tue, 25 Nov 2025 00:03:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kvm-riscv:riscv_kvm_nested_v1 14/15] checkpatch: ERROR:SPACING:
 space required after that ',' (ctx:VxV)
Message-ID: <202511250046.Tz9Tepyg-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_nested_v1
head:   ee90dd59d6044feb99891c354aac47218dd3e941
commit: 6e5f032951fccd717d1e5b7ca967d6fc20c8bdef [14/15] RISC-V: KVM: Add CSR emulation for nested virtualization
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511250046.Tz9Tepyg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#148: FILE: arch/riscv/include/asm/kvm_vcpu_nested.h:95:
+{ .base = CSR_STIMECMPH,.count = 1, .func = kvm_riscv_vcpu_nested_smode_csr_rmw },
                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
