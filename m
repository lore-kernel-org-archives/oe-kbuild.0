Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC41885AA
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 21:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734815029; cv=none; b=iVXYoRS6fxPQfJjZyea/jnEEztrqSphOo+KnQedwAYyRwqhliPAktii93pVKoZjjL2okaxsIxBP8p3XszQ2qk8mFtYcpeUC+7ftbWscgChvHPdJ7nwSLmheg/rxM1Lr1/TBoOsSR605sgxgCCw/fvC1Yj63mZwv6y9p4bcLiXuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734815029; c=relaxed/simple;
	bh=+kMh8+5nErbH76IJGr02/NeIxjBl9qVLHixZIpJZUPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ptgpe5f7G3p0JjzmXT/8iiscbkkKqsJe/6Qrwq6DJNr87qbtXTSEn6gbjf9u3ciK1dyvuRVvckFCno1CY9K9zHWQEFVKYvp6toivcdyS3n0BVSQcWds4De1UD5UH0hW1hEvof9B51B5t8fs/ZNIGtlTpdzpeXRKueMDLS2lBPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8vBKDcv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8vBKDcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734815027; x=1766351027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kMh8+5nErbH76IJGr02/NeIxjBl9qVLHixZIpJZUPQ=;
  b=F8vBKDcvj9FXC8JEP7oGxVzEBwiyOy7fZpCCmQv8a0iLS3UKFDe9io8l
   Qc5kjD8HSBXtfC976DViS3v9pDcO+W+OrRQGKxb7g5uK9dsi7j6wOfWZK
   wjriN2A+H3k/tZBVbVXLahvoCUTNt7RtP4kKAMkDYSXI31jkPMVeOKIrk
   t0oVkvtqGc2dx9BZXcGsa50G3JhmOHVLehXRGqTxkbfCRceQ7GmEwds38
   1gFh78e0vn5O2SgEuAFEmR0qYzqyq/cnYoxPpPqptd8KsEroGReaowws2
   3UbHBh/GYtPuuVjSRUPVm90QCS0NF1uEzymVtWsisMuuTdnZlbzzp4CvB
   g==;
X-CSE-ConnectionGUID: jAy02DqhThef5/22Y48x0Q==
X-CSE-MsgGUID: 5qtO2S6bS8+GyrYVxU5mSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35043925"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35043925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 13:03:46 -0800
X-CSE-ConnectionGUID: MXFzwevcSqGgBcpYtY+bHg==
X-CSE-MsgGUID: w++2ofHUSvKr0XZ3xutOlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102941316"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 13:03:45 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP6dS-0002UR-2f;
	Sat, 21 Dec 2024 21:03:42 +0000
Date: Sun, 22 Dec 2024 05:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thesofproject:topic/sof-dev-rebase 62/66]
 sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error:
 uninitialized symbol 'string'.
Message-ID: <202412220432.yREZa6ba-lkp@intel.com>
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
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Liam Girdwood <liam.r.girdwood@intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   f8cb4262a32283bd5f380f28e178002d9ab552c5
commit: 4ee3702773b8965d591600ebba308288dfd498a3 [62/66] ASoC: SOF: debug-dsp-ops: Add a debugfs entry to read current FW status
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220432.yREZa6ba-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220432.yREZa6ba-lkp@intel.com/

smatch warnings:
sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error: uninitialized symbol 'string'.

vim +/string +174 sound/soc/sof/debug-dsp-ops.c

4ee3702773b896 Ranjani Sridharan 2024-03-25  141  
554de1577ecc78 Ranjani Sridharan 2024-03-21  142  static ssize_t sof_dsp_ops_tester_dfs_read(struct file *file, char __user *buffer,
554de1577ecc78 Ranjani Sridharan 2024-03-21  143  					   size_t count, loff_t *ppos)
554de1577ecc78 Ranjani Sridharan 2024-03-21  144  {
554de1577ecc78 Ranjani Sridharan 2024-03-21  145  	struct snd_sof_dfsentry *dfse = file->private_data;
554de1577ecc78 Ranjani Sridharan 2024-03-21  146  	struct snd_sof_dev *sdev = dfse->sdev;
554de1577ecc78 Ranjani Sridharan 2024-03-21  147  	struct dentry *dentry;
4ee3702773b896 Ranjani Sridharan 2024-03-25  148  	const char *string;
554de1577ecc78 Ranjani Sridharan 2024-03-21  149  	size_t size_ret;
554de1577ecc78 Ranjani Sridharan 2024-03-21  150  
554de1577ecc78 Ranjani Sridharan 2024-03-21  151  	/* return the FW filename or path */
554de1577ecc78 Ranjani Sridharan 2024-03-21  152  	dentry = file->f_path.dentry;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  153  	if (!strcmp(dentry->d_name.name, "fw_filename")) {
554de1577ecc78 Ranjani Sridharan 2024-03-21  154  		string = sdev->test_profile.fw_name;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  155  	} else if (!strcmp(dentry->d_name.name, "fw_path")) {
554de1577ecc78 Ranjani Sridharan 2024-03-21  156  		string = sdev->test_profile.fw_path;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  157  	} else if (!strcmp(dentry->d_name.name, "dsp_power_state")) {
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  158  		switch (sdev->dsp_power_state.state) {
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  159  		case SOF_DSP_PM_D0:
4ee3702773b896 Ranjani Sridharan 2024-03-25  160  			string = "D0\n";
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  161  			break;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  162  		case SOF_DSP_PM_D3:
4ee3702773b896 Ranjani Sridharan 2024-03-25  163  			string = "D3\n";
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  164  			break;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  165  		default:
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  166  			break;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  167  		}
4ee3702773b896 Ranjani Sridharan 2024-03-25  168  	} else if (!strcmp(dentry->d_name.name, "fw_state")) {
4ee3702773b896 Ranjani Sridharan 2024-03-25  169  		return sof_dsp_ops_fw_state_read(sdev, buffer, count, ppos);
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  170  	} else {
554de1577ecc78 Ranjani Sridharan 2024-03-21  171  		return 0;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  172  	}
554de1577ecc78 Ranjani Sridharan 2024-03-21  173  
554de1577ecc78 Ranjani Sridharan 2024-03-21 @174  	if (*ppos || !string)
554de1577ecc78 Ranjani Sridharan 2024-03-21  175  		return 0;
554de1577ecc78 Ranjani Sridharan 2024-03-21  176  
554de1577ecc78 Ranjani Sridharan 2024-03-21  177  	count = min_t(size_t, count, strlen(string));
554de1577ecc78 Ranjani Sridharan 2024-03-21  178  	size_ret = copy_to_user(buffer, string, count);
554de1577ecc78 Ranjani Sridharan 2024-03-21  179  	if (size_ret)
554de1577ecc78 Ranjani Sridharan 2024-03-21  180  		return -EFAULT;
554de1577ecc78 Ranjani Sridharan 2024-03-21  181  
554de1577ecc78 Ranjani Sridharan 2024-03-21  182  	*ppos += count;
554de1577ecc78 Ranjani Sridharan 2024-03-21  183  
554de1577ecc78 Ranjani Sridharan 2024-03-21  184  	return count;
554de1577ecc78 Ranjani Sridharan 2024-03-21  185  }
554de1577ecc78 Ranjani Sridharan 2024-03-21  186  

:::::: The code at line 174 was first introduced by commit
:::::: 554de1577ecc78012fba9e0c68e6a5786a3482d2 ASoC: SOF: debug: Add debugfs entries for testing DSP ops

:::::: TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
:::::: CC: Bard Liao <yung-chuan.liao@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
