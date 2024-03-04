Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7615AE0
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Mar 2024 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539620; cv=none; b=rHY4Ewnfl7lj6c3PUL7mQl1xb/KfiuI2TPLjUmwMIX+lx5a8uz/66C1tYP87xm5ayJZBY4T4DkRJs/7Dg2qCrBFU4cTsL77n2pAKQvAv+oardH1RtfXJsUiuQq749NYXibZShNSYAHcu8WxeF/lAKvmOZbI46/6miVk2AmkWRQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539620; c=relaxed/simple;
	bh=G+DDMYDqD/ylFNBdieJOVMLXW4iwR9B72Wx9rNP8mUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjJRx3UNoLjnuf2vGrfckvDNeH62Jjj4nhf44vsrvB9kYi7Kt8bbB/d7ngUXrqc/QA9AeQHRmeRJWIVRbqG8EfxzG1GYofJ+t5+v9cUtz5FotK2AXZfve3eUxpQitJ9scrp6VnOkQKw7MKbKG1IXST0xcoOJzX+mgxUoP5M/nSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SEC9AXv2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SEC9AXv2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d36736d4eso2559092f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 04 Mar 2024 00:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709539615; x=1710144415; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxQxxbHBIBwqHFputJh+BUkhbBlBnCVQDh3dlikacP0=;
        b=SEC9AXv2LPX3Nz+526FrKX8CVubUJP4iMZ5PoZXFM8rZjvB/0C6ReicY37rqnxTezl
         Mgk6FGi0E956cNdAgSm/vhLkZqa+65Pe84PZcr/iqpfsQ7UvzKm48/6w6oEEKhNSGmwC
         RZeLBFxZFcoI4Unh1hqBIYZ0iacUGy6tLqoHZWT6uvrpcAm+rddDdGAPD0cLJKAxFlmQ
         A9dkoKOMK32FapLWSesnV/f8swdLB869n5LGALWB0pjepgGT0KHDGDCA35omVM+/UhC/
         jhBNCdpStxaQXhgTAKjv3vyzJ0YJqtS44PVI4kPVetKFBcPRKEAQQWie1UoCz5lsVwbb
         xbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539615; x=1710144415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxQxxbHBIBwqHFputJh+BUkhbBlBnCVQDh3dlikacP0=;
        b=WWFPfv6Sn6Ouk49LUKT23AVuMjV2EWeueuUGMHg91SDppZOzeS4K+fx0OAhz2uESUl
         ytmwS7EbImEPVHhJWhswxmMXu8QuaXTmTll1h1BySNsFqwiOY+HyJBI+Uq/AEuzibMnu
         JnQYBDJjpKmmfUbh2xgoYE4sniqIq3I39VriaJ4pRckyYFO1bynbiv8zkKGa9r090yo8
         jsBcZGI+ynZzbpnknh7jguAqXVrdnmgrt429/7rPKIQUUDYIdThMyAKO2aMXR7bNiibt
         bmbS2DvCeIuIyz58gPM1VUfBKwPuOwBSaemZ8TAc01nSZcLVsOnLfyF63zxZOEWIYpTc
         Nl3Q==
X-Gm-Message-State: AOJu0YwHksiZ2ZNU/lJecpLABO2bG1zOosWnnKH2sbxbyqm256Ih+Ydl
	xxCOnxKTwq52CFGOKxrtQVYoVhM68pWqA2Ehp9iBeTgvg6ZHXub5Qs3T41drHMRtetPowe3+bnS
	E
X-Google-Smtp-Source: AGHT+IF2IIoUiD8eKPlLBFeDloz09l/vFASyvUiAi0VQjxLU4GsmrROnufev0rUurMs9vPtKs5cK/g==
X-Received: by 2002:a5d:58e8:0:b0:33d:6ede:249a with SMTP id f8-20020a5d58e8000000b0033d6ede249amr5869447wrd.69.1709539615503;
        Mon, 04 Mar 2024 00:06:55 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j12-20020adfea4c000000b0033e11bd9febsm11022855wrn.90.2024.03.04.00.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:06:55 -0800 (PST)
