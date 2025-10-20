Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714F2765C5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975668; cv=none; b=kWvmNF5lJCg4Tz9XDZpZTs0HeZr16ASMo7O2rZFVY/z8LjOwaxOrO4KCPDxc0JLpwzJnXD/x2NG4hkkPFrmjNuipzPM4X3dvtJJF4nikiqFHQd4kfD8huTRoyy8q/PWh9pCLbwEd0Vq82pTHIELhffYYSuoinapTnAmapIFTl4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975668; c=relaxed/simple;
	bh=TguVDjfe4dJ4Yb1AyKA5t6C6fmpCiQ59Wmjmu0OvyGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9HoxWO1jgT/rp9mi6JFnmGHcwymf++hkhJr5NpBrRfP3GNrvJAGsl5wuuuHOntHcAgYwP9iDQ6mTg2sYMP971bSzLkJz2OvqE5sjcnqUDX7R7BS48OW8zNncxOmdLbtRqjg/H+UoilHQVZHtsR6/8QkWiioaXfha/lFGF/DnKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7Y2TlCr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7Y2TlCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760975667; x=1792511667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TguVDjfe4dJ4Yb1AyKA5t6C6fmpCiQ59Wmjmu0OvyGA=;
  b=l7Y2TlCrGV8GAJkMIiej4nelfZnY93H4fcAmJO2UPlMjHL3lmmIU4wHJ
   +TGPGe4wr+93Fd/gBaOSaQgJzx8WUOJAgEyVHdAsTOIiZOSoXML3DokXh
   ZqyvZvwtamxl/COWG0PQUn9PJdVM9U4RAkSuJHGptWDhD/+UQ/IcAvIpl
   FB42bL5ryFsc1hmqOwDiE1PrO7ozkh3EWPP1y5bwJAUmvFtoF85DFo7/l
   2gnRKfzGStHPoboX3hUIvALeiSlrySaWutSw675XWY3iKElOy4IGxBL5o
   /VtEkhkxZWrJBhF+kEnpprg+UwomyM5Y8t+9tt1R4XTkRHEwhg2r9kfA+
   g==;
X-CSE-ConnectionGUID: gibjvDa3ReSf0wM/ulxasA==
X-CSE-MsgGUID: 7lRneho4SOK8DXahjcz2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50662508"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="50662508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 08:54:26 -0700
X-CSE-ConnectionGUID: aBjrgLO7SMyEzszURZMjNg==
X-CSE-MsgGUID: K2GhMGZITLKeJ9Bnbp7sXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="213975044"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Oct 2025 08:54:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAsCV-0009xp-0c;
	Mon, 20 Oct 2025 15:53:52 +0000
Date: Mon, 20 Oct 2025 23:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <202510202339.CiYSDt6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251020091613.22562-1-johan@kernel.org>
References: <20251020091613.22562-1-johan@kernel.org>
TO: Johan Hovold <johan@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nicolas Schier <nicolas.schier@linux.dev>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Johan Hovold <johan@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc2 next-20251020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/modpost-drop-_probe-from-section-check-whitelist/20251020-171732
base:   linus/master
patch link:    https://lore.kernel.org/r/20251020091613.22562-1-johan%40kernel.org
patch subject: [PATCH] modpost: drop '*_probe' from section check whitelist
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-buildonly-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510202339.CiYSDt6j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510202339.CiYSDt6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510202339.CiYSDt6j-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: nxp_stm_probe+0x0 (section: .data) -> nxp_stm_timer_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
