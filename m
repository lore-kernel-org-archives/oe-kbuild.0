Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019E01102
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 05:26:31 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso24778341fa.0
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 22:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691731590; x=1692336390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMt0B07ZTzgDWLe0m642FavvJHHm3KnbXYWpIFP5EHs=;
        b=CjJZjVGAX1vybZJOFtWgIeS1pgc/6LxnnSS7G6mOJ3r7t4hEIogO959vXaTcFDh28m
         I6E0bJwn9hEFuIJeA4RHsvb631rzWFfpH8xbXpcEzFaXVcwms/Y0jC0nV6Lp2QzrsIZi
         mNZ7Tj8c+W20c0fbloDHrtfj8BwjTmeoilpdNehMbs1RkYVIuRfzy+K7y9U6f0ssS+Er
         eYgUQXRGWbYbayKAh8m7NiDCm7KhCD90v/tYe6bnQXviykhTIyb2AxDGIHAZ15cHit1d
         j2bsC4EHQNhFikePPokl3o+K+ZXWG5cAsOVKhByDtDpgGEc6YawV+A5wlYZh0018AI1u
         fS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691731590; x=1692336390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMt0B07ZTzgDWLe0m642FavvJHHm3KnbXYWpIFP5EHs=;
        b=ESu4zCoIHIqhO45cUqJ8966yLqXlLbw2S735OsN6ADh/Kmj2YCodf+KVTYKx1TO3B4
         bnO7F110iKGH856+5jP3ozDiKPzWie8lIKaVpJC6ZpCvSNufz1am8q7fSBS5rojK4NIk
         jJJMlURZDAUUHAGf/UXo8U5P0Wx0fzcESX/JnW8nXC9j013lDhsnO4SZEKXbusu/QM+6
         gpFCICHd7mQhGNwpqnFBW2kg+SsP9WgfibBOUdBAjF/G1nsu9/1Irv7o/zvbh6sQeOEB
         bVZtIptygBng5XpVxdld4N8VqXCm9u9puwS21ifLOhy997T2Ex73vmO1BEOGT/lfIyzH
         6XUA==
X-Gm-Message-State: AOJu0Yzslzs9wiLjwiYRW00+6PVwP7u0ezl5kE1KmxBDbuPxxksn+fRr
	eMicxqGSnDMvLis/+Bj9/E02JtJS1YWXRn/L3L8=
X-Google-Smtp-Source: AGHT+IHaUDkjytuhknW5H68CRK2+XJ73oiY4NgT2rRqWouTWR4TDIQuar8Pc15IziwSFhdvnzMicHQ==
X-Received: by 2002:a2e:8791:0:b0:2b6:c081:6323 with SMTP id n17-20020a2e8791000000b002b6c0816323mr705607lji.50.1691731589498;
        Thu, 10 Aug 2023 22:26:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003fe24441e23sm4014104wmh.24.2023.08.10.22.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 22:26:29 -0700 (PDT)
Date: Fri, 11 Aug 2023 08:26:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hugh Dickins <hughd@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611
 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'
Message-ID: <dd00b419-ca16-48fb-b493-890ab47cc930@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.tmpfs
head:   3a3c2ca1fb82b27073db2ae1f3eb06820e8d6143
commit: 46170cc50828c33897d192668884d570b2c4e79b [15/19] xattr: simple_xattr_set() return old_xattr to be freed
config: mips-randconfig-m031-20230809 (https://download.01.org/0day-ci/archive/20230811/202308111016.rximb8Ah-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111016.rximb8Ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308111016.rximb8Ah-lkp@intel.com/

smatch warnings:
mm/shmem.c:3611 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +3611 mm/shmem.c

aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3594  static int shmem_xattr_handler_set(const struct xattr_handler *handler,
39f60c1ccee72c Christian Brauner   2023-01-13  3595  				   struct mnt_idmap *idmap,
5930122683dff5 Al Viro             2016-05-27  3596  				   struct dentry *unused, struct inode *inode,
5930122683dff5 Al Viro             2016-05-27  3597  				   const char *name, const void *value,
5930122683dff5 Al Viro             2016-05-27  3598  				   size_t size, int flags)
b09e0fa4b4ea66 Eric Paris          2011-05-24  3599  {
5930122683dff5 Al Viro             2016-05-27  3600  	struct shmem_inode_info *info = SHMEM_I(inode);
46170cc50828c3 Hugh Dickins        2023-08-08  3601  	struct simple_xattr *old_xattr;
b09e0fa4b4ea66 Eric Paris          2011-05-24  3602  
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3603  	name = xattr_full_name(handler, name);
46170cc50828c3 Hugh Dickins        2023-08-08  3604  	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
46170cc50828c3 Hugh Dickins        2023-08-08  3605  	if (!IS_ERR(old_xattr)) {
46170cc50828c3 Hugh Dickins        2023-08-08  3606  		simple_xattr_free(old_xattr);
46170cc50828c3 Hugh Dickins        2023-08-08  3607  		old_xattr = NULL;
36f05cab0a2c97 Jeff Layton         2022-09-09  3608  		inode->i_ctime = current_time(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3609  		inode_inc_iversion(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3610  	}
46170cc50828c3 Hugh Dickins        2023-08-08 @3611  	return PTR_ERR(old_xattr);

This code is correct but it would be nicer to reverse the checking:

	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
	if (IS_ERR(old_xattr))
		return PTR_ERR(old_xattr);

	simple_xattr_free(old_xattr);
	inode->i_ctime = current_time(inode);
	inode_inc_iversion(inode);

	return 0;

b09e0fa4b4ea66 Eric Paris          2011-05-24  3612  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

