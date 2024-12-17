Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3F14F9FF
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419556; cv=none; b=e3fhyqPfWqXhdbHlQtsWt8kPRtizF2FENXzussXL1VW9IcSU2j0GMwlKuyMM3v9oALAeGTWwtOZ17f4ldImdOmtFfEJvNkXwwISeAw611C4HJ48vVwmai+v6aQSHWVqTYTwm2VCNo/XWtNiO0eI6B5VFBDDumwErLi63hIiBaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419556; c=relaxed/simple;
	bh=TURptmBM/FLUdfELDDkcC2+g4ASAyoJePGU2shoQNTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2lZy3aiLpeD2w3IS3SZN+KxI2anaspZ243IjCyQ3Q9MzdWOtmnqP/fzwHbmJmcVGE81QVluyk6OhSrZgKTaRmDfNnJXcK+BnNmUAvvzuL95j2mfB+bBt7jACaxXbbq+IYnZej1DO7OjgzWMB8hLeZUCNaUXGwyqGlnqYOi46Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxaUnGoX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxaUnGoX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso27486a12.3
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Dec 2024 23:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734419551; x=1735024351; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+TO7XReO9X11psi/58J8hAaiwLnwK22VeNHe3swrts=;
        b=lxaUnGoXs5e0rlYeUh1OA92etuaRL+5nR/ysA0YtJarScgWMm7Gz7cJ7odPrB84Ou8
         ntQ6OJ7OHVVfhEiaicnSPylXRSGUTNYuHbRFyoEG7pJGmhaKfXnrdn5SDL+maS/2Vsdf
         Y/YA1f/kH69MIPlgtBQMpkRBRmChzwxPouBC5JvjbkcUGErl8BlVczZ1OKeXvjJSDZC+
         zK8RCg3Yf1vC2aDH07XwcOIVgezzkwlgTuE2mkN6RoarC6qEJbESFne/nTZx5OMDCrmM
         N5wQMy+fmrz7vBKmb5tI4TbTDjPJR14jTLkNYUijLC1oXLEPVJRa/oP4i4vjx3TgG+OB
         qtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734419551; x=1735024351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+TO7XReO9X11psi/58J8hAaiwLnwK22VeNHe3swrts=;
        b=tSKWdABkJXrQ0W8hExwTTWikpKQQvkyw8QDxOeDL6Iu+D6BwH4DMUH/XZS4KvDQshP
         EVZ5WXW8ZswLLPeHyUlRemr/P74Zu5+csx6w0NGy6LyZPB8ZsxAsOkDnpd9vmMcSSuwp
         meQQQiA1jwL6yRKBvfg1ZqFlyPUhcE/raH/f0OC4RdbQehdFL2HZqHMJCxSZvKg8EiqM
         qTXxJ/t5rcPX6pDibPpRafL5VRW0njSgNXCVoCg3lWKNPjXGk0f5s0Ffehi4WxSKSwRa
         aT/1DrmNWnU8Bc0nyBvGEHuvelwpeuTPimgnEPQzTjdbay2zHEK2rm9IoUH3MER/NP+V
         jaLQ==
X-Gm-Message-State: AOJu0YxZHcEj9thEahDXQKryUHy3CTXj0j2NNTH3TA2rhWCn6fN467Kb
	gHXaSVM9BC8+NLee55CLyKMjnstuXJdz+pKAOn4EtFLpJZBJRwCUUMqYKSa1mXeNOrrSnVON1EC
	8
X-Gm-Gg: ASbGnctwuXii22WBlL1SDtEHE9yQhdjYgKLf2Rxn3V+X3Y5bBfldcCU9b5uB7ZHEiHz
	jRu1YE6Z1Ss8bH+cuZclDaYE13XI6M+9HPYi/aGaiJUm04oFhll4qKRr7OICU2rgNu/k3EuQ6DW
	nwfiLiKTwsdVaQ++dwy/6EJqpPcMOIZEkWSBwKfAXCjqMOONiKazzGmE2JI4CriDiIhHr+DBtmJ
	KaR1fYPVP3LrCCicTG44B4kbEaNY6NSR+Qkf61KaEGmeSV/q6coCAg/QPw02A==
