Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39296136A
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 05:45:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31757edd9edso2982307f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 06 Aug 2023 22:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691387116; x=1691991916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4Is9COOElGDQREoiv56bxVWF5eTBSJCyIs2WPxPLfw=;
        b=w9pXd/aiA97SNvwx7Vf1RkTZg9qqWrlrodl9KldWIQ8N4yGRjhgOGq98Ggp1oMBHIG
         FsLsuF1p6nXM1+MsYQDqNtlnhyPfbTbYMR1yurpglQSJjD9aWobfZZpUfyUhWMg01k6R
         a56upFd8R38p4/mEAv2VdyYOW/lANoobll2EGfIqobYjIFzZyccgMXDa8CzzgwDGm0WI
         mlkTVfCgIlbfyhE5qTctg7XEVJ1jjQCtzBb1K+mnFDvHqW2ndRgzkHjqabSoQf+cjnOk
         MpXh2aYy6OsJ+DLCHUM2AXEGZb6O1MIGFqUdGfPUvLpscSTvVQqbv/2qyTi+pfoaI3Wy
         QU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691387116; x=1691991916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4Is9COOElGDQREoiv56bxVWF5eTBSJCyIs2WPxPLfw=;
        b=H50WgYDoDAdEkn4IlSuD6NXfIHQAUnSwPVS761hr4PwIC5iErQxxf4NQQvkbqwXHAV
         KZEsd2Y9mq3No/3zFGVhAZywWU7aPojdKS8JkESuy4eGOyHRwiFznye4mV/NzFFnZMZn
         fB1AYK9cTCfv7u18VVK+SpoMeLXlRLO43KCAzjXALtbvBMUTnmE+OyYbCc0/O/mr2ppW
         qJOMv6S8hZE9ClzX90Q5oVwv1aJZ19j4KitsS6g3m0cyQdu5dB6XYDI1aOwWZO6w5mQn
         plmEp/zRRw0AsFL+RL449cZdgRaEWqF+ZHFgJIq7iR2xKFsD4Jg797+6xudJX1x1K43A
         2qGg==
X-Gm-Message-State: AOJu0YwV2eTpUf6dVVD64bKEFY6XXKXih4RkKBLhnCtDw1zPN6GDG0yb
	fIhSz0+oLPbPOS1NxaF0pxH0HbEW05BWnYzTpko=
X-Google-Smtp-Source: AGHT+IGNSux0JaLUw+sOPjijwW5Mghok6h8lrk120ChQdkGP6PBMNmbDZdcmUpEMoJPhur6lEuUz8A==
X-Received: by 2002:a5d:54d2:0:b0:317:e025:5a5c with SMTP id x18-20020a5d54d2000000b00317e0255a5cmr2108739wrv.48.1691387116077;
        Sun, 06 Aug 2023 22:45:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bc8ca000000b003fe20533a1esm9523977wml.44.2023.08.06.22.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 22:45:15 -0700 (PDT)
Date: Mon, 7 Aug 2023 08:45:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anup Patel <apatel@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [avpatel:riscv_acpi_b2_v1 80/91] drivers/base/swnode.c:744
 software_node_find_by_name() warn: iterator used outside loop: 'swnode'
Message-ID: <65be9f41-327f-4b40-a90a-f3c988eca537@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   b09364548457cec51680b8f8b1a5e917b5e74cf5
commit: 29c6edbe9ecad42c8e227ecbcbd656d357729a32 [80/91] swnode: Add support to create early during boot
config: microblaze-randconfig-m031-20230806 (https://download.01.org/0day-ci/archive/20230807/202308070005.kyNkYpSW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070005.kyNkYpSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308070005.kyNkYpSW-lkp@intel.com/

smatch warnings:
drivers/base/swnode.c:744 software_node_find_by_name() warn: iterator used outside loop: 'swnode'

vim +/swnode +744 drivers/base/swnode.c

1666faedb567d0 Heikki Krogerus 2019-08-19  708  const struct software_node *
1666faedb567d0 Heikki Krogerus 2019-08-19  709  software_node_find_by_name(const struct software_node *parent, const char *name)
1666faedb567d0 Heikki Krogerus 2019-08-19  710  {
016049a816774e Heikki Krogerus 2019-08-30  711  	struct swnode *swnode = NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  712  	struct kobject *k;
1666faedb567d0 Heikki Krogerus 2019-08-19  713  
1666faedb567d0 Heikki Krogerus 2019-08-19  714  	if (!name)
1666faedb567d0 Heikki Krogerus 2019-08-19  715  		return NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  716  
29c6edbe9ecad4 Anup Patel      2023-04-25  717  	spin_lock(&swnode_early_lock);
29c6edbe9ecad4 Anup Patel      2023-04-25  718  
29c6edbe9ecad4 Anup Patel      2023-04-25  719  	list_for_each_entry(swnode, &swnode_early_list, early) {
29c6edbe9ecad4 Anup Patel      2023-04-25  720  		if (parent == swnode->node->parent && swnode->node->name &&
29c6edbe9ecad4 Anup Patel      2023-04-25  721  		    !strcmp(name, swnode->node->name)) {
29c6edbe9ecad4 Anup Patel      2023-04-25  722  			kobject_get(&swnode->kobj);
29c6edbe9ecad4 Anup Patel      2023-04-25  723  			spin_unlock(&swnode_early_lock);
29c6edbe9ecad4 Anup Patel      2023-04-25  724  			return swnode->node;
29c6edbe9ecad4 Anup Patel      2023-04-25  725  		}
29c6edbe9ecad4 Anup Patel      2023-04-25  726  	}
29c6edbe9ecad4 Anup Patel      2023-04-25  727  
29c6edbe9ecad4 Anup Patel      2023-04-25  728  	spin_unlock(&swnode_early_lock);
29c6edbe9ecad4 Anup Patel      2023-04-25  729  
1666faedb567d0 Heikki Krogerus 2019-08-19  730  	spin_lock(&swnode_kset->list_lock);
1666faedb567d0 Heikki Krogerus 2019-08-19  731  
1666faedb567d0 Heikki Krogerus 2019-08-19  732  	list_for_each_entry(k, &swnode_kset->list, entry) {

The static checker is concerned that "&swnode_kset->list" can be empty.
I don't know if it can't or not.  Just introduce a "found = false;"
variable and set "found = true" before the break.

1666faedb567d0 Heikki Krogerus 2019-08-19  733  		swnode = kobj_to_swnode(k);
1666faedb567d0 Heikki Krogerus 2019-08-19  734  		if (parent == swnode->node->parent && swnode->node->name &&
1666faedb567d0 Heikki Krogerus 2019-08-19  735  		    !strcmp(name, swnode->node->name)) {
1666faedb567d0 Heikki Krogerus 2019-08-19  736  			kobject_get(&swnode->kobj);
1666faedb567d0 Heikki Krogerus 2019-08-19  737  			break;
1666faedb567d0 Heikki Krogerus 2019-08-19  738  		}
1666faedb567d0 Heikki Krogerus 2019-08-19  739  		swnode = NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  740  	}
1666faedb567d0 Heikki Krogerus 2019-08-19  741  
1666faedb567d0 Heikki Krogerus 2019-08-19  742  	spin_unlock(&swnode_kset->list_lock);
1666faedb567d0 Heikki Krogerus 2019-08-19  743  
1666faedb567d0 Heikki Krogerus 2019-08-19 @744  	return swnode ? swnode->node : NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  745  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

