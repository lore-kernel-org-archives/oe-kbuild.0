Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39FB1BB23
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689802274; x=1721338274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ni6m8JygRFBP6JhDhw3LvAjt8+XbzeLDIyyXLELUasw=;
  b=OqZIwmDxW+t4/V+Tl40zUF9Sn6m86udRA2+kYlVWkevlzxzZtUQiL2zy
   iWAl4nH5w4T2wjfxI6EC9/VBRs3Fttjc3r047X09l8QjUSftGhYgvR1U2
   QJu6XHAzHH9K2lIAA2wmitFceZZsNj1iv2pC0s0HsbMI4mMquolTMu3c6
   zidl5h8oqtFQIrjkdIRqHR7CMr1D6BG0F7rKMhVqAnkYriDtyF5PHFdV/
   agmIhG8FH0KFyeGgwIGQEH7oLluCrEmA8sZvUyesdfXbqG4jt2S1uXlBP
   yS0o9ChlFPWHI6r1Bkwr8FHNqlDZzJnZVs6Ncx4VoBe6ivGp4WQuH87CE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364033864"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="364033864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 14:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867618959"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 14:31:13 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMElE-0005Ue-0W;
	Wed, 19 Jul 2023 21:31:08 +0000
Date: Thu, 20 Jul 2023 05:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/3] io_uring/cmd: Add support for set_sockopt
Message-ID: <202307200559.88er76l4-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-r002-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200559.88er76l4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200559.88er76l4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307200559.88er76l4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: io_uring/uring_cmd.o: in function `io_uring_cmd_sock':
   io_uring/uring_cmd.c:183: undefined reference to `sk_getsockopt'
>> ld: io_uring/uring_cmd.c:208: undefined reference to `sock_setsockopt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
