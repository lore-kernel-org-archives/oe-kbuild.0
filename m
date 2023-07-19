Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0D1FB25
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 21:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689801118; x=1721337118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ef538uh5kxLmvUy0xJEEUXd30KZXT/9UUuM7Rwm8pUs=;
  b=hk6S+JfKr7EYHx1XXdLU8BXs3aPCW8MPVN2/Z0X/okq6wHmSOhM+dUXz
   D8M9bnGaPJ5WMVYgvSaJ6qGm270GhJlxsib1G64156WvUxzIfG4C2D8Hs
   1PjWPQKGqcJCgftZTc8tKsMSXISWun/Lz6RGQIV018fTaIY3Agts69P5e
   0FT55Xq6sC5VtUfyyfAYBEDRevTWEEryB/6YgoEedgpKZhvGySKWRlxZO
   1SnTGZBmpojegCIa+jjQ70DDshgmdpy2vk4DRDhZTZigK6/Cq8FZPGTn7
   HuXLh+0KSGHSIIEmU2i2MFKu1bgYvdl9G8YehifXyJTAF65Q4fAmBZJhm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="369221200"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369221200"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 14:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848184311"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848184311"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 14:10:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMERI-0005UD-0X;
	Wed, 19 Jul 2023 21:10:32 +0000
Date: Thu, 20 Jul 2023 05:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/3] io_uring/cmd: Add support for set_sockopt
Message-ID: <202307200541.M2snHBYx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230719102737.2513246-4-leitao@debian.org>
References: <20230719102737.2513246-4-leitao@debian.org>
TO: Breno Leitao <leitao@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master v6.5-rc2 next-20230719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/net-expose-sock_use_custom_sol_socket/20230719-183153
base:   net/main
patch link:    https://lore.kernel.org/r/20230719102737.2513246-4-leitao%40debian.org
patch subject: [RFC PATCH 3/3] io_uring/cmd: Add support for set_sockopt
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230720/202307200541.M2snHBYx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200541.M2snHBYx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307200541.M2snHBYx-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: io_uring/uring_cmd.o: in function `io_uring_cmd_sock':
>> uring_cmd.c:(.text+0x454): undefined reference to `sock_setsockopt'
>> loongarch64-linux-ld: uring_cmd.c:(.text+0x4cc): undefined reference to `sk_getsockopt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
