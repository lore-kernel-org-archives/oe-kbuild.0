Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C52D5941
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987860; cv=none; b=eREJgA6xXoU0wpQMUJGJXYNcyRoDdwZAca6EASwfErh+g0hlWmGVfkeDYJVLMSkWZZ7D4VMyP7cKrq1khi5Eoi/8kQsbOlUN9CO0+VDwDGMaA2X+24FI0K+7/boFfHS85L+p43jQBX4igUol4AJsVQ+ApSql3HmAJkotzU5NPV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987860; c=relaxed/simple;
	bh=ff0bQu0OzmBOvCruwXQGsD7UOTSGmca6Fy1TK72u9Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmZ7opXZhjZMhBLqDv3KpuL87Z3wrGKSsAKBrllpHXpMLdOrl8EStKhNKoXkS0E46Qehi+C/fPmDdj6ey6Y6Ps0zPqNomtsEqxr9s90km2faZXOsGJtew9ybohRxic7fRRlD/gYCuXBQygpjocpQKNYak8VS2KPpaokd2a119h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=go54FPLB; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="go54FPLB"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8f231f3b130so376773685a.3
        for <oe-kbuild@lists.linux.dev>; Tue, 05 May 2026 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987857; x=1778592657; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35CH6Yi9uh5mtNuWSXZJ4xVnriQjRm7LpXCym9MsM78=;
        b=go54FPLBPBM7ZlCPXVoaE5mR9bCmhfLEQdlOWfQLGCMaY4fRfdwW3FORDAB0jNo47Y
         oN5yh3UcLw7InLon/P1WIdvIQHe/ntsKbhg+Z3lMvYJMmu1B6bQANS779OzOs1whmZTl
         nZY7rGDciOUdo1OCoDmqAqh+CaI6gJKj/gvHPnKIlUFiCnfiVYsfGj9qa+lhKjl3USbl
         Biqqn6JyRAx+pcdg4nh9jTKjXrJS2QWg4qr3FsD+9nj5w/nR4velOwWUFcA9/t2JOagA
         xKtX4Tqar4e9ShBWkkWExdnixbYLz5WaLRHr+bDNmqFElsHjKG7FSNeqSbmr/K+A5l1D
         kTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987857; x=1778592657;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35CH6Yi9uh5mtNuWSXZJ4xVnriQjRm7LpXCym9MsM78=;
        b=AatUyvwE6/vSxSjSPTLGsBTXgssylx3jJe+MAPOUkB4fjyir7ixHLe3Z5Xi9iBhXu6
         bTRHKxxdEFF8KBfjZAl0ZqYUyEbUhNlKbQWfPiZpo/khhD0yj/ZnUjuPi7XOQOTlqIkT
         GUNA1nXwYcJ/s/8Y4SXSPIC5ui+LSItdoeSw83tRkFoeFV2HlltcecJmUksdau63p4rW
         Qy8D9iDDsUQTzP6xVsVcH4OZOLFDXhQ6sCFpqDkcrt2Qn8Gv2tYAbVf+eZ5vvHTahAyX
         hXe9ANme91ALXtAigwSw/FmLRA7vDwFOQoj0H8yaBIVxD/G5MpFYgJZaij+veD8abbwU
         F06g==
X-Gm-Message-State: AOJu0YydxweP4vRk2r6mhMCpmPlftF+eV/yvpgJQ3l3wG7rGJZ20Rxtn
	G9PvZic1v3xycRGQWBe7xbF5j2zAtJRNhUQdwOu/KWcDRvkiOtQej/sZ/feRL5ZV
X-Gm-Gg: AeBDieuZnpnGZOSjI+THy9Jwl67elv/joBRDKON8gota4QwcZoBcOCXy7YvwficvBS5
	OCOteliRb7zvPYohz4L3TEMwY5Ju3pyMaGPeZKrPwYC8urDYBNFDcVbJ0eBgHLBLVOiOlVlL6sV
	hs0bvvXvpUAM3vQ3kE+kZzK2iNz+KAR0EL4L1QLzargyaHggDwGNwxZ0eKx0Gfeb3FCLAvskGF+
	VKrzpbf0e9j5f2+jowhFpPNKRmHVhU4kQQvJ5+RkL1uOi/k15/7UEB+gkomh2gfvVPCxb9VLCrz
	/e+3IxFwI1gdIPsUOBDduwp4AJU4N1lgdbB54BJNLtiR236EV0bsR5WW8Bpzhz+umxuJcbwW1aO
	XThit+zf9Qmso7OVLyE5CZdg1yqfaUXHkZp0sxIOtWKYh9GQ6kxNNbJmFIQYG92e8v7RVa3t4Y7
	YalupDfIYVqOwxkZTfDQC+ELied1M3Gg==
