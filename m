Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941051F4615
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765695899; cv=none; b=oOzqoFV6zCKurJJPRvWvZQ5XueeUF6bpwKIoX8tGreRJN6UjStHpOKu9Luso4u5S7D8C/lv3ymmKG4zFmvmMgZooZvypaQhBW1UkcuTDpzDf3ceMT9WgfGXtczcg28eXYre2yPlh48XgGSflyP1QzScYwTjDkfguNv3JdFc/d7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765695899; c=relaxed/simple;
	bh=S/mZaCSKpa7MHYb3YTCrQB95qWdnKYTaIDuGBRauNN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBTK41CKo54vOB/7BFbjEfrm4Bb4GcS7ZxFWNPtmvzwublHHJIyBlzqV0Sv1/J65w34fJNscDleLpYNGy4QnNGA/tuMz4lpWNfnXxrzB3CMBO29F3uSyU6RbOrkVDEmLllsFrYKlX3iV0dmiG19ywGr70vcHq9rHiJCx0SBFFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li1++KRp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li1++KRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765695898; x=1797231898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/mZaCSKpa7MHYb3YTCrQB95qWdnKYTaIDuGBRauNN0=;
  b=li1++KRpmQtKxl1ExG9GeNnKi9/mEj7kxWImi2uvunh6AVEGhd9jOTz1
   yVo9p1pUqeepvf57+rrCc8/RV7qoFVJ/pLqeTZqCk4IV9GDobmuxIbrSp
   rnMbhYnAqB/E5CLNEAhS5BYzPvsM8iYCDFudS2+PkB2HO/bY3eMwu0YtC
   0LUsZ8auzWczfnpUCykl5x0/ahA4vRbZfdSAOSIYbEAJYqf3xxSKoa2qx
   pGN37j0o6XTtDYeKMf5Gyy9zHLnrfqkKcrshguY39Wj3rRJYK2piNtvGk
   28lcy54v/yUrq21x7mbmZ2MS0AHrJNiTP8Bih6l4rI+y+nnbDMNV9VIig
   A==;
X-CSE-ConnectionGUID: E/WA/2TMTgu9+KDHPsNgSQ==
X-CSE-MsgGUID: YcwxzHYpQ5a+5yilOutcKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70215568"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70215568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:04:56 -0800
X-CSE-ConnectionGUID: f7CBVsJ+SAqTQKu/y5CToQ==
X-CSE-MsgGUID: jz7tKwszSRCzRqcREa/NnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228114823"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 23:04:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgA0-000000008nh-0oRi;
	Sun, 14 Dec 2025 07:04:52 +0000
Date: Sun, 14 Dec 2025 15:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:queue 8/12] drivers/char/tpm/tpm2-cmd.c:164
 tpm2_pcr_read() warn: missing error code? 'rc'
Message-ID: <202512141417.YUHjFhWa-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fa1990a85a2cacad684075ae3e5004bdb9f33805
commit: ee8e850748ebc966d985fc493579bb7e06c07087 [8/12] tpm-buf: Implement managed allocations
:::::: branch date: 5 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141417.YUHjFhWa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141417.YUHjFhWa-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-cmd.c:164 tpm2_pcr_read() warn: missing error code? 'rc'

vim +/rc +164 drivers/char/tpm/tpm2-cmd.c

