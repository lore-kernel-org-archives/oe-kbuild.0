Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D042A1FA2;
	Thu, 23 Feb 2023 05:48:17 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r7so9569057wrz.6;
        Wed, 22 Feb 2023 21:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dH4zWI71gzYFegH27VmtZoaCO9J50O+AZGM8+yuOejo=;
        b=JsICSauQ2Xlqkr4a93nk3v/DKUoZ/gOzaKzGNwzJhrASxAVQ3Oh87tI6B3WYV0vw7e
         CARNIqgVMSJZEwS2ODac9XQVmUe5FANNXSTpTNDwMBXFAVLGz+2dhkb3IogaaQnJEqLd
         +TVDLLfCrhLPA6TAsoKkTuG0gqgc2pnp55UzDAiWcPEu8i1suJ/c4z3HVAz1sl2xsyUI
         qcmW7zJ4xNvGiLho/QnaGWVUilbG5Xt04tCkG6fpJd2ZEmBQp6EfblZvqhA1a0c2pPC4
         GxnOyQbVvsDciQuPwvYmLvVKo47gP2KqYIyvZfFKZwWmZoRtQAPLHpM3WjUtWDMWtEqe
         f88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dH4zWI71gzYFegH27VmtZoaCO9J50O+AZGM8+yuOejo=;
        b=Qx5hu4lEd3ohw2AoQ+112lIxJxU2UiPsKmsYyKR/pJYDPGxVDjfAdAJjc95sU/v+Qr
         beIayGBH2SD2IX0lXGOOblDuYavWM26O2rfzyMDlaumH4ar0KGX07uxdbLTs2zqdTKVq
         /MYOTLJHkXjVtE0aNEs+mfccs7sy/MxHBApzVUzxSlo2bG47yXfma+2ZQ9VQELYWP+Hy
         QM1QUbyDjJYKb+ts6v3Hv5rQsKJLTioLQRVtT7iWthdo5rgf9L00hAdEfS1pXJO5m7mZ
         Tiblh7UVjdmqRNC0CK3UOgYA4scA1Cdncp17fOuF1tlSplObsiempwXk9K2CBJOjRavf
         RKxQ==
X-Gm-Message-State: AO0yUKWDD7dwWDxSuf2ZdYl/72lykHjYcvBKVyF4o5LoTBlNqWEXafPu
	aOm0q+Cdj+3XlJEhKp73nxtjfqf2O4zXkw==
X-Google-Smtp-Source: AK7set/etG+wbWS4SPICBmykjWg5qmNmUo2G+5g0V6vtMU5QCEsRGZRQmo5sFcBNQFwxjBF+lBFsNA==
X-Received: by 2002:a05:6000:1cc:b0:2c5:598a:dd05 with SMTP id t12-20020a05600001cc00b002c5598add05mr9479277wrx.2.1677131295567;
        Wed, 22 Feb 2023 21:48:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c5-20020a5d4cc5000000b002c59f18674asm8631239wrt.22.2023.02.22.21.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 21:48:15 -0800 (PST)
Date: Thu, 23 Feb 2023 08:48:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kemeng Shi <shikemeng@huaweicloud.com>,
	paolo.valente@linaro.org, axboe@kernel.dk, jack@suse.cz
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: Re: [PATCH 17/17] block, bfq: remove unnecessary local variable
 __bfqq in bfq_setup_merge
Message-ID: <202302200841.9zinyY7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219104309.1511562-18-shikemeng@huaweicloud.com>
Message-ID: <20230223054812.JVqH_Bg8xJHCpqu__zVH6lA7ZlR0dmW9kW_bGf8lzc4@z>

Hi Kemeng,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/block-bfq-properly-mark-bfqq-remained-idle/20230219-104312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230219104309.1511562-18-shikemeng%40huaweicloud.com
patch subject: [PATCH 17/17] block, bfq: remove unnecessary local variable __bfqq in bfq_setup_merge
config: openrisc-randconfig-m041-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200841.9zinyY7i-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302200841.9zinyY7i-lkp@intel.com/

