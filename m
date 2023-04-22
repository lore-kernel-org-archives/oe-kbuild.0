Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E97F
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Apr 2023 00:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682122303; x=1713658303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CH2OVpZl9A/u7hQ8y/pKcRJzB7aOcA0qYMk82UnXvIM=;
  b=MLJmPJFYl1rYGyBxR8M0GvBekqomWkA1EA/GunVZ9bJqoZ9Y+6shVMTY
   2AXHfTVLLwN/hwbtC54RvincK4w8Fj+J5L/LHdMIeNKvIA50LJxDpv4gW
   aPeWsQaBKKR9CxPOI6x9uF2A164iUlmlRCmJ/jrU3kxCmNO7OObMjUfwi
   Avq4hRmz7ziDpI10R0ANlvTsO2TA+hfUHKHTa4qhCcfboycVPAbK5V33K
   ps0g1X7M/4Mq21ioerp6W+dwQRDTdDQ5EXpX24ld09CPpxC3hnZOGTA/F
   7H8sUqYOP5xUVlAfCB5z3ngfBOD37WNY4ywtDFJu8SRCgfxZBD/EREADi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348020623"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="348020623"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 17:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642689897"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="642689897"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 17:11:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq0qd-000gwu-3A;
	Sat, 22 Apr 2023 00:11:27 +0000
Date: Sat, 22 Apr 2023 08:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ufs/core/ufshcd.c:8519 ufshcd_setup_clocks() warn:
 'clki->clk' from clk_prepare_enable() not released on lines: 8499.
Message-ID: <202304220802.D7gEnvAv-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

Hi Bart,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drivers/scsi/ufs directory
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m031-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220802.D7gEnvAv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304220802.D7gEnvAv-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:8519 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 8499.

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5283 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5271)

vim +8519 drivers/ufs/core/ufshcd.c

6a771a656041f4 drivers/scsi/ufs/ufshcd.c Raviv Shvili       2014-09-25  8453  
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8454  static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8455  {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8456  	int ret = 0;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8457  	struct ufs_clk_info *clki;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8458  	struct list_head *head = &hba->clk_list_head;
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  8459  	unsigned long flags;
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8460  	ktime_t start = ktime_get();
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8461  	bool clk_state_changed = false;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8462  
566ec9ad315b46 drivers/scsi/ufs/ufshcd.c Szymon Mielczarek  2017-06-05  8463  	if (list_empty(head))
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8464  		goto out;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8465  
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8466  	ret = ufshcd_vops_setup_clocks(hba, on, PRE_CHANGE);
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8467  	if (ret)
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8468  		return ret;
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8469  
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8470  	list_for_each_entry(clki, head, list) {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8471  		if (!IS_ERR_OR_NULL(clki->clk)) {
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8472  			/*
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8473  			 * Don't disable clocks which are needed
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8474  			 * to keep the link active.
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8475  			 */
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8476  			if (ufshcd_is_link_active(hba) &&
81309c247a4dcd drivers/scsi/ufs/ufshcd.c Can Guo            2020-11-25  8477  			    clki->keep_link_active)
57d104c153d3d6 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2014-09-25  8478  				continue;
57d104c153d3d6 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2014-09-25  8479  
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8480  			clk_state_changed = on ^ clki->enabled;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8481  			if (on && !clki->enabled) {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8482  				ret = clk_prepare_enable(clki->clk);
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8483  				if (ret) {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8484  					dev_err(hba->dev, "%s: %s prepare enable failed, %d\n",
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8485  						__func__, clki->name, ret);
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8486  					goto out;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8487  				}
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8488  			} else if (!on && clki->enabled) {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8489  				clk_disable_unprepare(clki->clk);
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8490  			}
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8491  			clki->enabled = on;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8492  			dev_dbg(hba->dev, "%s: clk: %s %sabled\n", __func__,
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8493  					clki->name, on ? "en" : "dis");
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8494  		}
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8495  	}
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  8496  
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8497  	ret = ufshcd_vops_setup_clocks(hba, on, POST_CHANGE);
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8498  	if (ret)
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8499  		return ret;
1e879e8fa9f62e drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-10-06  8500  
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8501  out:
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8502  	if (ret) {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8503  		list_for_each_entry(clki, head, list) {
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8504  			if (!IS_ERR_OR_NULL(clki->clk) && clki->enabled)
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8505  				clk_disable_unprepare(clki->clk);
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8506  		}
7ff5ab47363334 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8507  	} else if (!ret && on) {
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  8508  		spin_lock_irqsave(hba->host->host_lock, flags);
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  8509  		hba->clk_gating.state = CLKS_ON;
7ff5ab47363334 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8510  		trace_ufshcd_clk_gating(dev_name(hba->dev),
7ff5ab47363334 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8511  					hba->clk_gating.state);
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  8512  		spin_unlock_irqrestore(hba->host->host_lock, flags);
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8513  	}
7ff5ab47363334 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8514  
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8515  	if (clk_state_changed)
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8516  		trace_ufshcd_profile_clk_gating(dev_name(hba->dev),
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8517  			(on ? "on" : "off"),
911a0771b6fa7b drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2016-12-22  8518  			ktime_to_us(ktime_sub(ktime_get(), start)), ret);
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25 @8519  	return ret;
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8520  }
c6e79dacd86fd7 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-09-25  8521  

:::::: The code at line 8519 was first introduced by commit
:::::: c6e79dacd86fd7ddd452fa52b3f4ca996db31e49 ufs: Add clock initialization support

:::::: TO: Sujit Reddy Thumma <sthumma@codeaurora.org>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
