Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3C018E
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Aug 2023 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692145336; x=1723681336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEdMQkf2s+dPlYnNRbr4SeyX9A9Bt2sNfOkRSGIWTkQ=;
  b=hIT6L98ooaRUAy9G9VUSI2qcGRdzMBsEJG1oOdzlm871FO4wbOO9QmOY
   hqLUt6CbEET7EpCUIOzv5k8ExaSBYhch+FIoUetJXWug9QKD1Pf1b6eso
   b+Q6ZrXmoxVSQwNOHQI/CUTyKdsyK65i/iRUOtd/ySALLi/7PckXbm3p/
   7ec4Yf3SVO7gVHxoSYTInsGXGX/fek3fdKNbyl4g2EUcAHVd7JdyjDnnZ
   TMMvKMptpnf5qnlwuNK7utFrBGeTsXYbWJDxXr/jRN1Dc8yPUhuN9Byno
   r8c7Le6ym4Tv9wp/YEuYGkSZKMAQML7JDHPMQfpFJJ0MhjhnXbnA9VCNg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="369880487"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="369880487"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 17:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803999308"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="803999308"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 17:22:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW4If-0001LP-2r;
	Wed, 16 Aug 2023 00:22:13 +0000
Date: Wed, 16 Aug 2023 08:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 6/9] scsi:scsi_debug: set command's result and sense
 data if the error is injected
Message-ID: <202308160814.BSq8jid1-lkp@intel.com>
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
In-Reply-To: <20230815122316.4129333-7-haowenchao2@huawei.com>
References: <20230815122316.4129333-7-haowenchao2@huawei.com>
TO: Wenchao Hao <haowenchao2@huawei.com>
TO: "James E . J . Bottomley" <jejb@linux.ibm.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Douglas Gilbert <dgilbert@interlog.com>
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: louhongxiang@huawei.com
CC: Wenchao Hao <haowenchao2@huawei.com>

