Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733412749C7
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763834081; cv=none; b=QTPb6LJpn7SVeZtGK51+wycrlx1RUdmUREWlqqX46jPtcM1rMWuN7Z438LQtMsl6ac6yOWjEMzDxskanq4Og82d8nzX9WEXy0wbX936FmersO9FDKCK+dNVAXVdq5uPi8XI8pwG74z5GYONznjhd/k/xWngdDMrYaS4HtEhrHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763834081; c=relaxed/simple;
	bh=guns5KhBvfcWTOMOFPffs12Vih+tMvnFZ4CqK70iF18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epSQjSEAheQzHoekfW8l8diWISfUJuEWsGnE4O2Ng+Zp2CHXhv2UrjE+SepJFPY1h4pCF+9zsBahAJGceU4B6xNjHhBkAzK9Vg9xTPKWMli/d3I77EyWbZFbd+KgjLxjmIqGMrMq0SzwOBX4uRN1WnYWXrUJ7dt0OXcKstAlNPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOE/A/AK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOE/A/AK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763834079; x=1795370079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guns5KhBvfcWTOMOFPffs12Vih+tMvnFZ4CqK70iF18=;
  b=dOE/A/AKOIYRRXVjQ1T7C1Z1XzznoeLPAlubrxrNmTkhr7zgdUHMJWQr
   JwUuvGqZqx5sG3FenQiTmI2UpHiG7xmTRQkV/4i8GZesTd0cvryMyzeql
   PVgukBBtpLCwicpdXS60FR3Xm77x+Qu5e+BG6CQTZk/MaFuSCOELJ2ggL
   Nk7DZU65OIEiCGiYZsETtgNjtxAhP1wSOE38Frh/4sfvUFrncAv4gNS8w
   vNvLx/hoXy3BJQC5EtWHM21xqfudqhxVI5EadKCQa/UaxmGpWus3mEjOB
   eDwbDkupjOepT5MBtIgFUmOFIborSp0yeH2cftVCyr/b0r4B7yltC53iS
   w==;
X-CSE-ConnectionGUID: H/55VpyaRVakGz13jPNhLw==
X-CSE-MsgGUID: fB6T8NYKRiulOQihIjD1ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65849109"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65849109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 09:54:39 -0800
X-CSE-ConnectionGUID: BQaRDr68Q2GVkEA9xopwgg==
X-CSE-MsgGUID: 9vWSbe+vS9q8eQX+A9SLeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222590942"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 09:54:38 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMroh-000000002D1-3zOB;
	Sat, 22 Nov 2025 17:54:35 +0000
Date: Sat, 22 Nov 2025 18:54:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9454/11041] unix_connreset.c:17:10: fatal error:
 stdlib.h: No such file or directory
Message-ID: <202511221800.hcgCKvVa-lkp@intel.com>
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
TO: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 45a1cd8346ca245a1ca475b26eb6ceb9d8b7c6f0 [9454/11041] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221800.hcgCKvVa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221800.hcgCKvVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221800.hcgCKvVa-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: stdlib.h: No such file or directory
      17 | #include <stdlib.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
