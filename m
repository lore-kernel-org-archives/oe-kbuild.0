Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B0332EAC
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808442; cv=none; b=qf5NdxhjKXlX7MmRt0+XlrsuZYrqW9lZagZXb894JudXiG4EL361iIpJg0Mv1Ya2tNiRp3+hrcmA8n2hnK+frvtVBT1LGPxWO/dJcUhxU0lP9ih9rDQ+23qMlwVhkOD+smKBUeGKh2+ElsDp3EgZqPAs20jBBvayMQoznO/lp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808442; c=relaxed/simple;
	bh=43eEUtmeQBAV4FLT9He19u3qCiII7FdbmE1229FNmOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MA8N1Ms92kRnav3YGJW4v2u23zDAsqkjjRcawGJC6x+5ZLmkHAs240gDOCO+SM4Z367ZCmLvMZEAYV7sTXJFX13jvZ7MJELYtOo8Am+/vqqZ84LuK186E4oHLmczd2VoztzK4J9TgMt11YsnQFAtKUh/PRbrZIJPW8+OLVDqyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANwhE8Eh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANwhE8Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775808441; x=1807344441;
  h=date:from:to:cc:subject:message-id;
  bh=43eEUtmeQBAV4FLT9He19u3qCiII7FdbmE1229FNmOc=;
  b=ANwhE8Eh3FKi3BcqV+9CXMADn5HkiCjcqD9lrjyeH7A3QQERXO6cYukX
   z2b1J5OmeY+Q2B8Qcq5pKLHP/CpAsDsMhVhdRZFIvIu1wEKcpIHqXxJnU
   87QOlApkpp6IQlTvsTBMGpmDhkBhjn8YatxAjtsUoWPZ/7LkAL8YyhTJt
   iTCLbf3aN08v6+7TR5CeypSO+If5OUkVXKpa7qirCawrOqdn0xo9qUMQ3
   qm9PV5JjeYIiaSGOcLHpSxwtlLhg1Ga3R8fkSiLdsEupDZLDk2p5AT9sH
   rAdydfkp7QLJSOiB7kV6Ty4Kh9/O05qKLxKFLO0a2Yby9tFpvrG3YLxPW
   g==;
X-CSE-ConnectionGUID: EdUh0szuSu+R1Q0DJhH5sw==
X-CSE-MsgGUID: NBnLVoeySu6n/DTQKwMXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76714386"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76714386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:07:20 -0700
X-CSE-ConnectionGUID: rSRfBStfQomviS8PPfkyLQ==
X-CSE-MsgGUID: TYYCoelCR7Oc8nPJHeKdvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="224723356"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 01:07:19 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB6tY-000000003TB-3RrI;
	Fri, 10 Apr 2026 08:07:16 +0000
Date: Fri, 10 Apr 2026 16:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/jme.o: error: objtool:
 jme_check_link(): unexpected end of section .text
Message-ID: <202604101502.PR0W93Ae-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   1 year ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-076-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101502.PR0W93Ae-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101502.PR0W93Ae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 188d90f817e1 ("objtool: Append "()" to function name in "unexpected end of section" warning")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604101502.PR0W93Ae-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/jme.o: error: objtool: jme_check_link(): unexpected end of section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
