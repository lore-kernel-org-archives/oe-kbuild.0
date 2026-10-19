Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792446941;
	b=3NSJXhSwF5GqgReTJlFAH5N/bqTODX2CrHJ7+uQBzL0fIfsyP9vq854RYM33a6ZqkHqb
	 QkGbb1N/qTmI3P78iMvTsZe+AAhWRIL6ECibHPJw4XhymurnjFstjj+xECvgcqRGlIJII
	 hz1dqzWxC1h4xLNUej8S/TS+HZGmZ72s1ARClQLP/a8iw+NrMTpdKTALYrk0qKXp92QEb
	 6Geb3t7IXIAlgb7NK8uF9z10r9CH2WYyH6psmpnj63TmkyH4lWj7+4Ms1atgLEzHN7vZ+
	 6hluaTS2fy6tMPIF46FONUfjLY1gpLHPT376hBfF8Nk6wc7qFTsqR367AegrfpYzzTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=7nqzsxDeAbyQEfsMIa+g7eYz02Qq3lqulj3sSgYqTS0=;
	b=LWJZ9oubKigKgf5RdDD0mexInm9rBMcNUgPFrDVcleNG/0ZVk8SssyDu8XHpIsurcC19
	 2OrVPdAd25QJvAQHG7F62eycQ4KGzJ6yGNpPwV9vLWLjBRxHfoo+68L5mjLrbS0xwkZ66
	 WqoXZXH0D/8FofQODnsDYHsfxR2CO5dB65wiUGyh5hFlwZvx+Y+t2k+J5O5nJJ+SL3Bii
	 YxKObEnpq6gY0nR/QEkbQAgLcetSca8uqZd76w9wvW5V6sNUSq4r9p1on7AICgeK5hWJo
	 x833WAHQ1khLvJZyjfzkKltIucVpBwdbowMopa7wlG0MhgVXIlRhqUlUOZDBKBocloQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NfgO7Cs3;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE448606A31A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 21:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE448606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NfgO7Cs3
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso29283355e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792446939; x=1793051739; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7nqzsxDeAbyQEfsMIa+g7eYz02Qq3lqulj3sSgYqTS0=;
        b=NfgO7Cs3h6pJcHFi2YwDThRzKvN/2rqv+svxw1gmt75zpnQHk75HY/jR7tp3vQCYyW
         qXErIWK5bwiwnDUstdAo5d6G/AcBt7KYvy1bhI6QgeDWnB/1QzjlbFoBkaRjZ5bem+Ga
         VCQ3CpV2jhhGNgwJflAb+FG5bphfb/k9zeIMOFPJUU51cwy7pVyJpnsYc+Z6+YLRBGZk
         FpuPdJYFqRQGvdlRYw3kNt+PnsYqDOyZysEPVa7Pp1r4ptU5oKhlLl9De3OvqyUkGkVX
         E/Hcekmm/cje0gktOMVvV0RNdOat7auKYqpNcUbxLqA8CHL1WUIKinU8aWwi0cIowyeE
         x4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792446939; x=1793051739;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nqzsxDeAbyQEfsMIa+g7eYz02Qq3lqulj3sSgYqTS0=;
        b=dKZWGrvwnKOivhkvIEosmsa8U/qmGrRbskNaI5uAhTS3dbaF3pyJpvNWqUHvp0Xpsc
         /g4Fzf45QpZ3BH4WrtcnCpP2YlrRrOSQCVrDXrME8q6FeoRT/i+0hkmSn0AwUJyTg0du
         LXBiB1rykG6DXYGB8mrV/q6YqjuDgEGACHsKQC/bI99zp6qat/CPUUi7rJvmsqUVPv86
         15ZUavLAHfz+svbEOF254M9cuPzWNylOmE76DCpZz2pvG0+CfYwsSaErAIb3zVKR9NTp
         SRG92z5bp5KweaRjhaXuu6otYOvMkp/P8S8Os1x25p9k4HWUGFdrN1M6ngA2LPmLU8GU
         ahPA==
