Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C911C2325
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733725255; cv=none; b=Q9Vn+dABA9YljiIy4zeaY629TuZkLKK8Z5BDLNoZr0pcw57hmjeLnfR29sLTZ42O5UyBDd5fzI5xfLLYWjhEfQ5H/heyYiCiW5xaTj6JNpdOt7x57kFUJkU3Z0w7/4R5TKO/5BVcCppKdbxkEx60nmxJ/tGbA54k8kQlqxA14hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733725255; c=relaxed/simple;
	bh=GpYynn+iuoP7VK0sSmVZgMS2aLLGAqJHZ9w4DCaAhoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUjT5z/WCn/U6dbv3uDy+bzHJ1Z751A17sRKY2fg7sYv5GCy7TPyHUWMzXxlX/T4TWrI82qkJTF0yRJhUYDswmUUEcWb2RKpgk0D7flmqBeZrdSUtRZmKvdAf+TWM61MhaZ7dZW3ZtQUqRKaFNogGrVjJUeHGT8XCpJ61c0Ck0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qthyGVDk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qthyGVDk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1430898f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Dec 2024 22:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733725251; x=1734330051; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jJkWSBwztPHLc8SnWGYUODZCuX3iLbpG5bezmk5dRU=;
        b=qthyGVDkUM8Zcjo1kemnGMSZE1HENnQUW14t6refeKW4TUpeCCmXC2kyHkYWI7uRUy
         P3ry7Mct0rWgQVrBrUvdytS2y5SLQOYko1h2Jhec7RhRVluz4vCvUCwVekBIDih0xg9n
         ankduYb3pyupy5Cyuioduyxu0Q8OqngJar65vG5pGwCLAD5jIeMAIXCONzRcGwP9Nznw
         qosVte1p3EYzvqdxjJAwyG3GCm9Mm1wdykQqgjYmvaRhOA6MC/g3SIKA2kM0pUV4S+6X
         TvyGbOB2Sj+kbygm2etSs662OcLGuE9aoOZ8b9C4tVixKQ2klBAvj+3NRWc62CNOwkmC
         Cccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733725251; x=1734330051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jJkWSBwztPHLc8SnWGYUODZCuX3iLbpG5bezmk5dRU=;
        b=euqGq8n3j6sgT8B354Mz60Rd57D4PN7Ay5or81P9neoWLQ3E0Qzbmf0Ds/7vgdl4OQ
         h6CA79VZ7ZaeK8v3YSyU0m2P3U+pTuBN3IGpka8Gs4tLjQzeTT9lm7Wu6od44+/OYv2X
         YhVAXbg7RzzeMWyqOoz6ww2BqaTHYUnN7U2EHH8q4E5TeUnju0n1mQhwrpuyON3THL02
         glTYHToq1DcfLc0A4dT6lHSUBEk7W5/FcljpIhZtdHaiGi7RO8GRyyCdm14jwHtPxRd9
         3Ifcgk6LpTABXJQZy8b12cM/tdYLD5CW0LRK5P58uXmeOmcq9LtIgmGcZEi2tK0J7kd6
         ZffA==
X-Gm-Message-State: AOJu0YwniLPrfkbEIJZowvFUduw0CyeCdGfE3IJG8CWueEhLLEmY8QrP
	8lO3j6xm+bFSuyHSVewdsCUEJMxO5CDDQ0w4jsOY/CnTrKYW9wwRAL8c9sFEErfyGl3jsHAYg21
	c
X-Gm-Gg: ASbGncv8o97yVEmcjQRZrDWvhKk/bWZ0TjGhKDNh9lsGmqDVKnZK1E28qO9Rc2zCN/B
	eyxfuAfI7rdHl4dWvbVlW2A6PKNQDfCAp8cDvHUZIvQJZzkB83pkgC8TWAFsbTzctKwIDWPGvM5
	9MYGWseNiPmTD0osruzF6KfrmdoTj96arYZsqimIGg/KTzsbW7G++5HI0ASNyJCjgPOIrPTEx5E
	HEBYB6JlnbBrlIr2491phCUCXj7Z3PKPZKnJCYJX7XcxSoB69Cp5TE=
X-Google-Smtp-Source: AGHT+IG7w4/4RKpd6Mi9/6A3a434elfjyRGJzlFv7WKBL0P6cJmpxGL1+tFZA6BscihXHw4JGki09A==
X-Received: by 2002:a05:6000:2ac:b0:385:f7e5:de88 with SMTP id ffacd0b85a97d-3862a7722d0mr7780821f8f.3.1733725251254;
        Sun, 08 Dec 2024 22:20:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190989fsm12360852f8f.73.2024.12.08.22.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:20:50 -0800 (PST)
