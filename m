Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3617F433C1
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Aug 2024 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724015304; cv=none; b=Xu7/rf+YesWz3amFv8a1Aukt7720HWW7Tbrf5T9vW3qSx2uiuRbjO0SFyYz5P/YbZJxx+TAL3BpKhtKGbnmV4atDVjRiTP9Jj9MzNYEhqQNRkjN/D7VTzVbtyYR4f+FG+O+NcMLDIdkWD58htweQF1W9S9ZTlQNaVb/QR2hYpxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724015304; c=relaxed/simple;
	bh=2EZ+n8pxsiKOjnpkfhP0RozY5N9353FkwWDcEAvOpOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGEd16GCP91h3DSWkgUG2ekv7wF7RNENDhBuRvv91e3BzgBoBqSL2F1NrOOsNTtsEcBJSysAPcSMQm88Dqum77B7m1qZhWPHYrv1yZPyoIKRdc7P9T5AGkLC1rPH3huihEMKbB/duKvxNGCNg/6QY8dKC69rUc4jrrQsDQvtYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EosITZfF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EosITZfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724015301; x=1755551301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2EZ+n8pxsiKOjnpkfhP0RozY5N9353FkwWDcEAvOpOM=;
  b=EosITZfF773CtlGu6nqvaWWpyMn0gGTLbKqzmStdQRShVNdxk8HaXtUi
   lrfPoldGi3HXirdK3wIe25L/D3eaEIghi26GD9QOjV9uLxn4TPGwGKrFa
   jDdLjb0B1QGfCS1xUF+7iBuJiC3iNmirTtnZREdQr88VEwnPp+/izdk+1
   1BZx3kl1mzUcOsl6dZZF0NglhHBjuG8/ZgEQckoVZnX/hWPC2Y+YzbrV+
   nm+7VYf0rv6RnfaMy8PM7QJnhEIGsUFmoNHHPgzuJf7WmqcMbcyAzNyrs
   gnJNRoO/NXUvpHveZOR9PDgDIXaS42bTuoSBxdi8lzlSOo1RMXNXYjyzh
   A==;
X-CSE-ConnectionGUID: FyBu2JjdRIecnWR8S76D4g==
X-CSE-MsgGUID: 3+0us+lWQcGkQNSqxb6HHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26001485"
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="26001485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 14:08:20 -0700
X-CSE-ConnectionGUID: 5L4uBdXKQhSyWw7CJxFm6g==
X-CSE-MsgGUID: 3anfp9K+TC6iJP5V0KVqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="60015312"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Aug 2024 14:08:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfn8L-0008SI-1b;
	Sun, 18 Aug 2024 21:08:17 +0000
Date: Mon, 19 Aug 2024 05:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] selftests: fix relative rpath usage
Message-ID: <202408190453.wsHNZQQj-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes tiwai-sound/for-next tiwai-sound/for-linus bpf-next/master bpf/master linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugene-Syromiatnikov/selftests-fix-relative-rpath-usage/20240814-091042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240812165650.GA5102%40asgard.redhat.com
patch subject: [PATCH v2] selftests: fix relative rpath usage
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408190453.wsHNZQQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408190453.wsHNZQQj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: -Wl,-rpath=$ORIGIN/: 'linker' input unused [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-Lkselftest/kvm' [-Wunused-command-line-argument]
--
>> clang: warning: -Wl,-rpath=$ORIGIN/: 'linker' input unused [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-Lkselftest/net/tcp_ao' [-Wunused-command-line-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
