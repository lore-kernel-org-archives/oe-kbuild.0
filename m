Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58E285C8B
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 23:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197973; cv=none; b=lTc6S+tbQX3ez3i/mKMikW17fYBGNH5sVA7YHcBjNQFtFepCV+lJ687HPfZfIMFrn/tmD2Zdv9NGtbm9E0Wel7wyCyDmhoV9JEoW+c9Ku8TkApoMfzDfF2Zxx/XEljhr9vK4oTH96RzjSCaV8cN1z8+dXw5qwAi9NRWvUYAI5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197973; c=relaxed/simple;
	bh=7MVyhnUo3HmDXQUe64YDY9eDQ9j8MYX2aFWMSUiu74A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nfcRtP8iLThnaYA1vg4GcL1pxv50QiVEM3YrCReeivxuTYWblyPZmmtrORFKZldh+fmPLUd01XhiIpa0xlsI4HHh/F2dYhQ3nrWhtONSzr48TcHnbRx04tNEOPu8Te66uGb1R6ClWwRLVV8HCsSjaxic+aQb15rUb2yIA/px+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGKlmQOZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGKlmQOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778197972; x=1809733972;
  h=date:from:to:cc:subject:message-id;
  bh=7MVyhnUo3HmDXQUe64YDY9eDQ9j8MYX2aFWMSUiu74A=;
  b=LGKlmQOZ889Xj+xhP9L+ZabJH6OjEGYg6yPNW8DJnjFhz44iaiVPDi5A
   gu9m9Pjh/clKDTmPEpDvmzXYR4x7MNRp3qZEKDi3LQFeaKXe16ra+SIBr
   2HtYsa+aLMEqw0TeUO9WMwpcb/fxAbm+/IYVMOb5ggWv7PVRlLgF4FAow
   0NGJcpYo9/AzehCSiuZ7I98Nw1OESiXRZC6oLzpfT4TtZY9Vp+pG1TZym
   WwanNIYwxd6ccGvqOw7uKp3I3BFAOUQVwCmvnGRkDJEWNgXOPa2dTQAFy
   iINzP4+0bvDII6H26cxgENbk2Trvrz5sgZFmyawHA9X3+G0jydTpinzm0
   A==;
X-CSE-ConnectionGUID: ss+qP/7BTNyHay4jCqY8UA==
X-CSE-MsgGUID: VkBL0zd8SfWC6KzJpy7WdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82784519"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="82784519"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 16:52:51 -0700
X-CSE-ConnectionGUID: VxVtgAV1T+yIJ40AjkA7Og==
X-CSE-MsgGUID: gJTkdT3nSF21iFYcbtopCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="241618039"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2026 16:52:51 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL8WN-000000000Zz-36SW;
	Thu, 07 May 2026 23:52:47 +0000
Date: Fri, 08 May 2026 07:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7041/13385] Warning:
 arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202605080740.0iDqLAUR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 [7041/13385] docs: kdoc: fix logic to handle unissued warnings
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r131-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080740.0iDqLAUR-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080740.0iDqLAUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080740.0iDqLAUR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get a pointer to the per-core table of reset vector pointers

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
