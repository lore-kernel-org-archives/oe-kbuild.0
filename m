Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B01FAA
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680327437; x=1711863437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmFyVIhQ3vYcpAVhuoTG9QgbN4ZPQbch5Ta6mZp0oyU=;
  b=hBx5K/swrSTT1UCzXcbR+vsFlEYAi2q14IjMKORPDCwF84qAsdiKc2eN
   mE2B8rdQW7F9pL5Ew6Pdrf3Ef7ukR6vxuvPbZBXluez70mTHfZdjdKwVM
   EwjtVbn4i3xxbPL3su8Nss0b17mGImQcegbq7prXXhgUkUXp3rV38xAaF
   iX9+5u6c6D4nXiR+TA5ppnzPcVwML4w36ONGR+mlcEERV3zjey4CIZGOX
   jzRE/uXCWjIwLP9jtwye6e7NCBi/1ZOpq7CNNnmIgTxdNna5aPynUgzpY
   5mMYoY+f/zpuW+KbEuz1mPFl2HlcS9EX9RVatxo1tSJ1swjIAYPNmOLMY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321277722"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="321277722"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 22:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="774591660"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="774591660"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2023 22:37:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piTvO-000MWL-1z;
	Sat, 01 Apr 2023 05:37:14 +0000
Date: Sat, 1 Apr 2023 13:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] scsi: ufs: mcq: Limit the amount of inflight requests
Message-ID: <202304011340.ltlHYazS-lkp@intel.com>
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
In-Reply-To: <20230331074650.75-1-avri.altman@wdc.com>
References: <20230331074650.75-1-avri.altman@wdc.com>
TO: Avri Altman <avri.altman@wdc.com>
TO: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
CC: Asutosh Das <quic_asutoshd@quicinc.com>
CC: quic_cang@quicinc.com
CC: linux-scsi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Avri Altman <avri.altman@wdc.com>

Hi Avri,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avri-Altman/scsi-ufs-mcq-Limit-the-amount-of-inflight-requests/20230331-155149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230331074650.75-1-avri.altman%40wdc.com
patch subject: [PATCH v2] scsi: ufs: mcq: Limit the amount of inflight requests
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: parisc-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230401/202304011340.ltlHYazS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304011340.ltlHYazS-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:8473 ufshcd_alloc_mcq() warn: missing error code 'ret'

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5412 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5400)
drivers/ufs/core/ufshcd.c:2350 ufshcd_hba_capabilities() warn: missing error code? 'err'

vim +/ret +8473 drivers/ufs/core/ufshcd.c

4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8456  
57b1c0ef89ac9d drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8457  static int ufshcd_alloc_mcq(struct ufs_hba *hba)
57b1c0ef89ac9d drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8458  {
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8459  	int ret;
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8460  	int old_nutrs = hba->nutrs;
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8461  
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8462  	ret = ufshcd_mcq_decide_queue_depth(hba);
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8463  	if (ret < 0)
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8464  		return ret;
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8465  
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8466  	hba->nutrs = ret;
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8467  	ret = ufshcd_mcq_init(hba);
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8468  	if (ret)
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8469  		goto err;
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8470  
2580a95e61d461 drivers/ufs/core/ufshcd.c Avri Altman   2023-03-31  8471  	if (hba->nutrs * hba->nr_hw_queues > SZ_64K - 1) {
2580a95e61d461 drivers/ufs/core/ufshcd.c Avri Altman   2023-03-31  8472  		dev_info(hba->dev, "there can be at most 64K inflight requests\n");
2580a95e61d461 drivers/ufs/core/ufshcd.c Avri Altman   2023-03-31 @8473  		goto err;
2580a95e61d461 drivers/ufs/core/ufshcd.c Avri Altman   2023-03-31  8474  	}
2580a95e61d461 drivers/ufs/core/ufshcd.c Avri Altman   2023-03-31  8475  
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8476  	/*
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8477  	 * Previously allocated memory for nutrs may not be enough in MCQ mode.
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8478  	 * Number of supported tags in MCQ mode may be larger than SDB mode.
6ccf44fe4cd7c4 drivers/scsi/ufs/ufshcd.c Seungwon Jeon 2013-06-26  8479  	 */
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8480  	if (hba->nutrs != old_nutrs) {
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8481  		ufshcd_release_sdb_queue(hba, old_nutrs);
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8482  		ret = ufshcd_memory_alloc(hba);
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8483  		if (ret)
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8484  			goto err;
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8485  		ufshcd_host_memory_configure(hba);
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8486  	}
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8487  
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8488  	ret = ufshcd_mcq_memory_alloc(hba);
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8489  	if (ret)
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8490  		goto err;
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8491  
7224c806876e46 drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8492  	return 0;
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8493  err:
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8494  	hba->nutrs = old_nutrs;
4682abfae2eb3a drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8495  	return ret;
57b1c0ef89ac9d drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8496  }
57b1c0ef89ac9d drivers/ufs/core/ufshcd.c Asutosh Das   2023-01-13  8497  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
