Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290459;
	b=qtW0JAU25P+zKVM4RLPBIRe1vXFbalmatN82mtW92cCkTJHdUQUWm68r49y0Ud9dU1Yv
	 F4C1AxXvSVf2c07L1aSyLq1bGOCFkU0qoRO/z4V8LDrXXk9Evp41bS9OYsM8pVH/jnOp3
	 10hxQghtV7+5YA+MV9r7/nByfmdyb8Nw0YAWq82TwGP9/+msurqhGxhvr9yDwgtczgsNG
	 IPw2/DgQ2x7M+8Pc49VLzG/fWpyfkQhSNEFUYucHo69h1jQqRzg4lKrtyUDiFEvDgdpo5
	 qDY8+7MyGhhTy305lbJF0mKYBFWu2coEU+/jPa7kXNxKMx0Nd1EdHHXlOoIW/OH2Pig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290459;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=brF20MAk3LME0gwZw8c3Wd9bIDCfSjQUOeYxP4e0WCo=;
	b=j8ydD+R882zQy28JJqCZsvMDcMN065V0IpOGuE1leJY8ZL/MQNrZ0BytJP0f2bmKusk7
	 KIQpc+ytPY9FH24k6/JkrCXb8jqh+VGy1ksgpOHCSKHkNlYbqB31e1T49kz10L+qDUaia
	 dKxIplrUPfxHRCC56l8QPiUC859ZRpTzO0GYZerodaGggNGDL+XgmjmbBPJUjVG9GyTgk
	 uMtOB85PmiA3GDEZSJ48/Le465ikt/FaT48o+AEzjgpK4BUcFPosa/q1439luVlqFl8xN
	 BlIF+cjUUO3ZL0EEOP3vflpnff7mraJTBrpDm1HCG4239k+CM4ePIROkvlyw3AeEuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUvb38ae;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A5E606A321
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 06:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUvb38ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794290459; x=1825826459;
  h=date:from:to:cc:subject:message-id;
  bh=qyyYYbyN8hPZB64LwI7EuiIXqU+gI0wHVO81EWDM8WM=;
  b=TUvb38aeSYzafszsJeZIranVw/kfd7t5a9DqsgR0CsS364MKiDMEGq4A
   JMzAy40iIcg7W5YkPypn3ZLQEYuz/KTcgvAVlWa1EyaTSs6KxC95/loqw
   P1ExcIkPq0HVHYRc5iOwkv941GC9TuIsLrQx8DfkD65Sm1dG6Wj6KHKGN
   IN/30oee9x5k/WKDQTLsliCUImzxxc+NSVmbletZGu1tjQ8QyjYw+Hm2D
   aJxX0ZMnWWgvk+8c1Zhvgr2FsqR1xBrzHd0B+mXvdQ5hWATDFLzqi07Xz
   vL6JET/lSD3M3ui3K6BZLSXADKgmmHXy5N+ZOiC9uPsqznlFRXU6oYEDg
   Q==;
X-CSE-ConnectionGUID: Zxxs3vTTSKawkSkLzyZvIQ==
X-CSE-MsgGUID: BTbjkWK7Q6SzTSPx1z7XRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3130025"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3130025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:00:58 -0800
X-CSE-ConnectionGUID: 7ECAUTJRRR2gwlcr2/53Sw==
X-CSE-MsgGUID: j4esGen2RO2FNVqUnQHnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8237791"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 22:00:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQeuc-000000000CN-1mW2;
	Tue, 10 Nov 2026 06:00:54 +0000
Date: Tue, 10 Nov 2026 07:00:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:hibernate 27/39]
 drivers/char/tpm/tpm2-ak.c:338 tpm2_get_signed_audit_digest() warn: was &&
 intended here instead of ||?
Message-ID: <202611100627.IZHiPvAH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git hibernate
head:   74bb07bc3885849d08ac7ab1942479559faa986c
commit: dc018c1685625cb501c0543eae3fcac57e9c0be6 [27/39] tpm: Add a kernel attestation key and signed audit digest retrieval
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: parisc-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261110/202611100627.IZHiPvAH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611100627.IZHiPvAH-lkp@intel.com/

