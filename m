Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6517B;
	Wed,  8 Mar 2023 07:25:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso518861wmp.4;
        Tue, 07 Mar 2023 23:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260325;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouKSKcEVxqIc1215zyjz9fsubwtImmKL7ZeW1HVjv5A=;
        b=Ar1Kw+3Cd8R9WsbkF8PpjiTEkqaWgDtMf9g8slDb1drzA+acsM5DiVLC2Q8Pxou7HN
         WHYA5jAGtWiNm6JGZ7ls9imUThUG3zYND/kC0ovl9mOhu4mx73N8VCIQ0UspL9AFrZV/
         d6SrsVfeeOSFMNOnmWMPU/Ka52g3KksoYU7fa9kzEV+0OONRXm07PI0J6i3WpWervYxR
         4umc31qGg4bSZ9r+9kC+OwV4nDQRCLUZPmz11OIFYF3UceMfMyB8MYjJ8TX7cxSEiiYh
         Y6S9jpvybYUhk4QvxKxHueiUZP7wjiEXL7l1kv7uHbiSp4JEDTHSXSsM0Y/uIk8KuO1C
         QUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260325;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouKSKcEVxqIc1215zyjz9fsubwtImmKL7ZeW1HVjv5A=;
        b=hZflS03RVoropZH+DAWUIDcgMpq+HegnEW27m/OQpbU7QwdXTFJamTE24leD0+MzjD
         prb3r11oF/R6mkwBiBYq5bYHrXPodOUN7dfm8UcbX29vxzlqkHx7CMjKS3RKNX92/mIg
         cpkxqDyjbz/XVa4WMHxOk0RxlRNsAznfVFvx27Q15n8nuAQl6e61khIHW2LWhQlWwSBz
         BSABahtCTgHQAY7GaoRlum8aH0t4d7Pvg9tdXeQeh65k10k/ceDMchE/0iDg1M8wOXTC
         rvdMY31lNqysg7pzyRZyKQnHn0bxt0qkFBMKAqIqd4z5XexAPMcxqSpppPv9TCjbabgk
         Hf2A==
X-Gm-Message-State: AO0yUKVbA0v9fj4glOGGWA9vfXHdyqYmLpp5ndvn2u8KFlgx2EH8NXor
	xGpP88J/E7J/mH0k3c4HpDL5tPEyq0A=
X-Google-Smtp-Source: AK7set80Sf5TgjubnRfPClcG0YQkC7SpHnnE6aUHOpcXOKzbncuY3weU4cMxaZXyW5pt2RTOk/xalA==
X-Received: by 2002:a05:600c:1c95:b0:3e2:1dac:b071 with SMTP id k21-20020a05600c1c9500b003e21dacb071mr12083247wms.13.1678260325104;
        Tue, 07 Mar 2023 23:25:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm14940691wmb.33.2023.03.07.23.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:25:24 -0800 (PST)
Date: Wed, 8 Mar 2023 10:25:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 5/31]
 drivers/base/da_firmware.c:189 parse_firmware_data() warn: variable
 dereferenced before check 'bnode' (see line 187)
Message-ID: <8034dfc2-f83d-4f75-b7e1-40ae52bacaf8@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   6bcd8bef8871c6a80cb55b1cbb2651111da10890
commit: d0c26c6546ae5c1271597dc8fa1633456881afab [5/31] driver core: Add support to parse device authorize firmware
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230308/202303080452.BPTZeOyI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303080452.BPTZeOyI-lkp@intel.com/

New smatch warnings:
drivers/base/da_firmware.c:189 parse_firmware_data() warn: variable dereferenced before check 'bnode' (see line 187)

Old smatch warnings:
drivers/base/da_firmware.c:146 parse_firmware_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +/bnode +189 drivers/base/da_firmware.c

d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  169  static int __init parse_firmware_data(struct cpio_data *cpio)
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  170  {
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  171  	struct da_firmware_hdr *fhdr = cpio->data;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  172  	void *cur = cpio->data, *end;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  173  	struct da_bus_node *bnode;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  174  	struct da_bus_hdr *bhdr;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  175  	size_t size;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  176  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  177  	pr_debug("firmware version: %d.%d type: %d count: %d\n",
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  178  		 fhdr->major_ver, fhdr->minor_ver, fhdr->type, fhdr->count);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  179  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  180  	cur = cur + sizeof(*fhdr);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  181  	end = cur + cpio->size - sizeof(struct da_bus_hdr);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  182  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  183  	while (cur <= end) {
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  184  		bhdr = (struct da_bus_hdr *)cur;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  185  		bnode = alloc_bus_node(bhdr->bus, bhdr->count);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  186  		list_add_tail(&bnode->list, &platform_da_list);
                                                                                       ^^^^^^^^^^^

d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22 @187  		pr_debug("parsing %s node count:%d\n", bnode->name, bnode->count);
                                                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^
Dereferences.

d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  188  		cur =  cur + sizeof(*bhdr);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22 @189  		if (!bnode)
                                                                            ^^^^^^^
Check needs to be earlier.

d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  190  			goto out;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  191  		size = parse_firmware_devices(bnode, cur);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  192  		cur = cur + size;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  193  	}
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  194  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  195  	return 0;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  196  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  197  out:
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  198  	free_da_list(&platform_da_list);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  199  	return -EINVAL;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  200  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

