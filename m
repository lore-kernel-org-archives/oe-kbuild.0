Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8866F6AA3;
	Mon, 30 Jan 2023 17:17:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id be8so12318574plb.7;
        Mon, 30 Jan 2023 09:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAyqow/UTkUmtGFouNCCxZg1VuXYo0fNe8XAXhOMaWg=;
        b=XYuXFtbGkv3FLZvpTUR2MBP73UcfXwA1WTu/JgANaKhFN3JvR2VtJMT403HmdkupHu
         +WVw6H1bfSpZsQfZm3OPH5gJsdTqNUV9YRaruRODOkch61Nfbcff0p4cRUCDmHRx2QF+
         XvvgwdBLABMEXTZtm6hjTewHUhzwN8sff5sepFveOlcJCuSbK8GLHH0cMDtK/I33vFuU
         pyo+R3QT6s8s9B9UePinpIBYe6FY2qopkxHbRxtEWksxOFQSmW78TCY2sb+6zyE/JOqX
         uowhNSeUkSLzTeWrMNCPPwtIKPQo1MKC26/gy913PqGqvOrCRHxlh1OsYqeZlypajkln
         PoWw==
X-Gm-Message-State: AO0yUKXDxQp9V0t+pOxushCbSvOHYH8CGG//Z8N/QOEYh5pvMP78PUMB
	ymnlx5FXuzb4YxV+zb+bJN0=
X-Google-Smtp-Source: AK7set+EenxbQVuuFBPO3sAvTSgFOhBBOXkxXsXjo/MKy4bDCAeOJoDjb3ecb28FgCt8chh9Kkm+1A==
X-Received: by 2002:a17:902:c94a:b0:196:88b8:8612 with SMTP id i10-20020a170902c94a00b0019688b88612mr5093895pla.25.1675099069706;
        Mon, 30 Jan 2023 09:17:49 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:5016:3bcd:59fe:334b? ([2620:15c:211:201:5016:3bcd:59fe:334b])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902da8600b0019601f98550sm8075811plx.132.2023.01.30.09.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 09:17:48 -0800 (PST)
Message-ID: <86d54cb0-3f94-13f2-e597-0209493254c9@acm.org>
Date: Mon, 30 Jan 2023 09:17:46 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [bvanassche:block-small-segments 10/13] block/blk.h:343
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 340)
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202301292052.ofpUPNlC-lkp@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202301292052.ofpUPNlC-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/23 03:36, Dan Carpenter wrote:
> tree:   https://github.com/bvanassche/linux block-small-segments
> head:   c776ad1c2e1e0afaefb3ef5f1710dc3886f5348f
> commit: b91c4a42d14ad8bfd74387c10c8c21db9fb2b998 [10/13] block: Add support for filesystem requests and small segments
> config: m68k-randconfig-m041-20230129 (https://download.01.org/0day-ci/archive/20230129/202301292052.ofpUPNlC-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> block/blk.h:343 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 340)
> 
> vim +343 block/blk.h
> 
> c55ddd9082f757 Christoph Hellwig 2022-07-27  323  static inline bool bio_may_exceed_limits(struct bio *bio,
> aa261f20589d89 Bart Van Assche   2022-10-25  324  					 const struct queue_limits *lim)
> abd45c159df5fc Jens Axboe        2021-10-13  325  {
> abd45c159df5fc Jens Axboe        2021-10-13  326  	switch (bio_op(bio)) {
> abd45c159df5fc Jens Axboe        2021-10-13  327  	case REQ_OP_DISCARD:
> abd45c159df5fc Jens Axboe        2021-10-13  328  	case REQ_OP_SECURE_ERASE:
> abd45c159df5fc Jens Axboe        2021-10-13  329  	case REQ_OP_WRITE_ZEROES:
> abd45c159df5fc Jens Axboe        2021-10-13  330  		return true; /* non-trivial splitting decisions */
> abd45c159df5fc Jens Axboe        2021-10-13  331  	default:
> abd45c159df5fc Jens Axboe        2021-10-13  332  		break;
> abd45c159df5fc Jens Axboe        2021-10-13  333  	}
> abd45c159df5fc Jens Axboe        2021-10-13  334
> abd45c159df5fc Jens Axboe        2021-10-13  335  	/*
> b91c4a42d14ad8 Bart Van Assche   2022-09-27  336  	 * Check whether bio splitting should be performed. This check may
> b91c4a42d14ad8 Bart Van Assche   2022-09-27  337  	 * trigger the bio splitting code even if splitting is not necessary.
> abd45c159df5fc Jens Axboe        2021-10-13  338  	 */
> b91c4a42d14ad8 Bart Van Assche   2022-09-27  339  	if (blk_queue_sub_page_limits(lim) &&
> b91c4a42d14ad8 Bart Van Assche   2022-09-27 @340  	    bio->bi_io_vec && bio->bi_io_vec->bv_len > lim->max_segment_size)
>                                                              ^^^^^^^^^^^^^^
> Check for NULL
> 
> b91c4a42d14ad8 Bart Van Assche   2022-09-27  341  		return true;
> c55ddd9082f757 Christoph Hellwig 2022-07-27  342  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
> abd45c159df5fc Jens Axboe        2021-10-13 @343  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
>                                                                  ^^^^^^^^^^^^^^^^
> Unchecked dereference
> 
> abd45c159df5fc Jens Axboe        2021-10-13  344  }

Hi Dan,

I think in this case the unchecked dereference is safe.
bio->bi_vcnt == 1 implies that bio->bi_io_vec is not NULL.

Thanks,

Bart.


