Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E26AB5
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Apr 2023 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682193353; x=1713729353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fp+loxFbSN6nyLM9aypL6Eau4oWPM0cfg+KEP0C2J3c=;
  b=O0kEeYxqn46sxrkM+6mgRBIdLZ4zI50RIRzoHY22yXnxXlkMyK2fEv6m
   NyhNe9QcidcIn8bh7j+2ny/YAkPZRiQyezDHet5NezSJ4IFoBe5fFgkqB
   sCm17FqNMV1hOKKHLEoGJAR4OfKXLEgOxNomL4uxM/gDX21l1VZ5tSiXA
   2weaqAtJIxbu5xRX1vow4UPmQT1VV53zIf3HZxCIoZwfZbDBxvDfcX8Ck
   ITwTydb/9PucXpSe9A/HgYyJWghffh5IPwGz9J2ndRtCi4jGlcKAbotOC
   rCoGnjnMD1dg3q0uWswXWfZQZpbnfoRp/6u4JQtTGEa05fsdYMKkOwCK8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330399197"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="330399197"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 12:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="670048452"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="670048452"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Apr 2023 12:55:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqJKp-000hT8-1f;
	Sat, 22 Apr 2023 19:55:51 +0000
Date: Sun, 23 Apr 2023 03:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v12 2/3] cachestat: implement cachestat syscall
Message-ID: <202304230337.Qd5oUtzU-lkp@intel.com>
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
In-Reply-To: <20230421231421.2401346-3-nphamcs@gmail.com>
References: <20230421231421.2401346-3-nphamcs@gmail.com>
TO: Nhat Pham <nphamcs@gmail.com>
TO: akpm@linux-foundation.org
CC: hannes@cmpxchg.org
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: bfoster@redhat.com
CC: willy@infradead.org
CC: linux-api@vger.kernel.org
CC: kernel-team@meta.com

Hi Nhat,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes linus/master tip/x86/asm v6.3-rc7 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230422-071625
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230421231421.2401346-3-nphamcs%40gmail.com
patch subject: [PATCH v12 2/3] cachestat: implement cachestat syscall
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304230337.Qd5oUtzU-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/filemap.c: linux/mman.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