X-Google-Smtp-Source: AGHT+IHITdtg4ygRJIIQ6mzSoawvvsx80UGxVtQ/xkblfqWiNj2dMDYJGh5iMWKH/SRkoa/IgEqejg==
X-Received: by 2002:a05:6402:1e89:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d63c30109emr29586113a12.1.1734419550795;
        Mon, 16 Dec 2024 23:12:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9606b540sm409806066b.80.2024.12.16.23.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 23:12:30 -0800 (PST)
Date: Tue, 17 Dec 2024 10:12:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	"Jia, Yingbao" <yingbao.jia@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2583/2583] drivers/platform/x86/intel_vsec.c:194
 intel_vsec_add_dev() warn: possible memory leak of 'intel_vsec_dev'
Message-ID: <68e421cb-fcce-4b0d-8768-260b0b528925@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dd14d8eb16732508135cd386c09cc747615571f7
commit: 045360f5c497cbbb84804a5026eeb1eb26bccab1 [2583/2583] platform/x86/intel/vsec: Add intel_vsec_register
config: x86_64-randconfig-161-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170934.0YmShlea-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412170934.0YmShlea-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_vsec.c:194 intel_vsec_add_dev() warn: possible memory leak of 'intel_vsec_dev'

vim +/intel_vsec_dev +194 drivers/platform/x86/intel_vsec.c

