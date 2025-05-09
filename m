Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5C183CCA
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778154; cv=none; b=n/oACsVINuXfUwGZmDa7fHqUPVOuBd7e3dEz6cJQnDo6S+x0mH67IBPYBSVS57TYE8P6HFueQ+zWUVfYnU6/yEKH2idiA3ZgL3q6xi2wngI008eeIwHFAM3EMIgdqu8KeDPCFX37tJ74Vm4yl2l4gquluti4kOXrlnjEfEGDusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778154; c=relaxed/simple;
	bh=4zCJr9XD3NcfSuAtVLvxcxQJWfZQQH5QGYRw91ENM38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eksdoXWX+bjt9FEQcg2sqak64EbRBM3r42fdu2/qDqnre3vVwYB6R8xH2CGIjqwOdjKj2d717q6S5J/LnxVOG7y3Fsg9YnNDRWnTjN/abuDi+e+L1qilJ+7GqOJ8f54eIKwFRc6fgtRIwr/1flap1HYSYc2AWfA7Q6Y7ztZaeUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BGxe7bkz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGxe7bkz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so19161105e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 09 May 2025 01:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746778148; x=1747382948; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJczZT/I1rHwuaM2aEbUsEgWHW49NjaeerqfQ3B7YWc=;
        b=BGxe7bkzNa3xBgsLpAphcEloq+i59UJnTfZ46kQ6FGeWg/Uoit1gNPvGGs5gpg6Q0s
         kMkGCpNJxs604GbyHgx+I7nWfhPpkqcZPYaK9YcFT6OW7VKw1LSNzN9CYBX0+61Elqcj
         JJyPq4G1A2+HX/Ao5qLeyXAnkm7mYqC3Zm6S5de9HVHOG1UDxkqTZ4w4wQdzLsb2NsG2
         M1U4XwYph5Y/YeBuliSos9OinJQcS1fBTnIbiRtAYnc87bTBlHf1BIcjxxhxNqkdcgHn
         HtSro4F1CZpmcXEUdJnPSX4NPP7pMHun0knaHR+V26kQ71ZMAqbA0glc9yCw8dSVDZp8
         hOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778148; x=1747382948;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJczZT/I1rHwuaM2aEbUsEgWHW49NjaeerqfQ3B7YWc=;
        b=s7RXCsWf9ozmgQ68o9szje7XtL4ZsGzHl64W8o/tglZ7bpjTJcVYzzmHcNWF+Sk+p9
         6PrE+h+RVSHtpmzaoTcGpaiqzi5n9MPC4iXKbZ7O2erDNIWN/NB64s33Nz7e6IImV3NG
         V0wrZfMA7JY9aMOA3cXztbNmA8dNY/KBtfRSg52LHzdd6uEgoexZZRyubJX2NtPcTDn7
         a4ClGYUXs/DUTInqkDLsfdUMaBIniioha0dr6s8AlW0NTmgSWksXdjWciW2PWui4fgJt
         a87/dECJWamwVzMiTjiyDlpcq3DqRMwB/EU7GiYZZEdh/S/YipnXnSjhPqbFgbR2b+J+
         4inA==
X-Gm-Message-State: AOJu0YxdeUXBdEciKBSzj1iPWdFS+4ONEW41aNJRN4dHLmCHlguCSnaK
	pLdCz3eTE4ayoojE0M0q4+iUZMtUwUia1fwGzTWUggpBuQyZuaYCzrfkn1ht2LrOxdsBnu/c48c
	0
X-Gm-Gg: ASbGncsElZDSrGyZHOjGCWFvvuISBXUa09k7ZIKBf9ZW0ikN9r3/mfM+qCuN90Tc6g4
	ASqrJtZ8KGzZpajPVZau59BXUAGvmyUHTPq0OIPZOeZpdVb/4oJyUtcj6jc4XjSui37CmMEUCZh
	FtUQLbEtQTt6ZQdaG5WyK2599otdlYdWSnSZqnqJr0ctG1GziZTgvgXvZibv7t1t2vGdQNacP5m
	blFRKt5g4py+zHej0YZI4eL1Rwf70dnv1OtC16kOQmKRuc7lm0rPFNvCHJdV+qHYICRSTtDxew0
	ORZhJVyLFg43X/LY+nnFCewZQmTbSFWMSG3IdFc5a/WsmA==
