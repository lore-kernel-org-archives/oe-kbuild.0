Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8FE318146
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762360848; cv=none; b=hZf2NnsKtwI4kYz0NpLyGSUVnDFZKtqd0ESvLfzI1t5r17c5CmP8VwZaj3ePboApNY/vP4IWHXZV623E5oYk06nlH5GduMEiQpUFHsdLPpnHUxoY0cz19d0E2Mj0JQJ9cn+0m+Km3uw7Vu8t4ySj+bw6sIrVxB/GuCAyV/HdDfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762360848; c=relaxed/simple;
	bh=/QtIhY0RyPwpTOIWJgU3XjTVedAmfM12RGMPuETIZ3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVEsXoxLtoJL8RR9mCSO34wlcYvpK/j6NC2DZLs/sTdi/kLOz/DZjIL4kJGRUkRDS5WzsoFeKffscpuqkYDCOEJSEbgUriG4hR2+OYFgrd5gowe7ORmrHbr0oj4EOM/tsYY3ValWSd7r7rmK1XezTA8vlOtcSejrBv1FNdZ7sEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7Y2f1IG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7Y2f1IG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so5823683a12.1
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Nov 2025 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762360845; x=1762965645; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuMDV+84ZZ6piMhAeokHsXIjSjo2WQ5PW/ZuTZcRL5M=;
        b=b7Y2f1IGO/QL8qUKJPVipMAc8D3RIsjdZFxKI8XCBvJV57obq1dOCHAIoXlD9aBxyK
         28d8UAH9uR2omUxP9JxHiok9UvqnunKqthpJE/VSqTHu6At8YmsFiZonXO09f+Fmeb7T
         V0ypzKJHkY9AOXCdSik5Qg70Z5LwyEyPNqs5UqcqufN5BukyF33k1WMEJLA1JDIqJdzG
         gH04q09CmOVwnqlCW4eVX9KQAWpaOup+lCETRzkh9JRJMJtoAft7HdCdLYBtCfqV+0eD
         xe70XkaVsJop9ULqWGFHKXkhNbMGcDwROWVEiRvzbrxmrOABCCCfJekZl7k5jL7OZBLh
         Im7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360845; x=1762965645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuMDV+84ZZ6piMhAeokHsXIjSjo2WQ5PW/ZuTZcRL5M=;
        b=rACtImTNYcAhp7VGOyAUiGezk2Rp8I+aaGPCWF9BDjiBzWq4cFTqVJQop9R5+jtzKm
         Dr/q+5ym1LITSbRCLNCRxT/+xULzXWFxVwWutgbTm58igolx8qweiDzi0hjPZs4RB1p6
         1x3LcyvStu5bedmFqatyzA4mq1smYYCdQ5Jl0upvzfmtVhLsy2V2qSqpyFuvZ2glzNAc
         gcNO5z4+MbF5o7GR+AsmGGCGZ+JetZSeO/Qf67Vt4h09WSmtrhMjO2fbgtXUaqhe1ymi
         oJ9rqGKBD+EIkkTz423Uy82Zm9P5C9pY9Gi1O9lW5IRc6Fr2ZPMAZBl25FQ1mLa6Q7Z1
         2Thg==
X-Gm-Message-State: AOJu0Yy/Fhma6pT0R3BqyyRep8HtJj3s14zCgJHiyQ2PcThn8GybY5CA
	lpknuDFdTQaoRvcbvxbYx+MGyyvjUxg3xWlE6XkfYCNhTcDO74TatFlJeZsRMr9MlxU0HhvQUe6
	hjjUD
X-Gm-Gg: ASbGncvTpYTtfhXfif6IOqhEk79+/jJ1QtY+eVEdrhFRGZkiU7oVYzUMKDZ1B2ecckl
	QGwKGFtvK+U0kaT1GoupkBB4qwI6xviNEvZ/1AjtnUwVlieRx7tDzoNoZrbOFW9/eQrKhSkGwbO
	ZyDPb612nXszOWPlyljO0uw8Dcz2lqWAZ8oPGe3jaMe9dNmADuTq9xGScPT6E/8cZAGO36c/xgb
	HTqoUHDoMMhqMz+rykINkDgTZGY9efAoy70IkHKyERv+IrIkLg0HaYLKvCIZGjbArCi8Uv4wsM0
	exKdOHPNjBGKYMMw14XMfHTZJiPPuwOu36wUzLhWaXJNAauPEqNzijLgW+ng82Ff3vq+T9cjEvN
	3mV3swUHhhZa7J2R4R0D57OWoWSKmpla86z4skos6wAkNfnAJ1kXUA7XWRo4e2A0bwvvA7hP215
	TQbr0OlW//N2FA