New smatch warnings:
block/bfq-iosched.c:2785 bfq_setup_merge() error: we previously assumed 'new_bfqq' could be null (see line 2766)

Old smatch warnings:
block/bfq-iosched.c:6195 __bfq_insert_request() warn: variable dereferenced before check 'bfqq' (see line 6191)

vim +/new_bfqq +2785 block/bfq-iosched.c

36eca894832351 Arianna Avanzini 2017-04-12  2751  static struct bfq_queue *
36eca894832351 Arianna Avanzini 2017-04-12  2752  bfq_setup_merge(struct bfq_queue *bfqq, struct bfq_queue *new_bfqq)
36eca894832351 Arianna Avanzini 2017-04-12  2753  {
36eca894832351 Arianna Avanzini 2017-04-12  2754  	int process_refs, new_process_refs;
36eca894832351 Arianna Avanzini 2017-04-12  2755  
36eca894832351 Arianna Avanzini 2017-04-12  2756  	/*
36eca894832351 Arianna Avanzini 2017-04-12  2757  	 * If there are no process references on the new_bfqq, then it is
36eca894832351 Arianna Avanzini 2017-04-12  2758  	 * unsafe to follow the ->new_bfqq chain as other bfqq's in the chain
36eca894832351 Arianna Avanzini 2017-04-12  2759  	 * may have dropped their last reference (not just their last process
36eca894832351 Arianna Avanzini 2017-04-12  2760  	 * reference).
36eca894832351 Arianna Avanzini 2017-04-12  2761  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2762  	if (!bfqq_process_refs(new_bfqq))
36eca894832351 Arianna Avanzini 2017-04-12  2763  		return NULL;
36eca894832351 Arianna Avanzini 2017-04-12  2764  
36eca894832351 Arianna Avanzini 2017-04-12  2765  	/* Avoid a circular list and skip interim queue merges. */
114533e1e26a36 Kemeng Shi       2023-02-19 @2766  	while ((new_bfqq = new_bfqq->new_bfqq)) {
114533e1e26a36 Kemeng Shi       2023-02-19  2767  		if (new_bfqq == bfqq)
36eca894832351 Arianna Avanzini 2017-04-12  2768  			return NULL;
36eca894832351 Arianna Avanzini 2017-04-12  2769  	}

This now loops until new_bfqq is NULL.

36eca894832351 Arianna Avanzini 2017-04-12  2770  
36eca894832351 Arianna Avanzini 2017-04-12  2771  	process_refs = bfqq_process_refs(bfqq);
36eca894832351 Arianna Avanzini 2017-04-12  2772  	new_process_refs = bfqq_process_refs(new_bfqq);

What?

36eca894832351 Arianna Avanzini 2017-04-12  2773  	/*
36eca894832351 Arianna Avanzini 2017-04-12  2774  	 * If the process for the bfqq has gone away, there is no
36eca894832351 Arianna Avanzini 2017-04-12  2775  	 * sense in merging the queues.
36eca894832351 Arianna Avanzini 2017-04-12  2776  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2777  	if (process_refs == 0 || new_process_refs == 0)
36eca894832351 Arianna Avanzini 2017-04-12  2778  		return NULL;
36eca894832351 Arianna Avanzini 2017-04-12  2779  
c1cee4ab36acef Jan Kara         2022-04-01  2780  	/*
c1cee4ab36acef Jan Kara         2022-04-01  2781  	 * Make sure merged queues belong to the same parent. Parents could
c1cee4ab36acef Jan Kara         2022-04-01  2782  	 * have changed since the time we decided the two queues are suitable
c1cee4ab36acef Jan Kara         2022-04-01  2783  	 * for merging.
c1cee4ab36acef Jan Kara         2022-04-01  2784  	 */
c1cee4ab36acef Jan Kara         2022-04-01 @2785  	if (new_bfqq->entity.parent != bfqq->entity.parent)
c1cee4ab36acef Jan Kara         2022-04-01  2786  		return NULL;
c1cee4ab36acef Jan Kara         2022-04-01  2787  
36eca894832351 Arianna Avanzini 2017-04-12  2788  	bfq_log_bfqq(bfqq->bfqd, bfqq, "scheduling merge with queue %d",
36eca894832351 Arianna Avanzini 2017-04-12  2789  		new_bfqq->pid);
36eca894832351 Arianna Avanzini 2017-04-12  2790  
36eca894832351 Arianna Avanzini 2017-04-12  2791  	/*
36eca894832351 Arianna Avanzini 2017-04-12  2792  	 * Merging is just a redirection: the requests of the process
36eca894832351 Arianna Avanzini 2017-04-12  2793  	 * owning one of the two queues are redirected to the other queue.
36eca894832351 Arianna Avanzini 2017-04-12  2794  	 * The latter queue, in its turn, is set as shared if this is the
36eca894832351 Arianna Avanzini 2017-04-12  2795  	 * first time that the requests of some process are redirected to
36eca894832351 Arianna Avanzini 2017-04-12  2796  	 * it.
36eca894832351 Arianna Avanzini 2017-04-12  2797  	 *
6fa3e8d34204d5 Paolo Valente    2017-04-12  2798  	 * We redirect bfqq to new_bfqq and not the opposite, because
6fa3e8d34204d5 Paolo Valente    2017-04-12  2799  	 * we are in the context of the process owning bfqq, thus we
6fa3e8d34204d5 Paolo Valente    2017-04-12  2800  	 * have the io_cq of this process. So we can immediately
6fa3e8d34204d5 Paolo Valente    2017-04-12  2801  	 * configure this io_cq to redirect the requests of the
6fa3e8d34204d5 Paolo Valente    2017-04-12  2802  	 * process to new_bfqq. In contrast, the io_cq of new_bfqq is
6fa3e8d34204d5 Paolo Valente    2017-04-12  2803  	 * not available any more (new_bfqq->bic == NULL).
6fa3e8d34204d5 Paolo Valente    2017-04-12  2804  	 *
6fa3e8d34204d5 Paolo Valente    2017-04-12  2805  	 * Anyway, even in case new_bfqq coincides with the in-service
6fa3e8d34204d5 Paolo Valente    2017-04-12  2806  	 * queue, redirecting requests the in-service queue is the
6fa3e8d34204d5 Paolo Valente    2017-04-12  2807  	 * best option, as we feed the in-service queue with new
6fa3e8d34204d5 Paolo Valente    2017-04-12  2808  	 * requests close to the last request served and, by doing so,
6fa3e8d34204d5 Paolo Valente    2017-04-12  2809  	 * are likely to increase the throughput.
36eca894832351 Arianna Avanzini 2017-04-12  2810  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2811  	bfqq->new_bfqq = new_bfqq;
15729ff8143f81 Paolo Valente    2021-11-25  2812  	/*
15729ff8143f81 Paolo Valente    2021-11-25  2813  	 * The above assignment schedules the following redirections:
15729ff8143f81 Paolo Valente    2021-11-25  2814  	 * each time some I/O for bfqq arrives, the process that
15729ff8143f81 Paolo Valente    2021-11-25  2815  	 * generated that I/O is disassociated from bfqq and
15729ff8143f81 Paolo Valente    2021-11-25  2816  	 * associated with new_bfqq. Here we increases new_bfqq->ref
15729ff8143f81 Paolo Valente    2021-11-25  2817  	 * in advance, adding the number of processes that are
15729ff8143f81 Paolo Valente    2021-11-25  2818  	 * expected to be associated with new_bfqq as they happen to
15729ff8143f81 Paolo Valente    2021-11-25  2819  	 * issue I/O.
15729ff8143f81 Paolo Valente    2021-11-25  2820  	 */
36eca894832351 Arianna Avanzini 2017-04-12  2821  	new_bfqq->ref += process_refs;
36eca894832351 Arianna Avanzini 2017-04-12  2822  	return new_bfqq;
36eca894832351 Arianna Avanzini 2017-04-12  2823  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

