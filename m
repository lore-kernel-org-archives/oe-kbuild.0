Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7341369AC
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711440420; cv=none; b=it9rIo5Fxg1GWERGp316W3Rs8JhOQyAFblGLsbr+Q2jCX77cfnK9KcRLEfPFXXIlw3BlqTVzGwf7FjTQlfvx64Fq0hlm+hQryP7yJ/VbPsKTgHLJsVjMxevdb8tEUWrPTexAiQrFskYdOl1xYjLRUiLmNjqlpvpCbiFeg7dm9J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711440420; c=relaxed/simple;
	bh=OauDzudJoTRweTb/Sc4PFkTacXGPjRj191RvQaU7XSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flj91kedjKJyrmftENuf7ajtWFHrqpJoULg41z4d6nPxekoGP0Cz06VXUMPu8WWkEwFTKY5cKLaHZ77FmlPs1ZenS/UF5bS3gqqHRPn63Es9Mi8GaNl7Ov9aD87LT1hnCPGe1BdaLSsDSzDMkY3F+sVs2LrvRbmLd3iUdzpzOBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnnT3Y/W; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnnT3Y/W"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5688eaf1165so7136839a12.1
        for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711440416; x=1712045216; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wv7Cgtq2y08WcN50NFCCBaGIgPs6PtJL2P5kxvAuzUg=;
        b=KnnT3Y/WEnJM8XhBMOmwDOjn/VVwRUIHzk1yyLeklhFGzJxe/6os8Dt1fCimKqqC5h
         fT07fyLHbzCh9rzlRDTwBO3yz2BiZPHhLzXWSxWtCKanWbsWhw5K8+SFdAoF4lKQJTD2
         sfoWCMffQ9Gh6ztH1X+cBIXzalZWXbCfR5k1pI2xzOmGJw4qAVQUxx42SzHQeXyQGufa
         euXzZMc3VufOYHV5WDFEq1Vi3wwItPQhT1ilqXMckiK2lgZcx/wAOktcqL+TkRP9pUSw
         cZKTHYcLef5d7EwPzGBWnaPFd2Tv5O001C08NITAncHL8w4S1plBH8vl+iMOuy+jtIZb
         DFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711440416; x=1712045216;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv7Cgtq2y08WcN50NFCCBaGIgPs6PtJL2P5kxvAuzUg=;
        b=KlRrsGi27wE/ca9/etRKytjgKgyoHjy4DF9yW0qGppHpkwkMuAmHdJUGThKehhYY8U
         ENrqS8upzgAkOwScxLmaWipI+YR4WdGFAh3HwY8C4C7OHTxXq55tbx834XYpUcNJ5/bl
         /Yv3OQEQ3zzjPWh5yYMt8nzx/xYS2ilRhXuGXBRRo1Ai2cwjqBo4gdjOMjKYfBape3Uq
         cj7qtRHcIb8mqPF03vNXAx0bWJ9/m8vkw515hjy6xZ0sLcVtSeMMmgDHqxzErv10/mOb
         GHlDPfUt1OsEE5egE4PpNaECsidpNu70erP8vy58gXocjFrQQgAa7Z+xdHt46wlJGlRl
         0HZA==
X-Gm-Message-State: AOJu0YyAi8F5usoQRs6IU1zQ6Q5sWUn1XkvZrN8YO8zMov8kgQd+FWQB
	UyqkcNTdGiShwxFQy/CG+YElrKrRxhmLgJiJ+RbVfVCS01oTstQG9J82Bz/BYmLyw/V2TluV7qX
	7
X-Google-Smtp-Source: AGHT+IEH3RjpGzp1NQMAlYAFpPpoGetXOyQI/NaUp8Uj0p16ni+pZo2x7jIBSS9R/jee1UWz7EtFdQ==
X-Received: by 2002:a50:a6dc:0:b0:56b:a017:e9 with SMTP id f28-20020a50a6dc000000b0056ba01700e9mr5395742edc.41.1711440416124;
        Tue, 26 Mar 2024 01:06:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k18-20020a056402049200b0056c1cba8480sm1110471edv.25.2024.03.26.01.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 01:06:55 -0700 (PDT)
Date: Tue, 26 Mar 2024 11:06:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 7/9] fs/f2fs/data.c:2590 f2fs_should_update_outplace()
 error: we previously assumed 'fio' could be null (see line 2581)
