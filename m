Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95050201278
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 04:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686184; cv=none; b=miKhvNwZxe1KG3KTHdSXJ27PlcIeG05nC9AEbIRFXNRjfQ+XG3P1GAjPz+16HS5ChmuUWh7TR84Yvywz0+lWjUzK1uvhXDqHXcIt07Bk1fmrmwJBXbWRtL0ofznX+4OXEwcEkewmdBPJAonZjN4bJa/uOxbCCLHMRDD3CNOEGq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686184; c=relaxed/simple;
	bh=suDTBh9DoSGT2EPa6SbODXozM7IwCS9KHuyoxY+KUBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIRnQW0vm3+bXl61/fXDHriBJlaG7/qEsO7Go0nHYMTjgr5qDVdcrygkLRFS3QEZ6I/90fXM7DgYt9zCGXTiZ8gUkyFRBhUx3pPoPzNBP2Nlyqr/RpPOo9NCT7gSxNHZfo2rKnUhjuDy//fMCSI2yrGFkQPsbj8ES2av+SqRplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTN2pPWS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTN2pPWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772686182; x=1804222182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=suDTBh9DoSGT2EPa6SbODXozM7IwCS9KHuyoxY+KUBc=;
  b=UTN2pPWShgjOoTM7PxVp+wR+1Id2eVP3bFtI22bt9sX8PPrzpF80iyOv
   hs0JSlIAPQ2A9lNmmPWDyZokdy30LJBPUlOUr7Sqa+xOki/CPRqwmXCdB
   IpQN3qznau0N5mf+vdgpJp2Qz/zqVsj/JgDyT0YF7gJpBb91E542K8fNM
   wpbzstrrXZ0bttS4FzwNaCNc6dYBuTxKI+dBYLFHaqDzf38vXdAqcryMz
   Cm5SpD8z5KXKSpjAqXH2GfrR1WRiFeLx5q+oBYMX0lwzxgI0N1HS+/J2Q
   eqksncoAdUkAErYgGDFiBPMwuIGI8tzC5RG3jzvjZDJHulARF+Wt65F75
   g==;
X-CSE-ConnectionGUID: cQtsGKMQQvq7SS5N/vS0Tg==
X-CSE-MsgGUID: yzSMVa2PTjSs9NHjwn6tUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85108572"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="85108572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:49:42 -0800
X-CSE-ConnectionGUID: aqvNIUD0TtW5mSjIRFDCkw==
X-CSE-MsgGUID: XagYHkCDRLKJawFsChQTfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216379192"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 20:49:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0eZ-000000001xR-0GJS;
	Thu, 05 Mar 2026 04:49:39 +0000
Date: Thu, 5 Mar 2026 05:48:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] mqueue: introduce new  do_mq_timedreceive2() [
 mq_peek  syscall] for non-destructive receive             and inspection
Message-ID: <202603050553.rQleubm2-lkp@intel.com>
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
In-Reply-To: <20260304135126.77270-1-academic1mathura@gmail.com>
References: <20260304135126.77270-1-academic1mathura@gmail.com>
TO: "Mathura_Kumar" <academic1mathura@gmail.com>
TO: brauner@kernel.org
CC: academic1mathura@gmail.com
CC: linux-arch@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: viro@zeniv.linux.org.uk

Hi Mathura_Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes next-20260304]
[cannot apply to arnd-asm-generic/master linus/master tip/x86/asm v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/mqueue-introduce-new-do_mq_timedreceive2-mq_peek-syscall-for-non-destructive-receive-and-inspection/20260305-020107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20260304135126.77270-1-academic1mathura%40gmail.com
patch subject: [PATCH 1/3] mqueue: introduce new  do_mq_timedreceive2() [ mq_peek  syscall] for non-destructive receive             and inspection
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260305/202603050553.rQleubm2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050553.rQleubm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603050553.rQleubm2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mq_peek.c:14:10: fatal error: linux/array_size.h: No such file or directory
      14 | #include "linux/array_size.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
