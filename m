Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F231F416F
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Feb 2025 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858187; cv=none; b=JdBsRz89KTytuqsEUKoMSNZ7BSxAO4RAgeI3bKd4zDO2KfcZRODfSx7qfcUTt6ayQcV+T+pk67FO7lPvC+ilKyljYAB8NCma9KsGObp2xoRy6H/VUxcxwM32JfVuD+BUYRGcHXaPz6Tv1nzOnwvvn9m/lHKfQ7cK3Fg68EW3O7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858187; c=relaxed/simple;
	bh=q1iQ0CmoQPnWpLD6fIGD0IGhz/KVlJAeT9rkbbticco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUfceHSLPXqnB84lpzlq1RKraj6LaOemYWNStM4DqpPBGwHM4q5GBEkaU95OFST7PpDScSt0n4nq+cjhNUKRJHm7J32yKyDXSOvy/DbX6JygDnnIvedpl+qqtYCpJpQhKHHlPKoxP/q4y/foMyWY3deGamnPbLBKtglcG9SYaKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOc3+SIq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOc3+SIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738858186; x=1770394186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1iQ0CmoQPnWpLD6fIGD0IGhz/KVlJAeT9rkbbticco=;
  b=OOc3+SIqP2Ty124/QQ4VaM+uvSilXDsWjcsCYgO3laeoBHHUGdmWvnhd
   hLdxUoMsfbbftjJRZgfJ6c4KJLnGsveaRgRAjMirW1NPC0Uybtfdx0xqN
   gDQGXFnLr6HsJvhwKFqZFQ3+XkGu3csM4NEy7+OeSS+nCpUOp4MfKzlKD
   8cRpIZetSb9+NXBfv3Qv+ButJyxU+oUva/7KkOhA6DvZ1+gEcxem96Hi6
   PkGV8S9uzds3lK1M821j5qJCb/7Q+f00vn6jDY6s7vEJPIzxn5/t7IGs7
   81lZyHUmPNNSCJrtCd3pgsM7X+N0CiD6E072lBQrFtfz1ioJBy/WqWccN
   g==;
X-CSE-ConnectionGUID: U9FqiSIbQj6VB98XJb3b7Q==
X-CSE-MsgGUID: f4IFGA0kQb2uIYkpOtAJdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61946258"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="61946258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 08:09:44 -0800
X-CSE-ConnectionGUID: agFdrEvuSReahW64N7W+Lw==
X-CSE-MsgGUID: WlvpoioGTH61l6nqmpwhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116243761"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2025 08:09:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg4Rg-000x4B-19;
	Thu, 06 Feb 2025 16:09:40 +0000
Date: Fri, 7 Feb 2025 00:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.6 204/204]
 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:46: warning: format
 specifies type 'unsigned long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202502062302.giei5DE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 89cb8bc425a44875dc0420914465cbc1936bef3f [204/204] CHROMIUM: ipu6: enable the psys downstream driver
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250206/202502062302.giei5DE0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502062302.giei5DE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502062302.giei5DE0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:46: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                                                ~~~         ^~~~~~~
         |                                                %zu
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ~~~    ^~~~~~~~~~~
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:700:4: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                                                    ~~~
         |                                                    %zu
     700 |                         kcmd->kpg->pg_size);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +699 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c

