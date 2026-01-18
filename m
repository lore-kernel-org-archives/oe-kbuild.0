Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5B2E6CDB
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768747381; cv=none; b=NxGWHulMTzc5uOSj9c3MEeH/v4vCFEzvcfptGhWQ6v3gjkKyEPTfFo2YvhYmwOHU+nrVLwqKfFTxD/lldRCJeCng5LyLC/TDpyNhalWNKtt5ZPRVhjX/064rDGqHpH6HBLFb6nVUY0/8CbDI2Jjmqk4eEAh3C0eaH0TpilVJbiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768747381; c=relaxed/simple;
	bh=HpevmUw9Xj3hkcGY81ZdX+fR0QFwjcB5udK/mOGrLy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CvHsMmTRBcHiTe78pz7R0vVfM7J6SHXRwbfvyR2T8REQ6Oz9ci7vnOwgkPjwK1TEEfw0KyWwKs4JbrN2QCiQYZ6WbaKvWCULem5KkrrU3/okyHyc34xsGekPtl//f8FkL90iuuog22MPNZ8l5Dy5fbgFoObpJnwdD2bDeQPbro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzIhkxuz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzIhkxuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768747378; x=1800283378;
  h=date:from:to:cc:subject:message-id;
  bh=HpevmUw9Xj3hkcGY81ZdX+fR0QFwjcB5udK/mOGrLy8=;
  b=gzIhkxuz+tRiY7j/HfXOZpk7GaK207HMATsRfobaK9mt4W9MDMuy5LzI
   sS6TF1eQFqIoSIZyzhIfKadcdqum83pH1TDl3OyFPTfAHhMjTmw5/fgIB
   zqwX0o0UEApDxRx+qK2yIv1nwtpIN1R8GwH7sb6vcBP0EIJg1yluAMN02
   OtK6LOwW8r1eoxKQij4q1x+naw8Tx1RUitbI8MKxej1fMKy3U8daxPLPZ
   HEU3z+Kq3Fj5h6NApQUJ9bcwc5j7hqdO6G0oPAjf6j6xImE2GVN7KZIVh
   H+lgUPOHB7ZGaaNFruJuYEIrgyTvfp/vh2iZ8BHiTsC3wtSwGbrjPWnPA
   w==;
X-CSE-ConnectionGUID: S0fwclhNTeKtQGdgBRLvqg==
X-CSE-MsgGUID: N5bhXXqhTR+Yi4IWQxxV+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="57534150"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="57534150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 06:42:57 -0800
X-CSE-ConnectionGUID: zY84KIYhTyalsx9tAACCkg==
X-CSE-MsgGUID: JcmLEBLdQwywPSP8sp0pDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210517325"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jan 2026 06:42:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhTzS-00000000N0y-0ilW;
	Sun, 18 Jan 2026 14:42:54 +0000
Date: Sun, 18 Jan 2026 22:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 196/196]
 drivers/scsi/ufs/ufshcd.c:8205 ufshcd_setup_clocks() warn: 'clki->clk' from
 clk_prepare_enable() not released on lines: 8185.
Message-ID: <202601182204.1ZIlztaF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 3b80f9485daa1dd10b22fa7dbaeff6d7d599e317 [196/196] BACKPORT: scsi: ufs: Refactor ufshcd_setup_clocks() to remove skip_ref_clk
:::::: branch date: 5 days ago
:::::: commit date: 4 years, 8 months ago
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260118/202601182204.1ZIlztaF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601182204.1ZIlztaF-lkp@intel.com/

New smatch warnings:
drivers/scsi/ufs/ufshcd.c:8205 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 8185.

Old smatch warnings:
drivers/scsi/ufs/ufshcd.c:5015 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5003)
drivers/scsi/ufs/ufshcd.c:8375 ufshcd_send_request_sense() warn: sizeof(NUMBER)?
drivers/scsi/ufs/ufshcd.c:8436 ufshcd_set_dev_pwr_mode() warn: sizeof(NUMBER)?
drivers/scsi/ufs/ufshcd.c:8952 ufshcd_system_resume() warn: address of NULL pointer 'hba'

vim +8205 drivers/scsi/ufs/ufshcd.c

