Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF51E10E5;
	Mon, 20 Mar 2023 05:44:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j24so262667wrd.0;
        Sun, 19 Mar 2023 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679291092;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRuUVGSib6JEyEmuvmz5jbeu7IJd8ilenJrI8qajkpk=;
        b=KMEDfqzXbj4j85AgI9jbSWqxqcmuw6A49DM47WxQ+I/3irsTDK05u3z3N+T0GkUh5Q
         WItfluFm5yB/xlzhqaagz+1W8j6OOABczFlEdm9S78BXigJY5kh5PlnVT5a44HKyfHRM
         Oumfx0mpQoDz/5i+cFFiMHDt/Ea/aYBzfqi+c8JBN+ounm7djVtexP/Km/ixGWSTtp3w
         ncUvf3T0WRSkUm/d6bjyk2fvCy0Qhr4REjnRuvcGTMi9HGvcAHj1V3kExYhokLC3ipLF
         UZWiCN4i814Qt1lesrVA8GBdJRCHtoqPYd78wAb/1RkRc5kOVqHbB88PwjmeeYiFeJFm
         TfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679291092;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRuUVGSib6JEyEmuvmz5jbeu7IJd8ilenJrI8qajkpk=;
        b=CoSKxaTxx7Ala+JBqOhUWMKhmK+WuOqdDlvmEcZr3wceb3uHU0AUWM+N3+saL0GfMA
         gYJ//WNu494vFBAdhW3XzhkQvPkbQROKaFyoraToJ9b5og2ZLziDdGUxl4RQ5u5zNx/k
         pkkXUc70c8WS5nta7AxNA+r716WJqRnfrFHAFIkKkpK0pwK3hMIckNsJaHt3+7ujeM/1
         lyC4ZutXMd9a9e5kqHHJARSHLcY6Bqhw/MAE9UTcgvnEfbZYwssEhP8ec0HqGMsaislM
         eh8mxHQen+7u+H/OfWtAjqRtWZIfp3lwIZ7G/U5EDXFE6MHy9960I3mJ7uP2yvAx6IyU
         1yBg==
X-Gm-Message-State: AO0yUKVhcmJQaQBnOcQrjgmPAPbpMOsQb9Vra50j7qwkxV/9CiEpw7Bn
	Q0BOpQVg3mwC5wtPmhOQ6cph6jy7oQw=
X-Google-Smtp-Source: AK7set++jZ9k6qrn3I/QaHRxiafuTR9DdvqnuPbYHZzt6IwW7cRcbAR4ZjNU4pFTjcz1c4KBUgRJTA==
X-Received: by 2002:a5d:4ecc:0:b0:2d0:c73d:ef2a with SMTP id s12-20020a5d4ecc000000b002d0c73def2amr11554417wrv.24.1679291091639;
        Sun, 19 Mar 2023 22:44:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d6d46000000b002c5598c14acsm8096854wri.6.2023.03.19.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 22:44:51 -0700 (PDT)
Date: Mon, 20 Mar 2023 08:44:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: fs/zonefs/file.c:441 zonefs_file_dio_append() error: uninitialized
 symbol 'size'.
Message-ID: <30200c4e-21e8-4454-a947-01d228f154a1@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 4008e2a0b01aba982356fd15b128a47bf11bd9c7 zonefs: Reorganize code
config: nios2-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191227.GL8Dprbi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303191227.GL8Dprbi-lkp@intel.com/

New smatch warnings:
fs/zonefs/file.c:441 zonefs_file_dio_append() error: uninitialized symbol 'size'.

vim +/size +441 fs/zonefs/file.c