New smatch warnings:
drivers/char/tpm/tpm2-ak.c:338 tpm2_get_signed_audit_digest() warn: was && intended here instead of ||?

Old smatch warnings:
drivers/char/tpm/tpm2-ak.c:111 tpm2_parse_kernel_ak_public() warn: was && intended here instead of ||?

vim +338 drivers/char/tpm/tpm2-ak.c

dc018c1685625c Matthew Garrett 2026-10-08  241  
dc018c1685625c Matthew Garrett 2026-10-08  242  /**
dc018c1685625c Matthew Garrett 2026-10-08  243   * tpm2_get_signed_audit_digest() - get the audit session digest signed by the AK
dc018c1685625c Matthew Garrett 2026-10-08  244   * @chip:	the TPM chip
dc018c1685625c Matthew Garrett 2026-10-08  245   * @nonce:	qualifying data to include in the attestation (may be NULL)
dc018c1685625c Matthew Garrett 2026-10-08  246   * @nonce_len:	length of @nonce
dc018c1685625c Matthew Garrett 2026-10-08  247   * @audit:	filled with the signed attestation and the AK public key
dc018c1685625c Matthew Garrett 2026-10-08  248   *
dc018c1685625c Matthew Garrett 2026-10-08  249   * Creates the kernel AK and uses TPM2_GetSessionAuditDigest to have it
dc018c1685625c Matthew Garrett 2026-10-08  250   * sign the digest of the active audit session.  The session itself is not
dc018c1685625c Matthew Garrett 2026-10-08  251   * used to authorize the command, so the audit digest and the log returned
dc018c1685625c Matthew Garrett 2026-10-08  252   * by tpm2_get_audit_log() are unaffected.  The endorsement and owner
dc018c1685625c Matthew Garrett 2026-10-08  253   * hierarchies must have empty auth values.  The caller must hold the
dc018c1685625c Matthew Garrett 2026-10-08  254   * chip's ops lock and must release @audit with tpm2_free_signed_audit().
dc018c1685625c Matthew Garrett 2026-10-08  255   *
dc018c1685625c Matthew Garrett 2026-10-08  256   * Return:
dc018c1685625c Matthew Garrett 2026-10-08  257   * * 0		- OK
dc018c1685625c Matthew Garrett 2026-10-08  258   * * -EINVAL	- No audit session is active, or the response was malformed
dc018c1685625c Matthew Garrett 2026-10-08  259   * * -errno	- A system error
dc018c1685625c Matthew Garrett 2026-10-08  260   * * TPM_RC	- A TPM error
dc018c1685625c Matthew Garrett 2026-10-08  261   */
dc018c1685625c Matthew Garrett 2026-10-08  262  int tpm2_get_signed_audit_digest(struct tpm_chip *chip, const u8 *nonce,
dc018c1685625c Matthew Garrett 2026-10-08  263  				 u16 nonce_len,
dc018c1685625c Matthew Garrett 2026-10-08  264  				 struct tpm2_signed_audit *audit)
dc018c1685625c Matthew Garrett 2026-10-08  265  {
dc018c1685625c Matthew Garrett 2026-10-08  266  	struct tpm_buf *buf __free(kfree) = NULL;
dc018c1685625c Matthew Garrett 2026-10-08  267  	u32 session, ak, param_size, end;
dc018c1685625c Matthew Garrett 2026-10-08  268  	const u8 *attest;
dc018c1685625c Matthew Garrett 2026-10-08  269  	struct tpm2_rsp r;
dc018c1685625c Matthew Garrett 2026-10-08  270  	u16 attest_len;
dc018c1685625c Matthew Garrett 2026-10-08  271  	int rc;
dc018c1685625c Matthew Garrett 2026-10-08  272  
dc018c1685625c Matthew Garrett 2026-10-08  273  	memset(audit, 0, sizeof(*audit));
dc018c1685625c Matthew Garrett 2026-10-08  274  
dc018c1685625c Matthew Garrett 2026-10-08  275  	if (nonce_len > TPM2_MAX_DIGEST_SIZE)
dc018c1685625c Matthew Garrett 2026-10-08  276  		return -EINVAL;
dc018c1685625c Matthew Garrett 2026-10-08  277  
dc018c1685625c Matthew Garrett 2026-10-08  278  	rc = tpm2_audit_session_handle(chip, &session);
dc018c1685625c Matthew Garrett 2026-10-08  279  	if (rc)
dc018c1685625c Matthew Garrett 2026-10-08  280  		return rc;
dc018c1685625c Matthew Garrett 2026-10-08  281  
dc018c1685625c Matthew Garrett 2026-10-08  282  	buf = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
dc018c1685625c Matthew Garrett 2026-10-08  283  	if (!buf)
dc018c1685625c Matthew Garrett 2026-10-08  284  		return -ENOMEM;
dc018c1685625c Matthew Garrett 2026-10-08  285  
dc018c1685625c Matthew Garrett 2026-10-08  286  	rc = tpm2_create_kernel_ak(chip, &ak, audit->ak_x, audit->ak_y);
dc018c1685625c Matthew Garrett 2026-10-08  287  	if (rc)
dc018c1685625c Matthew Garrett 2026-10-08  288  		return rc;
dc018c1685625c Matthew Garrett 2026-10-08  289  
dc018c1685625c Matthew Garrett 2026-10-08  290  	tpm_buf_init(buf, TPM_BUFSIZE);
dc018c1685625c Matthew Garrett 2026-10-08  291  	tpm_buf_reset(buf, TPM2_ST_SESSIONS, TPM2_CC_GET_SESSION_AUDIT_DIGEST);
dc018c1685625c Matthew Garrett 2026-10-08  292  
dc018c1685625c Matthew Garrett 2026-10-08  293  	/* privacyAdminHandle, signHandle, sessionHandle */
dc018c1685625c Matthew Garrett 2026-10-08  294  	tpm_buf_append_handle(buf, TPM2_RH_ENDORSEMENT);
dc018c1685625c Matthew Garrett 2026-10-08  295  	tpm_buf_append_handle(buf, ak);
dc018c1685625c Matthew Garrett 2026-10-08  296  	tpm_buf_append_handle(buf, session);
dc018c1685625c Matthew Garrett 2026-10-08  297  
dc018c1685625c Matthew Garrett 2026-10-08  298  	/* empty password authorizations for the endorsement hierarchy and AK */
dc018c1685625c Matthew Garrett 2026-10-08  299  	tpm_buf_append_auth(chip, buf, NULL, 0);
dc018c1685625c Matthew Garrett 2026-10-08  300  	tpm_buf_append_auth(chip, buf, NULL, 0);
dc018c1685625c Matthew Garrett 2026-10-08  301  
dc018c1685625c Matthew Garrett 2026-10-08  302  	/* qualifyingData */
dc018c1685625c Matthew Garrett 2026-10-08  303  	tpm_buf_append_u16(buf, nonce_len);
dc018c1685625c Matthew Garrett 2026-10-08  304  	if (nonce_len)
dc018c1685625c Matthew Garrett 2026-10-08  305  		tpm_buf_append(buf, nonce, nonce_len);
dc018c1685625c Matthew Garrett 2026-10-08  306  
dc018c1685625c Matthew Garrett 2026-10-08  307  	/* inScheme: use the AK's scheme */
dc018c1685625c Matthew Garrett 2026-10-08  308  	tpm_buf_append_u16(buf, TPM_ALG_NULL);
dc018c1685625c Matthew Garrett 2026-10-08  309  
dc018c1685625c Matthew Garrett 2026-10-08  310  	if (buf->flags & TPM_BUF_INVALID) {
dc018c1685625c Matthew Garrett 2026-10-08  311  		rc = -EINVAL;
dc018c1685625c Matthew Garrett 2026-10-08  312  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  313  	}
dc018c1685625c Matthew Garrett 2026-10-08  314  
dc018c1685625c Matthew Garrett 2026-10-08  315  	rc = tpm_transmit_cmd(chip, buf, 0, "getting session audit digest");
dc018c1685625c Matthew Garrett 2026-10-08  316  	if (rc)
dc018c1685625c Matthew Garrett 2026-10-08  317  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  318  
dc018c1685625c Matthew Garrett 2026-10-08  319  	rc = -EINVAL;
dc018c1685625c Matthew Garrett 2026-10-08  320  	tpm2_rsp_init(&r, buf);
dc018c1685625c Matthew Garrett 2026-10-08  321  	param_size = tpm2_rsp_u32(&r);
dc018c1685625c Matthew Garrett 2026-10-08  322  	end = r.off + param_size;
dc018c1685625c Matthew Garrett 2026-10-08  323  
dc018c1685625c Matthew Garrett 2026-10-08  324  	/* auditInfo */
dc018c1685625c Matthew Garrett 2026-10-08  325  	attest_len = tpm2_rsp_u16(&r);
dc018c1685625c Matthew Garrett 2026-10-08  326  	attest = tpm2_rsp_bytes(&r, attest_len);
dc018c1685625c Matthew Garrett 2026-10-08  327  	if (!attest)
dc018c1685625c Matthew Garrett 2026-10-08  328  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  329  
dc018c1685625c Matthew Garrett 2026-10-08  330  	/* TPMS_ATTEST begins with magic and type */
dc018c1685625c Matthew Garrett 2026-10-08  331  	if (attest_len < sizeof(u32) + sizeof(u16) ||
dc018c1685625c Matthew Garrett 2026-10-08  332  	    get_unaligned_be32(attest) != TPM2_GENERATED_VALUE ||
dc018c1685625c Matthew Garrett 2026-10-08  333  	    get_unaligned_be16(attest + sizeof(u32)) !=
dc018c1685625c Matthew Garrett 2026-10-08  334  	    TPM2_ST_ATTEST_SESSION_AUDIT)
dc018c1685625c Matthew Garrett 2026-10-08  335  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  336  
dc018c1685625c Matthew Garrett 2026-10-08  337  	/* signature */
dc018c1685625c Matthew Garrett 2026-10-08 @338  	if (tpm2_rsp_u16(&r) != TPM_ALG_ECDSA ||
dc018c1685625c Matthew Garrett 2026-10-08  339  	    tpm2_rsp_u16(&r) != TPM_ALG_SHA256)
dc018c1685625c Matthew Garrett 2026-10-08  340  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  341  	tpm2_rsp_ecc_param(&r, audit->sig_r);
dc018c1685625c Matthew Garrett 2026-10-08  342  	tpm2_rsp_ecc_param(&r, audit->sig_s);
dc018c1685625c Matthew Garrett 2026-10-08  343  
dc018c1685625c Matthew Garrett 2026-10-08  344  	if (r.err || r.off != end)
dc018c1685625c Matthew Garrett 2026-10-08  345  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  346  
dc018c1685625c Matthew Garrett 2026-10-08  347  	audit->attest = kmemdup(attest, attest_len, GFP_KERNEL);
dc018c1685625c Matthew Garrett 2026-10-08  348  	if (!audit->attest) {
dc018c1685625c Matthew Garrett 2026-10-08  349  		rc = -ENOMEM;
dc018c1685625c Matthew Garrett 2026-10-08  350  		goto out;
dc018c1685625c Matthew Garrett 2026-10-08  351  	}
dc018c1685625c Matthew Garrett 2026-10-08  352  	audit->attest_len = attest_len;
dc018c1685625c Matthew Garrett 2026-10-08  353  	rc = 0;
dc018c1685625c Matthew Garrett 2026-10-08  354  
dc018c1685625c Matthew Garrett 2026-10-08  355  out:
dc018c1685625c Matthew Garrett 2026-10-08  356  	if (rc < 0 && rc != -ENOMEM)
dc018c1685625c Matthew Garrett 2026-10-08  357  		dev_err(&chip->dev, "failed to get session audit digest: %d\n",
dc018c1685625c Matthew Garrett 2026-10-08  358  			rc);
dc018c1685625c Matthew Garrett 2026-10-08  359  	tpm2_flush_context(chip, ak);
dc018c1685625c Matthew Garrett 2026-10-08  360  	return rc;
dc018c1685625c Matthew Garrett 2026-10-08  361  }
dc018c1685625c Matthew Garrett 2026-10-08  362  EXPORT_SYMBOL_GPL(tpm2_get_signed_audit_digest);
dc018c1685625c Matthew Garrett 2026-10-08  363  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
