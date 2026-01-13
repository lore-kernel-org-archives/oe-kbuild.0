Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868F230DEB6
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768273964; cv=none; b=B/oQue06Jk1qkqTafGa1eGZKeGYfO+97p5CRdAJZ28bPkKr7Ztz0Pd1JolxEG8/lnQj5RySYBqtrR4OVdhroxo9CO3qDlefmK/m6PQDbBjEHJ2gDLH5aDZwYfkBGmY7L8aj6zMU5Qsp5sVKJA1sKMiVJoGrqyNKEMnFTKFBxzAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768273964; c=relaxed/simple;
	bh=/C5uYUh7TKTb63f3SXucr97PifL8rDBIDY28bXhyi20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bspuSCfDakvNzHEE8seKj63Gz5hogRmXURp/eFJejNczGLeZrN23dL5ftwLXEhHl/g5XuBwZoEvFQSwtWvWYTJpgekzoI7S4jseDh84TUhx1wo/rJB1+mxaMmd+T0SO+Bhr0+cVcE8U4auQYBuHc4P/cPoFUHw9oVq5m00Da4Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSo08Fu0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSo08Fu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768273963; x=1799809963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/C5uYUh7TKTb63f3SXucr97PifL8rDBIDY28bXhyi20=;
  b=cSo08Fu0HyVXwKUIDyplMpi+prALIaEbOzevnM9arFJdMU6PSGlsD03i
   Yt2p5HVo5IXsbifX/j0R2ubMIL50c/7Pzs4UxvS3oXNTlXPvmRlNhZexz
   Y7EC4ieZXJ9QzA6Xi05N6gqK+v+91b5pZ0nnca/wbV8b93gi3tsYbaxNj
   jpp0ynKAk8VEm9K2Pm2aA2lY6Yb4W9yoooucK0fwLotrTm/thvrRu5UEj
   V46n3Qv1AmeK8h2YVaKgQqvVR+qwu3m2y6xNie+LR1aRXpRro5fb0OYml
   dIMSBS7YscLTqmkP7hPq9NZxxMsYAhcMQ2vMOhsCMD+bxC04ZN59t+N+6
   Q==;
X-CSE-ConnectionGUID: 0qxvu+GuQiW8ISTEi64IKA==
X-CSE-MsgGUID: byPFIeKVRou3t4esMDJg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69632541"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69632541"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:12:42 -0800
X-CSE-ConnectionGUID: DV+ihGwnTSK9DU0hAdDB9w==
X-CSE-MsgGUID: Zpf8dmiaSOW+qXvXIo6ENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204552212"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2026 19:12:42 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUpj-0000000012f-3NoW;
	Tue, 13 Jan 2026 03:12:39 +0000
Date: Tue, 13 Jan 2026 04:12:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued
 warnings
Message-ID: <202601130404.Yg38lVi4-lkp@intel.com>
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
In-Reply-To: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
References: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Randy Dunlap <rdunlap@infradead.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-fix-logic-to-handle-unissued-warnings/20260112-193100
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued warnings
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260113/202601130404.Yg38lVi4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130404.Yg38lVi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601130404.Yg38lVi4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-lg-g15.c:37 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * g13_input_report.keybits[] is not 32-bit aligned, so we can't use the bitops macros.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
