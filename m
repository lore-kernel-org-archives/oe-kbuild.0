Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C313DDB8
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Oct 2024 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727817430; cv=none; b=hvTfifAJuHccih48nf9MttzWnYfGgMzv4ggEk/wTxRcw7/z26aJOPLv44sdMFjlMO5TLma1KUBuNP+N6IlDG2TFgrYKeY7wFbLdzqK+09Gvm1yVNd+rwtEfknqy8VSpqNCayBLTa9EjVkH2z2hAW2IU0a3+lL5s7W4qgYiJiLrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727817430; c=relaxed/simple;
	bh=Y6UKjwec+c6Lwg5CC4Uzh3sR3+DCMmz1J3E1TB97/HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkYdPMHocdWlHplf9nKb8nMzRpK+C66zF1j+bR2nQH4zlfcoWqLvVQYddKOpf+CXA0nhrIPOqZISSJZD4a2fLRT3FXhSwsFMaOalEoiVG807IdSPHWPjdHLMEgaaP4XCaVyNKo3Ag1CiZLuIXdGYGupW9hKTV0wQQAhghrsCQTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC9AOqW0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC9AOqW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727817428; x=1759353428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6UKjwec+c6Lwg5CC4Uzh3sR3+DCMmz1J3E1TB97/HM=;
  b=OC9AOqW0J9TP5U3rvX/P2eR12QKPub9OeEOXwT1BbL4S4JQaO2onFWab
   liWnrE/MvI69C/ffutk/RbN+zYnwCAFqg9CfCBZdwcWZ8Rh6oOMM8imXX
   dSdamY7F7VtVB3JcEHhfdO4UrryiJd8OBcoEdYjpEtDaEAHd10QGL3M81
   EQc53XYnHCGmiyULmen4oG382TNYLoyzfNcWYTkBEdc+gAA8IgWj0P/Zh
   V2J1vCUYkWs1DtqoLS2No3VIEW0PoCnn+aVozh6TOkpvMGamgSi9VgTCj
   HnHuxqhPwYmKMWFUGOXsw5bJ0Db2zi8cPe+eDcijnVxGbFwE0hbDrsvlq
   Q==;
X-CSE-ConnectionGUID: UPo7sbZaT5SHgE+g8F3klw==
X-CSE-MsgGUID: wh6I2G1aSnexEidPghcE5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27131572"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27131572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 14:17:07 -0700
X-CSE-ConnectionGUID: KNNSd+UcRPCSgS24odGlVQ==
X-CSE-MsgGUID: NYtiWQOUQkaTNYaBxTxYfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="73776545"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2024 14:17:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svkEy-000RBb-05;
	Tue, 01 Oct 2024 21:17:04 +0000
Date: Wed, 2 Oct 2024 05:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/arm_scmi/raw_mode.c:924:8-24: WARNING:
 scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change
 nonseekable_open -> stream_open.
Message-ID: <202410020543.MuCto6Eo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: b70c7996d4ffb2e02895132e8a79a37cee66504f firmware: arm_scmi: Make raw debugfs entries non-seekable
date:   6 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r053-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020543.MuCto6Eo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410020543.MuCto6Eo-lkp@intel.com/

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
b70c7996d4ffb2 Cristian Marussi 2024-03-15 @924  	return nonseekable_open(inode, filp);
3c3d818a9317a5 Cristian Marussi 2023-01-18  925  }
3c3d818a9317a5 Cristian Marussi 2023-01-18  926  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
