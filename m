Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8091C8C0A
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 23:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691881407; x=1723417407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FT++cUC+trFB7tnPTzuBKeEA0fJun+SbEor9j4i+tjY=;
  b=EcLg++NRnvdq9LzSpWSV9pnuILJywgLfTKBU0faWPZZEjCmPsDN9B7XB
   /T3VwGCGprjl6ytHo6qVTZ2TYMYFD3w41XRqJwWjB9ovsqVPbZSH19v6Q
   A+ZyGii8IHp+yBQowZFKTEMVtm1uXqsHRRWa4i9yH33+EecOmg5Nr3zSQ
   YTJOTg3wIXsoLWRZdaSu64tCD0kvB0UIKj6gBUeo5FJ0y3OzqUnEZby6a
   qF2k4A7wDRMqQEaCeg8RlOhP4xXdmKJTUPHGfk2CUo1ILATA/lpdCTUeF
   LK3WCA1Syzdacp3uZIBcRUzotR1YW99RD0z3Zwmx6tIZVPFK2m8idj/di
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="375560634"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="375560634"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 16:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="798396995"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="798396995"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2023 16:03:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUxdl-0008pE-0S;
	Sat, 12 Aug 2023 23:03:25 +0000
Date: Sun, 13 Aug 2023 07:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}:1020: Error: value -148 out of range
Message-ID: <202308130635.HRxdGedZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: {standard input}:1020: Error: value -148 out of range"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shenghao Ding <13916275206@139.com>
CC: Mark Brown <broonie@kernel.org>

Hi Shenghao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ae545c3283dc673f7e748065efa46ba95f678ef2
commit: ef3bcde75d06d65f78ba38a30d5a87fb83a5cdae ASoC: tas2781: Add tas2781 driver
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: m68k-randconfig-r083-20230813 (https://download.01.org/0day-ci/archive/20230813/202308130635.HRxdGedZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130635.HRxdGedZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308130635.HRxdGedZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1020: Error: value -148 out of range
>> {standard input}:1020: Error: value of ffffff6c too large for field of 1 byte at 00000473

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
