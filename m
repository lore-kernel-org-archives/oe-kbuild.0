Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B67355804
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599753; cv=none; b=sJQpawZHrJ/NUjmnlhE7Uxhrr0BafvNcRRF8/59BqQVeVF59XDyl2B/8PBSiPXqr/kpdaB9FvFF8dYDy5/aDLQTWbD4gEDB4Fi00rerCtg4f93ShH2QUq3VY5SjTFms3Req1sMaFYBT9XyrCaz2mp0X5rQNbRuhjQLITmL8KGX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599753; c=relaxed/simple;
	bh=3CLtZ3wk/VMe5xps+/LNBIPD8iqcEdzqblKOKs3ukL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WF0MSuUs44VOvGwzkTjAe6Xqv4Wfu3Qp3oeQ9IQGj/qItLRDOapO9kzFl/WTdvNarsJ0dTNzGjwJfDPYorl2W+kkQjvm155OX3GFYDYCU2h6kuLIy21zpsC+hobbdJRY4Psc4ljSKFLdZwDP+NeG0h+Q7qS+sNR2J4Mzo+8VVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PS66aF9b; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PS66aF9b"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so8824525e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 03:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769599750; x=1770204550; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD9cjK4h2ME11R43It4jeF977U8gV/xH4Mn6b8QC/Vc=;
        b=PS66aF9b+fuwhkX/IbK+l9EeLUWuNEvAUeciMD4nxKMpR9mNmZBtG0robS4uGyyNQV
         7QFlk3UExYl6+uxKtNdXrdwkcwSF05kEPsgoElG8/CHQdr38GG41U/nboal+LQWsnByh
         DdP/wyFpvZWCERkhj3CbxJSdZUvvafp8cOYpbYK2JgzWGA5vcCzoTpG7nbBTK7zb7H5v
         xUza0RSgNVTVsrmOTKFiOP87Frn484Bc5E3RJIyvN/KLqY3KrzJ58ebf4DJoVhmH0Z2K
         DzBGBEVEfLfuMPjfUlIIwTdlhFmwpfhO1RLcMVxtvvhLOF28ODdGgxl5KH33dPnSxYv1
         S7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599750; x=1770204550;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wD9cjK4h2ME11R43It4jeF977U8gV/xH4Mn6b8QC/Vc=;
        b=SyWpznU47QQ4HvH61QWlUKmbqX+sqAMLSN9Pr9rrQpD987xySn+9Kq1F0aMe5Iamn2
         z3Em1P16JcSq36JIvQD/21h8DPxlHGcERgy2okluLVtQ43ObyTuV1y/O+HLzof7VOSQ4
         h5F5xuI1+6ISsP67lY72JI7a52xbOdm82kT/4eBfaKEZaC5bh2tCBta0DA7zEUuEesbX
         +53gDQeLFbYFVVYAAlfdkG+yHb7Y53G6GWOl/AvGXVOj36zKKembcK+QCDkLv291jJvp
         C+HhIwCUdMyQa8aunx45Ood9Y7BpejeMC2yXpDoI5aT9wkpFzmQWwYSwx7Zu6wHspymr
         gU+Q==
X-Gm-Message-State: AOJu0YyPV7f26jHnHLD6cQHk80rkbVEBBeNjMwS95cxLBRcHTO7Onv71
	/I2B0n5IdxNHMxfavJ5BmgC7qJAMR7ebgv+jt9Rdlw2jtSoSgH+97OLWbMN2WchrMdmGuvogCTw
	F+RV+
