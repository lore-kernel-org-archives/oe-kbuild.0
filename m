Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E5374F6
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724492284; cv=none; b=QgJ9dSSOJ5FpfmhOw3CnbZ/J+9fbVdiECj59oV1VqyVuwMUu+QCbIwu+bZYlVeTNbaV7CnzUPuMurgp1ipFWDBr6cEckjlp4b72TaIV1iV2EJuZrz1BMyFdJuS2+186uMJ3k4SWUK3oTViNgYF+dGijgT7SRQ5snFYCzpe3mnlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724492284; c=relaxed/simple;
	bh=uoZ7GNeDC3sqtc11IvKr6fPGKe4gk1ih8lKP2BdqvTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mvj7cPn1pTiVfiXghc7IKfsAuE2h+aOjLYo1GBwy+zwbwb2ltHh/rBzotRhAl/bk0NS3QlUlYdsvqlPRl04vfPQjmFy0hsShouDE9BmwQEmj88wbX/HtooIcdJioHmzbQ4lCWLhGJa/VQzxO6QdlHM+YX58xGxgMTEFlrvn6CzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMjZ/eyM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMjZ/eyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724492281; x=1756028281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoZ7GNeDC3sqtc11IvKr6fPGKe4gk1ih8lKP2BdqvTo=;
  b=JMjZ/eyMlmIiZ22zQZJgAPAHQCoTmuO1e3e69DEQDAGhRBbERrA47BWD
   1VcNg4PBK9SfFblKfSWt25TGQxdF+3danGho8k5Zf/dAxFspgI68jVxD3
   N6dGZz5sO5Bnm8gVQiK064mB5VYcJfITdi1wrhTYINUjOIPEbzC2mZ/I8
   3a/EEY39G1UGpbAhuQDy/G0Zwp/oPNBugbab4zHuAhj6wFjyJYu6prQav
   eWMoZDKK4wl4nZ/olB5N8vsb8ETu5hjVFFu6agoOT+YnImjWu8kWIUd7F
   3hU2ZQsCgKZTgsjDvcgdA3ojZokz3UsOKHCWwRsE2xSE3e2CDgiNrVyxR
   g==;
X-CSE-ConnectionGUID: 6fi/36IWTcC4rFmJ6XD+eg==
X-CSE-MsgGUID: 4CUhRKGJTcy6eeQ93DAfIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34134152"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="34134152"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 02:38:01 -0700
X-CSE-ConnectionGUID: S4UX3zgUQZGYd+LfDkkmtg==
X-CSE-MsgGUID: 0y10PkjqQxOi6krv7gakbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="61890282"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2024 02:37:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shnDZ-000EOR-0m;
	Sat, 24 Aug 2024 09:37:57 +0000
Date: Sat, 24 Aug 2024 17:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier
 to read
Message-ID: <202408241736.p8Mxizp7-lkp@intel.com>
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
In-Reply-To: <20240821182923.145631-2-bvanassche@acm.org>
References: <20240821182923.145631-2-bvanassche@acm.org>
TO: Bart Van Assche <bvanassche@acm.org>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
CC: linux-scsi@vger.kernel.org
CC: Bart Van Assche <bvanassche@acm.org>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
CC: Peter Wang <peter.wang@mediatek.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Avri Altman <avri.altman@wdc.com>
CC: Bean Huo <beanhuo@micron.com>
CC: Andrew Halaney <ahalaney@redhat.com>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/scsi-ufs-core-Make-ufshcd_uic_cmd_compl-easier-to-read/20240822-023058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240821182923.145631-2-bvanassche%40acm.org
patch subject: [PATCH 1/2] scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier to read
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241736.p8Mxizp7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408241736.p8Mxizp7-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:5484 ufshcd_uic_cmd_compl() error: we previously assumed 'cmd' could be null (see line 5474)

Old smatch warnings:
drivers/ufs/core/ufshcd.c:9226 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9204.

vim +/cmd +5484 drivers/ufs/core/ufshcd.c

a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5454  
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5455  /**
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5456   * ufshcd_uic_cmd_compl - handle completion of uic command
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5457   * @hba: per adapter instance
53b3d9c3fdda94 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-08-31  5458   * @intr_status: interrupt status generated by the controller
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5459   *
3a17fefe0f1960 drivers/ufs/core/ufshcd.c Bart Van Assche       2023-07-27  5460   * Return:
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5461   *  IRQ_HANDLED - If interrupt is valid
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5462   *  IRQ_NONE    - If invalid interrupt
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5463   */
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5464  static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5465  {
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5466  	irqreturn_t retval = IRQ_NONE;
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5467  	struct uic_command *cmd;
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5468  
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5469  	spin_lock(hba->host->host_lock);
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5470  	cmd = hba->active_uic_cmd;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5471  	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5472  		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5473  
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21 @5474  	if (intr_status & UIC_COMMAND_COMPL && cmd) {
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5475  		cmd->argument2 |= ufshcd_get_uic_cmd_result(hba);
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5476  		cmd->argument3 = ufshcd_get_dme_attr_val(hba);
0f52fcb99ea273 drivers/scsi/ufs/ufshcd.c Can Guo               2020-11-02  5477  		if (!hba->uic_async_done)
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5478  			cmd->cmd_active = 0;
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5479  		complete(&cmd->done);
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5480  		retval = IRQ_HANDLED;
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5481  	}
53b3d9c3fdda94 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-08-31  5482  
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5483  	if (intr_status & UFSHCD_UIC_PWR_MASK && hba->uic_async_done) {
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21 @5484  		cmd->cmd_active = 0;
57d104c153d3d6 drivers/scsi/ufs/ufshcd.c Subhash Jadavani      2014-09-25  5485  		complete(hba->uic_async_done);
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5486  		retval = IRQ_HANDLED;
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5487  	}
aa5c697988b4c7 drivers/scsi/ufs/ufshcd.c Stanley Chu           2020-06-15  5488  
aa5c697988b4c7 drivers/scsi/ufs/ufshcd.c Stanley Chu           2020-06-15  5489  	if (retval == IRQ_HANDLED)
71779e69ba68be drivers/ufs/core/ufshcd.c Bart Van Assche       2024-08-21  5490  		ufshcd_add_uic_command_trace(hba, cmd, UFS_CMD_COMP);
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo               2021-05-24  5491  	spin_unlock(hba->host->host_lock);
9333d77573485c drivers/scsi/ufs/ufshcd.c Venkat Gopalakrishnan 2019-11-14  5492  	return retval;
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5493  }
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon         2013-06-26  5494  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