Date: Mon, 9 Dec 2024 09:20:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cosmin Ratiu <cratiu@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:173
 mlx5_fc_stats_query_all_counters() error: uninitialized symbol
 'bulk_query_time'.
Message-ID: <1ce44712-7b81-4ace-aae8-7284974b11f1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 918af0219a4d6a89cf02839005ede24e91f13bf6 net/mlx5: hw counters: Replace IDR+lists with xarray
config: openrisc-randconfig-r072-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071312.oNFnyT9f-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412071312.oNFnyT9f-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:173 mlx5_fc_stats_query_all_counters() error: uninitialized symbol 'bulk_query_time'.
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:174 mlx5_fc_stats_query_all_counters() error: uninitialized symbol 'bulk_base_id'.

vim +/bulk_query_time +173 drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c

918af0219a4d6a8 Cosmin Ratiu 2024-10-01  138  static void mlx5_fc_stats_query_all_counters(struct mlx5_core_dev *dev)
a351a1b03bf169f Amir Vadai   2016-07-14  139  {
5acd957a986c167 Cosmin Ratiu 2024-10-01  140  	struct mlx5_fc_stats *fc_stats = dev->priv.fc_stats;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  141  	u32 bulk_len = fc_stats->bulk_query_len;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  142  	XA_STATE(xas, &fc_stats->counters, 0);
6f06e04b67baa1c Gavi Teitz   2019-07-29  143  	u32 *data = fc_stats->bulk_query_out;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  144  	struct mlx5_fc *counter;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  145  	u32 last_bulk_id = 0;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  146  	u64 bulk_query_time;
6f06e04b67baa1c Gavi Teitz   2019-07-29  147  	u32 bulk_base_id;
a351a1b03bf169f Amir Vadai   2016-07-14  148  	int err;
a8ffcc741acb3c7 Rabie Loulou 2017-07-09  149  
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  150  	xas_lock(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  151  	xas_for_each(&xas, counter, U32_MAX) {
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  152  		if (xas_retry(&xas, counter))
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  153  			continue;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  154  		if (unlikely(counter->id >= last_bulk_id)) {
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  155  			/* Start new bulk query. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  156  			/* First id must be aligned to 4 when using bulk query. */
6f06e04b67baa1c Gavi Teitz   2019-07-29  157  			bulk_base_id = counter->id & ~0x3;
                                                                ^^^^^^^^^^^^

918af0219a4d6a8 Cosmin Ratiu 2024-10-01  158  			last_bulk_id = bulk_base_id + bulk_len;
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  159  			/* The lock is released while querying the hw and reacquired after. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  160  			xas_unlock(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  161  			/* The same id needs to be processed again in the next loop iteration. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  162  			xas_reset(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  163  			bulk_query_time = jiffies;

bulk_query_time is only initialized on this path which is marked as unlikely()
and not initialized on the else statement.

918af0219a4d6a8 Cosmin Ratiu 2024-10-01  164  			err = mlx5_cmd_fc_bulk_query(dev, bulk_base_id, bulk_len, data);
a351a1b03bf169f Amir Vadai   2016-07-14  165  			if (err) {
a351a1b03bf169f Amir Vadai   2016-07-14  166  				mlx5_core_err(dev, "Error doing bulk query: %d\n", err);
6f06e04b67baa1c Gavi Teitz   2019-07-29  167  				return;
a351a1b03bf169f Amir Vadai   2016-07-14  168  			}
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  169  			xas_lock(&xas);
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  170  			continue;
6f06e04b67baa1c Gavi Teitz   2019-07-29  171  		}
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  172  		/* Do not update counters added after bulk query was started. */
918af0219a4d6a8 Cosmin Ratiu 2024-10-01 @173  		if (time_after64(bulk_query_time, counter->cache.lastuse))
                                                                         ^^^^^^^^^^^^^^^

918af0219a4d6a8 Cosmin Ratiu 2024-10-01 @174  			update_counter_cache(counter->id - bulk_base_id, data,
                                                                                                   ^^^^^^^^^^^^

918af0219a4d6a8 Cosmin Ratiu 2024-10-01  175  					     &counter->cache);
a351a1b03bf169f Amir Vadai   2016-07-14  176  	}
918af0219a4d6a8 Cosmin Ratiu 2024-10-01  177  	xas_unlock(&xas);
a351a1b03bf169f Amir Vadai   2016-07-14  178  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

