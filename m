Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC976C2E4;
	Mon, 17 Apr 2023 07:53:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f16b99b936so6461555e9.3;
        Mon, 17 Apr 2023 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681718020; x=1684310020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erph9EYHqt1MM1Op80BFXZ+Z8QjUsK6NGG+TevBKnRk=;
        b=C0Gru8YGphp5zJUgJdd63GtTcBcd6KRldsEi89RkaZtUWhQUJK5GXd08OOzHmf06vh
         CttLKSL5XmQ2byfoMxVtyMtJFLI1K93F0nkXw1FMfEnI0hb6TGr8uypD4SWcR1e+dmO7
         LRxo7Dr0ivXhhi/x7zbNJJZmYKWYfE1rY6hxNTSo5HCxHzBrRkmld3ZjVhxKDq+hdWBf
         aG1pv+LSlcdL8PjXEQZteA7U2Gay/vhQYg9cH52NdDJWxIZtpdrV3BpK0+heP/RSNKhm
         8KI1/LVGVr/a7zCdbb4oJKT3WPt1ha5wl+cVll6S5rJXG869Oo0baiZ5s7ajnwZ92mpr
         bZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718020; x=1684310020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erph9EYHqt1MM1Op80BFXZ+Z8QjUsK6NGG+TevBKnRk=;
        b=hYP3GvP8Yp20kJ7Sd5cC18gdtDW1h4/rbnJEKhQBVnxlq+4+AgpMCPQaNh0ddNGZlx
         SBBK5wLxr9KlkS+mkl1hylSUHWw53EWaLHtMYeD5hqlxcMwUXPyBfQ5efSRuDU55N+gr
         I/PutrKEDG1sFJFo1B7CZdryXaAuCB2AONCXm4Owhw3b2/H7hZcnoyC/lKKgt8dubSCC
         yhX5+iYjBTwE9uHs8DNP8QzKk5By7EQcLkYIbi55iEYGOVgtSEDgfOwWLmSQsR9GNEKi
         rJTXlLZl4eOQAjyXr2pTJH1BxaaTlJSKWAwbJvcBxXGEBBpgDf0RcAYnoHLzwQQkRaR/
         jHTQ==
X-Gm-Message-State: AAQBX9fek2kQydnSO2t0Jp2k3UDNmWGMdZ8WIMhhBlVipmPxj9WMyIUS
	f/e4F0vZ/mvNxiaIi9665xHNDl++s0k=
X-Google-Smtp-Source: AKy350b2U+ErpNRVWmiNUAuh3pFFVyIrR8ePaaFBER5mMEtfAPKK99zBFSe2wmg8sxnW7NtRHzvQUQ==
X-Received: by 2002:a5d:564c:0:b0:2f9:e211:e869 with SMTP id j12-20020a5d564c000000b002f9e211e869mr2502323wrw.43.1681718020662;
        Mon, 17 Apr 2023 00:53:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d458b000000b002efb31d3c24sm9810774wrq.32.2023.04.17.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 00:53:40 -0700 (PDT)
Date: Mon, 17 Apr 2023 10:53:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_unmount 5/5] fs/notify/fanotify/fanotify.c:624
 fanotify_alloc_fid_event() warn: variable dereferenced before check 'hash'
 (see line 618)
Message-ID: <3417fce1-7954-4078-917f-24fd6cfb1761@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_unmount
head:   efaac6f096e1da1a16d690c1c2d344b2dc2c2665
commit: 2da6209964005a9817160559de6021b13cc66860 [5/5] fanotify: add support for FAN_UNMOUNT event
config: csky-randconfig-m031-20230411 (https://download.01.org/0day-ci/archive/20230414/202304142243.TY4tlJXX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304142243.TY4tlJXX-lkp@intel.com/

smatch warnings:
fs/notify/fanotify/fanotify.c:624 fanotify_alloc_fid_event() warn: variable dereferenced before check 'hash' (see line 618)

vim +/hash +624 fs/notify/fanotify/fanotify.c

9c61f3b560f5dd Amir Goldstein 2020-03-30  603  static struct fanotify_event *fanotify_alloc_fid_event(struct inode *id,
9c61f3b560f5dd Amir Goldstein 2020-03-30  604  						       __kernel_fsid_t *fsid,
2da6209964005a Amir Goldstein 2023-04-09  605  						       struct mount *mnt,
7e3e5c69439949 Amir Goldstein 2021-03-04  606  						       unsigned int *hash,
9c61f3b560f5dd Amir Goldstein 2020-03-30  607  						       gfp_t gfp)
9c61f3b560f5dd Amir Goldstein 2020-03-30  608  {
2da6209964005a Amir Goldstein 2023-04-09  609  	unsigned int fh_len = fanotify_encode_fh_len(id);
9c61f3b560f5dd Amir Goldstein 2020-03-30  610  	struct fanotify_fid_event *ffe;
9c61f3b560f5dd Amir Goldstein 2020-03-30  611  
9c61f3b560f5dd Amir Goldstein 2020-03-30  612  	ffe = kmem_cache_alloc(fanotify_fid_event_cachep, gfp);
9c61f3b560f5dd Amir Goldstein 2020-03-30  613  	if (!ffe)
9c61f3b560f5dd Amir Goldstein 2020-03-30  614  		return NULL;
9c61f3b560f5dd Amir Goldstein 2020-03-30  615  
9c61f3b560f5dd Amir Goldstein 2020-03-30  616  	ffe->fae.type = FANOTIFY_EVENT_TYPE_FID;
9c61f3b560f5dd Amir Goldstein 2020-03-30  617  	ffe->fsid = *fsid;
7e3e5c69439949 Amir Goldstein 2021-03-04 @618  	*hash ^= fanotify_hash_fsid(fsid);

Unchecked dereference

2da6209964005a Amir Goldstein 2023-04-09  619  	fanotify_encode_fh(&ffe->object_fh, id, fh_len, hash, gfp);
2da6209964005a Amir Goldstein 2023-04-09  620  	/* Store mntid in fid_event with fsid and null fh */
2da6209964005a Amir Goldstein 2023-04-09  621  	if (mnt && !WARN_ON_ONCE(!fh_len)) {
2da6209964005a Amir Goldstein 2023-04-09  622  		ffe->mnt_id = mnt->mnt_id;
2da6209964005a Amir Goldstein 2023-04-09  623  		ffe->object_fh.flags = FANOTIFY_FH_FLAG_MNT_ID;
2da6209964005a Amir Goldstein 2023-04-09 @624  		if (hash)

Checked too late.

2da6209964005a Amir Goldstein 2023-04-09  625  			*hash ^= fanotify_hash_mntid(mnt->mnt_id);
2da6209964005a Amir Goldstein 2023-04-09  626  	}
9c61f3b560f5dd Amir Goldstein 2020-03-30  627  
9c61f3b560f5dd Amir Goldstein 2020-03-30  628  	return &ffe->fae;
9c61f3b560f5dd Amir Goldstein 2020-03-30  629  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

