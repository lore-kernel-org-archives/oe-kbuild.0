Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C434678D
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987383; cv=none; b=ujvn0GBDKlepea2qITSsVYR6OcswGTBHscblsifJHYN0XFFpqOuLNGktmggNq1CcsGaAMPpwrVFZSoBBQJzgxfoFdlqw5j+ZbekTti+qNa+nK938lksJffiOsYuRQx83z8YKKQSXjibK0vB9bjg/RD627yCfU4XZNaskCPuIbCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987383; c=relaxed/simple;
	bh=+jsPHHAq1q5JHoKafiBk7Xu9mJ8kFC9dh/SryV0TfXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cN5RsTEzt8i6fChv50YUjMKiya/r9BH4l4JzZ9s6U5BYlBH6yJYvOpY0PgmJN6BhSn59PhC5XRx0iFOEv4/+sU5gwzSCuBCKMMLiLXMe4Bxbxijrgw0IPqw+3CVLGzE3i6yjDvpXbZ8tWauLgaZUOe+5Px1lsHums17fEypLL7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybQAxP63; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybQAxP63"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47774d3536dso8059455e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 08:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765987380; x=1766592180; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAM1ZigkLnC6OWYNyUHlM85lV5ISU4BM9beBtu1Nwv0=;
        b=ybQAxP63s34wrcowxXZwwK9K0X6vldsZ9Oj2EhbHz8wvDvjyKrMa5IlVGfxzwtxkpg
         47ubyNypNR8OnkVOXYrCobrIrk09aT5OBzxtSAONEovdkBw4vgyUGY0WDBRvttz0aaZw
         e0I+UHlRrCz4+6hxBQ4x9RytRLaG2cztWi9lZV/ld+7PBz9KJUuDB0Heu6Z+D6IIuHSM
         CYAJ/4O2herkYOYn5Gerxs9K4V7CLnb5YSRwHbEEE4sqPwHRTZ4jXvapp20OkLcBci6K
         im3HBcxciLeOLkmIWVUY+9Mft/RAv7e3Rd+0Ihnw9fDA86UQQZZX/ODEz7zK0ULNLF7V
         +M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987380; x=1766592180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAM1ZigkLnC6OWYNyUHlM85lV5ISU4BM9beBtu1Nwv0=;
        b=V04Mq0Aej5kgKz1UheGRn8pFsBei34hQvxexuXr+sN9X7ubuGm5ow8Ny03KqYrJ/PH
         s+5GlIUGKjdDzegY+SLKsxJ/JnDaft+vp5Ysf69JGtecre7qIKzQlr8VWnDkjbLOZm7m
         GVdwyUhzUYcJ9Fih7dhDEhXquxuC5y8h7i8pxgsWo6BtDcDC9zAGfefRnaymdDqxyj10
         8PYtWO5Vu5GwBODt+W2FLI83HVr9Q8kPUL45eyzB+Pp0CTkTRVCFVkMiYpI6aZKAvEPA
         NOlCVqOHa5/g0Ffps5LUMWruHjmOjdyKoDQsqDHKQrhnQrEMNsSWZ0TP5R+4GoQ03UMD
         kdSg==
X-Gm-Message-State: AOJu0YyRUETGS7VWvCb3Nt4Zi55/xc/Vc8vHu4ZnYSCc910uju4p/lsE
	jL7TvvSwBq3sG0Cn0X5Yzs9mjDArdJ/UHpFhA+rTcd692VVlZslpdBrHlO/es4j1bkboobPrEkR
	3CBEU
X-Gm-Gg: AY/fxX6fNqF+TeFZ1U6i2VM+2MCwv/T1Y+PnupKJBvkERjALawiNsXPSk+d1Yi9MieD
	7QmzUBuW+EWXcF3vJL2SQRiwrQBw0ag4zIwksU7M+rd2XsXLbVJK9qdzzdDnOkC84WjvCXfCq6m
	IptGmx6Y4u3gcbh8beGFnWCxYewcBjPzErfYjxiQPd3a5jcHnSfS/vyY8WRtc2Zoc2Urh0cxhit
	DuLLbbi2M6DlWr/8N6kwEXsRO14hzLCzGVsVRkeA5e3V1LrRttVIi5ukuGqcoWazrd5FHgbF/mo
	GoD0d7mlxH7HdILm7T+PE+fye1RcykpONM2dETdiClVufoN+MWr5+d9Cy5KQYAyk3a/7JQXtVix
	0Llp5oT0EM04CgLdBlhJZnvE9A31c3cRRbuOZ/3+gKJnJqMGqrX01WrbBTF6hyD87N1Ao0pdNK3
	JIMpeFJCPckuB36OkgDwLgqZBMkh8=
X-Google-Smtp-Source: AGHT+IHArLw21LULHbIqVumT21fcwTx6zcl8NBEyIQYCJhyn3zJP8sKlLIUGnWIFt4KO+ZygtMKLxw==
X-Received: by 2002:a05:600d:486:20b0:477:991c:a17c with SMTP id 5b1f17b1804b1-47a89da4685mr178551355e9.6.1765987379491;
        Wed, 17 Dec 2025 08:02:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adf7245sm5324399f8f.41.2025.12.17.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:02:59 -0800 (PST)
Date: Wed, 17 Dec 2025 19:02:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
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
Message-ID: <20251217160255.9i1uqRKeDLkDX66akjufN9iKxmNJQEyIYnC9DxDshJM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fa1990a85a2cacad684075ae3e5004bdb9f33805
commit: ee8e850748ebc966d985fc493579bb7e06c07087 [8/12] tpm-buf: Implement managed allocations
config: x86_64-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141417.YUHjFhWa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512141417.YUHjFhWa-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-cmd.c:164 tpm2_pcr_read() warn: missing error code? 'rc'

vim +/rc +164 drivers/char/tpm/tpm2-cmd.c

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

return -EINVAL;

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  165  
879b589210a9a0 Roberto Sassu   2019-02-06  166  	if (digest_size_ptr)
879b589210a9a0 Roberto Sassu   2019-02-06  167  		*digest_size_ptr = digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  168  
879b589210a9a0 Roberto Sassu   2019-02-06  169  	memcpy(digest->digest, out->digest, digest_size);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  170  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