X-Google-Smtp-Source: AGHT+IFCxD2Rtlg6PxIDOlE5wjDOSPJ2pXBOQvFaEBe1J3FWnbcvzqhCFZmP8lrCwo5ctmdE2+FAGw==
X-Received: by 2002:a05:600c:1c8f:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-442d6d1844amr18531355e9.4.1746778147901;
        Fri, 09 May 2025 01:09:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f2ab2sm2413765f8f.46.2025.05.09.01.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:09:07 -0700 (PDT)
Date: Fri, 9 May 2025 11:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv7-0day
 7/10] fs/ext4/extents.c:4437 ext4_ext_map_blocks() error: uninitialized
 symbol 'ex'.
Message-ID: <202505090533.jBoVQyp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250509080903.8iKOzxeerwmT-sxB_ddrVkdiQTpQtsKnXqkIiqAcS4U@z>

tree:   https://github.com/riteshharjani/linux vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv7-0day
head:   1912657402abaf0395d3a767f49d6ef7238fd29b
commit: 3a2db400ba1b30b1c98060dd61cac23d1112ba23 [7/10] ext4: Add support for EXT4_GET_BLOCKS_QUERY_LEAF_BLOCKS
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090533.jBoVQyp2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505090533.jBoVQyp2-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:4437 ext4_ext_map_blocks() error: uninitialized symbol 'ex'.
fs/ext4/extents.c:4437 ext4_ext_map_blocks() error: uninitialized symbol 'depth'.
fs/ext4/extents.c:4437 ext4_ext_map_blocks() error: 'path' dereferencing possible ERR_PTR()

vim +/ex +4437 fs/ext4/extents.c