284a3b163de88a Bingbu Cao 2024-12-03  684  
284a3b163de88a Bingbu Cao 2024-12-03  685  int ipu_psys_kcmd_new(struct ipu_psys_command *cmd, struct ipu_psys_fh *fh)
284a3b163de88a Bingbu Cao 2024-12-03  686  {
284a3b163de88a Bingbu Cao 2024-12-03  687  	struct ipu_psys *psys = fh->psys;
0dfcffdba7520c Bingbu Cao 2024-12-03  688  	struct device *dev = &psys->adev->auxdev.dev;
284a3b163de88a Bingbu Cao 2024-12-03  689  	struct ipu_psys_kcmd *kcmd;
284a3b163de88a Bingbu Cao 2024-12-03  690  	size_t pg_size;
284a3b163de88a Bingbu Cao 2024-12-03  691  	int ret;
284a3b163de88a Bingbu Cao 2024-12-03  692  
284a3b163de88a Bingbu Cao 2024-12-03  693  	kcmd = ipu_psys_copy_cmd(cmd, fh);
284a3b163de88a Bingbu Cao 2024-12-03  694  	if (!kcmd)
284a3b163de88a Bingbu Cao 2024-12-03  695  		return -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  696  
284a3b163de88a Bingbu Cao 2024-12-03  697  	pg_size = ipu_fw_psys_pg_get_size(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  698  	if (pg_size > kcmd->kpg->pg_size) {
0dfcffdba7520c Bingbu Cao 2024-12-03 @699  		dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
0dfcffdba7520c Bingbu Cao 2024-12-03  700  			kcmd->kpg->pg_size);
284a3b163de88a Bingbu Cao 2024-12-03  701  		ret = -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  702  		goto error;
284a3b163de88a Bingbu Cao 2024-12-03  703  	}
284a3b163de88a Bingbu Cao 2024-12-03  704  
284a3b163de88a Bingbu Cao 2024-12-03  705  	if (ipu_fw_psys_pg_get_protocol(kcmd) !=
284a3b163de88a Bingbu Cao 2024-12-03  706  			IPU_FW_PSYS_PROCESS_GROUP_PROTOCOL_PPG) {
0dfcffdba7520c Bingbu Cao 2024-12-03  707  		dev_err(dev, "No support legacy pg now\n");
284a3b163de88a Bingbu Cao 2024-12-03  708  		ret = -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  709  		goto error;
284a3b163de88a Bingbu Cao 2024-12-03  710  	}
284a3b163de88a Bingbu Cao 2024-12-03  711  
284a3b163de88a Bingbu Cao 2024-12-03  712  	if (cmd->min_psys_freq) {
284a3b163de88a Bingbu Cao 2024-12-03  713  		kcmd->constraint.min_freq = cmd->min_psys_freq;
284a3b163de88a Bingbu Cao 2024-12-03  714  		ipu_buttress_add_psys_constraint(psys->adev->isp,
284a3b163de88a Bingbu Cao 2024-12-03  715  						 &kcmd->constraint);
284a3b163de88a Bingbu Cao 2024-12-03  716  	}
284a3b163de88a Bingbu Cao 2024-12-03  717  
284a3b163de88a Bingbu Cao 2024-12-03  718  	ret = ipu_psys_kcmd_send_to_ppg(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  719  	if (ret)
284a3b163de88a Bingbu Cao 2024-12-03  720  		goto error;
284a3b163de88a Bingbu Cao 2024-12-03  721  
0dfcffdba7520c Bingbu Cao 2024-12-03  722  	dev_dbg(dev, "IOC_QCMD: user_token:%llx issue_id:0x%llx pri:%d\n",
284a3b163de88a Bingbu Cao 2024-12-03  723  		cmd->user_token, cmd->issue_id, cmd->priority);
284a3b163de88a Bingbu Cao 2024-12-03  724  
284a3b163de88a Bingbu Cao 2024-12-03  725  	return 0;
284a3b163de88a Bingbu Cao 2024-12-03  726  
284a3b163de88a Bingbu Cao 2024-12-03  727  error:
284a3b163de88a Bingbu Cao 2024-12-03  728  	ipu_psys_kcmd_free(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  729  
284a3b163de88a Bingbu Cao 2024-12-03  730  	return ret;
284a3b163de88a Bingbu Cao 2024-12-03  731  }
284a3b163de88a Bingbu Cao 2024-12-03  732  

:::::: The code at line 699 was first introduced by commit
:::::: 0dfcffdba7520c8b950d81493ccc4309decc8fae CHROMIUM: ipu6: update psys driver to make it work with upstream IPU6 PCI driver

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
