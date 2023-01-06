Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194537B;
	Fri,  6 Jan 2023 08:00:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso546421wmp.3;
        Fri, 06 Jan 2023 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0m4MWUOTgvEgdboVuu8Rnt4Qz4scR4+gKzwLsqfY4QU=;
        b=kFdR7sU2qsPtCggAa7ezrlwYH/jYMJVdmmm7btdedK+f2yGfO6dyV7E5hGF8CJPVbI
         U9oLGPJtF2flfoe7Ysuy9cWr/IBIhK6wPmZ0N407YD7WsENmgpbmYCCqV6P4ZydooiBE
         eFpHmK+wyUke3mT8tQVObLbctUgjKogL0gz/xf1+N8qPHEdJOw8Wsxqv5+7TEyKBHWpG
         sJ6T7Kyq8fn2bM8/oCEWlTFnKUMjhgweWbnSt0izrsn+JC8g7MM3tIlTCWUC2/2vD5nC
         6Q3kyxzjLVrgz3MPnLxXOpQZZCt7fcLZaH/nK8Bb0YxWIz6PlNe/Tf58PZ+HGEf3c2RN
         To3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0m4MWUOTgvEgdboVuu8Rnt4Qz4scR4+gKzwLsqfY4QU=;
        b=k/fsncfO+ziFz9+BWm+kuQzLnnQ+FN85gA+diOgKMuZ+NkX+wTQKjGOMcKEx1MjBe1
         +ft7YqVqRsYM4g38C3UTILdHt6AIm9GLJSiTNbQWwqUMhJigT87sIcj2eqhy5WbvhPqR
         89YlKS92UYchExMDiwNICq0w7UytVkRP1aKz4Ctku+DH9vC6NHYTc9tRvBoYLnbcS+4V
         W2wve3IWNBI8TeD6CEQ29R0qplJbL9dEeRr0hXVWwn/bYDNLYW/DE90ZnK03lkpORXEW
         EWSwZiC5mlqQcV9acSeDQNna7N+Oh7xMGZqMdpQb/RIFsNVWCsrDdcfGWbn2v1+sWi5x
         pp5g==
X-Gm-Message-State: AFqh2krFjPYZ9tEdnisAPlkxDwQNTWjxvQF+k+BEqdbKbWAaCu8q9+03
	gYm9ZEORT0RQ5FsUNURoP0a2AJZwbUwUzw==
X-Google-Smtp-Source: AMrXdXvjQ9GEYHTr0u3Hek5RAnqqzqdHE0g0Ge0ZBnhQct5PDNdQum9S1eo2y21xh81PcjSRFoTzjQ==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id bh27-20020a05600c3d1b00b003d06a5766a5mr37698779wmb.0.1672992017958;
        Fri, 06 Jan 2023 00:00:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h9-20020adfe989000000b0028cf987d944sm424591wrm.33.2023.01.06.00.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:00:17 -0800 (PST)
Date: Fri, 6 Jan 2023 11:00:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 5/8] drivers/base/da_firmware.c:206
 parse_firmware_data() warn: variable dereferenced before check 'bnode' (see
 line 204)
Message-ID: <202301060956.wKKcw7we-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230106080013.rF1HwV50dl_rAnUoON2CjWHoGMMqFoErbWolzXeahaY@z>

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   b7007960943df37427a438813cadc41096a29969
commit: f6020ab96ed9440ede89d6de34f0201cf0a866e8 [5/8] driver core: Add support to parse device authorize firmware
config: ia64-randconfig-m041-20230101
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/base/da_firmware.c:206 parse_firmware_data() warn: variable dereferenced before check 'bnode' (see line 204)

Old smatch warnings:
drivers/base/da_firmware.c:67 pci_parse_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +/bnode +206 drivers/base/da_firmware.c

f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  185  static int __init parse_firmware_data(struct cpio_data *cpio)
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  186  {
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  187  	struct da_firmware_hdr *fhdr = cpio->data;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  188  	void *cur = cpio->data, *end;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  189  	struct da_bus_node *bnode;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  190  	struct da_bus_hdr *bhdr;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  191  	size_t size;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  192  
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  193  	pr_debug("firmware version: %d.%d type: %d count: %d\n",
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  194  		 fhdr->major_ver, fhdr->minor_ver, fhdr->type, fhdr->count);
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  195  
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  196  	da_list_type = fhdr->type;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  197  
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  198  	cur = cur + sizeof(*fhdr);
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  199  	end = cur + cpio->size - sizeof(struct da_bus_hdr);
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  200  
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  201  	while (cur <= end) {
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  202  		bhdr = (struct da_bus_hdr *)cur;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  203  		bnode = alloc_bus_node(bhdr);
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22 @204  		pr_debug("parsing %s node count:%d\n", bnode->name, bnode->count);
                                                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^
Dereferences.

f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  205  		cur =  cur + sizeof(*bhdr);

It's better to do the cur += sizeof() after the check for NULL.  Try
to put the error checking directly after the alloc instead of three
lines later (just for readability).

f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22 @206  		if (!bnode)
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  207  			goto out;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  208  		size = bnode->parse_devices(bnode, cur);

The ->parse_devices() function currently returns zero on error but it
should return negative error codes and have proper error handling.
Change the type to ssize_t.

f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  209  		cur = cur + size;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  210  	}
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  211  
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  212  	return 0;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  213  
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  214  out:
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  215  	free_platform_da_list();
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  216  	return -EINVAL;
f6020ab96ed944 Kuppuswamy Sathyanarayanan 2022-12-22  217  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

