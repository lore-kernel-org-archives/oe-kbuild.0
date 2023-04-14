Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD17C;
	Fri, 14 Apr 2023 16:33:34 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id q23so37541327ejz.3;
        Fri, 14 Apr 2023 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681490012; x=1684082012;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9UGFfR9XzGT0N9Pt0NWw2qMZUnEalV9PygfxkGsIJs=;
        b=hqfY++6C67ZwEJIb12vT5qmncCG0l+mWpeVA4Vy+BqvQ+NnLy8/IecyYTrUYfw0po2
         Ih0Uv6DC0iZQfy3mY2dM7sFGWLHMt5iVsrAyRGsRjTQplTruY2l6goiIcofgINtQq4tn
         YtTLJLUHeNSemgWKsdkBRxFpNJ7VDVOghnbLowQuHUiuKWzsv2yeAb4VZjdrLqt8nB0X
         bwxsE3GceHx+DJePwbYEifoqKySAKmrCSUSDDsqAqmAKxsK4jgK2vLmKJGyN0a8I6/Pq
         wxqTcbCa6bJO1Nf53iZ6Ekp4RWG9+GAYdzVyFWVA3XgdjfTG3HepHdjMOkwgzMJ6Bmj8
         d5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681490012; x=1684082012;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9UGFfR9XzGT0N9Pt0NWw2qMZUnEalV9PygfxkGsIJs=;
        b=TYUGvsqdhKPXNswvnsLGMKYjHGWa0X60k/JavsNcrlX13MgulgA4oypYImMSCZpGje
         /ORItDQd0nj1UDVJm5F1IVicu/Nxnzmp0FYZEXue2ELxDVH9LcocETHBoPg0BQ4Z7jH8
         LiqtgFhs7aJRKAHJUoAl86ZVYX5xQ0yXHHNAR0dDwijCTvLJyPTUVkKV0R037PlwFyqZ
         yK2IM6GWXLtaTev+h00jhFrtKIKXYgwo7QAJPXP8VKP41Fzm4/lhLj8KjWCZY3ftgp+0
         KpFTvgPNPAzGautsalkdvu+rDFCYUXQ8gOd2m0FTejoaDyBRjxT38Qggr0LqYTP70D0C
         ZVaw==
X-Gm-Message-State: AAQBX9fF0cMJH9xGo2dODsYupXPU7MtXUn2W30oN6qmM0zfm/pJfjwDp
	azgLMUV+NyOQxotW7i1bG2g1m2Y7agk=
X-Google-Smtp-Source: AKy350bCZ57T3rFmBGJFSz55ZW9N7QkTp4DRBV90olFLcERGZPvycLMagAjuo4YKXiY13uCwc+bN/Q==
X-Received: by 2002:a17:906:f2d8:b0:94e:c43f:316b with SMTP id gz24-20020a170906f2d800b0094ec43f316bmr4442815ejb.19.1681490012048;
        Fri, 14 Apr 2023 09:33:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w27-20020a17090633db00b0094a512b0972sm2592174eja.117.2023.04.14.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:33:31 -0700 (PDT)
Date: Fri, 14 Apr 2023 19:33:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 75/136] drivers/base/da_firmware.c:67
 pci_parse_devices() warn: Please consider using kcalloc instead of
 kmalloc_array
Message-ID: <ee0228b8-ed7d-4ed2-91e2-0294595097e1@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: 896621978781d8378b4f51a9e33c33846439695d [75/136] driver core: Add support to parse device authorize firmware
config: csky-randconfig-m031-20230411 (https://download.01.org/0day-ci/archive/20230414/202304141419.mRARWHGd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304141419.mRARWHGd-lkp@intel.com/

smatch warnings:
drivers/base/da_firmware.c:67 pci_parse_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +67 drivers/base/da_firmware.c

896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  61  static size_t pci_parse_devices(struct da_bus_node *node, void *data)
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  62  {
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  63  	struct da_pci_device_id *da_id = data;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  64  	struct pci_device_id *ids;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  65  	unsigned int i;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  66  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22 @67  	ids = kmalloc_array(node->count, sizeof(*ids), GFP_KERNEL | __GFP_ZERO);
                                                                                                                            ^^^^^^^^^^
If you want zeroed memory the traditional way is to use kcalloc().

896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  68  	if (!ids)
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  69  		return 0;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  70  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  71  	for (i = 0; i < node->count; i++)
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  72  		memcpy(&ids[i], &da_id[i], sizeof(*da_id));
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  73  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  74  	node->dev_ids = ids;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  75  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  76  	return sizeof(*da_id) * node->count;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  77  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

