Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCAE14F75
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Mar 2024 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709374978; cv=none; b=liZA7YIypcDwFTLrSvzi5gJMQoGpBy/Q5OkmV015LvhuAd9Y4RbDJBVYH9gWjPSLVjEPzRCMxfaKaz1bo9nOOBTqjMY0JbfW9HpZ+gB0vT1ONHeMGj3pUIf/jevqkpE5Zvuui3WFmNa+c7YWQQ0JMhv8tdxzmwlux6fPoxDYwsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709374978; c=relaxed/simple;
	bh=/0QmJ9fSROWFqfGEyhsejzGlrxyZAkEvZidBoUr+Jm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqSMplORrsi3h6iit0ecinorcD7uDUntYZAKCyFILofgA4Zxe+9rxoYBacyc6n/U1arM3ljnsaw8XoHfKhTHEEfhn8Ye36GdWRzEzylZc479YwXmjTNQMAnH44d5Rr5itXapybpjTOImShYONU2GNvGOoTEuRfDCN4LHT+natkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1/pfYsQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1/pfYsQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412d537a91bso1735905e9.1
        for <oe-kbuild@lists.linux.dev>; Sat, 02 Mar 2024 02:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709374974; x=1709979774; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMdekztujkt4AzA7D7S8LzaTnjsciXQ/ToTUP2Gu6E0=;
        b=m1/pfYsQJWg/L7C6VMkDJ6UDKPPKUuzeooucA1Ig3qq93MBl3GCUETiABZad3Ktp0g
         tmfYg0j2mZ8I/D5HrpV9lGeIQ6Dz3X9lU/cc479xdj2wjNy8TlXdQ1ciy4ItmDNpw9AH
         PIzlg2qqckGoBS6+SJ2VnPj7qafJTX+Qlxq0W4V4ugMKyDbxehUgW3mT5vZOqDZjbuYR
         sK8TYQkJeylgZcPHujl8psCphWM+9PD5kg+BMRByyJNRnGj2L/ag7X6sGbKCejUTzem3
         n0yYlerjrRkjUHkY3NzEjG7fwSPT8NLBB6t4vaGoRoZMqF05bCYCs/zSacaIdwwb4i3u
         +z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709374974; x=1709979774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMdekztujkt4AzA7D7S8LzaTnjsciXQ/ToTUP2Gu6E0=;
        b=duZw3auwQDjpwbP+AOvPzQywgB82tXpAQXrOvUK2YEcSUdqZp1I3s5JCaQhNRp8cZs
         MWK88JE/BYTfHRZXqv8EdYsxIEDvkzXdOLmQiN5dEtEACVvDXlfWJTNGVKqR8In0mJAK
         uOCuyqi8/Cr2P9K+u/HLtfopR9zFFZgZ/b6gLfomx5u1wXf0n7HMZr17+Bw5DxlgRBny
         xak1m/HNVUdi7vMa+kbdGkethLKr5NB/iNEWFBfO1/2MRtgKRDllUBR8lstAVRXUiXBO
         2BQ7yDyS1+wUZZWnUvZ1aAiYJcm9z5521ui3DD/PeORIsVq6nAMWxdUvqonwTkT3ndIJ
         kITg==
X-Gm-Message-State: AOJu0Ywx6CU5s4u2LKA50wPikpzwilLUuugH0wV/+AnV6EFi3x9HUfGP
	U1uJCEKQI4/d0PpVvMuW2L3GZw1gxxGtag0dC6gvNP+WbC3tBRvZEZ0klb+49t63d9BbCKaVPnH
	/
X-Google-Smtp-Source: AGHT+IGto6zf48uW6nzQNBBDCaj4Rx9fjM8ygjSJUN3ZcpzxRro+pdXUvseP3v/8bDsBxgZ2BNgAPA==
X-Received: by 2002:a05:600c:3149:b0:412:b652:27b7 with SMTP id h9-20020a05600c314900b00412b65227b7mr4001193wmo.33.1709374973835;
        Sat, 02 Mar 2024 02:22:53 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jl24-20020a05600c6a9800b004126732390asm11126200wmb.37.2024.03.02.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 02:22:53 -0800 (PST)
Date: Sat, 2 Mar 2024 13:22:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xi Pardee <xi.pardee@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Rajvi Jingar <rajvi.jingar@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: drivers/platform/x86/intel/pmc/core.c:500
 pmc_core_send_ltr_ignore() error: uninitialized symbol 'map'.
Message-ID: <047a3af2-682b-4a2a-89ea-ab2112e0cdea@moroto.mountain>
References: <cdae87ea-ad8b-44d4-936a-c3b698186932@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdae87ea-ad8b-44d4-936a-c3b698186932@moroto.mountain>

On Sat, Mar 02, 2024 at 01:05:45PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5ad3cb0ed525b80c7f66c32b49a68c1f3510bec9
> commit: 2bcef4529222424559ac9b45948ee9d82c09d9b5 platform/x86:intel/pmc: Enable debugfs multiple PMC support
> config: i386-randconfig-141-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021544.6qtkaAly-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403021544.6qtkaAly-lkp@intel.com/
> 
> New smatch warnings:
> drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'map'.
> 
> Old smatch warnings:
> drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'pmc'.
> 
> vim +/map +500 drivers/platform/x86/intel/pmc/core.c
> 
> 92f530edd7c955 drivers/platform/x86/intel/pmc/core.c Gayatri Kammela   2022-11-14  463  int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
> 9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  464  {
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  465  	struct pmc *pmc;
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  466  	const struct pmc_reg_map *map;
> 36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  467  	u32 reg;
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  468  	int pmc_index, ltr_index;
> 9592438886756c drivers/platform/x86/intel_pmc_core.c Andy Shevchenko   2019-12-18  469  
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  470  	ltr_index = value;
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  471  	/* For platforms with multiple pmcs, ltr index value given by user
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  472  	 * is based on the contiguous indexes from ltr_show output.
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  473  	 * pmc index and ltr index needs to be calculated from it.
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  474  	 */
> 2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  475  	for (pmc_index = 0; pmc_index < ARRAY_SIZE(pmcdev->pmcs) && ltr_index > 0; pmc_index++) {
> 
> 
> ltr_index comes from the user via pmc_core_ltr_ignore_write()  Assume
> that it is zero.

Never mind.  This was fixed in fbcf67ce5a9e ("platform/x86/intel/pmc:
Fix hang in pmc_core_send_ltr_ignore()").

regards,
dan carpenter

