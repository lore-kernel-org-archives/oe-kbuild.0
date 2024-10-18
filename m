Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3F7485
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729291990; cv=none; b=o7CBRRnsuWYtoEqqYqA7ms2eBtrkwPtmBDx9yv68yKoyoQY1WdWK1dHsOucltN5yf37MwYmoGEmqNXTLtpgTuouGq0/E4a2gNEOyih8iM2YPVA9GT9taIrF1Yg2vXEVTQIF8t5jIOOuHA9FqE4qQFyikCW62YWe2cfydw7dRkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729291990; c=relaxed/simple;
	bh=CxQ0LSz3s9w6hCQc2wHT8lA0I6WfFtCcmmnOx4mO/r8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3by8cdUJc6U2e+BgR+08VYqr8qCu5ryM7P+q8VoaLJjVaM4PEek7AUqLaMQkFNmB3zX1C7Pwi4v6PNNNn/FkB8Ac9K5KqmacMH4Wdbq8OPT5Di8eMVapGbvb7qG0c0n1EOc+vQuHuVUvnuq16ZzdBe5bCoYkWNTi6Zu0/2HYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZK2TqICB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK2TqICB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729291988; x=1760827988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxQ0LSz3s9w6hCQc2wHT8lA0I6WfFtCcmmnOx4mO/r8=;
  b=ZK2TqICBgoPGAsN/DzMlGYNdn5JDXWoICAFu4TgaNWoWtkPGvUkMNSFj
   FlUidG+eIZrd8lAhMDvvkRJ9swNBB0W6Lm4ZSeBVxY+Yygqaap6E7PU8/
   kMJnCO3jZtzKF0vVR7ykMEBYa6ncllxrmS3I/42W4BUf2TQeAaNqTBOB6
   iiOCAzRcqIJ8uP2UMcJNOXKw+avlkz5zTywwnS4hzW1zc8jdNJNeH35gA
   m8XZUYZVYXe1biRgUM9Mcnlh5gj0NfLYNUpgjQiacV+ciz4Jy9KCpPk2Y
   ndmx02KGDWaGi1jnMWigsQWAPIzGOnsz04jSAVr/vYgbM4x2guScIQ/27
   w==;
X-CSE-ConnectionGUID: RQzv6SzaQl+ze/VO4NmMsg==
X-CSE-MsgGUID: k5ARruPDRyOiFq7dSIirrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28717950"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28717950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 15:53:08 -0700
X-CSE-ConnectionGUID: MWTA/f+8TeWlBFDA6PwRxg==
X-CSE-MsgGUID: 6pzqaHb/QBCVzWw9Rm/g0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="82960931"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2024 15:53:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1vqC-000ONR-24;
	Fri, 18 Oct 2024 22:53:04 +0000
Date: Sat, 19 Oct 2024 06:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] PCI: optimize proc sequential file read
Message-ID: <202410190659.9MCI8EyL-lkp@intel.com>
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
In-Reply-To: <20241018054728.116519-1-kanie@linux.alibaba.com>
References: <20241018054728.116519-1-kanie@linux.alibaba.com>
TO: Guixin Liu <kanie@linux.alibaba.com>
TO: bhelgaas@google.com
CC: linux-pci@vger.kernel.org

Hi Guixin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guixin-Liu/PCI-optimize-proc-sequential-file-read/20241018-135026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241018054728.116519-1-kanie%40linux.alibaba.com
patch subject: [PATCH] PCI: optimize proc sequential file read
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190659.9MCI8EyL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190659.9MCI8EyL-lkp@intel.com/

smatch warnings:
drivers/pci/proc.c:365 pci_seq_tree_remove_dev() warn: variable dereferenced before check 'dev' (see line 361)

vim +/dev +365 drivers/pci/proc.c

4ca256d9a0e58a Guixin Liu 2024-10-18  358  
4ca256d9a0e58a Guixin Liu 2024-10-18  359  void pci_seq_tree_remove_dev(struct pci_dev *dev)
4ca256d9a0e58a Guixin Liu 2024-10-18  360  {
4ca256d9a0e58a Guixin Liu 2024-10-18 @361  	unsigned long idx = dev->proc_seq_idx;
4ca256d9a0e58a Guixin Liu 2024-10-18  362  	struct pci_dev *latest_dev = NULL;
4ca256d9a0e58a Guixin Liu 2024-10-18  363  	struct pci_dev *ret;
4ca256d9a0e58a Guixin Liu 2024-10-18  364  
4ca256d9a0e58a Guixin Liu 2024-10-18 @365  	if (!dev)
4ca256d9a0e58a Guixin Liu 2024-10-18  366  		return;
4ca256d9a0e58a Guixin Liu 2024-10-18  367  
4ca256d9a0e58a Guixin Liu 2024-10-18  368  	xa_lock(&pci_seq_tree);
4ca256d9a0e58a Guixin Liu 2024-10-18  369  	__xa_erase(&pci_seq_tree, idx);
4ca256d9a0e58a Guixin Liu 2024-10-18  370  	pci_dev_put(dev);
4ca256d9a0e58a Guixin Liu 2024-10-18  371  	/*
4ca256d9a0e58a Guixin Liu 2024-10-18  372  	 * Move the latest pci_dev to this idx to keep the continuity.
4ca256d9a0e58a Guixin Liu 2024-10-18  373  	 */
4ca256d9a0e58a Guixin Liu 2024-10-18  374  	if (idx != pci_max_idx - 1) {
4ca256d9a0e58a Guixin Liu 2024-10-18  375  		latest_dev = __xa_erase(&pci_seq_tree, pci_max_idx - 1);
4ca256d9a0e58a Guixin Liu 2024-10-18  376  		ret = __xa_cmpxchg(&pci_seq_tree, idx, NULL, latest_dev,
4ca256d9a0e58a Guixin Liu 2024-10-18  377  				GFP_KERNEL);
4ca256d9a0e58a Guixin Liu 2024-10-18  378  		if (!ret)
4ca256d9a0e58a Guixin Liu 2024-10-18  379  			latest_dev->proc_seq_idx = idx;
4ca256d9a0e58a Guixin Liu 2024-10-18  380  		WARN_ON(ret);
4ca256d9a0e58a Guixin Liu 2024-10-18  381  	}
4ca256d9a0e58a Guixin Liu 2024-10-18  382  	pci_max_idx--;
4ca256d9a0e58a Guixin Liu 2024-10-18  383  	xa_unlock(&pci_seq_tree);
4ca256d9a0e58a Guixin Liu 2024-10-18  384  }
4ca256d9a0e58a Guixin Liu 2024-10-18  385  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
