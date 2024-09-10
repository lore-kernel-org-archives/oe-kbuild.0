Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AC178372
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953524; cv=none; b=f0k7RqDoP+9lqzDoOxxrpdeOi68o1pj2zvhYRPmywyYjF9Oobj0jSJeYlHVsveJNf7kfhCEViYPClSXcqq6gAoC+u0otChst+AKPaS3qwvhNnbwMwpFZuxBo7jYQF9EKp2zDzdlJLY0wfxXL0/c2UkkFBWWG+qxz2GHa3u0Uc4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953524; c=relaxed/simple;
	bh=f77j3SCTqwAT+GaM8xKCdHzIx3G/Jn8Mz8HPtqQebr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUHjuAJV4W04fG5qHRxVAHOwuxbI7kKppg18Sjq1uJEir99FF7X/C5EU/rRlpxhhebS64s02SD9rNdWD5LdhdcFq20gNOVwLVYGpegzwwbzTUGsJZCDwKPrcNiRGovfmbXD0d8FDMA75AS51jZXplwt86o9Z5rw8WhsPW11Y6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRq2/iah; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRq2/iah"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c962e5adso2871942f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 00:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725953520; x=1726558320; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eszUiQ9wlG/1tjLAyBKIiKLnnAvpZBasgR+qa/r6bgw=;
        b=qRq2/iahz0gemfZrCcrPTM+a1+VbeVVpcCyt6t8Z5Tf/KnVZmHMcdSICxKvirwGEki
         H2G5i4HSXpWtl8kIJytmmnMvYjWe3I31825lP4TTZIORo7nG6zxVVF23Nkq+60NVp4Ol
         ebRViTEf5toa9BJkj0SQEUbTvAzlKg+dFVhWe+s3bHfof1psRmBszHPgRZ8LhYDnXFpr
         MRufGuP6t7RAGmYDbM+E59LetxCzDBVh0wqnHdw4uxNnNJBNQqQiQs28j5Ie0CmOa31L
         LTIFhfYimYLuvkYdsYUFXsIQx7SFFzU185L7+zADRLmwVluNJ1lHmzRAHV+PSBb1RrXt
         3Ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725953520; x=1726558320;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eszUiQ9wlG/1tjLAyBKIiKLnnAvpZBasgR+qa/r6bgw=;
        b=owXTIpQTa2KnmJm46V5rd2+B8gUU8SUyG6TsVXvich3ZkuVSAnIfOSMc0bjZvc3Nlz
         jxqkIsqLJDnij29lVaGTmrrd09vOoTK8hMP4sr7pzvncSzLWd/Zcqz5SsS6lljgjm0xw
         Dz7xNkpk12tLZRrXuIc08Acmz7X9tYTxt6YrMxTpgtAEv9AVizX2Q8heQ21/o6Pa4asv
         C/AZbsudnUu3tuJgpLw+L2+jdA8pS7W6QG56dUbieVpGnD7t8kxcKFTkyP8BmrsKnHEv
         KcLxbXeXLDgJMOdMqQnU8O3cakgwOXitUXmCpyFCVb3Dw0OpWhDOIcSbRdDCwnhSBQMC
         kLyg==
X-Gm-Message-State: AOJu0YzlnHBUl+NCWSZh+Vtlx1dsCCsPB1+HQz6JDDEVDDlCONSaQrXs
	iRksVGBP8xoxzX2HMR4xriiyU35EF0OWMgJ7FoyZRUF7qQdB3Qk22w5ymOgNEqTVZwy865ySAbq
	Y
X-Google-Smtp-Source: AGHT+IELa+rG14pL1lB7AiyIMDigzrd0vAidxvik7sx8yhamOOu/U1MRmirvLr3oz1Xd5vrj6Iz8HQ==
X-Received: by 2002:a05:6000:1ac7:b0:374:c6b6:c656 with SMTP id ffacd0b85a97d-378a8a3de4cmr1414873f8f.21.1725953520367;
        Tue, 10 Sep 2024 00:32:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956767dasm8091431f8f.62.2024.09.10.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:31:59 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eric Biggers <ebiggers@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>
Subject: drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp()
 'actual_mac' too small (64 vs 448)
Message-ID: <e8c80d61-2c74-4b50-ab50-2cf1291df9bc@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b831f83e40a24f07c8dcba5be408d93beedc820f
commit: 070bb43ab01e891db1b742d4ddd7291c7f8d7022 dm integrity: use crypto_shash_digest() in sb_mac()
date:   10 months ago
config: i386-randconfig-141-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061401.44rtN1bh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409061401.44rtN1bh-lkp@intel.com/

