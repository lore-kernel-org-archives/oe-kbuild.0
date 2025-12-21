Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054F429D289
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 17:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766337428; cv=none; b=sNlFmN1/TbxWCj/xKFnRSGtO+rmLpVSvEiKjSG5FBLSSbT7vO+xIm8JZOGGk5osT//80s669CtcwmWppqnncMPCQSTIYtl7SBzt9qwV2e6ev7mnRtryfl6vlXCbzG+a2CjVKI27csSyoDn3LDS4iTdavWGo9s9J2SWSiSqUtMYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766337428; c=relaxed/simple;
	bh=8fuA2H2QjeeL0pQWeoMTbRVYx+1GXZnkJ7gjxWM9C2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QN1h6U78wN5vfJNjWQsQNWWu8B0SmcmDIB7pWD+KZOmzvkzgNARxuSfn31owKlzxtoSQEADByUThYweJHCaOQLods/KcophIQlIuYSjzO6ZknH662vpwTJL2KVlNnjwNdUQL9XLxSCboHV6bdApD1KGjHSdO7tyyV/aD/1INnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y24401P1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y24401P1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766337427; x=1797873427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fuA2H2QjeeL0pQWeoMTbRVYx+1GXZnkJ7gjxWM9C2Y=;
  b=Y24401P1T364PF7Lx1qNR8rfnql0dI7pflKkj+9VlIqhYiUJrlizezS8
   zh6OJKDs7boBzPgSREWIOAZoiq9s0xHD7bjCSTQL10Xsl1XEkbiNLqzjI
   FBOiberIT6gx/7TpQQPbOpTCvgSg5QRmo+dynlsiLImI0gIInc/cGU2Dq
   +xxcY053PyIVvVk76FB2iKidX0gJNUv9vqrEaGmDbQKUKRiD+eLx5E4CS
   0SlRNZDu6ZmYvicHbf9FMiuEdwvCSEDU5KWN7BN8Z1rg9Fe1SKFLoSK/E
   QR4XPIASKl1xfGvYhcNAZrrh23QpIxMVAnYf0IKXm5nH/oSQEuVRMLC0/
   A==;
X-CSE-ConnectionGUID: tu36dGOTTL649o/76OrJGg==
X-CSE-MsgGUID: LFtKjdQ9QYuZEnUX1V3VNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79579115"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79579115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 09:17:06 -0800
X-CSE-ConnectionGUID: NEHgDsoMTp2qNgItGwEAKw==
X-CSE-MsgGUID: pHrmqDCiRXWky+fHyFTFEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204407264"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 09:17:06 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXN3H-000000005BM-0YOC;
	Sun, 21 Dec 2025 17:17:03 +0000
Date: Sun, 21 Dec 2025 18:16:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 5/5] futex_wait.c:170:9: warning:
 'shared_data' may be used uninitialized
Message-ID: <202512211803.p0c3YDFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 503d529cb0405cb434c6ce5cd9f5a911c454105e [5/5] ANDROID: futex: Skip when futex_waitv/shmget not implemented
:::::: branch date: 2 days ago
:::::: commit date: 2 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512211803.p0c3YDFb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211803.p0c3YDFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512211803.p0c3YDFb-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   futex_wait.c: In function 'main':
>> futex_wait.c:170:9: warning: 'shared_data' may be used uninitialized [-Wmaybe-uninitialized]
     170 |         shmdt(shared_data);
         |         ^~~~~~~~~~~~~~~~~~
   futex_wait.c:51:35: note: 'shared_data' was declared here
      51 |         u_int32_t f_private = 0, *shared_data;
         |                                   ^~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