4008e2a0b01aba Damien Le Moal 2022-11-25  378  static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
4008e2a0b01aba Damien Le Moal 2022-11-25  379  {
4008e2a0b01aba Damien Le Moal 2022-11-25  380  	struct inode *inode = file_inode(iocb->ki_filp);
4008e2a0b01aba Damien Le Moal 2022-11-25  381  	struct zonefs_inode_info *zi = ZONEFS_I(inode);
4008e2a0b01aba Damien Le Moal 2022-11-25  382  	struct block_device *bdev = inode->i_sb->s_bdev;
4008e2a0b01aba Damien Le Moal 2022-11-25  383  	unsigned int max = bdev_max_zone_append_sectors(bdev);
4008e2a0b01aba Damien Le Moal 2022-11-25  384  	struct bio *bio;
4008e2a0b01aba Damien Le Moal 2022-11-25  385  	ssize_t size;
4008e2a0b01aba Damien Le Moal 2022-11-25  386  	int nr_pages;
4008e2a0b01aba Damien Le Moal 2022-11-25  387  	ssize_t ret;
4008e2a0b01aba Damien Le Moal 2022-11-25  388  
4008e2a0b01aba Damien Le Moal 2022-11-25  389  	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
4008e2a0b01aba Damien Le Moal 2022-11-25  390  	iov_iter_truncate(from, max);
4008e2a0b01aba Damien Le Moal 2022-11-25  391  
4008e2a0b01aba Damien Le Moal 2022-11-25  392  	nr_pages = iov_iter_npages(from, BIO_MAX_VECS);
4008e2a0b01aba Damien Le Moal 2022-11-25  393  	if (!nr_pages)
4008e2a0b01aba Damien Le Moal 2022-11-25  394  		return 0;
4008e2a0b01aba Damien Le Moal 2022-11-25  395  
4008e2a0b01aba Damien Le Moal 2022-11-25  396  	bio = bio_alloc(bdev, nr_pages,
4008e2a0b01aba Damien Le Moal 2022-11-25  397  			REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE, GFP_NOFS);
4008e2a0b01aba Damien Le Moal 2022-11-25  398  	bio->bi_iter.bi_sector = zi->i_zsector;
4008e2a0b01aba Damien Le Moal 2022-11-25  399  	bio->bi_ioprio = iocb->ki_ioprio;
4008e2a0b01aba Damien Le Moal 2022-11-25  400  	if (iocb_is_dsync(iocb))
4008e2a0b01aba Damien Le Moal 2022-11-25  401  		bio->bi_opf |= REQ_FUA;
4008e2a0b01aba Damien Le Moal 2022-11-25  402  
4008e2a0b01aba Damien Le Moal 2022-11-25  403  	ret = bio_iov_iter_get_pages(bio, from);
4008e2a0b01aba Damien Le Moal 2022-11-25  404  	if (unlikely(ret))
4008e2a0b01aba Damien Le Moal 2022-11-25  405  		goto out_release;

This is a false positive because bio_iov_iter_get_pages() is returning
negatives on this error path.  Building the cross function database
would silence this warning.  Still it's not just Smatch which is going
to complain and GCC extensions are most likely going to initialize size
to zero anyway.

4008e2a0b01aba Damien Le Moal 2022-11-25  406  
4008e2a0b01aba Damien Le Moal 2022-11-25  407  	size = bio->bi_iter.bi_size;
4008e2a0b01aba Damien Le Moal 2022-11-25  408  	task_io_account_write(size);
4008e2a0b01aba Damien Le Moal 2022-11-25  409  
4008e2a0b01aba Damien Le Moal 2022-11-25  410  	if (iocb->ki_flags & IOCB_HIPRI)
4008e2a0b01aba Damien Le Moal 2022-11-25  411  		bio_set_polled(bio, iocb);
4008e2a0b01aba Damien Le Moal 2022-11-25  412  
4008e2a0b01aba Damien Le Moal 2022-11-25  413  	ret = submit_bio_wait(bio);
4008e2a0b01aba Damien Le Moal 2022-11-25  414  
4008e2a0b01aba Damien Le Moal 2022-11-25  415  	/*
4008e2a0b01aba Damien Le Moal 2022-11-25  416  	 * If the file zone was written underneath the file system, the zone
4008e2a0b01aba Damien Le Moal 2022-11-25  417  	 * write pointer may not be where we expect it to be, but the zone
4008e2a0b01aba Damien Le Moal 2022-11-25  418  	 * append write can still succeed. So check manually that we wrote where
4008e2a0b01aba Damien Le Moal 2022-11-25  419  	 * we intended to, that is, at zi->i_wpoffset.
4008e2a0b01aba Damien Le Moal 2022-11-25  420  	 */
4008e2a0b01aba Damien Le Moal 2022-11-25  421  	if (!ret) {
4008e2a0b01aba Damien Le Moal 2022-11-25  422  		sector_t wpsector =
4008e2a0b01aba Damien Le Moal 2022-11-25  423  			zi->i_zsector + (zi->i_wpoffset >> SECTOR_SHIFT);
4008e2a0b01aba Damien Le Moal 2022-11-25  424  
4008e2a0b01aba Damien Le Moal 2022-11-25  425  		if (bio->bi_iter.bi_sector != wpsector) {
4008e2a0b01aba Damien Le Moal 2022-11-25  426  			zonefs_warn(inode->i_sb,
4008e2a0b01aba Damien Le Moal 2022-11-25  427  				"Corrupted write pointer %llu for zone at %llu\n",
4008e2a0b01aba Damien Le Moal 2022-11-25  428  				wpsector, zi->i_zsector);
4008e2a0b01aba Damien Le Moal 2022-11-25  429  			ret = -EIO;
4008e2a0b01aba Damien Le Moal 2022-11-25  430  		}
4008e2a0b01aba Damien Le Moal 2022-11-25  431  	}
4008e2a0b01aba Damien Le Moal 2022-11-25  432  
4008e2a0b01aba Damien Le Moal 2022-11-25  433  	zonefs_file_write_dio_end_io(iocb, size, ret, 0);
4008e2a0b01aba Damien Le Moal 2022-11-25  434  	trace_zonefs_file_dio_append(inode, size, ret);
4008e2a0b01aba Damien Le Moal 2022-11-25  435  
4008e2a0b01aba Damien Le Moal 2022-11-25  436  out_release:
4008e2a0b01aba Damien Le Moal 2022-11-25  437  	bio_release_pages(bio, false);
4008e2a0b01aba Damien Le Moal 2022-11-25  438  	bio_put(bio);
4008e2a0b01aba Damien Le Moal 2022-11-25  439  
4008e2a0b01aba Damien Le Moal 2022-11-25  440  	if (ret >= 0) {
4008e2a0b01aba Damien Le Moal 2022-11-25 @441  		iocb->ki_pos += size;
4008e2a0b01aba Damien Le Moal 2022-11-25  442  		return size;
4008e2a0b01aba Damien Le Moal 2022-11-25  443  	}
4008e2a0b01aba Damien Le Moal 2022-11-25  444  
4008e2a0b01aba Damien Le Moal 2022-11-25  445  	return ret;
4008e2a0b01aba Damien Le Moal 2022-11-25  446  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