X-Gm-Message-State: AFq9FYLeoF+dWyHAxpt5p4zj07w2kVjVdoAmM6vZENY63EA5izWkZc+R
	JLhEzY3pqohty5xtJpwbm0QX9+QQ9UsoKm5G1OJN1P3g1KhRuC77n4sfrV5ty7X+Tg==
X-Gm-Gg: AYBFou1rN3BjZcLYM5HzWVmUbDC3dKhMVNrfqPMF+2jrBS7DWkxvTW3bKGvIsmFLwmY
	tWesdU/srMPHUYuRRLxh8pe0R5XuMBn9spmXCrte0XYRvH9icP79aBjzgePFTJaxdeViq5bJFuC
	3c6b0ZeLeQPcrebgGRaC/NSyvsSxgE3VS72vXzy16uNOIfaKE76z8v+gvj93jtOCCFwAR6ezDOs
	xzZpDbuuS+JVA9m9tQbtVu9uWzckiRChggxB9d+e0Iv3bD685Cxvis6jmb28ehAZWOqNfV/8AHh
	Vyafp+qJXI/VbAp8qHPfdvQgkAxOwOsonOJgBDnjC7aweVl/idU6Qln7ywesVGFERZGyfr7rPsV
	fENbxqO5yx7LT8MUA0xnfokhgej6UchO+YgyEikhYt0lBroisJ3U/S6VRbdL5BM+5L3sKiucIha
	vTzB/F4SWg+LHquzO1Cs2vvBpyxjFubFixy9700FxcSJ1F60FSxh1W4bMwpsLEGCB4i50Eh19ZC
	4Xjw1PZ/d7gnvAmqwfmxg+Bbx9pOQ8z1E3cdG3G53OR
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr243766955e9.23.1792446938577;
        Mon, 19 Oct 2026 14:55:38 -0700 (PDT)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dd2a2sm1691606f8f.7.2026.10.19.14.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:55:37 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:55:33 +0000
From: Marco Elver <elver@google.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev
Subject: Re: [linux-next:master 2294/18293] fs/ext2/super.c:1040:7: warning:
 writing variable 's_mount_state' requires holding spinlock '_res->s_lock'
 exclusively
Message-ID: <ataR1cznaBt-6ge2@elver.google.com>
References: <202610191233.W2EJXnGr-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610191233.W2EJXnGr-lkp@intel.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Please ignore: https://github.com/ClangBuiltLinux/linux/issues/2187
It's an unstable Clang issue.

