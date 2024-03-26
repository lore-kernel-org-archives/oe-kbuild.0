Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7129D01
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711430995; cv=none; b=Y/hlhrOonfUojtCs0pynNR/O1tT0CnupzjnqDzuTH2F+MBcIzAw5TjWMQet/yBr4faLcPOdH/clR1k2/DcQpv54LIbpFcnfcfs78omPZffNX2M5bKvd8ko+x89arzYWHn4Xowb2PKYtiep1myEDGMNsSmRJcH2mt8odqLSO7Nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711430995; c=relaxed/simple;
	bh=U1W3vmvBlIkHUAn8aoKNrDnHKoJdXzjqz3ZaQMNqM10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Do9iX1rizufLSBGF70a7Cpap/SGzFLRqewKGVOwp2IrZmCu/0kPtA8tVS17Y9g9mcGFrOtlS2M5PG8lxxCy0VUIpgkRPR5nyervIo/qOHvhQQ+2JqBZ5Igs8HB069HD+FC2Ln+VtkK9QyAkyxOIF4zp9vOmk4yEmQmBV94kq+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me6xaHkW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me6xaHkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711430991; x=1742966991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1W3vmvBlIkHUAn8aoKNrDnHKoJdXzjqz3ZaQMNqM10=;
  b=me6xaHkWWAoZiU7ZaedlqzjJpBijpEdHgQdsWCpPuJ3goTZ9BQxQEhVc
   4dvoJURIVTsDMFMgs0X7oDCJbth/7XfNR0ALn2vsBlMQ1jwwBLApZW1tF
   8LRLtR7yFPX+jriEmLyYdg/AnNz4l8bbzqAJ+cONBtwAxQRCCqh233PHE
   /63yL7PP1dr85yPpZ+DH8mHj5ixGpki77HQgYTpFv3hq4oUJl4tjNQVTs
   PYjonEVA1xeAWyP7n1ZCrtPAjrEUk3rRzJjKf8LI8h1gb8W2nBU+EHQRl
   8CTJHWmGtdLznFnhZN91/j1AscOKX7MM/xj3M1MpQ9n2yIxhm1pvRSWvn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6357931"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6357931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 22:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="46851905"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2024 22:29:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rozNa-000N94-1w;
	Tue, 26 Mar 2024 05:29:46 +0000
Date: Tue, 26 Mar 2024 13:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 614/1266]
 drivers/firmware/arm_scmi/raw_mode.c:924:8-24: WARNING:
 scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change
 nonseekable_open -> stream_open.
Message-ID: <202403261302.ww11nNYx-lkp@intel.com>
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
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fdad13606e104ff103ca19d2d660830cb36d43e
commit: 7f620d5b0b1dd7c7972cdf1b40b30552ac7bd325 [614/1266] firmware: arm_scmi: Make raw debugfs entries non-seekable
:::::: branch date: 28 hours ago
:::::: commit date: 11 days ago
config: loongarch-randconfig-r064-20240325 (https://download.01.org/0day-ci/archive/20240326/202403261302.ww11nNYx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403261302.ww11nNYx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/raw_mode.c:924:8-24: WARNING: scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +924 drivers/firmware/arm_scmi/raw_mode.c

3c3d818a9317a5 Cristian Marussi 2023-01-18  886  
3c3d818a9317a5 Cristian Marussi 2023-01-18  887  static int scmi_dbg_raw_mode_open(struct inode *inode, struct file *filp)
3c3d818a9317a5 Cristian Marussi 2023-01-18  888  {
7860701d1e6e6e Cristian Marussi 2023-01-18  889  	u8 id;
3c3d818a9317a5 Cristian Marussi 2023-01-18  890  	struct scmi_raw_mode_info *raw;
3c3d818a9317a5 Cristian Marussi 2023-01-18  891  	struct scmi_dbg_raw_data *rd;
7860701d1e6e6e Cristian Marussi 2023-01-18  892  	const char *id_str = filp->f_path.dentry->d_parent->d_name.name;
3c3d818a9317a5 Cristian Marussi 2023-01-18  893  
3c3d818a9317a5 Cristian Marussi 2023-01-18  894  	if (!inode->i_private)
3c3d818a9317a5 Cristian Marussi 2023-01-18  895  		return -ENODEV;
3c3d818a9317a5 Cristian Marussi 2023-01-18  896  
3c3d818a9317a5 Cristian Marussi 2023-01-18  897  	raw = inode->i_private;
3c3d818a9317a5 Cristian Marussi 2023-01-18  898  	rd = kzalloc(sizeof(*rd), GFP_KERNEL);
3c3d818a9317a5 Cristian Marussi 2023-01-18  899  	if (!rd)
3c3d818a9317a5 Cristian Marussi 2023-01-18  900  		return -ENOMEM;
3c3d818a9317a5 Cristian Marussi 2023-01-18  901  
3c3d818a9317a5 Cristian Marussi 2023-01-18  902  	rd->rx.len = raw->desc->max_msg_size + sizeof(u32);
3c3d818a9317a5 Cristian Marussi 2023-01-18  903  	rd->rx.buf = kzalloc(rd->rx.len, GFP_KERNEL);
3c3d818a9317a5 Cristian Marussi 2023-01-18  904  	if (!rd->rx.buf) {
3c3d818a9317a5 Cristian Marussi 2023-01-18  905  		kfree(rd);
3c3d818a9317a5 Cristian Marussi 2023-01-18  906  		return -ENOMEM;
3c3d818a9317a5 Cristian Marussi 2023-01-18  907  	}
3c3d818a9317a5 Cristian Marussi 2023-01-18  908  
3c3d818a9317a5 Cristian Marussi 2023-01-18  909  	rd->tx.len = raw->desc->max_msg_size + sizeof(u32);
3c3d818a9317a5 Cristian Marussi 2023-01-18  910  	rd->tx.buf = kzalloc(rd->tx.len, GFP_KERNEL);
3c3d818a9317a5 Cristian Marussi 2023-01-18  911  	if (!rd->tx.buf) {
3c3d818a9317a5 Cristian Marussi 2023-01-18  912  		kfree(rd->rx.buf);
3c3d818a9317a5 Cristian Marussi 2023-01-18  913  		kfree(rd);
3c3d818a9317a5 Cristian Marussi 2023-01-18  914  		return -ENOMEM;
3c3d818a9317a5 Cristian Marussi 2023-01-18  915  	}
3c3d818a9317a5 Cristian Marussi 2023-01-18  916  
7860701d1e6e6e Cristian Marussi 2023-01-18  917  	/* Grab channel ID from debugfs entry naming if any */
7860701d1e6e6e Cristian Marussi 2023-01-18  918  	if (!kstrtou8(id_str, 16, &id))
7860701d1e6e6e Cristian Marussi 2023-01-18  919  		rd->chan_id = id;
7860701d1e6e6e Cristian Marussi 2023-01-18  920  
3c3d818a9317a5 Cristian Marussi 2023-01-18  921  	rd->raw = raw;
3c3d818a9317a5 Cristian Marussi 2023-01-18  922  	filp->private_data = rd;
3c3d818a9317a5 Cristian Marussi 2023-01-18  923  
7f620d5b0b1dd7 Cristian Marussi 2024-03-15 @924  	return nonseekable_open(inode, filp);
3c3d818a9317a5 Cristian Marussi 2023-01-18  925  }
3c3d818a9317a5 Cristian Marussi 2023-01-18  926  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
