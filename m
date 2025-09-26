Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81FA13D503
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892608; cv=none; b=pn03RElOq3GxMDmF5ybg0Culv2fCLl6gQRultHZ1nI5yq3DdlhEsrO3zKHZmfT9g263TtmKHNcr74pznAhLKxdcCfoTHZV4HXA6Yd2QoBM4ePF0R3LqI56VK+N1mODG/fTxWD93ff6eQFYX1EsOWsh4SIdAe+KYWQCFY6RFKWBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892608; c=relaxed/simple;
	bh=H1vbql+U0JkvnmxovHmkKYgdUOfb+d5UbmbrLDuElVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amQSjg9G4Vi4GbYevhM5RxE1MPsY4bUWquJs7gKBkmxBdDGkaQcghgfXBhbYn6AtGFzGQCMPgxYJj4+FXCwZ8TIJuzWgP2CWEdZ+ZgNPxhZAYdjRDKhk5UbYQCDE0U8CjsbPxWbEWDCHlKCQ4YKzV9J3J4cxRfx4NOJIfJcjArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EG/vaA8d; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EG/vaA8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758892607; x=1790428607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H1vbql+U0JkvnmxovHmkKYgdUOfb+d5UbmbrLDuElVE=;
  b=EG/vaA8dHYjp/l9nSLymtsn7YiFRZjpfujvPIlUuLu82mPIqga0Ub3N0
   KC7iAj42dvQroUAdacD6hS8L9w+u5EL4sBbVf7IHZMsGwIyv0ZVqHHIRI
   j5IyGM9GPLIwf9m+lo51OhsQwUl/qRaj4wftKeQfCsGGuuk2EySvShnpg
   GJyJUN42h0GVE/kR187JPLorgCE0M3TXrW0VmlHgWfxSbUJcnfXMljt+g
   ruEOykygVr7lguIVyyHXScZ2Lp4IWPbu2quCwNayLgw5F3kmnb0fCV1yZ
   aQmOHjoBDRZIVqu4wehr6WxV3jeHaA3HiDOh6kdLGGrlL126JpKGj3Bwv
   w==;
X-CSE-ConnectionGUID: f8s+S4VBSA+Ppb+h1Aq6fw==
X-CSE-MsgGUID: SlbCn1wXSdC3lp81xnuedA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72658341"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="72658341"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 06:16:44 -0700
X-CSE-ConnectionGUID: HQ3ZGoxzS56/TTMx3i73zA==
X-CSE-MsgGUID: I9uOn/WhTnGYec0uByh4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177659794"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2025 06:16:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v28JV-0006Fd-0e;
	Fri, 26 Sep 2025 13:16:41 +0000
Date: Fri, 26 Sep 2025 21:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2-session 14/14]
 security/keys/trusted-keys/trusted_tpm2.c:489 tpm2_unseal_cmd() warn: this
 array is probably non-NULL. 'options->blobauth'
Message-ID: <202509262153.FS04ywtP-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   8443d24da35ca59b7be6056fa1ebe74070eb9e4a
commit: 8443d24da35ca59b7be6056fa1ebe74070eb9e4a [14/14] keys, trusted: Remove redundant helper
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r073-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262153.FS04ywtP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509262153.FS04ywtP-lkp@intel.com/

smatch warnings:
security/keys/trusted-keys/trusted_tpm2.c:489 tpm2_unseal_cmd() warn: this array is probably non-NULL. 'options->blobauth'

vim +489 security/keys/trusted-keys/trusted_tpm2.c

