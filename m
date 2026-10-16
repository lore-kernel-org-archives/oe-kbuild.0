Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CB42A178
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137535; cv=none; b=DklXuLkyHUwhW+U94EVmRzUCrmF5OVm+pC1+QBSv3kXGc7VnvAcHgNk6/teEHjL7c7cLFzAwgTFJ6A+mJIzPpzhTRtFih9I885jGBMKx5V5M9W8fBsp4X5R69aqXdldcojIpCY87yeqR1TIXwsIJ4B8u0bA4LVZFvmeDxxwVEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137535; c=relaxed/simple;
	bh=jCRKt2XU89OMC7gBAdYHQaXDL9OB2wG2XOum1jG4I6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CMtmhleWTzkTcIwt2VdH0XrASzEfQ9l27qINoyEQSox9pdRa66Uh3NDYgIyHE1lJbvzz89K5VxXTcNwJGiYBnD0d2KlvT4nooH7CyMHrB/Jm3mRs1kUATUrJEuq0ryZu68O2RzqQR0tJlxIRTesBlleRgBgjNyPpCPydgglD5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/iRt5HO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/iRt5HO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so55316415e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792137532; x=1792742332; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdDTPL+e3DfNdEsfD+HIy5AjVm5FA/QQsbvM5foi09A=;
        b=p/iRt5HO0YQ4hn/455FfMlQh8eRROCwjn68C7iG6slUny+7CWmqSUG0qOGcPIGG4bC
         9eQ4eDlhxOT5yDEPABnTtT4ZN6ibhoKwlU03EbZdnREzG8rnm98HOMmL8uUbAoqXlFrQ
         aT16Pla6WbbbIdO9zwQtyY4IS0GfnUgbDUMk2tuQBZOCkkARG4Jdz5ZEBqG1BWbBC7D1
         VRvWtpCbYZ0JREL4QqWRIEyfU0oTSZBZ62gkNGmV3dyLfWUKBZJPgjGO5h5d0ZH0JvIf
         SFggkoZtmrVJC1FBmQKV5kkPK/Blk0rxy2R0AmujRPnlQvKXgN3xfnavQsxBfi2dGyOK
         q5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137532; x=1792742332;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdDTPL+e3DfNdEsfD+HIy5AjVm5FA/QQsbvM5foi09A=;
        b=oEsyZW72nPEemJd/kZI2gsibhQkh2gN5wBxMal0V6JvGowj6ltiC+8DlAt3wl/0PUj
         uPcsMLKIVG9KETTblnmRK+iJwPPnuHySL/c6FjCeL6Pf/KXzWoNXO7nCnd1E8VDn3ohT
         yJ0Ul6Qsdtu/2kTKiYiESzfrU0QJGkffI0QdFPQan3kK4fVxQXmQBp9qKKiATBXLDykm
         FF3LjlAxFbKxrR/Gd/afgCqh7oQj39d2NM7EWXWApW0c1tqvfIhMH7a9dCAu2qVxBn7U
         NCy6lX/jRTqTSprrhCFylhEaLEK9ASZIcV+cjv/n+n4E4xRwV1NLeKrmIptErbS9sW0H
         LWig==
X-Gm-Message-State: AFq9FYKVF9IwCXAgmd/1bC6/ky7cqZNPLg0tiNiuYqeZ01yX2XOW8ee6
	4GQ7F4BPVON/HnQoMTTPX/vbhK0EsaBh177N/rdiL5EoW6N9A7SzT2TYh7FPRWFmiXD27g==
X-Gm-Gg: AYBFou0bIXHpddLBjhJnQdnhMoo8v2kkw3dhulfwJ0Sc+jiVvV+RMgiSTcZr9UGpIfR
	Lky/Z3dct2rEij1hNAVht/pqF/3EvqLhO03ztzxpe93TrwD19Pud3dibJbD3FJfssRbYc62q6gq
	1hTleKB8uWWSh5PgpNoQF392DGlYYGG88dme7WiBGEsCXzWduSx7t+I+/i914AVDsGmwuorFTmy
	hRysLYel3bk5Cu+PfzlEoQmMqdLlm6WEVTrFieUYqZLHmWbkPpCYgGhk1neSjoVhZGZ2tCDGc6v
	m7VuL7Jpcsfby+Dw6ehf6kOTEB4P13sLW/scsH/TjP8+X/tZhihXRnBT6fxWw59XU+ANKODwt5L
	cwQIPo8jzbeKa2gTzSWo7FAnGGNXGHSJsKV232kpvHXnBaO2zkucursVpYMdkblD77fofFIS/hs
	WXQrzINrCdDBiZz0pGta06Fn0os0xirHF+gjaktNja1ilLgxuQVoDvMcBmvSxaJAR7FpU=
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr360351215e9.15.1792137531460;
        Fri, 16 Oct 2026 00:58:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a9ea3bsm30374275e9.0.2026.10.16.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:58:50 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:58:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Zhang Yi <yi.zhang@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Subject: [tytso-ext4:dev 40/41] fs/ext4/inode.c:4518 ext4_iomap_writepages()
 warn: missing error code? 'ret'
