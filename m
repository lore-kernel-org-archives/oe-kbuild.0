Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9743328FB
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204295; cv=none; b=sMf/mFZDVw/3g3birCZ20/y83dTeywIIeGDocVyhuXem32JPx2/lJPfgECN1iD1Pu5TI6RTSbnBiZSXp+GjH+q2J8KHUIMi3jWvpOPTMUVBJcJWf/EE+uufi2M+wcbYqmPB/Tt1IcysT3Up0NJVjPQmJb8n1b8WbIEBBha/dLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204295; c=relaxed/simple;
	bh=Yxmcde3aI5GpgkfiXAkKeqIinJ5iVyoXMe8DBofBVcg=;
	h=Date:From:To:Subject:Message-ID; b=BSdyhuN9oystZvK4XL5yAcdEvcyxlJJrBwG5ZqLtWZHRQpreCZafdU3KtsXcR2na+SsC9R3xhp3FUUFGxubjjZIDgCUSaPzEjvOK5icoKNmHmsjlv6vDXar8BmqHdiItbg49lg3j1hf+Vbz/+0dsiCKuqYux/V9GJkd9XL/hPqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMDnRkXl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMDnRkXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768204293; x=1799740293;
  h=date:from:to:subject:message-id;
  bh=Yxmcde3aI5GpgkfiXAkKeqIinJ5iVyoXMe8DBofBVcg=;
  b=QMDnRkXlCRdp1B+dZtIkhEmD5Q3/fN+NXqhIK4xIwV2K3o0yZ5zPHKaw
   dBz+kfwrtmAAbrmZFQh6qFbDbOa0kLKCuy1hfsYdi45xvNX9Gqlni1Kaw
   jm47sWkjnMVZ2KDyKCUSh7+y3P4EvsuKAchK0GTO7wBjAmOpacOH8B0cI
   Mc9X0ukOeebgYG3Yw2RNBd1VTqKXp/BPCuOIAo9WEge0gTp+sZP03YiSV
   CRLPIQqZMbvhzQFu6Hm4kDV1KkyVOYe6EzSZl+NCb+ZC1K1ZUuaIULn+n
   9ZdSRSTHgPNNhYzu75bnwxO542IMF4r0OSfcyu7vlRzYp83Ug4Y4Gjai/
   Q==;
X-CSE-ConnectionGUID: 5hJoL4foQH+w/RJmRGv6tA==
X-CSE-MsgGUID: Z1RFb6T5QmeiIxy1oxzS3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="72051788"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="72051788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 23:51:33 -0800
X-CSE-ConnectionGUID: my3Z+00gSlW1q3600Uo/3A==
X-CSE-MsgGUID: 7XvxlW3URfGQ9gNipEOmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204305783"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2026 23:51:32 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfCi3-000000000q1-09Gm
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 07:51:31 +0000
Date: Mon, 12 Jan 2026 08:51:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 15/23] checkpatch:
 ERROR:SPACING: space required before the open brace '{'
Message-ID: <202601120840.cvfEwJPL-lkp@intel.com>
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
TO: Anup Patel <anup.patel@oss.qualcomm.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   7098a1828807497eceb8f093a643c5323c7e45f3
commit: b1d0cc846d19a0c03e09b6056b9816e13db09c04 [15/23] RISC-V: KVM: Extend kvm_riscv_vcpu_config_load() for nested virtualization
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120840.cvfEwJPL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#59: FILE: arch/riscv/kvm/vcpu_config.c:80:
+	if (nested_virt){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
