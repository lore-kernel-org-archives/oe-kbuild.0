Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21559656
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3qN7cuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699237701; x=1730773701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RcgWHiXxwU45fH7bksuIbckpLFBkDbE4eJ6bGvtZzxQ=;
  b=O3qN7cuO86pq4Mg53zAoXmfhppwh9NzEF5fdpAYiAuDXvUjen48WgdbO
   ym9HugsGvmnGM++qsCVu/CmQZVij7dbDX1SsGoJfI8M056UYFWP1+NOZm
   wvQ1KW9SqsVPCjT4fZQNPmkScKaM+1aM89VHi0dXCyEpSNBrvP5dqe0VK
   xxVtvHWhHLW7ku2PH8j7gUf3CE3g/2NZPBmdA8FIq7rulh6mE6fDOfHid
   loNuGfX1znY38kel7n9NeW9xuhoDyd9Z6Bnue2y6QnB8IeXrI11ZSNSt2
   +nVWJK4bFBsTKbSoP9hGclwzmzjA4p/iG+HYYkbkY2sfeiQ4rTTrgD90E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="7828274"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="7828274"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 18:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905913976"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="905913976"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 18:27:53 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzpLD-00061E-0X;
	Mon, 06 Nov 2023 02:27:51 +0000
Date: Mon, 6 Nov 2023 10:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/misc/vmw_balloon.c:200: warning: Function parameter or
 member '5' not described in 'vmballoon_batch_entry'
Message-ID: <202311061016.YX1N3JbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nadav Amit <namit@vmware.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Xavier Deguillard <xdeguillard@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 6c94875799eaf99bfdbb0efce21d75e1c56e96d5 vmw_balloon: simplifying batch access
date:   5 years ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-103-20230827 (https://download.01.org/0day-ci/archive/20231106/202311061016.YX1N3JbG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061016.YX1N3JbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311061016.YX1N3JbG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/vmw_balloon.c:28:
   include/linux/vmw_vmci_defs.h:159:33: warning: 'VMCI_ANON_SRC_HANDLE' defined but not used [-Wunused-const-variable=]
     159 | static const struct vmci_handle VMCI_ANON_SRC_HANDLE = {
         |                                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/misc/vmw_balloon.c:200: warning: Function parameter or member '5' not described in 'vmballoon_batch_entry'
   drivers/misc/vmw_balloon.o: warning: objtool: vmballoon_deflate()+0x1ca: sibling call from callable instruction with modified stack frame
   drivers/misc/vmw_balloon.o: warning: objtool: vmballoon_debug_show()+0x73: sibling call from callable instruction with modified stack frame
   drivers/misc/vmw_balloon.o: warning: objtool: vmballoon_inflate()+0xa1: sibling call from callable instruction with modified stack frame
   drivers/misc/vmw_balloon.o: warning: objtool: vmballoon_work()+0x84: sibling call from callable instruction with modified stack frame


vim +200 drivers/misc/vmw_balloon.c

365bd7ef7ec8eb Philip P. Moltmann 2015-08-06  188  
6c94875799eaf9 Nadav Amit         2018-09-20  189  /**
6c94875799eaf9 Nadav Amit         2018-09-20  190   * struct vmballoon_batch_entry - a batch entry for lock or unlock.
6c94875799eaf9 Nadav Amit         2018-09-20  191   *
6c94875799eaf9 Nadav Amit         2018-09-20  192   * @status: the status of the operation, which is written by the hypervisor.
6c94875799eaf9 Nadav Amit         2018-09-20  193   * @reserved: reserved for future use. Must be set to zero.
6c94875799eaf9 Nadav Amit         2018-09-20  194   * @pfn: the physical frame number of the page to be locked or unlocked.
6c94875799eaf9 Nadav Amit         2018-09-20  195   */
6c94875799eaf9 Nadav Amit         2018-09-20  196  struct vmballoon_batch_entry {
6c94875799eaf9 Nadav Amit         2018-09-20  197  	u64 status : 5;
6c94875799eaf9 Nadav Amit         2018-09-20  198  	u64 reserved : PAGE_SHIFT - 5;
6c94875799eaf9 Nadav Amit         2018-09-20  199  	u64 pfn : 52;
6c94875799eaf9 Nadav Amit         2018-09-20 @200  } __packed;
6c94875799eaf9 Nadav Amit         2018-09-20  201  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
