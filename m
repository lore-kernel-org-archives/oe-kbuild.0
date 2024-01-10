Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBDF3EA6D
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jan 2024 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+xWiSRG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e4d64a431so16870135e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 09 Jan 2024 22:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704869532; x=1705474332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L22KO18sbXj/gCvC8sLlz2ecMZMQd6S3fGWWRO4JzMA=;
        b=Y+xWiSRGFYG1CnfIPdjnnYldpW2bKbt94ffyzZEQ0bXbMhQRCTKSHha1nsRDcmsr00
         TxkfNL8KWf3h+EG1KpbEmTbJv6jXgtDNzxkZZtPftiqW7TIGrEGGHvLMGTTCH29L9ZaE
         Ghcph7br40RrE2avTSKyGWr2xkhY2annIEmSl9z/ID132fzpZCfL6C/Wc8wmTwrbHNQu
         6Cmp9yewn8GpumrfY5z9rk/BCjPdpdqSHI3sSNcte+NRzbYp0utEstBxovv24zuyIYHi
         JHeGO7QuXi/LtpvLnuFCZEsBX7aIckh8S+2cicgpECz2WuaQokLrJ1MLZeqGy34VFdse
         1a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704869532; x=1705474332;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L22KO18sbXj/gCvC8sLlz2ecMZMQd6S3fGWWRO4JzMA=;
        b=OCGUAgnYEkDxpANRqCLuUI1Sf6qz+8MJhtUFcJRFkHpex8tF6G5wRP7TikJknLGKBt
         9xAp1jNXqoUtcv36lAzjbWrcfXuAD1+OjdgRN3ZN9ROI4WRpr0cdxhICf4Wmtdh08nvH
         l80c1gT7UcwBJMYqnwYaDpg2IcX9iMCSDnGJYDtX0IXUF8GrKdPs+uGiw6jKMo3VOqH0
         OasCrkgiBz+6xPaTtLaHuJRbsLJDUEW54iC5QVspTj/Q+ME1rrrKhIrWe5AJcU+eO1Ik
         i48RHE8BXeMlSMVTAvbpyee8aZH0LOl3UshT9PJGWKiOKOKsMAaMsy+xvZrPu4sWenFw
         PKuQ==
X-Gm-Message-State: AOJu0YyyR6PENIDBbk6jPArGfDDT0d159Ew5Qe3euK/AnkscO75a8H7D
	wah+oFdUpef+IWI5/bf0kUF1s5JBm10Ot9AYvIkbbylspng=
X-Google-Smtp-Source: AGHT+IE+1zaWSCHaJZPKuO/16YTtzNTgfW73/daw9bVm6mWi+T8KTtVZU8GI8MXd7YVH6iDcybfogQ==
X-Received: by 2002:a05:600c:b94:b0:40d:8fd1:6111 with SMTP id fl20-20020a05600c0b9400b0040d8fd16111mr256548wmb.116.1704869532327;
        Tue, 09 Jan 2024 22:52:12 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id hn3-20020a05600ca38300b0040e4a7a7ca3sm979068wmb.43.2024.01.09.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 22:52:11 -0800 (PST)
Date: Wed, 10 Jan 2024 09:52:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eric Biggers <ebiggers@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>
Subject: drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp()
 'actual_mac' too small (64 vs 448)
Message-ID: <8f8bcc1a-005f-4477-8440-37558c61fa30@moroto.mountain>
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
head:   9f8413c4a66f2fb776d3dc3c9ed20bf435eb305e
commit: 070bb43ab01e891db1b742d4ddd7291c7f8d7022 dm integrity: use crypto_shash_digest() in sb_mac()
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240109/202401092335.ZFBXDPA1-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401092335.ZFBXDPA1-lkp@intel.com/

New smatch warnings:
drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp() 'actual_mac' too small (64 vs 448)

Old smatch warnings:
drivers/md/dm-integrity.c:3607 dm_integrity_alloc_page_list() warn: Please consider using kvcalloc instead of kvmalloc_array
drivers/md/dm-integrity.c:3641 dm_integrity_alloc_journal_scatterlist() warn: Please consider using kvcalloc instead of kvmalloc_array
drivers/md/dm-integrity.c:3910 create_journal() warn: Please consider using kvcalloc instead of kvmalloc_array

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

This caps mac_size to 448.

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
0ef0b4717aa684 Heinz Mauelshagen 2023-02-01  515  
070bb43ab01e89 Eric Biggers      2023-10-28  516  		r = crypto_shash_digest(desc, sb, mac - sb, actual_mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  517  		if (unlikely(r < 0)) {
070bb43ab01e89 Eric Biggers      2023-10-28  518  			dm_integrity_io_error(ic, "crypto_shash_digest", r);
09d85f8d8909ec Mikulas Patocka   2021-01-21  519  			return r;
09d85f8d8909ec Mikulas Patocka   2021-01-21  520  		}
070bb43ab01e89 Eric Biggers      2023-10-28 @521  		if (memcmp(mac, actual_mac, mac_size)) {

But if it's more than 64 then it's a read overflow.

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

