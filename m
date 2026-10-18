Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE663E171B
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309959; cv=none; b=aTbdPueBkDAjk8Nm/OqsQ6vr5G7F57qPKA+ZXuncKk3U5d+iz5admr9azc1UPUoLOBdJ4kCfQJbZtpa2ybpylBezVyDj6ZSf6hM09sG3DI1dsWEcXZIyqsQHDvDYr6TkCDdjymg1XalW8823SGAcL3VQDgtQHU/+jaROzhgzJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309959; c=relaxed/simple;
	bh=c85oPvZW+4In1vTb1jE6SYaRCtsNfvzLEAGrtjFtxv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qTQGXSTy+r1VyFsI/8NU6Xso7RAM30xdscypCATIzM65MrkO/lHZr7gZBgnH9IJ8R+dINm36Uj43axlx2lAm+ivyn7sah+U/Kgz5NMeT6JlkyFZQmxcgR7Vd7nl7hnympK42MJIqlmzPmCoBmqMHcY1yBCuYSKA5KbpuWEfuboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPiEsTLv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPiEsTLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309958; x=1823845958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c85oPvZW+4In1vTb1jE6SYaRCtsNfvzLEAGrtjFtxv4=;
  b=fPiEsTLvsIKo5iqODmHiZ2PUJXfsFQb7L/9FADmyXphmIVLJgM3W4t2O
   LyS1KQo6M1cg3tJaBFpoKCCVkZQ4zXKSEJjRjN44nmkBwN74nMwHzWefH
   JcbFGgTt8QCuXGjUX8TZxN7SQFBdVJ39fFAqfSdTRHA5HY9GhfQ68TQrY
   JKel3QBuXneJfgMCN/4+oaDcaYW+nE5lpFUi8vms1Jz8Qtj+DchnZemIo
   8Rjrdrb++K9wibPbS0gy7+Xx3NovKnr6WRjElZxMC3jTmFLl6gu5sBs0w
   fLgiwCVaNjy8eCk/s0oUEhrNLdjy18kPsju8ohUx1F5m4xpYF7UWAyUeV
   A==;
X-CSE-ConnectionGUID: h57s//42R3mFsH8tXGD44Q==
X-CSE-MsgGUID: k62e9o+0QR6O+us49NKNTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908846"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908846"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:36 -0700
X-CSE-ConnectionGUID: 37pe6phESdW4fPGn2+XIqw==
X-CSE-MsgGUID: 3g9x7tjDT5qDr2B1svMxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115544"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xW-0ao3;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:43:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mszeredi-fuse:for-next 26/52]
 =?us-ascii?Q?/usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../pow?=
 =?us-ascii?Q?erpc64-linux-gnu/bin/ld:?= cannot find -lfuse3: No such file
 or directory
Message-ID: <202610170152.293p0iQ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: fuse-devel@lists.sourceforge.net
TO: Luis Henriques <luis@igalia.com>
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   4dd8d396740168f5379f332ad2c165d7f0f91953
commit: c7d054ac8ee905801db370b3fddbf2bd0775ca5d [26/52] selftests/fuse: factor-out test fixture setup/teardown
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261017/202610170152.293p0iQ9-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170152.293p0iQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610170152.293p0iQ9-lkp@intel.com/

Note: the mszeredi-fuse/for-next HEAD 4dd8d396740168f5379f332ad2c165d7f0f91953 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: cannot find -lfuse3: No such file or directory
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
