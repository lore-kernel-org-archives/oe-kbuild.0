Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C1335090
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952724; cv=none; b=ojtIw0uoLkWA5+XiyTHTYjjE86Davtnk6ZB0dpW4Y8d+2uU4UllmsZG1lFRRHFpl29e49qwLuisvS/HqmpMuJvwZPlT3teeASRWCUjxziJfrH/h0iEag8stv5SZK0sPvAMjpoAQKvgLwycRQlFb7lP/w6YkbFMnZQcD0kmQeGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952724; c=relaxed/simple;
	bh=vMeGx0ETkMo1+WXO6UDYtsKp6bJSoxGJh3jaPBcKAfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jU9pwoNj4G30hDKw2XVffh6vFSK+6P6BtA9Ke36SYHdJD5cRjcx8oXrh69Nd9M3iLL5LSO0iBlDe7oRNqLpLU1fxd4ET9i5smxpfxOX1urHZA15IJsQ5S6NYaANNTrxQa8Ap07xQ4A8/35tQbnSjaV/7H1pljptYQpt9AqSbtkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0p8XFFf; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0p8XFFf"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3415740f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 01:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767952721; x=1768557521; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MgGJ3Hr7/ggiTXxW1aC44HxQCofwD4eLbZ9/jejYJMg=;
        b=l0p8XFFfbpmlE4NLzsS1s3F14u1aWaK214JW46973P0zwmk/jccIKlMKryHIQdV6tB
         tpnjps0S9c4Lx2KNEbzZI8HvtjzIAmIMkccNiwlUiP6+h6HxTDoeQUTPnnEWuCmPspNW
         LG89VP50blHcsHwW2DsHAUDEjJiWWI8JokMoijefBg2tzM91HWc9IxTWTRiwuwZ6XrtD
         4hUUJz5yWQSYHaMhbGRAaBCj2TZ3al69K1BBTjf+wUSto8pBi617/mfotvtM4Vl0/D7s
         CztIIAK9WuLNlXubMLLwIvht4F825pdMF5PoOZttNRc7OD5Zc+8ecBCeb3RniEWuk0GY
         vLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952721; x=1768557521;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgGJ3Hr7/ggiTXxW1aC44HxQCofwD4eLbZ9/jejYJMg=;
        b=Wihuy0p4Ve88A4dRJ66vVQzjKMQgpPV1NrUfsTatkI9MnW+fBRnMUrTImf9vp9Skzh
         lo8yDolSWTmuRD12qGOr+5i7mbNGd/FnmmdlPYMUY1ZT3Iq5yufUENlAl9tiD90g8KWR
         LjnsJBcFTv+Ukwu808hYWX0Bb0BMKWO5ZTOD/qn/ccKEt8AirbKYnA8+eTzRRloj+j5u
         ecpjcghnn6sCfscZVPiZ4NghVcOu4FJ0xh6lfD9gsgMe/x93zPLUKM7P6h6l/H4J5Xa6
         StngLqJiu1MLewgeRlxiq7DTYLRfn9zYWOjG5fQtR2Ai/3/DxAAtbNh4Af2p8vNk5cmt
         p4IQ==
X-Gm-Message-State: AOJu0YyjoSE7iWUaXOWB6mDVoEaqSdvIzLuRn3lEaM665yOcCBgurK5E
	aIGBkv4UDa59rZcSGJ4sD8Q2DzM0P1HOMSA/0r+lEqYmQD/L8tRpJFADIYkcFtbnhh/AJwwX4+O
	YNWMs
X-Gm-Gg: AY/fxX5e0CkaWgnLa4sbjDCht04NbG821iWSRlWD4JYWAu2yxYe7zZ4v14vvEgWFS63
	0vuo21heFrX1SIeA8St3nUoTNaf9nSGjsf9go8xinm4Mw5yGW3SiQ+kSTJucWKGu5Q4BzlrAyD4
	a4ZfvFjHuAcm9xPueds6WQmuDci3UtSOVj3zTfz9ggTfQg5nkEE+v2+SjRe1Eynv7nhei5HuyC/
	28cC34z43qm0nZEkm7F0I2qCrfu+U1/rCTy/lEJoYgiDpUL85CAYoADBA0PqnuEsVjO15trHSis
	W1JWX0+Pr/ctauNPvHUa29xfWk1SNjtMQiTR5lbAkBRLY7ArEf/onhm3LBQdP+LgB+i0EZX98wa
	g2xHB52qE6Bdgbxjs4iZcMqWEpwMq4khO8PzYPzvsePqEZh8JBX7hZjGLiLTE5tMtpu0Nl5Zw60
	kEn1nv6optbGeW1/R5