Date: Mon, 4 Mar 2024 11:06:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [linux-next:master 7199/11394] drivers/gpu/drm/xe/xe_mmio.c:109
 xe_resize_vram_bar() warn: impossible condition '(root_res->start >
 4294967296) => (0-u32max > 4294967296)'
Message-ID: <00421b32-9d4c-4496-93bf-baa3b75e54cc@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: 237412e45390805e14a6936fb998d756c4eac9d8 [7199/11394] drm/xe: Enable 32bits build
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240304/202403040611.dybt4YMT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403040611.dybt4YMT-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_mmio.c:284 xe_mmio_probe_vram() error: '%pa' expects argument of type 'phys_addr_t*', argument 3 has type 'ullong*'

Old smatch warnings:
drivers/gpu/drm/xe/xe_mmio.c:295 xe_mmio_probe_vram() error: '%pa' expects argument of type 'phys_addr_t*', argument 4 has type 'ullong*'

vim +109 drivers/gpu/drm/xe/xe_mmio.c

dd08ebf6c3525a Matthew Brost              2023-03-30  222  int xe_mmio_probe_vram(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost              2023-03-30  223  {
ebd288cba7db70 Matt Roper                 2023-06-01  224  	struct xe_tile *tile;
2d830096e41403 Michael J. Ruhl            2023-05-25  225  	resource_size_t io_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  226  	u64 available_size = 0;
2d830096e41403 Michael J. Ruhl            2023-05-25  227  	u64 total_size = 0;
61f288a8972253 Michael J. Ruhl            2023-05-25  228  	u64 tile_offset;
61f288a8972253 Michael J. Ruhl            2023-05-25  229  	u64 tile_size;
61f288a8972253 Michael J. Ruhl            2023-05-25  230  	u64 vram_size;
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  231  	int err;
61f288a8972253 Michael J. Ruhl            2023-05-25  232  	u8 id;
dd08ebf6c3525a Matthew Brost              2023-03-30  233  
7f075300a31829 Michael J. Ruhl            2023-05-25  234  	if (!IS_DGFX(xe))
dd08ebf6c3525a Matthew Brost              2023-03-30  235  		return 0;
dd08ebf6c3525a Matthew Brost              2023-03-30  236  
ebd288cba7db70 Matt Roper                 2023-06-01  237  	/* Get the size of the root tile's vram for later accessibility comparison */
ebd288cba7db70 Matt Roper                 2023-06-01  238  	tile = xe_device_get_root_tile(xe);
ebd288cba7db70 Matt Roper                 2023-06-01  239  	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
dd08ebf6c3525a Matthew Brost              2023-03-30  240  	if (err)
dd08ebf6c3525a Matthew Brost              2023-03-30  241  		return err;
dd08ebf6c3525a Matthew Brost              2023-03-30  242  
7f075300a31829 Michael J. Ruhl            2023-05-25  243  	err = xe_determine_lmem_bar_size(xe);
7f075300a31829 Michael J. Ruhl            2023-05-25  244  	if (err)
7f075300a31829 Michael J. Ruhl            2023-05-25  245  		return err;
dd08ebf6c3525a Matthew Brost              2023-03-30  246  
7f075300a31829 Michael J. Ruhl            2023-05-25  247  	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
7f075300a31829 Michael J. Ruhl            2023-05-25  248  		 &xe->mem.vram.io_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  249  
2492f4544e6f81 Matthew Auld               2023-03-14  250  	io_size = xe->mem.vram.io_size;
dd08ebf6c3525a Matthew Brost              2023-03-30  251  
ebd288cba7db70 Matt Roper                 2023-06-01  252  	/* tile specific ranges */
ebd288cba7db70 Matt Roper                 2023-06-01  253  	for_each_tile(tile, xe, id) {
ebd288cba7db70 Matt Roper                 2023-06-01  254  		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
2d830096e41403 Michael J. Ruhl            2023-05-25  255  		if (err)
2d830096e41403 Michael J. Ruhl            2023-05-25  256  			return err;
2492f4544e6f81 Matthew Auld               2023-03-14  257  
9641df81977266 Tejas Upadhyay             2023-06-28  258  		tile->mem.vram.actual_physical_size = tile_size;
ebd288cba7db70 Matt Roper                 2023-06-01  259  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
ebd288cba7db70 Matt Roper                 2023-06-01  260  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
2492f4544e6f81 Matthew Auld               2023-03-14  261  
ebd288cba7db70 Matt Roper                 2023-06-01  262  		if (!tile->mem.vram.io_size) {
2492f4544e6f81 Matthew Auld               2023-03-14  263  			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
2492f4544e6f81 Matthew Auld               2023-03-14  264  			return -ENODEV;
2492f4544e6f81 Matthew Auld               2023-03-14  265  		}
dd08ebf6c3525a Matthew Brost              2023-03-30  266  
0887a2e7ab6205 Oak Zeng                   2023-07-11  267  		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
c00ce7f2231700 Matthew Auld               2023-03-31  268  		tile->mem.vram.usable_size = vram_size;
ebd288cba7db70 Matt Roper                 2023-06-01  269  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
2d830096e41403 Michael J. Ruhl            2023-05-25  270  
e4b2893c17048a Tejas Upadhyay             2023-06-28  271  		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
286089ce692907 Oak Zeng                   2023-07-14  272  			drm_info(&xe->drm, "Small BAR device\n");
286089ce692907 Oak Zeng                   2023-07-14  273  		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
286089ce692907 Oak Zeng                   2023-07-14  274  			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
286089ce692907 Oak Zeng                   2023-07-14  275  		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
6d8d038364d8ec Lucas De Marchi            2024-01-18  276  			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
6d8d038364d8ec Lucas De Marchi            2024-01-18  277  			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
2d830096e41403 Michael J. Ruhl            2023-05-25  278  
2d830096e41403 Michael J. Ruhl            2023-05-25  279  		/* calculate total size using tile size to get the correct HW sizing */
2d830096e41403 Michael J. Ruhl            2023-05-25  280  		total_size += tile_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  281  		available_size += vram_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  282  
2d830096e41403 Michael J. Ruhl            2023-05-25  283  		if (total_size > xe->mem.vram.io_size) {
c00ce7f2231700 Matthew Auld               2023-03-31 @284  			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
2d830096e41403 Michael J. Ruhl            2023-05-25  285  				 &total_size, &xe->mem.vram.io_size);

This is a u32 build.  I think this code works on little endian systems.
We can treat pointer to u64 as holding a u32 and it still works.  But
this is going to print hex which is less readable to most people than
decimal sizes.

Better to just do:
	drm_info(&xe->drm, "VRAM: %llu is larger than resource %llu\n",
		 (u64)total_size, (u64)xe->mem.vram.io_size);

Or we could print 0xllx if we really want hex.

dd08ebf6c3525a Matthew Brost              2023-03-30  286  		}
dd08ebf6c3525a Matthew Brost              2023-03-30  287  
2d830096e41403 Michael J. Ruhl            2023-05-25  288  		io_size -= min_t(u64, tile_size, io_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  289  	}
2d830096e41403 Michael J. Ruhl            2023-05-25  290  
0887a2e7ab6205 Oak Zeng                   2023-07-11  291  	xe->mem.vram.actual_physical_size = total_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  292  
2d830096e41403 Michael J. Ruhl            2023-05-25  293  	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
0887a2e7ab6205 Oak Zeng                   2023-07-11  294  		 &xe->mem.vram.actual_physical_size);
2d830096e41403 Michael J. Ruhl            2023-05-25  295  	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
2d830096e41403 Michael J. Ruhl            2023-05-25  296  		 &available_size);

Same for these prints.

2d830096e41403 Michael J. Ruhl            2023-05-25  297  
dd08ebf6c3525a Matthew Brost              2023-03-30  298  	return 0;
dd08ebf6c3525a Matthew Brost              2023-03-30  299  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

