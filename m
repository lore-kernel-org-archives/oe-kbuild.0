Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC0C29E0E7
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716924; cv=none; b=SVsfdWTldRik1uGFUvqSllElEbmM0cjPZWoE8XGe8CcBp0CKAUlgPC1Et66ebDy8NzYB+8iPPIQeYDI1bYcKP460QCTBobbjVE44ahZLoXxrQWLwZQrhJ20WooosKKOT6Oqpb2AI2DHd4P8GmvAO32G6Vxgrw7HLqU9WFGdnFTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716924; c=relaxed/simple;
	bh=bbEuHriIii+MSj5N8DSTNqqqrd61rdU2d3Cwi1nz4ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNzVMS1dD0UwrgBo4tywV1Izm+XBDMQYg+6XH5205dtrm5WX6MDhJDuC5PwkEnji12xaEd9x2lkK3HMiQ8HW7ejCHAvYOSqh4iyhbR0lsDpX5dwSJr1suFLAyt+0gepb1gGeNe2bE4l/Mo8SaQH/vY8vO/vJfnUWVhTzCVR7nbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzxtkOfy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzxtkOfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764716922; x=1796252922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbEuHriIii+MSj5N8DSTNqqqrd61rdU2d3Cwi1nz4ok=;
  b=AzxtkOfyKN5h2RCbZaqSw/DASdt7nXRF4Z8zP8uTeGR7/LsGFP6D8DpE
   K8p/vwPfC5gu5d3d+cfOXZ1E/l+++PEN1uq0NFKW6lhdq5MszgqPzL1Ul
   4oKFNzw2yyoUE9mClqWpQmkR6BYHP3hqPuXu2lbujlP1C9LLG0bt4fOSz
   IasUP+9q861yT0Hw036qpZj1n7c4JnI7KOPAhYcaOcPfzRFiSIQgkznMY
   tlCPARBKkW3YW2L6J9qFVuRRWgdv/Fuq7FIgTxb6SOPMgEpIbp6o3ig+B
   vVqT60Oqm7JLeNc6BBV1VwPSwyPc+VBZuLA63T8i2tah9m7Zp94TSlUmv
   w==;
X-CSE-ConnectionGUID: AeNPFWFdSQyIjX5YDRCzfA==
X-CSE-MsgGUID: 8nMFL1pVTNGKJelVElwlbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70555683"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="70555683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:08:41 -0800
X-CSE-ConnectionGUID: J5SBaCXGSHW10g2PSuTWwA==
X-CSE-MsgGUID: zuBKZayJS/WkGEfXRDCEkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194322026"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 15:08:41 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZU5-000000002zT-3Gmw;
	Tue, 02 Dec 2025 23:08:37 +0000
Date: Wed, 3 Dec 2025 00:07:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/scsi_error.c:1122:30: error: no member named
 'crypt_keyslot' in 'struct request'
Message-ID: <202512030009.uEjbkgaL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Po-Wen-Kao/scsi-core-Fix-error-handler-encryption-support/20251202-091809, commit: a701e84256b6bd4d9c648e331df0d6f711925c57"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Kao <powenkao@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Po-Wen-Kao/scsi-core-Fix-error-handler-encryption-support/20251202-091809
head:   a701e84256b6bd4d9c648e331df0d6f711925c57
commit: a701e84256b6bd4d9c648e331df0d6f711925c57 scsi: core: Fix error handler encryption support
date:   22 hours ago
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251203/202512030009.uEjbkgaL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030009.uEjbkgaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512030009.uEjbkgaL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:1122:30: error: no member named 'crypt_keyslot' in 'struct request'
    1122 |         ses->rq_crypt_keyslot = rq->crypt_keyslot;
         |                                 ~~  ^
>> drivers/scsi/scsi_error.c:1123:26: error: no member named 'crypt_ctx' in 'struct request'
    1123 |         ses->rq_crypt_ctx = rq->crypt_ctx;
         |                             ~~  ^
   drivers/scsi/scsi_error.c:1125:6: error: no member named 'crypt_keyslot' in 'struct request'
    1125 |         rq->crypt_keyslot = NULL;
         |         ~~  ^
   drivers/scsi/scsi_error.c:1126:6: error: no member named 'crypt_ctx' in 'struct request'
    1126 |         rq->crypt_ctx = NULL;
         |         ~~  ^
   drivers/scsi/scsi_error.c:1160:6: error: no member named 'crypt_keyslot' in 'struct request'
    1160 |         rq->crypt_keyslot = ses->rq_crypt_keyslot;
         |         ~~  ^
   drivers/scsi/scsi_error.c:1161:6: error: no member named 'crypt_ctx' in 'struct request'
    1161 |         rq->crypt_ctx = ses->rq_crypt_ctx;
         |         ~~  ^
   6 errors generated.