Hi Wenchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.5-rc6 next-20230815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/scsi-scsi_debug-create-scsi_debug-directory-in-the-debugfs-filesystem/20230815-202502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230815122316.4129333-7-haowenchao2%40huawei.com
patch subject: [PATCH v4 6/9] scsi:scsi_debug: set command's result and sense data if the error is injected
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20230815 (https://download.01.org/0day-ci/archive/20230816/202308160814.BSq8jid1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160814.BSq8jid1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308160814.BSq8jid1-lkp@intel.com/

smatch warnings:
drivers/scsi/scsi_debug.c:7889 scsi_debug_queuecommand() warn: missing error code? 'ret'

vim +/ret +7889 drivers/scsi/scsi_debug.c

f1a3fd21f6b815 Wenchao Hao     2023-08-15  7808  
fd32119b0deac1 Douglas Gilbert 2016-04-25  7809  static int scsi_debug_queuecommand(struct Scsi_Host *shost,
fd32119b0deac1 Douglas Gilbert 2016-04-25  7810  				   struct scsi_cmnd *scp)
c2248fc974df7b Douglas Gilbert 2014-11-24  7811  {
c2248fc974df7b Douglas Gilbert 2014-11-24  7812  	u8 sdeb_i;
c2248fc974df7b Douglas Gilbert 2014-11-24  7813  	struct scsi_device *sdp = scp->device;
c2248fc974df7b Douglas Gilbert 2014-11-24  7814  	const struct opcode_info_t *oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7815  	const struct opcode_info_t *r_oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7816  	struct sdebug_dev_info *devip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7817  	u8 *cmd = scp->cmnd;
c2248fc974df7b Douglas Gilbert 2014-11-24  7818  	int (*r_pfp)(struct scsi_cmnd *, struct sdebug_dev_info *);
f66b85171a0ebd Martin Wilck    2018-02-14  7819  	int (*pfp)(struct scsi_cmnd *, struct sdebug_dev_info *) = NULL;
c2248fc974df7b Douglas Gilbert 2014-11-24  7820  	int k, na;
c2248fc974df7b Douglas Gilbert 2014-11-24  7821  	int errsts = 0;
ad0c7775e745d2 Douglas Gilbert 2020-08-21  7822  	u64 lun_index = sdp->lun & 0x3FFF;
c2248fc974df7b Douglas Gilbert 2014-11-24  7823  	u32 flags;
c2248fc974df7b Douglas Gilbert 2014-11-24  7824  	u16 sa;
c2248fc974df7b Douglas Gilbert 2014-11-24  7825  	u8 opcode = cmd[0];
c2248fc974df7b Douglas Gilbert 2014-11-24  7826  	bool has_wlun_rl;
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7827  	bool inject_now;
991375842dc6e2 Wenchao Hao     2023-08-15  7828  	int ret = 0;
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7829  	struct sdebug_err_inject err;
c2248fc974df7b Douglas Gilbert 2014-11-24  7830  
c2248fc974df7b Douglas Gilbert 2014-11-24  7831  	scsi_set_resid(scp, 0);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7832  	if (sdebug_statistics) {
c483739430f107 Douglas Gilbert 2016-05-06  7833  		atomic_inc(&sdebug_cmnd_count);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7834  		inject_now = inject_on_this_cmd();
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7835  	} else {
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7836  		inject_now = false;
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7837  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7838  	if (unlikely(sdebug_verbose &&
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7839  		     !(SDEBUG_OPT_NO_CDB_NOISE & sdebug_opts))) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7840  		char b[120];
c2248fc974df7b Douglas Gilbert 2014-11-24  7841  		int n, len, sb;
c2248fc974df7b Douglas Gilbert 2014-11-24  7842  
c2248fc974df7b Douglas Gilbert 2014-11-24  7843  		len = scp->cmd_len;
c2248fc974df7b Douglas Gilbert 2014-11-24  7844  		sb = (int)sizeof(b);
c2248fc974df7b Douglas Gilbert 2014-11-24  7845  		if (len > 32)
c2248fc974df7b Douglas Gilbert 2014-11-24  7846  			strcpy(b, "too long, over 32 bytes");
c2248fc974df7b Douglas Gilbert 2014-11-24  7847  		else {
c2248fc974df7b Douglas Gilbert 2014-11-24  7848  			for (k = 0, n = 0; k < len && n < sb; ++k)
c2248fc974df7b Douglas Gilbert 2014-11-24  7849  				n += scnprintf(b + n, sb - n, "%02x ",
c2248fc974df7b Douglas Gilbert 2014-11-24  7850  					       (u32)cmd[k]);
c2248fc974df7b Douglas Gilbert 2014-11-24  7851  		}
458df78b1c513d Bart Van Assche 2018-01-26  7852  		sdev_printk(KERN_INFO, sdp, "%s: tag=%#x, cmd %s\n", my_name,
a6e76e6f2c0efd Bart Van Assche 2021-08-09  7853  			    blk_mq_unique_tag(scsi_cmd_to_rq(scp)), b);
c2248fc974df7b Douglas Gilbert 2014-11-24  7854  	}
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7855  	if (unlikely(inject_now && (sdebug_opts & SDEBUG_OPT_HOST_BUSY)))
7ee6d1b4357ac2 Bart Van Assche 2017-12-07  7856  		return SCSI_MLQUEUE_HOST_BUSY;
34d55434ba1f39 Tomas Winkler   2015-07-28  7857  	has_wlun_rl = (sdp->lun == SCSI_W_LUN_REPORT_LUNS);
ad0c7775e745d2 Douglas Gilbert 2020-08-21  7858  	if (unlikely(lun_index >= sdebug_max_luns && !has_wlun_rl))
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7859  		goto err_out;
c2248fc974df7b Douglas Gilbert 2014-11-24  7860  
c2248fc974df7b Douglas Gilbert 2014-11-24  7861  	sdeb_i = opcode_ind_arr[opcode];	/* fully mapped */
c2248fc974df7b Douglas Gilbert 2014-11-24  7862  	oip = &opcode_info_arr[sdeb_i];		/* safe if table consistent */
c2248fc974df7b Douglas Gilbert 2014-11-24  7863  	devip = (struct sdebug_dev_info *)sdp->hostdata;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7864  	if (unlikely(!devip)) {
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7865  		devip = find_build_dev_info(sdp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7866  		if (NULL == devip)
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7867  			goto err_out;
c2248fc974df7b Douglas Gilbert 2014-11-24  7868  	}
2aabba0bbfb5c0 Wenchao Hao     2023-08-15  7869  
2aabba0bbfb5c0 Wenchao Hao     2023-08-15  7870  	if (sdebug_timeout_cmd(scp)) {
2aabba0bbfb5c0 Wenchao Hao     2023-08-15  7871  		scmd_printk(KERN_INFO, scp, "timeout command 0x%x\n", opcode);
2aabba0bbfb5c0 Wenchao Hao     2023-08-15  7872  		return 0;
2aabba0bbfb5c0 Wenchao Hao     2023-08-15  7873  	}
2aabba0bbfb5c0 Wenchao Hao     2023-08-15  7874  
991375842dc6e2 Wenchao Hao     2023-08-15  7875  	ret = sdebug_fail_queue_cmd(scp);
991375842dc6e2 Wenchao Hao     2023-08-15  7876  	if (ret) {
991375842dc6e2 Wenchao Hao     2023-08-15  7877  		scmd_printk(KERN_INFO, scp, "fail queue command 0x%x with 0x%x\n",
991375842dc6e2 Wenchao Hao     2023-08-15  7878  				opcode, ret);
991375842dc6e2 Wenchao Hao     2023-08-15  7879  		return ret;
991375842dc6e2 Wenchao Hao     2023-08-15  7880  	}
991375842dc6e2 Wenchao Hao     2023-08-15  7881  
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7882  	if (sdebug_fail_cmd(scp, &ret, &err)) {
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7883  		scmd_printk(KERN_INFO, scp,
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7884  			"fail command 0x%x with hostbyte=0x%x, "
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7885  			"driverbyte=0x%x, statusbyte=0x%x, "
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7886  			"sense_key=0x%x, asc=0x%x, asq=0x%x\n",
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7887  			opcode, err.host_byte, err.driver_byte,
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7888  			err.status_byte, err.sense_key, err.asc, err.asq);
f1a3fd21f6b815 Wenchao Hao     2023-08-15 @7889  		return ret;
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7890  	}
f1a3fd21f6b815 Wenchao Hao     2023-08-15  7891  
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7892  	if (unlikely(inject_now && !atomic_read(&sdeb_inject_pending)))
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7893  		atomic_set(&sdeb_inject_pending, 1);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7894  
c2248fc974df7b Douglas Gilbert 2014-11-24  7895  	na = oip->num_attached;
c2248fc974df7b Douglas Gilbert 2014-11-24  7896  	r_pfp = oip->pfp;
c2248fc974df7b Douglas Gilbert 2014-11-24  7897  	if (na) {	/* multiple commands with this opcode */
c2248fc974df7b Douglas Gilbert 2014-11-24  7898  		r_oip = oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7899  		if (FF_SA & r_oip->flags) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7900  			if (F_SA_LOW & oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7901  				sa = 0x1f & cmd[1];
c2248fc974df7b Douglas Gilbert 2014-11-24  7902  			else
c2248fc974df7b Douglas Gilbert 2014-11-24  7903  				sa = get_unaligned_be16(cmd + 8);
c2248fc974df7b Douglas Gilbert 2014-11-24  7904  			for (k = 0; k <= na; oip = r_oip->arrp + k++) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7905  				if (opcode == oip->opcode && sa == oip->sa)
c2248fc974df7b Douglas Gilbert 2014-11-24  7906  					break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7907  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7908  		} else {   /* since no service action only check opcode */
c2248fc974df7b Douglas Gilbert 2014-11-24  7909  			for (k = 0; k <= na; oip = r_oip->arrp + k++) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7910  				if (opcode == oip->opcode)
c2248fc974df7b Douglas Gilbert 2014-11-24  7911  					break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7912  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7913  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7914  		if (k > na) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7915  			if (F_SA_LOW & r_oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7916  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 1, 4);
c2248fc974df7b Douglas Gilbert 2014-11-24  7917  			else if (F_SA_HIGH & r_oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7918  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 8, 7);
c2248fc974df7b Douglas Gilbert 2014-11-24  7919  			else
c2248fc974df7b Douglas Gilbert 2014-11-24  7920  				mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7921  			goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7922  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7923  	}	/* else (when na==0) we assume the oip is a match */
c2248fc974df7b Douglas Gilbert 2014-11-24  7924  	flags = oip->flags;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7925  	if (unlikely(F_INV_OP & flags)) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7926  		mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7927  		goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7928  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7929  	if (unlikely(has_wlun_rl && !(F_RL_WLUN_OK & flags))) {
773642d95b8220 Douglas Gilbert 2016-04-25  7930  		if (sdebug_verbose)
773642d95b8220 Douglas Gilbert 2016-04-25  7931  			sdev_printk(KERN_INFO, sdp, "%s: Opcode 0x%x not%s\n",
773642d95b8220 Douglas Gilbert 2016-04-25  7932  				    my_name, opcode, " supported for wlun");
c2248fc974df7b Douglas Gilbert 2014-11-24  7933  		mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7934  		goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7935  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7936  	if (unlikely(sdebug_strict)) {	/* check cdb against mask */
c2248fc974df7b Douglas Gilbert 2014-11-24  7937  		u8 rem;
c2248fc974df7b Douglas Gilbert 2014-11-24  7938  		int j;
c2248fc974df7b Douglas Gilbert 2014-11-24  7939  
c2248fc974df7b Douglas Gilbert 2014-11-24  7940  		for (k = 1; k < oip->len_mask[0] && k < 16; ++k) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7941  			rem = ~oip->len_mask[k] & cmd[k];
c2248fc974df7b Douglas Gilbert 2014-11-24  7942  			if (rem) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7943  				for (j = 7; j >= 0; --j, rem <<= 1) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7944  					if (0x80 & rem)
c2248fc974df7b Douglas Gilbert 2014-11-24  7945  						break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7946  				}
c2248fc974df7b Douglas Gilbert 2014-11-24  7947  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, k, j);
c2248fc974df7b Douglas Gilbert 2014-11-24  7948  				goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7949  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7950  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7951  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7952  	if (unlikely(!(F_SKIP_UA & flags) &&
b01f6f8316af52 Douglas Gilbert 2016-04-30  7953  		     find_first_bit(devip->uas_bm,
b01f6f8316af52 Douglas Gilbert 2016-04-30  7954  				    SDEBUG_NUM_UAS) != SDEBUG_NUM_UAS)) {
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7955  		errsts = make_ua(scp, devip);
c2248fc974df7b Douglas Gilbert 2014-11-24  7956  		if (errsts)
c2248fc974df7b Douglas Gilbert 2014-11-24  7957  			goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7958  	}
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7959  	if (unlikely(((F_M_ACCESS & flags) || scp->cmnd[0] == TEST_UNIT_READY) &&
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7960  		     atomic_read(&devip->stopped))) {
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7961  		errsts = resp_not_ready(scp, devip);
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7962  		if (errsts)
c2248fc974df7b Douglas Gilbert 2014-11-24  7963  			goto fini;
c2248fc974df7b Douglas Gilbert 2014-11-24  7964  	}
773642d95b8220 Douglas Gilbert 2016-04-25  7965  	if (sdebug_fake_rw && (F_FAKE_RW & flags))
c2248fc974df7b Douglas Gilbert 2014-11-24  7966  		goto fini;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7967  	if (unlikely(sdebug_every_nth)) {
c483739430f107 Douglas Gilbert 2016-05-06  7968  		if (fake_timeout(scp))
c2248fc974df7b Douglas Gilbert 2014-11-24  7969  			return 0;	/* ignore command: make trouble */
c2248fc974df7b Douglas Gilbert 2014-11-24  7970  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7971  	if (likely(oip->pfp))
f66b85171a0ebd Martin Wilck    2018-02-14  7972  		pfp = oip->pfp;	/* calls a resp_* function */
f66b85171a0ebd Martin Wilck    2018-02-14  7973  	else
f66b85171a0ebd Martin Wilck    2018-02-14  7974  		pfp = r_pfp;    /* if leaf function ptr NULL, try the root's */
c2248fc974df7b Douglas Gilbert 2014-11-24  7975  
c2248fc974df7b Douglas Gilbert 2014-11-24  7976  fini:
67da413f26afc7 Douglas Gilbert 2020-04-21  7977  	if (F_DELAY_OVERR & flags)	/* cmds like INQUIRY respond asap */
f66b85171a0ebd Martin Wilck    2018-02-14  7978  		return schedule_resp(scp, devip, errsts, pfp, 0, 0);
75aa3209c945fc Douglas Gilbert 2018-07-12  7979  	else if ((flags & F_LONG_DELAY) && (sdebug_jdelay > 0 ||
75aa3209c945fc Douglas Gilbert 2018-07-12  7980  					    sdebug_ndelay > 10000)) {
80c49563e25067 Douglas Gilbert 2018-02-09  7981  		/*
75aa3209c945fc Douglas Gilbert 2018-07-12  7982  		 * Skip long delays if ndelay <= 10 microseconds. Otherwise
75aa3209c945fc Douglas Gilbert 2018-07-12  7983  		 * for Start Stop Unit (SSU) want at least 1 second delay and
75aa3209c945fc Douglas Gilbert 2018-07-12  7984  		 * if sdebug_jdelay>1 want a long delay of that many seconds.
75aa3209c945fc Douglas Gilbert 2018-07-12  7985  		 * For Synchronize Cache want 1/20 of SSU's delay.
80c49563e25067 Douglas Gilbert 2018-02-09  7986  		 */
80c49563e25067 Douglas Gilbert 2018-02-09  7987  		int jdelay = (sdebug_jdelay < 2) ? 1 : sdebug_jdelay;
4f2c8bf6bdff30 Douglas Gilbert 2018-04-10  7988  		int denom = (flags & F_SYNC_DELAY) ? 20 : 1;
80c49563e25067 Douglas Gilbert 2018-02-09  7989  
4f2c8bf6bdff30 Douglas Gilbert 2018-04-10  7990  		jdelay = mult_frac(USER_HZ * jdelay, HZ, denom * USER_HZ);
f66b85171a0ebd Martin Wilck    2018-02-14  7991  		return schedule_resp(scp, devip, errsts, pfp, jdelay, 0);
80c49563e25067 Douglas Gilbert 2018-02-09  7992  	} else
f66b85171a0ebd Martin Wilck    2018-02-14  7993  		return schedule_resp(scp, devip, errsts, pfp, sdebug_jdelay,
10bde980ac18da Douglas Gilbert 2018-01-10  7994  				     sdebug_ndelay);
c2248fc974df7b Douglas Gilbert 2014-11-24  7995  check_cond:
f66b85171a0ebd Martin Wilck    2018-02-14  7996  	return schedule_resp(scp, devip, check_condition_result, NULL, 0, 0);
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7997  err_out:
f66b85171a0ebd Martin Wilck    2018-02-14  7998  	return schedule_resp(scp, NULL, DID_NO_CONNECT << 16, NULL, 0, 0);
c2248fc974df7b Douglas Gilbert 2014-11-24  7999  }
c2248fc974df7b Douglas Gilbert 2014-11-24  8000  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
