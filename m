Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D3E20298A
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741298563; cv=none; b=d4gzkPuTvxVo6QDPkfhyMpprtk/TGhicF3YZUt29XKrFBATr/pHpKryKjUxHO5NUzBangxKx+8pQv4rB5oqag7/tNLTHQYltykhYKpxQkTvtfXGYmVI+sT5gsifMXNXxLvXJL4lPo3L8sId1uRltUCcXEnXPwSzz6nLVIs9PB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741298563; c=relaxed/simple;
	bh=cQ/olxNgUbmG5dbQSVQOU1gabzy1pNv0iMTUaXM/ZM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUXTquzNBasCtDfWypmQ0dLP4ELAhx1HwZ2uhtAN8x3BlRLhnr70c+J3oyZAQgvklVu6s7uMy5qh0gXFR+fDg7GtY9lbdFIo7qVNsCoLMvBtnvMyWqottCO9+eJhd7qY9BWQHjnXd/iu75f1N6P2W/LhOxEhrTBmKFEiMjSDPj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2dO/4va; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2dO/4va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741298561; x=1772834561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQ/olxNgUbmG5dbQSVQOU1gabzy1pNv0iMTUaXM/ZM0=;
  b=J2dO/4va3QK7c6EbQ5u4CL2cJDv/FjPE6wr0UX/CJrEfvaRBpnuxDu+7
   NArvfqBHA4dHE3VaK+gfs8CI/yoBlPrKyjYVneK0DVbknIOQAe0gzjCml
   9MYvViiEMIHC/TC38fP689F1GyPuIhgNhAGKYtuLi/gNlnVBxnRdmM+GQ
   qUeEnCraMAfggGJoehtWYAvLJGwBbp8L/6u/2gR2laTeElAiIC/KJAbFN
   vnhuquxC608SRX8I3mR4dhldFqbPgPbk5/4k0OEAOFLMAZmF/LUlxuO+1
   AoIMTA2ipXWOYzii4WztVROyi6zLU0kZexF6rCDr5QOJj8pCT5W2KLEGZ
   A==;
X-CSE-ConnectionGUID: RtUxEn7yQQiWjlQHPQEoeA==
X-CSE-MsgGUID: jlu+baMrQVS7m2Oi6H0H/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59891889"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="59891889"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 14:02:40 -0800
X-CSE-ConnectionGUID: DdMjM3oRQDykU7PL2m0b2Q==
X-CSE-MsgGUID: UUIVsdQYSkGMnu0+2u7PmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="119152705"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 14:02:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqJIa-000Ng2-1X;
	Thu, 06 Mar 2025 22:02:36 +0000
Date: Fri, 7 Mar 2025 06:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/BusLogic.c:3092 blogic_qcmd_lck() warn: Function too
 hairy.  No more merges.
Message-ID: <202503070525.Wi6x2nl5-lkp@intel.com>
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
TO: Nam Cao <namcao@linutronix.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1238f0af13495e14e1f40d011b9b7b414bf387fe
commit: 5cf089672119808c2f5b7035c91adcc0cc7287e1 riscv: replace misleading va_kernel_pa_offset on XIP kernel
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r072-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070525.Wi6x2nl5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503070525.Wi6x2nl5-lkp@intel.com/

New smatch warnings:
drivers/scsi/BusLogic.c:3092 blogic_qcmd_lck() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/scsi/BusLogic.c:2396 blogic_init() warn: 'myadapter->io_addr' from __request_region() not released on lines: 2396.
drivers/scsi/BusLogic.c:2396 blogic_init() warn: 'probeinfo->io_addr' from __request_region() not released on lines: 2396.

