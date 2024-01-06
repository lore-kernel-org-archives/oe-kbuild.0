Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C66FBB
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jan 2024 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUGiMCPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704543177; x=1736079177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OBabkNLVf08LvdMoajt0deQ9wB+zJvOUFwKOY0nx28=;
  b=BUGiMCPY8vwGlc7VzUtOLSRRQN2sYANqN51TelfvpMWba3Im2J9u/BtA
   m3Qbr7esNPj8kufEPORAF63vVcCw8AXVCf5d6zoV1kRW7OAPfvQqyUXkL
   hkpFPQc55i6sUYmbvKacyQsjuMOZaBaazFJIbPoNHidGgQ3b7+mvgIHAh
   lcSCWO5IXKa4vlQAVpSYHCyNe1mwaBD2KoCnhApo6XQTNKAnusebhFQ8K
   POu7Arnn9h/CARj7Nh+lWYuFdPhzxyqtT5E3/pDvMtygypH9s/imPUBZu
   p5jGCRL67sozNNbU8PywmL5LEsdFJldNA/UFUdTH+LOV6+xUjxw8GbBpJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="400409942"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="400409942"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 04:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815186694"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="815186694"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Jan 2024 04:12:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM5XZ-0002Si-1Z;
	Sat, 06 Jan 2024 12:12:37 +0000
Date: Sat, 6 Jan 2024 20:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] net/tcp: Only produce AO/MD5 logs if there are any keys
Message-ID: <202401061952.k6UqFm0j-lkp@intel.com>
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
In-Reply-To: <20240104-tcp_hash_fail-logs-v1-1-ff3e1f6f9e72@arista.com>
References: <20240104-tcp_hash_fail-logs-v1-1-ff3e1f6f9e72@arista.com>
TO: Dmitry Safonov <dima@arista.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac865f00af293d081356bec56eea90815094a60e]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-tcp-Only-produce-AO-MD5-logs-if-there-are-any-keys/20240104-214510
base:   ac865f00af293d081356bec56eea90815094a60e
patch link:    https://lore.kernel.org/r/20240104-tcp_hash_fail-logs-v1-1-ff3e1f6f9e72%40arista.com
patch subject: [PATCH] net/tcp: Only produce AO/MD5 logs if there are any keys
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401061952.k6UqFm0j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/net/tcp_ao.h: linux/jump_label.h is included more than once.

vim +131 include/net/tcp_ao.h

   129	
   130	#ifdef CONFIG_TCP_MD5SIG
 > 131	#include <linux/jump_label.h>
   132	extern struct static_key_false_deferred tcp_md5_needed;
   133	#define static_branch_tcp_md5()	static_branch_unlikely(&tcp_md5_needed.key)
   134	#else
   135	#define static_branch_tcp_md5()	false
   136	#endif
   137	#ifdef CONFIG_TCP_AO
   138	/* TCP-AO structures and functions */
 > 139	#include <linux/jump_label.h>
   140	extern struct static_key_false_deferred tcp_ao_needed;
   141	#define static_branch_tcp_ao()	static_branch_unlikely(&tcp_ao_needed.key)
   142	#else
   143	#define static_branch_tcp_ao()	false
   144	#endif
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
