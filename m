Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520FD1E7A26
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723036463; cv=none; b=U1JGGvJR/h/mck5r1f6Mgp45DZqWQlOtu24jVpaui3Cz1TbCIYWw/okZNg3aoOvGNHHeBQUul+MDLEQTEE/emnzhRLgdJr/9qSqLK5iD9YpbV9a5R/9TRe8wy5lOH7JSgKESVJbMkfS1AoDQv04f2hbWxWREG9WS6kwxxe+crOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723036463; c=relaxed/simple;
	bh=odzGnnxO/ts2KuDjpBIAB3FI15uc4mVhBXWFfSOJcKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TcjB6M7veniYAStub15RDM3Sn2YZBNgsHc4PK/t0YNRTnsg2B0py673OwQOJatr4oXy1jfU7sQ2igx5HgGDZXzWRjMoGFAmXUsj0RXeDb5jAFl/b333vcJ5+RwmEfE/yZQm3/Pt0laz9Uy2Hr5scmRrBqvTGJhjAxN+9K/LOI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epPpjtVi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epPpjtVi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428e0d18666so11967725e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Aug 2024 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723036459; x=1723641259; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jM6X8Ydp59P8PBOF42t5kMHir+yd+GqTuVe2tD6qM44=;
        b=epPpjtVi9VG7SRkGFjXi+ZJlUAGSZq+DXIw5Ymy3yktHbjQVjxOh/ag3hNSmTJAitJ
         kUHxp7sEmrowWf2Gk8TFIHSPpKNTvNO7RywNlPtk7r3sofKjFfj72VJMezok9dOscpvQ
         wao9IpiFys4Mae+PSQIB9OaKHpBcbuTtzCfy4oQpINuy+4Mz0SdKNyrcWkKcAm4112Gu
         FJUDdzVYTXbOUMPold46vQvO94PD48hAaGdSMhSPhELAP28vUjytTqLvwPiQv2jXc8pw
         QaAP3PpV2AUZhnbat/vX2n+mSP/jAaqFH46nhubvoLwxqrx9TQ29ZK5Q9CPcEYmJI3x8
         dHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723036459; x=1723641259;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jM6X8Ydp59P8PBOF42t5kMHir+yd+GqTuVe2tD6qM44=;
        b=TnPq6qPPiNJ38AHORnPzELP6cOn3EbaYQbC5fb8gYRwXgvkdmkVrKg10cPrIAV5JfN
         a/LEe+DRPEBABKAVCYGxvW0UX3nm08hhIw08HHKqrqxj5u9Ir91IzR7drjxbf8oXlzCe
         q4k34vcWTuJWMKLM7EyihTm8PyFX3btL5WHtdt8al9r1EpjCJczO3n519MsIeKtke+pk
         OlQc+qBJO1Qx4Q2IFQi6THc3Z5utTB2L3/Qf/NuDo4BXC7nGPVzYFhN0gTqqI+CpTp2V
         voVFnBp+JyjyGw77fk0xaDkhVMdZDYGcfkb7grNQ31x6Hd3Y/X55tl3u4pS/fEGCgHAV
         RuQg==
X-Gm-Message-State: AOJu0Yy0DmpJjk45CZsrTBhiuTdM50tTgH87qg8aj1D/8MmEE7PXqA1W
	+2O4PEwyi1rWlbLFzSsDuUZ6YrT6949RMg7vBhlPGik9XlmC+o6aj88xX2yZ3r/1vHUShwAcqpq
	2
X-Google-Smtp-Source: AGHT+IEQbkJqFTP4c7679kF3t68vhH6mm7YNl+MYqzLyuajep4s/eioKcmA4Me0W+o4zwV7pP+c9Bg==
X-Received: by 2002:a05:600c:a47:b0:427:fa39:b0a1 with SMTP id 5b1f17b1804b1-428e6b930e9mr113937625e9.36.1723036459139;
        Wed, 07 Aug 2024 06:14:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905796a29sm29361705e9.10.2024.08.07.06.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:14:18 -0700 (PDT)
Date: Wed, 7 Aug 2024 08:14:16 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 48/60] fs/xfs/xfs_rtalloc.c:1157
 xfs_growfs_rt_prep_rtgs() error: uninitialized symbol 'error'.
Message-ID: <45b0c4af-7d71-4ba4-8404-84898de24888@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap-rebase
head:   a6af886fd0b4ff036a3e9fcc4b9cb0b8db41a36c
commit: fd68ff6669695c8885e8bea955960c089bbefd49 [48/60] xfs: grow the realtime section when realtime groups are enabled
config: x86_64-randconfig-161-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071825.AfsI6d6W-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408071825.AfsI6d6W-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1157 xfs_growfs_rt_prep_rtgs() error: uninitialized symbol 'error'.

vim +/error +1157 fs/xfs/xfs_rtalloc.c

fd68ff6669695c Darrick J. Wong   2024-08-04  1128  static int
fd68ff6669695c Darrick J. Wong   2024-08-04  1129  xfs_growfs_rt_prep_rtgs(
fd68ff6669695c Darrick J. Wong   2024-08-04  1130  	struct xfs_mount	*mp,
fd68ff6669695c Darrick J. Wong   2024-08-04  1131  	xfs_rfsblock_t		rblocks,
fd68ff6669695c Darrick J. Wong   2024-08-04  1132  	xfs_extlen_t		rextsize)
fd68ff6669695c Darrick J. Wong   2024-08-04  1133  {
fd68ff6669695c Darrick J. Wong   2024-08-04  1134  	int			error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1135  
fd68ff6669695c Darrick J. Wong   2024-08-04  1136  	/* Set up the realtime superblock if we're adding a new rt section. */
fd68ff6669695c Darrick J. Wong   2024-08-04  1137  	if (xfs_has_rtsb(mp) && mp->m_sb.sb_rblocks == 0) {
                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

fd68ff6669695c Darrick J. Wong   2024-08-04  1138  		error = xfs_growfs_rt_init_super(mp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1139  		if (error)
fd68ff6669695c Darrick J. Wong   2024-08-04  1140  			return error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1141  	}
fd68ff6669695c Darrick J. Wong   2024-08-04  1142  
fd68ff6669695c Darrick J. Wong   2024-08-04  1143  	/* Make sure the /rtgroups dir has been created */
fd68ff6669695c Darrick J. Wong   2024-08-04  1144  	if (!mp->m_rtdirip) {
                                                            ^^^^^^^^^^^^^^
Is it possible for both of these conditions to be false?

fd68ff6669695c Darrick J. Wong   2024-08-04  1145  		struct xfs_trans	*tp;
fd68ff6669695c Darrick J. Wong   2024-08-04  1146  
fd68ff6669695c Darrick J. Wong   2024-08-04  1147  		error = xfs_trans_alloc_empty(mp, &tp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1148  		if (error)
fd68ff6669695c Darrick J. Wong   2024-08-04  1149  			return error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1150  		error = xfs_rtginode_load_parent(tp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1151  		xfs_trans_cancel(tp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1152  
fd68ff6669695c Darrick J. Wong   2024-08-04  1153  		if (error == -ENOENT)
fd68ff6669695c Darrick J. Wong   2024-08-04  1154  			error = xfs_rtginode_mkdir_parent(mp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1155  	}
fd68ff6669695c Darrick J. Wong   2024-08-04  1156  
fd68ff6669695c Darrick J. Wong   2024-08-04 @1157  	return error;
                                                               ^^^^^
If so then this could be uninitialized

fd68ff6669695c Darrick J. Wong   2024-08-04  1158  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

