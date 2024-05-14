Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187DE125AC
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 05:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715663121; cv=none; b=dW4LVj9TSvTiRHad6YjapDWEZwZmoyRZGv2Uhj/cjFgLXhV26RAC3o5HBnR/nofucGYeK+VzwXsc5sAsJWeiSp5e0A9spIjYcCfIAUPQFRJzUJ5ZLyVlksKm419TYZUgns6sJSFSGlkCLWv61yInEbcUhiDiaRAEKFA2Og1ciRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715663121; c=relaxed/simple;
	bh=V+RboeJnkDteWS7V3ym5PbGCoNyrZgTjI7cRIIOWCUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJWB9pARw5LVwdzI8anyCtDa8dI95Erz+qwitvhScI3iLYLwH80cPLA/2OOa1Bd5S/p48vkrrsYAFO4Zjs0uNj6i1V0SMJHaf7ZtxWJ/By8EMSDK9wKffweK00Yyt3jCO5GIoF4chNnkSPMpfs4qYx+ooukUyaD/Au5OYHpqje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glvWrmGG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glvWrmGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715663119; x=1747199119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+RboeJnkDteWS7V3ym5PbGCoNyrZgTjI7cRIIOWCUo=;
  b=glvWrmGGE8ob+2QNJEwM8r8AJPAg8ZoDXb6a0vufY084eAhQR3XIDbdE
   4XUEHw4xDuyo6wFZ/OIB4Ol+7dtXP6dr8tVsYk/gM3xV9TlIU6HY64M9Y
   Sk+8AZK3A45mxd3QpJJPJfibvfx7md+ysk0Drs43sbLEhjqfTX1ojRLH6
   Ogw8ADO7BXsm6nWNQKjUQJweBrvMkwLLtVnRVcwoap9oHdgMu/+ixod/N
   RNnLOfAT2DwAo2+xkGNbBGPkzPBUnvZf9QMzfQ+JUnCFgu109N/W9Qkej
   UzhK2a0YkF5EGtv00uZuzZurDZT52QgL5bQIUJwVX8E/ZoepKhz0sSUDU
   Q==;
X-CSE-ConnectionGUID: 2D7kUqOETR+j46WKtEOSSg==
X-CSE-MsgGUID: OnLaPWg9TnKeHGxwWUmQMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29116101"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="29116101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 22:05:19 -0700
X-CSE-ConnectionGUID: CsMhZ3D+QpWUypx1jD14xw==
X-CSE-MsgGUID: oZW/h6GlTDG2K77aQYkL2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30504309"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2024 22:05:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6kLj-000B5z-0s;
	Tue, 14 May 2024 05:05:15 +0000
Date: Tue, 14 May 2024 13:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next 4/4] selftests/bpf: Add post_connect_cb callback
Message-ID: <202405141220.s3qJcZc4-lkp@intel.com>
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
In-Reply-To: <2da67a207bfd53057db219e13bd68a7ee82d5d30.1715396405.git.tanggeliang@kylinos.cn>
References: <2da67a207bfd53057db219e13bd68a7ee82d5d30.1715396405.git.tanggeliang@kylinos.cn>
TO: Geliang Tang <geliang@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: Eduard Zingerman <eddyz87@gmail.com>
TO: Mykola Lysenko <mykolal@fb.com>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Martin KaFai Lau <martin.lau@linux.dev>
TO: Song Liu <song@kernel.org>
TO: Yonghong Song <yonghong.song@linux.dev>
TO: John Fastabend <john.fastabend@gmail.com>
TO: KP Singh <kpsingh@kernel.org>
TO: Stanislav Fomichev <sdf@google.com>
TO: Hao Luo <haoluo@google.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: Geliang Tang <tanggeliang@kylinos.cn>
CC: bpf@vger.kernel.org
CC: linux-kselftest@vger.kernel.org

Hi Geliang,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/selftests-bpf-Use-post_socket_cb-in-connect_to_fd_opts/20240511-111755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/2da67a207bfd53057db219e13bd68a7ee82d5d30.1715396405.git.tanggeliang%40kylinos.cn
patch subject: [PATCH bpf-next 4/4] selftests/bpf: Add post_connect_cb callback
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141220.s3qJcZc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405141220.s3qJcZc4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c:500:26: error: too many arguments to function call, expected single argument 'opts', have 2 arguments
     500 |         do_test("bpf_cc_cubic", NULL);
         |         ~~~~~~~                 ^~~~
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c:37:13: note: 'do_test' declared here
      37 | static void do_test(const struct network_helper_opts *opts)
         |             ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/opts +500 tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c

5da7fb04902b0f Martin KaFai Lau 2024-03-22  484  
96c3490d6423b7 Miao Xu          2024-05-01  485  static void test_cc_cubic(void)
96c3490d6423b7 Miao Xu          2024-05-01  486  {
96c3490d6423b7 Miao Xu          2024-05-01  487  	struct bpf_cc_cubic *cc_cubic_skel;
96c3490d6423b7 Miao Xu          2024-05-01  488  	struct bpf_link *link;
96c3490d6423b7 Miao Xu          2024-05-01  489  
96c3490d6423b7 Miao Xu          2024-05-01  490  	cc_cubic_skel = bpf_cc_cubic__open_and_load();
96c3490d6423b7 Miao Xu          2024-05-01  491  	if (!ASSERT_OK_PTR(cc_cubic_skel, "bpf_cc_cubic__open_and_load"))
96c3490d6423b7 Miao Xu          2024-05-01  492  		return;
96c3490d6423b7 Miao Xu          2024-05-01  493  
96c3490d6423b7 Miao Xu          2024-05-01  494  	link = bpf_map__attach_struct_ops(cc_cubic_skel->maps.cc_cubic);
96c3490d6423b7 Miao Xu          2024-05-01  495  	if (!ASSERT_OK_PTR(link, "bpf_map__attach_struct_ops")) {
96c3490d6423b7 Miao Xu          2024-05-01  496  		bpf_cc_cubic__destroy(cc_cubic_skel);
96c3490d6423b7 Miao Xu          2024-05-01  497  		return;
96c3490d6423b7 Miao Xu          2024-05-01  498  	}
96c3490d6423b7 Miao Xu          2024-05-01  499  
96c3490d6423b7 Miao Xu          2024-05-01 @500  	do_test("bpf_cc_cubic", NULL);
96c3490d6423b7 Miao Xu          2024-05-01  501  
96c3490d6423b7 Miao Xu          2024-05-01  502  	bpf_link__destroy(link);
96c3490d6423b7 Miao Xu          2024-05-01  503  	bpf_cc_cubic__destroy(cc_cubic_skel);
96c3490d6423b7 Miao Xu          2024-05-01  504  }
96c3490d6423b7 Miao Xu          2024-05-01  505  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
