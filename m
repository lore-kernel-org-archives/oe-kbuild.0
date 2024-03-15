Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E863D396
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Mar 2024 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710516648; cv=none; b=XD+ZDP5PWG7guPJa1y9kHcMrvCbzrw3wYRy0K/ja36z2JAAA2iDa/ScYdixEjW1GZWhoetO2wvR1FNq2VmJJXQ/1Rf8SFpsSLY/ve/2BcqVE42sURw0fW1O0enVD4y+AF/RZOGNx2aYOSIjE3NEqDPBsZUAF5Li6uL5Q2YkNdYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710516648; c=relaxed/simple;
	bh=/aJ4/mSQH4eyQXv/ADbXDKWWNtCt/kUVQRKMSihPbvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSeOiGSxPoH9zVMuhNZZsJZ0/tvf8RAt0xZF4Nvuxflp37rL4eNTUh6yANznHgd60sS269+t3QG/rEHCIm6pI32iP6+3HFvRzXXexbsEDnGrfZcYP8ISz20fAHEbzh/pL/GGOJ+mewVVi0pwWIqtVFFcw2ijA+Aemz4o29la4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AdTj3cdK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdTj3cdK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-413fff1dacfso5854305e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 15 Mar 2024 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710516644; x=1711121444; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYFnc1hM0XJu3PhzImR/Qsw6QOHf5BtWM4FtMChzf7c=;
        b=AdTj3cdKDuEuGkJXK+m1FjIcqD2/gNEICwZp783fKjt8FFkYn1gI0ac4bhyQM75ozS
         VCpnmAMCsiJ+m7idptkoaVPl8rMnUt6svR8/nOoWVgbQfpGYh3l+l3zOdBUbbyYXJN55
         a1lhzfkMSnJyLf5WRy3AmSTvunEgrcXn/o+qgS26gYFXOgygvVePHTc6mGZKWma/uDi9
         x+9P+EMIH0bTfjbmCBEOXvb6ijSLwYs65qAgqlcu6SmFi+ZSqPDj+q3bBx/+GQ4q35V4
         iF3JK4/hVvdSEJyB32EOXKXRwj90ky8F4zK8qWpl8kBbf15l6gJDTXFN4xxbFt+zXckp
         i5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710516644; x=1711121444;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYFnc1hM0XJu3PhzImR/Qsw6QOHf5BtWM4FtMChzf7c=;
        b=rSxDuAv279ia7xVOVoZ7YwBOqrXC8uRhnIun6fh13cZH6ul4fH3WojvBTdy8WU98Je
         5FTs7OZNuIzuVsINOlDU6UXD9jjc36Fd8mAGC0cVuGzAfGjHlIeqPTDlNUfOozkmFW7j
         XfGc9YZoAR3R2xN28fPCPGOgvL0YzCuaqXbzXMrDIPTE8uKxB4S1H3n2xS7pemR9/+it
         TqggtEnM5dIOW1OTOL54ATzrcOJ1GXLN3YDNWa6IfGbvJEU1lNfyGF2gxyPcNPNPY/jR
         Nrdy4ugLf+v78CppYVyHSr6i0Nrqg/3zhIuKke2btPZSQtH/PWz9OXaNX3fBQxLcYDCW
         akyg==
X-Gm-Message-State: AOJu0Yxf9wcKH5cKtCctyMVOGjvbm4MVbfhoRrmhPl9iYrb7VU/O5BSB
	0UAkdvZTcQNlni6EKadnFuFQk+FRzA8lgyLcjvUtNVltOPjM6tnZcyaBiT6HcBi2YJhWqAu1CgA
	7
X-Google-Smtp-Source: AGHT+IERUqoqmlegoZ+ggeJ6cHV4jm+2H2WG+MWSEQEIzUQHgT4ILHzlUHyfxp5FkLD2pmJTfbQvnQ==
X-Received: by 2002:a05:600c:502b:b0:413:f8d5:27e with SMTP id n43-20020a05600c502b00b00413f8d5027emr2539576wmr.5.1710516643946;
        Fri, 15 Mar 2024 08:30:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a3-20020a05600c348300b00413e6c56faasm6127611wmq.41.2024.03.15.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 08:30:43 -0700 (PDT)
