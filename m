Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2469478
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 05:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759467931; cv=none; b=jALpnNhjsMPzna+f+PwpQGJStbSLJYVINp2elxh62IEHPZB1ysuB0Q45ad3LyRLIyXl5L3APiRTYyWg3hjw/sKk+hI738GjWqvJko3VQHeMzcvMsIQd1EOG0txwgwc/Y/mK/jgtLP2WT8N9bvTqkij6yq38y0rskArL4fjhlhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759467931; c=relaxed/simple;
	bh=pN59mnSQK1SV0FB9detxqqJ+miVvlMDGiKhF47W6QBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KO9bsCrYiaqA8BifyQfc2WhA5z1tcfhs6ZmZKhU8+B/jgCpivPkzYQdq4Wu7Hec+es19goOkOvS9S1eNCVXTxqaXUjZqY/YnX70FIdUOhu8EnHqiacqWuiy6C8eLkuefdNJwcXSC+Cg67QlERQxYQgeNxwyZlSbFHYCh/Jn42gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMnRHoZv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMnRHoZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759467931; x=1791003931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pN59mnSQK1SV0FB9detxqqJ+miVvlMDGiKhF47W6QBY=;
  b=LMnRHoZvcJmsfxfSfgU0Z/8VEruLkwY8+TZhTL3/0IVJe/dRDDWS3NkB
   T2R/8H+V+r2EUkECu16pc18OLQh6XXyNfqfyyii8KVSWFVlClbnijjm0A
   5Zy+6rrS7P7e3KFhyKHHPFOWBheYlNssMynNFxCQon4p2kI803+ZSL0wH
   c7Nkul8nWbw1gll+VSN5fcQAwxLhngTvjs7X2U9Bl7iLWS49E3dV+CwKm
   jhp/2nUy8WJ6c7u8VoOHwiY3B0ZXsguN3jlf77IWjq+cRSUk2tKOVr11y
   SQF4nv3YIS1UzzIfTuAmqvU6CJ3Ns3B1vQnOhgpYjuRWIMnWW4om9tEUL
   Q==;
X-CSE-ConnectionGUID: eo+AuSpGTnaugtXwD8lvIA==
X-CSE-MsgGUID: YorIpoDgS2K49PZpABA/Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61715434"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61715434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 22:05:30 -0700
X-CSE-ConnectionGUID: CLPpqDHAQfWhavJdJ9kxkQ==
X-CSE-MsgGUID: wV6z5Vp8TgSjBmRNMdqr7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="179021549"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2025 22:05:28 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4Xyv-0004Jv-2q;
	Fri, 03 Oct 2025 05:05:25 +0000
