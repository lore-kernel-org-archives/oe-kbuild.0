Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467721F4190
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695801; cv=none; b=tlyndqyNFETQ06qxDQOCLJ42tjRGlkVXbDD2+cIOcX+N1IrkW9p9uujsKkNLFioFXT2kdGSW/aVlyfdBGNpBkvlLebboo4PCSel32oMOL/Bn2c0/aQm5STUwMHAfN58t6PMojZ1d4PVBFh0s3vf3jK47891cHjypAf1FTRV1UCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695801; c=relaxed/simple;
	bh=m/LOOqqN3WBFpMCc1pyQEfm86EuG32yeKmkfrWTv+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E426o/JMVVdsJAuGvdeoOZwN+m/B+l6uNWxO6EuN1bnSBaLxzR66FTyvFHTIdolUMvYSNNTNzjsyfjoCn1p8nvFjTFJe3VWZWShybzmqpfLZZfKoCthSkKqrA5/jWhICZtciDEAIVBcVzukh6Fvsb9BkaltN82KVsuHFeDzomjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsN92p/5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsN92p/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764695799; x=1796231799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/LOOqqN3WBFpMCc1pyQEfm86EuG32yeKmkfrWTv+C4=;
  b=VsN92p/5HY8qzJ3c26yb/5DD6R4nlxzBYRCUpczmrop1pbmP2BO9VAjE
   8+4EMPkI9ugq5aHXQkwIcHUFJxHWhFFHSw/B617zAjMJ8Y98F7hBmm2IQ
   1uVUpdH6ze8wSh8BTK23scVG+G/GB1r4FW1k2/rvnmBpCpZKc3dgdPZyE
   +praAFbO4i9HI2z6n4B6hxLRA/LezU/C0sChFdZuoHLsy2t42bZJsHsPM
   svhZV6sEv/WybhnF1mDlvFchG/CTiPPIIqoosITcnj+2HG28mITGccn5B
   H4HIGbVklZFk4iphtvQAZWCO5GvhMuWR5AvOf1jFxxnASooE1FivcUHez
   g==;
X-CSE-ConnectionGUID: Wkc9JCKHTGuVhla13YjsFA==
X-CSE-MsgGUID: 2WlTTkJnRTqW3vxxn4msgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76992088"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="76992088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:16:39 -0800
X-CSE-ConnectionGUID: 0c/NWu3FSJaQGYx6SZY9xQ==
X-CSE-MsgGUID: m74S3TbnQPSurDk2gdF69w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198906222"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 09:16:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQTzP-000000002wP-2CLZ;
	Tue, 02 Dec 2025 17:16:35 +0000
Date: Tue, 2 Dec 2025 18:16:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/tpm/tpm2-cmd.c:210:20: error: invalid use of void
 expression
Message-ID: <202512021855.UvxHIno1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Jarkko-Sakkinen/tpm2-sessions-address-out-of-range-indexing/20251202-034236, commit: 991addbbc9ef9c912d1dce90bf0e8a9b83b1704e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-address-out-of-range-indexing/20251202-034236
head:   991addbbc9ef9c912d1dce90bf0e8a9b83b1704e
commit: 991addbbc9ef9c912d1dce90bf0e8a9b83b1704e tpm2-sessions: address out-of-range indexing
date:   22 hours ago
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021855.UvxHIno1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021855.UvxHIno1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021855.UvxHIno1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_pcr_extend':
>> drivers/char/tpm/tpm2-cmd.c:210:20: error: invalid use of void expression
     210 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_get_random':
   drivers/char/tpm/tpm2-cmd.c:274:21: error: invalid use of void expression
     274 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^


vim +210 drivers/char/tpm/tpm2-cmd.c

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  160  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  161   * tpm2_pcr_extend() - extend a PCR value
794c6e109b5938 Winkler, Tomas  2016-11-23  162   *
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  163   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   * @pcr_idx:	index of the PCR.
c1f92b4b04ad70 Nayna Jain      2017-01-30  165   * @digests:	list of pcr banks and corresponding digest values to extend.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  166   *
794c6e109b5938 Winkler, Tomas  2016-11-23  167   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  168   */
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  169  int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
aa042475938f58 Roberto Sassu   2019-02-06  170  		    struct tpm_digest *digests)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  {
c1f92b4b04ad70 Nayna Jain      2017-01-30  172  	struct tpm_buf buf;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  173  	int rc;
c1f92b4b04ad70 Nayna Jain      2017-01-30  174  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  175  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  176  	if (!disable_pcr_integrity) {
6519fea6fd372b James Bottomley 2024-04-29  177  		rc = tpm2_start_auth_session(chip);
c1f92b4b04ad70 Nayna Jain      2017-01-30  178  		if (rc)
c1f92b4b04ad70 Nayna Jain      2017-01-30  179  			return rc;
27184f8905ba68 Jarkko Sakkinen 2024-11-13  180  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  181  
6519fea6fd372b James Bottomley 2024-04-29  182  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
6519fea6fd372b James Bottomley 2024-04-29  183  	if (rc) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  184  		if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  185  			tpm2_end_auth_session(chip);
6519fea6fd372b James Bottomley 2024-04-29  186  		return rc;
6519fea6fd372b James Bottomley 2024-04-29  187  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  188  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  189  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  191  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  192  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  193  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  194  		}
6519fea6fd372b James Bottomley 2024-04-29  195  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  196  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  200  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  201  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  202  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  203  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  204  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  205  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  206  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  207  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  209  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01 @210  		rc = tpm_buf_fill_hmac_session(chip, &buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  211  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  212  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  213  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  214  		}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  215  	}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  216  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  217  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  218  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  219  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  220  
c1f92b4b04ad70 Nayna Jain      2017-01-30  221  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  223  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
