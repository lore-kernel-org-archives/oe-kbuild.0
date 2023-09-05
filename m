Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC158D2E1
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 11:33:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so23884115e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Sep 2023 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693913608; x=1694518408; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7pS9X83oVOw0s/rnfzFoJ1kRmd6LauZjP4sTRAimp0=;
        b=jTobBxDDf8ReTdLbBpB9ycpRo/KagXPxSBo+th/EXCgxsgWCxJpL2Acwkabh9ty+l5
         FNR30PwTBhWGCBknlspNNG7SlwpMEtPtxWPFE1CcwV4zfepv+bNOKB9XEDnCLkZzbSH2
         uUn1MrJIU9LwqNEb3r/+pGE/1+lQFf7sBwNgqPe+yv5x3BOGcND25BwZeQPTwgXnqPl6
         PnqqLa5BSnVdKwHS9ilzWsR8bkd/Xw++zohUVXi9kMgLwfcZJmqzmxyJQNIvMXvtP4gU
         f4zqTfjSHAhFyJiDTocgyP/JlA4yPgxG+UT5K/nwkHuipZxgeXpezZS/BVc86ptojedT
         64jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913608; x=1694518408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7pS9X83oVOw0s/rnfzFoJ1kRmd6LauZjP4sTRAimp0=;
        b=DfpWL95d9lb9t/PiYLpy8keq+86HT5/rHSU6IzpCpJBPZ/ZyC5kGmoSywFeT/r63RS
         gVP0cZcDeIY9hzCbgPFVT7XXvQJl8WU4aHaPsN55IKq2mBRSS69zRBWw7JNI7xJVYsVW
         mhPzLe3YT1Ff76D9fdhI/NLKwF+S/INSF/BCAdpSMTwegvdG+UfKJkVgDXEGgRdhUvde
         07/2l3uij+HEZ08rO1QEH7CsSlzqWXTvnJ9APBU/b0AesRfLEhWIJA8rw6EQcqI6Lxh1
         Kymzdxax48QlIP27KKP7YUznNK7y6xAr4/pDelkze6ZPx2nc/omcCwS3kGs7eUzpSX0q
         9qlQ==
X-Gm-Message-State: AOJu0Yw370DfUwJEtIe4VeI642qpA8rkSXP8Kr6CYTKbfWsP9uHXjlOt
	mVR3sC/X2cHC3x9bPqxzNOdc4Q2xLnZbEtNRI84=
X-Google-Smtp-Source: AGHT+IHzSj1Xigp0dgVRXNTM+ua7KFMhdgCSLk3CYmEouHduqm/AgzuXaWXcfYqdDep2qrBp4MK7MA==
X-Received: by 2002:a05:600c:2158:b0:3fe:d849:b916 with SMTP id v24-20020a05600c215800b003fed849b916mr9098856wml.29.1693913607785;
        Tue, 05 Sep 2023 04:33:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003fed1ba0b8esm16802641wml.8.2023.09.05.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:33:27 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:33:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
	Vitaliy Kuznetsov <vk.en.mail@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12036/12910] fs/ext4/super.c:796
 update_super_work() error: uninitialized symbol 'call_notify_err'.
