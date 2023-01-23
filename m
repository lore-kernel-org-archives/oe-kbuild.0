Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF327C;
	Mon, 23 Jan 2023 12:03:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id j17so8847300wms.0;
        Mon, 23 Jan 2023 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wSxZruxxpWWQQQw7VfMoK/lDjtvaeb+8KgHT+GUAeY=;
        b=PN/MUcF26ewsLllo93u+hDjnbqM4p8/7/4/mYW/93TKxCeJfzGjqMsd0VVVwAbVjox
         Ec+wm5adxCCMJPz7nzV278b2OfFOm242awm0aIhXyUvGmASg0r7LpQZ/TB/RTz/J1NJH
         mMp50RvJHA+8NE+3H22tO2hUzv5IdKEY8GlFtFEMANudsHwPIQ+pobjp5/ICKA1hgANg
         Jvt8O8iNQIaakxfPh+WFlVs19dVJ0qAZCRK2N95+u0+qwJyPhFwhdDBTZDVEZTvlZoaT
         V2+x9kkLH4qCmE79A1Ry5KYtFapYjJ9gwI8MRqMWEO9NtEGpy68pTwR02xhaCGOSM3Tb
         0TvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wSxZruxxpWWQQQw7VfMoK/lDjtvaeb+8KgHT+GUAeY=;
        b=UQS3eRtWYR5spDhgAo1V1yH7OySn0YgmWhJmdRYC+Gc3+nnfgTHOFMVs6yh5sUEttf
         hiVhjKNgFpoqZJ5Dvf1oMXbiRjxJDVR7v8iPiFnRwjS9KzRMqcXQJtnRLFRUQ9tLBHZ2
         7MJdjVa2vXxvxNuciz+5V2FKM3V6HDV4JRzvoD3wPKrZ4UdQxmJfF3CP943odQrWDzOZ
         cKmnIu/gNmUfSSSGNtg3hWugiaoO0trbDHLBo9YGadK59gcoA26i7XoKvPwRoQvpejNZ
         WYgLlF+8QPCNaq6Jbbp40u1qMi15IVwJqNexGCMZzzlvPHaOJaBBheUOodcNuczOpdWO
         xOtA==
X-Gm-Message-State: AFqh2kr1L0FD9tMDD6CbQpJv+Hf/me5rnYPrelx9oIyB8PxtymYNZrRU
	LXoWlf6+HrNO3hBZKhSm/RyM1D3x1co=
X-Google-Smtp-Source: AMrXdXvHfZmdLRQPtnRu8+3DoyMJJeD8i4I4VxBwY773fw695a5lVcUetHB3YuKTVQ2Aa5FRnjESNQ==
X-Received: by 2002:a05:600c:d2:b0:3da:f475:6480 with SMTP id u18-20020a05600c00d200b003daf4756480mr23961351wmm.7.1674475418010;
        Mon, 23 Jan 2023 04:03:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003c71358a42dsm14545856wms.18.2023.01.23.04.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:03:37 -0800 (PST)
Date: Mon, 23 Jan 2023 15:03:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
 115/361] fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced
 before check 'bio' (see line 995)
Message-ID: <Y853lht6nq1emVj6@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
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

