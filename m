Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5865111AC
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMz2usgu"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77d89b4cb96so144784785a.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 00:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073037; x=1701677837; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGrGhYkkai0Q8++F4LYATS7bUbFXyc8wL2GaovSLfuc=;
        b=UMz2usguhbXkfQRdc03uK237koZHKFzr7XUZs/U9Ndon/2mCuUFS8MRiP/upnZ7TGf
         CHhPuJQUgIfT3Op6quEFCD3RK0uQQbFVRv8w9z5PcjVrC+le9HNxXzU9uMU/9UohvH+C
         HgUNe7YOoQbzvu0co8dAVlqCO+yzVFc8SqSnBkxaP5EnG2TbNVutu/LbhO5q051May4Z
         xCs1AyL76RDE75zi6uESu1x49yhFPmgXMkvhzLKgs3h2BFgtQKn1XNyMqRAXv1eRTspZ
         7+JCFw4FVBUc0+LA7KEKoqyill/ObXhygEbMkkvw+IEbB7TzjcvXFKX8358xN+XmYsz7
         qYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073037; x=1701677837;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGrGhYkkai0Q8++F4LYATS7bUbFXyc8wL2GaovSLfuc=;
        b=khv/WkeX5q7CPT/dFy0GvAaia4Ezh9Jc07K1Bhr46Wq4cBCsmCix6pNdkw2bVBPcmG
         DhQOdOsLFZVgDXfNbCKUb2ub0rZj8vvDXfOjfkl/p8M44UKLve7kqNcHYSdcCG1XJ2Dv
         CJvkeAAnH2Z40mHdDRwBmeu0B5Zd/s4HOCH63xEfAX2zoXQKfGQ4iRdYKZh7AxqiqOBD
         Go0t7tvvH6sw/3ii/IXW4Wh4ioTrVpCRLQ/0KMurOzkWQSXlYcMnIY5TSezaixGHzbI4
         1ecYa4FQO4iLaBPCxZrSHXtAwwHbvaB4rIuxuFXVW7stPdLDykOXorau+YVH4QRF5rSS
         Wjug==
X-Gm-Message-State: AOJu0YwnElcl7bdtvqph6NPXq7oSgFuFG60Di5m9xuth20DksLQh/zWC
	Iu59PiHXI1Jf4EVhx6rgflTHoFEBrB9IsJWS0nw=
X-Google-Smtp-Source: AGHT+IFMqtbFZDfd+980+2hVdYsHptObbyOPx1gVsoAkWwxdMsxk54zfkhfDX0XWtvfeGlXk1dPpEw==
X-Received: by 2002:a05:620a:4084:b0:772:63d9:6e69 with SMTP id f4-20020a05620a408400b0077263d96e69mr23242508qko.35.1701073036722;
        Mon, 27 Nov 2023 00:17:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i28-20020a05620a145c00b00774350813ccsm3508768qkl.118.2023.11.27.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:17:16 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Nov 2023 11:17:11 +0300
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 36/65] fs/iomap/buffered-io.c:2127
 iomap_rewrite_range() error: uninitialized symbol 'folio_end'.
Message-ID: <536a4c9b-cff8-45f3-bf2e-e2de378dec98@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f5b3c0ffa575a5035e6d607b616c05638ed48937
commit: cc4a639e3052fefb385f63a0db5dfe07db4e9d58 [36/65] iomap: add a iomap_rewrite_range helper
config: x86_64-randconfig-161-20231125 (https://download.01.org/0day-ci/archive/20231125/202311252130.sO3YytsF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311252130.sO3YytsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311252130.sO3YytsF-lkp@intel.com/

New smatch warnings:
fs/iomap/buffered-io.c:2127 iomap_rewrite_range() error: uninitialized symbol 'folio_end'.

vim +/folio_end +2127 fs/iomap/buffered-io.c

cc4a639e3052fe Christoph Hellwig 2023-11-24  2075  int
cc4a639e3052fe Christoph Hellwig 2023-11-24  2076  iomap_rewrite_range(struct address_space *mapping, loff_t pos, size_t len,
cc4a639e3052fe Christoph Hellwig 2023-11-24  2077  		struct iomap_writepage_ctx *wpc)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2078  {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2079  	struct inode *inode = mapping->host;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2080  	u64 end_pos = pos + len;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2081  	int error = 0;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2082  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2083  	inode_attach_wb(inode, NULL);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2084  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2085  	while (pos < end_pos) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2086  		struct folio *folio;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2087  		unsigned count = 0;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2088  		u64 folio_end;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2089  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2090  		folio = iomap_read_mapping_page(mapping, pos, end_pos);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2091  		if (IS_ERR(folio)) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2092  			error = PTR_ERR(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2093  			break;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2094  		}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2095  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2096  		folio_lock(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2097  		if (folio->mapping != mapping) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2098  			folio_unlock(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2099  			goto folio_put;

folio_end not initialize here.  error is zero.

cc4a639e3052fe Christoph Hellwig 2023-11-24  2100  		}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2101  		folio_end = folio_pos(folio) + folio_size(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2102  		len = min(folio_end, end_pos) - pos;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2103  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2104  		folio_wait_writeback(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2105  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2106  		/*
cc4a639e3052fe Christoph Hellwig 2023-11-24  2107  		 * If we're writing out the whole folio, clear the dirty bit.
cc4a639e3052fe Christoph Hellwig 2023-11-24  2108  		 */
cc4a639e3052fe Christoph Hellwig 2023-11-24  2109  		if (folio_test_dirty(folio) &&
cc4a639e3052fe Christoph Hellwig 2023-11-24  2110  		    folio_pos(folio) == pos && folio_end == end_pos)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2111  			folio_clear_dirty(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2112  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2113  		iomap_start_writeback(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2114  		error = iomap_writepage_map_blocks(wpc, NULL, inode, folio, pos,
cc4a639e3052fe Christoph Hellwig 2023-11-24  2115  				len, &count);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2116  		if (count)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2117  			wpc->nr_folios++;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2118  		if (!error) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2119  			iomap_clear_range_dirty(folio,
cc4a639e3052fe Christoph Hellwig 2023-11-24  2120  				offset_in_folio(folio, pos), len);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2121  		}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2122  		iomap_end_writeback(folio, count);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2123  folio_put:
cc4a639e3052fe Christoph Hellwig 2023-11-24  2124  		folio_put(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2125  		if (error)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2126  			break;
cc4a639e3052fe Christoph Hellwig 2023-11-24 @2127  		pos = folio_end;
                                                                      ^^^^^^^^^

cc4a639e3052fe Christoph Hellwig 2023-11-24  2128  	}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2129  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2130  	return iomap_submit_ioend(wpc, error);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2131  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

