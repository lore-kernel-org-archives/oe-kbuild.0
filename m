Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746C3CF4B
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708358582; cv=none; b=tHVPAjMFvY1ns3kChg+qmiT58f2NKanbrmF+hS3/AZMa8lCDyLcG4J02C0be5i7AYmLaKVPMc3H0fbT/u/oJYE10CRILnuBzs4NCVJPXwSj2xHmDCVMEX6BGGeqrYN2ioUwz2XhcNqrCn0f4FDNtbQF8UbEYQshc/zXh0KLeb/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708358582; c=relaxed/simple;
	bh=H7a7oxGIhcPoePflp6S4fyhD8pvwns8xgugWsQFM2lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZxYfPMDMZ8VuLcjU+GjZfyUAkCy2vGZKyLE54sqUUZejCwEe2VWiv/EM825Y7PaC5CMcG0MYgOx1UOhkkmcQet36L9yTlxDqk3eiKo9r8pot2MThflPbl+ycpUr9A4y8snoR+Gq1i0RMto8fpzXVrsxkIwBT9jjYtR1UXR4Hrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lRL3/ISR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRL3/ISR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so617267566b.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 08:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708358578; x=1708963378; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flIDH9HO3xRQn7HXwVHxFPU5p6Nmkq+1BWuk0uOwwP4=;
        b=lRL3/ISRG2cqPO64F6zgJRhwKn2mBqJ3LxaKv5BhTmXcVoY+0phUWRY+ZgK/DcodbG
         wBE3g8FuoE9rnZZDTqj941dJ/WHDkfe6lLSPamiIduP94wiPUs7pa9Krck1UKgEtaUvi
         lzbORKFKlQVBYWN1b3bswvjRH1lcescEol/hVNTQDuKA35QUutIYZiFMciA2yWHj1yZr
         DvcBtO50HZJVbIO0FWmTo1GzQf+YNwPOOzQo1+o9kkHkoem2bo2HjFMZgR6Ufu7reh8k
         rcFa5ZQxzQ+tIJzp+5BWrRwIoH67x97T2JTdDFJk846OMdeiv48h0NOphtHGoDHvud4u
         13lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358578; x=1708963378;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flIDH9HO3xRQn7HXwVHxFPU5p6Nmkq+1BWuk0uOwwP4=;
        b=NLuejePfe2CuDTNQJnf9hWUUX4KoEvdE4gA8e9GyMTfYo3COhyhWyq76Rs8IYNl4dB
         xpK7tvGi9L0+kQ7VMpI1H3Gg1tDvD8J5QJxn1eoc4eLkplLsp1vRJDlLO1B2vF4bEVO/
         LjRzz+grNpFsNzVVxLOxM8bjhaKAYuzrifq9uGwkjsguWcElv4N+p0G4h62pzLX8i3Jm
         2W3RseCf36vnkS8S7OZubtJodvK9GepqT5Ssx3350ri2cuSbdMVD/4cWRErItFe8IJKI
         X+LHyb8TEfcEJlU7hgie14JiT/AwvuaaPofxvVOW6Ar2qmCi2z5JexKEgRDnEB1PtuEW
         Oosw==
X-Gm-Message-State: AOJu0YzusGmYwVnq28d5x+IQeQ7ftY7CbhwHULK3ih5BkEDLJkrCnKwn
	Qzv2pMszPtv5bDs4qnguhghQ55XOA4TD7/qRIfwzW9l6xuE5DR5tyP81fq57ya9dnTD/XQMzHHM
	p
X-Google-Smtp-Source: AGHT+IE+YaDuZFmXjPwyrRtGnEplalyw3dM+flqDJX0KkpO+iwdZ4pAD3NzGtUm3A059UMZMqNelCA==
X-Received: by 2002:a17:906:2b50:b0:a3e:9d49:6c8c with SMTP id b16-20020a1709062b5000b00a3e9d496c8cmr1654211ejg.36.1708358578349;
        Mon, 19 Feb 2024 08:02:58 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id un8-20020a170907cb8800b00a3df7003552sm3075785ejc.32.2024.02.19.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 08:02:58 -0800 (PST)
Date: Mon, 19 Feb 2024 19:02:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dorcas Anono Litunya <anonolitunya@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:outreachy-vivid-v6.7 12/12]
 drivers/media/test-drivers/vivid/vivid-core.c:2200 vivid_init() error:
 uninitialized symbol 'ret'.
Message-ID: <2e9c4286-653a-4520-a90d-39bd6636990c@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid-v6.7
head:   4bc7849217d6c105cb59d78e9995b8e129f0deaf
commit: 4bc7849217d6c105cb59d78e9995b8e129f0deaf [12/12] media: vivid: Update menu controls for HDMI in multiple instance
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240219/202402192316.fyBF9GDv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402192316.fyBF9GDv-lkp@intel.com/

New smatch warnings:
drivers/media/test-drivers/vivid/vivid-core.c:2200 vivid_init() error: uninitialized symbol 'ret'.

vim +/ret +2200 drivers/media/test-drivers/vivid/vivid-core.c

f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2159  static int __init vivid_init(void)
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2160  {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2161  	int count = FIXED_MENU_ITEMS;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2162  	int ret;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2163  
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2164  	for (int i = 0; i < n_devs; i++) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2165  		if (!(node_types[i] & (1 << 8)))
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2166  			continue;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2167  		for (int j = 0, k = 0; j < num_outputs[i] &&
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2168  		     count < MAX_MENU_ITEMS; ++j) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2169  			if (!(output_types[i] & BIT(j)))
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2170  				continue;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2171  			vivid_ctrl_hdmi_to_output_strings[count] =
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2172  				kmalloc(MAX_STRING_LENGTH, GFP_KERNEL);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2173  			if (!vivid_ctrl_hdmi_to_output_strings[count])
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2174  				goto cleanup;

"ret" is uninitialized

4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2175  			if (n_devs == 1) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2176  				snprintf(vivid_ctrl_hdmi_to_output_strings[count],
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2177  					 MAX_STRING_LENGTH, "HDMI %d", k);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2178  			} else {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2179  				snprintf(vivid_ctrl_hdmi_to_output_strings[count],
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2180  					 MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2181  			}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2182  			k++;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2183  			count++;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2184  		}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2185  	}
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2186  	ret = platform_device_register(&vivid_pdev);
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2187  	if (ret)
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2188  		goto cleanup;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2189  	ret = platform_driver_register(&vivid_pdrv);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2190  	if (ret) {
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2191  		platform_device_unregister(&vivid_pdev);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2192  		goto cleanup;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2193  	}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2194  	return ret;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2195  
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2196  cleanup:
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2197  	for (int i = FIXED_MENU_ITEMS; i < MAX_MENU_ITEMS; i++)
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2198  		kfree(vivid_ctrl_hdmi_to_output_strings[i]);
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2199  
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13 @2200  	return ret;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2201  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