2e19e10131a08d Sumit Garg      2019-10-16  437  
2e19e10131a08d Sumit Garg      2019-10-16  438  /**
2e19e10131a08d Sumit Garg      2019-10-16  439   * tpm2_unseal_cmd() - execute a TPM2_Unload command
2e19e10131a08d Sumit Garg      2019-10-16  440   *
2e19e10131a08d Sumit Garg      2019-10-16  441   * @chip: TPM chip to use
2e19e10131a08d Sumit Garg      2019-10-16  442   * @payload: the key data in clear and encrypted form
2e19e10131a08d Sumit Garg      2019-10-16  443   * @options: authentication values and other options
2e19e10131a08d Sumit Garg      2019-10-16  444   * @blob_handle: blob handle
2e19e10131a08d Sumit Garg      2019-10-16  445   *
2e19e10131a08d Sumit Garg      2019-10-16  446   * Return: 0 on success
2e19e10131a08d Sumit Garg      2019-10-16  447   *         -EPERM on tpm error status
2e19e10131a08d Sumit Garg      2019-10-16  448   *         < 0 error from tpm_send
2e19e10131a08d Sumit Garg      2019-10-16  449   */
2e19e10131a08d Sumit Garg      2019-10-16  450  static int tpm2_unseal_cmd(struct tpm_chip *chip,
2e19e10131a08d Sumit Garg      2019-10-16  451  			   struct trusted_key_payload *payload,
2e19e10131a08d Sumit Garg      2019-10-16  452  			   struct trusted_key_options *options,
2e19e10131a08d Sumit Garg      2019-10-16  453  			   u32 blob_handle)
2e19e10131a08d Sumit Garg      2019-10-16  454  {
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  455  	struct tpm_header *head;
2e19e10131a08d Sumit Garg      2019-10-16  456  	struct tpm_buf buf;
2e19e10131a08d Sumit Garg      2019-10-16  457  	u16 data_len;
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  458  	int offset;
2e19e10131a08d Sumit Garg      2019-10-16  459  	u8 *data;
2e19e10131a08d Sumit Garg      2019-10-16  460  	int rc;
2e19e10131a08d Sumit Garg      2019-10-16  461  
52ce7d9731ed8f James Bottomley 2024-04-29  462  	rc = tpm2_start_auth_session(chip);
2e19e10131a08d Sumit Garg      2019-10-16  463  	if (rc)
2e19e10131a08d Sumit Garg      2019-10-16  464  		return rc;
2e19e10131a08d Sumit Garg      2019-10-16  465  
52ce7d9731ed8f James Bottomley 2024-04-29  466  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_UNSEAL);
52ce7d9731ed8f James Bottomley 2024-04-29  467  	if (rc) {
52ce7d9731ed8f James Bottomley 2024-04-29  468  		tpm2_end_auth_session(chip);
52ce7d9731ed8f James Bottomley 2024-04-29  469  		return rc;
52ce7d9731ed8f James Bottomley 2024-04-29  470  	}
52ce7d9731ed8f James Bottomley 2024-04-29  471  
52ce7d9731ed8f James Bottomley 2024-04-29  472  	tpm_buf_append_name(chip, &buf, blob_handle, NULL);
52ce7d9731ed8f James Bottomley 2024-04-29  473  
52ce7d9731ed8f James Bottomley 2024-04-29  474  	if (!options->policyhandle) {
52ce7d9731ed8f James Bottomley 2024-04-29  475  		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT,
52ce7d9731ed8f James Bottomley 2024-04-29  476  					    options->blobauth,
de66514d934d70 James Bottomley 2021-01-27  477  					    options->blobauth_len);
52ce7d9731ed8f James Bottomley 2024-04-29  478  	} else {
52ce7d9731ed8f James Bottomley 2024-04-29  479  		/*
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  480  		 * The policy session is generated outside the kernel, and thus
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  481  		 * the password will end up being unencrypted on the bus, as
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  482  		 * HMAC nonce cannot be calculated for it.
52ce7d9731ed8f James Bottomley 2024-04-29  483  		 */
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  484  		tpm_buf_append_u32(&buf, 9 + options->blobauth_len);
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  485  		tpm_buf_append_u32(&buf, options->policyhandle);
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  486  		tpm_buf_append_u16(&buf, 0);
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  487  		tpm_buf_append_u8(&buf, 0);
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  488  		tpm_buf_append_u16(&buf, options->blobauth_len);
8443d24da35ca5 Jarkko Sakkinen 2025-09-22 @489  		if (options->blobauth)
8443d24da35ca5 Jarkko Sakkinen 2025-09-22  490  			tpm_buf_append(&buf, options->blobauth, options->blobauth_len);
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  491  		if (tpm2_chip_auth(chip)) {
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  492  			tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT, NULL, 0);
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  493  		} else  {
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  494  			offset = buf.handles * 4 + TPM_HEADER_SIZE;
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  495  			head = (struct tpm_header *)buf.data;
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  496  			if (tpm_buf_length(&buf) == offset)
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  497  				head->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
5b7a67906ff10c Jarkko Sakkinen 2025-09-22  498  		}
52ce7d9731ed8f James Bottomley 2024-04-29  499  	}
2e19e10131a08d Sumit Garg      2019-10-16  500  
52ce7d9731ed8f James Bottomley 2024-04-29  501  	tpm_buf_fill_hmac_session(chip, &buf);
8c657a0590de58 Jarkko Sakkinen 2021-01-29  502  	rc = tpm_transmit_cmd(chip, &buf, 6, "unsealing");
52ce7d9731ed8f James Bottomley 2024-04-29  503  	rc = tpm_buf_check_hmac_response(chip, &buf, rc);
2e19e10131a08d Sumit Garg      2019-10-16  504  
2e19e10131a08d Sumit Garg      2019-10-16  505  	if (!rc) {
2e19e10131a08d Sumit Garg      2019-10-16  506  		data_len = be16_to_cpup(
2e19e10131a08d Sumit Garg      2019-10-16  507  			(__be16 *) &buf.data[TPM_HEADER_SIZE + 4]);
e5fb5d2c5a03e2 James Bottomley 2021-01-27  508  		if (data_len < MIN_KEY_SIZE ||  data_len > MAX_KEY_SIZE) {
2e19e10131a08d Sumit Garg      2019-10-16  509  			rc = -EFAULT;
2e19e10131a08d Sumit Garg      2019-10-16  510  			goto out;
2e19e10131a08d Sumit Garg      2019-10-16  511  		}
2e19e10131a08d Sumit Garg      2019-10-16  512  
2e19e10131a08d Sumit Garg      2019-10-16  513  		if (tpm_buf_length(&buf) < TPM_HEADER_SIZE + 6 + data_len) {
2e19e10131a08d Sumit Garg      2019-10-16  514  			rc = -EFAULT;
2e19e10131a08d Sumit Garg      2019-10-16  515  			goto out;
2e19e10131a08d Sumit Garg      2019-10-16  516  		}
2e19e10131a08d Sumit Garg      2019-10-16  517  		data = &buf.data[TPM_HEADER_SIZE + 6];
2e19e10131a08d Sumit Garg      2019-10-16  518  
e5fb5d2c5a03e2 James Bottomley 2021-01-27  519  		if (payload->old_format) {
e5fb5d2c5a03e2 James Bottomley 2021-01-27  520  			/* migratable flag is at the end of the key */
2e19e10131a08d Sumit Garg      2019-10-16  521  			memcpy(payload->key, data, data_len - 1);
2e19e10131a08d Sumit Garg      2019-10-16  522  			payload->key_len = data_len - 1;
2e19e10131a08d Sumit Garg      2019-10-16  523  			payload->migratable = data[data_len - 1];
e5fb5d2c5a03e2 James Bottomley 2021-01-27  524  		} else {
e5fb5d2c5a03e2 James Bottomley 2021-01-27  525  			/*
e5fb5d2c5a03e2 James Bottomley 2021-01-27  526  			 * migratable flag already collected from key
e5fb5d2c5a03e2 James Bottomley 2021-01-27  527  			 * attributes
e5fb5d2c5a03e2 James Bottomley 2021-01-27  528  			 */
e5fb5d2c5a03e2 James Bottomley 2021-01-27  529  			memcpy(payload->key, data, data_len);
e5fb5d2c5a03e2 James Bottomley 2021-01-27  530  			payload->key_len = data_len;
e5fb5d2c5a03e2 James Bottomley 2021-01-27  531  		}
2e19e10131a08d Sumit Garg      2019-10-16  532  	}
2e19e10131a08d Sumit Garg      2019-10-16  533  
2e19e10131a08d Sumit Garg      2019-10-16  534  out:
2e19e10131a08d Sumit Garg      2019-10-16  535  	tpm_buf_destroy(&buf);
81efdd34bc4513 Jarkko Sakkinen 2025-09-22  536  	return tpm_ret_to_err(rc);
2e19e10131a08d Sumit Garg      2019-10-16  537  }
2e19e10131a08d Sumit Garg      2019-10-16  538  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
