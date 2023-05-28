Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2A36AA0
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 22:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685313438; x=1716849438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IWOZhQGwrCP3e4qgGDCzD8QDmNuJMiP2QUF6ybw9LU=;
  b=E4j+Z8dDZjECofewDngmiFEet92xO0pm8K94YL6fIUgckUgaoxixC/Y0
   cCyKvudhkpoRq7PIcDKy9cSses4Jv+eXb/kKBcMpZiWRzayMiL9FvU0DZ
   H+LUjbR96202gjSVxggZpiOsMSQU8Vjbhhr3YVH7LY/w/Qe4wIGy4kEwo
   DzWP0TGeyL9b7cFcbYHHWYZ5ZvBTiCvyxitkUubq4qvwGsaDTSp1Ne/iw
   i8xu9rvXrOMMnv6RDcJq4rfJObPRtzuPQGG+XsWnvzJpJ9s7qdMQSI956
   TuK2gjeUFCoM4J8LCDiMMnHDc6geKCujG7i86kQ0VLydIRdYe4oK5IR0V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353408173"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353408173"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 15:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="952511892"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="952511892"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 May 2023 15:37:16 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3P0m-000KlA-0s;
	Sun, 28 May 2023 22:37:16 +0000
Date: Mon, 29 May 2023 06:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2111/4815] ERROR: modpost: "__divdi3"
 [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
Message-ID: <202305290628.S0kZODnB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a3d37b4d885129561e1cef361216f00472f7d2e
commit: bb5ceb43b7bfa166fd5d739d51ad46c1cfb225e3 [2111/4815] ALSA: emu10k1: fix non-zero mixer control defaults in highres mode
:::::: branch date: 4 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-s053-20230528 (https://download.01.org/0day-ci/archive/20230529/202305290628.S0kZODnB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bb5ceb43b7bfa166fd5d739d51ad46c1cfb225e3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bb5ceb43b7bfa166fd5d739d51ad46c1cfb225e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305290628.S0kZODnB-lkp@intel.com/

Note: the linux-next/master HEAD 6a3d37b4d885129561e1cef361216f00472f7d2e builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
>> ERROR: modpost: "__udivdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
