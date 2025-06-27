Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B9928A1EE
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060504; cv=none; b=i4Xq1AqZlwp/JP1b0Rz/SLe9zJGzVDB+1rNx/9wC/2ZTEI3Thb0V6wIY3odHSHDMVO+YacLk2AqrRpHOY1KXvtAOCfg7jNn2dmMUMWwU64d7OVc6hORNDfyxTlqLlcw0rLKNKPl/IXD+NOrkMtw1Pt+C8bzxNb2r+KR+yDIti/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060504; c=relaxed/simple;
	bh=NYtk8M39yXKnfiu1ICE4qoVuCladpZZV45cFgl6dXlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Vb2Uj3Zc6C17pu17IlLWpRrKErFL0fPjshNNV/6u/BerGCetZrXTbAD23vImqAh8oJHvnq1+Lxi5FFyqlk48q69MjYzVTGmJ6rfV390LLryyuzsSTS0CYHzLmUmV9ihNPVsBG2nUy7hqv2onrERNP2ggouY/FWJKp00zUmahZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDkfVd6o; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDkfVd6o"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60d666804ebso1891556eaf.1
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751060500; x=1751665300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1fXy6FRhTbbi+8IsBVYmrkApFTU+grleJe/y7M2JmI=;
        b=oDkfVd6oVYvsqq57EJf31h9CyQNuCEMAyZzZZarhfTde6aCkw0fG9DfCydDWfm5r09
         khE2rU+9WTMLfAnNUmkSSTbOrYovgBkSyUlUVEmxWksqrWDva4jBPKFyLTILsSEMtHSx
         mS62Us9jkO+vB88YT7PIJD0JMEXszspbshbsfWyCPyRBiTZE27ZgqL04V8f/Vg9zmNwI
         590ZyKAA+4kLJya8EYL86EfOephCwxDJuXhsZxq3gJce6AMcz/0yu3LHjcP7M1hGQZfx
         J+8SAdPNpiega2Qu3W98C2WUg6+3L8aEMDHDqsdqFIqWu7HvjTPE+jwwG4pnte5Nbory
         YRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751060500; x=1751665300;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1fXy6FRhTbbi+8IsBVYmrkApFTU+grleJe/y7M2JmI=;
        b=nJFpGtVE9JlQQI9NsjM3v0/5Wzq3pLvnJVEto0jW6KMzxTmyAf+px8gPIg0rUjYcco
         sXr3Djx7X7W643kqndIjIqXiAPmiqLaHPSTrZQGcGb5p4xFT/MQ4ftt53cfTOeQgJFe7
         xjjjVad/s19wqAjxTetPr/TkZu+Q0taAmNSfz4uH2tQP7QcjV5TMwEumR7OV15nm1y3l
         o8YQuUHLrH3eUX4PKiDK+EJ2nXjK1Kf8xODRnwl2w41QEBrHmK75J0340zxDgKNHIa6j
         MVpD5H3WxHAUr3hKvgLZZtwcoYtCIH1ffVKv64bxPBPfh6s010oQHDagg2buHYdiIuut
         7zaw==
X-Gm-Message-State: AOJu0YyfA9L+EoJuGc0rWo8S086ShZxOpCjlHjRD9eDJBoz50bmtHrDi
	EH1WLjs8Ogp96yOPACDZTXpgRLInkt3SGIbis8+8FMcLNMKwT8H3sgtNTcqGRwWyuWTRK8V2myc
	gDBPM9DE=
X-Gm-Gg: ASbGncslDcQTxJ1W9XIP+5XeJcMLW3aCmvWsgRFbWU1rThD2W7GEyv80IKK7WyKcW2y
	D52tjhuYF/pwewiybit79q/0xGIGCnXBoy1i4HVW4LAEMDft/R+eodAWQ4BDQaaoaRtFTOJNkUf
	IijqFN6Aln+aC9EREaJ7tZ/fTkk0M56KQ/lwEQm9gVo3ZfS3mLic3JPx5UXU8QB4JaKypKSN2K8
	H1dCFg9/OSnQF6MLEGC1i7PxQdkJtgs0zglUK60dehr9aaTuI5agL8U2Nyz8gSb+/lV8WqP/GHS
	NvBC4zkatBEz4L+4MzWssXH1ymDHMaHR/vc5qNqd01HlQFhaSoGebs5boqOu0qar70Xz7Q==
X-Google-Smtp-Source: AGHT+IGm9VN0jQzOnPNshOP1xXBcfWTM+rCNUm1jZDI7araoiPvZx0sPQo2pmdZdBLXePTf9ULNRtg==
X-Received: by 2002:a05:6871:5207:b0:2e9:5d01:effc with SMTP id 586e51a60fabf-2efcedefd56mr6125495fac.2.1751060499975;
        Fri, 27 Jun 2025 14:41:39 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b1a53sm1086207fac.31.2025.06.27.14.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:41:38 -0700 (PDT)
Date: Sat, 28 Jun 2025 00:41:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] tpm: Cleanup class for tpm_buf
Message-ID: <f5a3cddf-39a3-48ed-98ed-dbbdccac5cff@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626101935.1007898-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-Cleanup-class-for-tpm_buf/20250626-182148
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250626101935.1007898-1-jarkko%40kernel.org
patch subject: [PATCH v2] tpm: Cleanup class for tpm_buf
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280550.7lqjVBcB-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506280550.7lqjVBcB-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-cmd.c:575 tpm2_get_pcr_allocation() warn: iterator 'i' not incremented

vim +/i +575 drivers/char/tpm/tpm2-cmd.c

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
                                                        ^^^^^^^^^^
Presumably this was not intentional?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