On Mon, Oct 19, 2026 at 12:32PM +0200, kernel test robot wrote:
> :::::: 
> :::::: Manual check reason: "only suspicious fbc files changed"
> :::::: 
> 
> BCC: lkp@intel.com
> CC: llvm@lists.linux.dev
> CC: oe-kbuild-all@lists.linux.dev
> TO: Timothy Day <timday@thelustrecollective.com>
> CC: Jan Kara <jack@suse.cz>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> commit: 9708538ba204d20aa9a5936530862254dcbc6f70 [2294/18293] ext2: enable context analysis support for ext2 filesystem
> :::::: branch date: 3 days ago
> :::::: commit date: 7 weeks ago
> config: riscv-randconfig-2001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191233.W2EJXnGr-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191233.W2EJXnGr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202610191233.W2EJXnGr-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/ext2/super.c:1040:7: warning: writing variable 's_mount_state' requires holding spinlock '_res->s_lock' exclusively [-Wthread-safety-precise]
>     1040 |         sbi->s_mount_state = le16_to_cpu(es->s_state);
>          |              ^
>    fs/ext2/super.c:1040:7: note: found near match 'EXT2_SB(sb).s_lock'
> >> fs/ext2/super.c:1138:8: warning: writing variable 's_rsv_window_root' requires holding spinlock '_res->s_rsv_window_lock' exclusively [-Wthread-safety-precise]
>     1138 |                 sbi->s_rsv_window_root = RB_ROOT;
>          |                      ^
>    fs/ext2/super.c:1138:8: note: found near match 'EXT2_SB(sb).s_rsv_window_lock'
>    2 warnings generated.
> 
> 
> vim +1040 fs/ext2/super.c
> 
> eab61d3260d76b3 Eric Sandeen      2025-02-23   866  
> eab61d3260d76b3 Eric Sandeen      2025-02-23   867  static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   868  {
> eab61d3260d76b3 Eric Sandeen      2025-02-23   869  	struct ext2_fs_context *ctx = fc->fs_private;
> eab61d3260d76b3 Eric Sandeen      2025-02-23   870  	int silent = fc->sb_flags & SB_SILENT;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   871  	struct buffer_head * bh;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   872  	struct ext2_sb_info * sbi;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   873  	struct ext2_super_block * es;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   874  	struct inode *root;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   875  	unsigned long block;
> eab61d3260d76b3 Eric Sandeen      2025-02-23   876  	unsigned long sb_block = ctx->s_sb_block;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   877  	unsigned long logic_sb_block;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   878  	unsigned long offset = 0;
> d09099051057bba Chengguang Xu     2018-02-26   879  	long ret = -ENOMEM;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   880  	int blocksize = BLOCK_SIZE;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   881  	int db_count;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   882  	int i, j;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   883  	__le32 features;
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16   884  	int err;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   885  
> bf4afc53b77aeaa Linus Torvalds    2026-02-21   886  	sbi = kzalloc_obj(*sbi);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   887  	if (!sbi)
> cea845cdef4f509 Christoph Hellwig 2021-11-29   888  		return -ENOMEM;
> 18a82eb9f980b5e Pekka J Enberg    2009-01-07   889  
> 18a82eb9f980b5e Pekka J Enberg    2009-01-07   890  	sbi->s_blockgroup_lock =
> bf4afc53b77aeaa Linus Torvalds    2026-02-21   891  		kzalloc_obj(struct blockgroup_lock);
> 18a82eb9f980b5e Pekka J Enberg    2009-01-07   892  	if (!sbi->s_blockgroup_lock) {
> 18a82eb9f980b5e Pekka J Enberg    2009-01-07   893  		kfree(sbi);
> cea845cdef4f509 Christoph Hellwig 2021-11-29   894  		return -ENOMEM;
> 18a82eb9f980b5e Pekka J Enberg    2009-01-07   895  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   896  	sb->s_fs_info = sbi;
> 93d44cb275f3eba Miklos Szeredi    2007-10-16   897  	sbi->s_sb_block = sb_block;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   898  
> 023051c2d0f1d78 Timothy Day       2026-08-11   899  	guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
> d09099051057bba Chengguang Xu     2018-02-26   900  	ret = -EINVAL;
> c15271f4e74cd6d Jan Blunck        2010-04-14   901  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   902  	/*
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   903  	 * See what the current blocksize for the device is, and
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   904  	 * use that as the blocksize.  Otherwise (or if the blocksize
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   905  	 * is smaller than the default) use the default.
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   906  	 * This is important for devices that have a hardware
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   907  	 * sectorsize that is larger than the default.
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   908  	 */
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   909  	blocksize = sb_min_blocksize(sb, BLOCK_SIZE);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   910  	if (!blocksize) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   911  		ext2_msg(sb, KERN_ERR, "error: unable to set blocksize");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   912  		goto failed_sbi;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   913  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   914  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   915  	/*
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   916  	 * If the superblock doesn't start on a hardware sector boundary,
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   917  	 * calculate the offset.  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   918  	 */
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   919  	if (blocksize != BLOCK_SIZE) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   920  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   921  		offset = (sb_block*BLOCK_SIZE) % blocksize;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   922  	} else {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   923  		logic_sb_block = sb_block;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   924  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   925  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   926  	if (!(bh = sb_bread(sb, logic_sb_block))) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   927  		ext2_msg(sb, KERN_ERR, "error: unable to read superblock");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   928  		goto failed_sbi;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   929  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   930  	/*
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   931  	 * Note: s_es must be initialized as soon as possible because
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   932  	 *       some ext2 macro-instructions depend on its value
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   933  	 */
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   934  	es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   935  	sbi->s_es = es;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   936  	sb->s_magic = le16_to_cpu(es->s_magic);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   937  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   938  	if (sb->s_magic != EXT2_SUPER_MAGIC)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   939  		goto cantfind_ext2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   940  
> eab61d3260d76b3 Eric Sandeen      2025-02-23   941  	ext2_set_options(fc, sbi);
> 088519572ca8bd6 Jan Kara          2017-10-09   942  
> 1751e8a6cb935e5 Linus Torvalds    2017-11-27   943  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
> 38fa0e8e4a3b932 Chengguang Xu     2019-05-20   944  		(test_opt(sb, POSIX_ACL) ? SB_POSIXACL : 0);
> 46b15caa7cb19b0 Tejun Heo         2015-06-16   945  	sb->s_iflags |= SB_I_CGROUPWB;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   946  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   947  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV &&
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   948  	    (EXT2_HAS_COMPAT_FEATURE(sb, ~0U) ||
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   949  	     EXT2_HAS_RO_COMPAT_FEATURE(sb, ~0U) ||
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   950  	     EXT2_HAS_INCOMPAT_FEATURE(sb, ~0U)))
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   951  		ext2_msg(sb, KERN_WARNING,
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   952  			"warning: feature flags set on rev 0 fs, "
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   953  			"running e2fsck is recommended");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   954  	/*
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   955  	 * Check feature flags regardless of the revision level, since we
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   956  	 * previously didn't change the revision level when setting the flags,
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   957  	 * so there is a chance incompat flags are set on a rev 0 filesystem.
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   958  	 */
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   959  	features = EXT2_HAS_INCOMPAT_FEATURE(sb, ~EXT2_FEATURE_INCOMPAT_SUPP);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   960  	if (features) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   961  		ext2_msg(sb, KERN_ERR,	"error: couldn't mount because of "
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   962  		       "unsupported optional features (%x)",
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   963  			le32_to_cpu(features));
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   964  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   965  	}
> bc98a42c1f7d0f8 David Howells     2017-07-17   966  	if (!sb_rdonly(sb) && (features = EXT2_HAS_RO_COMPAT_FEATURE(sb, ~EXT2_FEATURE_RO_COMPAT_SUPP))){
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   967  		ext2_msg(sb, KERN_ERR, "error: couldn't mount RDWR because of "
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   968  		       "unsupported optional features (%x)",
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   969  		       le32_to_cpu(features));
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   970  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   971  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   972  
> 62aeb94433fcec8 Jan Kara          2023-03-01   973  	if (le32_to_cpu(es->s_log_block_size) >
> 62aeb94433fcec8 Jan Kara          2023-03-01   974  	    (EXT2_MAX_BLOCK_LOG_SIZE - BLOCK_SIZE_BITS)) {
> 62aeb94433fcec8 Jan Kara          2023-03-01   975  		ext2_msg(sb, KERN_ERR,
> 62aeb94433fcec8 Jan Kara          2023-03-01   976  			 "Invalid log block size: %u",
> 62aeb94433fcec8 Jan Kara          2023-03-01   977  			 le32_to_cpu(es->s_log_block_size));
> 62aeb94433fcec8 Jan Kara          2023-03-01   978  		goto failed_mount;
> 62aeb94433fcec8 Jan Kara          2023-03-01   979  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   980  	blocksize = BLOCK_SIZE << le32_to_cpu(sbi->s_es->s_log_block_size);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   981  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   982  	/* If the blocksize doesn't match, re-read the thing.. */
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   983  	if (sb->s_blocksize != blocksize) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   984  		brelse(bh);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   985  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   986  		if (!sb_set_blocksize(sb, blocksize)) {
> 4e299c1d9113b5c Robin Dong        2011-05-05   987  			ext2_msg(sb, KERN_ERR,
> 4e299c1d9113b5c Robin Dong        2011-05-05   988  				"error: bad blocksize %d", blocksize);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   989  			goto failed_sbi;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   990  		}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   991  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   992  		logic_sb_block = (sb_block*BLOCK_SIZE) / blocksize;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   993  		offset = (sb_block*BLOCK_SIZE) % blocksize;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   994  		bh = sb_bread(sb, logic_sb_block);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   995  		if(!bh) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   996  			ext2_msg(sb, KERN_ERR, "error: couldn't read"
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19   997  				"superblock on 2nd try");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   998  			goto failed_sbi;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16   999  		}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1000  		es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1001  		sbi->s_es = es;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1002  		if (es->s_magic != cpu_to_le16(EXT2_SUPER_MAGIC)) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1003  			ext2_msg(sb, KERN_ERR, "error: magic mismatch");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1004  			goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1005  		}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1006  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1007  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1008  	sb->s_maxbytes = ext2_max_size(sb->s_blocksize_bits);
> 8de52778798fe39 Al Viro           2012-02-06  1009  	sb->s_max_links = EXT2_LINK_MAX;
> 22b139691f9eb8b Deepa Dinamani    2019-07-30  1010  	sb->s_time_min = S32_MIN;
> 22b139691f9eb8b Deepa Dinamani    2019-07-30  1011  	sb->s_time_max = S32_MAX;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1012  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1013  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1014  		sbi->s_inode_size = EXT2_GOOD_OLD_INODE_SIZE;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1015  		sbi->s_first_ino = EXT2_GOOD_OLD_FIRST_INO;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1016  	} else {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1017  		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1018  		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1019  		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
> d8ea6cf89991000 vignesh babu      2007-10-16  1020  		    !is_power_of_2(sbi->s_inode_size) ||
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1021  		    (sbi->s_inode_size > blocksize)) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1022  			ext2_msg(sb, KERN_ERR,
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1023  				"error: unsupported inode size: %d",
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1024  				sbi->s_inode_size);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1025  			goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1026  		}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1027  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1028  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1029  	sbi->s_blocks_per_group = le32_to_cpu(es->s_blocks_per_group);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1030  	sbi->s_inodes_per_group = le32_to_cpu(es->s_inodes_per_group);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1031  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1032  	sbi->s_inodes_per_block = sb->s_blocksize / EXT2_INODE_SIZE(sb);
> 607eb266aea9dd2 Andries Brouwer   2006-08-27  1033  	if (sbi->s_inodes_per_block == 0 || sbi->s_inodes_per_group == 0)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1034  		goto cantfind_ext2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1035  	sbi->s_itb_per_group = sbi->s_inodes_per_group /
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1036  					sbi->s_inodes_per_block;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1037  	sbi->s_desc_per_block = sb->s_blocksize /
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1038  					sizeof (struct ext2_group_desc);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1039  	sbi->s_sbh = bh;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16 @1040  	sbi->s_mount_state = le16_to_cpu(es->s_state);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1041  	sbi->s_addr_per_block_bits =
> f0d1b0b30d250a0 David Howells     2006-12-08  1042  		ilog2 (EXT2_ADDR_PER_BLOCK(sb));
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1043  	sbi->s_desc_per_block_bits =
> f0d1b0b30d250a0 David Howells     2006-12-08  1044  		ilog2 (EXT2_DESC_PER_BLOCK(sb));
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1045  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1046  	if (sb->s_magic != EXT2_SUPER_MAGIC)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1047  		goto cantfind_ext2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1048  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1049  	if (sb->s_blocksize != bh->b_size) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1050  		if (!silent)
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1051  			ext2_msg(sb, KERN_ERR, "error: unsupported blocksize");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1052  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1053  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1054  
> 404615d7f1dcd4c Jan Kara          2023-06-13  1055  	if (es->s_log_frag_size != es->s_log_block_size) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1056  		ext2_msg(sb, KERN_ERR,
> 404615d7f1dcd4c Jan Kara          2023-06-13  1057  			"error: fragsize log %u != blocksize log %u",
> 404615d7f1dcd4c Jan Kara          2023-06-13  1058  			le32_to_cpu(es->s_log_frag_size), sb->s_blocksize_bits);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1059  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1060  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1061  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1062  	if (sbi->s_blocks_per_group > sb->s_blocksize * 8) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1063  		ext2_msg(sb, KERN_ERR,
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1064  			"error: #blocks per group too big: %lu",
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1065  			sbi->s_blocks_per_group);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1066  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1067  	}
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1068  	/* At least inode table, bitmaps, and sb have to fit in one group */
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1069  	if (sbi->s_blocks_per_group <= sbi->s_itb_per_group + 3) {
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1070  		ext2_msg(sb, KERN_ERR,
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1071  			"error: #blocks per group smaller than metadata size: %lu <= %lu",
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1072  			sbi->s_blocks_per_group, sbi->s_inodes_per_group + 3);
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1073  		goto failed_mount;
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1074  	}
> fa78f336937240d Jan Kara          2022-07-26  1075  	if (sbi->s_inodes_per_group < sbi->s_inodes_per_block ||
> fa78f336937240d Jan Kara          2022-07-26  1076  	    sbi->s_inodes_per_group > sb->s_blocksize * 8) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1077  		ext2_msg(sb, KERN_ERR,
> fa78f336937240d Jan Kara          2022-07-26  1078  			"error: invalid #inodes per group: %lu",
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1079  			sbi->s_inodes_per_group);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1080  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1081  	}
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1082  	if (sb_bdev_nr_blocks(sb) < le32_to_cpu(es->s_blocks_count)) {
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1083  		ext2_msg(sb, KERN_ERR,
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1084  			 "bad geometry: block count %u exceeds size of device (%u blocks)",
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1085  			 le32_to_cpu(es->s_blocks_count),
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1086  			 (unsigned)sb_bdev_nr_blocks(sb));
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1087  		goto failed_mount;
> d766f2d1e3e3bd4 Jan Kara          2022-09-14  1088  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1089  
> 41f04d852e35958 Eric Sandeen      2006-09-27  1090  	sbi->s_groups_count = ((le32_to_cpu(es->s_blocks_count) -
> 41f04d852e35958 Eric Sandeen      2006-09-27  1091  				le32_to_cpu(es->s_first_data_block) - 1)
> 41f04d852e35958 Eric Sandeen      2006-09-27  1092  					/ EXT2_BLOCKS_PER_GROUP(sb)) + 1;
> fa78f336937240d Jan Kara          2022-07-26  1093  	if ((u64)sbi->s_groups_count * sbi->s_inodes_per_group !=
> fa78f336937240d Jan Kara          2022-07-26  1094  	    le32_to_cpu(es->s_inodes_count)) {
> fa78f336937240d Jan Kara          2022-07-26  1095  		ext2_msg(sb, KERN_ERR, "error: invalid #inodes: %u vs computed %llu",
> fa78f336937240d Jan Kara          2022-07-26  1096  			 le32_to_cpu(es->s_inodes_count),
> fa78f336937240d Jan Kara          2022-07-26  1097  			 (u64)sbi->s_groups_count * sbi->s_inodes_per_group);
> fa78f336937240d Jan Kara          2022-07-26  1098  		goto failed_mount;
> fa78f336937240d Jan Kara          2022-07-26  1099  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1100  	db_count = (sbi->s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1101  		   EXT2_DESC_PER_BLOCK(sb);
> 32a92f8c8932698 Linus Torvalds    2026-02-21  1102  	sbi->s_group_desc = kvmalloc_objs(struct buffer_head *, db_count);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1103  	if (sbi->s_group_desc == NULL) {
> 6a03e6a8dcf573d Chengguang Xu     2019-01-01  1104  		ret = -ENOMEM;
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1105  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1106  		goto failed_mount;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1107  	}
> 18a82eb9f980b5e Pekka J Enberg    2009-01-07  1108  	bgl_lock_init(sbi->s_blockgroup_lock);
> dd00cc486ab1c17 Yoann Padioleau   2007-07-19  1109  	sbi->s_debts = kcalloc(sbi->s_groups_count, sizeof(*sbi->s_debts), GFP_KERNEL);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1110  	if (!sbi->s_debts) {
> 6a03e6a8dcf573d Chengguang Xu     2019-01-01  1111  		ret = -ENOMEM;
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1112  		ext2_msg(sb, KERN_ERR, "error: not enough memory");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1113  		goto failed_mount_group_desc;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1114  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1115  	for (i = 0; i < db_count; i++) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1116  		block = descriptor_loc(sb, logic_sb_block, i);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1117  		sbi->s_group_desc[i] = sb_bread(sb, block);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1118  		if (!sbi->s_group_desc[i]) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1119  			for (j = 0; j < i; j++)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1120  				brelse (sbi->s_group_desc[j]);
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1121  			ext2_msg(sb, KERN_ERR,
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1122  				"error: unable to read group descriptors");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1123  			goto failed_mount_group_desc;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1124  		}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1125  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1126  	if (!ext2_check_descriptors (sb)) {
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1127  		ext2_msg(sb, KERN_ERR, "group descriptors corrupted");
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1128  		goto failed_mount2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1129  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1130  	sbi->s_gdb_count = db_count;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  1131  	spin_lock_init(&sbi->s_next_gen_lock);
> e76ed86ee88f68f Timothy Day       2026-08-11  1132  	scoped_guard(spinlock, &sbi->s_next_gen_lock)
> e76ed86ee88f68f Timothy Day       2026-08-11  1133  		sbi->s_next_generation = get_random_u32();
> 0216bfcffe424a5 Mingming Cao      2006-06-23  1134  
> e312c97ea253f07 Liu xuzhi         2021-03-18  1135  	/* per filesystem reservation list head & lock */
> a686cd898bd999f Martin J. Bligh   2007-10-16  1136  	spin_lock_init(&sbi->s_rsv_window_lock);
> c23746524fafe99 Timothy Day       2026-08-11  1137  	scoped_guard(spinlock, &EXT2_SB(sb)->s_rsv_window_lock) {
> a686cd898bd999f Martin J. Bligh   2007-10-16 @1138  		sbi->s_rsv_window_root = RB_ROOT;
> a686cd898bd999f Martin J. Bligh   2007-10-16  1139  		/*
> a686cd898bd999f Martin J. Bligh   2007-10-16  1140  		 * Add a single, static dummy reservation to the start of the
> a686cd898bd999f Martin J. Bligh   2007-10-16  1141  		 * reservation window list --- it gives us a placeholder for
> a686cd898bd999f Martin J. Bligh   2007-10-16  1142  		 * append-at-start-of-list which makes the allocation logic
> a686cd898bd999f Martin J. Bligh   2007-10-16  1143  		 * _much_ simpler.
> a686cd898bd999f Martin J. Bligh   2007-10-16  1144  		 */
> a686cd898bd999f Martin J. Bligh   2007-10-16  1145  		sbi->s_rsv_window_head.rsv_start = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
> a686cd898bd999f Martin J. Bligh   2007-10-16  1146  		sbi->s_rsv_window_head.rsv_end = EXT2_RESERVE_WINDOW_NOT_ALLOCATED;
> a686cd898bd999f Martin J. Bligh   2007-10-16  1147  		sbi->s_rsv_window_head.rsv_alloc_hit = 0;
> a686cd898bd999f Martin J. Bligh   2007-10-16  1148  		sbi->s_rsv_window_head.rsv_goal_size = 0;
> a686cd898bd999f Martin J. Bligh   2007-10-16  1149  		ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
> c23746524fafe99 Timothy Day       2026-08-11  1150  	}
> a686cd898bd999f Martin J. Bligh   2007-10-16  1151  
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1152  	err = percpu_counter_init(&sbi->s_freeblocks_counter,
> 908c7f1949cb7cc Tejun Heo         2014-09-08  1153  				ext2_count_free_blocks(sb), GFP_KERNEL);
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1154  	if (!err) {
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1155  		err = percpu_counter_init(&sbi->s_freeinodes_counter,
> 908c7f1949cb7cc Tejun Heo         2014-09-08  1156  				ext2_count_free_inodes(sb), GFP_KERNEL);
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1157  	}
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1158  	if (!err) {
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1159  		err = percpu_counter_init(&sbi->s_dirs_counter,
> 908c7f1949cb7cc Tejun Heo         2014-09-08  1160  				ext2_count_dirs(sb), GFP_KERNEL);
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1161  	}
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1162  	if (err) {
> 34e92542da96430 Chengguang Xu     2019-11-29  1163  		ret = err;
> 2314b07cb47ef7d Oleksij Rempel    2009-11-19  1164  		ext2_msg(sb, KERN_ERR, "error: insufficient memory");
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1165  		goto failed_mount3;
> 833f4077bf7c2dc Peter Zijlstra    2007-10-16  1166  	}
> be0726d33cb8f41 Jan Kara          2016-02-22  1167  
> 
> :::::: The code at line 1040 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> 
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
