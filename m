Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E77460;
	Wed, 22 Feb 2023 14:25:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id az11-20020a05600c600b00b003dc4fd6e61dso6480859wmb.5;
        Wed, 22 Feb 2023 06:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fe6a6DR7iJ0PT2fChlekqUqMNerUT/Y83IgJ2x3bO7E=;
        b=Kn1nSWwsrrEZU2DlMWsnNChWrOvVv1Rl4YT0tl8Y2PIGHDN/RIDJjhjz8zYoHIzxrf
         fhrlMPyWjULoWG6OH7HaR3Q6vKoKJq+wc4zKO2WEfpnZ6IoRlKdI6SmgC3mxce0KiYni
         qhCZzYY5P40oda0ILX7vllYrs24I8t4dnUy0HIBwOIxFoFyh7UK3Vu7eTc8DeAr886mX
         jYAbcWBMHyWapNkObxrL3UvhqVLNuoLuLVytwyXMsRCeM/+O8rflhZeWXvsCgFesjYr4
         RlNO+bEOUvxMAMmDYy8UE8XNnSp5BmE/ZS2EcCjt9L9CCEMQhTtu8yOSs96kfTwFYc1g
         6w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fe6a6DR7iJ0PT2fChlekqUqMNerUT/Y83IgJ2x3bO7E=;
        b=QpuVqHyYPfY8mxHuGMz84ZFIIT4YColY4aQplJoRkX9Kw8n62Vl2l3PJ9lOn0w4Lkj
         1TfGQLZjbhQimdY6JYY80wotYf85AGUbFMQg7CUS3BC4UBffYYSX7sReDUHUUsO8Uccc
         mPb/W4Fryoo+b28v9ZEgmhFe94iOC9GzedB6mIhmx5GY5QOz5Xd5/0CwvpmvXtHEFvgC
         Tbbo0YXHQt7f4JXuaiwqIbdBd40SKvsS7RpUabkgtJabPoMHI2yqEkKzVN12arg1DOiE
         KlLjkuvfG4lIEnj142Nx/MLnWLDQOmBgkTSmElbH4AODVCwEZUDyKItBid0KmnqOx7V5
         5myQ==
X-Gm-Message-State: AO0yUKX5HlNxUBkhJ3hC6XmMZXD2UnqQAKkRAew/FSlygdbcO5DGvpss
	jgp2kyisQVnezvfhE5dnFC3yBJusc+I=
X-Google-Smtp-Source: AK7set+YxruGjVZGokdAaAVs9PutkAVI7lsMeJX7C3YOa2WhzByjkep0oKXtVdK3g8R5somAUnmVFQ==
X-Received: by 2002:a05:600c:511b:b0:3da:2ba4:b97 with SMTP id o27-20020a05600c511b00b003da2ba40b97mr7563724wms.19.1677075920132;
        Wed, 22 Feb 2023 06:25:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a1c544d000000b003e208cec49bsm2096421wmi.3.2023.02.22.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:25:19 -0800 (PST)
Date: Wed, 22 Feb 2023 17:25:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.2 114/188] drivers/interconnect/core.c:853
 icc_node_destroy() error: we previously assumed 'node' could be null (see
 line 846)
Message-ID: <202302222118.nGz1F0oJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230222142501.e2Ww9rIEWNpya_SgX_trPNyvabnXSc0GO0nguCT9crU@z>

tree:   https://github.com/steev/linux lenovo-x13s-v6.2
head:   b9925baa3e5cf7919e9736257505a214b66dcdd2
commit: f89ce4d6ffc2c5e73c476d0d264951feef193f17 [114/188] interconnect: fix mem leak when freeing nodes
config: microblaze-randconfig-m031-20230222 (https://download.01.org/0day-ci/archive/20230222/202302222118.nGz1F0oJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302222118.nGz1F0oJ-lkp@intel.com/

smatch warnings:
drivers/interconnect/core.c:853 icc_node_destroy() error: we previously assumed 'node' could be null (see line 846)

vim +/node +853 drivers/interconnect/core.c

11f1ceca7031de Georgi Djakov 2019-01-16  839  void icc_node_destroy(int id)
11f1ceca7031de Georgi Djakov 2019-01-16  840  {
11f1ceca7031de Georgi Djakov 2019-01-16  841  	struct icc_node *node;
11f1ceca7031de Georgi Djakov 2019-01-16  842  
11f1ceca7031de Georgi Djakov 2019-01-16  843  	mutex_lock(&icc_lock);
11f1ceca7031de Georgi Djakov 2019-01-16  844  
11f1ceca7031de Georgi Djakov 2019-01-16  845  	node = node_find(id);
11f1ceca7031de Georgi Djakov 2019-01-16 @846  	if (node) {

If node is NULL

11f1ceca7031de Georgi Djakov 2019-01-16  847  		idr_remove(&icc_idr, node->id);
11f1ceca7031de Georgi Djakov 2019-01-16  848  		WARN_ON(!hlist_empty(&node->req_list));
11f1ceca7031de Georgi Djakov 2019-01-16  849  	}
11f1ceca7031de Georgi Djakov 2019-01-16  850  
11f1ceca7031de Georgi Djakov 2019-01-16  851  	mutex_unlock(&icc_lock);
11f1ceca7031de Georgi Djakov 2019-01-16  852  
f89ce4d6ffc2c5 Johan Hovold  2023-01-31 @853  	kfree(node->links);

then this will crash

11f1ceca7031de Georgi Djakov 2019-01-16  854  	kfree(node);
11f1ceca7031de Georgi Djakov 2019-01-16  855  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

