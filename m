Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E61D7E28
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725391848; cv=none; b=gBhS0agiiFbi6yaTLBL9G929EOdhScTa66m2Z9PjGf4wktHjGEMkz4j1dT5CpyCdPfBJ1KL7zkuCs5fx3gMSn6fsBCw0aXiJ9rUMMwZMEqw7jkpkC1QEr7S1rfsWjmMvj+5eNwMHngnTuxQ3Y2k9jUtcctUeBq4uU85LZ+mB/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725391848; c=relaxed/simple;
	bh=Y/SEZ4I8UHWHlSNigX7hDLaLKLrtAIdDnOtCtHx5lds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtY83dpQh9A5BkoiYt4zTzUQ2zHllrEGsfWwJzzNaaNpsc9qWnHeNi+iFD7ZDFV7c2ugpTmQ0vxjMVw3sdrgjAS3AWlcIH/FgxJl81EOJKVMJPZDKuvKhQtJNbRsdOQTedMB/qMBAQE5b+9BJ7+uAPYDhg0sKuU1tU5DfOXbxas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSba6Dmy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSba6Dmy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so48443945e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 03 Sep 2024 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725391845; x=1725996645; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZ5107DvLVPYmOTJ6mUPC5uTd95yXvVexG80jBPzhkA=;
        b=pSba6Dmyg8QWZmGNnyWZtxRo6U0EIps9UoKC6bkwIgUZ1OLeUyuOR62GUvWBuAQBT+
         aesr8nh6YruGMfscZwhTNuSkMiKpnN0r60wTot2tAPb9MrUa8mmhY/QqXeFE8YdWK6uw
         /6gaMzBMOSQ96M8hj4/0lh7Nzlqat+za2zCmZZLK/D1bkeNTUCNMfjq00C0589Bu5bpg
         7EVCIeyYTbzLQGHLynoxk3Uqx1rt/XGy45UrIPBZvN1gZrAATpOt9JzdyEKi7tciXMck
         9UOhdIsyNV7C7GhiF+ikLwieu6pMsPZ/HBo1w3uf8bGkbPzWotkNMKSbZD48kK9qo1yz
         sh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725391845; x=1725996645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZ5107DvLVPYmOTJ6mUPC5uTd95yXvVexG80jBPzhkA=;
        b=ke+20QbkwRZpZzcY3rhx6Xm+UZUJbqFJCXCqvRjDzKV2FyxtLuRitdzI0kItrk4Q0W
         pLFdOmXmrc5o5oZeUKKF3D/15U/zXHJYYAcLXQ+IBOPVRZauoKWdMG2bmuudzFsvRjKo
         2hTj9QYKN2SnTeXZEGSXAdOI76+wVG+gMWS0m4w5KtZAfQR5KyaVKRso+Xi62Bb02KpY
         lgb7vfF+srm+xTbZ38UhlD8jNU8pOsj5pP4luvxprWA4QdTKvWtetzdfkfPJDVW7bvT/
         klHi0GEoodoPJb14Tqs2/PixiSDEegjOtN8Ida/jyJygB8QN4CWTT2Hn3mj/07tAIN6q
         zGoQ==
X-Gm-Message-State: AOJu0YyN0aDSp3VaCrqh8VRJHTO9MEj2i7USCUezzfRFRENR3lcsK9RE
	p9GD4HdvzKng7IH6hdzzUKBR5s/yCJ/l8foyVSbJoHx3WF1HJRLtnizZ6eimxowS7LITeDTfFXh
	V
X-Google-Smtp-Source: AGHT+IHvdpL/7K214Y4Dr3WCBKGqNURKk6/IKcCmvKnGpyo5eLeWljvQVDALtLLbUOLYR+LX6Hrptg==
X-Received: by 2002:a05:600c:1c1a:b0:426:593c:935f with SMTP id 5b1f17b1804b1-42bd731ee1bmr73326245e9.1.1725391844532;
        Tue, 03 Sep 2024 12:30:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639671dsm217740435e9.5.2024.09.03.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 12:30:44 -0700 (PDT)
Date: Tue, 3 Sep 2024 22:30:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhang Yi <yi.zhang@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-20240830073800.2131781-1-yi.zhang@huaweicloud.com
 8/10] fs/ext4/extents.c:4713 ext4_do_fallocate() error: uninitialized symbol
 'len_lblk'.
