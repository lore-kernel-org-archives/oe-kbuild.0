Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882D2F52
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 03:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712028198; cv=none; b=cYC2/Fwy2kv+WBA+vZcNlPbxKslbGwcPTMxKQ4z3m1UJ3tThbeRtJWSzaLPoiaglSd8S51M8JoHkgIcauxeyz49N7Bc1lNl8V2h74e9ugdmkRC+I1bo23W2uRj5Q4xnkM60hG4FreQ2TNmPX/R+bS+xiH44v0xZM0VNc6SmATnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712028198; c=relaxed/simple;
	bh=yVA/PvUzZ4r6bSAo9NDycO/WIQqkMZwd5Fq697MWQ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4JqDSUNMQppszwGnlwj2zsjRae4pah58fCYX38BPKgNDsaV699IrxGEXW0t5MkZeLuf02vAE6p4sydaUTrcS/p2PY1ouRY099fzyfrOCjNA4nuY3DEkRL1MarrAYQZO68lTTuxbGDJK5QlpsP8kSavnddbe8TudDZFK7IO5p+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPaTCk4A; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPaTCk4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712028197; x=1743564197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yVA/PvUzZ4r6bSAo9NDycO/WIQqkMZwd5Fq697MWQ6c=;
  b=kPaTCk4ApW5oOI4o9rAANYls8Jv4V5fTVRb9KQIylSUqS7Erp0+vnbRz
   tuxD02u2t56QisczIq6UB4Lyor7JwLq4+tA8GAMlVnlW7B9TnNKvPyolJ
   QCbFMAfs8x4Ms1kuWTfdvQHp+f01ZXHztzI2oUxrjHpKzQYOhQb3jXwYc
   HUhQODKFzgSDuk7oHYpllPBKbG+EY4KAoPpd1MxEuXuLUyD7z7fkdlDWV
   HCOTvRsMZdOXc0+1FNY4G1hLCPbgWdd54wH3KWXBvZxDTTL+E9vAs15xH
   Qv6wZU7zeFnKql6Wy/TA03GWnimRxiEey2oOFbQDl1RnX4Nl4toEOeeVS
   g==;
X-CSE-ConnectionGUID: ubiWGsXvRTSYN0Q6tR68oQ==
X-CSE-MsgGUID: pEXWqjBTQEOzd/n8Vno2PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18536150"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="18536150"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 20:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="18317140"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2024 20:23:14 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrUjw-0000pX-0t;
	Tue, 02 Apr 2024 03:23:12 +0000
Date: Tue, 2 Apr 2024 11:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /usr/bin/ld: cannot find -lstdc++: No such file or directory
Message-ID: <202404021150.OqB0hFPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnaldo Carvalho de Melo <acme@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   026e680b0a08a62b1d948e5a8ca78700bfac0e6e
commit: ed847e30f001b207013b6136c264454d7560557f perf test bpf: Address error about non-null argument for epoll_pwait 2nd arg
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021150.OqB0hFPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404021150.OqB0hFPW-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:1169: libpfm4 not found, disables libpfm4 support. Please install libpfm4-dev
     PERF_VERSION = 6.5.rc2.ged847e30f001
>> /usr/bin/ld: cannot find -lstdc++: No such file or directory
   collect2: error: ld returned 1 exit status
   make[5]: *** [Makefile.perf:688: tools/perf/perf] Error 1
   make[4]: *** [Makefile.perf:242: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
