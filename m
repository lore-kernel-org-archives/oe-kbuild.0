Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF453FB08
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Sep 2023 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695916700; x=1727452700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwBsZXFUNfbc0XmSlt+PgVwyANLrDqXykdsSxA9MN/o=;
  b=NhHtDqRl27jnNKli4XUpSC9pZV10f8Dxz3qiYgimtvKqC0RTWZ4XiHdD
   6/XeBVT5PR8+0wGtcAVTeYi2ILBddh9AdoY/R2ocxREjUgxMO0i5iUVmO
   5Wn6woUoUNr2jaxZ320RfWQqjanMXpKvaKTU8jpgThMcBvhCvZg4RWXl7
   jOTLuYx8p958AnsWMFwALV9zaUSdkOl2hGO/67+8xTZdjgSHpNF+0fyeQ
   3xRNTbvZnYlwWFgKUQImTBwpo4yoYFSgoiYX8t5blrTOjQsgK/wVRV7My
   EKMf1WU1ZIagEKQgU5WHGuR17rzjLg1DIpoA908SMzDlx5GK1f4NUEg/F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="380978318"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="380978318"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 08:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749642850"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="749642850"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2023 08:58:13 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qltP0-0001dR-27;
	Thu, 28 Sep 2023 15:58:10 +0000
Date: Thu, 28 Sep 2023 23:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8118/8345] mm/userfaultfd.c:857:13-14: WARNING
 opportunity for swap()
Message-ID: <202309282346.31nVaQl1-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrea Arcangeli <aarcange@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   719136e5c24768ebdf80b9daa53facebbdd377c3
commit: b855aaa369f6d7115995aa486413ab7634f84d3f [8118/8345] userfaultfd: UFFDIO_REMAP uABI
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20230927 (https://download.01.org/0day-ci/archive/20230928/202309282346.31nVaQl1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309282346.31nVaQl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309282346.31nVaQl1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/userfaultfd.c:857:13-14: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
