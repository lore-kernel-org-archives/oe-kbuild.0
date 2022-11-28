Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40002181;
	Mon, 28 Nov 2022 12:49:54 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id b8so15237611edf.11;
        Mon, 28 Nov 2022 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBU5MBhlpxNuxx1GEhJPllIGPGazWpOlJn6+wi0bRL8=;
        b=oW2nrmmatfctuY6bgw/cmdR6ZKQTzq8WYjKpA/9V+S3aqkC+3n91ymjGAk8zWjBJY6
         kbMLPtoPMUDFFzfM2iJokoBD62p9fFOltfskYDSPgmznyjNlrtZeBjrEFpm6xPAbXRJc
         Wj24Ro9Yxop+4JseqP/d+OUccmQ3XoaZPyb1VQKfejFACdhWCaZbL3SFyiwxVhKtSxix
         V92bNUOff3W9cInUV+v90cbVsOJSecKbUQ8TLPQAt5+ApJwCetCj6c6LwVi5httPcODK
         vkuIo87nBXnoaLFF6kwa+7yDCEFO633t/55FgKcuOc5pSbkHxcQVPmK5graO0M+FTier
         AgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBU5MBhlpxNuxx1GEhJPllIGPGazWpOlJn6+wi0bRL8=;
        b=LcAvoWBBaVgiCWXDc+De6j+cCx+UzayZyx0p8g3kyREbMvYQVDlQIU2csd7mCLOVjv
         dlFVoNquo/axgSTMipyvLSsh1rIG4tBK09ORbZmuEJ/3kQI2AiZv+vtYh4hGy5J7Jy27
         dbCMM7T8aik21W5AQ7N04Xskd+Er9M1i2zTRr/3/o0s+NzrjCcSVCSfrlkPSavEL2/1G
         TnXkkmc7BwNLoRFUHBp/U7PnSpF2bPh/LJC5NtqqOMPlmjp/90kR432RrZ5dpTcYLq74
         cfM55DoiHJlxkHjn6rslQcsVEBe1bGwWSV9POjxL/6KotaXmRzzeIyVcPus4ukvkIkgl
         XHWw==
X-Gm-Message-State: ANoB5pmKskU5bel5W6P1pff+PA8cWMUyZQBYYNsJkvc3udvMnMicMvdO
	JDnkWrYXzI78gDVB1soUjbEcyJS+snwPnw==
X-Google-Smtp-Source: AA0mqf7y2k+kbqD5NBV4lDzrebDFxCic/0X6uRDCim9TsJDTSkyENKDOyBvClhSQGGSV34NHJ550DQ==
X-Received: by 2002:a05:6402:2b87:b0:45b:c731:b683 with SMTP id fj7-20020a0564022b8700b0045bc731b683mr48893624edb.251.1669639792189;
        Mon, 28 Nov 2022 04:49:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7d88d000000b0045cf4f72b04sm5143327edq.94.2022.11.28.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:49:51 -0800 (PST)
Date: Mon, 28 Nov 2022 15:49:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:mnt_write_barrier 18/24] fs/namespace.c:223 alloc_vfsmnt()
 error: buffer overflow 'mnt->mnt_writers' 2 <= 2
Message-ID: <202211282040.ulqmIOPT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221128124948.rVA315u_qigqpdufpzewCNFv0U7aJtKom0y10XS3yQI@z>

tree:   https://github.com/amir73il/linux mnt_write_barrier
head:   74b4d66a95a2940e9d3b5952164c1303848e57b9
commit: 0fc58d2df77109ff6f18a334b1479e7b5fd9449e [18/24] vfs: prepare for mount write barrier
config: microblaze-randconfig-m041-20221127
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/namespace.c:223 alloc_vfsmnt() error: buffer overflow 'mnt->mnt_writers' 2 <= 2

Old smatch warnings:
fs/namespace.c:4129 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +223 fs/namespace.c