e35fd6609b2fee Theodore Ts'o        2010-05-16  4188  int ext4_ext_map_blocks(handle_t *handle, struct inode *inode,
e35fd6609b2fee Theodore Ts'o        2010-05-16  4189  			struct ext4_map_blocks *map, int flags)
a86c61812637c7 Alex Tomas           2006-10-11  4190  {
a86c61812637c7 Alex Tomas           2006-10-11  4191  	struct ext4_ext_path *path = NULL;
d7dce9e08595e8 yangerkun            2020-10-28  4192  	struct ext4_extent newex, *ex, ex2;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4193  	struct ext4_sb_info *sbi = EXT4_SB(inode->i_sb);
8ad8d710035edf Eric Whitney         2020-05-10  4194  	ext4_fsblk_t newblock = 0, pblk;
2ec2e1043473b3 Baokun Li            2024-08-22  4195  	int err = 0, depth;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4196  	unsigned int allocated = 0, offset = 0;
81fdbb4a8d3424 Yongqiang Yang       2011-10-29  4197  	unsigned int allocated_clusters = 0;
c9de560ded61fa Alex Tomas           2008-01-29  4198  	struct ext4_allocation_request ar;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4199  	ext4_lblk_t cluster_offset;
a86c61812637c7 Alex Tomas           2006-10-11  4200  
70aa1554b01474 Ritesh Harjani       2020-05-10  4201  	ext_debug(inode, "blocks %u/%u requested\n", map->m_lblk, map->m_len);
0562e0bad483d1 Jiaying Zhang        2011-03-21  4202  	trace_ext4_ext_map_blocks_enter(inode, map->m_lblk, map->m_len, flags);
a86c61812637c7 Alex Tomas           2006-10-11  4203  
a86c61812637c7 Alex Tomas           2006-10-11  4204  	/* find extent for this block */
ed8a1a766af737 Theodore Ts'o        2014-09-01  4205  	path = ext4_find_extent(inode, map->m_lblk, NULL, 0);
a86c61812637c7 Alex Tomas           2006-10-11  4206  	if (IS_ERR(path)) {
a86c61812637c7 Alex Tomas           2006-10-11  4207  		err = PTR_ERR(path);
8ad8d710035edf Eric Whitney         2020-05-10  4208  		goto out;
                                                                ^^^^^^^^^
ex and depth are uninitialized and path is an error pointer.

a86c61812637c7 Alex Tomas           2006-10-11  4209  	}
a86c61812637c7 Alex Tomas           2006-10-11  4210  
a86c61812637c7 Alex Tomas           2006-10-11  4211  	depth = ext_depth(inode);
a86c61812637c7 Alex Tomas           2006-10-11  4212  
a86c61812637c7 Alex Tomas           2006-10-11  4213  	/*
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4214  	 * consistent leaf must not be empty;
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4215  	 * this situation is possible, though, _during_ tree modification;
ed8a1a766af737 Theodore Ts'o        2014-09-01  4216  	 * this is why assert can't be put in ext4_find_extent()
a86c61812637c7 Alex Tomas           2006-10-11  4217  	 */
273df556b6ee20 Frank Mayhar         2010-03-02  4218  	if (unlikely(path[depth].p_ext == NULL && depth != 0)) {
273df556b6ee20 Frank Mayhar         2010-03-02  4219  		EXT4_ERROR_INODE(inode, "bad extent address "
f70f362b4a6fe4 Theodore Ts'o        2010-05-16  4220  				 "lblock: %lu, depth: %d pblock %lld",
f70f362b4a6fe4 Theodore Ts'o        2010-05-16  4221  				 (unsigned long) map->m_lblk, depth,
f70f362b4a6fe4 Theodore Ts'o        2010-05-16  4222  				 path[depth].p_block);
6a797d27378389 Darrick J. Wong      2015-10-17  4223  		err = -EFSCORRUPTED;
8ad8d710035edf Eric Whitney         2020-05-10  4224  		goto out;
034fb4c95fc0fe Surbhi Palande       2009-12-14  4225  	}
a86c61812637c7 Alex Tomas           2006-10-11  4226  
7e0289766a0750 Avantika Mathur      2006-12-06  4227  	ex = path[depth].p_ext;
7e0289766a0750 Avantika Mathur      2006-12-06  4228  	if (ex) {
725d26d3f09ccb Aneesh Kumar K.V     2008-01-28  4229  		ext4_lblk_t ee_block = le32_to_cpu(ex->ee_block);
bf89d16f6ef538 Theodore Ts'o        2010-10-27  4230  		ext4_fsblk_t ee_start = ext4_ext_pblock(ex);
a2df2a63407803 Amit Arora           2007-07-17  4231  		unsigned short ee_len;
471d4011a9862e Suparna Bhattacharya 2006-10-11  4232  
b8a8684502a0fc Lukas Czerner        2014-03-18  4233  
471d4011a9862e Suparna Bhattacharya 2006-10-11  4234  		/*
556615dcbf38b0 Lukas Czerner        2014-04-20  4235  		 * unwritten extents are treated as holes, except that
56055d3ae4cc7f Amit Arora           2007-07-17  4236  		 * we split out initialized portions during a write.
471d4011a9862e Suparna Bhattacharya 2006-10-11  4237  		 */
a2df2a63407803 Amit Arora           2007-07-17  4238  		ee_len = ext4_ext_get_actual_len(ex);
d8990240d8c911 Aditya Kali          2011-09-09  4239  
d8990240d8c911 Aditya Kali          2011-09-09  4240  		trace_ext4_ext_show_extent(inode, ee_block, ee_start, ee_len);
d8990240d8c911 Aditya Kali          2011-09-09  4241  
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4242  		/* if found extent covers block, simply return it */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4243  		if (in_range(map->m_lblk, ee_block, ee_len)) {
e35fd6609b2fee Theodore Ts'o        2010-05-16  4244  			newblock = map->m_lblk - ee_block + ee_start;
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4245  			/* number of remaining blocks in the extent */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4246  			allocated = ee_len - (map->m_lblk - ee_block);
70aa1554b01474 Ritesh Harjani       2020-05-10  4247  			ext_debug(inode, "%u fit into %u:%d -> %llu\n",
70aa1554b01474 Ritesh Harjani       2020-05-10  4248  				  map->m_lblk, ee_block, ee_len, newblock);
56055d3ae4cc7f Amit Arora           2007-07-17  4249  
b8a8684502a0fc Lukas Czerner        2014-03-18  4250  			/*
b8a8684502a0fc Lukas Czerner        2014-03-18  4251  			 * If the extent is initialized check whether the
b8a8684502a0fc Lukas Czerner        2014-03-18  4252  			 * caller wants to convert it to unwritten.
b8a8684502a0fc Lukas Czerner        2014-03-18  4253  			 */
556615dcbf38b0 Lukas Czerner        2014-04-20  4254  			if ((!ext4_ext_is_unwritten(ex)) &&
b8a8684502a0fc Lukas Czerner        2014-03-18  4255  			    (flags & EXT4_GET_BLOCKS_CONVERT_UNWRITTEN)) {
4191eefef978d7 Baokun Li            2024-08-22  4256  				path = convert_initialized_extent(handle,
4191eefef978d7 Baokun Li            2024-08-22  4257  					inode, map, path, &allocated);
4191eefef978d7 Baokun Li            2024-08-22  4258  				if (IS_ERR(path))
4191eefef978d7 Baokun Li            2024-08-22  4259  					err = PTR_ERR(path);
8ad8d710035edf Eric Whitney         2020-05-10  4260  				goto out;
f064a9d6e7dbd3 Eric Whitney         2020-02-18  4261  			} else if (!ext4_ext_is_unwritten(ex)) {
8ad8d710035edf Eric Whitney         2020-05-10  4262  				map->m_flags |= EXT4_MAP_MAPPED;
8ad8d710035edf Eric Whitney         2020-05-10  4263  				map->m_pblk = newblock;
8ad8d710035edf Eric Whitney         2020-05-10  4264  				if (allocated > map->m_len)
8ad8d710035edf Eric Whitney         2020-05-10  4265  					allocated = map->m_len;
8ad8d710035edf Eric Whitney         2020-05-10  4266  				map->m_len = allocated;
8ad8d710035edf Eric Whitney         2020-05-10  4267  				ext4_ext_show_leaf(inode, path);
a86c61812637c7 Alex Tomas           2006-10-11  4268  				goto out;
f064a9d6e7dbd3 Eric Whitney         2020-02-18  4269  			}
69eb33dc24dc44 Zheng Liu            2013-02-18  4270  
2ec2e1043473b3 Baokun Li            2024-08-22  4271  			path = ext4_ext_handle_unwritten_extents(
2ec2e1043473b3 Baokun Li            2024-08-22  4272  				handle, inode, map, path, flags,
2ec2e1043473b3 Baokun Li            2024-08-22  4273  				&allocated, newblock);
2ec2e1043473b3 Baokun Li            2024-08-22  4274  			if (IS_ERR(path))
2ec2e1043473b3 Baokun Li            2024-08-22  4275  				err = PTR_ERR(path);
8ad8d710035edf Eric Whitney         2020-05-10  4276  			goto out;
56055d3ae4cc7f Amit Arora           2007-07-17  4277  		}
a86c61812637c7 Alex Tomas           2006-10-11  4278  	}
a86c61812637c7 Alex Tomas           2006-10-11  4279  
a86c61812637c7 Alex Tomas           2006-10-11  4280  	/*
d0d856e8bd6e69 Randy Dunlap         2006-10-11  4281  	 * requested block isn't allocated yet;
547e64bda9c7bd Cheng Nie            2024-01-18  4282  	 * we couldn't try to create block if flags doesn't contain EXT4_GET_BLOCKS_CREATE
a86c61812637c7 Alex Tomas           2006-10-11  4283  	 */
c2177057331992 Theodore Ts'o        2009-05-14  4284  	if ((flags & EXT4_GET_BLOCKS_CREATE) == 0) {
6430dea07e8595 Zhang Yi             2024-01-27  4285  		ext4_lblk_t len;
140a52508a6838 Jan Kara             2016-03-09  4286  
6430dea07e8595 Zhang Yi             2024-01-27  4287  		len = ext4_ext_determine_insert_hole(inode, path, map->m_lblk);
facab4d9711e7a Jan Kara             2016-03-09  4288  
facab4d9711e7a Jan Kara             2016-03-09  4289  		map->m_pblk = 0;
6430dea07e8595 Zhang Yi             2024-01-27  4290  		map->m_len = min_t(unsigned int, map->m_len, len);
8ad8d710035edf Eric Whitney         2020-05-10  4291  		goto out;
a86c61812637c7 Alex Tomas           2006-10-11  4292  	}
4d33b1ef10995d Theodore Ts'o        2011-09-09  4293  
a86c61812637c7 Alex Tomas           2006-10-11  4294  	/*
c2ea3fde61f1df Theodore Ts'o        2008-10-10  4295  	 * Okay, we need to do block allocation.
a86c61812637c7 Alex Tomas           2006-10-11  4296  	 */
4d33b1ef10995d Theodore Ts'o        2011-09-09  4297  	newex.ee_block = cpu_to_le32(map->m_lblk);
d0abafac8c9162 Eric Whitney         2014-01-06  4298  	cluster_offset = EXT4_LBLK_COFF(sbi, map->m_lblk);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4299  
4d33b1ef10995d Theodore Ts'o        2011-09-09  4300  	/*
4d33b1ef10995d Theodore Ts'o        2011-09-09  4301  	 * If we are doing bigalloc, check to see if the extent returned
ed8a1a766af737 Theodore Ts'o        2014-09-01  4302  	 * by ext4_find_extent() implies a cluster we can use.
4d33b1ef10995d Theodore Ts'o        2011-09-09  4303  	 */
4d33b1ef10995d Theodore Ts'o        2011-09-09  4304  	if (cluster_offset && ex &&
d8990240d8c911 Aditya Kali          2011-09-09  4305  	    get_implied_cluster_alloc(inode->i_sb, map, ex, path)) {
4d33b1ef10995d Theodore Ts'o        2011-09-09  4306  		ar.len = allocated = map->m_len;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4307  		newblock = map->m_pblk;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4308  		goto got_allocated_blocks;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4309  	}
a86c61812637c7 Alex Tomas           2006-10-11  4310  
c9de560ded61fa Alex Tomas           2008-01-29  4311  	/* find neighbour allocated blocks */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4312  	ar.lleft = map->m_lblk;
c9de560ded61fa Alex Tomas           2008-01-29  4313  	err = ext4_ext_search_left(inode, path, &ar.lleft, &ar.pleft);
c9de560ded61fa Alex Tomas           2008-01-29  4314  	if (err)
8ad8d710035edf Eric Whitney         2020-05-10  4315  		goto out;
e35fd6609b2fee Theodore Ts'o        2010-05-16  4316  	ar.lright = map->m_lblk;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4317  	err = ext4_ext_search_right(inode, path, &ar.lright, &ar.pright, &ex2);
d7dce9e08595e8 yangerkun            2020-10-28  4318  	if (err < 0)
8ad8d710035edf Eric Whitney         2020-05-10  4319  		goto out;
25d14f983f70dd Amit Arora           2007-05-24  4320  
4d33b1ef10995d Theodore Ts'o        2011-09-09  4321  	/* Check if the extent after searching to the right implies a
4d33b1ef10995d Theodore Ts'o        2011-09-09  4322  	 * cluster we can use. */
d7dce9e08595e8 yangerkun            2020-10-28  4323  	if ((sbi->s_cluster_ratio > 1) && err &&
d7dce9e08595e8 yangerkun            2020-10-28  4324  	    get_implied_cluster_alloc(inode->i_sb, map, &ex2, path)) {
4d33b1ef10995d Theodore Ts'o        2011-09-09  4325  		ar.len = allocated = map->m_len;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4326  		newblock = map->m_pblk;
f7d1331f16a869 Baokun Li            2024-08-22  4327  		err = 0;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4328  		goto got_allocated_blocks;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4329  	}
4d33b1ef10995d Theodore Ts'o        2011-09-09  4330  
749269facaf87f Amit Arora           2007-07-18  4331  	/*
749269facaf87f Amit Arora           2007-07-18  4332  	 * See if request is beyond maximum number of blocks we can have in
749269facaf87f Amit Arora           2007-07-18  4333  	 * a single extent. For an initialized extent this limit is
556615dcbf38b0 Lukas Czerner        2014-04-20  4334  	 * EXT_INIT_MAX_LEN and for an unwritten extent this limit is
556615dcbf38b0 Lukas Czerner        2014-04-20  4335  	 * EXT_UNWRITTEN_MAX_LEN.
749269facaf87f Amit Arora           2007-07-18  4336  	 */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4337  	if (map->m_len > EXT_INIT_MAX_LEN &&
556615dcbf38b0 Lukas Czerner        2014-04-20  4338  	    !(flags & EXT4_GET_BLOCKS_UNWRIT_EXT))
e35fd6609b2fee Theodore Ts'o        2010-05-16  4339  		map->m_len = EXT_INIT_MAX_LEN;
556615dcbf38b0 Lukas Czerner        2014-04-20  4340  	else if (map->m_len > EXT_UNWRITTEN_MAX_LEN &&
556615dcbf38b0 Lukas Czerner        2014-04-20  4341  		 (flags & EXT4_GET_BLOCKS_UNWRIT_EXT))
556615dcbf38b0 Lukas Czerner        2014-04-20  4342  		map->m_len = EXT_UNWRITTEN_MAX_LEN;
749269facaf87f Amit Arora           2007-07-18  4343  
e35fd6609b2fee Theodore Ts'o        2010-05-16  4344  	/* Check if we can really insert (m_lblk)::(m_lblk + m_len) extent */
e35fd6609b2fee Theodore Ts'o        2010-05-16  4345  	newex.ee_len = cpu_to_le16(map->m_len);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4346  	err = ext4_ext_check_overlap(sbi, inode, &newex, path);
25d14f983f70dd Amit Arora           2007-05-24  4347  	if (err)
b939e3766ec19e Aneesh Kumar K.V     2008-01-28  4348  		allocated = ext4_ext_get_actual_len(&newex);
25d14f983f70dd Amit Arora           2007-05-24  4349  	else
e35fd6609b2fee Theodore Ts'o        2010-05-16  4350  		allocated = map->m_len;
c9de560ded61fa Alex Tomas           2008-01-29  4351  
c9de560ded61fa Alex Tomas           2008-01-29  4352  	/* allocate new block */
c9de560ded61fa Alex Tomas           2008-01-29  4353  	ar.inode = inode;
e35fd6609b2fee Theodore Ts'o        2010-05-16  4354  	ar.goal = ext4_ext_find_goal(inode, path, map->m_lblk);
e35fd6609b2fee Theodore Ts'o        2010-05-16  4355  	ar.logical = map->m_lblk;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4356  	/*
4d33b1ef10995d Theodore Ts'o        2011-09-09  4357  	 * We calculate the offset from the beginning of the cluster
4d33b1ef10995d Theodore Ts'o        2011-09-09  4358  	 * for the logical block number, since when we allocate a
4d33b1ef10995d Theodore Ts'o        2011-09-09  4359  	 * physical cluster, the physical block should start at the
4d33b1ef10995d Theodore Ts'o        2011-09-09  4360  	 * same offset from the beginning of the cluster.  This is
4d33b1ef10995d Theodore Ts'o        2011-09-09  4361  	 * needed so that future calls to get_implied_cluster_alloc()
4d33b1ef10995d Theodore Ts'o        2011-09-09  4362  	 * work correctly.
4d33b1ef10995d Theodore Ts'o        2011-09-09  4363  	 */
f5a44db5d2d677 Theodore Ts'o        2013-12-20  4364  	offset = EXT4_LBLK_COFF(sbi, map->m_lblk);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4365  	ar.len = EXT4_NUM_B2C(sbi, offset+allocated);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4366  	ar.goal -= offset;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4367  	ar.logical -= offset;
c9de560ded61fa Alex Tomas           2008-01-29  4368  	if (S_ISREG(inode->i_mode))
c9de560ded61fa Alex Tomas           2008-01-29  4369  		ar.flags = EXT4_MB_HINT_DATA;
c9de560ded61fa Alex Tomas           2008-01-29  4370  	else
c9de560ded61fa Alex Tomas           2008-01-29  4371  		/* disable in-core preallocation for non-regular files */
c9de560ded61fa Alex Tomas           2008-01-29  4372  		ar.flags = 0;
556b27abf73833 Vivek Haldar         2011-05-25  4373  	if (flags & EXT4_GET_BLOCKS_NO_NORMALIZE)
556b27abf73833 Vivek Haldar         2011-05-25  4374  		ar.flags |= EXT4_MB_HINT_NOPREALLOC;
e3cf5d5d9a86df Theodore Ts'o        2014-09-04  4375  	if (flags & EXT4_GET_BLOCKS_DELALLOC_RESERVE)
e3cf5d5d9a86df Theodore Ts'o        2014-09-04  4376  		ar.flags |= EXT4_MB_DELALLOC_RESERVED;
c5e298ae53dc2e Theodore Ts'o        2015-06-21  4377  	if (flags & EXT4_GET_BLOCKS_METADATA_NOFAIL)
c5e298ae53dc2e Theodore Ts'o        2015-06-21  4378  		ar.flags |= EXT4_MB_USE_RESERVED;
c9de560ded61fa Alex Tomas           2008-01-29  4379  	newblock = ext4_mb_new_blocks(handle, &ar, &err);
a86c61812637c7 Alex Tomas           2006-10-11  4380  	if (!newblock)
8ad8d710035edf Eric Whitney         2020-05-10  4381  		goto out;
7b415bf60f6afb Aditya Kali          2011-09-09  4382  	allocated_clusters = ar.len;
4d33b1ef10995d Theodore Ts'o        2011-09-09  4383  	ar.len = EXT4_C2B(sbi, ar.len) - offset;
70aa1554b01474 Ritesh Harjani       2020-05-10  4384  	ext_debug(inode, "allocate new block: goal %llu, found %llu/%u, requested %u\n",
ec8c60be96d6de Ritesh Harjani       2020-05-10  4385  		  ar.goal, newblock, ar.len, allocated);
4d33b1ef10995d Theodore Ts'o        2011-09-09  4386  	if (ar.len > allocated)
4d33b1ef10995d Theodore Ts'o        2011-09-09  4387  		ar.len = allocated;
a86c61812637c7 Alex Tomas           2006-10-11  4388  
4d33b1ef10995d Theodore Ts'o        2011-09-09  4389  got_allocated_blocks:
a86c61812637c7 Alex Tomas           2006-10-11  4390  	/* try to insert new extent into found leaf and return */
8ad8d710035edf Eric Whitney         2020-05-10  4391  	pblk = newblock + offset;
8ad8d710035edf Eric Whitney         2020-05-10  4392  	ext4_ext_store_pblock(&newex, pblk);
c9de560ded61fa Alex Tomas           2008-01-29  4393  	newex.ee_len = cpu_to_le16(ar.len);
556615dcbf38b0 Lukas Czerner        2014-04-20  4394  	/* Mark unwritten */
556615dcbf38b0 Lukas Czerner        2014-04-20  4395  	if (flags & EXT4_GET_BLOCKS_UNWRIT_EXT) {
556615dcbf38b0 Lukas Czerner        2014-04-20  4396  		ext4_ext_mark_unwritten(&newex);
a25a4e1a5d5dc0 Zheng Liu            2013-02-18  4397  		map->m_flags |= EXT4_MAP_UNWRITTEN;
8d5d02e6b17656 Mingming Cao         2009-09-28  4398  	}
c8d46e41bc744c Jiaying Zhang        2010-02-24  4399  
f7d1331f16a869 Baokun Li            2024-08-22  4400  	path = ext4_ext_insert_extent(handle, inode, path, &newex, flags);
f7d1331f16a869 Baokun Li            2024-08-22  4401  	if (IS_ERR(path)) {
f7d1331f16a869 Baokun Li            2024-08-22  4402  		err = PTR_ERR(path);
34990461342fc9 Eric Whitney         2020-03-11  4403  		if (allocated_clusters) {
34990461342fc9 Eric Whitney         2020-03-11  4404  			int fb_flags = 0;
82e54229118785 Dmitry Monakhov      2012-09-28  4405  
34990461342fc9 Eric Whitney         2020-03-11  4406  			/*
34990461342fc9 Eric Whitney         2020-03-11  4407  			 * free data blocks we just allocated.
34990461342fc9 Eric Whitney         2020-03-11  4408  			 * not a good idea to call discard here directly,
34990461342fc9 Eric Whitney         2020-03-11  4409  			 * but otherwise we'd need to call it every free().
34990461342fc9 Eric Whitney         2020-03-11  4410  			 */
2ffd2a6ad1d3a8 Kemeng Shi           2024-01-05  4411  			ext4_discard_preallocations(inode);
34990461342fc9 Eric Whitney         2020-03-11  4412  			if (flags & EXT4_GET_BLOCKS_DELALLOC_RESERVE)
34990461342fc9 Eric Whitney         2020-03-11  4413  				fb_flags = EXT4_FREE_BLOCKS_NO_QUOT_UPDATE;
c8e15130e1636f Theodore Ts'o        2013-07-15  4414  			ext4_free_blocks(handle, inode, NULL, newblock,
34990461342fc9 Eric Whitney         2020-03-11  4415  					 EXT4_C2B(sbi, allocated_clusters),
34990461342fc9 Eric Whitney         2020-03-11  4416  					 fb_flags);
34990461342fc9 Eric Whitney         2020-03-11  4417  		}
8ad8d710035edf Eric Whitney         2020-05-10  4418  		goto out;
315054f023d28e Alex Tomas           2007-05-24  4419  	}
a86c61812637c7 Alex Tomas           2006-10-11  4420  
b436b9bef84de6 Jan Kara             2009-12-08  4421  	/*
b436b9bef84de6 Jan Kara             2009-12-08  4422  	 * Cache the extent and update transaction to commit on fdatasync only
556615dcbf38b0 Lukas Czerner        2014-04-20  4423  	 * when it is _not_ an unwritten extent.
b436b9bef84de6 Jan Kara             2009-12-08  4424  	 */
556615dcbf38b0 Lukas Czerner        2014-04-20  4425  	if ((flags & EXT4_GET_BLOCKS_UNWRIT_EXT) == 0)
b436b9bef84de6 Jan Kara             2009-12-08  4426  		ext4_update_inode_fsync_trans(handle, inode, 1);
69eb33dc24dc44 Zheng Liu            2013-02-18  4427  	else
b436b9bef84de6 Jan Kara             2009-12-08  4428  		ext4_update_inode_fsync_trans(handle, inode, 0);
8ad8d710035edf Eric Whitney         2020-05-10  4429  
8ad8d710035edf Eric Whitney         2020-05-10  4430  	map->m_flags |= (EXT4_MAP_NEW | EXT4_MAP_MAPPED);
8ad8d710035edf Eric Whitney         2020-05-10  4431  	map->m_pblk = pblk;
8ad8d710035edf Eric Whitney         2020-05-10  4432  	map->m_len = ar.len;
e35fd6609b2fee Theodore Ts'o        2010-05-16  4433  	allocated = map->m_len;
a86c61812637c7 Alex Tomas           2006-10-11  4434  	ext4_ext_show_leaf(inode, path);
8ad8d710035edf Eric Whitney         2020-05-10  4435  out:
3a2db400ba1b30 Ritesh Harjani (IBM  2025-04-29  4436) 	if (flags & EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF)
3a2db400ba1b30 Ritesh Harjani (IBM  2025-04-29 @4437) 		if (ex && (ex == EXT_LAST_EXTENT(path[depth].p_hdr)))
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dead.

3a2db400ba1b30 Ritesh Harjani (IBM  2025-04-29  4438) 			map->m_flags |= EXT4_MAP_QUERY_LAST_IN_LEAF;
3a2db400ba1b30 Ritesh Harjani (IBM  2025-04-29  4439) 
7ff5fddaddf2cc Ye Bin               2022-09-24  4440  	ext4_free_ext_path(path);
e861304b8ed83f Allison Henderson    2011-05-25  4441  
63b999685cb372 Theodore Ts'o        2013-07-16  4442  	trace_ext4_ext_map_blocks_exit(inode, flags, map,
63b999685cb372 Theodore Ts'o        2013-07-16  4443  				       err ? err : allocated);
7877191c28b1e1 Lukas Czerner        2012-03-19  4444  	return err ? err : allocated;
a86c61812637c7 Alex Tomas           2006-10-11  4445  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