Message-ID: <1239448e-5471-4c5d-8e80-7380af16660d@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   ffa2225cad631419f3944c962518291a7df50367
commit: aac0576c96c228281b5db26528047da6a585fe84 [7/9] f2fs: zone: allow IPU in regular block device
config: xtensa-randconfig-r081-20240325 (https://download.01.org/0day-ci/archive/20240326/202403260735.dL4awPJc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403260735.dL4awPJc-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:2590 f2fs_should_update_outplace() error: we previously assumed 'fio' could be null (see line 2581)

vim +/fio +2590 fs/f2fs/data.c

4d57b86dd86404 Chao Yu          2018-05-30  2574  bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
bb9e3bb8dbf597 Chao Yu          2018-01-17  2575  {
bb9e3bb8dbf597 Chao Yu          2018-01-17  2576  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
bb9e3bb8dbf597 Chao Yu          2018-01-17  2577  
19bdba5265624b Jaegeuk Kim      2021-12-09  2578  	/* The below cases were checked when setting it. */
19bdba5265624b Jaegeuk Kim      2021-12-09  2579  	if (f2fs_is_pinned_file(inode))
19bdba5265624b Jaegeuk Kim      2021-12-09  2580  		return false;
19bdba5265624b Jaegeuk Kim      2021-12-09 @2581  	if (fio && is_sbi_flag_set(sbi, SBI_NEED_FSCK))
                                                            ^^^
Can fio be NULL?

19bdba5265624b Jaegeuk Kim      2021-12-09  2582  		return true;
aac0576c96c228 Chao Yu          2024-03-23  2583  	if (f2fs_lfs_mode(sbi)) {
aac0576c96c228 Chao Yu          2024-03-23  2584  		if (!f2fs_sb_has_blkzoned(sbi))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2585  			return true;
aac0576c96c228 Chao Yu          2024-03-23  2586  		/* no regular block device in mainarea */
aac0576c96c228 Chao Yu          2024-03-23  2587  		if (!sbi->first_zoned_segno)
aac0576c96c228 Chao Yu          2024-03-23  2588  			return true;
aac0576c96c228 Chao Yu          2024-03-23  2589  		/* blkaddr locates in sequential zone */
aac0576c96c228 Chao Yu          2024-03-23 @2590  		if (GET_SEGNO(sbi, fio->old_blkaddr) >= sbi->first_zoned_segno)
                                                                                   ^^^^^
Unchecked dereference

aac0576c96c228 Chao Yu          2024-03-23  2591  			return true;
aac0576c96c228 Chao Yu          2024-03-23  2592  	}
bb9e3bb8dbf597 Chao Yu          2018-01-17  2593  	if (S_ISDIR(inode->i_mode))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2594  		return true;
af033b2aa8a874 Chao Yu          2018-09-20  2595  	if (IS_NOQUOTA(inode))
af033b2aa8a874 Chao Yu          2018-09-20  2596  		return true;
bb9e3bb8dbf597 Chao Yu          2018-01-17  2597  	if (f2fs_is_atomic_file(inode))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2598  		return true;
943f7c6f987f4a Chao Yu          2023-09-04  2599  	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
943f7c6f987f4a Chao Yu          2023-09-04  2600  	if (f2fs_compressed_file(inode) &&
943f7c6f987f4a Chao Yu          2023-09-04  2601  		F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER &&
943f7c6f987f4a Chao Yu          2023-09-04  2602  		is_inode_flag_set(inode, FI_ENABLE_COMPRESS))
943f7c6f987f4a Chao Yu          2023-09-04  2603  		return true;
859fca6b706e00 Chao Yu          2021-05-26  2604  
859fca6b706e00 Chao Yu          2021-05-26  2605  	/* swap file is migrating in aligned write mode */
859fca6b706e00 Chao Yu          2021-05-26  2606  	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
859fca6b706e00 Chao Yu          2021-05-26  2607  		return true;
859fca6b706e00 Chao Yu          2021-05-26  2608  
1018a5463a0637 Chao Yu          2022-02-04  2609  	if (is_inode_flag_set(inode, FI_OPU_WRITE))
1018a5463a0637 Chao Yu          2022-02-04  2610  		return true;
1018a5463a0637 Chao Yu          2022-02-04  2611  
bb9e3bb8dbf597 Chao Yu          2018-01-17  2612  	if (fio) {
                                                        ^^^^^^^^^^
Checked here as well.

b763f3bedc2da2 Chao Yu          2021-04-28  2613  		if (page_private_gcing(fio->page))
bb9e3bb8dbf597 Chao Yu          2018-01-17  2614  			return true;
4354994f097d06 Daniel Rosenberg 2018-08-20  2615  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
4354994f097d06 Daniel Rosenberg 2018-08-20  2616  			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
4354994f097d06 Daniel Rosenberg 2018-08-20  2617  			return true;
bb9e3bb8dbf597 Chao Yu          2018-01-17  2618  	}
bb9e3bb8dbf597 Chao Yu          2018-01-17  2619  	return false;
bb9e3bb8dbf597 Chao Yu          2018-01-17  2620  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

