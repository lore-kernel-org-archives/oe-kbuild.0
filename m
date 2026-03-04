Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9441754
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772667516; cv=none; b=jQ/1j9rHuMcOwZu130Li+t31X9sndRtiTyBaLb7Q/XGX76q3r/Re2s/lWOlM3bqOzTxQu82Ou3bd2F2WYRZdR8y+1YmGfgQ8HGZq1ABQtgXkK/vs5IfFoNWGcCDg3gGhMJiIXje40xrYrA1SXEs+RnThXZ0EKyda/C6twsjBIdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772667516; c=relaxed/simple;
	bh=hf6cVX3XbAAb95dMxzdl3mNB/pE7okJOA5GxqOYcRqM=;
	h=Date:From:To:Subject:Message-ID; b=P78gTHHP1ObtIINRVxzfxhV8z3T5lwdcnY6QZs0xgO7K4cWfzV8plIhi6ij7bsldhFsBx05sGYsWluq3ac/fVjPxYYZ1Rh0vrOOaoKCHwi6LM0+wHdzeRS7Vv8vyCkdhASMoHfSuHbjMxN+oNkI8VdRM/eET2R5JnP927KIWquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbZRI8ov; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbZRI8ov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772667516; x=1804203516;
  h=date:from:to:subject:message-id;
  bh=hf6cVX3XbAAb95dMxzdl3mNB/pE7okJOA5GxqOYcRqM=;
  b=DbZRI8ovGA9c11UF3sFGQK+l+DqrZqH7Bm7xaBQPVUEfmds3cJDbAdIV
   +Cr1sv8akOB/XHqzZilYrE2rMeWSzVLC006E8i8Y4hdzTNiv6xW0o0mPo
   kAiOUWHwQ9pYv0xBuczrsmfTbrLYlHEc3Jur9bVWloIXkQKxPiyXVONEt
   1V1fcpv72uV0tzxephSkn44wK1E7JD4974aPuG/YvWrq+ZV2mWaA+DAeV
   e4SMss00uhm8Em7THCplkqTFpFd7sag6o1cBueqkbs/4f9s6f+Oz5r1VJ
   zLs7ZKWBYRA9oMggiECXK/bVI7AsFfImPWj4o7AoPvTJdBmUqLt6m9tUF
   Q==;
X-CSE-ConnectionGUID: qX0CasZjTrKwGsUU6Zlujg==
X-CSE-MsgGUID: tWb/oOAuTWGUx5BAH7kjEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73656830"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73656830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:38:35 -0800
X-CSE-ConnectionGUID: 7pGjUr0gRb+zqPblrMURGA==
X-CSE-MsgGUID: u3ccZEjtRnqInvdJkXBR3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="223459877"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2026 15:38:34 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvnU-000000001nh-0ejx
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 23:38:32 +0000
Date: Thu, 05 Mar 2026 00:38:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tnguy-next-queue:main 9/14] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'very'
Message-ID: <202603050052.473k6z6x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git main
head:   4ad96a7c9e2cebbbdc68369438a736a133539f1d
commit: 6f82cb4ecdb4f23b81d7f71e31d17a55857c8d74 [9/14] net: ipa: Grab IMEM slice base/size from DTS
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050052.473k6z6x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'very'
#8: 
very very different SoCs).

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
