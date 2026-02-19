Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EAB35294F
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523264; cv=none; b=GJ0I8khhPtmTNlnCMYJBNyNe+YBzd/Y+8tHvO6Jo2BM7pr/kuGLigEKVZFAG6wltrRrPbHC7k6dq3qV3+ZUf62PY/alqILW/jVCSIA7WWRzpoer1irQRckeKZF1ocXvHBejH/EgO0gbPrI/4YPxDVCMGH2aP+JCfEhrZZDkO5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523264; c=relaxed/simple;
	bh=RryiOJ3G94rqUNFk8ptgP1FR5xtoUypjjUG1uiW0qpg=;
	h=Date:From:To:Subject:Message-ID; b=mehIC9wQW8/d+fvXx7Kxm37yQ/65BeQTmV4e12J18LEd40t3us8/TRj57syhebfhpLb9GXZpcbPUU1QLR6gwvBJ2VkRT+C3xfdDVXERQvw//HT/F+0b0ujLFCTFSdLcb/dmEUjKto0awuz+lX+j46Tc3FlA/My2iOl30qiNQZa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUds1NQy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUds1NQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771523263; x=1803059263;
  h=date:from:to:subject:message-id;
  bh=RryiOJ3G94rqUNFk8ptgP1FR5xtoUypjjUG1uiW0qpg=;
  b=IUds1NQyGJEcUVx6Nen6kk/cbD8b9DK/jj/0DsebxJAopE4QIpyVt6yM
   BYp2bqlcqEzhN1RGNZ26DupCdapOAmCpYK2BnLibeO81ppnKhlGh1agzR
   /CHlwm9mj4PWbGYlKrxv/bC+leScWhwZ7rKEOqYUioiTB9R+S+fu0icCC
   ofuU95WiJnr9ebV2e3z3wtsueFV/Gb81oaTXNYDyixT4uBafqCTHVQprY
   s79NlSsf9jHHlOJ52DTicJvfW84xgNp2A1dKSq5tEqPv8nrvc8f9/jyv/
   AK8f4/zCNC/kVqRdAzHaR36htb5dAYPlEvieTAw3RybVQPAxkRwI1ReEA
   A==;
X-CSE-ConnectionGUID: U3G3JKnQS0+mBSoly95e/w==
X-CSE-MsgGUID: 4LbbjpS6RMaNTJhNY4J2Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84070256"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="84070256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 09:47:42 -0800
X-CSE-ConnectionGUID: B03QLXCHSpOg17utiIQUuQ==
X-CSE-MsgGUID: k+UP/gaTSgubI5FF4K3mIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214722771"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 09:47:41 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt87n-0000000041p-2nsJ
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 17:47:39 +0000
Date: Thu, 19 Feb 2026 18:46:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [joe-lawrence:klp-build-config-work 40/40] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'and'
Message-ID: <202602191814.xm55hmoL-lkp@intel.com>
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
TO: Joe Lawrence <joe.lawrence@redhat.com>

tree:   https://github.com/joe-lawrence/linux klp-build-config-work
head:   54b8903c5c298f58d56cd7a8189b377cb660651f
commit: 54b8903c5c298f58d56cd7a8189b377cb660651f [40/40] add README
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602191814.xm55hmoL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#341: FILE: README.md:325:
+If you create a .config with the "virtme-ng" profile, the `runtime_tests` target will detect this and and pass run the livepatch load / verification tests in a virtme-ng session. (You can also run `./run_runtime_tests.py --vng` from `tools/testing/selftests/klp-build`.)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
