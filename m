Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D86A2F8BE7
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Sep 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724363; cv=none; b=CqaNpBMoMaYNzH5Hh1wF4LWwMcZbEmTrEZdZOD4oNvj7vFW/LLsrpv8+wTN93pfFT8f1UR7AxYV1KsqGBPxw8Dw4Ud7/O8W7nUhYjv2PMcCDYh2dAhZtxBgdVWVSNlV48SXopia/50kelasbgkfIN0vacaN58Ip7/6SETuRNOdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724363; c=relaxed/simple;
	bh=gT3tTR3qsWus9ZSyF4v3Z0HwnM/oa7Ifwo6G1RkMay8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2MCuoyPptl3mCJbzAT9cpFkIvFCA/bkP14CxZfZ/1Y7D3uEe8/bmf50MihMn+5fSFgZmx6u5NXFnswD2iZ+jNYtS6eQgHcXJoHz/Z3ZRpX4CSG6oDDAgQ/Mgy97Szir9Av0OPQdTnykxPk3yDPSMHUevAQmTsctIBsnjH4cT+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UgoOGZid; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UgoOGZid"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso24914615e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Sep 2025 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756724358; x=1757329158; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5n3vmQjGgJJ0dEE8KAc/FHWJ12r5IOo6sAzWgxkYc4=;
        b=UgoOGZidc7dp912HyUQi9gHT7bWoLdaEld+OV+T3uJTOLbJu/3KqKVhxrxk5I5XU+E
         HtB/fj//F05a+yDCqt8xH2o8hslBPl0/l/7U6F19s20AWbE3sN3FHXHP9kEp7vXzNdES
         jv3hPzZDuyY3R31K7EBF1CykOBVUyWqS3ej1Nb4InRShKAUI4Wq+kabanjTchMqfj776
         8o9NKY6jGZoHunEH/KJTHPFwFG4+IExkI3E40O2fc6fARQeSEy1ApuNS/sgbFUGiEu+M
         0wvkrrjgd3WydRrVerQNdCHC7FQavrc1O7pcGjg2k2tFOpZ0NZzjrGJ4NBlQre8Isky5
         bb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724358; x=1757329158;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5n3vmQjGgJJ0dEE8KAc/FHWJ12r5IOo6sAzWgxkYc4=;
        b=uPGRvioUEIF8QnNzNxDdT4UbneOOaXSfI8OumOU+nF56TW2x0IROtthrKPw5E/PMX4
         F19M0VTWPrbEHAJ6IEtPBDJT/W7XeJx/si6RsDXfJ7hBJQwk4oz4W7HlAJCWkTNNOBw6
         5+Ik/Y9GaQFxvHXVn/aLGdvG8qBOm1fjtctYxK8T4H3kS2xWvaR1BCkarTpWIErcNG6W
         Wgv21aQveSevq/Tee7xpNui+kwZg4jlGYgOPE7DIubjnAxH04YCPv3k7w+1QlGHGVWlh
         bRUs3ZhCV31Jssk/ILiqcikpcEqB+p0oZHT0HQBvlx1c8uf8hjelswxIr+ejI3U+Z2tJ
         wl3w==
X-Gm-Message-State: AOJu0YzUp+OaoAk2oUwqk63fhnvN7DIXoZbdgZ8e9mW9vG3Iy5FMbdWl
	Qrojf/4M0mLJsz2aNfULQcm4fKU18aoI1rx/VJ3AcX1nQzuyMpLHE37O1udnPV+481DJapyCDUJ
	3sMDL
X-Gm-Gg: ASbGncuTPsr2pHLM9Uh+HqLUIUo5W9QoI3guIaJ84zoJmLCfPHimqt4uTk/7ncEZl0L
	iUtStY3FvChHlVNpObEJ+0ggbeVG/xfIN4OLZ1w1Chxqikr21QKhBfJ4dL/k5nTHV2QX5gUL8JV
	e4BxTHOQnHN5DA4TEuOohTWOGJlc7bs5pz9hOOtYLa3FsOzbdRQJpxClnWteeGXWDC0dZ1ARM+b
	JC+nVQ8MWqy4vjlHtZzHDXt0NJtdxc3E1t+Pl6n20sl04sZkxRl+HGB8nbjSDbhiidKXvnmex1m
	tEd0uxtRiqmX0C6JTfotr7So5x/YrOe0GrrpDaXW29ycZlyRJfBtECkozjYDas98ZX9PqZUU1O8
	D9YBYYd7wRFnk3nDU5BSaw8RFP/6vkx+z6kroYA==
