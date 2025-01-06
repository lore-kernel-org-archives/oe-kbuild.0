Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC611D935E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155841; cv=none; b=I5gZdcM1D8ZE2UQV4dqYtI2QQf0T5+NGVo1VS0deFYkZKsiqtVKjMBirNP60uQJtppRi+KQsDZluRcVZFvrUTXtSCaRPhbSJC1hpDmkhrJ7Fy5/rAhpzxaTzLwxum/OsP81bPD0ytCrDcAHn8qmxwnMDS/xeXSCTllsZxKYBC4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155841; c=relaxed/simple;
	bh=RyecLJ4QeDj/QNPJ/o1ThkF0wQ4Td7mz9XAHP/cBSeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PAJAQIiHJqQqoEDQrigi1scVVUWX2r4r9xGCtKLY49FQYLzUU0IdrEuv4vHDFBGLBhrGUx4YhzUsjR5gbtjBBeqiY/kECLZIws9B8F9xXQT5YPYrB67YRJxBiMQwHHejThByear2n1VVhb9X5XDq0HVkUZ54/oX7dAG3c2YxXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=an3tgrEM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="an3tgrEM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso10816611f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155837; x=1736760637; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31XuZD5Ueo22jIbx6m96MXPhGYnvReUJUIki6uMvlo4=;
        b=an3tgrEMWpmHMw/529XFfbV7eGvAtxA9PccyJsrrPAa28jHJUQwAyAfNIn2FRU/a0X
         6QxTGIQYz4IYH7QEbDAIbGT5IOl47P0NhMoe0RnaN5voUs1h0veyHutL183pvqq+Tkdq
         snne7VM8qU2TeVIrmMxsP0MyK6c8sHTdVjGmgggTh/YG4paeGbrRPtyOVZzWC3fsIER6
         JysBbsrL1KmFRdzUe8OSAmKol2qaiqMAZz4ZXdsf4i8vbzQVVa/2EqDXREi4v1f9I5XZ
         XlekBNs0CLJMrK/7pVFhp5SrAkF2wRmKdA5z4P24Q4iqZVFVYfMT1OrhJZKwbt7pZWmH
         wqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155837; x=1736760637;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31XuZD5Ueo22jIbx6m96MXPhGYnvReUJUIki6uMvlo4=;
        b=TKKpd/w7dp1FSI42BI1KrkEP6jY1fHdOAvO0RW1zQtzJQwkKGtXhgaJagHmROIdC9g
         x/+ITqG7OndMC0mBaUyyCyJTtkml9lBhUcX3DKT1N2iaO7p00+0KQhrtlc/JzXs68GCv
         5w5otw4gXogoMLpYTXsGiNfS8J6zbzWduzVt48arUhBH8hsDat2KYelxOzgDzLIjBwci
         yITKKixikN4DhV4p6xtNWa7cSSVh7fblxtCHXVAGe8Le9fiEkq0Lm3eSzUNLr+OtNsr0
         /ouXty+tXCj71lXKFF1kOivq2+c7yVT0F0nJwWPwxbx11xYxVVx+FbqiX3oya5MVqu4O
         nzvA==
X-Gm-Message-State: AOJu0YyedEXiHC+PW9tEf9reJSmuKbMw8gMDgFdVGssSyWnMjUegzC1V
	Co2H5rBwBPz2YzLuvh1T5Pz21ZgeKz3sUpBiU/EfX8CF/3+fbx6uO2OVbaJXMV3NqR9/1UuxxBB
	l
X-Gm-Gg: ASbGnctERO4QNBQooLtx29Zn653pXjPVLgx1etUEWyaR1Zwr24AA8s3MWbxm75VCXd7
	eI273tvNB3L6gDebugaj90iuY1h5Wf8sdCiQx3qV+4LN6GYvi7318ri3mMuPHX/B1jaCKqUp0Ul
	IdiZpj+qpxKvcPK9O3pTfzz+ZmRnvV7LJojx5TUb4eLzKmU2/gojtApsDymVXTDwLEXKIJZGwmi
	KQ9SAEvOwZ9q9ERZgVzVq/dDRSwJgbJvHSL8JP/uD/S08NuzL5YWyUVm2Os7g==
X-Google-Smtp-Source: AGHT+IHHtEovPio2CBN6lOioiddfh+RP2w+BNAsymUq7W0uwRKhL0Vh/WiSKE6yBCUGyVSjwAKWcaA==
X-Received: by 2002:a05:6000:1568:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38a223f835dmr45778901f8f.39.1736155836662;
        Mon, 06 Jan 2025 01:30:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm48637060f8f.72.2025.01.06.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:30:36 -0800 (PST)
