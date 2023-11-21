Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8938DEA
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 22:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKyaKyr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700607143; x=1732143143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55Mnj+ccKVk64eSTLn0Wep+QK/qcGE9LpYJ91/lvxAc=;
  b=eKyaKyr/yxGNH72sEQDuO6TZG+hymlI+LwVD4mj8lx36SVI+gu6h+J/2
   bnH+0XGiK0Jwm4qEoS0PPRAOedCQ3q4aBZOpqKE8uZZLQXKSNN+zf6Lhr
   haca2r3SwOTb4fDgM1k13RhD7iuRw29bTm+gk6uWQ71zSxAX/cbGW6xJ6
   j8m3eBFgFwsC5FE2+4uIWsLLY6JS9N1htJplX26bRqD4uaQ53IeNwUK7K
   dZq90k40chkjRHPykRcKYvyvs7i1vnblk8pHlp45OZ1gM/D82gPAOFEBf
   icoLjs7b/7/2Lbh/2HBVBORS50/Nrc9Vf+/ApqJRwA2OaQzAAAdXG/iR6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="371290742"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="371290742"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 14:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="837191864"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="837191864"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Nov 2023 14:52:20 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5ZbO-0008Mw-1t;
	Tue, 21 Nov 2023 22:52:18 +0000
Date: Wed, 22 Nov 2023 06:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] scsi: ufs: core: fix racing issue during
 ufshcd_mcq_abort
Message-ID: <202311220618.OnEhSic6-lkp@intel.com>
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
In-Reply-To: <20231121071128.7743-1-hy50.seo@samsung.com>
References: <20231121071128.7743-1-hy50.seo@samsung.com>
TO: SEO HOYOUNG <hy50.seo@samsung.com>
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: alim.akhtar@samsung.com
TO: avri.altman@wdc.com
TO: jejb@linux.ibm.com
TO: martin.petersen@oracle.com
TO: beanhuo@micron.com
TO: bvanassche@acm.org
TO: kwangwon.min@samsung.com
TO: kwmad.kim@samsung.com
TO: sh425.lee@samsung.com
TO: sc.suh@samsung.com
TO: quic_nguyenb@quicinc.com
TO: cpgs@samsung.com
TO: grant.jung@samsung.com
TO: junwoo80.lee@samsung.com
CC: SEO HOYOUNG <hy50.seo@samsung.com>

Hi SEO,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/SEO-HOYOUNG/scsi-ufs-core-fix-racing-issue-during-ufshcd_mcq_abort/20231121-151923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231121071128.7743-1-hy50.seo%40samsung.com
patch subject: [PATCH v3] scsi: ufs: core: fix racing issue during ufshcd_mcq_abort
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220618.OnEhSic6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220618.OnEhSic6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311220618.OnEhSic6-lkp@intel.com/

smatch warnings:
drivers/ufs/core/ufs-mcq.c:515 ufshcd_mcq_sq_cleanup() warn: variable dereferenced before check 'cmd' (see line 511)

vim +/cmd +515 drivers/ufs/core/ufs-mcq.c

