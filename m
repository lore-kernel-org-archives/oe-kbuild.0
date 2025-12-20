Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B2D29992A
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766266730; cv=none; b=hQO6BJyXP4z8KMQ9ynmHLAZeUy1oGOHyqsAWLa3T3xZxOy8y5pFAz0BkBBp5ehagg7zSvk9WKmk9tfBofsvLWz/+Vx9cmSdBUn4oEgiCZtu7EkcJcSrBMK4WExGf2wqhm30oR37XgGy+k9Ka7kapUkhu5PlPcR63s01OCPlD2Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766266730; c=relaxed/simple;
	bh=d0ZcjQ/0cEZfvjTBYkn1y0RAwS/CYn5uzChIWgAMYVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iy2Ta1Kj5hRvjMHwfeQ1hlXViiSwMGf3vYw38ZBAxvRwaBvn1dK+6rATNKvr2DWALpLXVOZ8UyoGhx2zLLMYFS8VxnXyTFkZjn+GrNMJB79URJwG+vX3sSe4HAQTkUPBYRsYLMCACbCLWJwcSDajYBzugZrD5DMjdEft7wp6oKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4RAXtbp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4RAXtbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766266728; x=1797802728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d0ZcjQ/0cEZfvjTBYkn1y0RAwS/CYn5uzChIWgAMYVs=;
  b=W4RAXtbpTv76YD3Ay7ColiQmi+P8y/71i6pAyrSWgySC/wMWI6CY7FQX
   CwFi93t5naGW/ah8YPi5+pfX6NEPFk1pqEZ63QzRSfSAQ9T2t+1jexu+r
   1d4kzXERPdWao/rPvuXgG2nWXo79yRURiw/K7R5D5wp63HR/pYFqP6TCm
   DcsnVtgby621EDY+8qxMygprW4/Lpg/kf63KQqrWu+3RFxK0R6QfOBt29
   lvSxxSkLnVhHzB8XnhfWIANuZqIFKy24eYodZd6YP3WpifNRe6Q0fYUB9
   apK4XaS9F5W+t+MWHD4R7dR4DSktKC8dq4+eNKnJS53R2F2vYO/trU/Kh
   Q==;
X-CSE-ConnectionGUID: 2xRF1XkzT/mAm/3uVlzhTw==
X-CSE-MsgGUID: AeIg/bRWQF+NHhXpE4rWnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72032951"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72032951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:38:46 -0800
X-CSE-ConnectionGUID: Eq1kTUgLT2yw1A5bwXcPvA==
X-CSE-MsgGUID: i0qOlDXzSGq18RqV5uuS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199416589"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 13:38:44 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4ew-00000000593-37sV;
	Sat, 20 Dec 2025 21:38:42 +0000
Date: Sun, 21 Dec 2025 05:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1807/1848]
 drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202512210556.ylz3X5oV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 64cf95d27717d5db2eeead1008ad133c68dc8247 [1807/1848] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: sparc-randconfig-r131-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210556.ylz3X5oV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210556.ylz3X5oV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210556.ylz3X5oV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:61:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:61:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:62:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:62:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:63:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:63:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:64:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"

vim +60 drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c

7739774a9ceaaf Miri Korenblit 2025-11-10  59  
7739774a9ceaaf Miri Korenblit 2025-11-10 @60  IWL_CORE_FW(IWL_BZ_A_FM_B_FW_PRE, IWL_BZ_UCODE_CORE_MAX);

:::::: The code at line 60 was first introduced by commit
:::::: 7739774a9ceaaf40bf66037959e8b7f87b3add6c wifi: iwlwifi: cfg: move the MODULE_FIRMWARE to the per-rf file

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
