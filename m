Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C020E3;
	Mon, 30 Jan 2023 11:36:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so9793785wma.1;
        Mon, 30 Jan 2023 03:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrDarnPGmbqJpI2Ac5e9NiskrYFVtk1vocykkxl03TA=;
        b=fmose3yisLnV0z75yGmMRo+SHWEObqm1qMiZWQAU6gBkDn2G2FZTBpGXcij3DepaGq
         yCi1xfBnHZxn/8BHYK/GtaUXhC7qMsHRcMXAZp6Z7uk3Hrn9LjlQuauVSn1mSz64Adds
         P4+MDvZ7on8qHq47MIP6zjovshGfaEeT8TZPknt4qhtIOXBNL+FaxYgV/3pnmpMOqgHs
         pDuPrdRt/ryojzFQhx8juuCtuT+E273eAjS/4EWKsAm38G/InsJ9DzQKhUEbXYA/K3ii
         PYvGhjKpMkk11F5Q78cvc59lyr2E4tVQjdVsaJkXvQdVon4u3ceZcXmtLCcSMNBDnnCN
         ly9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrDarnPGmbqJpI2Ac5e9NiskrYFVtk1vocykkxl03TA=;
        b=DStye5c/HRop24OD+j4GrNTlJUB18TEMMt2kW5xMkInaNi2NU3qpiIpC4bes1aM+kt
         /y+saQyNIZF8k3B3rxgOl2/+WlZX8zFKLdLTU+FEiOFtV5ShkQo+UOKbY9AQDBErgtxA
         hjPUathcKyQIfTLovGLxKfgjYL4w9SCrZH1bCTffTen712pIi4R/zg/CBSrS4AtoThHu
         ZAjxcatNQ2BRmj3edX9KLHiIJa5sXh2KdjXKka/wPe7vLKmiwQ/hqKjW3+sIH8nbGw6U
         691OYZMjQ8XyJtIqKAAh49M5+mJEWUjgQjwxSR+cGzs0DnWj38xZRRzMl3fscoaS0fnF
         uglw==
X-Gm-Message-State: AO0yUKVoykx6qP7K9X987mcX6Z1pwrg90ulXUQjObv3ftf4oCXWKrhdS
	muV3zDuP/yW73052GEL0bbfnpIobBi0=
X-Google-Smtp-Source: AK7set81f1p3fMSH49wXPweF7pJc2Tdrb/p8VDwUbxvLqfJxPLX4SlbGOenX7k/imqMr9OSIGz6O0A==
X-Received: by 2002:a05:600c:3197:b0:3dc:496f:ad56 with SMTP id s23-20020a05600c319700b003dc496fad56mr7914670wmp.14.1675078612887;
        Mon, 30 Jan 2023 03:36:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w8-20020a05600c2a0800b003db06224953sm13286745wme.41.2023.01.30.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 03:36:52 -0800 (PST)
Date: Mon, 30 Jan 2023 14:36:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-small-segments 10/13] block/blk.h:343
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 340)
Message-ID: <202301292052.ofpUPNlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230130113649.4LoJ0sqdZa4TfpKKQZ5FufijQUWQ-n-FJDsnFHP_q4Y@z>

tree:   https://github.com/bvanassche/linux block-small-segments
head:   c776ad1c2e1e0afaefb3ef5f1710dc3886f5348f
commit: b91c4a42d14ad8bfd74387c10c8c21db9fb2b998 [10/13] block: Add support for filesystem requests and small segments
config: m68k-randconfig-m041-20230129 (https://download.01.org/0day-ci/archive/20230129/202301292052.ofpUPNlC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
block/blk.h:343 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 340)

vim +343 block/blk.h

c55ddd9082f757 Christoph Hellwig 2022-07-27  323  static inline bool bio_may_exceed_limits(struct bio *bio,
aa261f20589d89 Bart Van Assche   2022-10-25  324  					 const struct queue_limits *lim)
abd45c159df5fc Jens Axboe        2021-10-13  325  {
abd45c159df5fc Jens Axboe        2021-10-13  326  	switch (bio_op(bio)) {
abd45c159df5fc Jens Axboe        2021-10-13  327  	case REQ_OP_DISCARD:
abd45c159df5fc Jens Axboe        2021-10-13  328  	case REQ_OP_SECURE_ERASE:
abd45c159df5fc Jens Axboe        2021-10-13  329  	case REQ_OP_WRITE_ZEROES:
abd45c159df5fc Jens Axboe        2021-10-13  330  		return true; /* non-trivial splitting decisions */
abd45c159df5fc Jens Axboe        2021-10-13  331  	default:
abd45c159df5fc Jens Axboe        2021-10-13  332  		break;
abd45c159df5fc Jens Axboe        2021-10-13  333  	}
abd45c159df5fc Jens Axboe        2021-10-13  334  
abd45c159df5fc Jens Axboe        2021-10-13  335  	/*
b91c4a42d14ad8 Bart Van Assche   2022-09-27  336  	 * Check whether bio splitting should be performed. This check may
b91c4a42d14ad8 Bart Van Assche   2022-09-27  337  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  338  	 */
b91c4a42d14ad8 Bart Van Assche   2022-09-27  339  	if (blk_queue_sub_page_limits(lim) &&
b91c4a42d14ad8 Bart Van Assche   2022-09-27 @340  	    bio->bi_io_vec && bio->bi_io_vec->bv_len > lim->max_segment_size)
                                                            ^^^^^^^^^^^^^^
Check for NULL

b91c4a42d14ad8 Bart Van Assche   2022-09-27  341  		return true;
c55ddd9082f757 Christoph Hellwig 2022-07-27  342  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
abd45c159df5fc Jens Axboe        2021-10-13 @343  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
                                                                ^^^^^^^^^^^^^^^^
Unchecked dereference

abd45c159df5fc Jens Axboe        2021-10-13  344  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

