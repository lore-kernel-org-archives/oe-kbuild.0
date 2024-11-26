Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4C1DDC01
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 18:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732646923; cv=none; b=j2kSue6JYXfK11vi9/pKHi3+yDHXMMoR/fq+6IIDf5ffo4QKSni9FjY6P7BtZffzwE4TOm/inwciCk2L6EnNCjyrPBLGQRyNaLBa/N9tnHmMA780iukLSb6cL9ZcVA3/RkcgGHI69hgFxbvf5ezfT3it+uA3iDzalkYBDy/10hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732646923; c=relaxed/simple;
	bh=BKLgnm2SlFr2SaOFrLwnffNiiwzqp/A0kvUdtMCitzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsnTi28baREmLxFNhJ2E3jsuerNsTUKqbnY3OOaGs06ReIWp05v928Q3f7BDd5T+tWFrfUjzX7KO3BUQ58fNF1EqW8UGVOkf5MmUyRR1Wvd90LHyhzU2ZJy8KzgyF5g4IG8OuFZ/edQyZaF87bdflBoeD6J9aXtAwRUvzXEuroM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVKUR9i3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVKUR9i3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732646922; x=1764182922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BKLgnm2SlFr2SaOFrLwnffNiiwzqp/A0kvUdtMCitzo=;
  b=fVKUR9i3ckLbrFmVlPXpuX7VelIcRuXkv22PelNX2Lo9vmzeJMU23K3q
   +BDDPat7dPMoZ6a8qGs4F15pXT3SRkOwAKnh3LUSJiYWtJ4HFHUsxrYRB
   05TFueHO0OvLPBqQ+BUEDnkso3oOqvxinVp+Z8tuQoZXkYM/CxMTyoNiU
   Pr7AOmKpRgJyj+rqkAgIUZ8sbaUIlYEKkxvfSs/kyl05bkgOrkE9H3/he
   c7dpRlV7ErFDKopWP5jOQJvOl9CeJCoP2vsG6qUsBNwkRkRIMIFwdwSp3
   TN6NhJ0YmkI3KgCzPW0vTWilD3Zyje2lud6J72cYgA7mCBFz6qocsjH8O
   A==;
X-CSE-ConnectionGUID: JrUa6EirTS+ZXJPKmH1/Sg==
X-CSE-MsgGUID: 0QjMXy/vRS+ZDnUX5WV3zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32983783"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32983783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:48:39 -0800
X-CSE-ConnectionGUID: I7FDP78yQKSraNWv/qXgdQ==
X-CSE-MsgGUID: O6LWfFsVRcqN4Rtix8oT2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="114976245"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 10:48:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG0bz-0007U5-2Z;
	Tue, 26 Nov 2024 18:48:35 +0000
Date: Wed, 27 Nov 2024 02:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [plbossart-sound:sdw/fix-bool-properties 16/19]
 sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error:
 uninitialized symbol 'string'.
Message-ID: <202411270232.zEnUph1v-lkp@intel.com>
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
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/plbossart/sound sdw/fix-bool-properties
head:   cc66cbd8eb2728b3b654f29c0a44009826c7a108
commit: 98ab12fb50b6f367cd21ac2c59898574a0a6297c [16/19] ASoC: SOF: debug-dsp-ops: Add a debugfs entry to read current FW status
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r073-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270232.zEnUph1v-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411270232.zEnUph1v-lkp@intel.com/

smatch warnings:
sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error: uninitialized symbol 'string'.

vim +/string +174 sound/soc/sof/debug-dsp-ops.c

98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  141  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  142  static ssize_t sof_dsp_ops_tester_dfs_read(struct file *file, char __user *buffer,
0858d83e4c4122 Ranjani Sridharan 2024-03-21  143  					   size_t count, loff_t *ppos)
0858d83e4c4122 Ranjani Sridharan 2024-03-21  144  {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  145  	struct snd_sof_dfsentry *dfse = file->private_data;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  146  	struct snd_sof_dev *sdev = dfse->sdev;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  147  	struct dentry *dentry;
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  148  	const char *string;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  149  	size_t size_ret;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  150  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  151  	/* return the FW filename or path */
0858d83e4c4122 Ranjani Sridharan 2024-03-21  152  	dentry = file->f_path.dentry;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  153  	if (!strcmp(dentry->d_name.name, "fw_filename")) {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  154  		string = sdev->test_profile.fw_name;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  155  	} else if (!strcmp(dentry->d_name.name, "fw_path")) {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  156  		string = sdev->test_profile.fw_path;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  157  	} else if (!strcmp(dentry->d_name.name, "dsp_power_state")) {
b5d1176eefb868 Ranjani Sridharan 2024-03-25  158  		switch (sdev->dsp_power_state.state) {
b5d1176eefb868 Ranjani Sridharan 2024-03-25  159  		case SOF_DSP_PM_D0:
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  160  			string = "D0\n";
b5d1176eefb868 Ranjani Sridharan 2024-03-25  161  			break;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  162  		case SOF_DSP_PM_D3:
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  163  			string = "D3\n";
b5d1176eefb868 Ranjani Sridharan 2024-03-25  164  			break;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  165  		default:
b5d1176eefb868 Ranjani Sridharan 2024-03-25  166  			break;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  167  		}
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  168  	} else if (!strcmp(dentry->d_name.name, "fw_state")) {
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  169  		return sof_dsp_ops_fw_state_read(sdev, buffer, count, ppos);
b5d1176eefb868 Ranjani Sridharan 2024-03-25  170  	} else {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  171  		return 0;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  172  	}
0858d83e4c4122 Ranjani Sridharan 2024-03-21  173  
0858d83e4c4122 Ranjani Sridharan 2024-03-21 @174  	if (*ppos || !string)
0858d83e4c4122 Ranjani Sridharan 2024-03-21  175  		return 0;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  176  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  177  	count = min_t(size_t, count, strlen(string));
0858d83e4c4122 Ranjani Sridharan 2024-03-21  178  	size_ret = copy_to_user(buffer, string, count);
0858d83e4c4122 Ranjani Sridharan 2024-03-21  179  	if (size_ret)
0858d83e4c4122 Ranjani Sridharan 2024-03-21  180  		return -EFAULT;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  181  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  182  	*ppos += count;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  183  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  184  	return count;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  185  }
0858d83e4c4122 Ranjani Sridharan 2024-03-21  186  

:::::: The code at line 174 was first introduced by commit
:::::: 0858d83e4c4122a7b23357b4f3194b798093b7c4 ASoC: SOF: debug: Add debugfs entries for testing DSP ops

:::::: TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
