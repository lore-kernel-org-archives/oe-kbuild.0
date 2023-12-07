Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6437D2E
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0zLnBuD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33339d843b9so909501f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Dec 2023 04:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701952894; x=1702557694; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b86jcpOSWItgyj83zYhjOIQCL1JfjUgUyg+WBDZUH70=;
        b=c0zLnBuDOJKTi1eMd+XrSLu8QVRhsBfSzJGBvyMf0cj+16xu0SZQQ1oYcxGXoCjW5Y
         kFKrHkAcAATmtQ6nA4VMSbFKBsBrD/wdZnNEafH8S70jMCmq0A/IVRy/FrDXTuyPXdZX
         T1QYKjhkayfWq7cZtek/EroPLLRYXOuXZ0pxYYRh5oEvKxE7u4T4BiiuingfDgPbjZoL
         VPeMSzSvQ1iDAvaZ+smbVAIPQqMisLWqOIMS4PAORyvD6/1zzaYNj94ZMauqYwgM6Zmj
         vBiafLofDswum1XIF0qLmwJxReREWq+WFLkbWebj8luzb8Bv9jODfaKyH4Y5/RqR13M5
         Fw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701952894; x=1702557694;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b86jcpOSWItgyj83zYhjOIQCL1JfjUgUyg+WBDZUH70=;
        b=KePut8ZrIW8cLTJNg7DATGEhbfkeR8NJZuF/CFbFxcPGHDj0UOosXH4qMaO5tRzaSH
         kHo44F7mSSxiinZQiD1mJ7Ls+pgoP6K/cqZ/LB10FTmKDuFW5eutRQZ+G8UXxd8JuTL+
         U2WRv/Snqi4ksxsK2+2NkwSG/SMQE2HFe9LX0/oKSvx63VdQrLkygegSu3fJ1L1N99Ez
         VhusPm0JVTNgre4ydo+Oz3inD8EEar0CYsZKeMmm4HFKrZTjXhtKWCcw8pb759nkcqv7
         LaVGdIzJOByL0MZCLEXRPSvukFzoHi/O6xf03spvFqhDzfvJzN1uQjBs+cT8h8CY6tsJ
         6oQw==
X-Gm-Message-State: AOJu0Yzqif3EuCmTjEPrmuZA0YZL5nS6Sdc+GZmaPPhHTSHrFheL58IK
	CgLtpQXUgKlJIa2EuNjKufCx2mebWPta6nmIun0=
X-Google-Smtp-Source: AGHT+IGsW7Va+aSzKf+izc0fm2mum7VIRvQBWVob8wEjkrAW2lmA4G32DCDveIYST4sMHlCGV3io6Q==
X-Received: by 2002:adf:ed10:0:b0:333:3b77:f05c with SMTP id a16-20020adfed10000000b003333b77f05cmr1580116wro.106.1701952894236;
        Thu, 07 Dec 2023 04:41:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d4746000000b00334b1564f0esm1341474wrs.89.2023.12.07.04.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:41:34 -0800 (PST)
Date: Thu, 7 Dec 2023 15:41:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.15.y 115/609]
 fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced before
 check 'bio' (see line 995)
Message-ID: <9e3d9dc3-7877-44e5-a4d9-3515936c620c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.15.y
head:   f2de1a67d29d396f18aa7973b6792b29a84ed1f6
commit: e8e3f1a12d05d0aef2c819664890b540dfb055af [115/609] f2fs: don't pass a bio to f2fs_target_device
config: i386-randconfig-141-20231207 (https://download.01.org/0day-ci/archive/20231207/202312071658.K2fohs9s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071658.K2fohs9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312071658.K2fohs9s-lkp@intel.com/

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
Dereferenced

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

