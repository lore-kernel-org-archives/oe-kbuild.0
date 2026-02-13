Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A026E71F
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771009194; cv=none; b=LNt2nDOXT8h0YdgtGNfXB32qCSeEhN585FEXL6WMKE/9f15sk3/MrvUcwQ2JPQ9AX+JnyQJKjf2FJSwT3XQosKbvTji8m9SZSiiDP4DU4K7ZkvJv6XypSUYaWbJa9qqm6Pkd8SGeGdQBVmav5XXCZESSHyRHK9po9AYM38g4y4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771009194; c=relaxed/simple;
	bh=tmwJxoyJFH5JkaW6skLdhxtutC9diLc9VXr5XJBZF8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DdjO+kow2bF8c1y0jwDa66mKYqCm7T1tGwp3LMlk3Xqh1NtDphJHhcpC6hJf/tstI0YPIm6p1DQ6uXiBIrcDr2YjvU+yyPzE2b+yv8M3jpoRitqnFBMO8ipxU7l35YlE0difCTPJASfKP0UGLKD6DvmNvZtP5G8VYJroJV2FicI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL92zNnU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL92zNnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771009193; x=1802545193;
  h=date:from:to:cc:subject:message-id;
  bh=tmwJxoyJFH5JkaW6skLdhxtutC9diLc9VXr5XJBZF8o=;
  b=jL92zNnUUJxSL2PzqlQRCI4Tqb/JNCDskdffrGhb14+mO1G2pKVjOHoY
   QnBh8djZ3fXeGP5n0oLxZtHqICZ2G8I5QH+NlF4wVZAqOpjjKHuUAXyt2
   j7tqVG48g62LqCWwV9OOH7NVh/yG3QbUs6aKjG9jMsIzWKBj7HLs7dNJV
   5D8jBv9MdMIcywZEebGo29x12M5fUn8t4eJq00XJXVSEiOY3BtY71j5cd
   2pc3gNO+HPqK96JgnU3Nf0Npf/fzFU+cG9KcjvlujPUA/rujjIvbfoQse
   3136Un1hRy9Jz4n5Wbh6dtannvBlighwsIWGiBQyttBoJbzqzFDMUOw0F
   Q==;
X-CSE-ConnectionGUID: 0ihsA/WvRyy1Xd4Iu2rltw==
X-CSE-MsgGUID: zbId+iw8TWW/R5JlpcmDsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83641998"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83641998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 10:59:52 -0800
X-CSE-ConnectionGUID: vUmac6FLS4+Ra9aXn3rLqg==
X-CSE-MsgGUID: 5mg5D0HfSgOdo/af/Yyd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="250653800"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 10:59:50 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqyOK-000000001f3-1cQH;
	Fri, 13 Feb 2026 18:59:48 +0000
Date: Fri, 13 Feb 2026 19:59:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-poly-aosp-pixel-mbu 1/1]
 futex_wait.c:170:9: warning: 'shared_data' may be used uninitialized
Message-ID: <202602131938.AkEPUN4o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Edward,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-mbu
head:   6edf3ba07207a117cb90e8ac84c475191d0d227d
commit: 503d529cb0405cb434c6ce5cd9f5a911c454105e [1/1] ANDROID: futex: Skip when futex_waitv/shmget not implemented
:::::: branch date: 9 days ago
:::::: commit date: 2 years, 2 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260213/202602131938.AkEPUN4o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131938.AkEPUN4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602131938.AkEPUN4o-lkp@intel.com/

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