vim +1122 drivers/scsi/scsi_error.c

292148f8bb2b5d Brian King         2007-01-30  1047  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1048  /**
3b729f76478756 Santosh Y          2012-04-08  1049   * scsi_eh_prep_cmnd  - Save a scsi command info as part of error recovery
2dc611de5a3fd9 Christoph Hellwig  2006-11-04  1050   * @scmd:       SCSI command structure to hijack
e1c234685c5080 Boaz Harrosh       2007-10-08  1051   * @ses:        structure to save restore information
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1052   * @cmnd:       CDB to send. Can be NULL if no new cmnd is needed
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1053   * @cmnd_size:  size in bytes of @cmnd (must be <= MAX_COMMAND_SIZE)
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1054   * @sense_bytes: size of sense data to copy. or 0 (if != 0 @cmnd is ignored)
2dc611de5a3fd9 Christoph Hellwig  2006-11-04  1055   *
e1c234685c5080 Boaz Harrosh       2007-10-08  1056   * This function is used to save a scsi command information before re-execution
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1057   * as part of the error recovery process.  If @sense_bytes is 0 the command
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1058   * sent must be one that does not transfer any data.  If @sense_bytes != 0
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1059   * @cmnd is ignored and this functions sets up a REQUEST_SENSE command
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1060   * and cmnd buffers to read @sense_bytes into @scmd->sense_buffer.
dc8875e1078961 Randy Dunlap       2007-11-15  1061   */
e1c234685c5080 Boaz Harrosh       2007-10-08  1062  void scsi_eh_prep_cmnd(struct scsi_cmnd *scmd, struct scsi_eh_save *ses,
e1c234685c5080 Boaz Harrosh       2007-10-08  1063  			unsigned char *cmnd, int cmnd_size, unsigned sense_bytes)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1064  {
f59114b7b5dc67 Tejun Heo          2005-04-17  1065  	struct scsi_device *sdev = scmd->device;
a701e84256b6bd Brian Kao          2025-12-02  1066  	struct request *rq = scsi_cmd_to_rq(scmd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1067  
631c228cd09bd5 Christoph Hellwig  2006-07-08  1068  	/*
631c228cd09bd5 Christoph Hellwig  2006-07-08  1069  	 * We need saved copies of a number of fields - this is because
631c228cd09bd5 Christoph Hellwig  2006-07-08  1070  	 * error handling may need to overwrite these with different values
631c228cd09bd5 Christoph Hellwig  2006-07-08  1071  	 * to run different commands, and once error handling is complete,
631c228cd09bd5 Christoph Hellwig  2006-07-08  1072  	 * we will need to restore these values prior to running the actual
631c228cd09bd5 Christoph Hellwig  2006-07-08  1073  	 * command.
631c228cd09bd5 Christoph Hellwig  2006-07-08  1074  	 */
e1c234685c5080 Boaz Harrosh       2007-10-08  1075  	ses->cmd_len = scmd->cmd_len;
e1c234685c5080 Boaz Harrosh       2007-10-08  1076  	ses->data_direction = scmd->sc_data_direction;
30b0c37b27485a Boaz Harrosh       2007-12-13  1077  	ses->sdb = scmd->sdb;
e1c234685c5080 Boaz Harrosh       2007-10-08  1078  	ses->result = scmd->result;
a9a4ea1166d640 Christoph Hellwig  2022-02-24  1079  	ses->resid_len = scmd->resid_len;
12265709ac6e19 Alan Stern         2008-07-21  1080  	ses->underflow = scmd->underflow;
db007fc5e20c00 Martin K. Petersen 2008-07-17  1081  	ses->prot_op = scmd->prot_op;
8e8c9d01c5ea33 Hannes Reinecke    2017-04-06  1082  	ses->eh_eflags = scmd->eh_eflags;
631c228cd09bd5 Christoph Hellwig  2006-07-08  1083  
db007fc5e20c00 Martin K. Petersen 2008-07-17  1084  	scmd->prot_op = SCSI_PROT_NORMAL;
c69e6f812bab0d James Bottomley    2014-04-10  1085  	scmd->eh_eflags = 0;
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1086  	memcpy(ses->cmnd, scmd->cmnd, sizeof(ses->cmnd));
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1087  	memset(scmd->cmnd, 0, sizeof(scmd->cmnd));
30b0c37b27485a Boaz Harrosh       2007-12-13  1088  	memset(&scmd->sdb, 0, sizeof(scmd->sdb));
644373a4219add Alan Stern         2014-03-28  1089  	scmd->result = 0;
a9a4ea1166d640 Christoph Hellwig  2022-02-24  1090  	scmd->resid_len = 0;
30b0c37b27485a Boaz Harrosh       2007-12-13  1091  
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1092  	if (sense_bytes) {
30b0c37b27485a Boaz Harrosh       2007-12-13  1093  		scmd->sdb.length = min_t(unsigned, SCSI_SENSE_BUFFERSIZE,
30b0c37b27485a Boaz Harrosh       2007-12-13  1094  					 sense_bytes);
e1c234685c5080 Boaz Harrosh       2007-10-08  1095  		sg_init_one(&ses->sense_sgl, scmd->sense_buffer,
30b0c37b27485a Boaz Harrosh       2007-12-13  1096  			    scmd->sdb.length);
30b0c37b27485a Boaz Harrosh       2007-12-13  1097  		scmd->sdb.table.sgl = &ses->sense_sgl;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1098  		scmd->sc_data_direction = DMA_FROM_DEVICE;
0c958ecc69c277 Tony Battersby     2015-07-16  1099  		scmd->sdb.table.nents = scmd->sdb.table.orig_nents = 1;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1100  		scmd->cmnd[0] = REQUEST_SENSE;
30b0c37b27485a Boaz Harrosh       2007-12-13  1101  		scmd->cmnd[4] = scmd->sdb.length;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1102  		scmd->cmd_len = COMMAND_SIZE(scmd->cmnd[0]);
631c228cd09bd5 Christoph Hellwig  2006-07-08  1103  	} else {
631c228cd09bd5 Christoph Hellwig  2006-07-08  1104  		scmd->sc_data_direction = DMA_NONE;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1105  		if (cmnd) {
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1106  			BUG_ON(cmnd_size > sizeof(scmd->cmnd));
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1107  			memcpy(scmd->cmnd, cmnd, cmnd_size);
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1108  			scmd->cmd_len = COMMAND_SIZE(scmd->cmnd[0]);
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1109  		}
631c228cd09bd5 Christoph Hellwig  2006-07-08  1110  	}
631c228cd09bd5 Christoph Hellwig  2006-07-08  1111  
631c228cd09bd5 Christoph Hellwig  2006-07-08  1112  	scmd->underflow = 0;
631c228cd09bd5 Christoph Hellwig  2006-07-08  1113  
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1114  	if (sdev->scsi_level <= SCSI_2 && sdev->scsi_level != SCSI_UNKNOWN)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1115  		scmd->cmnd[1] = (scmd->cmnd[1] & 0x1f) |
f59114b7b5dc67 Tejun Heo          2005-04-17  1116  			(sdev->lun << 5 & 0xe0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1117  
a701e84256b6bd Brian Kao          2025-12-02  1118  	/*
a701e84256b6bd Brian Kao          2025-12-02  1119  	 * Encryption must be disabled for the commands submitted by the error handler.
a701e84256b6bd Brian Kao          2025-12-02  1120  	 * Hence, clear the encryption context information.
a701e84256b6bd Brian Kao          2025-12-02  1121  	 */
a701e84256b6bd Brian Kao          2025-12-02 @1122  	ses->rq_crypt_keyslot = rq->crypt_keyslot;
a701e84256b6bd Brian Kao          2025-12-02 @1123  	ses->rq_crypt_ctx = rq->crypt_ctx;
a701e84256b6bd Brian Kao          2025-12-02  1124  
a701e84256b6bd Brian Kao          2025-12-02  1125  	rq->crypt_keyslot = NULL;
a701e84256b6bd Brian Kao          2025-12-02  1126  	rq->crypt_ctx = NULL;
a701e84256b6bd Brian Kao          2025-12-02  1127  
631c228cd09bd5 Christoph Hellwig  2006-07-08  1128  	/*
631c228cd09bd5 Christoph Hellwig  2006-07-08  1129  	 * Zero the sense buffer.  The scsi spec mandates that any
631c228cd09bd5 Christoph Hellwig  2006-07-08  1130  	 * untransferred sense data should be interpreted as being zero.
631c228cd09bd5 Christoph Hellwig  2006-07-08  1131  	 */
b80ca4f7ee36c2 FUJITA Tomonori    2008-01-13  1132  	memset(scmd->sense_buffer, 0, SCSI_SENSE_BUFFERSIZE);
e1c234685c5080 Boaz Harrosh       2007-10-08  1133  }
e1c234685c5080 Boaz Harrosh       2007-10-08  1134  EXPORT_SYMBOL(scsi_eh_prep_cmnd);
e1c234685c5080 Boaz Harrosh       2007-10-08  1135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