8d7290348992f2 Bao D. Nguyen   2023-05-29  489  
8d7290348992f2 Bao D. Nguyen   2023-05-29  490  /**
8d7290348992f2 Bao D. Nguyen   2023-05-29  491   * ufshcd_mcq_sq_cleanup - Clean up submission queue resources
8d7290348992f2 Bao D. Nguyen   2023-05-29  492   * associated with the pending command.
317a38045ab763 Yang Li         2023-07-12  493   * @hba: per adapter instance.
317a38045ab763 Yang Li         2023-07-12  494   * @task_tag: The command's task tag.
8d7290348992f2 Bao D. Nguyen   2023-05-29  495   *
3a17fefe0f1960 Bart Van Assche 2023-07-27  496   * Return: 0 for success; error code otherwise.
8d7290348992f2 Bao D. Nguyen   2023-05-29  497   */
8d7290348992f2 Bao D. Nguyen   2023-05-29  498  int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
8d7290348992f2 Bao D. Nguyen   2023-05-29  499  {
8d7290348992f2 Bao D. Nguyen   2023-05-29  500  	struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
8d7290348992f2 Bao D. Nguyen   2023-05-29  501  	struct scsi_cmnd *cmd = lrbp->cmd;
8d7290348992f2 Bao D. Nguyen   2023-05-29  502  	struct ufs_hw_queue *hwq;
8d7290348992f2 Bao D. Nguyen   2023-05-29  503  	void __iomem *reg, *opr_sqd_base;
8d7290348992f2 Bao D. Nguyen   2023-05-29  504  	u32 nexus, id, val;
8d7290348992f2 Bao D. Nguyen   2023-05-29  505  	int err;
8d7290348992f2 Bao D. Nguyen   2023-05-29  506  
aa9d5d0015a8b7 Po-Wen Kao      2023-06-12  507  	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_RTC)
aa9d5d0015a8b7 Po-Wen Kao      2023-06-12  508  		return -ETIMEDOUT;
aa9d5d0015a8b7 Po-Wen Kao      2023-06-12  509  
5363c9d813101c SEO HOYOUNG     2023-11-21  510  	if (!ufshcd_cmd_inflight(cmd) ||
5363c9d813101c SEO HOYOUNG     2023-11-21 @511  	    test_bit(SCMD_STATE_COMPLETE, &cmd->state))
5363c9d813101c SEO HOYOUNG     2023-11-21  512  		return 0;
5363c9d813101c SEO HOYOUNG     2023-11-21  513  
8d7290348992f2 Bao D. Nguyen   2023-05-29  514  	if (task_tag != hba->nutrs - UFSHCD_NUM_RESERVED) {
8d7290348992f2 Bao D. Nguyen   2023-05-29 @515  		if (!cmd)
8d7290348992f2 Bao D. Nguyen   2023-05-29  516  			return -EINVAL;
8d7290348992f2 Bao D. Nguyen   2023-05-29  517  		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
8d7290348992f2 Bao D. Nguyen   2023-05-29  518  	} else {
8d7290348992f2 Bao D. Nguyen   2023-05-29  519  		hwq = hba->dev_cmd_queue;
8d7290348992f2 Bao D. Nguyen   2023-05-29  520  	}
8d7290348992f2 Bao D. Nguyen   2023-05-29  521  
8d7290348992f2 Bao D. Nguyen   2023-05-29  522  	id = hwq->id;
8d7290348992f2 Bao D. Nguyen   2023-05-29  523  
8d7290348992f2 Bao D. Nguyen   2023-05-29  524  	mutex_lock(&hwq->sq_mutex);
8d7290348992f2 Bao D. Nguyen   2023-05-29  525  
8d7290348992f2 Bao D. Nguyen   2023-05-29  526  	/* stop the SQ fetching before working on it */
8d7290348992f2 Bao D. Nguyen   2023-05-29  527  	err = ufshcd_mcq_sq_stop(hba, hwq);
8d7290348992f2 Bao D. Nguyen   2023-05-29  528  	if (err)
8d7290348992f2 Bao D. Nguyen   2023-05-29  529  		goto unlock;
8d7290348992f2 Bao D. Nguyen   2023-05-29  530  
8d7290348992f2 Bao D. Nguyen   2023-05-29  531  	/* SQCTI = EXT_IID, IID, LUN, Task Tag */
8d7290348992f2 Bao D. Nguyen   2023-05-29  532  	nexus = lrbp->lun << 8 | task_tag;
8d7290348992f2 Bao D. Nguyen   2023-05-29  533  	opr_sqd_base = mcq_opr_base(hba, OPR_SQD, id);
8d7290348992f2 Bao D. Nguyen   2023-05-29  534  	writel(nexus, opr_sqd_base + REG_SQCTI);
8d7290348992f2 Bao D. Nguyen   2023-05-29  535  
8d7290348992f2 Bao D. Nguyen   2023-05-29  536  	/* SQRTCy.ICU = 1 */
8d7290348992f2 Bao D. Nguyen   2023-05-29  537  	writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
8d7290348992f2 Bao D. Nguyen   2023-05-29  538  
8d7290348992f2 Bao D. Nguyen   2023-05-29  539  	/* Poll SQRTSy.CUS = 1. Return result from SQRTSy.RTC */
8d7290348992f2 Bao D. Nguyen   2023-05-29  540  	reg = opr_sqd_base + REG_SQRTS;
8d7290348992f2 Bao D. Nguyen   2023-05-29  541  	err = read_poll_timeout(readl, val, val & SQ_CUS, 20,
8d7290348992f2 Bao D. Nguyen   2023-05-29  542  				MCQ_POLL_US, false, reg);
8d7290348992f2 Bao D. Nguyen   2023-05-29  543  	if (err)
8d7290348992f2 Bao D. Nguyen   2023-05-29  544  		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%ld\n",
8d7290348992f2 Bao D. Nguyen   2023-05-29  545  			__func__, id, task_tag,
8d7290348992f2 Bao D. Nguyen   2023-05-29  546  			FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)));
8d7290348992f2 Bao D. Nguyen   2023-05-29  547  
8d7290348992f2 Bao D. Nguyen   2023-05-29  548  	if (ufshcd_mcq_sq_start(hba, hwq))
8d7290348992f2 Bao D. Nguyen   2023-05-29  549  		err = -ETIMEDOUT;
8d7290348992f2 Bao D. Nguyen   2023-05-29  550  
8d7290348992f2 Bao D. Nguyen   2023-05-29  551  unlock:
8d7290348992f2 Bao D. Nguyen   2023-05-29  552  	mutex_unlock(&hwq->sq_mutex);
8d7290348992f2 Bao D. Nguyen   2023-05-29  553  	return err;
8d7290348992f2 Bao D. Nguyen   2023-05-29  554  }
8d7290348992f2 Bao D. Nguyen   2023-05-29  555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