Message-ID: <atHZN9YIl8T2E0tK@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   8c4f6e3376348fc3162eed86a05b933921c8f9ed
commit: bdcbb0f19e921c7ea3241f55922032dff23d1d26 [40/41] ext4: partially enable iomap for the buffered I/O path of regular files
config: x86_64-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160314.PLMEXaOJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610160314.PLMEXaOJ-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:4518 ext4_iomap_writepages() warn: missing error code? 'ret'

vim +/ret +4518 fs/ext4/inode.c

a304299a40d92c Zhang Yi 2026-10-09  4488  static int ext4_iomap_writepages(struct address_space *mapping,
a304299a40d92c Zhang Yi 2026-10-09  4489  				 struct writeback_control *wbc)
a304299a40d92c Zhang Yi 2026-10-09  4490  {
a2e096bf59634f Zhang Yi 2026-10-09  4491  	struct inode *inode = mapping->host;
a2e096bf59634f Zhang Yi 2026-10-09  4492  	struct super_block *sb = inode->i_sb;
a2e096bf59634f Zhang Yi 2026-10-09  4493  	long nr = wbc->nr_to_write;
a2e096bf59634f Zhang Yi 2026-10-09  4494  	int alloc_ctx, ret;
a2e096bf59634f Zhang Yi 2026-10-09  4495  	struct iomap_writepage_ctx wpc = {
a2e096bf59634f Zhang Yi 2026-10-09  4496  		.inode = inode,
a2e096bf59634f Zhang Yi 2026-10-09  4497  		.wbc = wbc,
a2e096bf59634f Zhang Yi 2026-10-09  4498  		.ops = &ext4_writeback_ops,
a2e096bf59634f Zhang Yi 2026-10-09  4499  	};
a2e096bf59634f Zhang Yi 2026-10-09  4500  
a2e096bf59634f Zhang Yi 2026-10-09  4501  	ret = ext4_emergency_state(sb);
a2e096bf59634f Zhang Yi 2026-10-09  4502  	if (unlikely(ret))
a2e096bf59634f Zhang Yi 2026-10-09  4503  		return ret;
a2e096bf59634f Zhang Yi 2026-10-09  4504  
53fe71a6bcad0f Zhang Yi 2026-10-09  4505  	/*
53fe71a6bcad0f Zhang Yi 2026-10-09  4506  	 * Submit the pending zeroed EOF block range if the entire
53fe71a6bcad0f Zhang Yi 2026-10-09  4507  	 * writeback range lies beyond it.
53fe71a6bcad0f Zhang Yi 2026-10-09  4508  	 */
53fe71a6bcad0f Zhang Yi 2026-10-09  4509  	ext4_iomap_wb_submit_zeroed_eof(inode, wbc);
53fe71a6bcad0f Zhang Yi 2026-10-09  4510  
a2e096bf59634f Zhang Yi 2026-10-09  4511  	alloc_ctx = ext4_writepages_down_read(sb);
bdcbb0f19e921c Zhang Yi 2026-10-09  4512  	/*
bdcbb0f19e921c Zhang Yi 2026-10-09  4513  	 * Does ext4_change_inode_journal_flag() change the inode's
bdcbb0f19e921c Zhang Yi 2026-10-09  4514  	 * buffered I/O path?
bdcbb0f19e921c Zhang Yi 2026-10-09  4515  	 */
bdcbb0f19e921c Zhang Yi 2026-10-09  4516  	if (!ext4_inode_buffered_iomap(inode)) {
bdcbb0f19e921c Zhang Yi 2026-10-09  4517  		ext4_writepages_up_read(sb, alloc_ctx);
bdcbb0f19e921c Zhang Yi 2026-10-09 @4518  		return ret;

Either return 0 or an error code here, but not ret.

bdcbb0f19e921c Zhang Yi 2026-10-09  4519  	}
bdcbb0f19e921c Zhang Yi 2026-10-09  4520  
a2e096bf59634f Zhang Yi 2026-10-09  4521  	trace_ext4_writepages(inode, wbc);
a2e096bf59634f Zhang Yi 2026-10-09  4522  	ret = iomap_writepages(&wpc);
a2e096bf59634f Zhang Yi 2026-10-09  4523  	trace_ext4_writepages_result(inode, wbc, ret, nr - wbc->nr_to_write);
a2e096bf59634f Zhang Yi 2026-10-09  4524  	ext4_writepages_up_read(sb, alloc_ctx);
a2e096bf59634f Zhang Yi 2026-10-09  4525  
a2e096bf59634f Zhang Yi 2026-10-09  4526  	return ret;
a304299a40d92c Zhang Yi 2026-10-09  4527  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

