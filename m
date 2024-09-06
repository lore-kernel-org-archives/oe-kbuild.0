Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E53FEC
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 04:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725597428; cv=none; b=K2F5F31UVV4F2rcylFxb/uab6HGa0IpHLpRndEFNwbZgwMH/h3sMQLXBqjFhWp9V5eVKP0W5DIs2k+Z7dOqxJ2288dPhSOG1Mqb1nK1BH0+qU8zVHiR3sSYuMYXeQS7FzNl6pcJCniwquJV/XxkOnL12/wNeyyA+2HUOBN6oAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725597428; c=relaxed/simple;
	bh=JI48l9pvozWUyp7ba+0vSEztCpkP5sinYqXTtCF67Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7+fPsMpVBkVSKkuiHtxJYbYbCuaNi2lMrVpVZ7DAd1npfdQB6QcNn5RJY7ZLlZb3XBgPujJpJQdLcTJq1FYPk+1Y8d5hnDmt9TsnQ5lF5LUDRzYHUgfh1qx4fYFS3eBA3Wh3w0zJQOQSI6L3P+cX3Y9C0uP5Jx9IsdgUznM47o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOY53b3K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOY53b3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725597426; x=1757133426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JI48l9pvozWUyp7ba+0vSEztCpkP5sinYqXTtCF67Lw=;
  b=QOY53b3K81SlRpxuuqtwK7T1JMRFoMz0NcWQCS+ZBuHSv2nKCObm9GGJ
   De0MLsYWGZxZoNq9xA/CdH8tpyT2W87tTTcWh78scXuPsBhJFhKJB01P+
   keeowqWS+GFfOvltLSra+i+0Wbfpd4+ioBZE1GIjcXT0QoUYC/MpLH+Fl
   OVUjcj2HHyspooUehpZKRfw1oRf7dVUmV4fYPTnhiXGQ9cw7SNBLcJUCC
   93Vec4aICi6x9BRIPDMjnQnEUEfilzim4Jg1LIfB7EwG56P3S5HVg6dN3
   KXjkWM2E5Zh0bpXIk6FBVEKo06GNngfF4q9F1qsfH0nVO72yz7yDbimvr
   A==;
X-CSE-ConnectionGUID: ksC/Kz4tTk6/cE4IdYze6w==
X-CSE-MsgGUID: 2o0c6FlqQjS74AQNzZmEOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34921268"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="34921268"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 21:37:05 -0700
X-CSE-ConnectionGUID: wiBY9eh3TEiTo5oSe5K0cA==
X-CSE-MsgGUID: SlBqgdc+RM2UbKxRecBv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70268228"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Sep 2024 21:37:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smQiT-000Acl-3B;
	Fri, 06 Sep 2024 04:37:01 +0000
Date: Fri, 6 Sep 2024 12:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8004/9692]
 tools/perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error:
 initialized field overwritten
Message-ID: <202409061229.nW8r8JYn-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Aleksa Sarai <cyphar@cyphar.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Jan Kara <jack@suse.cz>

Hi Aleksa,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad40aff1edffeccc412cde93894196dca7bc739e
commit: 34cf4084965437b9d1b470067b0b3155dbc119d6 [8004/9692] uapi: explain how per-syscall AT_* flags should be allocated
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061229.nW8r8JYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409061229.nW8r8JYn-lkp@intel.com/

Note: the linux-next/master HEAD ad40aff1edffeccc412cde93894196dca7bc739e builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc4.g34cf40849654
   In file included from trace/beauty/fs_at_flags.c:21:
>> tools/perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initialized field overwritten [-Werror=override-init]
      10 |         [ilog2(0x0001) + 1] = "RENAME_NOREPLACE",
         |                               ^~~~~~~~~~~~~~~~~~
   tools/perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near initialization for 'fs_at_flags[1]')
   tools/perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initialized field overwritten [-Werror=override-init]
      14 |         [ilog2(0x200) + 1] = "HANDLE_FID",
         |                              ^~~~~~~~~~~~
   tools/perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near initialization for 'fs_at_flags[10]')
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/trace/beauty/fs_at_flags.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: trace/beauty] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:760: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:290: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