6a771a656041f40 Raviv Shvili       2014-09-25  8139  
3b80f9485daa1dd Can Guo            2020-11-25  8140  static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8141  {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8142  	int ret = 0;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8143  	struct ufs_clk_info *clki;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8144  	struct list_head *head = &hba->clk_list_head;
1ab27c9cf8b63dd Sahitya Tummala    2014-09-25  8145  	unsigned long flags;
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8146  	ktime_t start = ktime_get();
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8147  	bool clk_state_changed = false;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8148  
566ec9ad315b46e Szymon Mielczarek  2017-06-05  8149  	if (list_empty(head))
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8150  		goto out;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8151  
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8152  	ret = ufshcd_vops_setup_clocks(hba, on, PRE_CHANGE);
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8153  	if (ret)
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8154  		return ret;
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8155  
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8156  	list_for_each_entry(clki, head, list) {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8157  		if (!IS_ERR_OR_NULL(clki->clk)) {
3b80f9485daa1dd Can Guo            2020-11-25  8158  			/*
3b80f9485daa1dd Can Guo            2020-11-25  8159  			 * Don't disable clocks which are needed
3b80f9485daa1dd Can Guo            2020-11-25  8160  			 * to keep the link active.
3b80f9485daa1dd Can Guo            2020-11-25  8161  			 */
3b80f9485daa1dd Can Guo            2020-11-25  8162  			if (ufshcd_is_link_active(hba) &&
3b80f9485daa1dd Can Guo            2020-11-25  8163  			    clki->keep_link_active)
57d104c153d3d6d Subhash Jadavani   2014-09-25  8164  				continue;
57d104c153d3d6d Subhash Jadavani   2014-09-25  8165  
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8166  			clk_state_changed = on ^ clki->enabled;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8167  			if (on && !clki->enabled) {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8168  				ret = clk_prepare_enable(clki->clk);
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8169  				if (ret) {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8170  					dev_err(hba->dev, "%s: %s prepare enable failed, %d\n",
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8171  						__func__, clki->name, ret);
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8172  					goto out;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8173  				}
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8174  			} else if (!on && clki->enabled) {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8175  				clk_disable_unprepare(clki->clk);
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8176  			}
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8177  			clki->enabled = on;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8178  			dev_dbg(hba->dev, "%s: clk: %s %sabled\n", __func__,
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8179  					clki->name, on ? "en" : "dis");
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8180  		}
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8181  	}
1ab27c9cf8b63dd Sahitya Tummala    2014-09-25  8182  
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8183  	ret = ufshcd_vops_setup_clocks(hba, on, POST_CHANGE);
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8184  	if (ret)
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8185  		return ret;
1e879e8fa9f62e1 Subhash Jadavani   2016-10-06  8186  
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8187  out:
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8188  	if (ret) {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8189  		list_for_each_entry(clki, head, list) {
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8190  			if (!IS_ERR_OR_NULL(clki->clk) && clki->enabled)
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8191  				clk_disable_unprepare(clki->clk);
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8192  		}
7ff5ab473633343 Subhash Jadavani   2016-12-22  8193  	} else if (!ret && on) {
1ab27c9cf8b63dd Sahitya Tummala    2014-09-25  8194  		spin_lock_irqsave(hba->host->host_lock, flags);
1ab27c9cf8b63dd Sahitya Tummala    2014-09-25  8195  		hba->clk_gating.state = CLKS_ON;
7ff5ab473633343 Subhash Jadavani   2016-12-22  8196  		trace_ufshcd_clk_gating(dev_name(hba->dev),
7ff5ab473633343 Subhash Jadavani   2016-12-22  8197  					hba->clk_gating.state);
1ab27c9cf8b63dd Sahitya Tummala    2014-09-25  8198  		spin_unlock_irqrestore(hba->host->host_lock, flags);
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8199  	}
7ff5ab473633343 Subhash Jadavani   2016-12-22  8200  
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8201  	if (clk_state_changed)
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8202  		trace_ufshcd_profile_clk_gating(dev_name(hba->dev),
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8203  			(on ? "on" : "off"),
911a0771b6fa7ba Subhash Jadavani   2016-12-22  8204  			ktime_to_us(ktime_sub(ktime_get(), start)), ret);
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25 @8205  	return ret;
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8206  }
c6e79dacd86fd7d Sujit Reddy Thumma 2014-09-25  8207  

:::::: The code at line 8205 was first introduced by commit
:::::: c6e79dacd86fd7ddd452fa52b3f4ca996db31e49 ufs: Add clock initialization support

:::::: TO: Sujit Reddy Thumma <sthumma@codeaurora.org>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
