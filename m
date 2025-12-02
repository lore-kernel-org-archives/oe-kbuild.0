Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9D6BB5B
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 01:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639514; cv=none; b=mpBLSky9SX1lxwiYCNtGSCzR9N3UTDbtyW1R+a2uwMBTJ/IUCBbJl/hWDSkTW5XJ3szaLEWSh8sZz79NPK0uNAIo53sMe+Oc7CvNyK36zRv9bBLfqB4i6B+Yb+8BEP4zfRbZnefkUy6t+eog8JiuVZpwCMTo2QmzSw5FKHABrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639514; c=relaxed/simple;
	bh=IuO/lSLT+xX/KlVtSpbPBfFjzYFIErFFeBycrno0oIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTH8iHKZGhRzePWpL5utUlrPA3QPvIHDCfQRier6LLVqBRmLpenZ/IeU/6RfTlR1qllk66ndfzQ+JfyTYbzoWuc4H2utRAw7fDr+yPIyGC98TGf9m4iwQMMYBRdKQWbXBZO7rb3eqxTS+Q1RTKJCNj1nlaFoXcsAUWXGZCIan/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiDgIrs5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiDgIrs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764639512; x=1796175512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuO/lSLT+xX/KlVtSpbPBfFjzYFIErFFeBycrno0oIU=;
  b=TiDgIrs5ouSKTd9akbyIg2R91Yasr1XofejCnvAC93j0jkxZ7g63sWir
   4/bMQG0yL26AZi0jeKlRzKTSCIDOlV3gI9K7+98REoJeqKrzUePjB2cpT
   bXaulaZ+AP17tAbS0tOEv/3uBSt8pA7LfeWh+N+wnWsrNHQrO8q6ErmLQ
   IRtQ2Cy5um8dkBXU2I3OhEDFv4Vwb5m1+CCxWjpgxMOzgew1wj20LEpOp
   O2wcSVe9I8lFRZemw8nGdYnd6DgqNlojIH1AYrjSxn/u82xJYmdQ2qQp0
   acaYfRfdBpxPfgyBKjb/w/2bqeUqmvu3mhWRNwwlkdyf7BUZTfvDkLAXK
   Q==;
X-CSE-ConnectionGUID: KFeTxqqXSPKgX7ktULV7ag==
X-CSE-MsgGUID: i5bj874oRBSu9ToYpwb5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92070880"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="92070880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:38:31 -0800
X-CSE-ConnectionGUID: /ksQJJzdQumShtUXqenShQ==
X-CSE-MsgGUID: clkhj7XIRH62t8pHZQVvTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198435063"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 17:38:31 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFLY-000000002nB-2ZwS;
	Tue, 02 Dec 2025 01:38:28 +0000
Date: Tue, 2 Dec 2025 02:38:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12709/13171]
 tools/testing/selftests/vfio/lib/libvfio.c:3:10: fatal error: stdio.h: No
 such file or directory
Message-ID: <202512020253.9juzIAlj-lkp@intel.com>
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
TO: David Matlack <dmatlack@google.com>
CC: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: Raghavendra Rao Ananta <rananta@google.com>

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 19cf492c1bddc93b8a0144aac5295b7cf2bd24b8 [12709/13171] vfio: selftests: Move vfio_selftests_*() helpers into libvfio.c
:::::: branch date: 22 hours ago
:::::: commit date: 3 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020253.9juzIAlj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020253.9juzIAlj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020253.9juzIAlj-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/libvfio.c:3:10: fatal error: stdio.h: No such file or directory
       3 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +3 tools/testing/selftests/vfio/lib/libvfio.c

19cf492c1bddc9 David Matlack 2025-11-26  2  
19cf492c1bddc9 David Matlack 2025-11-26 @3  #include <stdio.h>
19cf492c1bddc9 David Matlack 2025-11-26  4  #include <stdlib.h>
19cf492c1bddc9 David Matlack 2025-11-26  5  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
