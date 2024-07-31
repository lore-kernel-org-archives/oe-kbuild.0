Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB9C1B5824
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441915; cv=none; b=KuWOpsLOjvWiInHPsvzD2Yv4MdhsTZCDs2AmHpaWKg8lOuGrbvx5zki4HGc+LdqX9A94BMa8ky9/hh/ib5AoO31rUR/gBt+H03lqMm1nc0xs2W0jdSJJToZkQ3nYxb+CkBSe9sfLMYkwhAj+APzahPWFlhsqe0gw1UqPwqnDrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441915; c=relaxed/simple;
	bh=Kay01Difojzi1B4Ngg8n9bDnNtVi56na7j2sD9FubRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j0J7RlKtKXHwWRSAtdTt9J/nIWgOfYltRz7DtMSA+olxYLdn1wftNGNNsai7Q1kfDIGtbySfbDS0n6fBU4cWb6wIrbWYzv1GmEnHOoLcl23Xq8X40o5I4u1AOEIYX3v9EQoX1wLpzaXEu8huW+sUKao/ahEoRVJfz11kk9bXIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXm5t/K8; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXm5t/K8"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7093705c708so6018716a34.1
        for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722441913; x=1723046713; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7FaYozThrUNv9xIOGFOC3REDA8OBlgn7bp85SyIYhQ=;
        b=wXm5t/K8AHUZ7aW7xC7e8XD+m/jZj0xcznRF3nplgkw2GCQ1GW2hrhB/VRK/vf47mC
         1zjWHtV03mjqNcm52fFItj6JAaapYDhhGHoxwjIBsv9gSvD7p0bZ6HqMwcjuQT+9XfBM
         cdezj+f1E1nYQv1whZJjRuztoydDHBysu+qC/Updoi0P5eKcyico2YiZMIsek3WxyBnH
         cnlu0GKU4RR7NvIvMJO8eNd+B0DgFQ1yPgU5itvXa/c5UnPikJxJJE8gmkH8tUL6Z2ue
         VE52aouC051DYHDwFd+SMfqmA963AEoCuQdqnB4EpnaEWVx82Ui4TKxDZAXWqmvnbUSu
         jxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441913; x=1723046713;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7FaYozThrUNv9xIOGFOC3REDA8OBlgn7bp85SyIYhQ=;
        b=vIdBw+T39LiMGyKvaPCfqwn8rCC4gnPvxST7Sdgk2oehKO+kaMS4MH5ueX2sIRrSGA
         wasWrrF/KQLrBaz1ovJk9PCmADqeB7DdTauKIYyaXA9heexV+lvefTeuaoy6melInWWp
         Xwb/YyPujc5uuFyKxew8m7b1I+1pE/1sYn0pngY6tJkKVVHA47ISv+7yfV6PQ75R13B1
         nzJFrWHF6PJqb2BxPgO6ivgKREeLKaF3ebdhfxLgz7jae7aSEtI65BWgWwVlKv22SF5F
         dIDFUK1cbRJlfonlgZeXIl9m3gO7WAdEvMg5rRN6I2Pza+BUGDd3fWWdAOkk594D5A7V
         9+tw==
X-Gm-Message-State: AOJu0Yzz+QKZl+9FmVMmoJEbrDSR/y63aBTuW4JgBZ6HMVjv5C3TCrL2
	2sTsgcGcKHdXUUjA/RZo1vftbqGtxUx3E0SkC18ww9P8mbu9SS/4pOeEdlk0+VQotpxdqOSuYi7
	Mqwk=
X-Google-Smtp-Source: AGHT+IEAgfq3VsDRWUtyob0zSkUkcRK6xUFYpi1Uv0rmMAowyU631kZGCd5pJS/QjUmYUSB6SK8eJw==
X-Received: by 2002:a05:6830:4908:b0:709:3ea3:e2d1 with SMTP id 46e09a7af769-70940c5e0a6mr20290663a34.27.1722441912828;
        Wed, 31 Jul 2024 09:05:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c572:4680:6997:45a1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095ad4eae4sm939021a34.1.2024.07.31.09.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:05:12 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:05:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [isilence:iou/discard 13/13] block/ioctl.c:206
 blkdev_cmd_queue_discard() error: we previously assumed 'bio' could be null
 (see line 199)
