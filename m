Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5D2D23A5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 07:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944566; cv=none; b=lH5mYHFQsYCjGe/FARUV/dl9WCvAxPKC8+syLBc52xFuNaetD0Rf8e2Vnx8auSEt5rhwIHKqXs/Kxcbg563skksUB737QLuGrDOuj7mqEL66NGZeSlD+6hytdJ/idzpUXJCdfvoM5BQ568gVAdH2RQOUmd9rWPVVxhtgWCTCbRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944566; c=relaxed/simple;
	bh=yxof3URmX9rLtpmiczmpq9jXxEYmxv/5pWBYF7OQFKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=e/it2XEKwH2/ScwK6Yjij5K24VP9PGzfqW8mevocvKjpQzRQwiXR1OQX/bnWLIWOhW4WytAt00LOSdP7ldMFqnzKgP0VzpEqiQLFLmV4UgJ+TABtiqv78NWcVng753o94TMfZ+H730K2zpIj4OIXCfkfkhMN2yFL71GzZVwTXzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiE3Aywh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiE3Aywh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426f1574a14so2898202f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760944563; x=1761549363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1ej+8gtsvFOBhqZuaO9KMzSX5cvqPOefoo5CYnjI/Q=;
        b=qiE3AywhGtmaFWwxCcCmPzBVWGzXxCTi/frN5HMVNCj/Tea0PMePNAw7r8brBICriR
         5X0FDglBaNlJgqDHjJxeB3dELSUBCjeKKkLOhja6KZIeClSwOY42i1pI60zl/4TGOEqa
         Ndp1ZyZqG1r8uT0dlZ7IMnPm83e1a/HtU11DflMtH8OMpAh8cH7tk8LOapBnzT8UXgMs
         LE8vuxJRAzpn3EL54yX83PjB+/jk50suZ28MtmLZ1dAilUviKxRtvKQ6Kf0eAYTBjQKZ
         poxGmS7nSntGgDwCJ3mOrBHL6FLOKL0FNHS4rJcaZPtpJ4povYcwA9m17rIWOIb8F3Dn
         CBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944563; x=1761549363;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1ej+8gtsvFOBhqZuaO9KMzSX5cvqPOefoo5CYnjI/Q=;
        b=ioSTr+dlSBG+hLy5DyQAlnaku9KDPQic8XNCQYebd7eVdfLIqgQkF0sjIo7H3QpP+t
         FqIoByNkydxqija3WPP08qaYOxpp+ieaSeSBQ+cVtRmIG90nHgjea/pUOmBrg49yLceu
         SBAnL6ZBapBbRzFIp0cgtF7PSL2Af1Cb+SQzyYfWQ/i9ztXb0ISVCwrKUWIU9O2RqR5e
         xn256uU02Vh0G/CySPBOurWGqqmjMxULN2uJ7LFXpiFVt38OR1PCY429aOyiv5UELHx9
         m8PisdmxtM6iTgpPAFhCzMo0eFKsWejoQzbBZWlvwiXRWBvELuAtiCjFoyzqW7nnyvWY
         HSww==
X-Gm-Message-State: AOJu0YzGOpXCfTFRlYu3lYzdHamEiK6LDlpQWA4G9Q9PuFv3IHSMdSdk
	aPTQ8Ps/CvaXeO8Zcn85Vn2gMZiz2Xg3GV/waRcRS5MrdvElqHUjdWPHMtm7mjiJJ937KWvpq4Q
	F9ktK
X-Gm-Gg: ASbGncs+F18O/ZzIQocXzozyFTbziYizuFDFQIwweVfNL3JQum4MDxvBs3khk8qFrdS
	NY8/JH2EH0Yk+33jv4CTwi1VHsZT9sBspNseKR8xJx2y8CfO8WKyLICbTPugO+onHp8k3GGGrPu
	1O5DgNtIj1JH0xJRVv5f0mjvQ2Ivo/65pxvhyVpQg3pZlMUMBhrmPgs2/vHQR5t4nJjmL8NghKY
	M1DDB7ZwE8c1bMYsb0xJmpI9nAc5wNmMNnMejyWdoqJLMXQg1duzJfI8asJHcu0x9XR6gjLOVrc
	OGuvBcxP1qETBKmdzGaqzq1599Ka3q1OkhzZHAQtyX8FWUVIMSQ0r3IzUwzveBt9uO1mLvrwoLD
	Kjcb8V6DXxXDy301vakJd/8jHOAtYJFKF9isWoLFjCoW6ss7epabxpdwzophO8vcXHwW5v5S4d4
	v7o1G+MQ==
