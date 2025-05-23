Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFBB23A9BD
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994344; cv=none; b=BKwBzdxaJG7dBQiKgWPjJCFHlH/v6bX1oLCnA3s8Ik8qFbFgesHbvYkaaEGadKFhvgJeA/7tVV/VGY8h2D6Oahm2v80EICuV8uf14ySZNMlhspvMWxeGdXMgJLMh8lAnbcRJqXXqiYHnpfsuH4xmFmKvB5a+3P4d15AlzSPY6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994344; c=relaxed/simple;
	bh=sOTzNX+QtEQKIe4p3xpWgGKk7sRb/GoSk1b2cMqAYKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMIE4pzCKSzSCtHgU5187VA78vYxTtPsrPWnqhF4UFodkTWS4KushJl82I6tGMAx1VYPfZpvO9+hXAMLc4xBwESo2vRN1LaCzB7M9PfFva7xLQoS7pA6+WbD+8Paxv21L7w4QJyjvqQEdbCuCkoz8EsrreHZ68voq/6g4XJA3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=We4kIVSy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="We4kIVSy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf257158fso69444775e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747994341; x=1748599141; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky7N7zgOvv1ZePfl6ZS7WcKMQTdT+DntzszzzsUT03k=;
        b=We4kIVSyhnfdyd5/suAtFTkEvH40kpk+rm8ieFcoydZermF+3v/ecCXE6mDYWieb7O
         n78Mbn1QBJeE3uQg+BdUZHUWH4tZ0mFnHCjy3XWwd+ilIR+WlfHTnA3zKBt1IT0Husdj
         KMANIyBErsxoz5B10rmkcx+xV0InjBoh3unGxvzOHp+wydnP4hqECltHbMivUehFTf2D
         PBbuuXGk+pezQD9jW51Wgg4cnd4Jp6aPI7cTj9DSexiKI6OiTQUlhoxAuikajwwT9mI2
         LMdtoID+SzNU9nsWhsD1aOF2w6XFFvKVuSbgDYJf7BvC8zN0xpO+3pRH1kIk6X+A7bGj
         2d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994341; x=1748599141;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky7N7zgOvv1ZePfl6ZS7WcKMQTdT+DntzszzzsUT03k=;
        b=HG7SpZQ8V9uGLz1MrloZTplp+K8vcU654uG20XIvKjppAXfwUs8TIPzxg0VtpY6+7o
         n7/iZeQOH/z+Ux2PTaEiVfQrTkbNap9aEvEw8HWUY6fcfujbA+zdPRQPZzyaXgS9DIQE
         I1u7aZcPJk5rLfqWvilZDJZDkH2Z/5NaI8gQKDH6Wu62wIr1JybuAQjZyxlNillDWhE6
         1yoWAxnjOdIAReG1+Bq+GXg6c8edb6Ylbd/6KopYYkpVk5h9X/wIWC1v8TewUdFfWY2d
         QObggxOtB7Kl99ch+0O9fN3BfB8OnU2gcLCb5MeyBD7Ncy5e+GgifibR6YJ/lZnXsJKe
         AvYQ==
X-Gm-Message-State: AOJu0YznXdMH/Vc13w+udyI/oweEZjCVHMrfonCuiWYBE1XSdyBjr5av
	MfNIc4+cdSYFG8BpFUdV4lGN8zf/7nWhX0FbjoXgLYtCvZyaB3Tzr3+jQrN7V9TDuh5UdmjkMZY
	qbhWO
X-Gm-Gg: ASbGncs843MyJpncFQL5dWCb4vuQ0a/ge5iSHx5s5LktLNFoypyw50Rh+JAfcAs0E7B
	KuzgySST3D1N+stGx2of3BuvI6R2RmeLGua0BI2Ooi+2hQbbcTWaP3FhAuaMsXIn2S33KSTfeo2
	h/4wA71Wv3t/K8qt0yGeQkMzq7LyavxHPqb1h6DO1hDCJ+tg1cxH+2Y6dYxDIE2wkOBOtHmIMmx
	SHIBJV1J8YmhIPdZpt1esG5ukxsQF0y5UoSHJwYfIFIq4sSeGGK68NrTYjzmaYdmR336P4vT3zm
	JJULl6Um4jskDpdGIZTn5perCiBKzvtrPbLwfiSD0ZtLy1pvBhChGIQv
