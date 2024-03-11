Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382E06FC3
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 04:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710132209; cv=none; b=npZHt15AC7VW0aqI7jhIA3k7vc7/7s8DQmnqqgyJW1L205imJNF8UCfx7VAEy1uYkAW5hoa2NatG0+3WDLkAeOPpIdQ3TZNm/9ltt57hUP5h80dKsMCXGIUTGD959S7bkIHnfHiVgSRHimwk3Bz070QitP2DarsX8/bn6Eh37So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710132209; c=relaxed/simple;
	bh=3wfjemjb9X3Dv1TJEQfPs+DNS/Vs3B91Ot+CGdBu4W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxLANInrgDw5ctCSMa0i5FatD/nHITXjcvOlxquszMmaiypOmImbnPt9rPsV2hwhBjl6eFNgWUwHvstPtWRoL+whCmLrAA/TW8qT0c43iEJTepvtp/MYolkfgDrt7c3vfii1c9/5/HrQyuXYxdrY6Tdbi1PzvRXD5+hMSWwDuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2bqJENk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2bqJENk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710132208; x=1741668208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3wfjemjb9X3Dv1TJEQfPs+DNS/Vs3B91Ot+CGdBu4W0=;
  b=Y2bqJENke5adE5hzY37hhVeEef6s58Zjb/RR2BCQliXb/YQT+Q//jbHo
   A+Lzs0OXJDZ68p2Un3gZKhLi/U/wCOKuyaizaL6OLx4VJtf0np3LgBLFd
   dc/Ovl2qmgRL+UCeAT0mR+RWUXa7FsY+KNKOH0mVfV0KkdM5CNZ827Ypv
   p318wdtzXEw0QBayNDN077hwXhAOvBBp27KrFS4kMcUMel0IJ8BYGoF69
   dHuos4NIrcAFsZ5pPF0lZEqtHr0HwH1n0T7Tn3xk35zfTPoOUMTSFyZ1q
   tIWgXRb6POdpq1YxnfvkxCTL+x+H2hjNySmoY9t2AobDMeOa97aeB1c2j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="7727254"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="7727254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 21:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="10955518"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2024 21:43:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjXVU-0008tf-13;
	Mon, 11 Mar 2024 04:43:24 +0000
Date: Mon, 11 Mar 2024 12:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [isilence:zc/rx-v4 906/922] ncdevmem.c:34:10: fatal error:
 netdev-user.h: No such file or directory
Message-ID: <202403111252.fwYq9Zbp-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zc/rx-v4
head:   c13f97bb45f13d99fc22c4452f9926dd4a53d6ce
commit: 30cb7b1a2b1cef31c7eebd4f57f56b33d2f418e0 [906/922] selftests: add ncdevmem, netcat for devmem TCP
:::::: branch date: 12 days ago
:::::: commit date: 3 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111252.fwYq9Zbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403111252.fwYq9Zbp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: cannot find ../../../net/ynl/lib/ynl.a: No such file or directory
>> /usr/bin/ld: cannot find ../../../net/ynl/generated/protos.a: No such file or directory
   collect2: error: ld returned 1 exit status
--
>> ncdevmem.c:34:10: fatal error: netdev-user.h: No such file or directory
      34 | #include "netdev-user.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