X-Google-Smtp-Source: AGHT+IFmOZOd1gewI5j8wSbekLr13er9/4QeW2OsdbOuAOa8Ceua2J0SXb1RwjpGiJ4QCK0ry08oOg==
X-Received: by 2002:a05:6402:4397:b0:640:b2a5:e7e with SMTP id 4fb4d7f45d1cf-64105a5d39bmr3163641a12.31.1762360844457;
        Wed, 05 Nov 2025 08:40:44 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm5294610a12.15.2025.11.05.08.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:40:44 -0800 (PST)
Date: Wed, 5 Nov 2025 19:40:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 5952/6507] fs/btrfs/bio.c:740
 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see
 line 665)
Message-ID: <f75f6edb-d9dc-49f2-a626-af74ef39ded5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
commit: b61fb56b832da658b61f93b6fe0daa5663baef81 [5952/6507] btrfs: remove btrfs_bio::fs_info by extracting it from btrfs_bio::inode
config: um-randconfig-r073-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052053.zZZ5GjNx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511052053.zZZ5GjNx-lkp@intel.com/

smatch warnings:
fs/btrfs/bio.c:740 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see line 665)

vim +/inode +740 fs/btrfs/bio.c

ae42a154ca8972 Christoph Hellwig  2023-03-07  662  static bool btrfs_submit_chunk(struct btrfs_bio *bbio, int mirror_num)
103c19723c80bf Christoph Hellwig  2022-11-15  663  {
d5e4377d505189 Christoph Hellwig  2023-01-21  664  	struct btrfs_inode *inode = bbio->inode;
b61fb56b832da6 Qu Wenruo          2025-10-29 @665  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
ae42a154ca8972 Christoph Hellwig  2023-03-07  666  	struct bio *bio = &bbio->bio;
adbe7e388e4239 Anand Jain         2023-04-15  667  	u64 logical = bio->bi_iter.bi_sector << SECTOR_SHIFT;
103c19723c80bf Christoph Hellwig  2022-11-15  668  	u64 length = bio->bi_iter.bi_size;
103c19723c80bf Christoph Hellwig  2022-11-15  669  	u64 map_length = length;
921603c76246a7 Christoph Hellwig  2022-12-12  670  	bool use_append = btrfs_use_zone_append(bbio);
103c19723c80bf Christoph Hellwig  2022-11-15  671  	struct btrfs_io_context *bioc = NULL;
103c19723c80bf Christoph Hellwig  2022-11-15  672  	struct btrfs_io_stripe smap;
beaa7cdb6a1fef David Sterba       2025-04-23  673  	blk_status_t status;
9c0b0807ece11e David Sterba       2025-04-23  674  	int ret;
103c19723c80bf Christoph Hellwig  2022-11-15  675  
b61fb56b832da6 Qu Wenruo          2025-10-29  676  	if (bbio->is_scrub || btrfs_is_data_reloc_root(inode->root))

Unchecked dereference

f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  677  		smap.rst_search_commit_root = true;
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  678  	else
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  679  		smap.rst_search_commit_root = false;
9acaa64187f9b4 Johannes Thumshirn 2023-09-14  680  
103c19723c80bf Christoph Hellwig  2022-11-15  681  	btrfs_bio_counter_inc_blocked(fs_info);
9c0b0807ece11e David Sterba       2025-04-23  682  	ret = btrfs_map_block(fs_info, btrfs_op(bio), logical, &map_length,
9fb2acc2fe07f1 Qu Wenruo          2023-09-17  683  			      &bioc, &smap, &mirror_num);
9c0b0807ece11e David Sterba       2025-04-23  684  	if (ret) {
9c0b0807ece11e David Sterba       2025-04-23  685  		status = errno_to_blk_status(ret);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  686  		btrfs_bio_counter_dec(fs_info);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  687  		goto end_bbio;
103c19723c80bf Christoph Hellwig  2022-11-15  688  	}
103c19723c80bf Christoph Hellwig  2022-11-15  689  
852eee62d31abd Christoph Hellwig  2023-01-21  690  	map_length = min(map_length, length);
d5e4377d505189 Christoph Hellwig  2023-01-21  691  	if (use_append)
b35243a447b9fe Christoph Hellwig  2024-08-26  692  		map_length = btrfs_append_map_length(bbio, map_length);
d5e4377d505189 Christoph Hellwig  2023-01-21  693  
103c19723c80bf Christoph Hellwig  2022-11-15  694  	if (map_length < length) {
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  695  		struct btrfs_bio *split;
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  696  
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  697  		split = btrfs_split_bio(fs_info, bbio, map_length);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  698  		if (IS_ERR(split)) {
beaa7cdb6a1fef David Sterba       2025-04-23  699  			status = errno_to_blk_status(PTR_ERR(split));
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  700  			btrfs_bio_counter_dec(fs_info);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  701  			goto end_bbio;
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  702  		}
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  703  		bbio = split;
2cef0c79bb81d8 Christoph Hellwig  2023-03-07  704  		bio = &bbio->bio;
103c19723c80bf Christoph Hellwig  2022-11-15  705  	}
103c19723c80bf Christoph Hellwig  2022-11-15  706  
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  707  	/*
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  708  	 * Save the iter for the end_io handler and preload the checksums for
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  709  	 * data reads.
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  710  	 */
fbe960877b6f43 Christoph Hellwig  2023-05-31  711  	if (bio_op(bio) == REQ_OP_READ && is_data_bbio(bbio)) {
0d3acb25e70d5f Christoph Hellwig  2023-01-21  712  		bbio->saved_iter = bio->bi_iter;
9c0b0807ece11e David Sterba       2025-04-23  713  		ret = btrfs_lookup_bio_sums(bbio);
9c0b0807ece11e David Sterba       2025-04-23  714  		status = errno_to_blk_status(ret);
beaa7cdb6a1fef David Sterba       2025-04-23  715  		if (status)
10d9d8c3512f16 Qu Wenruo          2024-08-17  716  			goto fail;
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  717  	}
7276aa7d38255b Christoph Hellwig  2023-01-21  718  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  719  	if (btrfs_op(bio) == BTRFS_MAP_WRITE) {
d5e4377d505189 Christoph Hellwig  2023-01-21  720  		if (use_append) {
d5e4377d505189 Christoph Hellwig  2023-01-21  721  			bio->bi_opf &= ~REQ_OP_WRITE;
d5e4377d505189 Christoph Hellwig  2023-01-21  722  			bio->bi_opf |= REQ_OP_ZONE_APPEND;
69ccf3f4244abc Christoph Hellwig  2023-01-21  723  		}
69ccf3f4244abc Christoph Hellwig  2023-01-21  724  
9c48bcec47c8dd Johannes Thumshirn 2024-12-16  725  		if (is_data_bbio(bbio) && bioc && bioc->use_rst) {
02c372e1f016e5 Johannes Thumshirn 2023-09-14  726  			/*
02c372e1f016e5 Johannes Thumshirn 2023-09-14  727  			 * No locking for the list update, as we only add to
02c372e1f016e5 Johannes Thumshirn 2023-09-14  728  			 * the list in the I/O submission path, and list
02c372e1f016e5 Johannes Thumshirn 2023-09-14  729  			 * iteration only happens in the completion path, which
02c372e1f016e5 Johannes Thumshirn 2023-09-14  730  			 * can't happen until after the last submission.
02c372e1f016e5 Johannes Thumshirn 2023-09-14  731  			 */
02c372e1f016e5 Johannes Thumshirn 2023-09-14  732  			btrfs_get_bioc(bioc);
02c372e1f016e5 Johannes Thumshirn 2023-09-14  733  			list_add_tail(&bioc->rst_ordered_entry, &bbio->ordered->bioc_list);
02c372e1f016e5 Johannes Thumshirn 2023-09-14  734  		}
02c372e1f016e5 Johannes Thumshirn 2023-09-14  735  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  736  		/*
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  737  		 * Csum items for reloc roots have already been cloned at this
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  738  		 * point, so they are handled as part of the no-checksum case.
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  739  		 */
4317ff0056bedf Qu Wenruo          2023-03-23 @740  		if (inode && !(inode->flags & BTRFS_INODE_NODATASUM) &&
                                                                    ^^^^^
Checked too late

169aaaf2e0be61 Qu Wenruo          2024-06-14  741  		    !test_bit(BTRFS_FS_STATE_NO_DATA_CSUMS, &fs_info->fs_state) &&
d5e4377d505189 Christoph Hellwig  2023-01-21  742  		    !btrfs_is_data_reloc_root(inode->root)) {
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  743  			if (should_async_write(bbio) &&
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  744  			    btrfs_wq_submit_bio(bbio, bioc, &smap, mirror_num))
852eee62d31abd Christoph Hellwig  2023-01-21  745  				goto done;
103c19723c80bf Christoph Hellwig  2022-11-15  746  
9c0b0807ece11e David Sterba       2025-04-23  747  			ret = btrfs_bio_csum(bbio);
9c0b0807ece11e David Sterba       2025-04-23  748  			status = errno_to_blk_status(ret);
beaa7cdb6a1fef David Sterba       2025-04-23  749  			if (status)
10d9d8c3512f16 Qu Wenruo          2024-08-17  750  				goto fail;
cebae292e0c32a Johannes Thumshirn 2024-06-07  751  		} else if (use_append ||
cebae292e0c32a Johannes Thumshirn 2024-06-07  752  			   (btrfs_is_zoned(fs_info) && inode &&
cebae292e0c32a Johannes Thumshirn 2024-06-07  753  			    inode->flags & BTRFS_INODE_NODATASUM)) {
853b5727c93dae David Sterba       2025-04-23  754  			ret = btrfs_alloc_dummy_sum(bbio);
853b5727c93dae David Sterba       2025-04-23  755  			status = errno_to_blk_status(ret);
beaa7cdb6a1fef David Sterba       2025-04-23  756  			if (status)
10d9d8c3512f16 Qu Wenruo          2024-08-17  757  				goto fail;
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  758  		}
103c19723c80bf Christoph Hellwig  2022-11-15  759  	}
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  760  
22b4ef50dc1d11 David Sterba       2024-08-27  761  	btrfs_submit_bio(bio, bioc, &smap, mirror_num);
852eee62d31abd Christoph Hellwig  2023-01-21  762  done:
852eee62d31abd Christoph Hellwig  2023-01-21  763  	return map_length == length;
9ba0004bd95e05 Christoph Hellwig  2023-01-21  764  
9ba0004bd95e05 Christoph Hellwig  2023-01-21  765  fail:
9ba0004bd95e05 Christoph Hellwig  2023-01-21  766  	btrfs_bio_counter_dec(fs_info);
10d9d8c3512f16 Qu Wenruo          2024-08-17  767  	/*
10d9d8c3512f16 Qu Wenruo          2024-08-17  768  	 * We have split the original bbio, now we have to end both the current
10d9d8c3512f16 Qu Wenruo          2024-08-17  769  	 * @bbio and remaining one, as the remaining one will never be submitted.
10d9d8c3512f16 Qu Wenruo          2024-08-17  770  	 */
10d9d8c3512f16 Qu Wenruo          2024-08-17  771  	if (map_length < length) {
10d9d8c3512f16 Qu Wenruo          2024-08-17  772  		struct btrfs_bio *remaining = bbio->private;
10d9d8c3512f16 Qu Wenruo          2024-08-17  773  
10d9d8c3512f16 Qu Wenruo          2024-08-17  774  		ASSERT(bbio->bio.bi_pool == &btrfs_clone_bioset);
10d9d8c3512f16 Qu Wenruo          2024-08-17  775  		ASSERT(remaining);
10d9d8c3512f16 Qu Wenruo          2024-08-17  776  
beaa7cdb6a1fef David Sterba       2025-04-23  777  		btrfs_bio_end_io(remaining, status);
10d9d8c3512f16 Qu Wenruo          2024-08-17  778  	}
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  779  end_bbio:
beaa7cdb6a1fef David Sterba       2025-04-23  780  	btrfs_bio_end_io(bbio, status);
852eee62d31abd Christoph Hellwig  2023-01-21  781  	/* Do not submit another chunk */
852eee62d31abd Christoph Hellwig  2023-01-21  782  	return true;
852eee62d31abd Christoph Hellwig  2023-01-21  783  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

