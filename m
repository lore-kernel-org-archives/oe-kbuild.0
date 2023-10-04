Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06021374
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Oct 2023 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYeB+y7P"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696445580; x=1727981580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5LPR+eDs9QrV2laCI7ZFL84kspGd5tHysxHuCZ7gCk=;
  b=OYeB+y7P60K80JAEQURGdE4daW3zQzk0mFgdz8bvDppA6KycFYQXS/H5
   KJmtfFuwWwlhojLkgx5MyjioEVSMasi2hgJUIGEgHxYXVyScELGOlydG0
   uQSYzBQ5H38/iG5hgY9ne8b6SjdaLVXQ7LgaGl3SX3NNqgoeIGHQAhugA
   KziFltoF2bqAOr4wTBan8fXgJxQSdlJFHKO5j0Uvu9ebVL6Og3tpEZsV1
   iIQPzkQge8JHwezspLfIbKk1I+ssELRlGwnxwcV3ZMFy4sKtGWU+0wLuS
   IkWokXMUYD87OAbQAWKTq+9yzJGLWFbNUZdaRXv9GGowjvnchr1HStHe4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380549529"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="380549529"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 11:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728129665"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="728129665"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Oct 2023 11:52:57 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo6zP-000KWB-1B;
	Wed, 04 Oct 2023 18:52:55 +0000
Date: Thu, 5 Oct 2023 02:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 06/10] scsi: scsi_debug: set command's result and
 sense data if the error is injected
Message-ID: <202310050209.VOl6gV40-lkp@intel.com>
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
In-Reply-To: <20230922092906.2645265-7-haowenchao2@huawei.com>
References: <20230922092906.2645265-7-haowenchao2@huawei.com>
TO: Wenchao Hao <haowenchao2@huawei.com>
TO: "James E . J . Bottomley" <jejb@linux.ibm.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Douglas Gilbert <dgilbert@interlog.com>
TO: open-iscsi@googlegroups.com
TO: linux-scsi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: louhongxiang@huawei.com
CC: Wenchao Hao <haowenchao2@huawei.com>

Hi Wenchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.6-rc4 next-20231004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/scsi-scsi_debug-create-scsi_debug-directory-in-the-debugfs-filesystem/20230922-173226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230922092906.2645265-7-haowenchao2%40huawei.com
patch subject: [PATCH v5 06/10] scsi: scsi_debug: set command's result and sense data if the error is injected
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231005/202310050209.VOl6gV40-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310050209.VOl6gV40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310050209.VOl6gV40-lkp@intel.com/

smatch warnings:
drivers/scsi/scsi_debug.c:7912 scsi_debug_queuecommand() warn: missing error code? 'ret'

vim +/ret +7912 drivers/scsi/scsi_debug.c

cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7831  
fd32119b0deac1 Douglas Gilbert 2016-04-25  7832  static int scsi_debug_queuecommand(struct Scsi_Host *shost,
fd32119b0deac1 Douglas Gilbert 2016-04-25  7833  				   struct scsi_cmnd *scp)
c2248fc974df7b Douglas Gilbert 2014-11-24  7834  {
c2248fc974df7b Douglas Gilbert 2014-11-24  7835  	u8 sdeb_i;
c2248fc974df7b Douglas Gilbert 2014-11-24  7836  	struct scsi_device *sdp = scp->device;
c2248fc974df7b Douglas Gilbert 2014-11-24  7837  	const struct opcode_info_t *oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7838  	const struct opcode_info_t *r_oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7839  	struct sdebug_dev_info *devip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7840  	u8 *cmd = scp->cmnd;
c2248fc974df7b Douglas Gilbert 2014-11-24  7841  	int (*r_pfp)(struct scsi_cmnd *, struct sdebug_dev_info *);
f66b85171a0ebd Martin Wilck    2018-02-14  7842  	int (*pfp)(struct scsi_cmnd *, struct sdebug_dev_info *) = NULL;
c2248fc974df7b Douglas Gilbert 2014-11-24  7843  	int k, na;
c2248fc974df7b Douglas Gilbert 2014-11-24  7844  	int errsts = 0;
ad0c7775e745d2 Douglas Gilbert 2020-08-21  7845  	u64 lun_index = sdp->lun & 0x3FFF;
c2248fc974df7b Douglas Gilbert 2014-11-24  7846  	u32 flags;
c2248fc974df7b Douglas Gilbert 2014-11-24  7847  	u16 sa;
c2248fc974df7b Douglas Gilbert 2014-11-24  7848  	u8 opcode = cmd[0];
c2248fc974df7b Douglas Gilbert 2014-11-24  7849  	bool has_wlun_rl;
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7850  	bool inject_now;
929aad8ff0578d Wenchao Hao     2023-09-22  7851  	int ret = 0;
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7852  	struct sdebug_err_inject err;
c2248fc974df7b Douglas Gilbert 2014-11-24  7853  
c2248fc974df7b Douglas Gilbert 2014-11-24  7854  	scsi_set_resid(scp, 0);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7855  	if (sdebug_statistics) {
c483739430f107 Douglas Gilbert 2016-05-06  7856  		atomic_inc(&sdebug_cmnd_count);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7857  		inject_now = inject_on_this_cmd();
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7858  	} else {
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7859  		inject_now = false;
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7860  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7861  	if (unlikely(sdebug_verbose &&
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7862  		     !(SDEBUG_OPT_NO_CDB_NOISE & sdebug_opts))) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7863  		char b[120];
c2248fc974df7b Douglas Gilbert 2014-11-24  7864  		int n, len, sb;
c2248fc974df7b Douglas Gilbert 2014-11-24  7865  
c2248fc974df7b Douglas Gilbert 2014-11-24  7866  		len = scp->cmd_len;
c2248fc974df7b Douglas Gilbert 2014-11-24  7867  		sb = (int)sizeof(b);
c2248fc974df7b Douglas Gilbert 2014-11-24  7868  		if (len > 32)
c2248fc974df7b Douglas Gilbert 2014-11-24  7869  			strcpy(b, "too long, over 32 bytes");
c2248fc974df7b Douglas Gilbert 2014-11-24  7870  		else {
c2248fc974df7b Douglas Gilbert 2014-11-24  7871  			for (k = 0, n = 0; k < len && n < sb; ++k)
c2248fc974df7b Douglas Gilbert 2014-11-24  7872  				n += scnprintf(b + n, sb - n, "%02x ",
c2248fc974df7b Douglas Gilbert 2014-11-24  7873  					       (u32)cmd[k]);
c2248fc974df7b Douglas Gilbert 2014-11-24  7874  		}
458df78b1c513d Bart Van Assche 2018-01-26  7875  		sdev_printk(KERN_INFO, sdp, "%s: tag=%#x, cmd %s\n", my_name,
a6e76e6f2c0efd Bart Van Assche 2021-08-09  7876  			    blk_mq_unique_tag(scsi_cmd_to_rq(scp)), b);
c2248fc974df7b Douglas Gilbert 2014-11-24  7877  	}
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7878  	if (unlikely(inject_now && (sdebug_opts & SDEBUG_OPT_HOST_BUSY)))
7ee6d1b4357ac2 Bart Van Assche 2017-12-07  7879  		return SCSI_MLQUEUE_HOST_BUSY;
34d55434ba1f39 Tomas Winkler   2015-07-28  7880  	has_wlun_rl = (sdp->lun == SCSI_W_LUN_REPORT_LUNS);
ad0c7775e745d2 Douglas Gilbert 2020-08-21  7881  	if (unlikely(lun_index >= sdebug_max_luns && !has_wlun_rl))
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7882  		goto err_out;
c2248fc974df7b Douglas Gilbert 2014-11-24  7883  
c2248fc974df7b Douglas Gilbert 2014-11-24  7884  	sdeb_i = opcode_ind_arr[opcode];	/* fully mapped */
c2248fc974df7b Douglas Gilbert 2014-11-24  7885  	oip = &opcode_info_arr[sdeb_i];		/* safe if table consistent */
c2248fc974df7b Douglas Gilbert 2014-11-24  7886  	devip = (struct sdebug_dev_info *)sdp->hostdata;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7887  	if (unlikely(!devip)) {
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7888  		devip = find_build_dev_info(sdp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7889  		if (NULL == devip)
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7890  			goto err_out;
c2248fc974df7b Douglas Gilbert 2014-11-24  7891  	}
3f07ff40cb2457 Wenchao Hao     2023-09-22  7892  
3f07ff40cb2457 Wenchao Hao     2023-09-22  7893  	if (sdebug_timeout_cmd(scp)) {
3f07ff40cb2457 Wenchao Hao     2023-09-22  7894  		scmd_printk(KERN_INFO, scp, "timeout command 0x%x\n", opcode);
3f07ff40cb2457 Wenchao Hao     2023-09-22  7895  		return 0;
3f07ff40cb2457 Wenchao Hao     2023-09-22  7896  	}
3f07ff40cb2457 Wenchao Hao     2023-09-22  7897  
929aad8ff0578d Wenchao Hao     2023-09-22  7898  	ret = sdebug_fail_queue_cmd(scp);
929aad8ff0578d Wenchao Hao     2023-09-22  7899  	if (ret) {
929aad8ff0578d Wenchao Hao     2023-09-22  7900  		scmd_printk(KERN_INFO, scp, "fail queue command 0x%x with 0x%x\n",
929aad8ff0578d Wenchao Hao     2023-09-22  7901  				opcode, ret);
929aad8ff0578d Wenchao Hao     2023-09-22  7902  		return ret;
929aad8ff0578d Wenchao Hao     2023-09-22  7903  	}
929aad8ff0578d Wenchao Hao     2023-09-22  7904  
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7905  	if (sdebug_fail_cmd(scp, &ret, &err)) {
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7906  		scmd_printk(KERN_INFO, scp,
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7907  			"fail command 0x%x with hostbyte=0x%x, "
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7908  			"driverbyte=0x%x, statusbyte=0x%x, "
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7909  			"sense_key=0x%x, asc=0x%x, asq=0x%x\n",
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7910  			opcode, err.host_byte, err.driver_byte,
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7911  			err.status_byte, err.sense_key, err.asc, err.asq);
cc36ffafc0f7e6 Wenchao Hao     2023-09-22 @7912  		return ret;
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7913  	}
cc36ffafc0f7e6 Wenchao Hao     2023-09-22  7914  
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7915  	if (unlikely(inject_now && !atomic_read(&sdeb_inject_pending)))
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7916  		atomic_set(&sdeb_inject_pending, 1);
3a90a63d02b8b7 Douglas Gilbert 2020-07-12  7917  
c2248fc974df7b Douglas Gilbert 2014-11-24  7918  	na = oip->num_attached;
c2248fc974df7b Douglas Gilbert 2014-11-24  7919  	r_pfp = oip->pfp;
c2248fc974df7b Douglas Gilbert 2014-11-24  7920  	if (na) {	/* multiple commands with this opcode */
c2248fc974df7b Douglas Gilbert 2014-11-24  7921  		r_oip = oip;
c2248fc974df7b Douglas Gilbert 2014-11-24  7922  		if (FF_SA & r_oip->flags) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7923  			if (F_SA_LOW & oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7924  				sa = 0x1f & cmd[1];
c2248fc974df7b Douglas Gilbert 2014-11-24  7925  			else
c2248fc974df7b Douglas Gilbert 2014-11-24  7926  				sa = get_unaligned_be16(cmd + 8);
c2248fc974df7b Douglas Gilbert 2014-11-24  7927  			for (k = 0; k <= na; oip = r_oip->arrp + k++) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7928  				if (opcode == oip->opcode && sa == oip->sa)
c2248fc974df7b Douglas Gilbert 2014-11-24  7929  					break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7930  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7931  		} else {   /* since no service action only check opcode */
c2248fc974df7b Douglas Gilbert 2014-11-24  7932  			for (k = 0; k <= na; oip = r_oip->arrp + k++) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7933  				if (opcode == oip->opcode)
c2248fc974df7b Douglas Gilbert 2014-11-24  7934  					break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7935  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7936  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7937  		if (k > na) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7938  			if (F_SA_LOW & r_oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7939  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 1, 4);
c2248fc974df7b Douglas Gilbert 2014-11-24  7940  			else if (F_SA_HIGH & r_oip->flags)
c2248fc974df7b Douglas Gilbert 2014-11-24  7941  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 8, 7);
c2248fc974df7b Douglas Gilbert 2014-11-24  7942  			else
c2248fc974df7b Douglas Gilbert 2014-11-24  7943  				mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7944  			goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7945  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7946  	}	/* else (when na==0) we assume the oip is a match */
c2248fc974df7b Douglas Gilbert 2014-11-24  7947  	flags = oip->flags;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7948  	if (unlikely(F_INV_OP & flags)) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7949  		mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7950  		goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7951  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7952  	if (unlikely(has_wlun_rl && !(F_RL_WLUN_OK & flags))) {
773642d95b8220 Douglas Gilbert 2016-04-25  7953  		if (sdebug_verbose)
773642d95b8220 Douglas Gilbert 2016-04-25  7954  			sdev_printk(KERN_INFO, sdp, "%s: Opcode 0x%x not%s\n",
773642d95b8220 Douglas Gilbert 2016-04-25  7955  				    my_name, opcode, " supported for wlun");
c2248fc974df7b Douglas Gilbert 2014-11-24  7956  		mk_sense_invalid_opcode(scp);
c2248fc974df7b Douglas Gilbert 2014-11-24  7957  		goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7958  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7959  	if (unlikely(sdebug_strict)) {	/* check cdb against mask */
c2248fc974df7b Douglas Gilbert 2014-11-24  7960  		u8 rem;
c2248fc974df7b Douglas Gilbert 2014-11-24  7961  		int j;
c2248fc974df7b Douglas Gilbert 2014-11-24  7962  
c2248fc974df7b Douglas Gilbert 2014-11-24  7963  		for (k = 1; k < oip->len_mask[0] && k < 16; ++k) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7964  			rem = ~oip->len_mask[k] & cmd[k];
c2248fc974df7b Douglas Gilbert 2014-11-24  7965  			if (rem) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7966  				for (j = 7; j >= 0; --j, rem <<= 1) {
c2248fc974df7b Douglas Gilbert 2014-11-24  7967  					if (0x80 & rem)
c2248fc974df7b Douglas Gilbert 2014-11-24  7968  						break;
c2248fc974df7b Douglas Gilbert 2014-11-24  7969  				}
c2248fc974df7b Douglas Gilbert 2014-11-24  7970  				mk_sense_invalid_fld(scp, SDEB_IN_CDB, k, j);
c2248fc974df7b Douglas Gilbert 2014-11-24  7971  				goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7972  			}
c2248fc974df7b Douglas Gilbert 2014-11-24  7973  		}
c2248fc974df7b Douglas Gilbert 2014-11-24  7974  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7975  	if (unlikely(!(F_SKIP_UA & flags) &&
b01f6f8316af52 Douglas Gilbert 2016-04-30  7976  		     find_first_bit(devip->uas_bm,
b01f6f8316af52 Douglas Gilbert 2016-04-30  7977  				    SDEBUG_NUM_UAS) != SDEBUG_NUM_UAS)) {
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7978  		errsts = make_ua(scp, devip);
c2248fc974df7b Douglas Gilbert 2014-11-24  7979  		if (errsts)
c2248fc974df7b Douglas Gilbert 2014-11-24  7980  			goto check_cond;
c2248fc974df7b Douglas Gilbert 2014-11-24  7981  	}
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7982  	if (unlikely(((F_M_ACCESS & flags) || scp->cmnd[0] == TEST_UNIT_READY) &&
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7983  		     atomic_read(&devip->stopped))) {
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7984  		errsts = resp_not_ready(scp, devip);
fc13638ae92ee9 Douglas Gilbert 2020-07-24  7985  		if (errsts)
c2248fc974df7b Douglas Gilbert 2014-11-24  7986  			goto fini;
c2248fc974df7b Douglas Gilbert 2014-11-24  7987  	}
773642d95b8220 Douglas Gilbert 2016-04-25  7988  	if (sdebug_fake_rw && (F_FAKE_RW & flags))
c2248fc974df7b Douglas Gilbert 2014-11-24  7989  		goto fini;
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7990  	if (unlikely(sdebug_every_nth)) {
c483739430f107 Douglas Gilbert 2016-05-06  7991  		if (fake_timeout(scp))
c2248fc974df7b Douglas Gilbert 2014-11-24  7992  			return 0;	/* ignore command: make trouble */
c2248fc974df7b Douglas Gilbert 2014-11-24  7993  	}
f46eb0e9fc763b Douglas Gilbert 2016-04-25  7994  	if (likely(oip->pfp))
f66b85171a0ebd Martin Wilck    2018-02-14  7995  		pfp = oip->pfp;	/* calls a resp_* function */
f66b85171a0ebd Martin Wilck    2018-02-14  7996  	else
f66b85171a0ebd Martin Wilck    2018-02-14  7997  		pfp = r_pfp;    /* if leaf function ptr NULL, try the root's */
c2248fc974df7b Douglas Gilbert 2014-11-24  7998  
c2248fc974df7b Douglas Gilbert 2014-11-24  7999  fini:
67da413f26afc7 Douglas Gilbert 2020-04-21  8000  	if (F_DELAY_OVERR & flags)	/* cmds like INQUIRY respond asap */
f66b85171a0ebd Martin Wilck    2018-02-14  8001  		return schedule_resp(scp, devip, errsts, pfp, 0, 0);
75aa3209c945fc Douglas Gilbert 2018-07-12  8002  	else if ((flags & F_LONG_DELAY) && (sdebug_jdelay > 0 ||
75aa3209c945fc Douglas Gilbert 2018-07-12  8003  					    sdebug_ndelay > 10000)) {
80c49563e25067 Douglas Gilbert 2018-02-09  8004  		/*
75aa3209c945fc Douglas Gilbert 2018-07-12  8005  		 * Skip long delays if ndelay <= 10 microseconds. Otherwise
75aa3209c945fc Douglas Gilbert 2018-07-12  8006  		 * for Start Stop Unit (SSU) want at least 1 second delay and
75aa3209c945fc Douglas Gilbert 2018-07-12  8007  		 * if sdebug_jdelay>1 want a long delay of that many seconds.
75aa3209c945fc Douglas Gilbert 2018-07-12  8008  		 * For Synchronize Cache want 1/20 of SSU's delay.
80c49563e25067 Douglas Gilbert 2018-02-09  8009  		 */
80c49563e25067 Douglas Gilbert 2018-02-09  8010  		int jdelay = (sdebug_jdelay < 2) ? 1 : sdebug_jdelay;
4f2c8bf6bdff30 Douglas Gilbert 2018-04-10  8011  		int denom = (flags & F_SYNC_DELAY) ? 20 : 1;
80c49563e25067 Douglas Gilbert 2018-02-09  8012  
4f2c8bf6bdff30 Douglas Gilbert 2018-04-10  8013  		jdelay = mult_frac(USER_HZ * jdelay, HZ, denom * USER_HZ);
f66b85171a0ebd Martin Wilck    2018-02-14  8014  		return schedule_resp(scp, devip, errsts, pfp, jdelay, 0);
80c49563e25067 Douglas Gilbert 2018-02-09  8015  	} else
f66b85171a0ebd Martin Wilck    2018-02-14  8016  		return schedule_resp(scp, devip, errsts, pfp, sdebug_jdelay,
10bde980ac18da Douglas Gilbert 2018-01-10  8017  				     sdebug_ndelay);
c2248fc974df7b Douglas Gilbert 2014-11-24  8018  check_cond:
f66b85171a0ebd Martin Wilck    2018-02-14  8019  	return schedule_resp(scp, devip, check_condition_result, NULL, 0, 0);
f46eb0e9fc763b Douglas Gilbert 2016-04-25  8020  err_out:
f66b85171a0ebd Martin Wilck    2018-02-14  8021  	return schedule_resp(scp, NULL, DID_NO_CONNECT << 16, NULL, 0, 0);
c2248fc974df7b Douglas Gilbert 2014-11-24  8022  }
c2248fc974df7b Douglas Gilbert 2014-11-24  8023  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
