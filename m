Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E044A00
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747572573; cv=none; b=YdmTccMiQggltHlkYhJSLNyFN2ri3dq5hQpIWLRUBIRPfeY9Qy/50mrXyW8ZBkd1ys6tqS07IO0VTdOJThEO5UYYuUEaJKzGC0jHlaR1YO/ZqQyEsQv9luWTGbOjP6iq+95R2v6wi1sCA8XdyBSXyHkwaE2YS1BCytNmAEMCZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747572573; c=relaxed/simple;
	bh=2bpWNQQ4TbkW9gPAjW4OzQHgXLshUd4U1kA/TKzBZBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsotZY8kQ5WGLJ8fi8Z6KFiTWKRs9HLlQHSU0QFJV2j4LxA9A9Fzr3b5vVSDM1DqvgdAeeq3DKgpmdvQ5ZwjizN+efYGDSYCk4aAMrMiYl7tK/Hn/8zM/hz+D2F339wgD66FIrUYJxvM4tlxVzrHZ5UdrwE0FoqZxQF/GfrRHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIoPPNWh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIoPPNWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747572571; x=1779108571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2bpWNQQ4TbkW9gPAjW4OzQHgXLshUd4U1kA/TKzBZBs=;
  b=FIoPPNWhteR7VWEckLKFnNrH0Lm13CqKEFtEb/FnSrg8nmLGQLgQVK/g
   +R+9C7G3DruxZMGn17SHNs3GIy9MN4WI+GO1phTm/ga/sx2Bz/Y2sXgi3
   R1VNMOXgp/ZRbFvDMA9HzYz1TGgRvetnaDEU7QP2ruo/qyhQ9Kvv1hwh4
   WpQm6TRY0D0oMeoLeCK42sucIw8ivyyYnkVsGMUNjvS1Dpt8jbsnWRaVz
   r3QUbFrVvRTLlCDOtHNQIXJcexQDfjVkEmjjoLFgdgBnVZ4rY4OWJPdKJ
   apGyXzo7vYqjuyL8SGcITaXNDCvaNr3IjheSiEsBdcx/wwlNq8F/xuE2W
   w==;
X-CSE-ConnectionGUID: z7USx9aYSzOKYXZ8SLr9IA==
X-CSE-MsgGUID: kXf+QBZ2RQOHDgoNueSXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49180762"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49180762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 05:49:30 -0700
X-CSE-ConnectionGUID: 9wHhalGQTxmZUHcENd6K4w==
X-CSE-MsgGUID: BGKi3A3TRjCOgY7gUBOD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139169156"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2025 05:49:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGdSI-000Knl-2i;
	Sun, 18 May 2025 12:49:26 +0000
Date: Sun, 18 May 2025 20:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/krb5/rfc8009_aes2.o: warning: objtool: sg_set_buf+0x74:
 unreachable instruction
Message-ID: <202505182018.fJ3QdmhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
commit: 6c3c0e86c2acf53bf67c095c67335a0bec2a16af crypto/krb5: Implement the AES enctypes from rfc8009
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250518/202505182018.fJ3QdmhZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182018.fJ3QdmhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505182018.fJ3QdmhZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/krb5/rfc8009_aes2.o: warning: objtool: sg_set_buf+0x74: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
