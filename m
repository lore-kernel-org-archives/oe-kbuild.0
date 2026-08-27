Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE422FE0E
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Aug 2026 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828990; cv=none; b=AuS9ScTRRvHaDcgaxmJez1SLrHME+DoU05AKrxhB8lTMyC6kiPe3Q02+VwAzZMl36pC9/sO2/y8IEkNEqg4CuKcywdcM/+CYpOCPf02jeYwMUzZtjtMjjVPEDUKe/ywWpa+nOQIilucGe52M1gtdELNB6jtxMK+LbueWRBihQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828990; c=relaxed/simple;
	bh=jkPBAotFZNg4eU+Bg5/EYI/gCYLuZDMhLcez36XMTCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YttcVq319V0k32+ZF5F0TYXYMAbVCypH20/sPiBOpqZybvKx0kEuHJ255fx/8XgZuWu46uoAf8i1xxuhfIkAkYbVuLMhQQkitKf/qUu4PoKbEqQCM+6GCWzew3iELwTqfQDFi6kLcRJs8FrtVmOcIE5IMzZpXFA9+LeZcxNmVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/lDLjXs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/lDLjXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787828988; x=1819364988;
  h=date:from:to:cc:subject:message-id;
  bh=jkPBAotFZNg4eU+Bg5/EYI/gCYLuZDMhLcez36XMTCs=;
  b=K/lDLjXsOusss9GwG9/DHo8TkwNciJOi0YjI1nsDhM002x2EnVTmf3yi
   fxhp48GlxPPCBOKLJKYL7d4Ure3JAY77xS1LGc38H8BJ8nKF04XlPH1lI
   aquSWypgWnUg4EJgmUPGd6iSeO1bDJreJXEVxtIkTMJCdYASs9NtLRmWo
   2A0GYAHTvnuZKJyX0T7Yr8KALFZe6CeEXSZC7U2Eqeem9qnRVR3S+AQ8y
   q7EZQmN5VARFy5lZarP6XL/L5RHdWbYgogCMWcUYgYKzgUEBBFjc7/mhm
   v6pjjVE7hzq0s38J3ka9NDSsA3SX5DnQomYJCQt2mEn7PlpBaAE5KxigW
   w==;
X-CSE-ConnectionGUID: kjGcBHsxQrKTresR/H+7bg==
X-CSE-MsgGUID: dD23o7LnQdqzpJBnCw+UOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105848255"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105848255"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 04:09:44 -0700
X-CSE-ConnectionGUID: dv1YclB/QOyKNiECARlMDg==
X-CSE-MsgGUID: hK7Qj/lmR5GNpXD54KvRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="272082405"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2026 04:09:43 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzXzJ-000000000lx-2Ibb;
	Thu, 27 Aug 2026 11:09:41 +0000
Date: Thu, 27 Aug 2026 13:09:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 254/254]
 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct
 pci_dev' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202608271249.TkPRlEiu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1cb14b8ebd706a55e3cb0251941355687e595e1d
commit: ea3a4739b72d7d986abc880bf040ce542dece955 [254/254] anolis: tools: selftests: Sync vfio tests with upstream
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260827/202608271249.TkPRlEiu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271249.TkPRlEiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608271249.TkPRlEiu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:14:
>> tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration
      67 | int system_has_dca_enabled(struct pci_dev *pdev);
         |                                   ^~~~~~~


vim +67 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
