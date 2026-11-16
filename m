Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862980;
	b=Ep0UI1XuvR3y/G8VnEUOuFgOA9bHDXKNg9poNsm/2bNCblNA/uPnCVFADJqn+CVI+Re+
	 WsczSGDJqR2jfeH2kTiOrp1f5z/q74Ak3jAATG3pZ0WM2BRqyrpM2PPbu0DepWPfDdrs6
	 5y0z/LR41eDSrvqOo9jnvVm27hcr1UG4V/ZTqPJiG307QKPyXvlwyR6wCofU/xpR850hh
	 7OFDYkT4qlafNdcb6WZOXOeHrI3eLDKke0aDT+EVT5sHwgGgtYLfFDetoAGLhI1YG/qGN
	 qDbf0VI8L8040nYLLXeustl+IBbPePgurZePkcBCGjwygcaMlbImx661z/tMisZ1dkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862980;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=j2e4RWHxBHaHqSuUopGWyeHrZmt5JXyxtq64GxbQsHI=;
	b=sltPDlN8QwNjw0Qd0l3QRFjCYIpnKbiW9x+iL6r5rW23UYuJM1nAVGWVhArEw3Ndt9rg
	 +P7XJ9dQiI8v+k01s75D7xLQYjDaZD1fiuak+Gp7kAZ5a6O3f6ZkjLghgrKhIcGWXYAED
	 mpfaYKL4yB355PW4MmeeBOHshEpmOy/0GOooqXvCW1cAsCsmx4KJUXe9a/24DdPUOqh2j
	 iVq3kZvvJSknN4g1x0edmiI7l7+XgxxyZVyMtJ6abAjKweYsMyBGaoK8fP50NxV2YFHnA
	 KG1K9l7o1m11MAY/mMBzvRttMs9JYZ95C9hkbRCGQf9bvjMfnPfflPMlprszi8V5uTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="IME6W/J1";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19051606A330
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 21:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19051606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IME6W/J1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794862978; x=1826398978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnaO96hzT3/YbZeCquZvUGP28bhUIo2/zdOA/Bq3SKM=;
  b=IME6W/J1lwDfUAT0qU/MlGaW6I1Gvo/UhK9z2VoRPTVvZf5l51TcO8zQ
   k2zk+Vw5yyj9T5mfDBNqJE8oaT+Lvbyex2qpLXcfIkK2xmnLly5TCojrg
   jdKx7lzsIz7Xf75RHBerT2CZINhQM9fTYKvgQbBSnjlztRCfDyvW7Pmah
   lHfGNy4F64vEKHJmuzdo+bdVC2U3CdxKGORKez1kxqZcUilmMbfLIqR72
   Oq8tDgRDjRYuqCi5mpQfVfKjR4dCAFf7mfBwP90++v5dOmJOkZ+au2H7B
   4UlNG9wlIf4l+81WTodouVbNDfQYfLi3CRhSzq6PIwu4FNb943Ln4id5D
   Q==;
X-CSE-ConnectionGUID: 3rwQBzAgStmrkxF3ovUrGw==
X-CSE-MsgGUID: eLVlgXI4TPCsadmnTl4tkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3494047"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3494047"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:02:58 -0800
X-CSE-ConnectionGUID: 0Gse+A2TRB+SuvBRzjVlPQ==
X-CSE-MsgGUID: FDmbOplNTD+jhgkgd4xVJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11567206"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 16 Nov 2026 13:02:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT3qo-000000019QC-1nIl;
	Mon, 16 Nov 2026 21:02:54 +0000
Date: Tue, 17 Nov 2026 05:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] seq_buf: always inline seq_buf_terminate()
Message-ID: <202611170443.Mk0PC85z-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261115153430.1607764-1-sashal@kernel.org>
References: <20261115153430.1607764-1-sashal@kernel.org>
TO: Sasha Levin <sashal@kernel.org>
TO: Kees Cook <kees@kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Petr Mladek <pmladek@suse.com>
CC: linux-hardening@vger.kernel.org
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7b8cd26b6aab8cf147165610d13964f79200a5a7]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/seq_buf-always-inline-seq_buf_terminate/20261115-103429
base:   7b8cd26b6aab8cf147165610d13964f79200a5a7
patch link:    https://lore.kernel.org/r/20261115153430.1607764-1-sashal%40kernel.org
patch subject: [PATCH] seq_buf: always inline seq_buf_terminate()
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-1015-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170443.Mk0PC85z-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170443.Mk0PC85z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170443.Mk0PC85z-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_set_overflow+0x3 (section: .text.seq_buf_set_overflow) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_set_overflow+0xa (section: .text.seq_buf_set_overflow) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_set_overflow+0x16 (section: .text.seq_buf_set_overflow) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_set_overflow+0x24 (section: .text.seq_buf_set_overflow) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_set_overflow+0x2e (section: .text.seq_buf_set_overflow) -> bootup_event_seq (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
