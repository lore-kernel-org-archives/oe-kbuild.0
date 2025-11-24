Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D12F7AD6
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 23:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764025477; cv=none; b=Ma9N3iZwLNapcdQCYlTQ6ltr3oRORB+paB16F+RrY6XM5er0RXdQezHiL88ChteD8D1NZdN4bniGJlAJOiBMypHPJebHZrdcdrBMIntMClCG1eULR9nuXnUb+b5QvbWg75JZWTQEZ0v0BNTHZ+CWhXq5gUMF4Z4523DPEqi9k0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764025477; c=relaxed/simple;
	bh=yB8d9hDLLDugVwDcA/YPsDSqQ2lER+NTE275Pbt8/80=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDeKO11TX3ZM2eqVBo7FudYn1IrVBQH7qwYw0aLjPXihSi2gZdgzhNEUVraGkejOX1Wwz9h64/JeDAwntfYHQ6EtnPTrvPKUo3zW6tzbQFpE50kGto3Mr1hvNUbMF2WKONPTdQVO2JNFd1P+wEGf66xb7anUBhUbJxjwhDPfSG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmGUqPXF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmGUqPXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764025476; x=1795561476;
  h=date:from:to:subject:message-id:mime-version;
  bh=yB8d9hDLLDugVwDcA/YPsDSqQ2lER+NTE275Pbt8/80=;
  b=hmGUqPXFtts5BUZlTMIo69zjfyMzuZBKujgGbsp2a/jnXWam0he2xymj
   w6kEG1Zu+J3tlZYWUVT2IpjDgEUb2oW7MYgQgIyJdrbQ03rhRbYHn5urx
   zFVZn45N+RN6jEbtFppwtzypFz9w3lPdoHFbpvdoN+bfOKY1vpHFcZXPs
   vwtAwEFDYrs3YT91CXgt2uGYBHBU+q2XOtXd7EdAwnKmJ2cRLfQlduCid
   LCkjQP3tXRSlYufTgTTKcECaTN5Whjfv6KihHsmSxU5iHdbdrGzm1n3Xq
   x5fR7w8ExpgB9aS75xjkxW1fYr+tTWu7/iTOITPA+KfFZlJShQLJi3WbF
   A==;
X-CSE-ConnectionGUID: owsguJ31TQOYnOHcm/etIA==
X-CSE-MsgGUID: 7Hs3AjJUTQaH51AGMKme6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66069279"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="66069279"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:04:35 -0800
X-CSE-ConnectionGUID: X9HAdmbiSPGI6fmpd2D9sw==
X-CSE-MsgGUID: dFqZAqq4Q7G1UbGwAN/t0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="196752075"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 15:04:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNfbk-000000000LL-0Erh
	for oe-kbuild@lists.linux.dev;
	Mon, 24 Nov 2025 23:04:32 +0000
Date: Tue, 25 Nov 2025 00:03:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kvm-riscv:riscv_kvm_nested_v1 9/15] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'context'
Message-ID: <202511250021.DNK7K2wU-lkp@intel.com>
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
commit: 5b7622de6a89e30511495108f579b4095a2e1c20 [9/15] RISC-V: KVM: Extend trap redirection for nested virtualization
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511250021.DNK7K2wU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'context'
#185: FILE: arch/riscv/kvm/vcpu_nested.c:72:
+		 *    with vsstatus.[FS|VS] saved in the nested virtualization context
+		 *    context (i.e. HS mode sstatus.[FS|VS])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
