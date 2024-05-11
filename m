Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A114431
	for <oe-kbuild@lists.linux.dev>; Sat, 11 May 2024 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715445619; cv=none; b=mH/iyqMu0U4bnDkNoxqBNNGARuzB3oI8dME0FJAhG5bo5npOdRZwoY2RIcYjhakOBeVXLbdFOlw+MkqNiZFUcUFYji0+YYuKNCERvob7MLrpvrT2ASvz2Xb4mwLV4oUDVPkmgnqOR6fDgOcI6fyy6y8N4M6gJh9D7it8iZHaIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715445619; c=relaxed/simple;
	bh=lGCnA+mhLqLxq5q4o2O5gc1sdcu/j43Fei6VYZ+cJ1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWPxSxDkXDOiK+GuIvYQe/99SVd6EMcXWJstfccqDMbgYCFv0nCdsZlnrzDnHWjxyQQ3IZlwOriXh7klN1HgePGwuewJEnWwqGaHyOMHY5+EKbxp5Zy5AcQhg3BLM65SNdqUe6fx7PzXf2R+KzogP5SZtEs+I1POBg4D4tneycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+qFglcj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+qFglcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715445617; x=1746981617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGCnA+mhLqLxq5q4o2O5gc1sdcu/j43Fei6VYZ+cJ1s=;
  b=n+qFglcjbWV6h3QDbg3FfD14B74tuxxOVejsEePnlLIyljAU/MZ6JkKQ
   cqnxwTyUYhn/6kFZLJc2+PKXOfRdEBFYO2gvO4soBf0o4zxHmYlgafBIG
   tB/fKfug2/V5pmSC4DMyWnuMFLZFZmCUY9VOA31GtHFcL0TZYgwXvzjnk
   67Tq2VsmY3vlhIeyAp4qiman8xQVZMzvH/lTjK9cuE+AfYZLnQpkz72ky
   zTOz0sxdRuS58C3j5YZatTv4GoPaXDQe8T070Q8JpnJji19V5kwbGa7kF
   tuUEgF3rSIJMZNS+9fJLL+R099VJ43Xq0PJKii2GGo92x3znf53OEF/tE
   g==;
X-CSE-ConnectionGUID: IPUv7E0KRP6gIAJh1IgKmQ==
X-CSE-MsgGUID: 6KM1FAXxQoa8cw7CXk7r5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11367742"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="11367742"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 09:40:16 -0700
X-CSE-ConnectionGUID: GsoRd7WzRDSCdsjKewTNkQ==
X-CSE-MsgGUID: YsI6KSQ3RS6WZ9Ai00exsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="34697668"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2024 09:40:16 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5pld-0007dq-0V;
	Sat, 11 May 2024 16:40:13 +0000
Date: Sun, 12 May 2024 00:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 trace_define_generic_fields (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202405120050.l6gENQt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf87f46fd34d6c19283d9625a7822f20d90b64a4
commit: 94d6cb68124b7a63f24fcc345795ba5f9a27e694 modpost: pass struct module pointer to check_section_mismatch()
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-r025-20220501 (https://download.01.org/0day-ci/archive/20240512/202405120050.l6gENQt4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120050.l6gENQt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405120050.l6gENQt4-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_define_generic_fields (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
