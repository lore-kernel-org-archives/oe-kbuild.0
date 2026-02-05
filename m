Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D732C0298
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770267438; cv=none; b=QN4sSvYUOqAhCLlpBvPlg30XsqWa/NIwWpR9T2Ivvy/xIUcj6+YCepAsvMrpIKAWPO/f19JS15PIXR7vlAxXLXjIOogM7ooh4LoC4L8BML8kw4sHJK1YpPObIWVparAekAboTMsKyi1t2Oo/lUKnYVZXb0SGDAIUkqbNoSXft4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770267438; c=relaxed/simple;
	bh=4kpFRQ1PMemceQJYlWYfcVKJGk1PR9KzdVL8nHKX8Y8=;
	h=Date:From:To:Subject:Message-ID; b=PuZRHh2fSwsxL+Do/Wmhj5Rtt//ahXLDyrEx6ZIVZrHEGXxgV0X9TOoSIelDRQFtGSUJpds+7QcOL9GQVQTK2raD1CsImJhbtZLy6hguxLlUcp4yERVv6MSaeKo41ax4EUoNqfCIZmVXR4Yoa9mPUpCEv5JE9gAn98BobpoYQQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwyv9Iek; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwyv9Iek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770267438; x=1801803438;
  h=date:from:to:subject:message-id;
  bh=4kpFRQ1PMemceQJYlWYfcVKJGk1PR9KzdVL8nHKX8Y8=;
  b=bwyv9IekyCr75mf3d0Y8xy5FpEoBA8GJWBAT+FMd0RUAMAEw6FpVhgS+
   f3wkEOeHCO9Bq/Nijo0zfClxzDXIilS08KraCtdgmzQFFk5SvEybn6Zik
   kgnw89LcYbUH572CXB2MRKLjFvokNkPPdKHfIpOqAKMzE7cIb0qXeH7yw
   AgQIpJXlH4APYCDd9UwY2Fq0OYWESB/5IHGJqWfPF8UpGM/042CxwTVMy
   4ty348DhenV6oaioxeOxIopDy+7zC9t2h0wpZ09aByGAc+sle7n8U5UFy
   9ylZp1JVzUF0mz2a49LkYWOVztydrNLjj9gY8aZYvPUBc+ltB5bKuQl9D
   g==;
X-CSE-ConnectionGUID: CpVOl5jtTNKdB9P6Sni6Kw==
X-CSE-MsgGUID: O6qvIC7tTl+AqtKWLxmbPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71357296"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71357296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 20:57:18 -0800
X-CSE-ConnectionGUID: 17KLts7tQRyW9N8JdWe4wg==
X-CSE-MsgGUID: LmJNeOSkSLehaUDGHYTnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214877256"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2026 20:57:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnrQZ-000000003zJ-00ZN
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Feb 2026 04:57:15 +0000
Date: Thu, 05 Feb 2026 05:56:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xilinx-xlnx:master 86/590] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'and'
Message-ID: <202602050550.vLx3KX40-lkp@intel.com>
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
TO: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 7cb226e4c0026fcb7246e2466a47025cf1ca47b4 [86/590] OF: DT-Overlay configfs interface (v8)
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050550.vLx3KX40-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#71: FILE: Documentation/devicetree/configfs-overlays.txt:4:
+and and it is manipulated using standard file system I/O.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
