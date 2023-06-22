Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61A1FDF
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687423719; x=1718959719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OGb8hZWyDSDPRxle6SYShZuKtajfeeP6rvCz1atLmus=;
  b=cbIxfB3QwPFynbz2IpmpLuAGFfH9TraPKMbfY0oqlY/I7PUBs/87VbuI
   tKqCfxK5l9wwuPRJxjpj8H8VYWy8V48el1JNrcDDY7FxeBu4GYr/NWafQ
   KAXnX4SbBN3itqEnH0s1G6W18GbfZtweS/DAufnmq8kfNAfr95X/JnBas
   xWusPwrybykUrX434yddm9FRSDB6/PwFf6IvXbJtDjcXiXeH8LsCMz4k9
   TUIr9jxI9Bu8EXuI81UUH5E9ZcEJUagepPh+OtuMwqYZlQM9RW9JZric2
   uWQFhxqE3ATEWnkWeZMCsRKnOXuU7YgUs2I2I4YZR0s690sht6VDPDEQa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350165538"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="350165538"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 01:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784819397"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="784819397"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2023 01:48:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCFzW-0007ST-01;
	Thu, 22 Jun 2023 08:48:34 +0000
Date: Thu, 22 Jun 2023 16:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v3 bpf-next 01/14] bpf: introduce BPF token object
Message-ID: <202306221607.DBpKQ50c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230621233809.1941811-2-andrii@kernel.org>
References: <20230621233809.1941811-2-andrii@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: bpf@vger.kernel.org
CC: linux-security-module@vger.kernel.org
CC: keescook@chromium.org
CC: brauner@kernel.org
CC: lennart@poettering.net
CC: cyphar@cyphar.com
CC: luto@kernel.org
CC: kernel-team@meta.com
CC: sargun@sargun.me

Hi Andrii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-introduce-BPF-token-object/20230622-074240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230621233809.1941811-2-andrii%40kernel.org
patch subject: [PATCH v3 bpf-next 01/14] bpf: introduce BPF token object
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-c001-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221607.DBpKQ50c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221607.DBpKQ50c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306221607.DBpKQ50c-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/token.c:31:6-27: WARNING: atomic_dec_and_test variation before object free at line 35.

vim +31 kernel/bpf/token.c

b829c0b16a8700 Andrii Nakryiko 2023-06-21  25  
b829c0b16a8700 Andrii Nakryiko 2023-06-21  26  void bpf_token_put(struct bpf_token *token)
b829c0b16a8700 Andrii Nakryiko 2023-06-21  27  {
b829c0b16a8700 Andrii Nakryiko 2023-06-21  28  	if (!token)
b829c0b16a8700 Andrii Nakryiko 2023-06-21  29  		return;
b829c0b16a8700 Andrii Nakryiko 2023-06-21  30  
b829c0b16a8700 Andrii Nakryiko 2023-06-21 @31  	if (!atomic64_dec_and_test(&token->refcnt))
b829c0b16a8700 Andrii Nakryiko 2023-06-21  32  		return;
b829c0b16a8700 Andrii Nakryiko 2023-06-21  33  
b829c0b16a8700 Andrii Nakryiko 2023-06-21  34  	INIT_WORK(&token->work, bpf_token_put_deferred);
b829c0b16a8700 Andrii Nakryiko 2023-06-21 @35  	schedule_work(&token->work);
b829c0b16a8700 Andrii Nakryiko 2023-06-21  36  }
b829c0b16a8700 Andrii Nakryiko 2023-06-21  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
