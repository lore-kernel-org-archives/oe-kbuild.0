Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B591FB52
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689787364; x=1721323364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aka5GOX/haIlPfIKhVrCboaDJVgvac0kiSs7s/x/rwI=;
  b=VIYbgUXrbrcfrRSqXVbbGznUCjFpNHPxC6n0locF27q+27MfPucEm1M5
   ap6dhxNHZ/gX4AmUxZa7mCaUk5oEoMY11AI6eDvNFgsPDkikFCIJ1+T1c
   0ucu9mD/ShqSDahNHwY/3jpibj6UMvw5zSleSS2m5ynCz5sAS4uYBkuiE
   kIeCkzEPNyTdEnJy6VKS93b05ksRqTmXywPp4PJQkoTzLcKjBsLxqAAZA
   PGG/6atXwYaKzDrMjz4RAdQfZUjrAYVD7OwxbH8wdcQp+mLURkehtf1sX
   uB76w4k0D4O2eaqfyaxHGc/qpr0c0b52jkoUQ4a0/RQP2UObOPtz6OM0r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366569083"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366569083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759259179"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="759259179"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2023 10:22:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMAsp-0005KV-0B;
	Wed, 19 Jul 2023 17:22:39 +0000
Date: Thu, 20 Jul 2023 01:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/3] io_uring/cmd: Add support for getsockopt command
Message-ID: <202307200143.xRoDsxlU-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230719102737.2513246-3-leitao@debian.org>
References: <20230719102737.2513246-3-leitao@debian.org>
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
patch link:    https://lore.kernel.org/r/20230719102737.2513246-3-leitao%40debian.org
patch subject: [RFC PATCH 2/3] io_uring/cmd: Add support for getsockopt command
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: hexagon-randconfig-r034-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200143.xRoDsxlU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200143.xRoDsxlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307200143.xRoDsxlU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sk_getsockopt
   >>> referenced by uring_cmd.c
   >>>               io_uring/uring_cmd.o:(io_uring_cmd_sock) in archive vmlinux.a
   >>> referenced by uring_cmd.c
   >>>               io_uring/uring_cmd.o:(io_uring_cmd_sock) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