X-Google-Smtp-Source: AGHT+IG3zsb1CZoowOAk8HTdGiY2nxPVCg2TTX7dZ7LWsMReTrLqbt0ZktUYnYGU3qLEjiQg2E4O+w==
X-Received: by 2002:a05:6000:605:b0:430:f241:a11f with SMTP id ffacd0b85a97d-432c37c87d1mr11722843f8f.30.1767952721322;
        Fri, 09 Jan 2026 01:58:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d9610671sm3418606f8f.34.2026.01.09.01.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:58:40 -0800 (PST)
Date: Fri, 9 Jan 2026 12:58:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/mft.c:2614
 ntfs_mft_record_free() warn: variable dereferenced before check 'ni' (see
 line 2612)
Message-ID: <202601091748.orF9z9Bx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260109095838.iJK6zeHGtfOtOadzJ2ipOK1WJ1SWtR8v2Ddsd-qLEaE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   c9fb91b2b8b4c46188b1a280187d41e9ebb93cb2
commit: 4816227dce428c85178afc885b301780d1da7bda [13/14] ntfs: add Kconfig and Makefile
config: openrisc-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091748.orF9z9Bx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601091748.orF9z9Bx-lkp@intel.com/

New smatch warnings:
fs/ntfs/mft.c:2614 ntfs_mft_record_free() warn: variable dereferenced before check 'ni' (see line 2612)
fs/ntfs/attrlist.c:124 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'ni' (see line 120)
fs/ntfs/attrlist.c:124 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'attr' (see line 120)
fs/ntfs/runlist.c:692 ntfs_mapping_pairs_decompress() warn: unsigned '' is never less than zero.
fs/ntfs/attrib.c:2095 ntfs_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2091)
fs/ntfs/attrib.c:2217 ntfs_non_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2212)
fs/ntfs/attrib.c:2776 ntfs_attr_open() warn: variable dereferenced before check 'ni' (see line 2773)

Old smatch warnings:
fs/ntfs/mft.c:1054 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn: mask and shift to zero: expr='bit >> 3'
fs/ntfs/mft.c:2554 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2132)
fs/ntfs/runlist.c:1586 ntfs_rl_insert_range() warn: variable dereferenced before check 'src_rl' (see line 1583)
fs/ntfs/attrib.c:176 ntfs_map_runlist_nolock() error: uninitialized symbol 'ctx_needs_reset'.
fs/ntfs/attrib.c:4909 ntfs_attr_remove() warn: variable dereferenced before check 'ni' (see line 4908)

vim +/ni +2614 fs/ntfs/mft.c

63adbe420afd6b Namjae Jeon 2026-01-06  2602  int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
7bfba19057c055 Namjae Jeon 2025-12-30  2603  {
63adbe420afd6b Namjae Jeon 2026-01-06  2604  	u64 mft_no;
63adbe420afd6b Namjae Jeon 2026-01-06  2605  	int err;
7bfba19057c055 Namjae Jeon 2025-12-30  2606  	u16 seq_no;
63adbe420afd6b Namjae Jeon 2026-01-06  2607  	__le16 old_seq_no;
63adbe420afd6b Namjae Jeon 2026-01-06  2608  	struct mft_record *ni_mrec;
63adbe420afd6b Namjae Jeon 2026-01-06  2609  	unsigned int memalloc_flags;
63adbe420afd6b Namjae Jeon 2026-01-06  2610  	struct ntfs_inode *base_ni;
7bfba19057c055 Namjae Jeon 2025-12-30  2611  
63adbe420afd6b Namjae Jeon 2026-01-06 @2612  	ntfs_debug("Entering for inode 0x%llx.\n", (long long)ni->mft_no);
                                                                                                      ^^^^^^^^^^
Dereference

7bfba19057c055 Namjae Jeon 2025-12-30  2613  
63adbe420afd6b Namjae Jeon 2026-01-06 @2614  	if (!vol || !ni)
                                                            ^^^
Checked too late.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

