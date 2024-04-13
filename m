Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3D2F56
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712971213; cv=none; b=QGq0+S11+i73/CCvt1neCHfN2du4Jr4i4XOKAm9cxK9bIIhOfQGyG/5oJp3KllO759YKRVhV+Inh/9l68+vAePlpA3/p9+InWvA2QNa5Tq2RnUkjO2/hMtqwiyKa1V4BI66+awDvBV2TM7EzokZXryksdbzbrGniOx3H6lBXNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712971213; c=relaxed/simple;
	bh=V0nbjS0ldbkWTwZBKMT1Uda0GBwcgd/WnNTgr0bpV3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8SsXjImc0lf5/2c1ueaUYLENwMtJmtRZoP6zAd3R3sml026YfC6ynN+scNB7ulkyebHiOsrv7iHpd51lSTV9Tg/4N+hx/frt7vCIHE0ATJc1TZODKagfGtpXic8R8xtH0AMWqs4f5SyRv2NA4CMXXxbzyy410iy7NvHyPHXNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYhMrkCu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYhMrkCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712971211; x=1744507211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V0nbjS0ldbkWTwZBKMT1Uda0GBwcgd/WnNTgr0bpV3k=;
  b=bYhMrkCuh4oLDM6KzmGBWMlHkpBkIroo7SParpiJLnDbIvQJB6UbzFgF
   fJ9lfKXNLyOgIHsGgpMv8QqTZaRdIMLh877Fx0yg5LAMlWYzCQnJGnHXF
   qrnZeBei2VpQqQcpIsZw2n7xyzQKNy5gE3kJ1pkPhZ4lixnsBCCU6vnNr
   f6WiSy8OT/YRkposX6HeAEkjeeZKEmrVfXJhZfjIZkfYmGZdbsFeuPz4z
   /RIPvD2c1BNLMFReC3gLK5Q9D3yHGnwuMrvfwv36mnzwylvdTxl8sxamr
   gBouj83VtlZSW/Osq0dw3sRPrYRZK1gYkEV2QfiEWw7EWRuN8Xi6hcVzs
   A==;
X-CSE-ConnectionGUID: vl5n0HN6SU6yGtX0O7O/Mw==
X-CSE-MsgGUID: UYsd5pP1T6ydE6GNaGljYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8619275"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8619275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 18:20:09 -0700
X-CSE-ConnectionGUID: YU4yBNBfRdubKpuXTQNH1w==
X-CSE-MsgGUID: Cb3jY3P3Q0aDLccJT8LdlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21319637"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2024 18:20:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvS32-00017S-0R;
	Sat, 13 Apr 2024 01:19:55 +0000
Date: Sat, 13 Apr 2024 09:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 01/15] selftests: netfilter: move to net subdir
Message-ID: <202404130944.CbM4VPcN-lkp@intel.com>
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
In-Reply-To: <20240411233624.8129-2-fw@strlen.de>
References: <20240411233624.8129-2-fw@strlen.de>
TO: Florian Westphal <fw@strlen.de>
TO: netdev@vger.kernel.org
CC: netfilter-devel@vger.kernel.org
CC: Paolo Abeni <pabeni@redhat.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

Hi Florian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/selftests-netfilter-move-to-net-subdir/20240412-074547
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240411233624.8129-2-fw%40strlen.de
patch subject: [PATCH net-next 01/15] selftests: netfilter: move to net subdir
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130944.CbM4VPcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404130944.CbM4VPcN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[1]: *** netfilter: No such file or directory.  Stop.
   Makefile:65: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:143: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
