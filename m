Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090C87C;
	Mon, 23 Jan 2023 12:24:23 +0000 (UTC)
Received: from [10.7.7.5] (unknown [182.253.88.152])
	by gnuweeb.org (Postfix) with ESMTPSA id CAAD582EDA;
	Mon, 23 Jan 2023 12:24:20 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1674476663;
	bh=LNjp3LoX7Np3bWFgwP8NrMjP66Gwf5nDWfy26q/gVVg=;
	h=Date:Subject:References:To:Cc:From:In-Reply-To:From;
	b=h9JyUADiYEz9Cw/xchaP3bMEgn064KQwN8n8nO0U6HF9et6UiqTADwzXXd8Y18yt7
	 qs0zxsp3XSmjIjth/BMe8oTY02TokrqumALvu45+vzKdKK+XZcyWY4UBceWY2s38l/
	 JObr1IO/YeedUf32tsGav2q2NH095izb3EAuOv8ojZ/BLcNbGoxZf1vOEDTevEffdv
	 xIW+nhfeoqEviHk92XqO1Q4LzNHjS6D+71Db7pZQnD00Elmj1zo/ilTUR1j6hQ5pCh
	 SOdF9vDpboasjN9NB+g52E6sAAwN0WcOYcMpQy89uJJxgOO20xh6uT9xD94dA6zn4g
	 Qy5SVKtvTozNg==
Message-ID: <0b9b8c6b-b79a-126f-745e-f571abad7bff@gnuweeb.org>
Date: Mon, 23 Jan 2023 19:24:17 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Fwd:
 [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
 115/361] fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced
 before check 'bio' (see line 995)
References: <Y853lht6nq1emVj6@kadam>
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <Y853lht6nq1emVj6@kadam>
X-Forwarded-Message-Id: <Y853lht6nq1emVj6@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

commit e8e3f1a12d05d0aef2c819664890b540dfb055af
Author:     Christoph Hellwig <hch@lst.de>
AuthorDate: Mon Feb 28 14:41:22 2022 +0200
Commit:     Jaegeuk Kim <jaegeuk@kernel.org>
CommitDate: Thu Apr 28 15:51:57 2022 -0700

     f2fs: don't pass a bio to f2fs_target_device
     
     Set the bdev at bio allocation time by changing the f2fs_target_device
     calling conventions, so that no bio needs to be passed in.
     
     Signed-off-by: Christoph Hellwig <hch@lst.de>
     Reviewed-by: Chao Yu <chao@kernel.org>
     Link: https://lore.kernel.org/r/20220228124123.856027-2-hch@lst.de
     Signed-off-by: Jens Axboe <axboe@kernel.dk>

