Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6720DD75
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764569479; cv=none; b=Ngu1NIBCA7WMs+5sBoDEjZKAFZyGMFWeKZ4FbVWVaitz/5ba1dsMFhf9UfLcmq4cEexAiuQPv/1afshsdYRxjKGcaLKcRTuG2JOMv9DSjOluMtscK7PmRl90Hb4/B4Shd3TYF+Izr1ZidlpAIRiDFfsthxk1Qcy7+p76rDozm5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764569479; c=relaxed/simple;
	bh=FNRu1fpPSYdT9T5U/QoGPbkhqRRAiWOWEWEtLVdI8fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfWmJSfonfbFnNEEWf39+oFZHTnYBDygpXfwh4uXRc87qeIudZdG6/rVupd2NFkQ8Tdg3JPtvQnm8t9UORVt/VHuRGji0etjol4xg0ako230yiqn5WCX4kJY6wA2VPN4nq5U43Na3jKkLovL1Y4kwP9EeiPb4xmEjRLm6P1PilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bng5gXqP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bng5gXqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764569478; x=1796105478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNRu1fpPSYdT9T5U/QoGPbkhqRRAiWOWEWEtLVdI8fA=;
  b=bng5gXqPkqhonZhcELveXRdJqNmH0dUeGC0UUFM4JVUUoVGteZGjPF3m
   RQOc6Nx1a8dacbF0HHOfHaDaMg+pGU+i6aR23EG3s0UOAgkIgrgXDBMQu
   5IKWK3NYEqPdZvmNZHKsOJly8mPaj7UT2djssS+xaA+ohjbN5uPINV9qP
   gQl07B/bFxLdIKb/HsEH9nWcVyzR7zRLRw19YwlPEbkFEcggUul4yA9fe
   M5ZTk+AyRRQgBaQf8R89yvXkWQr/WOxoitK/OGpfycNAXHLlOfYRjWKdK
   tQECitnLSikOvxdkFsBnHPEZPzjV7X6rVizMDyFUTDHFBt6QgHBHDplus
   w==;
X-CSE-ConnectionGUID: Ha596AKZRdCZIJ9BVsaANw==
X-CSE-MsgGUID: KBLpJ8SySseLlNwtVQd05Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65503756"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="65503756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:11:17 -0800
X-CSE-ConnectionGUID: fVsQwOXIQb6eYejWYYsmRA==
X-CSE-MsgGUID: eE3jcaAITfGxKHIrOdZc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193801005"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:11:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPx7y-000000008M3-06gF;
	Mon, 01 Dec 2025 06:11:14 +0000
Date: Mon, 1 Dec 2025 14:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jarkko-tpmdd:tpm2-session 10/18]
 drivers/char/tpm/tpm2-cmd.c:211:20: error: void value not ignored as it
 ought to be
Message-ID: <202512011423.RlZBqKJg-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   9e1990f86d12b41f0b37d9414385587a5e79591c
commit: c094b019ad89433d0fc5e6b9bff002697178cfb2 [10/18] tpm2-sessions: address out-of-range indexing
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512011423.RlZBqKJg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011423.RlZBqKJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512011423.RlZBqKJg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_pcr_extend':
>> drivers/char/tpm/tpm2-cmd.c:211:20: error: void value not ignored as it ought to be
     211 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_get_random':
   drivers/char/tpm/tpm2-cmd.c:276:21: error: void value not ignored as it ought to be
     276 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^


vim +211 drivers/char/tpm/tpm2-cmd.c

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
c094b019ad8943 Jarkko Sakkinen 2025-11-30  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  191  		if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  192  			tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  193  			return rc;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  194  		}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  195  
6519fea6fd372b James Bottomley 2024-04-29  196  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  200  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  201  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  202  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  203  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  204  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  205  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  206  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  207  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  209  
c094b019ad8943 Jarkko Sakkinen 2025-11-30  210  	if (!disable_pcr_integrity) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30 @211  		rc = tpm_buf_fill_hmac_session(chip, &buf);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  212  		if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  213  			tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  214  			return rc;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  215  		}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  216  	}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  217  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  218  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  219  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  220  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  221  
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  223  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