Date: Mon, 6 Jan 2025 12:30:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:zoned 140/144] fs/xfs/libxfs/xfs_zones.c:164
 xfs_zone_validate() warn: signedness bug returning '(-5)'
Message-ID: <ab7e7949-33f5-4c0b-ace9-72bed0d7d898@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git zoned
head:   e438c133cc544cff3b44f8c3fde87a8ab5f8a3de
commit: 89f3e23cc043cf574275ea94a8f126eb4c806fc3 [140/144] xfs: support zone gaps
config: i386-randconfig-141-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221007.JUrl8Z6K-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412221007.JUrl8Z6K-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_zones.c:164 xfs_zone_validate() warn: signedness bug returning '(-5)'

vim +164 fs/xfs/libxfs/xfs_zones.c

39f9a996878403 Christoph Hellwig 2024-12-19  132  bool
39f9a996878403 Christoph Hellwig 2024-12-19  133  xfs_zone_validate(

This function returns bool.

39f9a996878403 Christoph Hellwig 2024-12-19  134  	struct blk_zone		*zone,
39f9a996878403 Christoph Hellwig 2024-12-19  135  	struct xfs_rtgroup	*rtg,
39f9a996878403 Christoph Hellwig 2024-12-19  136  	xfs_rgblock_t		*write_pointer)
39f9a996878403 Christoph Hellwig 2024-12-19  137  {
39f9a996878403 Christoph Hellwig 2024-12-19  138  	struct xfs_mount	*mp = rtg_mount(rtg);
39f9a996878403 Christoph Hellwig 2024-12-19  139  	struct xfs_groups	*g = &mp->m_groups[XG_TYPE_RTG];
89f3e23cc043cf Christoph Hellwig 2024-12-19  140  	uint32_t		expected_size;
39f9a996878403 Christoph Hellwig 2024-12-19  141  
39f9a996878403 Christoph Hellwig 2024-12-19  142  	/*
39f9a996878403 Christoph Hellwig 2024-12-19  143  	 * Check that the zone capacity matches the rtgroup size stored in the
39f9a996878403 Christoph Hellwig 2024-12-19  144  	 * superblock.  Note that all zones including the last one must have a
39f9a996878403 Christoph Hellwig 2024-12-19  145  	 * uniform capacity.
39f9a996878403 Christoph Hellwig 2024-12-19  146  	 */
39f9a996878403 Christoph Hellwig 2024-12-19  147  	if (XFS_BB_TO_FSB(mp, zone->capacity) != g->blocks) {
39f9a996878403 Christoph Hellwig 2024-12-19  148  		xfs_warn(mp,
39f9a996878403 Christoph Hellwig 2024-12-19  149  "zone %u capacity (0x%llx) does not match RT group size (0x%x).",
39f9a996878403 Christoph Hellwig 2024-12-19  150  			rtg_rgno(rtg), XFS_BB_TO_FSB(mp, zone->capacity),
39f9a996878403 Christoph Hellwig 2024-12-19  151  			g->blocks);
39f9a996878403 Christoph Hellwig 2024-12-19  152  		return false;
39f9a996878403 Christoph Hellwig 2024-12-19  153  	}
39f9a996878403 Christoph Hellwig 2024-12-19  154  
89f3e23cc043cf Christoph Hellwig 2024-12-19  155  	if (g->has_daddr_gaps) {
89f3e23cc043cf Christoph Hellwig 2024-12-19  156  		expected_size = 1 << g->blklog;
89f3e23cc043cf Christoph Hellwig 2024-12-19  157  	} else {
89f3e23cc043cf Christoph Hellwig 2024-12-19  158  		if (zone->len != zone->capacity) {
89f3e23cc043cf Christoph Hellwig 2024-12-19  159  			xfs_warn(mp,
89f3e23cc043cf Christoph Hellwig 2024-12-19  160  "zone %u has capacity != size ((0x%llx vs 0x%llx)",
89f3e23cc043cf Christoph Hellwig 2024-12-19  161  				rtg_rgno(rtg),
89f3e23cc043cf Christoph Hellwig 2024-12-19  162  				XFS_BB_TO_FSB(mp, zone->len),
89f3e23cc043cf Christoph Hellwig 2024-12-19  163  				XFS_BB_TO_FSB(mp, zone->capacity));
89f3e23cc043cf Christoph Hellwig 2024-12-19 @164  			return -EIO;
                                                                               ^^^^
s/-EIO/false/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

