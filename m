Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634681851
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Sep 2023 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694246758; x=1725782758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GtBADYHG9udQbMK5ixFh2mrahGSJOqWauta0Gw9gyuA=;
  b=dOOjznqsfHd4jiQCkvO6iVf9489XFBTlbJjYU+KUaYTAZBjPP0H8l9wH
   TV2kFCFtaZIJWXCBrOW7hQtwIPzWK9WZS2z27Jv3t7abvT291nkKwCmBL
   bpbjhJKKILQMZSnkg/YQ18X8tQEmKh3QVV5FyzuHL1j3iV4O2XdqFbxf4
   y3PAa5llK88IYqmL30KQaQNLC8r3PLqJxdNvXLpNGwJCJY3bk2Zsuk175
   Z0pyuZZA0cHk/T7PxjQYr7Z6yg+k0LqfEDmJKEQ72efiXidLfQmO8Ak14
   jbYsDCPRnL3RR5/LxRdtbbE6BP0QKNPu3QWCspkElCvrmmCTB6zDaEZpB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362853639"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="362853639"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 01:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="812803567"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="812803567"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2023 01:05:53 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesyW-00037o-0N;
	Sat, 09 Sep 2023 08:05:52 +0000
Date: Sat, 9 Sep 2023 16:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] scsi: ufs: core: Add ufshcd_wb_buf_resize
 function to enable WB buffer resize
Message-ID: <202309091536.TRk3mftu-lkp@intel.com>
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
In-Reply-To: <20230908102113.547-3-luhongfei@vivo.com>
References: <20230908102113.547-3-luhongfei@vivo.com>
TO: Lu Hongfei <luhongfei@vivo.com>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Avri Altman <avri.altman@wdc.com>
TO: Bart Van Assche <bvanassche@acm.org>
TO: "James E.J. Bottomley" <jejb@linux.ibm.com>
TO: "Martin K. Petersen" <martin.petersen@oracle.com>
TO: Lu Hongfei <luhongfei@vivo.com>
TO: Can Guo <quic_cang@quicinc.com>
TO: Bean Huo <beanhuo@micron.com>
TO: Arthur Simchaev <arthur.simchaev@wdc.com>
TO: Stanley Chu <stanley.chu@mediatek.com>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Asutosh Das <quic_asutoshd@quicinc.com>
TO: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
TO: zhanghui <zhanghui31@xiaomi.com>
TO: "Po-Wen Kao" <powen.kao@mediatek.com>
TO: Eric Biggers <ebiggers@google.com>
TO: Keoseong Park <keosung.park@samsung.com>
TO: linux-kernel@vger.kernel.org
TO: linux-scsi@vger.kernel.org
CC: opensource.kernel@vivo.com

Hi Lu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-Hongfei/scsi-ufs-core-add-wb-buffer-resize-related-attr_idn/20230908-182656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230908102113.547-3-luhongfei%40vivo.com
patch subject: [PATCH v2 2/3] scsi: ufs: core: Add ufshcd_wb_buf_resize function to enable WB buffer resize
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091536.TRk3mftu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091536.TRk3mftu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309091536.TRk3mftu-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:6067 ufshcd_wb_buf_resize() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5353 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5341)
drivers/ufs/core/ufshcd.c:7560 ufshcd_abort() error: uninitialized symbol 'reg'.
drivers/ufs/core/ufshcd.c:9124 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9104.

vim +/ret +6067 drivers/ufs/core/ufshcd.c

3d17b9b5ab1155 drivers/scsi/ufs/ufshcd.c Asutosh Das 2020-04-22  6048  
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6049  int ufshcd_wb_buf_resize(struct ufs_hba *hba, u32 resize_op)
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6050  {
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6051  	int ret;
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6052  	u8 index;
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6053  
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6054  	ufshcd_scsi_block_requests(hba);
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6055  	if (ufshcd_wait_for_doorbell_clr(hba, 1 * USEC_PER_SEC))
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6056  		goto out;
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6057  
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6058  	index = ufshcd_wb_get_query_index(hba);
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6059  	ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6060  		QUERY_ATTR_IDN_WB_BUF_RESIZE_EN, index, 0, &resize_op);
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6061  	if (ret)
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6062  		dev_err(hba->dev,
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6063  			"%s: Enable WB buf resize operation failed %d\n",
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6064  			__func__, ret);
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6065  out:
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6066  	ufshcd_scsi_unblock_requests(hba);
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08 @6067  	return ret;
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6068  }
7b70b34c503067 drivers/ufs/core/ufshcd.c Lu Hongfei  2023-09-08  6069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
