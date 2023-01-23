Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E776FA4D;
	Mon, 23 Jan 2023 12:30:07 +0000 (UTC)
Received: from [10.7.7.5] (unknown [182.253.88.152])
	by gnuweeb.org (Postfix) with ESMTPSA id CA3FC81F47;
	Mon, 23 Jan 2023 12:22:24 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1674476546;
	bh=lgk2zwP1kpgva+ZUgxjVQRkEplrOVG690aJTRGEP8/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uhspuy8PQNj8wJnPsQ1FC0lbcsB5xCZM68Ohk/OA64Ujm9s2INW08OdBuAYGd2ERP
	 qATFAl6dZwdcOrs+EXVtwNJcrlAzJlA+nq/v2LHcr6rHuZFGKHOImbOFl8XP3c0ipB
	 5fMC9eIf7iNuv3UUV2nI67kdEjM+SjJy1VFp7GfZnZdtff23UVkdWeyDnBF79PLkgH
	 EwDQRlhZvWH2+2RY8qlv9RvP0qpKJd+05SFXSH61spm67udn+baWu+z94Qy+xmqeX+
	 HqzhaKV6THwVNnJnhGfZU0DOivctixbz6ragyi5d6+gMFOOyA/oTpX7e5mto0XFKXJ
	 jopEYxnSAUJtA==
Message-ID: <ea91d364-2e7c-8769-b62b-aa213f677b9b@gnuweeb.org>
Date: Mon, 23 Jan 2023 19:22:21 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re:
 [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
 115/361] fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced
 before check 'bio' (see line 995)
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
Cc: GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 oe-kbuild@lists.linux.dev
References: <Y853lht6nq1emVj6@kadam>
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <Y853lht6nq1emVj6@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/23 7:03 PM, Dan Carpenter wrote:
> tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
> head:   4bf3e7f429f64b802942c685cf37b02a546a25e5
> commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [115/361] f2fs: don't pass a bio to f2fs_target_device
> config: arm64-randconfig-m041-20230115 (https://download.01.org/0day-ci/archive/20230122/202301220910.UeYxE65s-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> New smatch warnings:
> fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before check 'bio' (see line 995)
> 
> vim +/bio +996 fs/f2fs/data.c
> 
> 13ba41e346170e Jaegeuk Kim             2017-09-06   982  static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
> 95ae251fe82838 Eric Biggers            2019-07-22   983  				      unsigned nr_pages, unsigned op_flag,
> 7f59b277f79e8a Eric Biggers            2021-01-04   984  				      pgoff_t first_idx, bool for_write)
> 13ba41e346170e Jaegeuk Kim             2017-09-06   985  {
> 13ba41e346170e Jaegeuk Kim             2017-09-06   986  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> 13ba41e346170e Jaegeuk Kim             2017-09-06   987  	struct bio *bio;
> a4b6817625e71d Daeho Jeong             2021-08-20   988  	struct bio_post_read_ctx *ctx = NULL;
> 6dbb17961f46b2 Eric Biggers            2018-04-18   989  	unsigned int post_read_steps = 0;
> e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   990  	sector_t sector;
> e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   991  	struct block_device *bdev = f2fs_target_device(sbi, blkaddr, &sector);
> 13ba41e346170e Jaegeuk Kim             2017-09-06   992
> 67883ade7a98a7 Christoph Hellwig       2021-01-26   993  	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
> 5f7136db829960 Matthew Wilcox (Oracle  2021-01-29   994) 			       bio_max_segs(nr_pages), &f2fs_bioset);
> e8e3f1a12d05d0 Christoph Hellwig       2022-02-28  @995  	bio_set_dev(bio, bdev);
>                                                                              ^^^
> Dereferenced inside function
> 
> 6dbb17961f46b2 Eric Biggers            2018-04-18  @996  	if (!bio)
>                                                                      ^^^^
> Checked too late
> 
> 13ba41e346170e Jaegeuk Kim             2017-09-06   997  		return ERR_PTR(-ENOMEM);
> e8e3f1a12d05d0 Christoph Hellwig       2022-02-28   998  	bio->bi_iter.bi_sector = sector;
> 27aacd28ea3b89 Satya Tangirala         2020-07-02   999  	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
> 13ba41e346170e Jaegeuk Kim             2017-09-06  1000  	bio->bi_end_io = f2fs_read_end_io;
> e2e59414aae2c8 Jaegeuk Kim             2018-06-21  1001  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
> 13ba41e346170e Jaegeuk Kim             2017-09-06  1002
> 27aacd28ea3b89 Satya Tangirala         2020-07-02  1003  	if (fscrypt_inode_uses_fs_layer_crypto(inode))
> 7f59b277f79e8a Eric Biggers            2021-01-04  1004  		post_read_steps |= STEP_DECRYPT;
> 7f59b277f79e8a Eric Biggers            2021-01-04  1005

That looks like a real bug. I'll forward it to the committer.

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

-- 
Ammar Faizi