Date: Fri, 15 Mar 2024 18:30:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yuezhang Mo <Yuezhang.Mo@sony.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>, Andy Wu <Andy.Wu@sony.com>,
	Aoyama Wataru <wataru.aoyama@sony.com>,
	Sungjong Seo <sj1557.seo@samsung.com>
Subject: [linux-next:master 12881/13613] fs/exfat/dir.c:896
 __exfat_get_dentry_set() warn: missing unwind goto?
Message-ID: <6669eebb-e27b-4a50-840e-101112765e3d@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9bb9b28d0568991b1d63e66fe75afa5f97ad1156
commit: bd31db2fd3bdaca4be598ddc39770eb6ebd9e3f3 [12881/13613] exfat: add __exfat_get_dentry_set() helper
config: i386-randconfig-141-20240313 (https://download.01.org/0day-ci/archive/20240315/202403151204.LNYJdVfp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403151204.LNYJdVfp-lkp@intel.com/

New smatch warnings:
fs/exfat/dir.c:896 __exfat_get_dentry_set() warn: missing unwind goto?

vim +896 fs/exfat/dir.c

bd31db2fd3bdac Yuezhang Mo      2023-12-08  849  static int __exfat_get_dentry_set(struct exfat_entry_set_cache *es,
20914ff6dd56dd Yuezhang Mo      2022-11-17  850  		struct super_block *sb, struct exfat_chain *p_dir, int entry,
bd31db2fd3bdac Yuezhang Mo      2023-12-08  851  		unsigned int num_entries)
ca06197382bde0 Namjae Jeon      2020-03-02  852  {
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  853  	int ret, i, num_bh;
36955d368dc101 Yuezhang Mo      2022-11-17  854  	unsigned int off;
ca06197382bde0 Namjae Jeon      2020-03-02  855  	sector_t sec;
ca06197382bde0 Namjae Jeon      2020-03-02  856  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
ca06197382bde0 Namjae Jeon      2020-03-02  857  	struct buffer_head *bh;
ca06197382bde0 Namjae Jeon      2020-03-02  858  
ca06197382bde0 Namjae Jeon      2020-03-02  859  	if (p_dir->dir == DIR_DELETED) {
d1727d55c0327e Joe Perches      2020-04-24  860  		exfat_err(sb, "access to deleted dentry");
20914ff6dd56dd Yuezhang Mo      2022-11-17  861  		return -EIO;
ca06197382bde0 Namjae Jeon      2020-03-02  862  	}
ca06197382bde0 Namjae Jeon      2020-03-02  863  
36955d368dc101 Yuezhang Mo      2022-11-17  864  	ret = exfat_find_location(sb, p_dir, entry, &sec, &off);
ca06197382bde0 Namjae Jeon      2020-03-02  865  	if (ret)
20914ff6dd56dd Yuezhang Mo      2022-11-17  866  		return ret;
ca06197382bde0 Namjae Jeon      2020-03-02  867  
20914ff6dd56dd Yuezhang Mo      2022-11-17  868  	memset(es, 0, sizeof(*es));
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  869  	es->sb = sb;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  870  	es->modified = false;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  871  	es->start_off = off;
a3ff29a95fde16 Yuezhang Mo      2022-11-09  872  	es->bh = es->__bh;
ca06197382bde0 Namjae Jeon      2020-03-02  873  
ca06197382bde0 Namjae Jeon      2020-03-02  874  	bh = sb_bread(sb, sec);
ca06197382bde0 Namjae Jeon      2020-03-02  875  	if (!bh)
20914ff6dd56dd Yuezhang Mo      2022-11-17  876  		return -EIO;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  877  	es->bh[es->num_bh++] = bh;
ca06197382bde0 Namjae Jeon      2020-03-02  878  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  879  	if (num_entries == ES_ALL_ENTRIES) {
bd31db2fd3bdac Yuezhang Mo      2023-12-08  880  		struct exfat_dentry *ep;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  881  
f3fe3954c09f97 Yuezhang Mo      2022-03-17  882  		ep = exfat_get_dentry_cached(es, ES_IDX_FILE);
bd31db2fd3bdac Yuezhang Mo      2023-12-08  883  		if (ep->type != EXFAT_FILE)
3b9681acb0ef73 Yuezhang Mo      2022-03-17  884  			goto put_es;
                                                                        ^^^^^^^^^^^^

ca06197382bde0 Namjae Jeon      2020-03-02  885  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  886  		num_entries = ep->dentry.file.num_ext + 1;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  887  	}
bd31db2fd3bdac Yuezhang Mo      2023-12-08  888  
ca06197382bde0 Namjae Jeon      2020-03-02  889  	es->num_entries = num_entries;
ca06197382bde0 Namjae Jeon      2020-03-02  890  
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  891  	num_bh = EXFAT_B_TO_BLK_ROUND_UP(off + num_entries * DENTRY_SIZE, sb);
a3ff29a95fde16 Yuezhang Mo      2022-11-09  892  	if (num_bh > ARRAY_SIZE(es->__bh)) {
a3ff29a95fde16 Yuezhang Mo      2022-11-09  893  		es->bh = kmalloc_array(num_bh, sizeof(*es->bh), GFP_KERNEL);
a3ff29a95fde16 Yuezhang Mo      2022-11-09  894  		if (!es->bh) {
a3ff29a95fde16 Yuezhang Mo      2022-11-09  895  			brelse(bh);
20914ff6dd56dd Yuezhang Mo      2022-11-17 @896  			return -ENOMEM;

I normally wouldn't send this because it's not a bug, but actually other
people are going to see this static checker warning and the code is
slightly confusing.

At this point calling brelse(bh) and calling exfat_put_dentry_set(es, false);
are equivalent.  So the code works.  But it would be better to do things
consistently on both lines 884 and 896.

a3ff29a95fde16 Yuezhang Mo      2022-11-09  897  		}
a3ff29a95fde16 Yuezhang Mo      2022-11-09  898  		es->bh[0] = bh;
a3ff29a95fde16 Yuezhang Mo      2022-11-09  899  	}
a3ff29a95fde16 Yuezhang Mo      2022-11-09  900  
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  901  	for (i = 1; i < num_bh; i++) {
ca06197382bde0 Namjae Jeon      2020-03-02  902  		/* get the next sector */
ca06197382bde0 Namjae Jeon      2020-03-02  903  		if (exfat_is_last_sector_in_cluster(sbi, sec)) {
36955d368dc101 Yuezhang Mo      2022-11-17  904  			unsigned int clu = exfat_sector_to_cluster(sbi, sec);
36955d368dc101 Yuezhang Mo      2022-11-17  905  
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  906  			if (p_dir->flags == ALLOC_NO_FAT_CHAIN)
ca06197382bde0 Namjae Jeon      2020-03-02  907  				clu++;
ca06197382bde0 Namjae Jeon      2020-03-02  908  			else if (exfat_get_next_cluster(sb, &clu))
3b9681acb0ef73 Yuezhang Mo      2022-03-17  909  				goto put_es;
ca06197382bde0 Namjae Jeon      2020-03-02  910  			sec = exfat_cluster_to_sector(sbi, clu);
ca06197382bde0 Namjae Jeon      2020-03-02  911  		} else {
ca06197382bde0 Namjae Jeon      2020-03-02  912  			sec++;
ca06197382bde0 Namjae Jeon      2020-03-02  913  		}
ca06197382bde0 Namjae Jeon      2020-03-02  914  
ca06197382bde0 Namjae Jeon      2020-03-02  915  		bh = sb_bread(sb, sec);
ca06197382bde0 Namjae Jeon      2020-03-02  916  		if (!bh)
3b9681acb0ef73 Yuezhang Mo      2022-03-17  917  			goto put_es;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  918  		es->bh[es->num_bh++] = bh;
ca06197382bde0 Namjae Jeon      2020-03-02  919  	}
ca06197382bde0 Namjae Jeon      2020-03-02  920  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  921  	return 0;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  922  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  923  put_es:
bd31db2fd3bdac Yuezhang Mo      2023-12-08  924  	exfat_put_dentry_set(es, false);
bd31db2fd3bdac Yuezhang Mo      2023-12-08  925  	return -EIO;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  926  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

