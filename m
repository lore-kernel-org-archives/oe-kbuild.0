Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9286223E330
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777613669; cv=none; b=DVUkWIjhK8uGSArwL2ilJ04HsvjEtWOJ2/Soq9RM9xtevLZXWJlCawXfnt7OEd71wI5JNpm8dnkLeg9sCO0Q00S0X7NnvHTP9XwyCtDLS9VFtYt7Hu6r2B5L6dNKxFj7CFCeh9MyJv+A6XsmSTd7O8XOcSQ2UGX/2FO0/8NPA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777613669; c=relaxed/simple;
	bh=UDCWR0gMg+nHfFQjnsAV2lsbTwWYdGx4JfoRt6TgPxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jjzG+mWUZlmxVAXgkdZo6hdwDCrogPG21KPkqAw9Qo2ofvBA9RQsYmuF548s40fqHumaSqZUCWE+0Vp2AfxMbN/CQ9rk78qNiC+ULTMkuU815ZIGy5JCvPxoUtXeUo4oqX0la2XxTIlNdiq9w9oGmCMrpHVBcqWpL1msGJwm5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEVWju++; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEVWju++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777613668; x=1809149668;
  h=date:from:to:cc:subject:message-id;
  bh=UDCWR0gMg+nHfFQjnsAV2lsbTwWYdGx4JfoRt6TgPxY=;
  b=XEVWju++OdPjvb9MKtV1WzYDRKfrm3IWU4AZStadH6dPTiscY36Ob69s
   MLGpwWCGkB6e9r11Fof6czlgW6LpGTOIoQJ9kHqKDhIDe2ptJfIsmfByN
   Kz8r4F2UgyZb8YC82Sii8Ce/JW4bBD/T+NnyYDLV0ItQanbqJBRFtBPVV
   fsgucTOhvkjy2FyxmVRgH18TwoVPd6vWWccYr8hGiNdFa9MTjtsThHoXJ
   x91tgSyksXxumLDA9/UlgcLcNUG0kTfELyOOqg5IlF2ASbKXjGTp09ljj
   OnOPsUnh1U85I4nCrbCFMZIzzGV19ZxnmPhcI2+Gag2m19s+tLhEqezfO
   A==;
X-CSE-ConnectionGUID: Wn49XwaaTqWHzXGvm76+1g==
X-CSE-MsgGUID: tB+vZrYvQbSwvzONJ5fvqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="95996474"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="95996474"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 22:34:27 -0700
X-CSE-ConnectionGUID: uWdtLvXpQZ6Gaqx1AFIVnA==
X-CSE-MsgGUID: rV6NTRgCQMa4eOMTuNkUqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="235045300"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2026 22:34:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIgW8-000000000DB-0dHF;
	Fri, 01 May 2026 05:34:24 +0000
Date: Fri, 01 May 2026 13:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: kernel/liveupdate/kexec_handover.c:919 duplicate
 section name 'NOTE'
Message-ID: <202605011333.kzqHLrGG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605, commit: a29db33861c799b78a6469b22301aace345ad455"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Pratyush Yadav (Google)" <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605
head:   a586b345757dd389b6a3981b387cc4b39c538fab
commit: a29db33861c799b78a6469b22301aace345ad455 kho: extended scratch
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-r061-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011333.kzqHLrGG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011333.kzqHLrGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605011333.kzqHLrGG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/liveupdate/kexec_handover.c:919 duplicate section name 'NOTE'
>> Warning: kernel/liveupdate/kexec_handover.c:919 duplicate section name 'NOTE'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