X-Google-Smtp-Source: AGHT+IETGQoBfnZMuUxMVn0PqEmmxFurEgObDASPTLjnWpqquzv4mCadzm+2zMZBCyc4U6NQ8BQjTA==
X-Received: by 2002:a05:6000:1ace:b0:3d0:cc82:7a99 with SMTP id ffacd0b85a97d-3d1dd42ea4fmr5544924f8f.27.1756724358052;
        Mon, 01 Sep 2025 03:59:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d6cf485eb7sm3826937f8f.3.2025.09.01.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:59:17 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:59:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 41/56]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:735 __cut_mapping() warn:
 continue to end of do { ... } while(0); loop
Message-ID: <202508301321.c3GXwQnF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250901105913.YwPSH5nAkaUafQYkxVTwZh_GpI1yTR95-EXTFdE0niA@z>

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   451e6e58d3fc7e3c1eb9a6d5bfb5d5da4b088133
commit: e3440a4e2ef96292c91a870405399bfcc197e973 [41/56] iommupt: Add cut_mapping op
config: powerpc-randconfig-r072-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301321.c3GXwQnF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508301321.c3GXwQnF-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:735 __cut_mapping() warn: continue to end of do { ... } while(0); loop

vim +735 drivers/iommu/generic_pt/fmt/../iommu_pt.h

e3440a4e2ef962 Jason Gunthorpe 2025-04-03  711  static int __cut_mapping(struct pt_range *range, void *arg, unsigned int level,
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  712  			 struct pt_table_p *table)
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  713  {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  714  	struct pt_state pts = pt_init(range, level, table);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  715  	const struct pt_write_attrs *cut_attrs = arg;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  716  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  717  	do {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  718  		switch (pt_load_single_entry(&pts)) {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  719  		case PT_ENTRY_EMPTY:
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  720  			return -ENOENT;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  721  		case PT_ENTRY_TABLE:
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  722  			return pt_descend(&pts, arg, __cut_mapping);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  723  		case PT_ENTRY_OA: {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  724  			int ret;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  725  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  726  			/* This entry's OA starts at the cut point, all done */
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  727  			if (!log2_mod(range->va, pt_entry_oa_lg2sz(&pts)))
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  728  				return 0;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  729  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  730  			/* This is a contiguous entry, split it down */
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  731  			if (pt_entry_num_contig_lg2(&pts) != ilog2(1)) {
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  732  				if (!pts_feature(&pts, PT_FEAT_OA_SIZE_CHANGE))
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  733  					return -EOPNOTSUPP;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  734  				replace_contiguous_entry(&pts);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03 @735  				continue;

This continue would be more readable as a return -ENOENT;

e3440a4e2ef962 Jason Gunthorpe 2025-04-03  736  			}
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  737  
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  738  			/*
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  739  			 * Need to replace an OA with a table. The new table
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  740  			 * will map the same OA as the table item, just with
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  741  			 * smaller granularity.
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  742  			 */
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  743  			ret = replace_cut_table(&pts, cut_attrs);
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  744  			if (ret == -EAGAIN)
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  745  				continue;

Yeah.  continue wasn't intended...  

e3440a4e2ef962 Jason Gunthorpe 2025-04-03  746  			return ret;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  747  		}
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  748  		}
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  749  	} while (false);
                                                          ^^^^^^^^^^^^^^

e3440a4e2ef962 Jason Gunthorpe 2025-04-03  750  	return -ENOENT;
e3440a4e2ef962 Jason Gunthorpe 2025-04-03  751  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

