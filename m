Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8096221F1C
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 06:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582326; cv=none; b=OIvG93GrdEy6IyMUe01556p5LG8nMH5X03GuY84fUeqHAJdRBj19C0zlRBKfBcpgZtzx5EoL0Emgwk0NQMY2bqaiKWFWUue0xQS0K2rMiITmHNO8FE2tf3bw9QtNX8YOn2uP4dbPQc6+3k7L8XmaXZDDCujfTIC+aqdyhpONguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582326; c=relaxed/simple;
	bh=PEePrlcP5Jt0GMCrCCcokS/uPGv8Lo04Gkh1dRiLi3k=;
	h=Date:From:To:Subject:Message-ID; b=TnFamzXCZ1NfMU82wuZ8i73nJuoSqylpiFcopa9VhufZaNnV3+lG5B/nJAW7VlwUZyNRqb4PNT3IV/SFyUfvISQLzetDIuPOX386lbOUFor7PrBBpKq46a3ufNG/nfKPEQhFyNH3PU+BNKeYNxETjqC9T7XX3XwHEWsTerprTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/3BSOkE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/3BSOkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769582325; x=1801118325;
  h=date:from:to:subject:message-id;
  bh=PEePrlcP5Jt0GMCrCCcokS/uPGv8Lo04Gkh1dRiLi3k=;
  b=h/3BSOkExbJYSbC1TN6bvMYV2jyifO0axrI4+tUo3/YKYFzdlTur3Tbz
   QPUgHi5yBkkE/n0deJgib77qPuxzaopbeUUMFkQ3fnyECA2wrKCLQ73tG
   EaGP8NVSNQ0vDBeSE1GkE+0izqWTXnIZoaxQAFRQIlLv6PMPmfdOjELrX
   5nSr2laLp8R0LC3rst4GblLf/T2qEdyf2KkYkz1ctg4yXVGN3OWjY0jCU
   lMvMcHCHBXBQPSO/sXJIxp3Y3UqZEYolcHEW8u7ZhTccg1FaAJ+lHPLGs
   iZQcqFhB2YBSnKkyDYg/5LGefyGC6l8lUOnLZZmNkfhGPq3PIcoE17t1U
   Q==;
X-CSE-ConnectionGUID: I1knIRe3Twm31BZU4RveMQ==
X-CSE-MsgGUID: iYGEQOgIStCWNOM7fyzNww==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81897315"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81897315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 22:38:44 -0800
X-CSE-ConnectionGUID: pTxKXl1CTVq8qA+DcHcAQA==
X-CSE-MsgGUID: XChr5JFYS/WfTrl3SNHGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="239440183"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 22:38:43 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkzCL-00000000213-22P7
	for oe-kbuild@lists.linux.dev;
	Wed, 28 Jan 2026 06:38:41 +0000
Date: Wed, 28 Jan 2026 07:37:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 39/54] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Xiaoyao Li <xiaoyao.li@intel.com>'
Message-ID: <202601280715.eiust9vf-lkp@intel.com>
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
TO: Xiaoyao Li <xiaoyao.li@intel.com>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   3b511dbab1652dd9db652f570619fd5d0767ede2
commit: a5ab549e271144ef1bc25e8bc2a307729fdc6a4b [39/54] x86/virt/tdx: Add API to demote a 2MB mapping to 512 4KB mappings
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260128/202601280715.eiust9vf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Xiaoyao Li <xiaoyao.li@intel.com>'
#70: 
Co-developed-by: Xiaoyao Li <xiaoyao.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