X-Received: by 2002:a05:620a:7005:b0:8ee:7878:af3e with SMTP id af79cd13be357-8fd18635115mr2321716785a.45.1777987847228;
        Tue, 05 May 2026 06:30:47 -0700 (PDT)
Received: from localhost ([185.141.119.121])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e7f8sm1344298785a.7.2026.05.05.06.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:30:44 -0700 (PDT)
Date: Tue, 5 May 2026 16:30:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2139/2816] fs/ntfs/attrib.c:2631 ntfs_attr_add()
 warn: variable dereferenced before check 'ni' (see line 2628)
Message-ID: <202605051951.OStHgx7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260505133039.Kfdup-m2disWqNA3KLvA8mHdfwO3r5p7Hh9AqCMoMdg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
commit: ae00c45e40f1eb19428865ee3a3f487a454bdc20 [2139/2816] ntfs: fix variable dereferenced before check ni in ntfs_attr_open()
config: alpha-randconfig-r071-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051951.OStHgx7p-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605051951.OStHgx7p-lkp@intel.com/

New smatch warnings:
fs/ntfs/attrib.c:2631 ntfs_attr_add() warn: variable dereferenced before check 'ni' (see line 2628)

Old smatch warnings:
fs/ntfs/attrib.c:2930 ntfs_attr_open() warn: variable dereferenced before check 'ni' (see line 2927)

vim +/ni +2631 fs/ntfs/attrib.c

495e90fa334828 Namjae Jeon   2026-02-13  2616  int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
495e90fa334828 Namjae Jeon   2026-02-13  2617  		__le16 *name, u8 name_len, u8 *val, s64 size)
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2618  {
495e90fa334828 Namjae Jeon   2026-02-13  2619  	struct super_block *sb;
495e90fa334828 Namjae Jeon   2026-02-13  2620  	u32 attr_rec_size;
495e90fa334828 Namjae Jeon   2026-02-13  2621  	int err, i, offset;
495e90fa334828 Namjae Jeon   2026-02-13  2622  	bool is_resident;
495e90fa334828 Namjae Jeon   2026-02-13  2623  	bool can_be_non_resident = false;
495e90fa334828 Namjae Jeon   2026-02-13  2624  	struct ntfs_inode *attr_ni;
495e90fa334828 Namjae Jeon   2026-02-13  2625  	struct inode *attr_vi;
495e90fa334828 Namjae Jeon   2026-02-13  2626  	struct mft_record *ni_mrec;
495e90fa334828 Namjae Jeon   2026-02-13  2627  
ae00c45e40f1eb Namjae Jeon   2026-05-01 @2628  	ntfs_debug("Entering for inode 0x%llx, attr %x, size %lld.\n",
ae00c45e40f1eb Namjae Jeon   2026-05-01  2629  			ni->mft_no, type, size);
                                                                ^^^^^^^^^^
Dereference

ae00c45e40f1eb Namjae Jeon   2026-05-01  2630  
495e90fa334828 Namjae Jeon   2026-02-13 @2631  	if (!ni || size < 0 || type == AT_ATTRIBUTE_LIST)
                                                     ^^
Checked too late.

495e90fa334828 Namjae Jeon   2026-02-13  2632  		return -EINVAL;
495e90fa334828 Namjae Jeon   2026-02-13  2633  
495e90fa334828 Namjae Jeon   2026-02-13  2634  	if (ni->nr_extents == -1)
495e90fa334828 Namjae Jeon   2026-02-13  2635  		ni = ni->ext.base_ntfs_ino;
495e90fa334828 Namjae Jeon   2026-02-13  2636  
495e90fa334828 Namjae Jeon   2026-02-13  2637  	/* Check the attribute type and the size. */
495e90fa334828 Namjae Jeon   2026-02-13  2638  	err = ntfs_attr_size_bounds_check(ni->vol, type, size);
495e90fa334828 Namjae Jeon   2026-02-13  2639  	if (err) {
495e90fa334828 Namjae Jeon   2026-02-13  2640  		if (err == -ENOENT)
495e90fa334828 Namjae Jeon   2026-02-13  2641  			err = -EIO;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

