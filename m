Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F82D7DE3
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195855; cv=none; b=D52IESieSZcyq8I8i/MHMZpZSok64W5pQOkRRQuZDsOymet5vWjjYrpK+ZeXkiHJMFS+kvf/GGM+Cy90Es1J6cGXAjbusKtV89axjTZFOL1/K2+9dKkvBZkCodwV/brH39iWL6AhFqWEAnx3YVE33UCW+bAEhSUCa7RBY8tx0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195855; c=relaxed/simple;
	bh=zAtncTyUbgMt265W82QqdaIXuwBYPJdeXYxZ7jH8L/k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HeXdmePnPRMvGokHUeCki/7oMIs3KIRfBjUlrrDZUu/KcQpU5R3TKOp/nYvgUymsKfQ5tw88FYDxt6kkbD1X/ucggrd2NrYkYioIHRN38I3DeksIy7wD+juESc7n4Q4tGVPnSzHCci0iOSPwliZvQ+Lx27YuDb4PLPZkF4c9j2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtqyPxNK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtqyPxNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195854; x=1797731854;
  h=date:from:to:subject:message-id:mime-version;
  bh=zAtncTyUbgMt265W82QqdaIXuwBYPJdeXYxZ7jH8L/k=;
  b=TtqyPxNK9+XRBxKDv8PF0PeRNMVZ7iCtR9CjQ3adJDWCTBOaejwOoPPn
   /S8Mt7RQa12oneE1fJ44rK1r+ZvrIW9E4ao5XxrTHoX4CYlNmuvzTlhMZ
   Je7PCAyHMqIn06pDtK1nND6H07HOY+gH4/T7CRiwnWLlz7qFYIecEGepH
   DI/I92Qdcl7g2WzEi1GAa5mWsdDpmNjTHZ2iVeM7XvSAZ2UVzizd5mJj0
   U9m4c4YHZoJlr79ByZMM4bwvEZ/Bw2HE7XG2RwtJtWdov4GRbzwNzM5L5
   nIQjukPBJK1vbHcwK7huBvKGM7TKLXhIg07hnWkvu+9xoKHnPUxhhZ20M
   g==;
X-CSE-ConnectionGUID: qULLRhZQR9uMhZmPh61x7g==
X-CSE-MsgGUID: cK9mPCTWSlSWOmx80KDYRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67151772"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67151772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:57:33 -0800
X-CSE-ConnectionGUID: 7bM3fDTFR6+Yjo1/lMyxVg==
X-CSE-MsgGUID: 7/CGDcIaRfeUonIbw6WlZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="203154976"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 17:57:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmDp-000000004Sc-46nO
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:57:29 +0000
Date: Sat, 20 Dec 2025 02:56:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 78/82] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202512200244.l758hQfE-lkp@intel.com>
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
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: ba5d2e0b287e57a009751d6a993a4b31206fd97b [78/82] KVM: arm64: gic-v5: Implement Save/Restore for ISTs
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200244.l758hQfE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#64: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:570:
+	if(!list_empty(&vmi->pending_irqs)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#114: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:1215:
+		h_iste = *((__le32*)h_iste_addr);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#144: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:1245:
+	void * h_l2_ist_base;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#187: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:1288:
+			h_iste = *((__le32*)h_iste_addr);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#319: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:1420:
+		*((__le32*)h_iste_addr) = h_iste;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#349: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:1450:
+	void * h_l2_ist_base;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#413: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:1514:
+			*((__le32*)h_iste_addr) = h_iste;

ERROR:SPACING: space required before the open parenthesis '('
#652: FILE: arch/arm64/kvm/vgic/vgic-v5.c:653:
+	if(!vgic_v5_irs_is_quiesced(vm_id)) {

ERROR:SPACING: space required before the open parenthesis '('
#666: FILE: arch/arm64/kvm/vgic/vgic-v5.c:667:
+	if(!vgic_v5_irs_is_quiesced(vm_id)) {

ERROR:SPACING: space required before the open parenthesis '('
#679: FILE: arch/arm64/kvm/vgic/vgic-v5.c:680:
+	if(!vgic_v5_irs_is_quiesced(vm_id)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