Message-ID: <57ef3d11-2560-4e3c-b312-63e535027dce@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux iou/discard
head:   444b80e47399c01839870b7d75c968fc0e438b29
commit: 444b80e47399c01839870b7d75c968fc0e438b29 [13/13] block: implement io_uring discard cmd
config: x86_64-randconfig-161-20240730 (https://download.01.org/0day-ci/archive/20240731/202407312305.YVmb427T-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407312305.YVmb427T-lkp@intel.com/

smatch warnings:
block/ioctl.c:206 blkdev_cmd_queue_discard() error: we previously assumed 'bio' could be null (see line 199)

vim +/bio +206 block/ioctl.c

444b80e47399c0 Pavel Begunkov  2024-07-20  176  int blkdev_cmd_queue_discard(struct io_uring_cmd *cmd,
444b80e47399c0 Pavel Begunkov  2024-07-20  177  			     uint64_t start, uint64_t len, bool nowait,
444b80e47399c0 Pavel Begunkov  2024-07-20  178  			     void (*end_io)(struct bio *))
444b80e47399c0 Pavel Begunkov  2024-07-20  179  {
444b80e47399c0 Pavel Begunkov  2024-07-20  180  	struct file *file = cmd->file;
444b80e47399c0 Pavel Begunkov  2024-07-20  181  	struct block_device *bdev = I_BDEV(file->f_mapping->host);
444b80e47399c0 Pavel Begunkov  2024-07-20  182  	sector_t sector = start >> SECTOR_SHIFT;
444b80e47399c0 Pavel Begunkov  2024-07-20  183  	sector_t nr_sects = len >> SECTOR_SHIFT;
444b80e47399c0 Pavel Begunkov  2024-07-20  184  	struct bio *prev = NULL, *bio;
444b80e47399c0 Pavel Begunkov  2024-07-20  185  	int err;
444b80e47399c0 Pavel Begunkov  2024-07-20  186  
444b80e47399c0 Pavel Begunkov  2024-07-20  187  	err = blk_check_discard(bdev, file_to_blk_mode(file), start, len);
444b80e47399c0 Pavel Begunkov  2024-07-20  188  	if (err)
444b80e47399c0 Pavel Begunkov  2024-07-20  189  		return err;
444b80e47399c0 Pavel Begunkov  2024-07-20  190  
444b80e47399c0 Pavel Begunkov  2024-07-20  191  	err = filemap_invalidate_pages(bdev->bd_mapping, start,
444b80e47399c0 Pavel Begunkov  2024-07-20  192  					start + len - 1, nowait);
444b80e47399c0 Pavel Begunkov  2024-07-20  193  	if (err)
444b80e47399c0 Pavel Begunkov  2024-07-20  194  		return err;
444b80e47399c0 Pavel Begunkov  2024-07-20  195  
444b80e47399c0 Pavel Begunkov  2024-07-20  196  	while (1) {
444b80e47399c0 Pavel Begunkov  2024-07-20  197  		bio = blk_alloc_discard_bio(bdev, &sector, &nr_sects,
444b80e47399c0 Pavel Begunkov  2024-07-20  198  					    GFP_KERNEL);
444b80e47399c0 Pavel Begunkov  2024-07-20 @199  		if (!bio)
444b80e47399c0 Pavel Begunkov  2024-07-20  200  			break;

If we hit this break

444b80e47399c0 Pavel Begunkov  2024-07-20  201  		if (nowait)
444b80e47399c0 Pavel Begunkov  2024-07-20  202  			bio->bi_opf |= REQ_NOWAIT;
444b80e47399c0 Pavel Begunkov  2024-07-20  203  		prev = bio_chain_and_submit(prev, bio);
444b80e47399c0 Pavel Begunkov  2024-07-20  204  	}
444b80e47399c0 Pavel Begunkov  2024-07-20  205  
444b80e47399c0 Pavel Begunkov  2024-07-20 @206  	bio->bi_private = cmd;
                                                        ^^^^^
We are dead

444b80e47399c0 Pavel Begunkov  2024-07-20  207  	bio->bi_end_io = end_io;
444b80e47399c0 Pavel Begunkov  2024-07-20  208  
444b80e47399c0 Pavel Begunkov  2024-07-20  209  	if (nr_sects) {
444b80e47399c0 Pavel Begunkov  2024-07-20  210  		bio->bi_status = BLK_STS_AGAIN;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

