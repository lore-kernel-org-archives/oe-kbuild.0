Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0BB111A
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Dec 2023 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TguKqtOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703488101; x=1735024101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gDmjWCcCwyDqYGAjPHFdyI0sL00QQhWn2rokuKhEO0=;
  b=TguKqtOSjkx/v8l2WuaEn/VqOp46eauFNl+nqqJTuDrH9KCqDN6SUJfA
   ohEr9NIm8q+klmkQd5EqNBk/bxQ70yzhQnNzL9pPIEWlWnjcDHJ8xRzD4
   V+rNfQu0L7rWTPMTzoySQHBkHQBrutyboHw3odWG+Is+s0iaQYYYm8LfQ
   zVCY3rYUucBNSZeCh6Qr6xMy/QmuUltq4hHUwL+lbCPh79DwHMFzCjQPq
   AkuxB1A1MTMVsD1GXF1Xlu0A/c4IDegYROApg02iP49V8QuYK8nnMr/MO
   y2G3zxU4LqYx6u8pCCMOPkivdcfsUI4q0UGKI+3YheubIEfLts7c1vtMd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="9669798"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="9669798"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 23:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="843599108"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="843599108"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Dec 2023 23:08:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHf4M-000D4R-2E;
	Mon, 25 Dec 2023 07:08:11 +0000
Date: Mon, 25 Dec 2023 15:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: htmldocs: ./scripts/kernel-doc: ./include/net/cfg80211.h:1191:
 warning: Excess struct member 'elem' description in 'cfg80211_mbssid_elems'
Message-ID: <202312251508.hBZ2mOn0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Johannes Berg <johannes.berg@intel.com>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   861deac3b092f37b2c5e6871732f3e11486f7082
commit: c14679d7005a4d26289eadb4f5fe499aca78ef7c wifi: cfg80211: Annotate struct cfg80211_mbssid_elems with __counted_by
date:   4 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 months ago
reproduce: (https://download.01.org/0day-ci/archive/20231225/202312251508.hBZ2mOn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312251508.hBZ2mOn0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./scripts/kernel-doc: ./include/net/cfg80211.h:1191: warning: Excess struct member 'elem' description in 'cfg80211_mbssid_elems'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
