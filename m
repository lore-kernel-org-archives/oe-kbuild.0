Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EB120C490
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767166131; cv=none; b=jPm/rBc2kP9oZy2b4hEGkhb3TD811wVvgxh3sxSwtPA7E+GmuDCwyEjn8jg8xJAJt3rmvdBJ0CFXzOBislpeT76T1UCsP5p2PiuQ3UanKpcGfLPzLbTdHTer+P4EKiTWPvxERmo3V+iZ6EwJLbi1xrN7xEjYBydmAUulHUSLCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767166131; c=relaxed/simple;
	bh=ATVwTL/miUNUXTSv2D7hjw+IN5sf1k1gwp89R7CCACM=;
	h=Date:From:To:Subject:Message-ID; b=dryBtSTjmV1qsl2wWkvTabTGXPDLFh/MO2O3hWjzH5ttwXZkeDCN0xPixAdRsiimMGqoR9xlnC8ILFUTpxhVi7u63LhKejEprIysYg/4LSHdYqUSBrBsVtov8FMZ27NDeZ1kvyDwEbbNgOkSPy3wThhN4QvRuL4GN8ozrx+SICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2msZKef; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2msZKef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767166128; x=1798702128;
  h=date:from:to:subject:message-id;
  bh=ATVwTL/miUNUXTSv2D7hjw+IN5sf1k1gwp89R7CCACM=;
  b=b2msZKefh2BfT4I4W1urLym0UF+oun9YFa487lHnidgA4C2HnS69PkQ6
   azewgmBIq7C4yxN/QpL7Tsg7BOkguFhEgwvNpf8KZja4o7a6kYn+cJrs7
   d/Q/Gzbzjr0dWW23IDuaQeKgfUZre6TAiIZqGt9QUXQGiMblKGfVD/Oau
   KOaM2OD/FDMZ0IgjSEG7hXrWRijuUyGvOd+hW2o+7fw9i1L62KhvQ0ur+
   4u4HC9vVktoZMKr1wptv6gr1Bvb0/kfeJRTTOlV1pHuVFj4CQXsidRnAL
   tsuvrDU2ITCW+7I6O13FroTy9i3gG0pcN4ROKf3Gu3kcOD/Zz2V0TYb55
   Q==;
X-CSE-ConnectionGUID: mffHSJANS/ixBvjUkPK9pw==
X-CSE-MsgGUID: g7IIB2tMQSqlP6n9DeG2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80114475"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="80114475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 23:28:47 -0800
X-CSE-ConnectionGUID: raY024xUQjOWL+83vrnMFw==
X-CSE-MsgGUID: TiSr0+M0QRS0/Uq+ajbLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201261517"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Dec 2025 23:28:47 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaqdQ-0000000001F-349A
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 07:28:44 +0000
Date: Wed, 31 Dec 2025 08:28:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 7/14] checkpatch:
 ERROR:SPACING: space required before the open brace '{'
Message-ID: <202512310804.iireZhS9-lkp@intel.com>
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
head:   d9789002a11efbf06d07540d80dbe5fc7d7bbeb2
commit: 62bc64629da72d3981054bd37e504427c4439b56 [7/14] RISC-V: KVM: Extend kvm_riscv_vcpu_config_load() for nested virtualization
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512310804.iireZhS9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#59: FILE: arch/riscv/kvm/vcpu_config.c:80:
+	if (nested_virt){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
