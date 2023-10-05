Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB8F4FD
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwUDmOoQ"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4064867903cso7487515e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Oct 2023 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696502558; x=1697107358; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6viQ4nNi76DGH1GcGEHqgLL/0BQ2sNQCZmI0533FXu4=;
        b=JwUDmOoQ7yWEy+DtzZlXcbVr37ryqLvVhpJ55hpjiwB35plfAfpBubpOOypuL78jo9
         /LVYM/giSKQ1Er/VV9w6EcHz2HhAD4JVurXp1Fb+Tc/6T9eISaHOh1ZzStbIqwxARLKw
         Q+pvUtdrq1SlUt73C42fQmOKvgGbG+dPxy0Ha7y7yTV9plp+8Rl2uVpzvjanz+O1QKXc
         7W1qSZ86LmeJRVW8FyoosfGfVlUbyDZOFQnnsSCjPsnrGzmp5GUME/EcBBJhy4sRzIeD
         pA+D9gX3MbrF/iOQWwVtY1I+p7/EwBrMMhwDs7VAGBs9F5G/BY4AF5PDQAQDrT827u2t
         cXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696502558; x=1697107358;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6viQ4nNi76DGH1GcGEHqgLL/0BQ2sNQCZmI0533FXu4=;
        b=DXQw1WAhfUAji7vmsaBW6xstUwG2CMK6xHs4k3jnHzK2COnZVtfQHUAMVljxd5HArY
         kbsCDoruq5PQC/e1YcgUXc6Y+Q01UxnYa+dI/17k5RSH0bR/69x34J/7vm2KkrxEoZtK
         vY76EFOBuNLnF9S4t7Xp0tc0DJVkjsv6xCblS7YFCQBqE8b6bKV2o6SQG2Y2KPEy9+QC
         wPBIhKzQTZI10Re/h8rbJN172n6zv3HKuq50MfcwvDZVV8iG4Op5sNG4zibmbozpVmhf
         apkhaMLbJDusD2PF7xkQef4tcWKgx150szkx2wVZjTkN90zSoLBSVutcZKg2IMD7RccZ
         saig==
X-Gm-Message-State: AOJu0YwlYMS5gCEyosgE4nZsrJx7Mh/5sudUkl6vYVAMs0auyqvsk+XY
	01mfQcwsjYN9mo3Nkbx6vKOmXbGPsrkUpxHn3Mk=
X-Google-Smtp-Source: AGHT+IGbf8oCWvx8IWfqWhLmw87Voc8kTfAQtw3d6cl+hTxntrz5X7HRmqihaXs+5KkQQYqdRU8VUA==
X-Received: by 2002:a7b:cc8f:0:b0:406:4a32:52fc with SMTP id p15-20020a7bcc8f000000b004064a3252fcmr4676365wma.21.1696502558098;
        Thu, 05 Oct 2023 03:42:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05600c1e1400b0040640073d25sm1237465wmb.16.2023.10.05.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 03:42:37 -0700 (PDT)
Date: Thu, 5 Oct 2023 13:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 35/44] fs/netfs/direct_write.c:54
 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Message-ID: <2d2355da-ccdf-43f5-a11b-d671f634e3d3@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db
commit: aa24264b7eba3e3adf3b47b3dedeb3730d5ccc42 [35/44] netfs: Implement unbuffered/DIO write support
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051502.Xl4aqWU3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051502.Xl4aqWU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310051502.Xl4aqWU3-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:54 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
fs/netfs/io.c:893 netfs_rmw_read() error: uninitialized symbol 'ret'.

vim +/ret +54 fs/netfs/direct_write.c

aa24264b7eba3e David Howells 2022-02-21  30  static int netfs_alloc_buffer(struct xarray *xa, pgoff_t index, unsigned int nr_pages)
aa24264b7eba3e David Howells 2022-02-21  31  {
aa24264b7eba3e David Howells 2022-02-21  32  	struct page *page;
aa24264b7eba3e David Howells 2022-02-21  33  	unsigned int n;
aa24264b7eba3e David Howells 2022-02-21  34  	int ret;
aa24264b7eba3e David Howells 2022-02-21  35  	LIST_HEAD(list);
aa24264b7eba3e David Howells 2022-02-21  36  
aa24264b7eba3e David Howells 2022-02-21  37  	n = alloc_pages_bulk_list(GFP_NOIO, nr_pages, &list);
aa24264b7eba3e David Howells 2022-02-21  38  	if (n < nr_pages) {
aa24264b7eba3e David Howells 2022-02-21  39  		ret = -ENOMEM;
aa24264b7eba3e David Howells 2022-02-21  40  	}
aa24264b7eba3e David Howells 2022-02-21  41  
aa24264b7eba3e David Howells 2022-02-21  42  	while ((page = list_first_entry_or_null(&list, struct page, lru))) {
aa24264b7eba3e David Howells 2022-02-21  43  		list_del(&page->lru);
aa24264b7eba3e David Howells 2022-02-21  44  		page->index = index;
aa24264b7eba3e David Howells 2022-02-21  45  		ret = xa_insert(xa, index++, page, GFP_NOIO);
aa24264b7eba3e David Howells 2022-02-21  46  		if (ret < 0)
aa24264b7eba3e David Howells 2022-02-21  47  			break;
aa24264b7eba3e David Howells 2022-02-21  48  	}

ret not initialized for empty lists.

aa24264b7eba3e David Howells 2022-02-21  49  
aa24264b7eba3e David Howells 2022-02-21  50  	while ((page = list_first_entry_or_null(&list, struct page, lru))) {
aa24264b7eba3e David Howells 2022-02-21  51  		list_del(&page->lru);
aa24264b7eba3e David Howells 2022-02-21  52  		__free_page(page);
aa24264b7eba3e David Howells 2022-02-21  53  	}
aa24264b7eba3e David Howells 2022-02-21 @54  	return ret;
aa24264b7eba3e David Howells 2022-02-21  55  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

