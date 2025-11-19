Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863430FC33
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 05:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763531050; cv=none; b=JlvXl8oI0yldjGdKvI4s2ITR3SaqQvTJz+mTbN+zIFg033t90IOENRusJfDbLr4uU6G2kfIs3u/+NrS4JodylMOlwn20w0HHaYU/EVLNy13xp4S+zDIi2NC7jPkxrLvPxB95fmO/Mld6c2c6dsJrUGlBNA+NCZnaeiGRYFweJcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763531050; c=relaxed/simple;
	bh=vDbFEgbI8ESm/QTdr8w59zRC2gCEqGa8TVpT55HFiTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/uoFcD2XjDYD47sYek4lycyDN1W0D2dSyZR0D+Wr1q0wh2mQZ/9+Ae2+dbCBfsdqoGJmiHuUfGECMZgZTMpgeee4q7Yzd2JVZP5eEaFAZyDliGtGeaF4uDYs13AXqDmyiTW1Qp28EUkh27Qzs5uU3qNATY783W+MvCdfDE4+7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNXX7Oes; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNXX7Oes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763531048; x=1795067048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDbFEgbI8ESm/QTdr8w59zRC2gCEqGa8TVpT55HFiTs=;
  b=CNXX7OeseV7u3HNITLpwRFoXrsMePHjnrfyAFA2QX6ZTwLm7i3CHRL1H
   pt3hsDm/qdh7ySvQjR7bcUyyxVFmorsyPSi2uuw0N0hwvZl3KgwNKqTXu
   nktPQWI1w+bJ/z1SNAHtqrXlWy1S+VHcF4WSr6cwtwcyZYEC3Rv72chtT
   tj19BUjN2UjGMooUEGRRhmAWbDgnBx/Rw6zoYSdHiCYGp9aFp6r2ausS0
   HlerWPC0EDSQbfCcukBTO7Q2LKzI5Y8X/Yrcvv1vMK9hVbpBF/CAhb9wy
   0z2zRSpryiOYetMUtIxNx0QNcV+TD6xh0+dZR5bFnRowCYgCACPRxsbN/
   Q==;
X-CSE-ConnectionGUID: o88HKqDoSn+MAN+Zgd42EA==
X-CSE-MsgGUID: PBZyg4OERniyMi+rYUrHyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88217391"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="88217391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 21:44:04 -0800
X-CSE-ConnectionGUID: /A48cVfcR1iZVLJ/GOxbOQ==
X-CSE-MsgGUID: 5mnXxhCZT6+L/L/m8EhQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196092449"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Nov 2025 21:44:04 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLaz3-0002VD-0K;
	Wed, 19 Nov 2025 05:44:01 +0000
Date: Wed, 19 Nov 2025 13:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-split-fix 3/3] kernel/rcu/rcutorture.o: error:
 objtool: rcu_torture_cleanup+0x5fd: sibling call from callable instruction
 with modified stack frame
Message-ID: <202511191353.2CpYl75R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-split-fix
head:   c1d09d3861a169dca34ea869269fd4957a8224aa
commit: c1d09d3861a169dca34ea869269fd4957a8224aa [3/3] Revert "objtool: Fix GCC 8 cold subfunction detection for aliased functions"
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-075-20251114 (https://download.01.org/0day-ci/archive/20251119/202511191353.2CpYl75R-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191353.2CpYl75R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191353.2CpYl75R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.o: error: objtool: rcu_torture_cleanup+0x5fd: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