smatch warnings:
drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp() 'actual_mac' too small (64 vs 448)

vim +/actual_mac +521 drivers/md/dm-integrity.c

09d85f8d8909ec Mikulas Patocka   2021-01-21  492  static int sb_mac(struct dm_integrity_c *ic, bool wr)
09d85f8d8909ec Mikulas Patocka   2021-01-21  493  {
09d85f8d8909ec Mikulas Patocka   2021-01-21  494  	SHASH_DESC_ON_STACK(desc, ic->journal_mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  495  	int r;
070bb43ab01e89 Eric Biggers      2023-10-28  496  	unsigned int mac_size = crypto_shash_digestsize(ic->journal_mac);
070bb43ab01e89 Eric Biggers      2023-10-28  497  	__u8 *sb = (__u8 *)ic->sb;
070bb43ab01e89 Eric Biggers      2023-10-28  498  	__u8 *mac = sb + (1 << SECTOR_SHIFT) - mac_size;
09d85f8d8909ec Mikulas Patocka   2021-01-21  499  
070bb43ab01e89 Eric Biggers      2023-10-28  500  	if (sizeof(struct superblock) + mac_size > 1 << SECTOR_SHIFT) {

This is paired with the line before and prevents the subtraction from going
negative.  It limits the mac_size to 0-448.  Is it reasonable to have a mac_size
which is > HASH_MAX_DIGESTSIZE (64)?

09d85f8d8909ec Mikulas Patocka   2021-01-21  501  		dm_integrity_io_error(ic, "digest is too long", -EINVAL);
09d85f8d8909ec Mikulas Patocka   2021-01-21  502  		return -EINVAL;
09d85f8d8909ec Mikulas Patocka   2021-01-21  503  	}
09d85f8d8909ec Mikulas Patocka   2021-01-21  504  
09d85f8d8909ec Mikulas Patocka   2021-01-21  505  	desc->tfm = ic->journal_mac;
09d85f8d8909ec Mikulas Patocka   2021-01-21  506  
09d85f8d8909ec Mikulas Patocka   2021-01-21  507  	if (likely(wr)) {
070bb43ab01e89 Eric Biggers      2023-10-28  508  		r = crypto_shash_digest(desc, sb, mac - sb, mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  509  		if (unlikely(r < 0)) {
070bb43ab01e89 Eric Biggers      2023-10-28  510  			dm_integrity_io_error(ic, "crypto_shash_digest", r);
09d85f8d8909ec Mikulas Patocka   2021-01-21  511  			return r;
09d85f8d8909ec Mikulas Patocka   2021-01-21  512  		}
09d85f8d8909ec Mikulas Patocka   2021-01-21  513  	} else {
070bb43ab01e89 Eric Biggers      2023-10-28  514  		__u8 actual_mac[HASH_MAX_DIGESTSIZE];

This buffer is only 64 bytes.

0ef0b4717aa684 Heinz Mauelshagen 2023-02-01  515  
070bb43ab01e89 Eric Biggers      2023-10-28  516  		r = crypto_shash_digest(desc, sb, mac - sb, actual_mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  517  		if (unlikely(r < 0)) {
070bb43ab01e89 Eric Biggers      2023-10-28  518  			dm_integrity_io_error(ic, "crypto_shash_digest", r);
09d85f8d8909ec Mikulas Patocka   2021-01-21  519  			return r;
09d85f8d8909ec Mikulas Patocka   2021-01-21  520  		}
070bb43ab01e89 Eric Biggers      2023-10-28 @521  		if (memcmp(mac, actual_mac, mac_size)) {
                                                                                ^^^^^^^^^^
Read overflow.

09d85f8d8909ec Mikulas Patocka   2021-01-21  522  			dm_integrity_io_error(ic, "superblock mac", -EILSEQ);
82bb85998cc9a3 Michael Weiß      2021-09-04  523  			dm_audit_log_target(DM_MSG_PREFIX, "mac-superblock", ic->ti, 0);
09d85f8d8909ec Mikulas Patocka   2021-01-21  524  			return -EILSEQ;
09d85f8d8909ec Mikulas Patocka   2021-01-21  525  		}
09d85f8d8909ec Mikulas Patocka   2021-01-21  526  	}
09d85f8d8909ec Mikulas Patocka   2021-01-21  527  
09d85f8d8909ec Mikulas Patocka   2021-01-21  528  	return 0;
09d85f8d8909ec Mikulas Patocka   2021-01-21  529  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

