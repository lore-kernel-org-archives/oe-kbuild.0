Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E017753
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 06:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683788340; x=1715324340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPZLRL2pj8e2WfUNym2fAD8YcVtZwOSHD+GUJIji14o=;
  b=IgnlXJQ6jV/wJbrNlT0XsuzhwHTGI2m30E+gesQxaDBwFeQqI+fxSnFq
   igUyntzT+X3D7gFqQIGswKuZiMSFW3tQIsprYNH2Oq2lDM7bgcoWCDM1n
   vzOmiIBxY00pzmsU024edJkrLbc1t0a+Dgnowgq4VzJCOQWrr3qWzS19Q
   7GiIaynYBSOuaZogq2PGnXkIaM+RMVdkMzlCG2B0jqKzNfLhCsUsZEwYk
   /Yb3IiqCoypOmLLisJ7bp5tzZcxEumqlVeeGNiyfKDyivNmx2HzbnqBA6
   0SXB51ProsR3zVYnxV50lwlUXomtzuilEwjKN9EoAu6ZC5YJxEDWYe4Vq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436744899"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="436744899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 23:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823856170"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="823856170"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2023 23:58:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px0GP-0003pw-0P;
	Thu, 11 May 2023 06:58:57 +0000
Date: Thu, 11 May 2023 14:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/6] scsi:scsi_debug: set command's result and sense
 data if the error is injected
Message-ID: <202305111419.HegopAw8-lkp@intel.com>
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
In-Reply-To: <20230428013320.347050-7-haowenchao2@huawei.com>
References: <20230428013320.347050-7-haowenchao2@huawei.com>
TO: Wenchao Hao <haowenchao2@huawei.com>
TO: "James E . J . Bottomley" <jejb@linux.ibm.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Douglas Gilbert <dgilbert@interlog.com>
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: linfeilong@huawei.com
CC: louhongxiang@huawei.com
CC: Wenchao Hao <haowenchao2@huawei.com>

Hi Wenchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.4-rc1 next-20230511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/scsi-scsi_debug-create-scsi_debug-directory-in-the-debugfs-filesystem/20230427-201534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230428013320.347050-7-haowenchao2%40huawei.com
patch subject: [PATCH v2 6/6] scsi:scsi_debug: set command's result and sense data if the error is injected
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111419.HegopAw8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305111419.HegopAw8-lkp@intel.com/

New smatch warnings:
drivers/scsi/scsi_debug.c:7880 scsi_debug_queuecommand() warn: missing error code? 'ret'

Old smatch warnings:
drivers/scsi/scsi_debug.c:5389 scsi_debug_slave_destroy() warn: variable dereferenced before check 'devip' (see line 5388)

vim +/ret +7880 drivers/scsi/scsi_debug.c