vim +3092 drivers/scsi/BusLogic.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2878  
af049dfd0b105b Bart Van Assche   2021-10-07  2879  static int blogic_qcmd_lck(struct scsi_cmnd *command)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2880  {
af049dfd0b105b Bart Van Assche   2021-10-07  2881  	void (*comp_cb)(struct scsi_cmnd *) = scsi_done;
839cb99e8f7483 Khalid Aziz       2013-05-16  2882  	struct blogic_adapter *adapter =
839cb99e8f7483 Khalid Aziz       2013-05-16  2883  		(struct blogic_adapter *) command->device->host->hostdata;
839cb99e8f7483 Khalid Aziz       2013-05-16  2884  	struct blogic_tgt_flags *tgt_flags =
839cb99e8f7483 Khalid Aziz       2013-05-16  2885  		&adapter->tgt_flags[command->device->id];
839cb99e8f7483 Khalid Aziz       2013-05-16  2886  	struct blogic_tgt_stats *tgt_stats = adapter->tgt_stats;
839cb99e8f7483 Khalid Aziz       2013-05-16  2887  	unsigned char *cdb = command->cmnd;
839cb99e8f7483 Khalid Aziz       2013-05-16  2888  	int cdblen = command->cmd_len;
839cb99e8f7483 Khalid Aziz       2013-05-16  2889  	int tgt_id = command->device->id;
839cb99e8f7483 Khalid Aziz       2013-05-16  2890  	int lun = command->device->lun;
839cb99e8f7483 Khalid Aziz       2013-05-16  2891  	int buflen = scsi_bufflen(command);
839cb99e8f7483 Khalid Aziz       2013-05-16  2892  	int count;
839cb99e8f7483 Khalid Aziz       2013-05-16  2893  	struct blogic_ccb *ccb;
eeceec904031f8 Khalid Aziz       2013-09-13  2894  	dma_addr_t sense_buf;
839cb99e8f7483 Khalid Aziz       2013-05-16  2895  
839cb99e8f7483 Khalid Aziz       2013-05-16  2896  	/*
839cb99e8f7483 Khalid Aziz       2013-05-16  2897  	   SCSI REQUEST_SENSE commands will be executed automatically by the
839cb99e8f7483 Khalid Aziz       2013-05-16  2898  	   Host Adapter for any errors, so they should not be executed
839cb99e8f7483 Khalid Aziz       2013-05-16  2899  	   explicitly unless the Sense Data is zero indicating that no error
839cb99e8f7483 Khalid Aziz       2013-05-16  2900  	   occurred.
839cb99e8f7483 Khalid Aziz       2013-05-16  2901  	 */
839cb99e8f7483 Khalid Aziz       2013-05-16  2902  	if (cdb[0] == REQUEST_SENSE && command->sense_buffer[0] != 0) {
839cb99e8f7483 Khalid Aziz       2013-05-16  2903  		command->result = DID_OK << 16;
839cb99e8f7483 Khalid Aziz       2013-05-16  2904  		comp_cb(command);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2905  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2906  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2907  	/*
839cb99e8f7483 Khalid Aziz       2013-05-16  2908  	   Allocate a CCB from the Host Adapter's free list. In the unlikely
839cb99e8f7483 Khalid Aziz       2013-05-16  2909  	   event that there are none available and memory allocation fails,
839cb99e8f7483 Khalid Aziz       2013-05-16  2910  	   wait 1 second and try again. If that fails, the Host Adapter is
839cb99e8f7483 Khalid Aziz       2013-05-16  2911  	   probably hung so signal an error as a Host Adapter Hard Reset
839cb99e8f7483 Khalid Aziz       2013-05-16  2912  	   should be initiated soon.
839cb99e8f7483 Khalid Aziz       2013-05-16  2913  	 */
839cb99e8f7483 Khalid Aziz       2013-05-16  2914  	ccb = blogic_alloc_ccb(adapter);
839cb99e8f7483 Khalid Aziz       2013-05-16  2915  	if (ccb == NULL) {
839cb99e8f7483 Khalid Aziz       2013-05-16  2916  		spin_unlock_irq(adapter->scsi_host->host_lock);
839cb99e8f7483 Khalid Aziz       2013-05-16  2917  		blogic_delay(1);
839cb99e8f7483 Khalid Aziz       2013-05-16  2918  		spin_lock_irq(adapter->scsi_host->host_lock);
839cb99e8f7483 Khalid Aziz       2013-05-16  2919  		ccb = blogic_alloc_ccb(adapter);
839cb99e8f7483 Khalid Aziz       2013-05-16  2920  		if (ccb == NULL) {
839cb99e8f7483 Khalid Aziz       2013-05-16  2921  			command->result = DID_ERROR << 16;
839cb99e8f7483 Khalid Aziz       2013-05-16  2922  			comp_cb(command);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2923  			return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2924  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2925  	}
ddc914c741c137 FUJITA Tomonori   2007-05-14  2926  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2927  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2928  	   Initialize the fields in the BusLogic Command Control Block (CCB).
^1da177e4c3f41 Linus Torvalds    2005-04-16  2929  	 */
839cb99e8f7483 Khalid Aziz       2013-05-16  2930  	count = scsi_dma_map(command);
839cb99e8f7483 Khalid Aziz       2013-05-16  2931  	BUG_ON(count < 0);
839cb99e8f7483 Khalid Aziz       2013-05-16  2932  	if (count) {
ddc914c741c137 FUJITA Tomonori   2007-05-14  2933  		struct scatterlist *sg;
ddc914c741c137 FUJITA Tomonori   2007-05-14  2934  		int i;
ddc914c741c137 FUJITA Tomonori   2007-05-14  2935  
839cb99e8f7483 Khalid Aziz       2013-05-16  2936  		ccb->opcode = BLOGIC_INITIATOR_CCB_SG;
839cb99e8f7483 Khalid Aziz       2013-05-16  2937  		ccb->datalen = count * sizeof(struct blogic_sg_seg);
839cb99e8f7483 Khalid Aziz       2013-05-16  2938  		if (blogic_multimaster_type(adapter))
56f396146af278 Matt Wang         2021-05-11  2939  			ccb->data = (unsigned int) ccb->dma_handle +
839cb99e8f7483 Khalid Aziz       2013-05-16  2940  					((unsigned long) &ccb->sglist -
56f396146af278 Matt Wang         2021-05-11  2941  					(unsigned long) ccb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2942  		else
56f396146af278 Matt Wang         2021-05-11  2943  			ccb->data = virt_to_32bit_virt(ccb->sglist);
ddc914c741c137 FUJITA Tomonori   2007-05-14  2944  
839cb99e8f7483 Khalid Aziz       2013-05-16  2945  		scsi_for_each_sg(command, sg, count, i) {
839cb99e8f7483 Khalid Aziz       2013-05-16  2946  			ccb->sglist[i].segbytes = sg_dma_len(sg);
839cb99e8f7483 Khalid Aziz       2013-05-16  2947  			ccb->sglist[i].segdata = sg_dma_address(sg);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2948  		}
839cb99e8f7483 Khalid Aziz       2013-05-16  2949  	} else if (!count) {
839cb99e8f7483 Khalid Aziz       2013-05-16  2950  		ccb->opcode = BLOGIC_INITIATOR_CCB;
839cb99e8f7483 Khalid Aziz       2013-05-16  2951  		ccb->datalen = buflen;
839cb99e8f7483 Khalid Aziz       2013-05-16  2952  		ccb->data = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2953  	}
ddc914c741c137 FUJITA Tomonori   2007-05-14  2954  
839cb99e8f7483 Khalid Aziz       2013-05-16  2955  	switch (cdb[0]) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2956  	case READ_6:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2957  	case READ_10:
839cb99e8f7483 Khalid Aziz       2013-05-16  2958  		ccb->datadir = BLOGIC_DATAIN_CHECKED;
839cb99e8f7483 Khalid Aziz       2013-05-16  2959  		tgt_stats[tgt_id].read_cmds++;
839cb99e8f7483 Khalid Aziz       2013-05-16  2960  		blogic_addcount(&tgt_stats[tgt_id].bytesread, buflen);
839cb99e8f7483 Khalid Aziz       2013-05-16  2961  		blogic_incszbucket(tgt_stats[tgt_id].read_sz_buckets, buflen);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2962  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2963  	case WRITE_6:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2964  	case WRITE_10:
839cb99e8f7483 Khalid Aziz       2013-05-16  2965  		ccb->datadir = BLOGIC_DATAOUT_CHECKED;
839cb99e8f7483 Khalid Aziz       2013-05-16  2966  		tgt_stats[tgt_id].write_cmds++;
839cb99e8f7483 Khalid Aziz       2013-05-16  2967  		blogic_addcount(&tgt_stats[tgt_id].byteswritten, buflen);
839cb99e8f7483 Khalid Aziz       2013-05-16  2968  		blogic_incszbucket(tgt_stats[tgt_id].write_sz_buckets, buflen);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2969  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2970  	default:
839cb99e8f7483 Khalid Aziz       2013-05-16  2971  		ccb->datadir = BLOGIC_UNCHECKED_TX;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2972  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2973  	}
839cb99e8f7483 Khalid Aziz       2013-05-16  2974  	ccb->cdblen = cdblen;
839cb99e8f7483 Khalid Aziz       2013-05-16  2975  	ccb->adapter_status = 0;
839cb99e8f7483 Khalid Aziz       2013-05-16  2976  	ccb->tgt_status = 0;
839cb99e8f7483 Khalid Aziz       2013-05-16  2977  	ccb->tgt_id = tgt_id;
839cb99e8f7483 Khalid Aziz       2013-05-16  2978  	ccb->lun = lun;
839cb99e8f7483 Khalid Aziz       2013-05-16  2979  	ccb->tag_enable = false;
839cb99e8f7483 Khalid Aziz       2013-05-16  2980  	ccb->legacytag_enable = false;
839cb99e8f7483 Khalid Aziz       2013-05-16  2981  	/*
839cb99e8f7483 Khalid Aziz       2013-05-16  2982  	   BusLogic recommends that after a Reset the first couple of
839cb99e8f7483 Khalid Aziz       2013-05-16  2983  	   commands that are sent to a Target Device be sent in a non
839cb99e8f7483 Khalid Aziz       2013-05-16  2984  	   Tagged Queue fashion so that the Host Adapter and Target Device
839cb99e8f7483 Khalid Aziz       2013-05-16  2985  	   can establish Synchronous and Wide Transfer before Queue Tag
839cb99e8f7483 Khalid Aziz       2013-05-16  2986  	   messages can interfere with the Synchronous and Wide Negotiation
839cb99e8f7483 Khalid Aziz       2013-05-16  2987  	   messages.  By waiting to enable Tagged Queuing until after the
839cb99e8f7483 Khalid Aziz       2013-05-16  2988  	   first BLOGIC_MAX_TAG_DEPTH commands have been queued, it is
839cb99e8f7483 Khalid Aziz       2013-05-16  2989  	   assured that after a Reset any pending commands are requeued
839cb99e8f7483 Khalid Aziz       2013-05-16  2990  	   before Tagged Queuing is enabled and that the Tagged Queuing
839cb99e8f7483 Khalid Aziz       2013-05-16  2991  	   message will not occur while the partition table is being printed.
839cb99e8f7483 Khalid Aziz       2013-05-16  2992  	   In addition, some devices do not properly handle the transition
839cb99e8f7483 Khalid Aziz       2013-05-16  2993  	   from non-tagged to tagged commands, so it is necessary to wait
839cb99e8f7483 Khalid Aziz       2013-05-16  2994  	   until there are no pending commands for a target device
^1da177e4c3f41 Linus Torvalds    2005-04-16  2995  	   before queuing tagged commands.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2996  	 */
839cb99e8f7483 Khalid Aziz       2013-05-16  2997  	if (adapter->cmds_since_rst[tgt_id]++ >= BLOGIC_MAX_TAG_DEPTH &&
839cb99e8f7483 Khalid Aziz       2013-05-16  2998  			!tgt_flags->tagq_active &&
839cb99e8f7483 Khalid Aziz       2013-05-16  2999  			adapter->active_cmds[tgt_id] == 0
839cb99e8f7483 Khalid Aziz       2013-05-16  3000  			&& tgt_flags->tagq_ok &&
839cb99e8f7483 Khalid Aziz       2013-05-16  3001  			(adapter->tagq_ok & (1 << tgt_id))) {
839cb99e8f7483 Khalid Aziz       2013-05-16  3002  		tgt_flags->tagq_active = true;
839cb99e8f7483 Khalid Aziz       2013-05-16  3003  		blogic_notice("Tagged Queuing now active for Target %d\n",
839cb99e8f7483 Khalid Aziz       2013-05-16  3004  					adapter, tgt_id);
839cb99e8f7483 Khalid Aziz       2013-05-16  3005  	}
839cb99e8f7483 Khalid Aziz       2013-05-16  3006  	if (tgt_flags->tagq_active) {
839cb99e8f7483 Khalid Aziz       2013-05-16  3007  		enum blogic_queuetag queuetag = BLOGIC_SIMPLETAG;
839cb99e8f7483 Khalid Aziz       2013-05-16  3008  		/*
839cb99e8f7483 Khalid Aziz       2013-05-16  3009  		   When using Tagged Queuing with Simple Queue Tags, it
839cb99e8f7483 Khalid Aziz       2013-05-16  3010  		   appears that disk drive controllers do not guarantee that
839cb99e8f7483 Khalid Aziz       2013-05-16  3011  		   a queued command will not remain in a disconnected state
839cb99e8f7483 Khalid Aziz       2013-05-16  3012  		   indefinitely if commands that read or write nearer the
839cb99e8f7483 Khalid Aziz       2013-05-16  3013  		   head position continue to arrive without interruption.
839cb99e8f7483 Khalid Aziz       2013-05-16  3014  		   Therefore, for each Target Device this driver keeps track
839cb99e8f7483 Khalid Aziz       2013-05-16  3015  		   of the last time either the queue was empty or an Ordered
839cb99e8f7483 Khalid Aziz       2013-05-16  3016  		   Queue Tag was issued. If more than 4 seconds (one fifth
839cb99e8f7483 Khalid Aziz       2013-05-16  3017  		   of the 20 second disk timeout) have elapsed since this
839cb99e8f7483 Khalid Aziz       2013-05-16  3018  		   last sequence point, this command will be issued with an
839cb99e8f7483 Khalid Aziz       2013-05-16  3019  		   Ordered Queue Tag rather than a Simple Queue Tag, which
839cb99e8f7483 Khalid Aziz       2013-05-16  3020  		   forces the Target Device to complete all previously
839cb99e8f7483 Khalid Aziz       2013-05-16  3021  		   queued commands before this command may be executed.
839cb99e8f7483 Khalid Aziz       2013-05-16  3022  		 */
839cb99e8f7483 Khalid Aziz       2013-05-16  3023  		if (adapter->active_cmds[tgt_id] == 0)
839cb99e8f7483 Khalid Aziz       2013-05-16  3024  			adapter->last_seqpoint[tgt_id] = jiffies;
839cb99e8f7483 Khalid Aziz       2013-05-16  3025  		else if (time_after(jiffies,
839cb99e8f7483 Khalid Aziz       2013-05-16  3026  				adapter->last_seqpoint[tgt_id] + 4 * HZ)) {
839cb99e8f7483 Khalid Aziz       2013-05-16  3027  			adapter->last_seqpoint[tgt_id] = jiffies;
839cb99e8f7483 Khalid Aziz       2013-05-16  3028  			queuetag = BLOGIC_ORDEREDTAG;
839cb99e8f7483 Khalid Aziz       2013-05-16  3029  		}
839cb99e8f7483 Khalid Aziz       2013-05-16  3030  		if (adapter->ext_lun) {
839cb99e8f7483 Khalid Aziz       2013-05-16  3031  			ccb->tag_enable = true;
839cb99e8f7483 Khalid Aziz       2013-05-16  3032  			ccb->queuetag = queuetag;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3033  		} else {
839cb99e8f7483 Khalid Aziz       2013-05-16  3034  			ccb->legacytag_enable = true;
839cb99e8f7483 Khalid Aziz       2013-05-16  3035  			ccb->legacy_tag = queuetag;
839cb99e8f7483 Khalid Aziz       2013-05-16  3036  		}
839cb99e8f7483 Khalid Aziz       2013-05-16  3037  	}
839cb99e8f7483 Khalid Aziz       2013-05-16  3038  	memcpy(ccb->cdb, cdb, cdblen);
839cb99e8f7483 Khalid Aziz       2013-05-16  3039  	ccb->sense_datalen = SCSI_SENSE_BUFFERSIZE;
eeceec904031f8 Khalid Aziz       2013-09-13  3040  	ccb->command = command;
17a361b20a0f90 Christoph Hellwig 2018-10-10  3041  	sense_buf = dma_map_single(&adapter->pci_device->dev,
839cb99e8f7483 Khalid Aziz       2013-05-16  3042  				command->sense_buffer, ccb->sense_datalen,
17a361b20a0f90 Christoph Hellwig 2018-10-10  3043  				DMA_FROM_DEVICE);
eeceec904031f8 Khalid Aziz       2013-09-13  3044  	if (dma_mapping_error(&adapter->pci_device->dev, sense_buf)) {
eeceec904031f8 Khalid Aziz       2013-09-13  3045  		blogic_err("DMA mapping for sense data buffer failed\n",
eeceec904031f8 Khalid Aziz       2013-09-13  3046  				adapter);
eeceec904031f8 Khalid Aziz       2013-09-13  3047  		blogic_dealloc_ccb(ccb, 0);
eeceec904031f8 Khalid Aziz       2013-09-13  3048  		return SCSI_MLQUEUE_HOST_BUSY;
eeceec904031f8 Khalid Aziz       2013-09-13  3049  	}
eeceec904031f8 Khalid Aziz       2013-09-13  3050  	ccb->sensedata = sense_buf;
839cb99e8f7483 Khalid Aziz       2013-05-16  3051  	if (blogic_multimaster_type(adapter)) {
839cb99e8f7483 Khalid Aziz       2013-05-16  3052  		/*
839cb99e8f7483 Khalid Aziz       2013-05-16  3053  		   Place the CCB in an Outgoing Mailbox. The higher levels
839cb99e8f7483 Khalid Aziz       2013-05-16  3054  		   of the SCSI Subsystem should not attempt to queue more
839cb99e8f7483 Khalid Aziz       2013-05-16  3055  		   commands than can be placed in Outgoing Mailboxes, so
839cb99e8f7483 Khalid Aziz       2013-05-16  3056  		   there should always be one free.  In the unlikely event
839cb99e8f7483 Khalid Aziz       2013-05-16  3057  		   that there are none available, wait 1 second and try
839cb99e8f7483 Khalid Aziz       2013-05-16  3058  		   again. If that fails, the Host Adapter is probably hung
839cb99e8f7483 Khalid Aziz       2013-05-16  3059  		   so signal an error as a Host Adapter Hard Reset should
839cb99e8f7483 Khalid Aziz       2013-05-16  3060  		   be initiated soon.
839cb99e8f7483 Khalid Aziz       2013-05-16  3061  		 */
839cb99e8f7483 Khalid Aziz       2013-05-16  3062  		if (!blogic_write_outbox(adapter, BLOGIC_MBOX_START, ccb)) {
839cb99e8f7483 Khalid Aziz       2013-05-16  3063  			spin_unlock_irq(adapter->scsi_host->host_lock);
43622697117c39 Colin Ian King    2020-01-08  3064  			blogic_warn("Unable to write Outgoing Mailbox - Pausing for 1 second\n", adapter);
839cb99e8f7483 Khalid Aziz       2013-05-16  3065  			blogic_delay(1);
839cb99e8f7483 Khalid Aziz       2013-05-16  3066  			spin_lock_irq(adapter->scsi_host->host_lock);
839cb99e8f7483 Khalid Aziz       2013-05-16  3067  			if (!blogic_write_outbox(adapter, BLOGIC_MBOX_START,
839cb99e8f7483 Khalid Aziz       2013-05-16  3068  						ccb)) {
43622697117c39 Colin Ian King    2020-01-08  3069  				blogic_warn("Still unable to write Outgoing Mailbox - Host Adapter Dead?\n", adapter);
eeceec904031f8 Khalid Aziz       2013-09-13  3070  				blogic_dealloc_ccb(ccb, 1);
839cb99e8f7483 Khalid Aziz       2013-05-16  3071  				command->result = DID_ERROR << 16;
0800a26aaa805d Bart Van Assche   2021-10-07  3072  				scsi_done(command);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3073  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3074  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3075  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3076  		/*
839cb99e8f7483 Khalid Aziz       2013-05-16  3077  		   Call the FlashPoint SCCB Manager to start execution of
839cb99e8f7483 Khalid Aziz       2013-05-16  3078  		   the CCB.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3079  		 */
839cb99e8f7483 Khalid Aziz       2013-05-16  3080  		ccb->status = BLOGIC_CCB_ACTIVE;
839cb99e8f7483 Khalid Aziz       2013-05-16  3081  		adapter->active_cmds[tgt_id]++;
839cb99e8f7483 Khalid Aziz       2013-05-16  3082  		tgt_stats[tgt_id].cmds_tried++;
839cb99e8f7483 Khalid Aziz       2013-05-16  3083  		FlashPoint_StartCCB(adapter->cardhandle, ccb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3084  		/*
839cb99e8f7483 Khalid Aziz       2013-05-16  3085  		   The Command may have already completed and
839cb99e8f7483 Khalid Aziz       2013-05-16  3086  		   blogic_qcompleted_ccb been called, or it may still be
839cb99e8f7483 Khalid Aziz       2013-05-16  3087  		   pending.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3088  		 */
839cb99e8f7483 Khalid Aziz       2013-05-16  3089  		if (ccb->status == BLOGIC_CCB_COMPLETE)
839cb99e8f7483 Khalid Aziz       2013-05-16  3090  			blogic_process_ccbs(adapter);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3091  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16 @3092  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3093  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3094  

:::::: The code at line 3092 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
