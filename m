Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4871A6816
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013415; cv=none; b=Y2M2ouNYwWHQinV0THOYMMVC9k+1OF8eIL8xKicesjoOFdTzYIzFHKeIPDu8DRaxGeua2hRYDB7fdl82QyBcltG8Noz3D8Qrl8VL9iroUzwJit4n5Br2Ep/21HwVWuofawu9jS4MdBHGV0HGfMbb44AMJfWSFajiShSBctrE7Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013415; c=relaxed/simple;
	bh=ECRTp6Dt6BAfgb7bB+KsMniNscuLqzmQLNvjFQWsPFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhKcOi3TjYjquBv/TDnPVZ8mqUOaqrwHwz1CM3VDRg4DjEZdqPQdT83Q07DnugObBQT6mchbYm4mkVmO63fTCmpQ/cHa33rJbDQQHQe+CdDIy5z5av1Em2agS4NDnbGB481yvgA9CMZnYp/hlKWzhRDvhn6IbOQT0hmxnEa/WQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsZ+QoOC; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsZ+QoOC"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso1582052a34.2
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013413; x=1784618213; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ygVWxQXzEzuCwXExWLph5jlSxbgZZtYL5mhnjkk/jc=;
        b=jsZ+QoOCU0B0zqbvbIMp7Zomkg8tLkU8o/yo93raW/osYDemgr/riPnJd75NXz47RY
         OBUbEU6Uv06ctwl3+6loBkZw+ILv/X6iRFXy0QqiziLTZ66crXXrIUxT5y2FUkgKkHXz
         YAtktP5XjEBqwkKxKFno/05DiczGt/bH3ge2Ta75j2lZLQR6FR+6tkTsjoPoBOLJZ+pr
         9GNrbugR6ytM4zHpzLB3TkcEJisTt2TYJTnOQoEKlLGPWZbum4VEyt3lFTT9rrttaIh5
         nLis3AlT01O9P7sgOrgRq/OWkaxBxDBgRVAhtItymdnAlHHi3DaCNYCRXY+91PKswAJb
         Gj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013413; x=1784618213;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ygVWxQXzEzuCwXExWLph5jlSxbgZZtYL5mhnjkk/jc=;
        b=RIHPi6qn3bzib9BJl5LMsaSZ2nuEiBtSlkkv4hXKFtevXaGrwaH3oeJRdCth7IYfb6
         mxKtCQzP4jl8oNPs3vNMj7/8EbCwKp/mNNKq0zHNU52+J8JeEn27zI3yLx3SS/wBOR/q
         xte8ZwZMjfryrYS0+ZNrA8Tt4VONdOQdwIsdB6FwtiBMCVzIP8pOP1VNTC+n6YKniHUF
         TehhwbrWno04AcBfsPZh3OHwr0MZCpJnIThQJM1zVUnhheqWetiQ7Hk4ibKewMkmCPIj
         w1yugHdqtYQCFeG/ItLMp+X030yq39Vtr0gHxcLZpZn5En/26Pxpc/WvL6v2c/4mAYBm
         OlQA==
X-Gm-Message-State: AOJu0Yx+0dAGvp61dou8OSvn9rDIioGX4MZNCl/a6F6u2CxHKNT4fuBv
	8wssXPIoZh+Eo+3kaXWgpBqNtmlK2vD6EGv6GBaaGX4z1DD575NA6HGKYaTn94PBCdw=
X-Gm-Gg: AfdE7cno80Sme0ezRcmNvMMVyZdB9wIQE3Sxlgglpn2eey1py8fgM34sz+A1110h4WQ
	Re+yuU3BQovegCbwoVEsboPSzBFpyUKFhLp21jKGG1WPJvlF0y8mUu6AVO9NwE9LJXLBcdDdV+W
	ZLqgY/9r2wjmHHyapIYrzMLyORHUUfWVbBaAxpfydSsiodi/LfDHmckYZMriMT5IlvJwJjOfAj3
	wNmZWR3bPtndcnlV5iG7H5vSCECpiOMz8wHNUeHt5eh+mRtFumyb2hARdXJWLfoZE+qgQ9xddL6
	JeNOAXJLodPTtFk8rvkj1WiUgVw8+pGdSgJZ4exroP2g/iCfsYSwepWbX5BpVQgMhnkf5o88ZFT
	pOMT60D2+FaN30njacSA7kLCfjHWGBRvnSTauhZ3NmI0exwieO8xFETO4+9URPPYw0H/9EunSHN
	lHDu3+
X-Received: by 2002:a05:6830:310b:b0:7e9:e1ec:c818 with SMTP id 46e09a7af769-7ec09802247mr6897665a34.25.1784013412721;
        Tue, 14 Jul 2026 00:16:52 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2229b4bdsm5414439a34.1.2026.07.14.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:16:51 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:16:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_copy_file_range 3/6] fs/read_write.c:1499
 copy_file_fs_cmp() error: we previously assumed 'f_out->f_op' could be null
 (see line 1496)
Message-ID: <202607140512.I7Hcmuea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260714071646.wB5C-I8eAaOfvUWXZmkJx6jCr_gje4ONbySkI96tcqs@z>

tree:   https://github.com/amir73il/linux ovl_copy_file_range
head:   4421f88f42bb20b8a6f9fd56c5c877a1088d0e00
commit: b86e287575a3f81b04ef92b5bb46f87329fc314f [3/6] fs: add support for copy file range from another fs
config: i386-randconfig-141-20260714 (https://download.01.org/0day-ci/archive/20260714/202607140512.I7Hcmuea-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607140512.I7Hcmuea-lkp@intel.com/

New smatch warnings:
fs/read_write.c:1499 copy_file_fs_cmp() error: we previously assumed 'f_out->f_op' could be null (see line 1496)

Old smatch warnings:
fs/read_write.c:1631 vfs_copy_file_range() error: we previously assumed 'file_out->f_op->copy_file_range' could be null (see line 1614)

vim +1499 fs/read_write.c

cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1491  static int copy_file_fs_cmp(struct file *f_in, struct file *f_out,
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1492  			    unsigned int flags)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1493  {
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1494  	if (flags & COPY_FILE_SPLICE)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1495  		return FS_COPY_SPLICE;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13 @1496  	else if (f_out->f_op && f_out->f_op->copy_file_range &&
                                                                 ^^^^^^^^^^^
if ->f_op is NULL

cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1497  		 f_out->f_op->copy_file_range == f_in->f_op->copy_file_range)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1498  		return FS_COPY_SAME_FS;
b86e287575a3f8 Amir Goldstein 2026-07-13 @1499  	else if (f_out->f_op->fop_flags & FOP_CROSS_FS_COPY)
                                                                 ^^^^^^^^^^^^^^^^^^^^^^
then we are toasted.

b86e287575a3f8 Amir Goldstein 2026-07-13  1500  		return FS_COPY_FROM_OTHER_FS;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1501  	else if (file_inode(f_in)->i_sb == file_inode(f_out)->i_sb)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1502  		return FS_COPY_SAME_SB;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1503  	else
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1504  		return FS_COPY_CROSS_FS;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1505  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

