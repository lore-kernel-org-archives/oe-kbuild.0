Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069601E32A2
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764336897; cv=none; b=BTRQAeMUoWIWS6EBQI3FJA9THWwOmcArw09OSdLS2GkWjEOhuxzWt6NkqHZksmMWOI2xt642GWGRu4d0yvCiXtFj1hoU889GDPRmBWH2ck1tkek9FM/QRZCyEf0qFKDMgsuTsmOO9sHRNQ6dl1T+cSdJXjlIU0Zms17Qh3etSM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764336897; c=relaxed/simple;
	bh=lzya8uF1n6yuOr9T3ucAe0GcFJCCnoxyar4HQIQRe28=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=paV4INGt0sd2O55+Ybz5o5kzWHyUFPtnYv2O+eSVpBRWmwTYnu2Y95jEdCl26RpVCg3ydrrqKDVrqViPpqE8pxyzyJ9LhmLuoOfiBqyKXsxHQESzQm9FAR+6Tp+pnmioRsTR4Kf3Td18ujN2EiF0/kwsv2KFzaEnmB6AZRn3n8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/w/jE8L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/w/jE8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764336896; x=1795872896;
  h=date:from:to:subject:message-id:mime-version;
  bh=lzya8uF1n6yuOr9T3ucAe0GcFJCCnoxyar4HQIQRe28=;
  b=n/w/jE8Lx0ishn51sCIy3HqTfJ9VdINn0UQ8+e/l4r3vMxaneMd2zaHh
   a1mEwcYQRjY+SedLNv78ZSF+2rm1/fbUJOYlcwUnhCz3UCQL8O6XalGkC
   5aYBzAgtFMTrWeyjiScvS3TEGJu6lBeppu2dmaKoe6asQPL8wrNtRwVOl
   Gp0wKnpTh+diFXUwfh5TtYSCykqCLJOlPuG0970+ZYEub7Axuuym3cLlC
   BGOhSDMjnVGhOLtaI+6cLkO7lc5M9Cev8Rg1LycQMOW86ksmsIOxAm951
   0QaD0zjUBTB+TfRjrdgL5qBVPgi2SunBQrMxKPIsc0C6yD0BjYC2N7MhI
   g==;
X-CSE-ConnectionGUID: 1eaQD7jYStu6Xp0qkgd6dg==
X-CSE-MsgGUID: QRy6plHeSoaJAKO12w6SnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83760516"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83760516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 05:34:56 -0800
X-CSE-ConnectionGUID: x8lKM2ocS7qWE+VwKHxYZg==
X-CSE-MsgGUID: p9VwBfznSkuSCjxgoyxIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197803467"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2025 05:34:55 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOyce-0000000022p-497J
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 13:34:52 +0000
Date: Fri, 28 Nov 2025 14:34:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [trace:trace/for-next 8/41] checkpatch: WARNING:MINMAX: min() should
 probably be min_t(unsigned int, ret, buf_size)
Message-ID: <202511281411.0CRs9mCR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   f6ed9c5d3190cf18382ee75e0420602101f53586
commit: 299ea67e6a2b3d0d4b707f45b8c66d8b4bbbf2c6 [8/41] tracing: Add a config and syscall_user_buf_size file to limit amount written
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511281411.0CRs9mCR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(unsigned int, ret, buf_size)
#283: FILE: kernel/trace/trace_syscalls.c:587:
+			ret = min((unsigned int)ret, buf_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