91f7f3d773a469 Roberto Sassu   2017-06-23  107  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  108  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  109   * tpm2_pcr_read() - read a PCR value
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  110   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  111   * @pcr_idx:	index of the PCR to read.
879b589210a9a0 Roberto Sassu   2019-02-06  112   * @digest:	PCR bank and buffer current PCR value is written to.
879b589210a9a0 Roberto Sassu   2019-02-06  113   * @digest_size_ptr:	pointer to variable that stores the digest size.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  114   *
794c6e109b5938 Winkler, Tomas  2016-11-23  115   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  116   */
879b589210a9a0 Roberto Sassu   2019-02-06  117  int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0 Roberto Sassu   2019-02-06  118  		  struct tpm_digest *digest, u16 *digest_size_ptr)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  119  {
879b589210a9a0 Roberto Sassu   2019-02-06  120  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  121  	int rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  122  	struct tpm2_pcr_read_out *out;
91f7f3d773a469 Roberto Sassu   2017-06-23  123  	u8 pcr_select[TPM2_PCR_SELECT_MIN] = {0};
879b589210a9a0 Roberto Sassu   2019-02-06  124  	u16 digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  125  	u16 expected_digest_size = 0;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  126  
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  127  	struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  128  	if (!buf)
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  129  		return -ENOMEM;
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  130  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  131  	if (pcr_idx >= TPM2_PLATFORM_PCR)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  132  		return -EINVAL;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  133  
879b589210a9a0 Roberto Sassu   2019-02-06  134  	if (!digest_size_ptr) {
879b589210a9a0 Roberto Sassu   2019-02-06  135  		for (i = 0; i < chip->nr_allocated_banks &&
879b589210a9a0 Roberto Sassu   2019-02-06  136  		     chip->allocated_banks[i].alg_id != digest->alg_id; i++)
879b589210a9a0 Roberto Sassu   2019-02-06  137  			;
879b589210a9a0 Roberto Sassu   2019-02-06  138  
879b589210a9a0 Roberto Sassu   2019-02-06  139  		if (i == chip->nr_allocated_banks)
879b589210a9a0 Roberto Sassu   2019-02-06  140  			return -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  141  
879b589210a9a0 Roberto Sassu   2019-02-06  142  		expected_digest_size = chip->allocated_banks[i].digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  143  	}
879b589210a9a0 Roberto Sassu   2019-02-06  144  
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  145  	tpm_buf_init(buf, TPM_BUFSIZE);
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  146  	tpm_buf_reset(buf, TPM2_ST_NO_SESSIONS, TPM2_CC_PCR_READ);
91f7f3d773a469 Roberto Sassu   2017-06-23  147  
91f7f3d773a469 Roberto Sassu   2017-06-23  148  	pcr_select[pcr_idx >> 3] = 1 << (pcr_idx & 0x7);
91f7f3d773a469 Roberto Sassu   2017-06-23  149  
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  150  	tpm_buf_append_u32(buf, 1);
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  151  	tpm_buf_append_u16(buf, digest->alg_id);
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  152  	tpm_buf_append_u8(buf, TPM2_PCR_SELECT_MIN);
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  153  	tpm_buf_append(buf, (const unsigned char *)pcr_select,
91f7f3d773a469 Roberto Sassu   2017-06-23  154  		       sizeof(pcr_select));
91f7f3d773a469 Roberto Sassu   2017-06-23  155  
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  156  	rc = tpm_transmit_cmd(chip, buf, 0, "TPM2_PCR_Read");
879b589210a9a0 Roberto Sassu   2019-02-06  157  	if (rc)
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  158  		return rc;
879b589210a9a0 Roberto Sassu   2019-02-06  159  
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  160  	out = (struct tpm2_pcr_read_out *)&buf->data[TPM_HEADER_SIZE];
879b589210a9a0 Roberto Sassu   2019-02-06  161  	digest_size = be16_to_cpu(out->digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  162  	if (digest_size > sizeof(digest->digest) ||
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18  163  	    (!digest_size_ptr && digest_size != expected_digest_size))
ee8e850748ebc9 Jarkko Sakkinen 2025-10-18 @164  		return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  165  
879b589210a9a0 Roberto Sassu   2019-02-06  166  	if (digest_size_ptr)
879b589210a9a0 Roberto Sassu   2019-02-06  167  		*digest_size_ptr = digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  168  
879b589210a9a0 Roberto Sassu   2019-02-06  169  	memcpy(digest->digest, out->digest, digest_size);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  170  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