4e17cb1a523bb79 David E. Box        2021-12-07  141  static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
5f30bf18c574ead David E. Box        2022-06-29  142  			      struct intel_vsec_platform_info *info)
4e17cb1a523bb79 David E. Box        2021-12-07  143  {
4e17cb1a523bb79 David E. Box        2021-12-07  144  	struct intel_vsec_device *intel_vsec_dev;
4e17cb1a523bb79 David E. Box        2021-12-07  145  	struct resource *res, *tmp;
045360f5c497cbb Gayatri Kammela     2023-11-29  146  	struct device *parent;
5f30bf18c574ead David E. Box        2022-06-29  147  	unsigned long quirks = info->quirks;
4e17cb1a523bb79 David E. Box        2021-12-07  148  	int i;
4e17cb1a523bb79 David E. Box        2021-12-07  149  
045360f5c497cbb Gayatri Kammela     2023-11-29  150  	if (info->parent)
045360f5c497cbb Gayatri Kammela     2023-11-29  151  		parent = info->parent;
045360f5c497cbb Gayatri Kammela     2023-11-29  152  	else
045360f5c497cbb Gayatri Kammela     2023-11-29  153  		parent = &pdev->dev;
045360f5c497cbb Gayatri Kammela     2023-11-29  154  
ab1a3aedda0fd8b David E. Box        2023-03-16  155  	if (!intel_vsec_supported(header->id, info->caps))
4e17cb1a523bb79 David E. Box        2021-12-07  156  		return -EINVAL;
4e17cb1a523bb79 David E. Box        2021-12-07  157  
4e17cb1a523bb79 David E. Box        2021-12-07  158  	if (!header->num_entries) {
4e17cb1a523bb79 David E. Box        2021-12-07  159  		dev_dbg(&pdev->dev, "Invalid 0 entry count for header id %d\n", header->id);
4e17cb1a523bb79 David E. Box        2021-12-07  160  		return -EINVAL;
4e17cb1a523bb79 David E. Box        2021-12-07  161  	}
4e17cb1a523bb79 David E. Box        2021-12-07  162  
4e17cb1a523bb79 David E. Box        2021-12-07  163  	if (!header->entry_size) {
4e17cb1a523bb79 David E. Box        2021-12-07  164  		dev_dbg(&pdev->dev, "Invalid 0 entry size for header id %d\n", header->id);
4e17cb1a523bb79 David E. Box        2021-12-07  165  		return -EINVAL;
4e17cb1a523bb79 David E. Box        2021-12-07  166  	}
4e17cb1a523bb79 David E. Box        2021-12-07  167  
4e17cb1a523bb79 David E. Box        2021-12-07  168  	intel_vsec_dev = kzalloc(sizeof(*intel_vsec_dev), GFP_KERNEL);
4e17cb1a523bb79 David E. Box        2021-12-07  169  	if (!intel_vsec_dev)
4e17cb1a523bb79 David E. Box        2021-12-07  170  		return -ENOMEM;
4e17cb1a523bb79 David E. Box        2021-12-07  171  
4e17cb1a523bb79 David E. Box        2021-12-07  172  	res = kcalloc(header->num_entries, sizeof(*res), GFP_KERNEL);
4e17cb1a523bb79 David E. Box        2021-12-07  173  	if (!res) {
4e17cb1a523bb79 David E. Box        2021-12-07  174  		kfree(intel_vsec_dev);
4e17cb1a523bb79 David E. Box        2021-12-07  175  		return -ENOMEM;
4e17cb1a523bb79 David E. Box        2021-12-07  176  	}
4e17cb1a523bb79 David E. Box        2021-12-07  177  
4e17cb1a523bb79 David E. Box        2021-12-07  178  	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
4e17cb1a523bb79 David E. Box        2021-12-07  179  		header->offset >>= TABLE_OFFSET_SHIFT;
4e17cb1a523bb79 David E. Box        2021-12-07  180  
4e17cb1a523bb79 David E. Box        2021-12-07  181  	/*
4e17cb1a523bb79 David E. Box        2021-12-07  182  	 * The DVSEC/VSEC contains the starting offset and count for a block of
4e17cb1a523bb79 David E. Box        2021-12-07  183  	 * discovery tables. Create a resource array of these tables to the
4e17cb1a523bb79 David E. Box        2021-12-07  184  	 * auxiliary device driver.
4e17cb1a523bb79 David E. Box        2021-12-07  185  	 */
4e17cb1a523bb79 David E. Box        2021-12-07  186  	for (i = 0, tmp = res; i < header->num_entries; i++, tmp++) {
4e17cb1a523bb79 David E. Box        2021-12-07  187  		tmp->start = pdev->resource[header->tbir].start +
4e17cb1a523bb79 David E. Box        2021-12-07  188  			     header->offset + i * (header->entry_size * sizeof(u32));
4e17cb1a523bb79 David E. Box        2021-12-07  189  		tmp->end = tmp->start + (header->entry_size * sizeof(u32)) - 1;
4e17cb1a523bb79 David E. Box        2021-12-07  190  		tmp->flags = IORESOURCE_MEM;
045360f5c497cbb Gayatri Kammela     2023-11-29  191  
045360f5c497cbb Gayatri Kammela     2023-11-29  192  		/* Check resource is not in use */
045360f5c497cbb Gayatri Kammela     2023-11-29  193  		if (!request_mem_region(tmp->start, resource_size(tmp), ""))
045360f5c497cbb Gayatri Kammela     2023-11-29 @194  			return -EBUSY;

Needs some clean up.

045360f5c497cbb Gayatri Kammela     2023-11-29  195  
045360f5c497cbb Gayatri Kammela     2023-11-29  196  		release_mem_region(tmp->start, resource_size(tmp));
4e17cb1a523bb79 David E. Box        2021-12-07  197  	}
4e17cb1a523bb79 David E. Box        2021-12-07  198  
4e17cb1a523bb79 David E. Box        2021-12-07  199  	intel_vsec_dev->pcidev = pdev;
4e17cb1a523bb79 David E. Box        2021-12-07  200  	intel_vsec_dev->resource = res;
4e17cb1a523bb79 David E. Box        2021-12-07  201  	intel_vsec_dev->num_resources = header->num_entries;
f46f38183f3a2db David E. Box        2023-11-29  202  	intel_vsec_dev->quirks = info->quirks;
4e17cb1a523bb79 David E. Box        2021-12-07  203  	intel_vsec_dev->ida = &intel_vsec_ida;
4e17cb1a523bb79 David E. Box        2021-12-07  204  
045360f5c497cbb Gayatri Kammela     2023-11-29  205  	return intel_vsec_add_aux(pdev, parent, intel_vsec_dev,
fbced3ac8b6a0cc Srinivas Pandruvada 2023-02-01  206  				  intel_vsec_name(header->id));
4e17cb1a523bb79 David E. Box        2021-12-07  207  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