b105e270b4e941 Al Viro           2011-11-24  196  static struct mount *alloc_vfsmnt(const char *name)
^1da177e4c3f41 Linus Torvalds    2005-04-16  197  {
c63181e6b6df89 Al Viro           2011-11-25  198  	struct mount *mnt = kmem_cache_zalloc(mnt_cache, GFP_KERNEL);
c63181e6b6df89 Al Viro           2011-11-25  199  	if (mnt) {
73cd49ecdde92f Miklos Szeredi    2008-03-26  200  		int err;
73cd49ecdde92f Miklos Szeredi    2008-03-26  201  
c63181e6b6df89 Al Viro           2011-11-25  202  		err = mnt_alloc_id(mnt);
88b387824fdaec Li Zefan          2008-07-21  203  		if (err)
88b387824fdaec Li Zefan          2008-07-21  204  			goto out_free_cache;
88b387824fdaec Li Zefan          2008-07-21  205  
88b387824fdaec Li Zefan          2008-07-21  206  		if (name) {
79f6540ba88dfb Vasily Averin     2021-09-02  207  			mnt->mnt_devname = kstrdup_const(name,
79f6540ba88dfb Vasily Averin     2021-09-02  208  							 GFP_KERNEL_ACCOUNT);
c63181e6b6df89 Al Viro           2011-11-25  209  			if (!mnt->mnt_devname)
88b387824fdaec Li Zefan          2008-07-21  210  				goto out_free_id;
73cd49ecdde92f Miklos Szeredi    2008-03-26  211  		}
73cd49ecdde92f Miklos Szeredi    2008-03-26  212  
b3e19d924b6eaf Nicholas Piggin   2011-01-07  213  #ifdef CONFIG_SMP
c63181e6b6df89 Al Viro           2011-11-25  214  		mnt->mnt_pcp = alloc_percpu(struct mnt_pcp);
c63181e6b6df89 Al Viro           2011-11-25  215  		if (!mnt->mnt_pcp)
b3e19d924b6eaf Nicholas Piggin   2011-01-07  216  			goto out_free_devname;
b3e19d924b6eaf Nicholas Piggin   2011-01-07  217  
c63181e6b6df89 Al Viro           2011-11-25  218  		this_cpu_add(mnt->mnt_pcp->mnt_count, 1);
b3e19d924b6eaf Nicholas Piggin   2011-01-07  219  #else
c63181e6b6df89 Al Viro           2011-11-25  220  		mnt->mnt_count = 1;
0fc58d2df77109 Amir Goldstein    2022-11-20  221  		mnt->mnt_writers[0] = 0;
0fc58d2df77109 Amir Goldstein    2022-11-20  222  		mnt->mnt_writers[1] = 0;
0fc58d2df77109 Amir Goldstein    2022-11-20 @223  		mnt->mnt_writers[2] = 0;
                                                                     ^^^^^^^^^^^^^^
Off by one apparently.  (I haven't looked at the context outside this
email).

b3e19d924b6eaf Nicholas Piggin   2011-01-07  224  #endif
b3e19d924b6eaf Nicholas Piggin   2011-01-07  225  
38129a13e6e71f Al Viro           2014-03-20  226  		INIT_HLIST_NODE(&mnt->mnt_hash);
c63181e6b6df89 Al Viro           2011-11-25  227  		INIT_LIST_HEAD(&mnt->mnt_child);
c63181e6b6df89 Al Viro           2011-11-25  228  		INIT_LIST_HEAD(&mnt->mnt_mounts);
c63181e6b6df89 Al Viro           2011-11-25  229  		INIT_LIST_HEAD(&mnt->mnt_list);
c63181e6b6df89 Al Viro           2011-11-25  230  		INIT_LIST_HEAD(&mnt->mnt_expire);
c63181e6b6df89 Al Viro           2011-11-25  231  		INIT_LIST_HEAD(&mnt->mnt_share);
c63181e6b6df89 Al Viro           2011-11-25  232  		INIT_LIST_HEAD(&mnt->mnt_slave_list);
c63181e6b6df89 Al Viro           2011-11-25  233  		INIT_LIST_HEAD(&mnt->mnt_slave);
0a5eb7c8189922 Eric W. Biederman 2013-09-22  234  		INIT_HLIST_NODE(&mnt->mnt_mp_list);
99b19d16471e9c Eric W. Biederman 2016-10-24  235  		INIT_LIST_HEAD(&mnt->mnt_umounting);
56cbb429d91199 Al Viro           2019-07-04  236  		INIT_HLIST_HEAD(&mnt->mnt_stuck_children);
a6435940b62f81 Christian Brauner 2021-01-21  237  		mnt->mnt.mnt_userns = &init_user_ns;
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  	}
c63181e6b6df89 Al Viro           2011-11-25  239  	return mnt;
88b387824fdaec Li Zefan          2008-07-21  240  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

