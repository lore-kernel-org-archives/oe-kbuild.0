Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEBC4C7C
	for <oe-kbuild@lists.linux.dev>; Fri,  5 May 2023 07:34:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso9262635e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 05 May 2023 00:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683272041; x=1685864041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrcAaDkwi/edRiKjh8q26WL9V/JB9xGKafP9PcYSdmk=;
        b=Xo4rWp8llLWuyct4Di8xRqIltA94Z/5ranNE2cwr951Udqp79dnSbOYn07AZ6SMFDB
         HaOzAu/RNqvoTuKnp8sLgMzyXn3oEyYk2yxasnFFDsBZWxNtYE64gn/jXsW2+iBs1BW7
         PdFdq2i64yqYm6b3ZZr9AhpGrrg8EDKG0RvmwkfA6v2dd/9nbd1YUKB8J7VKm0lV0B7j
         GtRsL6AGxpGxpY359DEnSb/uT2Z3WewUniGyX9/Zgf2dqI2IInW/gqHwPwrrUNU+pGJx
         usnyUjhY2sLHTjNlH/o1t9sHXrCWT+lXv+3eO1bKmQP/RwuT0l6ZszA5O1+t5DXVWPrI
         jiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683272041; x=1685864041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrcAaDkwi/edRiKjh8q26WL9V/JB9xGKafP9PcYSdmk=;
        b=jJKqrAeJEj42EmE+ETHjiQEOnFuEceUKkIZJIeq5pSy3ATiYYp/J7Hlyyq2mDg1Ofd
         CjSnBh+tkns/HhqL4E/q9D2AUr8UyPCCr41WqrQBx5fh3zuFJdLvFlIup1Z5mWN8RPjA
         Y0EeoXPS+p+kE9dbiC9ByEQAhh2Wc3TVX4r+7cy8n9CQ7YYIS+wEsjOKz4iVphp8Hy74
         mCqM15sEwj1ngOZ1DmHIxUXM0wC9eE8e9bjF5W7wkOV3eQlWAtFr5T9z5MU8KZKMCZIu
         z6eauUH2uWN/F3WerKco65Zx0xOO3NvXkBCLxaOMfjp1LCApjJ3te8fQmWdr5qwensW1
         DxAA==
X-Gm-Message-State: AC+VfDzEQw3koMETnnhGtLhFQppfXSrP+5IR2LH0i+WtcXkY7WSOfp0M
	CoSpbPgzJXT7/8evA30WCQGESH1hSsHF6Zvico8=
X-Google-Smtp-Source: ACHHUZ4b/lrjwU2xi86GmqwkJivzYgxpoNyiXWFUv1dgdSO9eD5wCkKEolH/ua9dJw2m2D08Tk7CLg==
X-Received: by 2002:a05:600c:2114:b0:3f1:6fef:9862 with SMTP id u20-20020a05600c211400b003f16fef9862mr400360wml.13.1683272040888;
        Fri, 05 May 2023 00:34:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d53ce000000b0030732d6e104sm1442147wrw.105.2023.05.05.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:33:59 -0700 (PDT)
Date: Fri, 5 May 2023 10:33:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_modify 21/27] fs/notify/fsnotify.c:586 fsnotify()
 error: we previously assumed 'inode' could be null (see line 564)
Message-ID: <eda1c8ed-d9c6-4a28-8fec-5d84b0061c81@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_modify
head:   051b25e0fb7e2c93cf3cb3a00feb49dadfe59367
commit: 4da8511110fdc4b4e805c7ae2af9824a52f479eb [21/27] fanotify: introduce FAN_PRE_MODIFY permission event
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230505/202305050110.AdXoSaS1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305050110.AdXoSaS1-lkp@intel.com/

smatch warnings:
fs/notify/fsnotify.c:586 fsnotify() error: we previously assumed 'inode' could be null (see line 564)

vim +/inode +586 fs/notify/fsnotify.c

