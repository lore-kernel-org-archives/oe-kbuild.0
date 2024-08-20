Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EA18A6C6
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Aug 2024 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145990; cv=none; b=cOKwrdR7f4+NYgwLAD5QDY5Nx34Kp053N+NQCb9vXDPX+p/CXafxcVRessuJ1/Zg5GCevz+wUzwtnh/nvTmK3nQpDNZY930+7kh6s+19N+WnIffoDgj1NiKoBXcn6FV/K8cw9mKQ8M5yKxXrCuWQ7fjY8VAkOM8PBJiULkKnqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145990; c=relaxed/simple;
	bh=fsvYWgXzqG92IAosZK42cf9QQljvInBy7BU2b5itqgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H27JIf9t8hRWhUU2rGLnxjCe0Gedw9Xchs9FqP9lvhkrQuVGeTqLwOn8YtTZghKPwZTG6PfRPKfArFlHfWU5W45w4WhezLHJX9iSazEzB/etEbN7RiOYpFMy6bh8UhGNBIl+H0c77vG7vxXPi7Fo49ts0ggW1f+K/8K8/4Pn3vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhFh84V5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhFh84V5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724145988; x=1755681988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fsvYWgXzqG92IAosZK42cf9QQljvInBy7BU2b5itqgI=;
  b=KhFh84V5lw7TWJh9FaG0TzR/iMBXKF6YsIbjmnuPvhm8rAGFVj6A/xt6
   m/jq5oaqZyX6r3h8nABCXvgsMPJFsnAKbprNhe1pmhuqrxKEU49aKBcbO
   enPDjCoZWSoq1JW1dJIXMpfgcKFmdgiZhauet3TMoy4y9aREWBkFDm1gx
   /sspBOitnlCGRsz6fsO9RI6v9FM8sYQecW1EuQHY1WQD6CvkOsJ6EQX8Y
   ZS3eir+bgirEukENg6p/o4RDedYUhTJfHS2tkXdZX4KL8rk2B1kO9Ib41
   IRi1eb8CDM5ESxSY7FG8/dqDPCtVKT0LL9EnJ9bJqbNILcppDUY7B+Upe
   w==;
X-CSE-ConnectionGUID: 9kbk8xq2Rsq18mNxYjpqAA==
X-CSE-MsgGUID: 5YhWj6SoRnaXHeQIFV6cIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44955852"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="44955852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 02:26:28 -0700
X-CSE-ConnectionGUID: P/53IF9xRICTnRrLr3hu1g==
X-CSE-MsgGUID: FjeVpdyxTPmwOtv8BUmrOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="98132863"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Aug 2024 02:26:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgL8C-0009y6-1t;
	Tue, 20 Aug 2024 09:26:24 +0000
Date: Tue, 20 Aug 2024 17:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] selftests: fix relative rpath usage
Message-ID: <202408201746.pEVyWOtg-lkp@intel.com>
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
In-Reply-To: <20240812165650.GA5102@asgard.redhat.com>
References: <20240812165650.GA5102@asgard.redhat.com>
TO: Eugene Syromiatnikov <esyr@redhat.com>
TO: linux-kselftest@vger.kernel.org
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: Mark Brown <broonie@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: KP Singh <kpsingh@kernel.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Hao Luo <haoluo@google.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Mykola Lysenko <mykolal@fb.com>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: linux-sound@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: bpf@vger.kernel.org

Hi Eugene,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes tiwai-sound/for-next tiwai-sound/for-linus bpf-next/master bpf/master linus/master v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugene-Syromiatnikov/selftests-fix-relative-rpath-usage/20240814-091042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240812165650.GA5102%40asgard.redhat.com
patch subject: [PATCH v2] selftests: fix relative rpath usage
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201746.pEVyWOtg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408201746.pEVyWOtg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> clang: error: -Wl,-rpath=$ORIGIN/: 'linker' input unused [-Werror,-Wunused-command-line-argument]
--
   clang: warning: -Wl,-rpath=$ORIGIN/: 'linker' input unused [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-Lkselftest/sync' [-Wunused-command-line-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
