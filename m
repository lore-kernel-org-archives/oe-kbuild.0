Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79D13A865
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400708; cv=none; b=I7LmaUrWn5eg7PHRodGQzyjIe/bk12txgbmEFXhciudqJtJNMOWaq9+9ZdHw4Zozx8PtJwh5flKK3iAJlNVsoYwADq1ztCq62/m6eJgcCq8swckZj7p1jhwfycOoGMpY/8tz6iBHSgJg41/9nn2Mm409966aaRRd1NIwMNfRKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400708; c=relaxed/simple;
	bh=JM7f6me5HF4sy0F8tYOvQys8GPVj7eV6tgfTnAr0uvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sg6/knV+UZjDCHsmS2abkkQhljglRf1eIrVlaYe+HRs+uu9MWiEuc2EqTxxeEXGWtYJSuXdw//vARGnQH80rW8mjv21R+I5yKkcHNgrHMw8n6bV7W1d22ydeVo5Xejpwu/c0aOCMULq5ubfgyjL6Ys42/9P2SKDcRMHwpHAZuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjqjuKZS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjqjuKZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730400706; x=1761936706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JM7f6me5HF4sy0F8tYOvQys8GPVj7eV6tgfTnAr0uvk=;
  b=WjqjuKZS8rYzHGBriWSfbg9aD06uHcKT6mcIEg4ECjYoYbqXOKOt31Mv
   JqiLwEEyquiiA/olSoEBJiCEeN+oz+rqmpoe5AeG43MyBdC0L9Vgvxt7V
   HuJUJCerB/Gbw5anJIkWHMIdiuZzn6LI0qCrwfMpFiJS3pXbQyfci9Azh
   zr+dBpSzMnk9uGI2Q1Tjlt6HVDOkO+myt4op/GDStB6RF31mk5x1WOd6S
   d8mqbJenpnV/cK6uwQsqgqDfsbGteKdTTfotexiWvOIDX07TjEeylSpo5
   jupdZJy1SLApsC/h2tVQ+Vui1ewXEo6C4FcI0ncZXiNQf0rDvDlnowGkF
   g==;
X-CSE-ConnectionGUID: uvOAm8uASKaZcq14LCuUyw==
X-CSE-MsgGUID: bJopGhcrSAmWnk8WbI15aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29578669"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="29578669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:51:43 -0700
X-CSE-ConnectionGUID: bJ+edFIDSlSflR8CbD8Adw==
X-CSE-MsgGUID: DOtqoLQYQhWS3aXjKPKx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87263911"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 11:51:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6aGi-000gcn-1V;
	Thu, 31 Oct 2024 18:51:40 +0000
Date: Fri, 1 Nov 2024 02:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [plbossart-sound:sdw/fix-bool-properties 16/19]
 sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error:
 uninitialized symbol 'string'.
Message-ID: <202411010223.AFWqocab-lkp@intel.com>
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
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: s390-randconfig-r073-20241031 (https://download.01.org/0day-ci/archive/20241101/202411010223.AFWqocab-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411010223.AFWqocab-lkp@intel.com/

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
