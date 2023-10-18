Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A3381A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2H8ti/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697666250; x=1729202250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xP8+lc/btodkeA1GcfwJOlqxSb1lCdESY7Z0g6eVgbM=;
  b=e2H8ti/ygXnkKtBNDRytVKw1vmNm/rANgy7BrZX4W+CF7jF+w0nqCNUC
   Z5LsuiZseYRgR4GNv8gmyJRCXxW6ssJjOCMJXZsYh4bIImY3Sala72W49
   aTErLqp8dSYn1xVjuculZk59SnypRAIeFNjrFAUUBB16/M/pe9qOe4xRr
   4gM5oP8LeXiz3Rrz7WCUWicwZxA3WQ+pGdsHJVhvsV0ii3dvGuCQYbOex
   jfk0MqExo13/spErPGty5P039H+p4RMWXeccRfnm1cMc7pJGtK7o0nyPF
   L+cGYrvCVX5ozzUMNmSZZZIU/cBJGVr8DGixWifncTfnByNulkqAATuLh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376492667"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="376492667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 14:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760386439"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="760386439"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Oct 2023 14:57:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtEXd-00017s-1q;
	Wed, 18 Oct 2023 21:57:25 +0000
Date: Thu, 19 Oct 2023 05:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
 flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202310190541.0impmnL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: cluster-devel@redhat.com
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git extents
head:   86474c69cac46872bd311318c02fb8e9e25abd10
commit: 86474c69cac46872bd311318c02fb8e9e25abd10 [14/14] gfs2: Add some initial extents-based inode code
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-101-20231018 (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310190541.0impmnL4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/gfs2/extents.c:123:23-27: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +123 fs/gfs2/extents.c

86474c69cac468 Andreas Gruenbacher 2021-03-25  115  
86474c69cac468 Andreas Gruenbacher 2021-03-25  116  /*
86474c69cac468 Andreas Gruenbacher 2021-03-25  117   * The path components in struct gfs2_extent_path are stored in "reverse"
86474c69cac468 Andreas Gruenbacher 2021-03-25  118   * order: the leaf is stored first, and when the tree grows at the root,
86474c69cac468 Andreas Gruenbacher 2021-03-25  119   * this happens at the end of the array.
86474c69cac468 Andreas Gruenbacher 2021-03-25  120   */
86474c69cac468 Andreas Gruenbacher 2021-03-25  121  struct gfs2_extent_path {
86474c69cac468 Andreas Gruenbacher 2021-03-25  122  	unsigned int p_height;
86474c69cac468 Andreas Gruenbacher 2021-03-25 @123  	struct gfs2_extent_pc p_pc[1];
86474c69cac468 Andreas Gruenbacher 2021-03-25  124  };
86474c69cac468 Andreas Gruenbacher 2021-03-25  125  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
