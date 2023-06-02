Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8E79F6
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jun 2023 07:50:28 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso1733298f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 02 Jun 2023 00:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685692225; x=1688284225;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NvA6TPqwWYJBBM3KRh/gfP2SQJsI9HaN4QQfikDaaUQ=;
        b=c7+ynRzMurKCDeCkS0/J/1fxGF4iX3h5zqwjj15Y61n58J0O7RpI9NvzQuVho6NFoY
         hFO6PF9ptwu68j77REdAgeIxlIHegoF9BPn5IPiJbVFKAZ3/wzdBtd/2GjK7ZFX22uaw
         hcXuMtQnfiRwLy3poKdlGhjzqkRbfk1demqnnrWeRcPKHKyItpnm5qs1t5lpF1YV0D8T
         CD+RHbw0My0Oi8AnzxEl3Tqfw4bIsQlIY7SwyGE5NTz+wleOHckjAdbwzFtE0algQ+ck
         ejSPmBxry5U/Eb+dvMUglqKVF6/IRWaSBnWl10vY5v+jdY24pywbqUVgaGP5fJXf/fnO
         5Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692225; x=1688284225;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvA6TPqwWYJBBM3KRh/gfP2SQJsI9HaN4QQfikDaaUQ=;
        b=eWObeZvWdAZ7xpTgv6ooZ8S+JPXZDBhIzcI7pu1ZamVBlqwXsGAGJ+NaD2GJiauf8P
         rf5mQWvc1bBTMIF/EAoqNMorLymqfNl0RGmloXWW+bBREI7ZZSyc8IY2AEyvysc20RSL
         miSB9jmx8RoFKo5251hROjjE8YvFP4CpxVxkAFSBK0qar707dysuGwRNmouZpps5vLDO
         DCZq+VXepAFdm1cTdjgvN0rQRl61NL8VZbPSDYZm0/CPgMoKE0S8tOllUFtGtLRmhGjS
         SUgj9vbQSINvRDgZLH2nBGbv+P1uSpQooYx/rKpIhgpICLkVod/98jk0B3MDAY04BTSf
         9JrA==
X-Gm-Message-State: AC+VfDydBrO+udSHGD60G2GSc4Y3FSFYE3MZVBIViTaJL2E0qKIM2LWX
	vmviIhhqjMlxBneiUXKwCtYSyFnzJhFYHFd5ruQ=
X-Google-Smtp-Source: ACHHUZ7iV15ZFq7wZFlotpy8GQSUVIyR3DxbbrgM8JdDhTS9nAw61tUfGZkob9WTP8rybK0lRUMjYA==
X-Received: by 2002:a05:6000:10d:b0:309:3e1e:fa23 with SMTP id o13-20020a056000010d00b003093e1efa23mr3398172wrx.19.1685692225433;
        Fri, 02 Jun 2023 00:50:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d564b000000b00307c8d6b4a0sm891595wrw.26.2023.06.02.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:50:22 -0700 (PDT)
Date: Fri, 2 Jun 2023 10:50:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amritha Nambiar <amritha.nambiar@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next/RFC PATCH v1 2/4] net: Add support for associating
 napi with queue[s]
Message-ID: <815f93a9-0d50-4b19-88ee-3bf9cdf16af0@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168564135094.7284.9691772825401908320.stgit@anambiarhost.jf.intel.com>

Hi Amritha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amritha-Nambiar/net-Introduce-new-napi-fields-for-rx-tx-queues/20230602-013021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/168564135094.7284.9691772825401908320.stgit%40anambiarhost.jf.intel.com
patch subject: [net-next/RFC PATCH v1 2/4] net: Add support for associating napi with queue[s]
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020821.NcqBX7pS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306020821.NcqBX7pS-lkp@intel.com/

New smatch warnings:
net/core/dev.c:6396 netif_napi_add_queue() warn: possible memory leak of 'napi_queue'

Old smatch warnings:
net/core/dev.c:10454 netdev_run_todo() warn: passing freed memory 'dev'

vim +/napi_queue +6396 net/core/dev.c

9b6d735207c0eb Amritha Nambiar 2023-06-01  6377  int netif_napi_add_queue(struct napi_struct *napi, u16 queue_index,
9b6d735207c0eb Amritha Nambiar 2023-06-01  6378  			 enum napi_container_type type)
9b6d735207c0eb Amritha Nambiar 2023-06-01  6379  {
9b6d735207c0eb Amritha Nambiar 2023-06-01  6380  	struct napi_queue *napi_queue;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6381  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6382  	napi_queue = kzalloc(sizeof(*napi_queue), GFP_KERNEL);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6383  	if (!napi_queue)
9b6d735207c0eb Amritha Nambiar 2023-06-01  6384  		return -ENOMEM;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6385  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6386  	napi_queue->queue_index = queue_index;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6387  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6388  	switch (type) {
9b6d735207c0eb Amritha Nambiar 2023-06-01  6389  	case NAPI_RX_CONTAINER:
9b6d735207c0eb Amritha Nambiar 2023-06-01  6390  		list_add_rcu(&napi_queue->q_list, &napi->napi_rxq_list);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6391  		break;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6392  	case NAPI_TX_CONTAINER:
9b6d735207c0eb Amritha Nambiar 2023-06-01  6393  		list_add_rcu(&napi_queue->q_list, &napi->napi_txq_list);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6394  		break;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6395  	default:
9b6d735207c0eb Amritha Nambiar 2023-06-01 @6396  		return -EINVAL;

This path is likely impossible, right?  Smatch still wants a
kfree(napi_queue); before the return.

9b6d735207c0eb Amritha Nambiar 2023-06-01  6397  	}
9b6d735207c0eb Amritha Nambiar 2023-06-01  6398  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6399  	return 0;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6400  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

