Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73DC2EA754
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559509; cv=none; b=CfLfjetAQdlShV+CshQU4SQ4TwiEk1JFLwU4uInv+LrlnIsBY+y9ExMfYA4KH6ZEjmCnXp94PN0qq3X8cLDmUizlMbbsOi2oXmFen0OzLitWIy3cODoruID0P6yyIkgZH9nLlqvIQQDkXhbUf3edqUwXEgdYuROsYAme+Lb2q6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559509; c=relaxed/simple;
	bh=18obP4UOizZfhIO6Ap7teYwTV6lNo8xbszBP6m5swlU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C0NEz0m+ZT8leIiZ1suFwcX2FVRYESlmYCrMT2016k4zRaNFOS10c+neszoUqAylqk1DgkBTOrwW4i9nijHhTyy3qnl/h9TQX4+y/EWnhxtytpg/ONfhh285HNSIhKsIrSsiJqEw8YkTHFd0ngsicB5MAFze4WcPjNNrvilrEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ggl2d5q7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ggl2d5q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786559508; x=1818095508;
  h=date:from:to:cc:subject:message-id;
  bh=18obP4UOizZfhIO6Ap7teYwTV6lNo8xbszBP6m5swlU=;
  b=Ggl2d5q7pMEvlGN2hkl0TnUw5R0UNmK+OauNFh56cTOaGwKUvX/ZUvpk
   DbLJan1It2uToaBySvJ7VFwY0gl6uIMdqYHJdXe4Dxy4Mh/Nykjv8Sz8k
   y+07KLJ69tl3oWSsXzoIFXb1i2BZL6yfip8066pImHgdJlvrKHOVMxWCE
   bZQqvmyn6fZupQucI7d7ylwrMHXqZV/OilCPrnOzCXLFa08Z4UnqKwjZ0
   Q2NBYuko4otSbK1jp/o4qIie5ZxeJtUdWCq1DqrPOJki+WPiuBd1MuJYb
   LintKK2kL/1vkC5CDITQH5MQve5BNe6uiwaxXE+oosPZc6xydScwEEx56
   A==;
X-CSE-ConnectionGUID: JZbzU7fGQW+LfLDu+eJ/Hg==
X-CSE-MsgGUID: 5gR39dddSum0gwPS4C0B8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98640215"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98640215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:31:48 -0700
X-CSE-ConnectionGUID: r4KQq78kRY+A5rfr37C2Rw==
X-CSE-MsgGUID: V4p2F1GaSQ66WcJxNQPU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="262412854"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 11:31:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDjs-00000000RLa-2Lv1;
	Wed, 12 Aug 2026 18:31:44 +0000
Date: Thu, 13 Aug 2026 02:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12857/14447] ERROR: modpost:
 kernel/locking/test-ww_mutex.ko: symbol '__mulsi3' undefined!
Message-ID: <202608130232.T2ZAXLWm-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
commit: bbeb002cdd3772d1c0156ebd2ca828a2d61612ec [12857/14447] modpost: use mod_warn() and mod_error(), clean up logging
:::::: branch date: 26 hours ago
:::::: commit date: 5 days ago
config: nios2-randconfig-001-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130232.T2ZAXLWm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130232.T2ZAXLWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608130232.T2ZAXLWm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: kernel/locking/locktorture.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: kernel/locking/test-ww_mutex.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/quota/quota_tree.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/nls/nls_euc-jp.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/pstore/ramoops.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/netfs/netfs.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/squashfs/squashfs.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/coda/coda.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/minix/minix.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/exfat/exfat.ko: symbol '__mulsi3' undefined!
WARNING: modpost: suppressed 993 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
