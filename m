Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6AF2032F
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+md3dX2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40842752c6eso33511935e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700649768; x=1701254568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rurRnFBbtA8r5xBB9XdMEov5qrYkrbGrKu11nLThWAg=;
        b=v+md3dX2g7yS6HSs20ftampTHRXvvW/cekpTv+Ug4HTYZblvg75zVkCXpC1lfIpIjr
         hf8igK1rjKIIIRMqYWo9AqB9aW/6kHnFPc8Ad3ITXHtKnB3ccS2Ohq2Pdl1FvdOCEzOD
         GjtSjiDtZKXWLB00KawFmSdPxRRDCPmJ1p6E7JMU1gT5mT5PY924sytfdwMz0lLMFNIV
         TWWjN+NvoAveqxweTDC/7TqYsMsagDDCcfzK1RN9piCyTOoTMxZ46lltkB7IXnJzBtKW
         ZlPnsgYxNGP0g70Z+rS6WVe3mZ0tkko2uATDc1WXPrp5nVPVRQ45OcXhAsnxKr+4mg5t
         HCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649768; x=1701254568;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rurRnFBbtA8r5xBB9XdMEov5qrYkrbGrKu11nLThWAg=;
        b=DZM+OK1yIH+WSc7rLq8EFnvywnm4gOLTK0LVnGOTF0ODy79TmQam5ATKkCsCo7N8OT
         tr016LUv9IdqDXCrmHusYUSbNtbSCDdV+j8LTf80Ud9iwhecCX6f6+b9p3/dGMNqDL0x
         OXp9DcggvSCN8Tnw8K1b+73fsOFoouXdl/PPEBIxFyAuCzdJqMCooypx47lmBrgRPMdc
         PJsXvvSUUXisk2m7zEgJrhaQchc2vE1SyucetmRjpW1eLRLnIFBt9aGCQpVVcjqjLSzy
         CYfKdpKAIBK0adIaV3RKMOlsIyAQoGtRRZh/Au4X1spS+twFLOqLuQIVsl3MUSDVP20t
         qorg==
X-Gm-Message-State: AOJu0YyIEWAsRd7KhvMy01k++9wB19aZhF0esximfoTkxfbt1HANBCUg
	uPNbUDmp30OjxAFCiIE2I8zqXNPDOiwg5TKwfCE=
X-Google-Smtp-Source: AGHT+IFZjLI1RN+qmEZ+XlbiqgLBb55GOp+qtgAUNp2iNwKVeATclqjSDDfovff2tf+Kv7dOVUhy+w==
X-Received: by 2002:a05:600c:45d2:b0:40b:29f2:968f with SMTP id s18-20020a05600c45d200b0040b29f2968fmr1291689wmo.26.1700649768415;
        Wed, 22 Nov 2023 02:42:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm16752245wrp.28.2023.11.22.02.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:42:47 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Nov 2023 05:42:44 -0500
To: oe-kbuild@lists.linux.dev, shiju.jose@huawei.com,
	linux-cxl@vger.kernel.org, linux-mm@kvack.org, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	david@redhat.com, Vilas.Sridharan@amd.com, leo.duran@amd.com,
	Yazen.Ghannam@amd.com, rientjes@google.com, jiaqiyan@google.com,
	tony.luck@intel.com, Jon.Grimm@amd.com, dave.hansen@linux.intel.com,
	rafael@kernel.org, lenb@kernel.org, naoya.horiguchi@nec.com,
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com,
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com,
	mike.malvestuto@intel.com
Subject: Re: [PATCH v2 06/10] memory: scrub: Add scrub driver supports
 configuring memory scrubbers in the system
Message-ID: <416c6883-7eaf-469a-9f5f-1829f729b78e@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121101844.1161-7-shiju.jose@huawei.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiju-jose-huawei-com/cxl-mbox-Add-GET_SUPPORTED_FEATURES-mailbox-command/20231121-182247
base:   linus/master
patch link:    https://lore.kernel.org/r/20231121101844.1161-7-shiju.jose%40huawei.com
patch subject: [PATCH v2 06/10] memory: scrub: Add scrub driver supports configuring memory scrubbers in the system
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221028.fsptP2bp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221028.fsptP2bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311221028.fsptP2bp-lkp@intel.com/

smatch warnings:
drivers/memory/scrub/memory-scrub.c:71 scrub_dev_attr_is_visible() warn: this array is probably non-NULL. 'scrub_dev->name'

vim +71 drivers/memory/scrub/memory-scrub.c

248ee451a36346 Shiju Jose 2023-11-21  65  static umode_t scrub_dev_attr_is_visible(struct kobject *kobj,
248ee451a36346 Shiju Jose 2023-11-21  66  					    struct attribute *attr, int n)
248ee451a36346 Shiju Jose 2023-11-21  67  {
248ee451a36346 Shiju Jose 2023-11-21  68  	struct device *dev = kobj_to_dev(kobj);
248ee451a36346 Shiju Jose 2023-11-21  69  	struct scrub_device *scrub_dev = to_scrub_device(dev);
248ee451a36346 Shiju Jose 2023-11-21  70  
248ee451a36346 Shiju Jose 2023-11-21 @71  	if (attr == &dev_attr_name.attr && scrub_dev->name == NULL)

I wrote this check 12 years ago and it's crap.  scrub_dev->name is the
first struct member so it's the same as same as "scrub_dev".  However
to_scrub_device() can't return NULL so this check is dead code.

248ee451a36346 Shiju Jose 2023-11-21  72  		return 0;
248ee451a36346 Shiju Jose 2023-11-21  73  
248ee451a36346 Shiju Jose 2023-11-21  74  	return attr->mode;
248ee451a36346 Shiju Jose 2023-11-21  75  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

