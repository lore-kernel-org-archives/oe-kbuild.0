Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB32F1FCB
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058889; cv=none; b=tCXkbeeKlMyBswUoXnyWvALNl1WaOWFkto8Rp0jhgwiDV8Jm8nYCkdbNMYnIuUdtWwVjfNAg76opKkuYr6EjMGNg6PmVtx2Pgl8ZmZijYkZj6TXaSc26SI9yGl/8b7hfrWrs980QB0llp0aUz297y5t98acvA1Cc2VOALxykc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058889; c=relaxed/simple;
	bh=oWBXFUpJfnMMKMhUg6wlm8TVweN/TJE9wjZMlhPd49s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQh6ObsrfuMa+BODIzmHJ3YoCQtE9RC2pffmg83WiNBotBTH6luXq2svIHnwldQ0Xit9ZXiJZ/n9nOQXTY84OaJOFsfDAeyKbbhKaPJD9WrU2UKfhg79N58Vf1G+SEHZ2K9ZuMwxsb8dtuaqawMc+FpBZjjnRhf0rHP16WJvaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNxvBoHB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNxvBoHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751058887; x=1782594887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWBXFUpJfnMMKMhUg6wlm8TVweN/TJE9wjZMlhPd49s=;
  b=gNxvBoHBOOR6cVr1/yhK/eW7e3wvbYkYFI+LuDduPBRDshs043XdH3Eg
   P4Z8NLEbxNKXlrTrh58tWelKWU1gbbRgd5Ty8eWyfaN+tOvPWm1d6Lbec
   VLz6NPjHWE59TEiNqTfWC2S1lAr2fDHnMUflI8dclrGqmnc9RtOwbDUEs
   kRXXFZdAw6oETD5h6W1WaENgZJPzHLTa4Wm0yD7ABgdpZBWdEiQ6I6uUV
   qVNhPzpXhvzXTnTzPhvxxfPG1xT5sTmEI7nnhMmOs8bi8gi3LLxhSEuVB
   cVgOp9EWlRKJ4qFA6m/SmA2EEOZJgSl/16ZlmLqLRJ5xSFtGMAPAdoPVm
   Q==;
X-CSE-ConnectionGUID: Qj5eyu8tSxua+mXx0/629A==
X-CSE-MsgGUID: tET94ETlTTOLVMK6DQ3R1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52496736"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="52496736"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:14:46 -0700
X-CSE-ConnectionGUID: 8TWVmb/4Q6uxEpY6WPD/GA==
X-CSE-MsgGUID: yTUzxyC3SJSksb6K93bh3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190087744"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2025 14:14:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVGPD-000WY2-0r;
	Fri, 27 Jun 2025 21:14:43 +0000
Date: Sat, 28 Jun 2025 05:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] tpm: Cleanup class for tpm_buf
Message-ID: <202506280550.7lqjVBcB-lkp@intel.com>
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
In-Reply-To: <20250626101935.1007898-1-jarkko@kernel.org>
References: <20250626101935.1007898-1-jarkko@kernel.org>
TO: Jarkko Sakkinen <jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-Cleanup-class-for-tpm_buf/20250626-182148
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250626101935.1007898-1-jarkko%40kernel.org
patch subject: [PATCH v2] tpm: Cleanup class for tpm_buf
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280550.7lqjVBcB-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506280550.7lqjVBcB-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-cmd.c:575 tpm2_get_pcr_allocation() warn: iterator 'i' not incremented

vim +/i +575 drivers/char/tpm/tpm2-cmd.c

