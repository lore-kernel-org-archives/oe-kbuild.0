Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB33481CC
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 20:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHmrO745"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702846789; x=1734382789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rp52pU5HpybFK7AJLV+vINR4n3ozTryyb5M2+SyPGv4=;
  b=LHmrO745Er3P0AEvczxia0Vn5+YQahX76IQYcxV3ID5IwFRRJhOm/gS9
   4ieSLZhVbpVBFlxgg4uBKLC3oRzE8zgrqC8KsEvTN8K0DdK+WhA304xGh
   j7o8oOVh5TVoBkh3KuLz/sHcyFPXhZoLo7m8tk6O2AdW7P7F7gq7Jr2nX
   UwF5DUyiCTCHayGqESLAbVe+r7Es52Mi0Dw1EG1dVpZOVRHKzXtV8kdDf
   UmU7iNOXnCoxqV/MVeM4fZw8uUTNt5dT10aam2jB9wEXOOhbsjBl8nU8P
   6G4596OozxOztdACR64rMWLWoo8HoJW1KyJLigfRv4KZsGGcTl++ytDF+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8872580"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="8872580"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 12:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="778872558"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="778872558"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Dec 2023 12:59:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEyEi-0003Po-2D;
	Sun, 17 Dec 2023 20:59:44 +0000
Date: Mon, 18 Dec 2023 04:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/qcom/smem.c:289: warning: Excess struct member 'regions'
 description in 'qcom_smem'
Message-ID: <202312180450.xUbRrCF5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e389834672c723435a44818ed2cabc4dad24429
commit: 433ce46a97116f431ee114b4607143860aad4054 soc: qcom: smem: Annotate struct qcom_smem with __counted_by
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231218/202312180450.xUbRrCF5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180450.xUbRrCF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312180450.xUbRrCF5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/smem.c:289: warning: Excess struct member 'regions' description in 'qcom_smem'


vim +289 drivers/soc/qcom/smem.c

4b638df4c9d556 Bjorn Andersson    2015-06-26  263  
4b638df4c9d556 Bjorn Andersson    2015-06-26  264  /**
4b638df4c9d556 Bjorn Andersson    2015-06-26  265   * struct qcom_smem - device data for the smem device
4b638df4c9d556 Bjorn Andersson    2015-06-26  266   * @dev:	device pointer
4b638df4c9d556 Bjorn Andersson    2015-06-26  267   * @hwlock:	reference to a hwspinlock
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  268   * @ptable: virtual base of partition table
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  269   * @global_partition: describes for global partition when in use
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  270   * @partitions: list of partitions of current processor/host
5b3940676107dd Chris Lew          2017-10-11  271   * @item_count: max accepted item number
fc3699c69857ab Lee Jones          2020-11-03  272   * @socinfo:	platform device pointer
4b638df4c9d556 Bjorn Andersson    2015-06-26  273   * @num_regions: number of @regions
4b638df4c9d556 Bjorn Andersson    2015-06-26  274   * @regions:	list of the memory regions defining the shared memory
4b638df4c9d556 Bjorn Andersson    2015-06-26  275   */
4b638df4c9d556 Bjorn Andersson    2015-06-26  276  struct qcom_smem {
4b638df4c9d556 Bjorn Andersson    2015-06-26  277  	struct device *dev;
4b638df4c9d556 Bjorn Andersson    2015-06-26  278  
4b638df4c9d556 Bjorn Andersson    2015-06-26  279  	struct hwspinlock *hwlock;
4b638df4c9d556 Bjorn Andersson    2015-06-26  280  
5b3940676107dd Chris Lew          2017-10-11  281  	u32 item_count;
efb448d0a3fca0 Imran Khan         2019-07-24  282  	struct platform_device *socinfo;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  283  	struct smem_ptable *ptable;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  284  	struct smem_partition global_partition;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  285  	struct smem_partition partitions[SMEM_HOST_COUNT];
4b638df4c9d556 Bjorn Andersson    2015-06-26  286  
4b638df4c9d556 Bjorn Andersson    2015-06-26  287  	unsigned num_regions;
433ce46a97116f Kees Cook          2023-09-22  288  	struct smem_region regions[] __counted_by(num_regions);
4b638df4c9d556 Bjorn Andersson    2015-06-26 @289  };
4b638df4c9d556 Bjorn Andersson    2015-06-26  290  

:::::: The code at line 289 was first introduced by commit
:::::: 4b638df4c9d556a6d947d6dbac364bee37b68b8e soc: qcom: Add Shared Memory Manager driver

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Andy Gross <agross@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