X-Google-Smtp-Source: AGHT+IH5MW196hi1a+GGyI7a3FFU+dB1gm0exsPw7cu83Sp950UVRyK9+IA81RAahFK7xGZzOjL1Uw==
X-Received: by 2002:a05:600c:3d8e:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-442ff032801mr250427695e9.24.1747994340926;
        Fri, 23 May 2025 02:59:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442ebd46aa4sm225773565e9.1.2025.05.23.02.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:59:00 -0700 (PDT)
Date: Fri, 23 May 2025 12:58:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Carlos Maiolino <cem@kernel.org>,
	Hans Holmberg <hans.holmberg@wdc.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 10746/11779] fs/xfs/xfs_mru_cache.c:451
 xfs_mru_cache_insert() error: we previously assumed 'mru' could be null (see
 line 429)
Message-ID: <202505211940.jjLX0rQI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250523095857.xtkxtAycYIQcUn4E6TQ15ZM0F4JcDEUCOdTw9xIhfxo@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 70b95cb86513d7f6d084ddc8e961a1cab9022e14 [10746/11779] xfs: free the item in xfs_mru_cache_insert on failure
config: i386-randconfig-141-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211940.jjLX0rQI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505211940.jjLX0rQI-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_mru_cache.c:451 xfs_mru_cache_insert() error: we previously assumed 'mru' could be null (see line 429)

vim +/mru +451 fs/xfs/xfs_mru_cache.c

2a82b8be8a8dac David Chinner     2007-07-11  420  int
2a82b8be8a8dac David Chinner     2007-07-11  421  xfs_mru_cache_insert(
22328d712dd7fd Christoph Hellwig 2014-04-23  422  	struct xfs_mru_cache	*mru,
2a82b8be8a8dac David Chinner     2007-07-11  423  	unsigned long		key,
22328d712dd7fd Christoph Hellwig 2014-04-23  424  	struct xfs_mru_cache_elem *elem)
2a82b8be8a8dac David Chinner     2007-07-11  425  {
70b95cb86513d7 Christoph Hellwig 2025-05-14  426  	int			error = -EINVAL;
2a82b8be8a8dac David Chinner     2007-07-11  427  
2a82b8be8a8dac David Chinner     2007-07-11  428  	ASSERT(mru && mru->lists);
2a82b8be8a8dac David Chinner     2007-07-11 @429  	if (!mru || !mru->lists)

mru can't be NULL but if it were

70b95cb86513d7 Christoph Hellwig 2025-05-14  430  		goto out_free;
2a82b8be8a8dac David Chinner     2007-07-11  431  
70b95cb86513d7 Christoph Hellwig 2025-05-14  432  	error = -ENOMEM;
0b3a76e955ebe3 Dave Chinner      2024-01-16  433  	if (radix_tree_preload(GFP_KERNEL))
70b95cb86513d7 Christoph Hellwig 2025-05-14  434  		goto out_free;
2a82b8be8a8dac David Chinner     2007-07-11  435  
2a82b8be8a8dac David Chinner     2007-07-11  436  	INIT_LIST_HEAD(&elem->list_node);
2a82b8be8a8dac David Chinner     2007-07-11  437  	elem->key = key;
2a82b8be8a8dac David Chinner     2007-07-11  438  
ba74d0cba51dca Eric Sandeen      2007-10-11  439  	spin_lock(&mru->lock);
2451337dd04390 Dave Chinner      2014-06-25  440  	error = radix_tree_insert(&mru->store, key, elem);
2a82b8be8a8dac David Chinner     2007-07-11  441  	radix_tree_preload_end();
22328d712dd7fd Christoph Hellwig 2014-04-23  442  	if (!error)
2a82b8be8a8dac David Chinner     2007-07-11  443  		_xfs_mru_cache_list_insert(mru, elem);
ba74d0cba51dca Eric Sandeen      2007-10-11  444  	spin_unlock(&mru->lock);
2a82b8be8a8dac David Chinner     2007-07-11  445  
70b95cb86513d7 Christoph Hellwig 2025-05-14  446  	if (error)
70b95cb86513d7 Christoph Hellwig 2025-05-14  447  		goto out_free;
70b95cb86513d7 Christoph Hellwig 2025-05-14  448  	return 0;
70b95cb86513d7 Christoph Hellwig 2025-05-14  449  
70b95cb86513d7 Christoph Hellwig 2025-05-14  450  out_free:
70b95cb86513d7 Christoph Hellwig 2025-05-14 @451  	mru->free_func(mru->data, elem);

then we are toast.

ce695c6551f948 Christoph Hellwig 2014-04-23  452  	return error;
2a82b8be8a8dac David Chinner     2007-07-11  453  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