1db15344f874f65 Nayna Jain      2017-01-30  561  
fa4f99c05320eb2 Nayna Jain      2019-07-11  562  ssize_t tpm2_get_pcr_allocation(struct tpm_chip *chip)
1db15344f874f65 Nayna Jain      2017-01-30  563  {
ce255545c9add8c Jarkko Sakkinen 2025-06-26  564  	CLASS_TPM_BUF(buf, PAGE_SIZE);
1db15344f874f65 Nayna Jain      2017-01-30  565  	struct tpm2_pcr_selection pcr_selection;
1db15344f874f65 Nayna Jain      2017-01-30  566  	void *marker;
1db15344f874f65 Nayna Jain      2017-01-30  567  	void *end;
1db15344f874f65 Nayna Jain      2017-01-30  568  	void *pcr_select_offset;
1db15344f874f65 Nayna Jain      2017-01-30  569  	u32 sizeof_pcr_selection;
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  570  	u32 nr_possible_banks;
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  571  	u32 nr_alloc_banks = 0;
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  572  	u16 hash_alg;
1db15344f874f65 Nayna Jain      2017-01-30  573  	u32 rsp_len;
1db15344f874f65 Nayna Jain      2017-01-30  574  	int rc;
1db15344f874f65 Nayna Jain      2017-01-30 @575  	int i = 0;
1db15344f874f65 Nayna Jain      2017-01-30  576  
ce255545c9add8c Jarkko Sakkinen 2025-06-26  577  	if (!buf)
ce255545c9add8c Jarkko Sakkinen 2025-06-26  578  		return -ENOMEM;
1db15344f874f65 Nayna Jain      2017-01-30  579  
ce255545c9add8c Jarkko Sakkinen 2025-06-26  580  	tpm_buf_reset(buf, TPM2_ST_NO_SESSIONS, TPM2_CC_GET_CAPABILITY);
ce255545c9add8c Jarkko Sakkinen 2025-06-26  581  	tpm_buf_append_u32(buf, TPM2_CAP_PCRS);
ce255545c9add8c Jarkko Sakkinen 2025-06-26  582  	tpm_buf_append_u32(buf, 0);
ce255545c9add8c Jarkko Sakkinen 2025-06-26  583  	tpm_buf_append_u32(buf, 1);
1db15344f874f65 Nayna Jain      2017-01-30  584  
ce255545c9add8c Jarkko Sakkinen 2025-06-26  585  	rc = tpm_transmit_cmd(chip, buf, 9, "get tpm pcr allocation");
1db15344f874f65 Nayna Jain      2017-01-30  586  	if (rc)
ce255545c9add8c Jarkko Sakkinen 2025-06-26  587  		return rc;
1db15344f874f65 Nayna Jain      2017-01-30  588  
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  589  	nr_possible_banks = be32_to_cpup(
ce255545c9add8c Jarkko Sakkinen 2025-06-26  590  		(__be32 *)&buf->data[TPM_HEADER_SIZE + 5]);
1db15344f874f65 Nayna Jain      2017-01-30  591  
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  592  	chip->allocated_banks = kcalloc(nr_possible_banks,
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  593  					sizeof(*chip->allocated_banks),
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  594  					GFP_KERNEL);
ce255545c9add8c Jarkko Sakkinen 2025-06-26  595  	if (!chip->allocated_banks)
ce255545c9add8c Jarkko Sakkinen 2025-06-26  596  		return -ENOMEM;
1db15344f874f65 Nayna Jain      2017-01-30  597  
ce255545c9add8c Jarkko Sakkinen 2025-06-26  598  	marker = &buf->data[TPM_HEADER_SIZE + 9];
1db15344f874f65 Nayna Jain      2017-01-30  599  
ce255545c9add8c Jarkko Sakkinen 2025-06-26  600  	rsp_len = be32_to_cpup((__be32 *)&buf->data[2]);
ce255545c9add8c Jarkko Sakkinen 2025-06-26  601  	end = &buf->data[rsp_len];
1db15344f874f65 Nayna Jain      2017-01-30  602  
ce255545c9add8c Jarkko Sakkinen 2025-06-26  603  	return rc;
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  604  	for (i = 0; i < nr_possible_banks; i++) {
1db15344f874f65 Nayna Jain      2017-01-30  605  		pcr_select_offset = marker +
1db15344f874f65 Nayna Jain      2017-01-30  606  			offsetof(struct tpm2_pcr_selection, size_of_select);
ce255545c9add8c Jarkko Sakkinen 2025-06-26  607  		if (pcr_select_offset >= end)
ce255545c9add8c Jarkko Sakkinen 2025-06-26  608  			return -EFAULT;
1db15344f874f65 Nayna Jain      2017-01-30  609  
1db15344f874f65 Nayna Jain      2017-01-30  610  		memcpy(&pcr_selection, marker, sizeof(pcr_selection));
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  611  		hash_alg = be16_to_cpu(pcr_selection.hash_alg);
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  612  
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  613  		pcr_select_offset = memchr_inv(pcr_selection.pcr_select, 0,
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  614  					       pcr_selection.size_of_select);
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  615  		if (pcr_select_offset) {
879b589210a9a0c Roberto Sassu   2019-02-06  616  			chip->allocated_banks[nr_alloc_banks].alg_id = hash_alg;
879b589210a9a0c Roberto Sassu   2019-02-06  617  
879b589210a9a0c Roberto Sassu   2019-02-06  618  			rc = tpm2_init_bank_info(chip, nr_alloc_banks);
879b589210a9a0c Roberto Sassu   2019-02-06  619  			if (rc < 0)
ce255545c9add8c Jarkko Sakkinen 2025-06-26  620  				return rc;
879b589210a9a0c Roberto Sassu   2019-02-06  621  
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  622  			nr_alloc_banks++;
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  623  		}
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  624  
1db15344f874f65 Nayna Jain      2017-01-30  625  		sizeof_pcr_selection = sizeof(pcr_selection.hash_alg) +
1db15344f874f65 Nayna Jain      2017-01-30  626  			sizeof(pcr_selection.size_of_select) +
1db15344f874f65 Nayna Jain      2017-01-30  627  			pcr_selection.size_of_select;
1db15344f874f65 Nayna Jain      2017-01-30  628  		marker = marker + sizeof_pcr_selection;
1db15344f874f65 Nayna Jain      2017-01-30  629  	}
1db15344f874f65 Nayna Jain      2017-01-30  630  
bcfff8384f6c4e6 Roberto Sassu   2019-02-06  631  	chip->nr_allocated_banks = nr_alloc_banks;
ce255545c9add8c Jarkko Sakkinen 2025-06-26  632  	return 0;
1db15344f874f65 Nayna Jain      2017-01-30  633  }
61841be6358c03e Jarkko Sakkinen 2017-02-15  634  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