ef1cd466d439a1 Wenchao Hao     2023-04-28  7799  
fd32119b0deac1 Douglas Gilbert 2016-04-25  7800  static int scsi_debug_queuecommand(struct Scsi_Host *shost,
fd32119b0deac1 Douglas Gilbert 2016-04-25  7801  				   struct scsi_cmnd *scp)
c2248fc974df7b Douglas Gilbert 2014-11-24  7802  {
c2248fc974df7b Douglas Gilbert 2014-11-24  7803  	u8 sdeb_i;
c2248fc974df7b Douglas Gilbert 2014-11-24  7804  	struct scsi_device *sdp = scp->device;
c2248fc974df7b Douglas Gilbert 2014-11-24  7805  	const struct opcode_info_t *oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7806  	const struct opcode_info_t *r_oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7807  	struct sdebug_dev_info *devip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7808  	u8 *cmd = scp->cmnd;
c2248fc974df7b Douglas Gilbert 2014-11-24  7809  	int (*r_pfp)(struct scsi_cmnd *, struct sdebug_dev_info *);
f66b85171a0ebd Martin Wilck    2018-02-14  7810  	int (*pfp)(struct scsi_cmnd *, struct sdebug_dev_info *) = NULL;
c2248fc974df7b Douglas Gilbert 2014-11-24  7811  	int k, na;
c2248fc974df7b Douglas Gilbert 2014-11-24  7812  	int errsts = 0;
ad0c7775e745d2 Douglas Gilbert 2020-08-21  7813  	u64 lun_index = sdp->lun & 0x3FFF;
c2248fc974df7b Douglas Gilbert 2014-11-24  7814  	u32 flags;
c2248fc974df7b Douglas Gilbert 2014-11-24  7815  	u16 sa;
c2248fc974df7b Douglas Gilbert 2014-11-24  7816  	u8 opcode = cmd[0];
c2248fc974df7b Douglas Gilbert 2014-11-24  7817  	bool has_wlun_rl;
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7818  	bool inject_now;
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7819  	int ret = 0;
ef1cd466d439a1 Wenchao Hao     2023-04-28  7820  	struct sdebug_err_inject err;
c2248fc974df7b Douglas Gilbert 2014-11-24  7821  
c2248fc974df7b Douglas Gilbert 2014-11-24  7822  	scsi_set_resid(scp, 0);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7823  	if (sdebug_statistics) {
c483739430f107 Douglas Gilbert 2016-05-06  7824  		atomic_inc(&sdebug_cmnd_count);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7825  		inject_now = inject_on_this_cmd();
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7826  	} else {
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7827  		inject_now = false;
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7828  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7829  	if (unlikely(sdebug_verbose &&
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7830  		     !(SDEBUG_OPT_NO_CDB_NOISE & sdebug_opts))) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7831  		char b[120];
c2248fc974df7b Douglas Gilbert 2014-11-24  7832  		int n, len, sb;
c2248fc974df7b Douglas Gilbert 2014-11-24  7833  
c2248fc974df7b Douglas Gilbert 2014-11-24  7834  		len = scp->cmd_len;
c2248fc974df7b Douglas Gilbert 2014-11-24  7835  		sb = (int)sizeof(b);
c2248fc974df7b Douglas Gilbert 2014-11-24  7836  		if (len > 32)
c2248fc974df7b Douglas Gilbert 2014-11-24  7837  			strcpy(b, "too long, over 32 bytes");
c2248fc974df7b Douglas Gilbert 2014-11-24  7838  		else {
c2248fc974df7b Douglas Gilbert 2014-11-24  7839  			for (k = 0, n = 0; k < len && n < sb; ++k)
c2248fc974df7b Douglas Gilbert 2014-11-24  7840  				n += scnprintf(b + n, sb - n, "%02x ",
c2248fc974df7b Douglas Gilbert 2014-11-24  7841  					       (u32)cmd[k]);
c2248fc974df7b Douglas Gilbert 2014-11-24  7842  		}
458df78b1c513d Bart Van Assche 2018-01-26  7843  		sdev_printk(KERN_INFO, sdp, "%s: tag=%#x, cmd %s\n", my_name,
a6e76e6f2c0efd Bart Van Assche 2021-08-09  7844  			    blk_mq_unique_tag(scsi_cmd_to_rq(scp)), b);
c2248fc974df7b Douglas Gilbert 2014-11-24  7845  	}
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7846  	if (unlikely(inject_now && (sdebug_opts & SDEBUG_OPT_HOST_BUSY)))
7ee6d1b4357ac2 Bart Van Assche 2017-12-07  7847  		return SCSI_MLQUEUE_HOST_BUSY;
34d55434ba1f39 Tomas Winkler   2015-07-28  7848  	has_wlun_rl = (sdp->lun == SCSI_W_LUN_REPORT_LUNS);
ad0c7775e745d2 Douglas Gilbert 2020-08-21  7849  	if (unlikely(lun_index >= sdebug_max_luns && !has_wlun_rl))
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7850  		goto err_out;
c2248fc974df7b Douglas Gilbert 2014-11-24  7851  
c2248fc974df7b Douglas Gilbert 2014-11-24  7852  	sdeb_i = opcode_ind_arr[opcode];	/* fully mapped */
c2248fc974df7b Douglas Gilbert 2014-11-24  7853  	oip = &opcode_info_arr[sdeb_i];		/* safe if table consistent */
c2248fc974df7b Douglas Gilbert 2014-11-24  7854  	devip = (struct sdebug_dev_info *)sdp->hostdata;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7855  	if (unlikely(!devip)) {
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7856  		devip = find_build_dev_info(sdp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7857  		if (NULL == devip)
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7858  			goto err_out;
c2248fc974df7b Douglas Gilbert 2014-11-24  7859  	}
70abb3e2434633 Wenchao Hao     2023-04-28  7860  
70abb3e2434633 Wenchao Hao     2023-04-28  7861  	if (sdebug_timeout_cmd(scp)) {
70abb3e2434633 Wenchao Hao     2023-04-28  7862  		scmd_printk(KERN_INFO, scp, "timeout command 0x%x\n", opcode);
70abb3e2434633 Wenchao Hao     2023-04-28  7863  		return 0;
70abb3e2434633 Wenchao Hao     2023-04-28  7864  	}
70abb3e2434633 Wenchao Hao     2023-04-28  7865  
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7866  	ret = sdebug_fail_queue_cmd(scp);
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7867  	if (ret) {
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7868  		scmd_printk(KERN_INFO, scp, "fail queue command 0x%x with 0x%x\n",
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7869  				opcode, ret);
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7870  		return ret;
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7871  	}
b3f5d28c11bee2 Wenchao Hao     2023-04-28  7872  
ef1cd466d439a1 Wenchao Hao     2023-04-28  7873  	if (sdebug_fail_cmd(scp, &ret, &err)) {
ef1cd466d439a1 Wenchao Hao     2023-04-28  7874  		scmd_printk(KERN_INFO, scp,
ef1cd466d439a1 Wenchao Hao     2023-04-28  7875  			"fail command 0x%x with hostbyte=0x%x, "
ef1cd466d439a1 Wenchao Hao     2023-04-28  7876  			"driverbyte=0x%x, statusbyte=0x%x, "
ef1cd466d439a1 Wenchao Hao     2023-04-28  7877  			"sense_key=0x%x, asc=0x%x, asq=0x%x\n",
ef1cd466d439a1 Wenchao Hao     2023-04-28  7878  			opcode, err.host_byte, err.driver_byte,
ef1cd466d439a1 Wenchao Hao     2023-04-28  7879  			err.status_byte, err.sense_key, err.asc, err.asq);
ef1cd466d439a1 Wenchao Hao     2023-04-28 @7880  		return ret;
ef1cd466d439a1 Wenchao Hao     2023-04-28  7881  	}
ef1cd466d439a1 Wenchao Hao     2023-04-28  7882  
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7883  	if (unlikely(inject_now && !atomic_read(&sdeb_inject_pending)))
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7884  		atomic_set(&sdeb_inject_pending, 1);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7885  
c2248fc974df7b Douglas Gilbert 2014-11-24  7886  	na = oip->num_attached;
c2248fc974df7b Douglas Gilbert 2014-11-24  7887  	r_pfp = oip->pfp;
c2248fc974df7b Douglas Gilbert 2014-11-24  7888  	if (na) {	/* multiple commands with this opcode */
c2248fc974df7b Douglas Gilbert 2014-11-24  7889  		r_oip = oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7890  		if (FF_SA & r_oip->flags) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7891  			if (F_SA_LOW & oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7892  				sa = 0x1f & cmd[1];
c2248fc974df7b Douglas Gilbert 2014-11-24  7893  			else
c2248fc974df7b Douglas Gilbert 2014-11-24  7894  				sa = get_unaligned_be16(cmd + 8);
c2248fc974df7b Douglas Gilbert 2014-11-24  7895  			for (k = 0; k <= na; oip = r_oip->arrp + k++) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7896  				if (opcode == oip->opcode && sa == oip->sa)
c2248fc974df7b Douglas Gilbert 2014-11-24  7897  					break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7898  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7899  		} else {   /* since no service action only check opcode */
c2248fc974df7b Douglas Gilbert 2014-11-24  7900  			for (k = 0; k <= na; oip = r_oip->arrp + k++) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7901  				if (opcode == oip->opcode)
c2248fc974df7b Douglas Gilbert 2014-11-24  7902  					break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7903  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7904  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7905  		if (k > na) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7906  			if (F_SA_LOW & r_oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7907  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 1, 4);
c2248fc974df7b Douglas Gilbert 2014-11-24  7908  			else if (F_SA_HIGH & r_oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7909  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 8, 7);
c2248fc974df7b Douglas Gilbert 2014-11-24  7910  			else
c2248fc974df7b Douglas Gilbert 2014-11-24  7911  				mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7912  			goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7913  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7914  	}	/* else (when na==0) we assume the oip is a match */
c2248fc974df7b Douglas Gilbert 2014-11-24  7915  	flags = oip->flags;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7916  	if (unlikely(F_INV_OP & flags)) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7917  		mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7918  		goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7919  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7920  	if (unlikely(has_wlun_rl && !(F_RL_WLUN_OK & flags))) {
773642d95b8220 Douglas Gilbert 2016-04-25  7921  		if (sdebug_verbose)
773642d95b8220 Douglas Gilbert 2016-04-25  7922  			sdev_printk(KERN_INFO, sdp, "%s: Opcode 0x%x not%s\n",
773642d95b8220 Douglas Gilbert 2016-04-25  7923  				    my_name, opcode, " supported for wlun");
c2248fc974df7b Douglas Gilbert 2014-11-24  7924  		mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7925  		goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7926  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7927  	if (unlikely(sdebug_strict)) {	/* check cdb against mask */
c2248fc974df7b Douglas Gilbert 2014-11-24  7928  		u8 rem;
c2248fc974df7b Douglas Gilbert 2014-11-24  7929  		int j;
c2248fc974df7b Douglas Gilbert 2014-11-24  7930  
c2248fc974df7b Douglas Gilbert 2014-11-24  7931  		for (k = 1; k < oip->len_mask[0] && k < 16; ++k) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7932  			rem = ~oip->len_mask[k] & cmd[k];
c2248fc974df7b Douglas Gilbert 2014-11-24  7933  			if (rem) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7934  				for (j = 7; j >= 0; --j, rem <<= 1) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7935  					if (0x80 & rem)
c2248fc974df7b Douglas Gilbert 2014-11-24  7936  						break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7937  				}
c2248fc974df7b Douglas Gilbert 2014-11-24  7938  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, k, j);
c2248fc974df7b Douglas Gilbert 2014-11-24  7939  				goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7940  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7941  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7942  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7943  	if (unlikely(!(F_SKIP_UA & flags) &&
b01f6f8316af52 Douglas Gilbert 2016-04-30  7944  		     find_first_bit(devip->uas_bm,
b01f6f8316af52 Douglas Gilbert 2016-04-30  7945  				    SDEBUG_NUM_UAS) != SDEBUG_NUM_UAS)) {
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7946  		errsts = make_ua(scp, devip);
c2248fc974df7b Douglas Gilbert 2014-11-24  7947  		if (errsts)
c2248fc974df7b Douglas Gilbert 2014-11-24  7948  			goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7949  	}
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7950  	if (unlikely(((F_M_ACCESS & flags) || scp->cmnd[0] == TEST_UNIT_READY) &&
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7951  		     atomic_read(&devip->stopped))) {
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7952  		errsts = resp_not_ready(scp, devip);
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7953  		if (errsts)
c2248fc974df7b Douglas Gilbert 2014-11-24  7954  			goto fini;
c2248fc974df7b Douglas Gilbert 2014-11-24  7955  	}
773642d95b8220 Douglas Gilbert 2016-04-25  7956  	if (sdebug_fake_rw && (F_FAKE_RW & flags))
c2248fc974df7b Douglas Gilbert 2014-11-24  7957  		goto fini;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7958  	if (unlikely(sdebug_every_nth)) {
c483739430f107 Douglas Gilbert 2016-05-06  7959  		if (fake_timeout(scp))
c2248fc974df7b Douglas Gilbert 2014-11-24  7960  			return 0;	/* ignore command: make trouble */
c2248fc974df7b Douglas Gilbert 2014-11-24  7961  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7962  	if (likely(oip->pfp))
f66b85171a0ebd Martin Wilck    2018-02-14  7963  		pfp = oip->pfp;	/* calls a resp_* function */
f66b85171a0ebd Martin Wilck    2018-02-14  7964  	else
f66b85171a0ebd Martin Wilck    2018-02-14  7965  		pfp = r_pfp;    /* if leaf function ptr NULL, try the root's */
c2248fc974df7b Douglas Gilbert 2014-11-24  7966  
c2248fc974df7b Douglas Gilbert 2014-11-24  7967  fini:
67da413f26afc7 Douglas Gilbert 2020-04-21  7968  	if (F_DELAY_OVERR & flags)	/* cmds like INQUIRY respond asap */
f66b85171a0ebd Martin Wilck    2018-02-14  7969  		return schedule_resp(scp, devip, errsts, pfp, 0, 0);
75aa3209c945fc Douglas Gilbert 2018-07-12  7970  	else if ((flags & F_LONG_DELAY) && (sdebug_jdelay > 0 ||
75aa3209c945fc Douglas Gilbert 2018-07-12  7971  					    sdebug_ndelay > 10000)) {
80c49563e25067 Douglas Gilbert 2018-02-09  7972  		/*
75aa3209c945fc Douglas Gilbert 2018-07-12  7973  		 * Skip long delays if ndelay <= 10 microseconds. Otherwise
75aa3209c945fc Douglas Gilbert 2018-07-12  7974  		 * for Start Stop Unit (SSU) want at least 1 second delay and
75aa3209c945fc Douglas Gilbert 2018-07-12  7975  		 * if sdebug_jdelay>1 want a long delay of that many seconds.
75aa3209c945fc Douglas Gilbert 2018-07-12  7976  		 * For Synchronize Cache want 1/20 of SSU's delay.
80c49563e25067 Douglas Gilbert 2018-02-09  7977  		 */
80c49563e25067 Douglas Gilbert 2018-02-09  7978  		int jdelay = (sdebug_jdelay < 2) ? 1 : sdebug_jdelay;
4f2c8bf6bdff30 Douglas Gilbert 2018-04-10  7979  		int denom = (flags & F_SYNC_DELAY) ? 20 : 1;
80c49563e25067 Douglas Gilbert 2018-02-09  7980  
4f2c8bf6bdff30 Douglas Gilbert 2018-04-10  7981  		jdelay = mult_frac(USER_HZ * jdelay, HZ, denom * USER_HZ);
f66b85171a0ebd Martin Wilck    2018-02-14  7982  		return schedule_resp(scp, devip, errsts, pfp, jdelay, 0);
80c49563e25067 Douglas Gilbert 2018-02-09  7983  	} else
f66b85171a0ebd Martin Wilck    2018-02-14  7984  		return schedule_resp(scp, devip, errsts, pfp, sdebug_jdelay,
10bde980ac18da Douglas Gilbert 2018-01-10  7985  				     sdebug_ndelay);
c2248fc974df7b Douglas Gilbert 2014-11-24  7986  check_cond:
f66b85171a0ebd Martin Wilck    2018-02-14  7987  	return schedule_resp(scp, devip, check_condition_result, NULL, 0, 0);
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7988  err_out:
f66b85171a0ebd Martin Wilck    2018-02-14  7989  	return schedule_resp(scp, NULL, DID_NO_CONNECT << 16, NULL, 0, 0);
c2248fc974df7b Douglas Gilbert 2014-11-24  7990  }
c2248fc974df7b Douglas Gilbert 2014-11-24  7991  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
