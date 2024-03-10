Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CEC3984A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710094645; cv=none; b=AALXwgkQVr170j2ds+X4dd4O+F3XhfQRvnxnuwby38SJvfWIb2iFtar5REgYa6E6utvSb82tJBUMvei2CWFTGGHNOiCkIsh2ArPiN1Mh0uvZNv5nkikW/hpGkVPqhnGT0mgw/B3/0R89FvhPLE/zyyu/2ldWF4b+iTRFq0NSbZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710094645; c=relaxed/simple;
	bh=D6HqWvYYsCVJ1c6zq36oFZaukehs37Rf+nO9Pnc9UQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZZyLD3HedimQd1dtbe2nXpqC/tWCSBN6aaArxRKZBAGMmRc1zBhZQdOMEzh4htmxSmMUSXlacEX9LW7Li2D0K9ObjklOE+ErpnyYOJBHwjTvN2eodkFfuZgOs/Z15PHHe3ijBrlLsjeYI69VJPhEvkxcpWZ2JSGsdajqslZhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrUh8MLm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrUh8MLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710094643; x=1741630643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6HqWvYYsCVJ1c6zq36oFZaukehs37Rf+nO9Pnc9UQQ=;
  b=VrUh8MLmEv6XXJz+Xwb5Sg0NZl2JwG79nQZDMPwsQs+n1H5fe4BevGW1
   O+r1jyWLfKBWWAOZSC++BzMZiyDK44N3ilwI/e/kHjalQcPW/dYp5I89m
   giTzTd7MbCmBUeozBN97kZsxG3YAgVfBl/ddbDrjIfB+ZE7LHYJ7qNl0d
   ljSaspW8APHmJ6RmkBvNIa8OIibBZhKQxu08zq896l+xViNWrL94raRnB
   qRMA5lOyDFvYo/Kh3ZPQu/Lv8QlR1pwwPAzT1+3P7tzf9Z1676INBS9TD
   YtZiPFlz5CbH55hCbQ6ts9GfrMOot49j7PIRqy2ajSENjKZkHQDCnRBaa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16161540"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="16161540"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 11:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="48400121"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Mar 2024 11:17:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjNja-0008Sc-2f;
	Sun, 10 Mar 2024 18:17:18 +0000
Date: Mon, 11 Mar 2024 02:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bristot:tracing_makefiles 3/3] /usr/bin/ld: cannot find
 tools/tracing/rtla/fixdep-in.o: No such file or directory
Message-ID: <202403110244.EybNPC6K-lkp@intel.com>
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
TO: Daniel Bristot de Oliveira <bristot@kernel.org>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux tracing_makefiles
head:   4ab413bca202fe480bb9fb8e6e1e6a556d50b0c5
commit: 4ab413bca202fe480bb9fb8e6e1e6a556d50b0c5 [3/3] tools/rtla: Use tools/build makefiles to build rtla
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110244.EybNPC6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403110244.EybNPC6K-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: cannot find tools/tracing/latency/fixdep-in.o: No such file or directory
   collect2: error: ld returned 1 exit status
   make[5]: *** [Makefile:50: tools/tracing/latency/fixdep] Error 1
   make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
   make[3]: *** [Makefile:11: latency] Error 2
   make[3]: *** Waiting for unfinished jobs....
>> /usr/bin/ld: cannot find tools/tracing/rtla/fixdep-in.o: No such file or directory
   collect2: error: ld returned 1 exit status
   make[5]: *** [Makefile:50: tools/tracing/rtla/fixdep] Error 1
   make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
   make[3]: *** [Makefile:20: rtla] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