40a100d3adc1ad Amir Goldstein          2020-07-22  488  int fsnotify(__u32 mask, const void *data, int data_type, struct inode *dir,
40a100d3adc1ad Amir Goldstein          2020-07-22  489  	     const struct qstr *file_name, struct inode *inode, u32 cookie)
90586523eb4b34 Eric Paris              2009-05-21  490  {
b54cecf5e2293d Amir Goldstein          2020-06-07  491  	const struct path *path = fsnotify_data_path(data, data_type);
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  492  	struct super_block *sb = fsnotify_data_sb(data, data_type);
3427ce71554123 Miklos Szeredi          2017-10-30  493  	struct fsnotify_iter_info iter_info = {};
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  494  	struct mount *mnt = NULL;
e54183fa7047c1 Amir Goldstein          2021-11-29  495  	struct inode *inode2 = NULL;
e54183fa7047c1 Amir Goldstein          2021-11-29  496  	struct dentry *moved;
e54183fa7047c1 Amir Goldstein          2021-11-29  497  	int inode2_type;
9385a84d7e1f65 Jan Kara                2016-11-10  498  	int ret = 0;
71d734103edfa2 Mel Gorman              2020-07-08  499  	__u32 test_mask, marks_mask;
4da8511110fdc4 Amir Goldstein          2022-11-17  500  	const struct file_range *range;
4da8511110fdc4 Amir Goldstein          2022-11-17  501  	int *pidx;
90586523eb4b34 Eric Paris              2009-05-21  502  
71d734103edfa2 Mel Gorman              2020-07-08  503  	if (path)
aa93bdc5500cc9 Amir Goldstein          2020-03-19  504  		mnt = real_mount(path->mnt);
3a9fb89f4cd04c Eric Paris              2009-12-17  505  
40a100d3adc1ad Amir Goldstein          2020-07-22  506  	if (!inode) {
40a100d3adc1ad Amir Goldstein          2020-07-22  507  		/* Dirent event - report on TYPE_INODE to dir */
40a100d3adc1ad Amir Goldstein          2020-07-22  508  		inode = dir;
e54183fa7047c1 Amir Goldstein          2021-11-29  509  		/* For FS_RENAME, inode is old_dir and inode2 is new_dir */
e54183fa7047c1 Amir Goldstein          2021-11-29  510  		if (mask & FS_RENAME) {
e54183fa7047c1 Amir Goldstein          2021-11-29  511  			moved = fsnotify_data_dentry(data, data_type);
e54183fa7047c1 Amir Goldstein          2021-11-29  512  			inode2 = moved->d_parent->d_inode;
e54183fa7047c1 Amir Goldstein          2021-11-29  513  			inode2_type = FSNOTIFY_ITER_TYPE_INODE2;
e54183fa7047c1 Amir Goldstein          2021-11-29  514  		}
40a100d3adc1ad Amir Goldstein          2020-07-22  515  	} else if (mask & FS_EVENT_ON_CHILD) {
40a100d3adc1ad Amir Goldstein          2020-07-22  516  		/*
fecc4559780d52 Amir Goldstein          2020-12-02  517  		 * Event on child - report on TYPE_PARENT to dir if it is
fecc4559780d52 Amir Goldstein          2020-12-02  518  		 * watching children and on TYPE_INODE to child.
40a100d3adc1ad Amir Goldstein          2020-07-22  519  		 */
e54183fa7047c1 Amir Goldstein          2021-11-29  520  		inode2 = dir;
e54183fa7047c1 Amir Goldstein          2021-11-29  521  		inode2_type = FSNOTIFY_ITER_TYPE_PARENT;
40a100d3adc1ad Amir Goldstein          2020-07-22  522  	}
497b0c5a7c0688 Amir Goldstein          2020-07-16  523  
7c49b8616460eb Dave Hansen             2015-09-04  524  	/*
7c49b8616460eb Dave Hansen             2015-09-04  525  	 * Optimization: srcu_read_lock() has a memory barrier which can
7c49b8616460eb Dave Hansen             2015-09-04  526  	 * be expensive.  It protects walking the *_fsnotify_marks lists.
7c49b8616460eb Dave Hansen             2015-09-04  527  	 * However, if we do not walk the lists, we do not have to do
7c49b8616460eb Dave Hansen             2015-09-04  528  	 * SRCU because we have no references to any objects and do not
7c49b8616460eb Dave Hansen             2015-09-04  529  	 * need SRCU to keep them "alive".
7c49b8616460eb Dave Hansen             2015-09-04  530  	 */
9b93f33105f5f9 Amir Goldstein          2020-07-16  531  	if (!sb->s_fsnotify_marks &&
497b0c5a7c0688 Amir Goldstein          2020-07-16  532  	    (!mnt || !mnt->mnt_fsnotify_marks) &&
9b93f33105f5f9 Amir Goldstein          2020-07-16  533  	    (!inode || !inode->i_fsnotify_marks) &&
e54183fa7047c1 Amir Goldstein          2021-11-29  534  	    (!inode2 || !inode2->i_fsnotify_marks))
7c49b8616460eb Dave Hansen             2015-09-04  535  		return 0;
71d734103edfa2 Mel Gorman              2020-07-08  536  
9b93f33105f5f9 Amir Goldstein          2020-07-16  537  	marks_mask = sb->s_fsnotify_mask;
71d734103edfa2 Mel Gorman              2020-07-08  538  	if (mnt)
71d734103edfa2 Mel Gorman              2020-07-08  539  		marks_mask |= mnt->mnt_fsnotify_mask;
9b93f33105f5f9 Amir Goldstein          2020-07-16  540  	if (inode)
                                                                    ^^^^^
Checked for NULL

9b93f33105f5f9 Amir Goldstein          2020-07-16  541  		marks_mask |= inode->i_fsnotify_mask;
e54183fa7047c1 Amir Goldstein          2021-11-29  542  	if (inode2)
e54183fa7047c1 Amir Goldstein          2021-11-29  543  		marks_mask |= inode2->i_fsnotify_mask;
497b0c5a7c0688 Amir Goldstein          2020-07-16  544  
71d734103edfa2 Mel Gorman              2020-07-08  545  
613a807fe7c793 Eric Paris              2010-07-28  546  	/*
31a371e419c885 Amir Goldstein          2022-06-29  547  	 * If this is a modify event we may need to clear some ignore masks.
31a371e419c885 Amir Goldstein          2022-06-29  548  	 * In that case, the object with ignore masks will have the FS_MODIFY
04e317ba72d079 Amir Goldstein          2022-02-23  549  	 * event in its mask.
04e317ba72d079 Amir Goldstein          2022-02-23  550  	 * Otherwise, return if none of the marks care about this type of event.
613a807fe7c793 Eric Paris              2010-07-28  551  	 */
71d734103edfa2 Mel Gorman              2020-07-08  552  	test_mask = (mask & ALL_FSNOTIFY_EVENTS);
04e317ba72d079 Amir Goldstein          2022-02-23  553  	if (!(test_mask & marks_mask))
613a807fe7c793 Eric Paris              2010-07-28  554  		return 0;
75c1be487a690d Eric Paris              2010-07-28  555  
9385a84d7e1f65 Jan Kara                2016-11-10  556  	iter_info.srcu_idx = srcu_read_lock(&fsnotify_mark_srcu);
75c1be487a690d Eric Paris              2010-07-28  557  
1c9007d62bea6f Amir Goldstein          2021-11-29  558  	iter_info.marks[FSNOTIFY_ITER_TYPE_SB] =
45a9fb3725d886 Amir Goldstein          2019-01-10  559  		fsnotify_first_mark(&sb->s_fsnotify_marks);
9bdda4e9cf2dce Amir Goldstein          2018-09-01  560  	if (mnt) {
1c9007d62bea6f Amir Goldstein          2021-11-29  561  		iter_info.marks[FSNOTIFY_ITER_TYPE_VFSMOUNT] =
3427ce71554123 Miklos Szeredi          2017-10-30  562  			fsnotify_first_mark(&mnt->mnt_fsnotify_marks);
7131485a93679f Eric Paris              2009-12-17  563  	}
9b93f33105f5f9 Amir Goldstein          2020-07-16 @564  	if (inode) {
1c9007d62bea6f Amir Goldstein          2021-11-29  565  		iter_info.marks[FSNOTIFY_ITER_TYPE_INODE] =
9b93f33105f5f9 Amir Goldstein          2020-07-16  566  			fsnotify_first_mark(&inode->i_fsnotify_marks);
9b93f33105f5f9 Amir Goldstein          2020-07-16  567  	}
e54183fa7047c1 Amir Goldstein          2021-11-29  568  	if (inode2) {
e54183fa7047c1 Amir Goldstein          2021-11-29  569  		iter_info.marks[inode2_type] =
e54183fa7047c1 Amir Goldstein          2021-11-29  570  			fsnotify_first_mark(&inode2->i_fsnotify_marks);
497b0c5a7c0688 Amir Goldstein          2020-07-16  571  	}
75c1be487a690d Eric Paris              2010-07-28  572  
4da8511110fdc4 Amir Goldstein          2022-11-17  573  	pidx = NULL;
4bf2d24ea353fa Amir Goldstein          2022-11-16  574  	if (mask & FS_PRE_VFS) {

Smatch is bad at handling mask (Just haven't gotten around to writing
that code, sorry).

4bf2d24ea353fa Amir Goldstein          2022-11-16  575  		/* Avoid the false negatives of !sb_write_started() */
4bf2d24ea353fa Amir Goldstein          2022-11-16  576  		lockdep_assert_once(sb_may_start_write(sb));
4da8511110fdc4 Amir Goldstein          2022-11-17  577  		/*
4da8511110fdc4 Amir Goldstein          2022-11-17  578  		 * To avoid the performance penalty of the memory barrier in
4da8511110fdc4 Amir Goldstein          2022-11-17  579  		 * srcu_down_read(), fsnotify_file_perm() takes s_write_srcu
4da8511110fdc4 Amir Goldstein          2022-11-17  580  		 * conditionally if there are any marks with FS_PRE_MODIFY.
4da8511110fdc4 Amir Goldstein          2022-11-17  581  		 */
4da8511110fdc4 Amir Goldstein          2022-11-17  582  		if (mask & FSNOTIFY_PRE_MODIFY_EVENTS) {
4da8511110fdc4 Amir Goldstein          2022-11-17  583  			range = fsnotify_data_file_range(data, data_type);
4da8511110fdc4 Amir Goldstein          2022-11-17  584  			if (range)
4da8511110fdc4 Amir Goldstein          2022-11-17  585  				pidx = range->pidx;
4da8511110fdc4 Amir Goldstein          2022-11-17 @586  			if (pidx && S_ISREG(inode->i_mode))
                                                                                                    ^^^^^^^^^^^^^^
can inode be NULL?

4da8511110fdc4 Amir Goldstein          2022-11-17  587  				*pidx = __file_start_write_srcu(range->file);
4da8511110fdc4 Amir Goldstein          2022-11-17  588  			else
c4da3e022eecb6 Amir Goldstein          2022-11-16  589  				lockdep_assert_once(sb_write_srcu_started(sb));
4bf2d24ea353fa Amir Goldstein          2022-11-16  590  		}
4da8511110fdc4 Amir Goldstein          2022-11-17  591  	}
4bf2d24ea353fa Amir Goldstein          2022-11-16  592  
8edc6e1688fc8f Jan Kara                2014-11-13  593  	/*
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  594  	 * We need to merge inode/vfsmount/sb mark lists so that e.g. inode mark
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  595  	 * ignore masks are properly reflected for mount/sb mark notifications.
8edc6e1688fc8f Jan Kara                2014-11-13  596  	 * That's why this traversal is so complicated...
8edc6e1688fc8f Jan Kara                2014-11-13  597  	 */
d9a6f30bb89309 Amir Goldstein          2018-04-20  598  	while (fsnotify_iter_select_report_types(&iter_info)) {
b54cecf5e2293d Amir Goldstein          2020-06-07  599  		ret = send_to_group(mask, data, data_type, dir, file_name,
b54cecf5e2293d Amir Goldstein          2020-06-07  600  				    cookie, &iter_info);
613a807fe7c793 Eric Paris              2010-07-28  601  
4e29132f6f7e33 Amir Goldstein          2022-11-16  602  		if (ret && (mask & FSNOTIFY_PERM_EVENTS))
ff8bcbd03da881 Eric Paris              2010-10-28  603  			goto out;
ff8bcbd03da881 Eric Paris              2010-10-28  604  
d9a6f30bb89309 Amir Goldstein          2018-04-20  605  		fsnotify_iter_next(&iter_info);
90586523eb4b34 Eric Paris              2009-05-21  606  	}
ff8bcbd03da881 Eric Paris              2010-10-28  607  	ret = 0;
ff8bcbd03da881 Eric Paris              2010-10-28  608  out:
9385a84d7e1f65 Jan Kara                2016-11-10  609  	srcu_read_unlock(&fsnotify_mark_srcu, iter_info.srcu_idx);
4da8511110fdc4 Amir Goldstein          2022-11-17  610  	if (ret && pidx)
4da8511110fdc4 Amir Goldstein          2022-11-17  611  		__file_end_write_srcu(range->file, *pidx);
c4ec54b40d33f8 Eric Paris              2009-12-17  612  
bbd77e8ddfc3f9 Amir Goldstein          2022-11-19  613  	/*
bbd77e8ddfc3f9 Amir Goldstein          2022-11-19  614  	 * Fall back from RCU walk if any backend needs to get the event.
bbd77e8ddfc3f9 Amir Goldstein          2022-11-19  615  	 */
bbd77e8ddfc3f9 Amir Goldstein          2022-11-19  616  	if (ret == -EAGAIN && mask & FS_NONBLOCK && mask & FS_LOOKUP_PERM)
bbd77e8ddfc3f9 Amir Goldstein          2022-11-19  617  		ret = -ECHILD;
bbd77e8ddfc3f9 Amir Goldstein          2022-11-19  618  
98b5c10d320adf Jean-Christophe Dubois  2010-03-23  619  	return ret;
90586523eb4b34 Eric Paris              2009-05-21  620  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

