Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CDB1E86E
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751810215; cv=none; b=byJ+g1wQ5fruc94G3AUmsKEth7oYLBpny/oEjZb0wHHOYwqMqIjg0U5x7d+cizGMxj+v9HCBbFV4Q+lMwePJK0jdCThCgn9qrZz2rZ9wAUjt8IJ2g8jqSBP/Lytrz184gPfFyWHb3xQM1B3ecBzl9DcgFCNVt2ZaMRjNjw/qhhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751810215; c=relaxed/simple;
	bh=iFz44t81wClIltEsk15HFj8e+OOYAOu7MFMEvFQ5L9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmFM8n33tKwXlp4AiDdwmAON1oDw+SYDin8l72+c91ZfHy/oElRbnVlgrt5+CM4GKMIedBGEQDBVkm2cXwDujkqtK/RTQZeeuXYb1R4O/Z3X//2QDbM8NZpGyRyRy7wjp4dwfdQGAAOCOD8Qg2Vo8e5ZTrllbWaovC2vlMWttOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCsIP/Xu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCsIP/Xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751810213; x=1783346213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iFz44t81wClIltEsk15HFj8e+OOYAOu7MFMEvFQ5L9I=;
  b=ZCsIP/Xud9+GTWMfv0Dao68T4FsBsu7R0paYU2BPOgVHyfdMwzdqoAAl
   4k6zFH2mS2lPaUeqRG4EY8aHKWFn9/a8RdMXbe/4TGyE5RLSAhaFuYsNx
   GTnFG0Pn1yLI12bAF9hERV7cel8gDjhg5aICvEiT3RYH3d3irWvHMewwl
   SDvdhxeVwzgxI8fMZxtGq7iQ8XOeL84nXh4kb+rcL4BMw37+xzOFa+cJJ
   jmlE7SSUf7GSyBv1sry74Ls0HzLagNzDhmLLBO93hoAGkZgFWWB5INMvH
   5kIIk59RmaB59hdmsBgXlTNGxPGRkWIEl+57kFAz1bFERG/YiDFjopW1/
   w==;
X-CSE-ConnectionGUID: /zMFpocYTdiHQHC6aAPaoQ==
X-CSE-MsgGUID: 6x0sGR9/S8yXfvctgfBayg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="79485098"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="79485098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 06:56:53 -0700
X-CSE-ConnectionGUID: mnp5LaXlRFaxbeRlsVjOmg==
X-CSE-MsgGUID: PNPcIUuFSWS4dM6Nx2wZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="155576820"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jul 2025 06:56:51 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYPrN-00054t-1q;
	Sun, 06 Jul 2025 13:56:49 +0000