X-Google-Smtp-Source: AGHT+IGQTm5EXLM1N/aEKkpBtHNfkR7A7sUK0vTw/Crg1lHtzbbVskltQEePc3eMuv4zrbEPcEQ0lQ==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id 5b1f17b1804b1-4711787350dmr69398345e9.1.1760944562808;
        Mon, 20 Oct 2025 00:16:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144c82c9sm216041635e9.14.2025.10.20.00.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:16:02 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:15:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Joanne Koong <joannelkoong@gmail.com>,
	linux-fsdevel@vger.kernel.org, Luis Henriques <luis@igalia.com>,
	Gang He <dchg2000@gmail.com>, Bernd Schubert <bschubert@ddn.com>
Subject: Re: [PATCH v3 6/6] fuse: {io-uring} Queue background requests on a
 different core
Message-ID: <202510201259.MevZAfl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-reduced-nr-ring-queues_3-v3-6-6d87c8aa31ae@ddn.com>
Message-ID: <20251020071559.RpQIqNiU1O5SeDFKbu4UhJRjZ6P1Fl_GYaIKisOdJwc@z>

Hi Bernd,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-io-uring-Add-queue-length-counters/20251014-024703
base:   ec714e371f22f716a04e6ecb2a24988c92b26911
patch link:    https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-6-6d87c8aa31ae%40ddn.com
patch subject: [PATCH v3 6/6] fuse: {io-uring} Queue background requests on a different core
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251020/202510201259.MevZAfl5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510201259.MevZAfl5-lkp@intel.com/

smatch warnings:
fs/fuse/dev_uring.c:1389 fuse_uring_get_queue() error: uninitialized symbol 'best_numa'.

vim +/best_numa +1389 fs/fuse/dev_uring.c