Message-ID: <74cd72ba-407e-4586-bff0-754b78334ccb@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a47fc304d2b678db1a5d760a7d644dac9b067752
commit: 22fe4b80ee8de5a551a27a2c91f54594b99c1db5 [12036/12910] ext4: rename s_error_work to s_sb_upd_work
config: x86_64-randconfig-161-20230902 (https://download.01.org/0day-ci/archive/20230903/202309030813.vgQkkgxM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309030813.vgQkkgxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309030813.vgQkkgxM-lkp@intel.com/

smatch warnings:
fs/ext4/super.c:796 update_super_work() error: uninitialized symbol 'call_notify_err'.

vim +/call_notify_err +796 fs/ext4/super.c

22fe4b80ee8de5 Theodore Ts'o     2023-08-22  753  static void update_super_work(struct work_struct *work)
c92dc856848f32 Jan Kara          2020-11-27  754  {
c92dc856848f32 Jan Kara          2020-11-27  755  	struct ext4_sb_info *sbi = container_of(work, struct ext4_sb_info,
22fe4b80ee8de5 Theodore Ts'o     2023-08-22  756  						s_sb_upd_work);
2d01ddc8660656 Jan Kara          2020-12-16  757  	journal_t *journal = sbi->s_journal;
2d01ddc8660656 Jan Kara          2020-12-16  758  	handle_t *handle;
c92dc856848f32 Jan Kara          2020-11-27  759  
2d01ddc8660656 Jan Kara          2020-12-16  760  	/*
2d01ddc8660656 Jan Kara          2020-12-16  761  	 * If the journal is still running, we have to write out superblock
2d01ddc8660656 Jan Kara          2020-12-16  762  	 * through the journal to avoid collisions of other journalled sb
2d01ddc8660656 Jan Kara          2020-12-16  763  	 * updates.
2d01ddc8660656 Jan Kara          2020-12-16  764  	 *
2d01ddc8660656 Jan Kara          2020-12-16  765  	 * We use directly jbd2 functions here to avoid recursing back into
2d01ddc8660656 Jan Kara          2020-12-16  766  	 * ext4 error handling code during handling of previous errors.
2d01ddc8660656 Jan Kara          2020-12-16  767  	 */
2d01ddc8660656 Jan Kara          2020-12-16  768  	if (!sb_rdonly(sbi->s_sb) && journal) {
558d6450c7755a Ye Bin            2021-06-15  769  		struct buffer_head *sbh = sbi->s_sbh;
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  770  		bool call_notify_err;

Needs to be:

	bool call_notify_err = false;

2d01ddc8660656 Jan Kara          2020-12-16  771  		handle = jbd2_journal_start(journal, 1);
2d01ddc8660656 Jan Kara          2020-12-16  772  		if (IS_ERR(handle))
2d01ddc8660656 Jan Kara          2020-12-16  773  			goto write_directly;
558d6450c7755a Ye Bin            2021-06-15  774  		if (jbd2_journal_get_write_access(handle, sbh)) {
2d01ddc8660656 Jan Kara          2020-12-16  775  			jbd2_journal_stop(handle);
2d01ddc8660656 Jan Kara          2020-12-16  776  			goto write_directly;
2d01ddc8660656 Jan Kara          2020-12-16  777  		}
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  778  
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  779  		if (sbi->s_add_error_count > 0)
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  780  			call_notify_err = true;
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  781  
2d01ddc8660656 Jan Kara          2020-12-16  782  		ext4_update_super(sbi->s_sb);
558d6450c7755a Ye Bin            2021-06-15  783  		if (buffer_write_io_error(sbh) || !buffer_uptodate(sbh)) {
558d6450c7755a Ye Bin            2021-06-15  784  			ext4_msg(sbi->s_sb, KERN_ERR, "previous I/O error to "
558d6450c7755a Ye Bin            2021-06-15  785  				 "superblock detected");
558d6450c7755a Ye Bin            2021-06-15  786  			clear_buffer_write_io_error(sbh);
558d6450c7755a Ye Bin            2021-06-15  787  			set_buffer_uptodate(sbh);
558d6450c7755a Ye Bin            2021-06-15  788  		}
558d6450c7755a Ye Bin            2021-06-15  789  
558d6450c7755a Ye Bin            2021-06-15  790  		if (jbd2_journal_dirty_metadata(handle, sbh)) {
2d01ddc8660656 Jan Kara          2020-12-16  791  			jbd2_journal_stop(handle);
2d01ddc8660656 Jan Kara          2020-12-16  792  			goto write_directly;
2d01ddc8660656 Jan Kara          2020-12-16  793  		}
2d01ddc8660656 Jan Kara          2020-12-16  794  		jbd2_journal_stop(handle);
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  795  
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10 @796  		if (call_notify_err)
d578b99443fde0 Jonathan Davies   2021-06-11  797  			ext4_notify_error_sysfs(sbi);
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  798  
2d01ddc8660656 Jan Kara          2020-12-16  799  		return;
2d01ddc8660656 Jan Kara          2020-12-16  800  	}
2d01ddc8660656 Jan Kara          2020-12-16  801  write_directly:
2d01ddc8660656 Jan Kara          2020-12-16  802  	/*
2d01ddc8660656 Jan Kara          2020-12-16  803  	 * Write through journal failed. Write sb directly to get error info
2d01ddc8660656 Jan Kara          2020-12-16  804  	 * out and hope for the best.
2d01ddc8660656 Jan Kara          2020-12-16  805  	 */
4392fbc4bab57d Jan Kara          2020-12-16  806  	ext4_commit_super(sbi->s_sb);
d578b99443fde0 Jonathan Davies   2021-06-11  807  	ext4_notify_error_sysfs(sbi);
4327ba52afd03f Daeho Jeong       2015-10-18  808  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

