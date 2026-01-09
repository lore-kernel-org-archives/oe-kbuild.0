Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD62874FB
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924901; cv=none; b=Ja4GuVgvmDwIo5/WoO9X7Y2emUqsI3Cj0MaR/UQs09BmyEGcAwe69WuOfm2y/+CRDhnLlqwkim6qXgIlHuSFwKZ+hDuGE9oai7X/ZJrSVXqeEbCL1/ZHzVVF4GrG4eY61N1lkGBQ9lmi3CvDWViKC7Zpi8iYXyxtY09DbJgcWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924901; c=relaxed/simple;
	bh=MJc9Uq3UyPg1D5VEB66TcZx2RuGnjXCZnl7hJAiWx6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=upmGChukiW5ZfbDPNGsIpNQpEEYHN6+58jTyNqkxsZdwJs5HNAKTErliITlsMSlnvInUqjB1myVmXhRLjJYMIWJr+7xKOKmdnr2e9BDTcyQ7e/TQ4vBhu8Ncg6mjgrVeWV0rWmsl1nXdMVetTjxQ6upPxjh0/8n6uFxfgpgAiR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5UYt8UJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5UYt8UJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767924899; x=1799460899;
  h=date:from:to:cc:subject:message-id;
  bh=MJc9Uq3UyPg1D5VEB66TcZx2RuGnjXCZnl7hJAiWx6o=;
  b=C5UYt8UJBjP12t5WjHzBy/8koUWP6uoF8cLzLz6NhQpsNFg+ul92KKAi
   l/ZUqb2pg2IHr067OjEwthDLZ7ylGDj0Z9MGQrLDXtejBDC670Hl8T83T
   iTIKik3EpuKtVCZzr+MQuyylP3NXQ8g4SpILfngVcKFVad7uEo96hQXSD
   TPehIsGjZQUOyXb9LcWk7zBcC2av7vmTPL8JQOaY/eqzZ1vDXDRA8VmJi
   pugOesVGA8wrNqVgXr/IE2GLYKtS5uOPj4G5rLQXjYAJ+qpZSb2eXEhPf
   3Q8kP7iXlgdLUN2PkprpCp6LPlURry0Hsfv3ahIH3AW9Yo10VrfMi/cX6
   g==;
X-CSE-ConnectionGUID: 73z/ujrfSyaO9u/cTBhhmQ==
X-CSE-MsgGUID: 7GcywahmROqjLvwlUoKHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73166501"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="73166501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:14:54 -0800
X-CSE-ConnectionGUID: xjj/bboPQoCE+NyiDjWyRA==
X-CSE-MsgGUID: +Y6DU7VqTVyBv5JVYU1/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203782274"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 18:14:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve21J-000000005K2-1xLc;
	Fri, 09 Jan 2026 02:14:33 +0000
Date: Fri, 09 Jan 2026 10:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [glemco:staging_rv_mon_kunit 27/29]
 kernel/trace/rv/rv_monitors_test.c:68:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601091035.dORFiNCq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/rv/rv_monitors_test.c:68:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   45a96d573274287926f2fd31092f229238476843
commit: 3811ed352911e0c0abd40896aab9196851b5128f [27/29] rv: Add KUnit tests for some DA/HA monitors
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r111-20260108 (https://download.01.org/0day-ci/archive/20260109/202601091035.dORFiNCq-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091035.dORFiNCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601091035.dORFiNCq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/rv/rv_monitors_test.c:68:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/rv_monitors_test.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/rv_monitors_test.c:69:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/rv_monitors_test.c:69:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   kernel/trace/rv/rv_monitors_test.c:70:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/rv_monitors_test.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   kernel/trace/rv/rv_monitors_test.c:70:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/rv_monitors_test.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +68 kernel/trace/rv/rv_monitors_test.c

3811ed352911e0 Gabriele Monaco 2025-02-10  67  
3811ed352911e0 Gabriele Monaco 2025-02-10 @68  MODULE_AUTHOR("Gabriele Monaco <gmonaco@redhat.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