X-Gm-Gg: AZuq6aJ2fdwkvvRcpaIJ2oHPnZQ7bLtGn86KzjmQ5gX7Y0zqdmVxiwCwf4acHxrFMsy
	0Ft7sAz2bkXNCkIKHRIoiwymD2KNscnr4NjugG3QlprWmHGop1KF1sTk7PUTQv30oL4dftxOqTY
	WfUm0q2BG4eZHOUrzcYmg34qh3M/niQNuQM0CS6AYvZkqxNCiS6kCY3BeEoqZ2IAaD8SiMVb5tA
	ihlBgJ8x4ErExcnmC5nhvNQhia3i4T1Zeg4Nvb3STh3jYDZO5IGUBd1pObmTCd7+e4ahRoOMYLF
	PwrALkc/mZtt/oWXUYzBe4DXBgZ71iy/olUBFWGcu8YrQGXuoXdBEYfXL9DX/tPg2P8AWTtshBH
	gci4bb1fIefZkbhRIU/wGpkgTO4ev7GFwrS6gpKiG09F1ZguOwnACniXCa/eTPgIea3CeeWW/LX
	s0xduSZQuBZyqdLzClO+uxmLaM5fs=
X-Received: by 2002:a05:600c:37c8:b0:480:3b26:82c3 with SMTP id 5b1f17b1804b1-48069c5b93amr61350985e9.20.1769599749669;
        Wed, 28 Jan 2026 03:29:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm59333515e9.3.2026.01.28.03.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:29:09 -0800 (PST)
Date: Wed, 28 Jan 2026 14:29:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] fs/f2fs/iostat.c:210
 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <=
 3
Message-ID: <202601272004.HnjloZC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260128112905.itDVBedCzGY-hIe3rm-8GywTm-k4CuNnaNOFfrtMUj4@z>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   8b96c137bec0cc9c414f85dc958b9a5785a0790f
commit: d95bf22a4d1cbeebc288b87af27f0ea181a57218 [1/1] f2fs: introduce periodic iostat io latency traces
config: x86_64-randconfig-161-20260126 (https://download.01.org/0day-ci/archive/20260127/202601272004.HnjloZC4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601272004.HnjloZC4-lkp@intel.com/

New smatch warnings:
fs/f2fs/iostat.c:210 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <= 3
fs/f2fs/iostat.c:211 __update_iostat_latency() error: buffer overflow 'io_lat->bio_cnt[idx]' 3 <= 3
fs/f2fs/iostat.c:212 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[idx]' 3 <= 3

Old smatch warnings:
fs/f2fs/iostat.c:213 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[idx]' 3 <= 3

vim +210 fs/f2fs/iostat.c

d95bf22a4d1cbe Daeho Jeong 2021-08-20  183  static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
d95bf22a4d1cbe Daeho Jeong 2021-08-20  184  				int rw, bool is_sync)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  185  {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  186  	unsigned long ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  187  	unsigned int iotype = iostat_ctx->type;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  188  	unsigned long flags;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  189  	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  190  	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  191  	int idx;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  192  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  193  	if (!sbi->iostat_enable)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  194  		return;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  195  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  196  	ts_diff = jiffies - iostat_ctx->submit_ts;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  197  	if (iotype >= META_FLUSH)

Should this be NR_PAGE_TYPE?  The check is off by one.

d95bf22a4d1cbe Daeho Jeong 2021-08-20  198  		iotype = META;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  199  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  200  	if (rw == 0) {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  201  		idx = READ_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  202  	} else {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  203  		if (is_sync)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  204  			idx = WRITE_SYNC_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  205  		else
d95bf22a4d1cbe Daeho Jeong 2021-08-20  206  			idx = WRITE_ASYNC_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  207  	}
d95bf22a4d1cbe Daeho Jeong 2021-08-20  208  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  209  	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @210  	io_lat->sum_lat[idx][iotype] += ts_diff;


Out of bounds if iotype is NR_PAGE_TYPE.

d95bf22a4d1cbe Daeho Jeong 2021-08-20 @211  	io_lat->bio_cnt[idx][iotype]++;
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @212  	if (ts_diff > io_lat->peak_lat[idx][iotype])
d95bf22a4d1cbe Daeho Jeong 2021-08-20  213  		io_lat->peak_lat[idx][iotype] = ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  214  	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
d95bf22a4d1cbe Daeho Jeong 2021-08-20  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

