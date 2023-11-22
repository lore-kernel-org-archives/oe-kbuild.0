Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4703FB1B
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKUlaOJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700674490; x=1732210490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2oj7ZFrDBUTU9fdGEn6KwB41+jmFnqwbp/nlKLEShkQ=;
  b=VKUlaOJi1cQ2Dz5W07D3ac/QCOurSjEyh6LZNsUvjaHR5VFRN/TK5nkW
   9c+KEmuvX+UoOIQJ7AHwvl95ILM+m2G7cYrwOMYJ4b4VMUlwglbX9JwmE
   T4a/uzOvcDrrqDnKfPeVzJj0RRZ2X945idtoXglAbOe/ArlgVNDt5RhnX
   YrRLfgWCtEq8Bba60EnZ1ICs6nz0DJCgg3P7fCVK6TW6Y9hVeS0GZuy6z
   kEY4PMf8PciYXJLNPwibydx8lQ/e4tI30wJEsNzO3DYvsiuIAhaCuWCT6
   t8IZg92oZkwhiM8qe+YW4aD+/YXalMkhduUixGsMVUYgTlSFH9mmO+eB5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="390966888"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="390966888"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910906606"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="910906606"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 09:34:46 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5r7c-0000jL-0S;
	Wed, 22 Nov 2023 17:34:44 +0000
Date: Thu, 23 Nov 2023 01:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 bpf-next 11/11] selftest: bpf: Test
 bpf_sk_assign_tcp_reqsk().
Message-ID: <202311222353.3MM8wxm0-lkp@intel.com>
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
In-Reply-To: <20231121190134.73447-1-kuniyu@amazon.com>
References: <20231121190134.73447-1-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: kuniyu@amazon.com
CC: andrii@kernel.org
CC: ast@kernel.org
CC: bpf@vger.kernel.org
CC: daniel@iogearbox.net
CC: davem@davemloft.net
CC: dsahern@kernel.org
CC: edumazet@google.com
CC: haoluo@google.com
CC: john.fastabend@gmail.com
CC: jolsa@kernel.org
CC: kpsingh@kernel.org
CC: kuba@kernel.org
CC: kuni1840@gmail.com
CC: martin.lau@linux.dev
CC: mykolal@fb.com
CC: netdev@vger.kernel.org
CC: pabeni@redhat.com
CC: sdf@google.com
CC: song@kernel.org
CC: yonghong.song@linux.dev

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/tcp-Clean-up-reverse-xmas-tree-in-cookie_v-46-_check/20231122-030405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231121190134.73447-1-kuniyu%40amazon.com
patch subject: [PATCH v3 bpf-next 11/11] selftest: bpf: Test bpf_sk_assign_tcp_reqsk().
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222353.3MM8wxm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311222353.3MM8wxm0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/test_tcp_custom_syncookie.c:63:31: error: field has incomplete type 'struct tcp_cookie_attributes'
      63 |         struct tcp_cookie_attributes attr;
         |                                      ^
   tools/testing/selftests/bpf/bpf_kfuncs.h:60:8: note: forward declaration of 'struct tcp_cookie_attributes'
      60 | struct tcp_cookie_attributes;
         |        ^
>> progs/test_tcp_custom_syncookie.c:514:57: error: use of undeclared identifier 'BPF_F_CURRENT_NETNS'; did you mean 'BPF_F_CURRENT_CPU'?
     514 |         skc = bpf_skc_lookup_tcp(ctx->skb, &tuple, tuple_size, BPF_F_CURRENT_NETNS, 0);
         |                                                                ^~~~~~~~~~~~~~~~~~~
         |                                                                BPF_F_CURRENT_CPU
   /tools/include/vmlinux.h:104429:2: note: 'BPF_F_CURRENT_CPU' declared here
    104429 |         BPF_F_CURRENT_CPU = 4294967295ULL,
           |         ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