Date: Sun, 6 Jul 2025 21:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5] tpm: Managed allocations for tpm_buf instances
Message-ID: <202507062112.JKYfCa34-lkp@intel.com>
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
In-Reply-To: <20250703181712.923302-1-jarkko@kernel.org>
References: <20250703181712.923302-1-jarkko@kernel.org>
TO: Jarkko Sakkinen <jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-Managed-allocations-for-tpm_buf-instances/20250704-021800
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250703181712.923302-1-jarkko%40kernel.org
patch subject: [PATCH v5] tpm: Managed allocations for tpm_buf instances
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250704 (https://download.01.org/0day-ci/archive/20250706/202507062112.JKYfCa34-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507062112.JKYfCa34-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-cmd.c:211 tpm2_pcr_read() warn: missing error code? 'rc'

vim +/rc +211 drivers/char/tpm/tpm2-cmd.c

91f7f3d773a469 Roberto Sassu   2017-06-23  155  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  156  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  157   * tpm2_pcr_read() - read a PCR value
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  158   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159   * @pcr_idx:	index of the PCR to read.
879b589210a9a0 Roberto Sassu   2019-02-06  160   * @digest:	PCR bank and buffer current PCR value is written to.
879b589210a9a0 Roberto Sassu   2019-02-06  161   * @digest_size_ptr:	pointer to variable that stores the digest size.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  162   *
794c6e109b5938 Winkler, Tomas  2016-11-23  163   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   */
879b589210a9a0 Roberto Sassu   2019-02-06  165  int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0 Roberto Sassu   2019-02-06  166  		  struct tpm_digest *digest, u16 *digest_size_ptr)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  167  {
879b589210a9a0 Roberto Sassu   2019-02-06  168  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  169  	int rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  170  	struct tpm2_pcr_read_out *out;
91f7f3d773a469 Roberto Sassu   2017-06-23  171  	u8 pcr_select[TPM2_PCR_SELECT_MIN] = {0};
879b589210a9a0 Roberto Sassu   2019-02-06  172  	u16 digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  173  	u16 expected_digest_size = 0;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  174  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  175  	struct tpm_buf *buf __free(kfree) = tpm_buf_alloc();
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  176  	if (!buf)
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  177  		return -ENOMEM;
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  178  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  179  	if (pcr_idx >= TPM2_PLATFORM_PCR)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  180  		return -EINVAL;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  181  
879b589210a9a0 Roberto Sassu   2019-02-06  182  	if (!digest_size_ptr) {
879b589210a9a0 Roberto Sassu   2019-02-06  183  		for (i = 0; i < chip->nr_allocated_banks &&
879b589210a9a0 Roberto Sassu   2019-02-06  184  		     chip->allocated_banks[i].alg_id != digest->alg_id; i++)
879b589210a9a0 Roberto Sassu   2019-02-06  185  			;
879b589210a9a0 Roberto Sassu   2019-02-06  186  
879b589210a9a0 Roberto Sassu   2019-02-06  187  		if (i == chip->nr_allocated_banks)
879b589210a9a0 Roberto Sassu   2019-02-06  188  			return -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  189  
879b589210a9a0 Roberto Sassu   2019-02-06  190  		expected_digest_size = chip->allocated_banks[i].digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  191  	}
879b589210a9a0 Roberto Sassu   2019-02-06  192  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  193  	tpm_buf_reset(buf, TPM2_ST_NO_SESSIONS, TPM2_CC_PCR_READ);
91f7f3d773a469 Roberto Sassu   2017-06-23  194  
91f7f3d773a469 Roberto Sassu   2017-06-23  195  	pcr_select[pcr_idx >> 3] = 1 << (pcr_idx & 0x7);
91f7f3d773a469 Roberto Sassu   2017-06-23  196  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  197  	tpm_buf_append_u32(buf, 1);
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  198  	tpm_buf_append_u16(buf, digest->alg_id);
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  199  	tpm_buf_append_u8(buf, TPM2_PCR_SELECT_MIN);
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  200  	tpm_buf_append(buf, (const unsigned char *)pcr_select,
91f7f3d773a469 Roberto Sassu   2017-06-23  201  		       sizeof(pcr_select));
91f7f3d773a469 Roberto Sassu   2017-06-23  202  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  203  	rc = tpm_transmit_cmd(chip, buf, 0, "attempting to read a pcr value");
879b589210a9a0 Roberto Sassu   2019-02-06  204  	if (rc)
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  205  		return rc;
879b589210a9a0 Roberto Sassu   2019-02-06  206  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  207  	out = (struct tpm2_pcr_read_out *)&buf->data[TPM_HEADER_SIZE];
879b589210a9a0 Roberto Sassu   2019-02-06  208  	digest_size = be16_to_cpu(out->digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  209  	if (digest_size > sizeof(digest->digest) ||
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  210  	    (!digest_size_ptr && digest_size != expected_digest_size))
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03 @211  		return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  212  
879b589210a9a0 Roberto Sassu   2019-02-06  213  	if (digest_size_ptr)
879b589210a9a0 Roberto Sassu   2019-02-06  214  		*digest_size_ptr = digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  215  
879b589210a9a0 Roberto Sassu   2019-02-06  216  	memcpy(digest->digest, out->digest, digest_size);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  217  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  218  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