Message-ID: <7a5bcc8a-b4fb-485e-9d96-423e3862e3c4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/riteshharjani/linux notmuch-20240830073800.2131781-1-yi.zhang@huaweicloud.com
head:   67214af3781b6c7fc5dcc524eb0826d638c39fdc
commit: f265e7a5e7cd772107b3876f91035bc7ab72013c [8/10] ext4: factor out ext4_do_fallocate()
config: riscv-randconfig-r072-20240901 (https://download.01.org/0day-ci/archive/20240903/202409032257.MlcGmpHd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409032257.MlcGmpHd-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:4713 ext4_do_fallocate() error: uninitialized symbol 'len_lblk'.

vim +/len_lblk +4713 fs/ext4/extents.c

f265e7a5e7cd772 Zhang Yi      2024-08-30  4665  static long ext4_do_fallocate(struct file *file, loff_t offset,
f265e7a5e7cd772 Zhang Yi      2024-08-30  4666  			      loff_t len, int mode)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4667  {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4668  	struct inode *inode = file_inode(file);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4669  	loff_t end = offset + len;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4670  	loff_t new_size = 0;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4671  	ext4_lblk_t start_lblk, len_lblk;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4672  	int ret;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4673  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4674  	trace_ext4_fallocate_enter(inode, offset, len, mode);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4675  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4676  	inode_lock(inode);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4677  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4678  	/* We only support preallocation for extent-based files only. */
f265e7a5e7cd772 Zhang Yi      2024-08-30  4679  	if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))) {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4680  		ret = -EOPNOTSUPP;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4681  		goto out;

goto

f265e7a5e7cd772 Zhang Yi      2024-08-30  4682  	}
f265e7a5e7cd772 Zhang Yi      2024-08-30  4683  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4684  	if (!(mode & FALLOC_FL_KEEP_SIZE) &&
f265e7a5e7cd772 Zhang Yi      2024-08-30  4685  	    (end > inode->i_size || end > EXT4_I(inode)->i_disksize)) {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4686  		new_size = end;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4687  		ret = inode_newsize_ok(inode, new_size);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4688  		if (ret)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4689  			goto out;

goto

f265e7a5e7cd772 Zhang Yi      2024-08-30  4690  	}
f265e7a5e7cd772 Zhang Yi      2024-08-30  4691  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4692  	/* Wait all existing dio workers, newcomers will block on i_rwsem */
f265e7a5e7cd772 Zhang Yi      2024-08-30  4693  	inode_dio_wait(inode);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4694  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4695  	ret = file_modified(file);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4696  	if (ret)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4697  		goto out;

goto

f265e7a5e7cd772 Zhang Yi      2024-08-30  4698  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4699  	start_lblk = offset >> inode->i_blkbits;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4700  	len_lblk = EXT4_MAX_BLOCKS(len, offset, inode->i_blkbits);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4701  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4702  	ret = ext4_alloc_file_blocks(file, start_lblk, len_lblk, new_size,
f265e7a5e7cd772 Zhang Yi      2024-08-30  4703  				     EXT4_GET_BLOCKS_CREATE_UNWRIT_EXT);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4704  	if (ret)
f265e7a5e7cd772 Zhang Yi      2024-08-30  4705  		goto out;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4706  
f265e7a5e7cd772 Zhang Yi      2024-08-30  4707  	if (file->f_flags & O_SYNC && EXT4_SB(inode->i_sb)->s_journal) {
f265e7a5e7cd772 Zhang Yi      2024-08-30  4708  		ret = ext4_fc_commit(EXT4_SB(inode->i_sb)->s_journal,
f265e7a5e7cd772 Zhang Yi      2024-08-30  4709  					EXT4_I(inode)->i_sync_tid);
f265e7a5e7cd772 Zhang Yi      2024-08-30  4710  	}
f265e7a5e7cd772 Zhang Yi      2024-08-30  4711  out:
f265e7a5e7cd772 Zhang Yi      2024-08-30  4712  	inode_unlock(inode);
f265e7a5e7cd772 Zhang Yi      2024-08-30 @4713  	trace_ext4_fallocate_exit(inode, offset, len_lblk, ret);
                                                                                                 ^^^^^^^^

Uninitialized

f265e7a5e7cd772 Zhang Yi      2024-08-30  4714  	return ret;
f265e7a5e7cd772 Zhang Yi      2024-08-30  4715  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