-------- Forwarded Message --------
Return-Path: <error27@gmail.com>
Delivered-To: ammarfaizi2@gnuweeb.org
Received: from gnuweeb.org by gnuweeb.org with LMTP id bj+9NNd3zmNuCiAALGQddQ (envelope-from <error27@gmail.com>) for <ammarfaizi2@gnuweeb.org>; Mon, 23 Jan 2023 12:04:39 +0000
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45]) by gnuweeb.org (Postfix) with ESMTPS id CD75A81F47 for <ammarfaizi2@gnuweeb.org>; Mon, 23 Jan 2023 12:04:39 +0000 (UTC)
Authentication-Results: gnuweeb.org; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PN/MUcF2; dkim-atps=neutral
Received: by mail-wm1-f45.google.com with SMTP id g10so8820505wmo.1        for <ammarfaizi2@gnuweeb.org>; Mon, 23 Jan 2023 04:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com; s=20210112;        h=content-disposition:mime-version:message-id:subject:cc:to:from:date         :from:to:cc:subject:date:message-id:reply-to;        bh=+wSxZruxxpWWQQQw7VfMoK/lDjtvaeb+8KgHT+GUAeY=;        b=PN/MUcF26ewsLllo93u+hDjnbqM4p8/7/4/mYW/93TKxCeJfzGjqMsd0VVVwAbVjox         Ec+wm5adxCCMJPz7nzV278b2OfFOm242awm0aIhXyUvGmASg0r7LpQZ/TB/RTz/J1NJH         mMp50RvJHA+8NE+3H22tO2hUzv5IdKEY8GlFtFEMANudsHwPIQ+pobjp5/ICKA1hgANg         Jvt8O8iNQIaakxfPh+WFlVs19dVJ0qAZCRK2N95+u0+qwJyPhFwhdDBTZDVEZTvlZoaT         V2+x9kkLH4qCmE79A1Ry5KYtFapYjJ9gwI8MRqMWEO9NtEGpy68pTwR02xhaCGOSM3Tb         0TvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=1e100.net; s=20210112;        h=content-disposition:mime-version:message-id:subject:cc:to:from:date         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;        bh=+wSxZruxxpWWQQQw7VfMoK/lDjtvaeb+8KgHT+GUAeY=;        b=GyQ3P6t0Dz0ljs0KlNl2xbM96sWY2lds6vo3o6rm/plInbhbvMWwKK9VayD4DuDwD4         BkXPsgz5/N5HyGzYuJhlNz08qorH7KFmZ32YtPCB4aoxE0mO5WL8xUKioWL1Cgv8cOt5         3cteXAhwWGP2xb/Tm/B1kJfBt7dpAcDfficz+jqFEovsQbWHw8wvdVH3iwIJHV7lr0uq         edWy+BgqjR2yXbiCaeE9cNJiJz8h2F19Wl/Xn83rEW5h8QT5nv5x764nDAxSnnIynUbf         jx/IFAArxDknvGGUvmssYmOwKwBhmFh1fqraYHFuLNdsZwV+macItUacH3whb0LTDjkO         dzNQ==
X-Gm-Message-State: AFqh2kqQM73J7HIj7OoFjloYVx1g2bnJt+KrNej293ZzR4yh85ZDbHBf MqdggbQKbsi2AJsbIRhkT0w=
X-Google-Smtp-Source: AMrXdXvHfZmdLRQPtnRu8+3DoyMJJeD8i4I4VxBwY773fw695a5lVcUetHB3YuKTVQ2Aa5FRnjESNQ==
X-Received: by 2002:a05:600c:d2:b0:3da:f475:6480 with SMTP id u18-20020a05600c00d200b003daf4756480mr23961351wmm.7.1674475418010;        Mon, 23 Jan 2023 04:03:38 -0800 (PST)
Received: from localhost ([102.36.222.112])        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003c71358a42dsm14545856wms.18.2023.01.23.04.03.36        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);        Mon, 23 Jan 2023 04:03:37 -0800 (PST)
Date: Mon, 23 Jan 2023 15:03:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y 115/361] fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)
Message-ID: <Y853lht6nq1emVj6@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
head:   4bf3e7f429f64b802942c685cf37b02a546a25e5
commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [115/361] f2fs: don't pass a bio to f2fs_target_device
config: arm64-randconfig-m041-20230115 (https://download.01.org/0day-ci/archive/20230122/202301220910.UeYxE65s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)

vim +/bio +996 fs/f2fs/data.c

13ba41e346170e Jaegeuk Kim             2017-09-06   982  static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
95ae251fe82838 Eric Biggers            2019-07-22   983  				      unsigned nr_pages, unsigned op_flag,
7f59b277f79e8a Eric Biggers            2021-01-04   984  				      pgoff_t first_idx, bool for_write)
13ba41e346170e Jaegeuk Kim             2017-09-06   985  {
13ba41e346170e Jaegeuk Kim             2017-09-06   986  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
13ba41e346170e Jaegeuk Kim             2017-09-06   987  	struct bio *bio;
a4b6817625e71d Daeho Jeong             2021-08-20   988  	struct bio_post_read_ctx *ctx = NULL;
6dbb17961f46b2 Eric Biggers            2018-04-18   989  	unsigned int post_read_steps = 0;
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   990  	sector_t sector;
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   991  	struct block_device *bdev = f2fs_target_device(sbi, blkaddr, &sector);
13ba41e346170e Jaegeuk Kim             2017-09-06   992
67883ade7a98a7 Christoph Hellwig       2021-01-26   993  	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
5f7136db829960 Matthew Wilcox (Oracle  2021-01-29   994) 			       bio_max_segs(nr_pages), &f2fs_bioset);
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28  @995  	bio_set_dev(bio, bdev);
                                                                             ^^^
Dereferenced inside function

6dbb17961f46b2 Eric Biggers            2018-04-18  @996  	if (!bio)
                                                                     ^^^^
Checked too late

13ba41e346170e Jaegeuk Kim             2017-09-06   997  		return ERR_PTR(-ENOMEM);
e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   998  	bio->bi_iter.bi_sector = sector;
27aacd28ea3b89 Satya Tangirala         2020-07-02   999  	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
13ba41e346170e Jaegeuk Kim             2017-09-06  1000  	bio->bi_end_io = f2fs_read_end_io;
e2e59414aae2c8 Jaegeuk Kim             2018-06-21  1001  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
13ba41e346170e Jaegeuk Kim             2017-09-06  1002
27aacd28ea3b89 Satya Tangirala         2020-07-02  1003  	if (fscrypt_inode_uses_fs_layer_crypto(inode))
7f59b277f79e8a Eric Biggers            2021-01-04  1004  		post_read_steps |= STEP_DECRYPT;
7f59b277f79e8a Eric Biggers            2021-01-04  1005

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

