Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807178003D
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469737; cv=none; b=PIAgjkQpB4p9eurzhspNkWgqNbyZyYknTPhFC66qMQeSLWkqMJ5P/wY6U1WB6pmfn0tkkdhsSmgocyqH3PaJyXwjMej6Eeolb84oRryvKl2Rn69qNt8foxywtsyU8y6vrNQK6VsiZLUxpJIKGKDNMAeIW52OrzMcGLLzHB6peDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469737; c=relaxed/simple;
	bh=oBT6irilKbzZItin6WqG4j8CjCLdZH71WHJIGb91mQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hcWFTE0nnUyyao6IsBFVjoO5+C+oK1jUtERinzGdfXZ9HvZtO9Mr7EYX8nc60zBB8yoC+7Y+ta3d+k1Pande6DUxD2aXzlFC5psK0/v6XqVvBB05XCWngJLMdLEzT9th4hgcjAS5OKrn9gU1suFy2YUVXhd6/vw6OHlwPXGORCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QK73EKau; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QK73EKau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789469736; x=1821005736;
  h=date:from:to:cc:subject:message-id;
  bh=oBT6irilKbzZItin6WqG4j8CjCLdZH71WHJIGb91mQQ=;
  b=QK73EKau2ffUhG/EdHVRLE5AmaL0RJzzBKa3WkdN6LknnrXlv7s4/Zbj
   SnLCufIA1noCt6VZu2KH3bYu4e9LgmdHbdoZW4xlzI+qgQjJkRdCkN8jv
   Thv4qUmNaxLJxEoBuhbCxnBILzyRRMpkuxypHPtRXviY25F4ogJs2JUHM
   DolgAoSlTnjaffrzO0VuuwQDCGwSJYju4G7KoOYCtIK6EmHFbsnykxCle
   WdbvBTLtucx8osp3YC3ObweLV30GegNOb+rqBE2VpiKd1aYoAutBwDrC3
   eXeYiwM6PqjDvRLJYbijZEI3ZaaYGOndJmWZpDSclbbwtNgC/S1uYGJ97
   w==;
X-CSE-ConnectionGUID: 4BhWjlpdQbOE/KvoNDv67g==
X-CSE-MsgGUID: A8YA4m6kTUKyEps5wfV7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89961642"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89961642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:55:35 -0700
X-CSE-ConnectionGUID: k+Sn9JN5QZ6ufF2D+xkP+A==
X-CSE-MsgGUID: I7WQ91QASDuKZMY14A3GwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="274912166"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 03:55:34 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Qp2-000000000al-0ko4;
	Tue, 15 Sep 2026 10:55:32 +0000
Date: Tue, 15 Sep 2026 12:54:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 65/67] cram_dropwrite_tool.c:105:13: warning: 'read_ulong_file' defined but
 not used
Message-ID: <202609151153.C0nsOWrR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: ca88e23f5a75b0e48e54aa27effcf7ddd1beaf2d [65/67] selftests/dax: add the CRAM page-cache tier tests
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260915/202609151153.C0nsOWrR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151153.C0nsOWrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609151153.C0nsOWrR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cram_dropwrite_tool.c:105:13: warning: 'read_ulong_file' defined but not used [-Wunused-function]
     105 | static long read_ulong_file(const char *path)
         |             ^~~~~~~~~~~~~~~
   cram_dropwrite_tool.c: In function 'write_region':
>> cram_dropwrite_tool.c:156:13: warning: 'buf' may be used uninitialized [-Wmaybe-uninitialized]
     156 |         r = pwrite(fd, buf, n * 8, w0 * 8);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from cram_dropwrite_tool.c:42:
   /usr/include/unistd.h:398:16: note: in a call to 'pwrite' declared with attribute 'access (read_only, 2, 3)' here
     398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         |                ^~~~~~
>> cram_dropwrite_tool.c:156:13: warning: 'pwrite' specified size between 9223372036854775808 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
     156 |         r = pwrite(fd, buf, n * 8, w0 * 8);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   /usr/include/unistd.h:398:16: note: in a call to function 'pwrite' declared with attribute 'access (read_only, 2, 3)'
     398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         |                ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
