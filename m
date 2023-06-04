Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E81A15CC
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jun 2023 05:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685857095; x=1717393095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnZYtq8MPtprxF44XsuEKGLEGfRMKsd3rfXfa6CxU+g=;
  b=TdxYGUOy/IW82Tnoo+1U+pIx0i6NABFmp5dK099/rAsQ6Ub1qxvmTV4w
   udSrJ8DkSzGbEyjUe5MfT5WQyQfmwu8rYyQW69js9fiyecZvL++34VbOR
   cw6wRUzNIVVZiQwca35mQyQcaIW+wqjPgkTyhO5XvmSwakpSuU09WTEwS
   8s3/O4S5YyErXJbswN7D0P1N151Ai1tE2/wr1aavzt9r+Q/R6XjuDksMB
   QZEN5nOlV+UbqcxAP+uLJ2x+Vf6l4AH2oHe3ZTXqF57N+7AWSVKXUA8Pm
   28GFSVp65hjOy9OREgIMEdhX/3ZBYqiNoIlR1YWlMonyYV9sFslxWMSKt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="442529996"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="442529996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 22:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="832418939"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="832418939"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Jun 2023 22:38:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5gRP-0002LX-38;
	Sun, 04 Jun 2023 05:38:11 +0000
Date: Sun, 4 Jun 2023 13:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH RESEND bpf-next 01/18] bpf: introduce BPF token object
Message-ID: <202306041344.sIqXOEJL-lkp@intel.com>
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
In-Reply-To: <20230602150011.1657856-2-andrii@kernel.org>
References: <20230602150011.1657856-2-andrii@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: bpf@vger.kernel.org
CC: linux-security-module@vger.kernel.org
CC: keescook@chromium.org
CC: brauner@kernel.org
CC: lennart@poettering.net
CC: cyphar@cyphar.com
CC: luto@kernel.org

Hi Andrii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-introduce-BPF-token-object/20230602-230448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230602150011.1657856-2-andrii%40kernel.org
patch subject: [PATCH RESEND bpf-next 01/18] bpf: introduce BPF token object
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-c031-20230604 (https://download.01.org/0day-ci/archive/20230604/202306041344.sIqXOEJL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306041344.sIqXOEJL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/token.c:30:6-27: WARNING: atomic_dec_and_test variation before object free at line 34.

vim +30 kernel/bpf/token.c

59e6ef2000a056 Andrii Nakryiko 2023-06-02  24  
59e6ef2000a056 Andrii Nakryiko 2023-06-02  25  void bpf_token_put(struct bpf_token *token)
59e6ef2000a056 Andrii Nakryiko 2023-06-02  26  {
59e6ef2000a056 Andrii Nakryiko 2023-06-02  27  	if (!token)
59e6ef2000a056 Andrii Nakryiko 2023-06-02  28  		return;
59e6ef2000a056 Andrii Nakryiko 2023-06-02  29  
59e6ef2000a056 Andrii Nakryiko 2023-06-02 @30  	if (!atomic64_dec_and_test(&token->refcnt))
59e6ef2000a056 Andrii Nakryiko 2023-06-02  31  		return;
59e6ef2000a056 Andrii Nakryiko 2023-06-02  32  
59e6ef2000a056 Andrii Nakryiko 2023-06-02  33  	INIT_WORK(&token->work, bpf_token_put_deferred);
59e6ef2000a056 Andrii Nakryiko 2023-06-02 @34  	schedule_work(&token->work);
59e6ef2000a056 Andrii Nakryiko 2023-06-02  35  }
59e6ef2000a056 Andrii Nakryiko 2023-06-02  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
