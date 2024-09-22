Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41611BE68
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727018281; cv=none; b=NE6QAay9UMbW+wPjy6lsQpioobhJpSedFJvSv/7JgmOz0y6VpKYcgBpozxcenV63aS50s4zrqXikJVrrz0b2t5nqWYEuBzLA5e8m0w+dvJ6cMEYkby34mv6kq8w9BVEiQtP2PlEd10t90j2zoGUi50VLz4qV92BNRtXHylKEnbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727018281; c=relaxed/simple;
	bh=iJLqZsXbea2BygjnJxoa+COcS/NLfQRjE1o9oK+MiVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pb6jg6FE7BWTRUr20FcWRj6OCR7bVlPgGhdVTzbxLIKLwKH5ni7Yfrp5f3Q87iEy1WxDdeIR48BQt5Ija7T8pebf5J2j5J4/nFpZsRFL9bOk+YrFYMYy+T2LFkquwE+wRpousXObDiY2SpLMF7QrnOzJEA2PDRCcAVSTbwtfpzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtQEBU2E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtQEBU2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727018279; x=1758554279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJLqZsXbea2BygjnJxoa+COcS/NLfQRjE1o9oK+MiVU=;
  b=PtQEBU2EwZzNas7mxyWvdLhGOYkDwyb+K3H8C71JXhTxeTNUBigcbshE
   /QjV6zy2r15c/fUM3cxy40y2YpIZSxT8iD/gUR3DZFahH7vRvLkYi22l4
   /AsrKFYL/v5fXk8m9hBdVA9fkd0G/9SDxaDFHCwc0qEJnMiOZklVGFsyq
   dHPizPZLL8pJIdkpIdeaYU8dNgK2wx2FeCHeAAc0jkl/wrI/OmvPb56+W
   pvopmsCWpt16pjUTOF7IU+tw3kkfLeQMol2HRQlA0NNyoFn8dzL0fWXGx
   flX3NCipD5f4h3hVdVNqPFpk9lc2ErWf98GETBpcF4oWrlkp70O8oFufL
   g==;
X-CSE-ConnectionGUID: UdAndEFMQ2mt4tdIk/wptg==
X-CSE-MsgGUID: XKoiqf3iS/ifrvz7caXn1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36555255"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36555255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 08:17:59 -0700
X-CSE-ConnectionGUID: X37OSFL8RpOUoNjtnsAv4Q==
X-CSE-MsgGUID: 7vX8XHuOQg+OxDFfgIxW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75595797"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Sep 2024 08:17:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssOLR-000GP4-38;
	Sun, 22 Sep 2024 15:17:53 +0000
Date: Sun, 22 Sep 2024 23:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 138/448]
 drivers/gpu/drm/i915/display/intel_hotplug.c:1040 i915_hpd_storm_ctl_write()
 warn: potential spectre issue 'tmp' [w]
