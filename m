Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1AA14F9FB
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756629837; cv=none; b=B/cwWzxVZhNqPSwR8TkWntDmE9A+jd0vSSep5ZfOvuditRZRakO+ZzlSbDoZypzVXf8WAP43RkumrUi3g9UWqmdWriCv2isncgBAsXW3V8H5N+vWScqXvE6Ev2Ziea3+NDRyhXI/bU+LR/rhp8+7j9QxXpzyzACvLf3Io0XH6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756629837; c=relaxed/simple;
	bh=DYB71PnKJfzRRyjXUc0tWbW/4Uo8UQkHVOpUg+kcLjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIdr7l+Y7I5RZOWQbMAt5AgGnWM953fU2JDiKAyl37A+wv7ZcN/Au+XJzc6SFhlEBux+AdRe/K8MGfDkHtE7syYDP5vkcMGqEvw4UvjQoooZtLbP7VI6T+QXFtCs3eCNshSId/uX/7+MuEO1cWjQ8LjB7uWpfs1F8zgno2zCF7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDC30CWR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDC30CWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756629835; x=1788165835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYB71PnKJfzRRyjXUc0tWbW/4Uo8UQkHVOpUg+kcLjY=;
  b=SDC30CWReyoEs8X9ddjgX6RaidiIz4In6nLOK+fE9szMUJStIqLnOUSB
   vxi+X7SaS7ZnIOz+dzCACnJndWJIXF9MeRenav9GERqS2pepoxVxRqiP0
   kaePlKdlbJDmYkOUdFYQT/RzY/Oz5ud8zFsLKJRYNCGpiGZkiQKT2Ig6w
   O7nRCrQdd582RLEZOYAH1ipI3pT85u+FBsCbwIU29UgENEnWPkwVB2aqu
   KwbBA458yH6WeAItd4oAD51Awdqkzo0EMSDvw3vcdMNxTZNYGWDadLnll
   e68JbipZTqbu9SekwjNQWD+4h8/MCfT1BZcfEO750w67PKZBk/R40kz/s
   g==;
X-CSE-ConnectionGUID: 82Whdum0RfO+KLjUnhR7zQ==
X-CSE-MsgGUID: CXN9DlyxQBKV2lh6Q0zX1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62689806"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62689806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 01:43:54 -0700
X-CSE-ConnectionGUID: 5C7LZ8GsR4uHrv8GRltKEA==
X-CSE-MsgGUID: 3Euebd0sQjKkzkPBjr7xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175072022"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2025 01:43:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usdfD-000W2p-0p;
	Sun, 31 Aug 2025 08:43:51 +0000
Date: Sun, 31 Aug 2025 16:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 2790/2790] kernel/jump_label.o: warning: objtool:
 jump_label_init_ro+0x170: unreachable instruction
Message-ID: <202508311641.liT1jDqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Cai Xinchen <caixinchen1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec3f62599de17b9a87d003e846255a24ed8fd1b4
commit: beed2bf3377be4a3e62f5c2dc2692024952055cc [2790/2790] jump_label,module: Don't alloc static_key_mod for __ro_after_init keys
:::::: branch date: 23 hours ago
:::::: commit date: 10 weeks ago
config: loongarch-randconfig-001-20250829 (https://download.01.org/0day-ci/archive/20250831/202508311641.liT1jDqP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508311641.liT1jDqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508311641.liT1jDqP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/jump_label.o: warning: objtool: jump_label_init_ro+0x170: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