2482ae85881b957 Bernd Schubert 2025-10-13  1306  static struct fuse_ring_queue *fuse_uring_get_queue(struct fuse_ring *ring,
2482ae85881b957 Bernd Schubert 2025-10-13  1307  						    bool background)
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1308  {
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1309  	unsigned int qid;
aca09b212467554 Bernd Schubert 2025-10-13  1310  	struct fuse_ring_queue *local_queue, *best_numa, *best_global;
aca09b212467554 Bernd Schubert 2025-10-13  1311  	int local_node;
aca09b212467554 Bernd Schubert 2025-10-13  1312  	const struct cpumask *numa_mask, *global_mask;
2482ae85881b957 Bernd Schubert 2025-10-13  1313  	int retries = 0;
2482ae85881b957 Bernd Schubert 2025-10-13  1314  	int weight = -1;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1315  
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1316  	qid = task_cpu(current);
868e7728394dbc8 Bernd Schubert 2025-10-13  1317  	if (WARN_ONCE(qid >= ring->max_nr_queues,
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1318  		      "Core number (%u) exceeds nr queues (%zu)\n", qid,
868e7728394dbc8 Bernd Schubert 2025-10-13  1319  		      ring->max_nr_queues))
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1320  		qid = 0;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1321  
aca09b212467554 Bernd Schubert 2025-10-13  1322  	local_node = cpu_to_node(qid);
aca09b212467554 Bernd Schubert 2025-10-13  1323  	if (WARN_ON_ONCE(local_node > ring->nr_numa_nodes))
aca09b212467554 Bernd Schubert 2025-10-13  1324  		local_node = 0;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1325  
2482ae85881b957 Bernd Schubert 2025-10-13  1326  	local_queue = READ_ONCE(ring->queues[qid]);
2482ae85881b957 Bernd Schubert 2025-10-13  1327  
2482ae85881b957 Bernd Schubert 2025-10-13  1328  retry:
2482ae85881b957 Bernd Schubert 2025-10-13  1329  	/*
2482ae85881b957 Bernd Schubert 2025-10-13  1330  	 * For background requests, try next CPU in same NUMA domain.
2482ae85881b957 Bernd Schubert 2025-10-13  1331  	 * I.e. cpu-0 creates async requests, cpu-1 io processes.
2482ae85881b957 Bernd Schubert 2025-10-13  1332  	 * Similar for foreground requests, when the local queue does not
2482ae85881b957 Bernd Schubert 2025-10-13  1333  	 * exist - still better to always wake the same cpu id.
2482ae85881b957 Bernd Schubert 2025-10-13  1334  	 */
2482ae85881b957 Bernd Schubert 2025-10-13  1335  	if (background || !local_queue) {
2482ae85881b957 Bernd Schubert 2025-10-13  1336  		numa_mask = ring->numa_registered_q_mask[local_node];
2482ae85881b957 Bernd Schubert 2025-10-13  1337  
2482ae85881b957 Bernd Schubert 2025-10-13  1338  		if (weight == -1)
2482ae85881b957 Bernd Schubert 2025-10-13  1339  			weight = cpumask_weight(numa_mask);
2482ae85881b957 Bernd Schubert 2025-10-13  1340  
2482ae85881b957 Bernd Schubert 2025-10-13  1341  		if (weight == 0)
2482ae85881b957 Bernd Schubert 2025-10-13  1342  			goto global;

best_numa not set on this path.

2482ae85881b957 Bernd Schubert 2025-10-13  1343  
2482ae85881b957 Bernd Schubert 2025-10-13  1344  		if (weight > 1) {
2482ae85881b957 Bernd Schubert 2025-10-13  1345  			int idx = (qid + 1) % weight;
2482ae85881b957 Bernd Schubert 2025-10-13  1346  
2482ae85881b957 Bernd Schubert 2025-10-13  1347  			qid = cpumask_nth(idx, numa_mask);
2482ae85881b957 Bernd Schubert 2025-10-13  1348  		} else {
2482ae85881b957 Bernd Schubert 2025-10-13  1349  			qid = cpumask_first(numa_mask);
2482ae85881b957 Bernd Schubert 2025-10-13  1350  		}
2482ae85881b957 Bernd Schubert 2025-10-13  1351  
2482ae85881b957 Bernd Schubert 2025-10-13  1352  		local_queue = READ_ONCE(ring->queues[qid]);
2482ae85881b957 Bernd Schubert 2025-10-13  1353  		if (WARN_ON_ONCE(!local_queue))
2482ae85881b957 Bernd Schubert 2025-10-13  1354  			return NULL;
2482ae85881b957 Bernd Schubert 2025-10-13  1355  	}
2482ae85881b957 Bernd Schubert 2025-10-13  1356  
2482ae85881b957 Bernd Schubert 2025-10-13  1357  	if (READ_ONCE(local_queue->nr_reqs) <= FURING_Q_NUMA_THRESHOLD)
aca09b212467554 Bernd Schubert 2025-10-13  1358  		return local_queue;
aca09b212467554 Bernd Schubert 2025-10-13  1359  
2482ae85881b957 Bernd Schubert 2025-10-13  1360  	if (retries < FURING_NEXT_QUEUE_RETRIES && weight > retries + 1) {
2482ae85881b957 Bernd Schubert 2025-10-13  1361  		retries++;
2482ae85881b957 Bernd Schubert 2025-10-13  1362  		local_queue = NULL;
2482ae85881b957 Bernd Schubert 2025-10-13  1363  		goto retry;
2482ae85881b957 Bernd Schubert 2025-10-13  1364  	}
2482ae85881b957 Bernd Schubert 2025-10-13  1365  
aca09b212467554 Bernd Schubert 2025-10-13  1366  	/* Find best NUMA-local queue */
aca09b212467554 Bernd Schubert 2025-10-13  1367  	numa_mask = ring->numa_registered_q_mask[local_node];
aca09b212467554 Bernd Schubert 2025-10-13  1368  	best_numa = fuse_uring_best_queue(numa_mask, ring);
aca09b212467554 Bernd Schubert 2025-10-13  1369  
aca09b212467554 Bernd Schubert 2025-10-13  1370  	/* If NUMA queue is under threshold, use it */
aca09b212467554 Bernd Schubert 2025-10-13  1371  	if (best_numa &&
aca09b212467554 Bernd Schubert 2025-10-13  1372  	    READ_ONCE(best_numa->nr_reqs) <= FURING_Q_NUMA_THRESHOLD)
aca09b212467554 Bernd Schubert 2025-10-13  1373  		return best_numa;
aca09b212467554 Bernd Schubert 2025-10-13  1374  
2482ae85881b957 Bernd Schubert 2025-10-13  1375  global:
aca09b212467554 Bernd Schubert 2025-10-13  1376  	/* NUMA queues above threshold, try global queues */
aca09b212467554 Bernd Schubert 2025-10-13  1377  	global_mask = ring->registered_q_mask;
aca09b212467554 Bernd Schubert 2025-10-13  1378  	best_global = fuse_uring_best_queue(global_mask, ring);
aca09b212467554 Bernd Schubert 2025-10-13  1379  
aca09b212467554 Bernd Schubert 2025-10-13  1380  	/* Might happen during tear down */
aca09b212467554 Bernd Schubert 2025-10-13  1381  	if (!best_global)
aca09b212467554 Bernd Schubert 2025-10-13  1382  		return NULL;
aca09b212467554 Bernd Schubert 2025-10-13  1383  
aca09b212467554 Bernd Schubert 2025-10-13  1384  	/* If global queue is under double threshold, use it */
aca09b212467554 Bernd Schubert 2025-10-13  1385  	if (READ_ONCE(best_global->nr_reqs) <= FURING_Q_GLOBAL_THRESHOLD)
aca09b212467554 Bernd Schubert 2025-10-13  1386  		return best_global;
aca09b212467554 Bernd Schubert 2025-10-13  1387  
aca09b212467554 Bernd Schubert 2025-10-13  1388  	/* There is no ideal queue, stay numa_local if possible */
aca09b212467554 Bernd Schubert 2025-10-13 @1389  	return best_numa ? best_numa : best_global;
                                                               ^^^^^^^^^
Uninitialized

c2c9af9a0b13261 Bernd Schubert 2025-01-20  1390  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

