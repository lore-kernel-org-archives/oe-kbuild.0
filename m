Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F9D30DD13
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514446; cv=none; b=NcHeZi7svQcsbTFmFmHLnr9sS6cRABbRK+3jw/AC6yqhSQEOWwYLFYTWzc/CjiYwe/sR3UY3AZNBSIraHdNx+TrRr402eTkzdlQQlSwRkeH/0wpsMJSZEZ5w6QdeW7rls9+KB6+9CytLkcxpGjQKYyUqzL5ROOfrzYlsUZ1V69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514446; c=relaxed/simple;
	bh=M/yeurF4/04pCZRdV8yW835gVDkB0LspqooaAjvI0oQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCWWQ4vSMDpouvgE9ZJqIl2Cg5XiCNNESs47uWFVKPg1YW5hVgQymmS7NLpWcLUDhNZiJNRrcMu6T6eOtxPq9vmsTAtJ1WXAmUSIU/gmzT1dgPfDbgmgZHAeX9L541pxcZbpMnml9lqFUVKNAPpqhLKBdXRiZP0Pk6+j9Kit03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1em9Y2Q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1em9Y2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769514445; x=1801050445;
  h=date:from:to:cc:subject:message-id;
  bh=M/yeurF4/04pCZRdV8yW835gVDkB0LspqooaAjvI0oQ=;
  b=F1em9Y2QCBFYj7uD0cQOnJNNPHHlRv/8rDr53XuYX7zkj5xl0qAYtdL6
   OgV8dy/XEGcKYB5qzyKB9bl8ZSg90sSf0W6qR9RfDna37+frBVMKZnhPu
   Diz/Lv4EodmBvI+heIzfsLZqdj7z8pfOFAziZeT70ymxKn8mU6HXhmCFl
   /FCyXUuOMvNt31qQrEDzWns9/VKu1D67LAnLXXte3m4kYSu0tOiNmQyld
   9Eindt4J1Z1y2QQMz/ErOhRAyChgCayxBnBdV5Eb7HtPzrXew2SogM473
   3l3rpPzsfO4yywJ/ewKQDu7BPe9kdEr6xGuDJqoT1JmE9hjLEvkJSmd73
   Q==;
X-CSE-ConnectionGUID: P7H1BnLXSduJ54WcE+QzjQ==
X-CSE-MsgGUID: WXM6PINWQv+GWK0tv+PROw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81010769"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81010769"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 03:47:24 -0800
X-CSE-ConnectionGUID: 6rrN2voTSX6PLH8tLDE5LQ==
X-CSE-MsgGUID: bs9MmlMuS++rxY6kRViAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208009821"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 03:47:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkhXV-00000000YQr-1xP0;
	Tue, 27 Jan 2026 11:47:21 +0000
Date: Tue, 27 Jan 2026 19:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/vcamera.c:34:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601271911.pgvfz2QT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/vcamera.c:34:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   aca163adc973822190ede13e24470004c2a6d800
commit: 4fa6033b7c74b72719b8608a01660b9e6e06d14b [5/5] media: vcamera
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: sparc64-randconfig-r131-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271911.pgvfz2QT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271911.pgvfz2QT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601271911.pgvfz2QT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/vcamera.c:34:1: sparse: sparse: bad integer constant expression
   drivers/media/vcamera.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/vcamera.c:35:1: sparse: sparse: bad integer constant expression
   drivers/media/vcamera.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/vcamera.c:36:1: sparse: sparse: bad integer constant expression
   drivers/media/vcamera.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   drivers/media/vcamera.c:51:1: sparse: sparse: bad integer constant expression
   drivers/media/vcamera.c:51:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/vcamera.c:52:1: sparse: sparse: bad integer constant expression
   drivers/media/vcamera.c:52:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +34 drivers/media/vcamera.c

4fa6033b7c74b7 Jarkko Sakkinen 2026-01-23  33  
4fa6033b7c74b7 Jarkko Sakkinen 2026-01-23 @34  MODULE_DESCRIPTION("V4L2 virtual camera driver");
4fa6033b7c74b7 Jarkko Sakkinen 2026-01-23  35  MODULE_LICENSE("GPL");
4fa6033b7c74b7 Jarkko Sakkinen 2026-01-23  36  MODULE_ALIAS_MISCDEV(MISC_DYNAMIC_MINOR);
4fa6033b7c74b7 Jarkko Sakkinen 2026-01-23  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