Date: Fri, 3 Oct 2025 13:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 11/16] scsi: qla2xxx: fix TMR failure handling
Message-ID: <202510031227.18psESZQ-lkp@intel.com>
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
In-Reply-To: <f52cda16-4952-4b28-bbf7-d44f4e054490@cybernetics.com>
References: <f52cda16-4952-4b28-bbf7-d44f4e054490@cybernetics.com>
TO: Tony Battersby <tonyb@cybernetics.com>
TO: Nilesh Javali <njavali@marvell.com>
TO: GR-QLogic-Storage-Upstream@marvell.com
TO: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
TO: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: "linux-scsi" <linux-scsi@vger.kernel.org>
CC: target-devel@vger.kernel.org
CC: scst-devel@lists.sourceforge.net
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Dmitry Bogdanov <d.bogdanov@yadro.com>
CC: Xose Vazquez Perez <xose.vazquez@gmail.com>

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e5f0a698b34ed76002dc5cff3804a61c80233a7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Battersby/Revert-scsi-qla2xxx-Perform-lockless-command-completion-in-abort-path/20250930-024814
base:   e5f0a698b34ed76002dc5cff3804a61c80233a7a
patch link:    https://lore.kernel.org/r/f52cda16-4952-4b28-bbf7-d44f4e054490%40cybernetics.com
patch subject: [PATCH v2 11/16] scsi: qla2xxx: fix TMR failure handling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20251002 (https://download.01.org/0day-ci/archive/20251003/202510031227.18psESZQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510031227.18psESZQ-lkp@intel.com/

New smatch warnings:
drivers/scsi/qla2xxx/qla_target.c:5735 qlt_handle_abts_completion() error: we previously assumed 'mcmd' could be null (see line 5723)

Old smatch warnings:
drivers/scsi/qla2xxx/qla_target.c:671 qla24xx_delete_sess_fn() warn: can 'fcport' even be NULL?

vim +/mcmd +5735 drivers/scsi/qla2xxx/qla_target.c

0691094ff3f2cfa Quinn Tran      2018-09-04  5704  
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5705  
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5706  static void qlt_handle_abts_completion(struct scsi_qla_host *vha,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5707  	struct rsp_que *rsp, response_t *pkt)
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5708  {
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5709  	struct abts_resp_from_24xx_fw *entry =
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5710  		(struct abts_resp_from_24xx_fw *)pkt;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5711  	u32 h = pkt->handle & ~QLA_TGT_HANDLE_MASK;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5712  	struct qla_tgt_mgmt_cmd *mcmd;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5713  	struct qla_hw_data *ha = vha->hw;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5714  
81bcf1c5cf0ee87 Bart Van Assche 2019-04-11  5715  	mcmd = qlt_ctio_to_cmd(vha, rsp, pkt->handle, pkt);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5716  	if (mcmd == NULL && h != QLA_TGT_SKIP_HANDLE) {
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5717  		ql_dbg(ql_dbg_async, vha, 0xe064,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5718  		    "qla_target(%d): ABTS Comp without mcmd\n",
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5719  		    vha->vp_idx);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5720  		return;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5721  	}
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5722  
6b0431d6fa20bd1 Quinn Tran      2018-09-04 @5723  	if (mcmd)
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5724  		vha  = mcmd->vha;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5725  	vha->vha_tgt.qla_tgt->abts_resp_expected--;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5726  
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5727  	ql_dbg(ql_dbg_tgt, vha, 0xe038,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5728  	    "ABTS_RESP_24XX: compl_status %x\n",
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5729  	    entry->compl_status);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5730  
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5731  	if (le16_to_cpu(entry->compl_status) != ABTS_RESP_COMPL_SUCCESS) {
7ffa5b939751b66 Bart Van Assche 2020-05-18  5732  		if (le32_to_cpu(entry->error_subcode1) == 0x1E &&
7ffa5b939751b66 Bart Van Assche 2020-05-18  5733  		    le32_to_cpu(entry->error_subcode2) == 0) {
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5734  			if (qlt_chk_unresolv_exchg(vha, rsp->qpair, entry)) {
74dabbbd8bb833e Tony Battersby  2025-09-29 @5735  				qlt_free_ul_mcmd(ha, mcmd);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5736  				return;
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5737  			}
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5738  			qlt_24xx_retry_term_exchange(vha, rsp->qpair,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5739  			    pkt, mcmd);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5740  		} else {
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5741  			ql_dbg(ql_dbg_tgt, vha, 0xe063,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5742  			    "qla_target(%d): ABTS_RESP_24XX failed %x (subcode %x:%x)",
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5743  			    vha->vp_idx, entry->compl_status,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5744  			    entry->error_subcode1,
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5745  			    entry->error_subcode2);
74dabbbd8bb833e Tony Battersby  2025-09-29  5746  			qlt_free_ul_mcmd(ha, mcmd);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5747  		}
e752a04e1bd14cc Bart Van Assche 2019-08-08  5748  	} else if (mcmd) {
74dabbbd8bb833e Tony Battersby  2025-09-29  5749  		qlt_free_ul_mcmd(ha, mcmd);
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5750  	}
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5751  }
6b0431d6fa20bd1 Quinn Tran      2018-09-04  5752  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
