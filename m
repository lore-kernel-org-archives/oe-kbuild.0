Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F20E3128AE
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294727; cv=none; b=AkED3cY5YMbg9+Lp5sMMjBBfNocq2Foo0nDqbHab6vS0LKCWLdCcme9aoskhagGZi3zAPEUrL1VkJpuRnh0HqLEBf/+GzMIjrkJm4CwqAP3adUYcLvreo2xagcB2Je7MN6kmU4M3EMzXDm7oGDtjdYUQqtV3SLDqfsvGUuSGH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294727; c=relaxed/simple;
	bh=7izQSGCCfBya8PpZkiwjAnmxTAf2MDz2PQRmDEX9+DI=;
	h=Date:From:To:Subject:Message-ID; b=b08S2IAcdZJbzXXIOg3bbX1pxcae+uWznOhcDyS9rbFRRo0pkaoh5VZo2CVFkXHVkEnMEuofS15oLTgtbBBbmn5PYj3x6tew2MqTcGfSCg4dsTF9hJvEXeucHGBvoixcStO/9LcuO5upHy9aqr84tUvg2W6EpajoKUiIciUM5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+Z81nVv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+Z81nVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768294726; x=1799830726;
  h=date:from:to:subject:message-id;
  bh=7izQSGCCfBya8PpZkiwjAnmxTAf2MDz2PQRmDEX9+DI=;
  b=F+Z81nVv0zMys8THrj4MYJgR1msBrU1e/5w6JEPy0xp6ZaRVKqPdv3Rv
   P2kZ5pemplQorqRNBCLAWavuzTqJUGIeFG/YBfknfA+Y/2+C43fhDyS/c
   0umLX7AvHSccXxcX92nGJjpswoy6QZ68JMgNHWIsega43HcTwtuJwbdRW
   tDhnjHwfrAiZzBl1Nhh8rLcYrqvH4jgCCqNyvXv3x869RJGj6YZhA4+3U
   IegsznjOmVTWWLZ9JWzRy90dtJjEpF2j5HxcasKvOWk42W41Cd4gCUouV
   9kxWVsn82RAnwkkNFWjcYIe8I+hwkwS4hnNNvYuLhO/oflzMFZqylVSq/
   w==;
X-CSE-ConnectionGUID: 5gf6MwdTRReSos9avhPJvA==
X-CSE-MsgGUID: AyknTzp2QUmqSqlRgEAmWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79872097"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79872097"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:58:46 -0800
X-CSE-ConnectionGUID: O74jJUKURH+Vhy+qp15s/g==
X-CSE-MsgGUID: BBZaVp+7R52wctD7TRxNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227540346"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 00:58:45 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaEc-0000000017F-3X6c
	for oe-kbuild@lists.linux.dev;
	Tue, 13 Jan 2026 08:58:42 +0000
Date: Tue, 13 Jan 2026 09:58:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/fwb-for-all 2/6] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601130951.sDCOyTSR-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/fwb-for-all
head:   8303baeefc77b48d867707c12020e03d7ffc5f9b
commit: adf606aee64d1d812651913a831fafd92768aa5e [2/6] KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260113/202601130951.sDCOyTSR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#41: FILE: arch/arm64/kvm/hyp/pgtable.c:665:
+		if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)			\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
