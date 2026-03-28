Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3324329E46
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 02:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774664642; cv=none; b=YEL6ZEMJ+ObuoXI10kggpy6nskndFhYk1jLKE8HeLjckO6EGvRNmiIs4fh6bwVVwD15K05AwDFfz4NIKHHrahQBnsEcq2RAR+H3/sVTRtrxb4/+jVp6fQzJtxQp1MuRasKd0kPb59zt5gZ4yXSptRfq6F/lvMtV8Z/CIRExUJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774664642; c=relaxed/simple;
	bh=RIIkktdD9WYmb9RJwuOl0vFbueCzsBsE784+JKUYlHw=;
	h=Date:From:To:Subject:Message-ID; b=KS6ieLiRs5YzOKe0KdrEjmcnIp5knCy5W+oMfWz76tmF3o4Y2QbwWRHiFFc3sff4uxX2JvRHkRY2k1ynMlyz9ZONXhWprMa+6Cc20IwU0vb+IlastwMdZkPHylGNXLgXvea2lCxMPfK9O8gTNONQNBqi+eb79w3yf/rHk1tWJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQEaWPv5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQEaWPv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774664641; x=1806200641;
  h=date:from:to:subject:message-id;
  bh=RIIkktdD9WYmb9RJwuOl0vFbueCzsBsE784+JKUYlHw=;
  b=NQEaWPv5qQJrg4+buGeewYPjI0vMLI0YS7Z2+2CHWhgeO4kTntoxbj4Y
   hf32Um1h3sWQMLeP9HH6XaOR9CFtKPy643ZrUskgZPQNezhWTd3nEePw3
   iYFH164crEAGl6NEN8kFDinIjd9CDwuDn5+r/S6v+Lz6f6ZYNUPCzcc6o
   CGKL1hzpextFJwU6f2vi3d20KdnuxUy5Sl/zW4Xxx8jqKQ2q6ArHAV+JN
   o8Nwc+RaKIVrWX14gMLtbfzNyprza23s2VqxxdtT5+gnIOs/+t7BtXwSt
   Mq7e+6FtWKo3YffdeIog5j2c57ObNQTxx+h9gD62BYyTAo93POEXt3zWo
   g==;
X-CSE-ConnectionGUID: iA9HQjK9QMmSD7oFWN5PXQ==
X-CSE-MsgGUID: vnYkJU+lQ3uaUKjV9JPAcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75453108"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75453108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 19:24:00 -0700
X-CSE-ConnectionGUID: 9aN2DzYHQUaR3rgNmg7ChA==
X-CSE-MsgGUID: +vz9tfyUROurI2DixT6XmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="222162015"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2026 19:23:59 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6JLB-000000007bl-1YOw
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 02:23:57 +0000
Date: Sat, 28 Mar 2026 03:23:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ast-bpf:stacklive 11/15] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202603280311.SnzvdZuk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   e9897a4a3d11866d9fc8685fa1f0b881d4bd1302
commit: 51aa9f635bf6ef4f5657d66565dbc1cef26c8548 [11/15] selftests/bpf: Update tests for static stack liveness output
:::::: branch date: 26 minutes ago
:::::: commit date: 39 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280311.SnzvdZuk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#121: FILE: tools/testing/selftests/bpf/progs/uninit_stack.c:79:
+		r1 = *(u64*)(r10 - 104);		\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
