Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850705;
	b=VwnP1Z5HZ1yvldLq6jWBuSS13xaQSHW+94HJPJxqxeQUW5bMKqZ6EAWhh0TlcWErjMwX
	 73QdZKYVcvOe1o4yihWVprv1TVMNHTSrgNUm3y3yctsES/W79j+jsjAqj50agPUFXLVvI
	 dOAwS2/i9HGU8qHeh5zrO31O/tUVeF6vF3jWTHq6JwLRCbE1Y94fTSveSu+ZshaMi0obJ
	 qiNqkazsdvoUCGeJt0EqLCksN9Fn7MWl3spq1n0h2aaDW9zqz62Fx1/jcDjKo/G4mcupc
	 VA4cHdc3yudADzpUi//nZ4O3uB2nVArobdaux2/iEO1xei5fndG3DOV8NNpH5oOVe5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850705;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SrMnH69lzB6HYUx3yUESaU1ZCpAV//BRX14MzMbt7M4=;
	b=rfYfT+bVNtEXd/Dcy9x880GpPnufwphdUiOqj6qRwkhXjRpV42iGrpqbbjFBcd9hMhB6
	 vqm8A8uHOS4khdMo/Bb+iwmthUqJZb2SXy4ZbkyVC+EmoKsCiq/ho7jcO1r0m/efrbVO4
	 Ed1EY4sqmgHs2rs8haUL5R5RipR6esXbYZZ27tVO/TdqwH7qn6FT4qEe32nK3YPn7TBY8
	 Fj0BnfEzM1OwALL9s6yV4eDsPqTGc6YO1YkE8IV3rwmTguleSp/zKXOSP+RzFlUrtt+k7
	 FnbRTxcKL/IrzQEu4f4qGyJRMxENew3cKEe7wXe9/bQXiG/JhQB3gmsMLPTi6MDY7rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OvW1lZjc;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DB606A323
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 17:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OvW1lZjc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794850705; x=1826386705;
  h=date:from:to:cc:subject:message-id;
  bh=BGLZ+lQOy1bMmkSNl3qUrhhcamr/mgwtQlAg4bdm9Os=;
  b=OvW1lZjcROYLjN+6YfTHFbdZjGdEF0z7RJykzrou9AUZlGrwtS8vPlX/
   fIUQIylL69NkOMSw6Plr2JvssCOWQ6ds5e/OBoOhESVs5Snt+n7h5Nqfi
   FDSjbb/RqTG5zsXEiPkzSlo3VHbLnDBaBp2iGCUv1ALPUsF83I1cLsD2/
   lgnJfHhWAeH4I9FX6raWSFO4q8iYdpiyFk1IJKOOD/sL5EoMhc3ORKuQZ
   Fq0x/tfYc9Wr29s8VMUubCNI9eUnFS+1T2Yj2iDV4PfZ+Q57o0f0PFzMw
   sIM9Y2JsaGUJtET/opTpDXkaRvCy7lcJPO06cmeU7oIeCqsklnJIeM9RW
   w==;
X-CSE-ConnectionGUID: MANZkF3gRViKkwDQJPeJOg==
X-CSE-MsgGUID: mfjhL+PhT5u7xgH/BRnx8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3631080"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3631080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:38:24 -0800
X-CSE-ConnectionGUID: bEvSVhHxQmuYWSv+0al73A==
X-CSE-MsgGUID: mqOax7D4TlOe2zDOVBIEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9729391"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 09:38:23 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT0er-000000002ku-2GLn;
	Mon, 16 Nov 2026 17:38:21 +0000
Date: Mon, 16 Nov 2026 18:37:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5504/7428] WARNING: modpost: vmlinux:
 section mismatch in reference: seq_buf_terminate+0xc (section: .ltext) ->
 bootup_event_seq (section: .init.data)
Message-ID: <202611161724.jAFi1Vaw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 7b8cd26b6aab8cf147165610d13964f79200a5a7 [5504/7428] seq_buf: Mark a seq_buf overflowed when terminating it loses a byte
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: um-randconfig-r2308-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161724.jAFi1Vaw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161724.jAFi1Vaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611161724.jAFi1Vaw-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xc (section: .ltext) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x38 (section: .ltext) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x8b (section: .ltext) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xb2 (section: .ltext) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x128 (section: .ltext) -> bootup_event_seq (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