Message-ID: <202409222356.Id5VC2Ol-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   7ef9d29ff0268d9fb68e3b1bf7548981d7a61307
commit: fb267b131a04cfdc7c70d3f067b7f8545ca8b4f3 [138/448] drm/i915: convert to read/write iterators
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240922 (https://download.01.org/0day-ci/archive/20240922/202409222356.Id5VC2Ol-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409222356.Id5VC2Ol-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_hotplug.c:1040 i915_hpd_storm_ctl_write() warn: potential spectre issue 'tmp' [w]
drivers/gpu/drm/i915/display/intel_hotplug.c:1121 i915_hpd_short_storm_ctl_write() warn: potential spectre issue 'tmp' [w]
drivers/gpu/drm/i915/display/intel_wm.c:305 wm_latency_write() warn: potential spectre issue 'tmp' [w]

vim +/tmp +1040 drivers/gpu/drm/i915/display/intel_hotplug.c

1bed8b07342069 Jani Nikula 2022-09-16  1021  
fb267b131a04cf Jens Axboe  2024-04-09  1022  static ssize_t i915_hpd_storm_ctl_write(struct kiocb *iocb,
fb267b131a04cf Jens Axboe  2024-04-09  1023  					struct iov_iter *from)
1bed8b07342069 Jani Nikula 2022-09-16  1024  {
fb267b131a04cf Jens Axboe  2024-04-09  1025  	struct seq_file *m = iocb->ki_filp->private_data;
1bed8b07342069 Jani Nikula 2022-09-16  1026  	struct drm_i915_private *dev_priv = m->private;
1bed8b07342069 Jani Nikula 2022-09-16  1027  	struct intel_hotplug *hotplug = &dev_priv->display.hotplug;
fb267b131a04cf Jens Axboe  2024-04-09  1028  	size_t len = iov_iter_count(from);
1bed8b07342069 Jani Nikula 2022-09-16  1029  	unsigned int new_threshold;
1bed8b07342069 Jani Nikula 2022-09-16  1030  	int i;
1bed8b07342069 Jani Nikula 2022-09-16  1031  	char *newline;
1bed8b07342069 Jani Nikula 2022-09-16  1032  	char tmp[16];
1bed8b07342069 Jani Nikula 2022-09-16  1033  
1bed8b07342069 Jani Nikula 2022-09-16  1034  	if (len >= sizeof(tmp))
1bed8b07342069 Jani Nikula 2022-09-16  1035  		return -EINVAL;
1bed8b07342069 Jani Nikula 2022-09-16  1036  
fb267b131a04cf Jens Axboe  2024-04-09  1037  	if (!copy_from_iter_full(tmp, len, from))
1bed8b07342069 Jani Nikula 2022-09-16  1038  		return -EFAULT;
1bed8b07342069 Jani Nikula 2022-09-16  1039  
1bed8b07342069 Jani Nikula 2022-09-16 @1040  	tmp[len] = '\0';
1bed8b07342069 Jani Nikula 2022-09-16  1041  
1bed8b07342069 Jani Nikula 2022-09-16  1042  	/* Strip newline, if any */
1bed8b07342069 Jani Nikula 2022-09-16  1043  	newline = strchr(tmp, '\n');
1bed8b07342069 Jani Nikula 2022-09-16  1044  	if (newline)
1bed8b07342069 Jani Nikula 2022-09-16  1045  		*newline = '\0';
1bed8b07342069 Jani Nikula 2022-09-16  1046  
1bed8b07342069 Jani Nikula 2022-09-16  1047  	if (strcmp(tmp, "reset") == 0)
1bed8b07342069 Jani Nikula 2022-09-16  1048  		new_threshold = HPD_STORM_DEFAULT_THRESHOLD;
1bed8b07342069 Jani Nikula 2022-09-16  1049  	else if (kstrtouint(tmp, 10, &new_threshold) != 0)
1bed8b07342069 Jani Nikula 2022-09-16  1050  		return -EINVAL;
1bed8b07342069 Jani Nikula 2022-09-16  1051  
1bed8b07342069 Jani Nikula 2022-09-16  1052  	if (new_threshold > 0)
1bed8b07342069 Jani Nikula 2022-09-16  1053  		drm_dbg_kms(&dev_priv->drm,
1bed8b07342069 Jani Nikula 2022-09-16  1054  			    "Setting HPD storm detection threshold to %d\n",
1bed8b07342069 Jani Nikula 2022-09-16  1055  			    new_threshold);
1bed8b07342069 Jani Nikula 2022-09-16  1056  	else
1bed8b07342069 Jani Nikula 2022-09-16  1057  		drm_dbg_kms(&dev_priv->drm, "Disabling HPD storm detection\n");
1bed8b07342069 Jani Nikula 2022-09-16  1058  
1bed8b07342069 Jani Nikula 2022-09-16  1059  	spin_lock_irq(&dev_priv->irq_lock);
1bed8b07342069 Jani Nikula 2022-09-16  1060  	hotplug->hpd_storm_threshold = new_threshold;
1bed8b07342069 Jani Nikula 2022-09-16  1061  	/* Reset the HPD storm stats so we don't accidentally trigger a storm */
1bed8b07342069 Jani Nikula 2022-09-16  1062  	for_each_hpd_pin(i)
1bed8b07342069 Jani Nikula 2022-09-16  1063  		hotplug->stats[i].count = 0;
1bed8b07342069 Jani Nikula 2022-09-16  1064  	spin_unlock_irq(&dev_priv->irq_lock);
1bed8b07342069 Jani Nikula 2022-09-16  1065  
1bed8b07342069 Jani Nikula 2022-09-16  1066  	/* Re-enable hpd immediately if we were in an irq storm */
1bed8b07342069 Jani Nikula 2022-09-16  1067  	flush_delayed_work(&dev_priv->display.hotplug.reenable_work);
1bed8b07342069 Jani Nikula 2022-09-16  1068  
1bed8b07342069 Jani Nikula 2022-09-16  1069  	return len;
1bed8b07342069 Jani Nikula 2022-09-16  1070  }
1bed8b07342069 Jani Nikula 2022-09-16  1071  
1bed8b07342069 Jani Nikula 2022-09-16  1072  static int i915_hpd_storm_ctl_open(struct inode *inode, struct file *file)
1bed8b07342069 Jani Nikula 2022-09-16  1073  {
1bed8b07342069 Jani Nikula 2022-09-16  1074  	return single_open(file, i915_hpd_storm_ctl_show, inode->i_private);
1bed8b07342069 Jani Nikula 2022-09-16  1075  }
1bed8b07342069 Jani Nikula 2022-09-16  1076  
1bed8b07342069 Jani Nikula 2022-09-16  1077  static const struct file_operations i915_hpd_storm_ctl_fops = {
1bed8b07342069 Jani Nikula 2022-09-16  1078  	.owner = THIS_MODULE,
1bed8b07342069 Jani Nikula 2022-09-16  1079  	.open = i915_hpd_storm_ctl_open,
fb267b131a04cf Jens Axboe  2024-04-09  1080  	.read_iter = seq_read_iter,
1bed8b07342069 Jani Nikula 2022-09-16  1081  	.llseek = seq_lseek,
1bed8b07342069 Jani Nikula 2022-09-16  1082  	.release = single_release,
fb267b131a04cf Jens Axboe  2024-04-09  1083  	.write_iter = i915_hpd_storm_ctl_write
1bed8b07342069 Jani Nikula 2022-09-16  1084  };
1bed8b07342069 Jani Nikula 2022-09-16  1085  
1bed8b07342069 Jani Nikula 2022-09-16  1086  static int i915_hpd_short_storm_ctl_show(struct seq_file *m, void *data)
1bed8b07342069 Jani Nikula 2022-09-16  1087  {
1bed8b07342069 Jani Nikula 2022-09-16  1088  	struct drm_i915_private *dev_priv = m->private;
1bed8b07342069 Jani Nikula 2022-09-16  1089  
1bed8b07342069 Jani Nikula 2022-09-16  1090  	seq_printf(m, "Enabled: %s\n",
1bed8b07342069 Jani Nikula 2022-09-16  1091  		   str_yes_no(dev_priv->display.hotplug.hpd_short_storm_enabled));
1bed8b07342069 Jani Nikula 2022-09-16  1092  
1bed8b07342069 Jani Nikula 2022-09-16  1093  	return 0;
1bed8b07342069 Jani Nikula 2022-09-16  1094  }
1bed8b07342069 Jani Nikula 2022-09-16  1095  
1bed8b07342069 Jani Nikula 2022-09-16  1096  static int
1bed8b07342069 Jani Nikula 2022-09-16  1097  i915_hpd_short_storm_ctl_open(struct inode *inode, struct file *file)
1bed8b07342069 Jani Nikula 2022-09-16  1098  {
1bed8b07342069 Jani Nikula 2022-09-16  1099  	return single_open(file, i915_hpd_short_storm_ctl_show,
1bed8b07342069 Jani Nikula 2022-09-16  1100  			   inode->i_private);
1bed8b07342069 Jani Nikula 2022-09-16  1101  }
1bed8b07342069 Jani Nikula 2022-09-16  1102  
fb267b131a04cf Jens Axboe  2024-04-09  1103  static ssize_t i915_hpd_short_storm_ctl_write(struct kiocb *iocb,
fb267b131a04cf Jens Axboe  2024-04-09  1104  					      struct iov_iter *from)
1bed8b07342069 Jani Nikula 2022-09-16  1105  {
fb267b131a04cf Jens Axboe  2024-04-09  1106  	struct seq_file *m = iocb->ki_filp->private_data;
1bed8b07342069 Jani Nikula 2022-09-16  1107  	struct drm_i915_private *dev_priv = m->private;
1bed8b07342069 Jani Nikula 2022-09-16  1108  	struct intel_hotplug *hotplug = &dev_priv->display.hotplug;
fb267b131a04cf Jens Axboe  2024-04-09  1109  	size_t len = iov_iter_count(from);
1bed8b07342069 Jani Nikula 2022-09-16  1110  	char *newline;
1bed8b07342069 Jani Nikula 2022-09-16  1111  	char tmp[16];
1bed8b07342069 Jani Nikula 2022-09-16  1112  	int i;
1bed8b07342069 Jani Nikula 2022-09-16  1113  	bool new_state;
1bed8b07342069 Jani Nikula 2022-09-16  1114  
1bed8b07342069 Jani Nikula 2022-09-16  1115  	if (len >= sizeof(tmp))
1bed8b07342069 Jani Nikula 2022-09-16  1116  		return -EINVAL;
1bed8b07342069 Jani Nikula 2022-09-16  1117  
fb267b131a04cf Jens Axboe  2024-04-09  1118  	if (!copy_from_iter_full(tmp, len, from))
1bed8b07342069 Jani Nikula 2022-09-16  1119  		return -EFAULT;
1bed8b07342069 Jani Nikula 2022-09-16  1120  
1bed8b07342069 Jani Nikula 2022-09-16 @1121  	tmp[len] = '\0';
1bed8b07342069 Jani Nikula 2022-09-16  1122  
1bed8b07342069 Jani Nikula 2022-09-16  1123  	/* Strip newline, if any */
1bed8b07342069 Jani Nikula 2022-09-16  1124  	newline = strchr(tmp, '\n');
1bed8b07342069 Jani Nikula 2022-09-16  1125  	if (newline)
1bed8b07342069 Jani Nikula 2022-09-16  1126  		*newline = '\0';
1bed8b07342069 Jani Nikula 2022-09-16  1127  
1bed8b07342069 Jani Nikula 2022-09-16  1128  	/* Reset to the "default" state for this system */
1bed8b07342069 Jani Nikula 2022-09-16  1129  	if (strcmp(tmp, "reset") == 0)
1bed8b07342069 Jani Nikula 2022-09-16  1130  		new_state = !HAS_DP_MST(dev_priv);
1bed8b07342069 Jani Nikula 2022-09-16  1131  	else if (kstrtobool(tmp, &new_state) != 0)
1bed8b07342069 Jani Nikula 2022-09-16  1132  		return -EINVAL;
1bed8b07342069 Jani Nikula 2022-09-16  1133  
1bed8b07342069 Jani Nikula 2022-09-16  1134  	drm_dbg_kms(&dev_priv->drm, "%sabling HPD short storm detection\n",
1bed8b07342069 Jani Nikula 2022-09-16  1135  		    new_state ? "En" : "Dis");
1bed8b07342069 Jani Nikula 2022-09-16  1136  
1bed8b07342069 Jani Nikula 2022-09-16  1137  	spin_lock_irq(&dev_priv->irq_lock);
1bed8b07342069 Jani Nikula 2022-09-16  1138  	hotplug->hpd_short_storm_enabled = new_state;
1bed8b07342069 Jani Nikula 2022-09-16  1139  	/* Reset the HPD storm stats so we don't accidentally trigger a storm */
1bed8b07342069 Jani Nikula 2022-09-16  1140  	for_each_hpd_pin(i)
1bed8b07342069 Jani Nikula 2022-09-16  1141  		hotplug->stats[i].count = 0;
1bed8b07342069 Jani Nikula 2022-09-16  1142  	spin_unlock_irq(&dev_priv->irq_lock);
1bed8b07342069 Jani Nikula 2022-09-16  1143  
1bed8b07342069 Jani Nikula 2022-09-16  1144  	/* Re-enable hpd immediately if we were in an irq storm */
1bed8b07342069 Jani Nikula 2022-09-16  1145  	flush_delayed_work(&dev_priv->display.hotplug.reenable_work);
1bed8b07342069 Jani Nikula 2022-09-16  1146  
1bed8b07342069 Jani Nikula 2022-09-16  1147  	return len;
1bed8b07342069 Jani Nikula 2022-09-16  1148  }
1bed8b07342069 Jani Nikula 2022-09-16  1149  

:::::: The code at line 1040 was first introduced by commit
:::::: 1bed8b07342069ebfbab6794e5ce3084c3eb9bc8 drm/i915/hotplug: move hotplug storm debugfs to intel_hotplug.c

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
