Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7987194C7A
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 10:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975821; cv=none; b=tRIAP47icF/8tiY9v8ZHcKLmpVqbHSlMtRBQ9LMF1M1Jw3WOXRMAgyHaDVKe/dy6INuXd6QNy1oXYohdk0MaQv7If61GChq++Rf/CXSeR2acJp77/t9EbixOjZjblxFeqUdSc3qb6XgZGLq1ugaCliTswWoTPKlT9uidAoHh+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975821; c=relaxed/simple;
	bh=uXeL6oPT1sRD6DNR1Ei1tfZg04k2YN6pse+xtQD5Jjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBMdCGFLQODvjKkbrBzM9bi4mnPkf1tk2mhhdxwURIsutFh4ov+jh9skuyutERDSTeH+m2akFGhQMAUTDVEOtjRGjkTAcoOQ+I4SvkPXDtc2TE8nCHAXGq2jLsLESZ0lFN9aAdbJuIX31EP+7RZ9bi4QLCPmXStB/QK+H0gDRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quXLq2/V; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quXLq2/V"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so6556895e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 02:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730975817; x=1731580617; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S54IrLpHtNn97UBj1ol5mcFhoNy+46NWo9YLyxcmnDs=;
        b=quXLq2/VvxqIst1lNyC5ilZwOnZTKP7j8twaKHXUnTNkCpiJx8+FYSofVX6LRRuHEe
         2hUDmVxbocYdd7YRzeWvqyWYOu/Gi0jj+cz4C6VZrqjZ+WXAbbUyfNOaNYcjJHviESUc
         nH15R20MeuKFZBtG5bYGb/LisywAdi8588WrxqlgZNPscMQ58x6s84R3RK5TlDUKJ/Or
         ZkA0EMq/adait/fhL12xlS2/i4kq0RH3q5NCG7FjNqtR+ZVCSDSokjBWgeOGaXRYtfzo
         5GNM0SHHy6oro40ZfFRqa4j+h1s6BzAoUG2TaYKZHWhb/yI97C2exf2M12pTW6SUKamn
         oOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975817; x=1731580617;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S54IrLpHtNn97UBj1ol5mcFhoNy+46NWo9YLyxcmnDs=;
        b=X2bgCe7ArMK+exz61lOwSXY68MDGHqfVz+CwO2SVH4si50PJ2rx+Qt6T3/hJ/jo4f+
         vkq6rdPLf+83+a+SHcF+Q38L1OtM7VaNNpCwPMGBR8I5SYtoh8CHavxzxB/PaE47RDyR
         dMFkBmZkdpLIs7eVxWTNbudUJ5S9xdlxElwIXQJMXKy9oLiaJCiqN54YiyVuaJMibl6j
         8cCzP++M6ymTaYU/K1x7XhTvEwNzfLs+RqS268hoUdHWL1U8GIHnR7lGqiuZQ2GnFDFX
         L0KMfVdhVrTQBVuMBeBmKGCJYUV/qeZteuL1k8O4bFBwz3C/CkAEasgwhZ9/nETv4OMc
         C9ww==
X-Gm-Message-State: AOJu0YweNaQlw0gFPSY+smjFQZQFv9SLyEhUYxwwISno+q3YPjQD3FiX
	xfeFqX54AEX8gA8avZE3gBYDX6tQ6z0TbKiBJi516FVwT/XtWv+wXOl5ZgghACIT7GvcJip6rZP
	mIY8=
X-Google-Smtp-Source: AGHT+IHJN10jxR25SKTrqoQSOU4fqH3/hpD0VG7KU7sTzSUI1QddhOzAtwQ33b1IaUwDG2RJB9NHWA==
X-Received: by 2002:a05:600c:3593:b0:430:54a4:5ad7 with SMTP id 5b1f17b1804b1-4319ac76449mr400894365e9.1.1730975817526;
        Thu, 07 Nov 2024 02:36:57 -0800 (PST)
Received: from localhost ([89.101.241.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97c6b6sm1330220f8f.24.2024.11.07.02.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:36:56 -0800 (PST)
Date: Thu, 7 Nov 2024 13:36:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yingbao Jia <yingbao.jia@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>
Subject: [openeuler:OLK-5.10 22553/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <d26fa958-ea6a-4052-ab26-3d33dbca595f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   99db8adce903def72c36be0dbc5a2f459422b9bc
commit: 4dc4d762dd6ed4cb851209a87e79d7d936b3fb4c [22553/30000] platform/x86: ISST: Enumerate TPMI SST and create framework
config: x86_64-randconfig-161-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071052.IGzXSZzF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071052.IGzXSZzF-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:104 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +100 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   88  static int isst_if_get_tpmi_instance_count(void __user *argp)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   89  {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   90  	struct isst_tpmi_instance_count tpmi_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   91  	struct tpmi_sst_struct *sst_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   92  	int i;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   93  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   94  	if (copy_from_user(&tpmi_inst, argp, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   95  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   96  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   97  	if (tpmi_inst.socket_id >= topology_max_packages())
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   98  		return -EINVAL;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   99  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @100  	tpmi_inst.count = isst_common.sst_inst[tpmi_inst.socket_id]->number_of_power_domains;

I'm not a Spectre v1 expert but this seems like a problem where you
would need to use array_index_nospec()

I've added Dan Williams to the CC list.  He told me at Plumbs that he
loves talking about Spectre v1.  :P  lol.

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  101  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  102  	sst_inst = isst_common.sst_inst[tpmi_inst.socket_id];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  103  	tpmi_inst.valid_mask = 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @104  	for (i = 0; i < sst_inst->number_of_power_domains; ++i) {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  105  		struct tpmi_per_power_domain_info *power_domain_info;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  106  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  107  		power_domain_info = &sst_inst->power_domain_info[i];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  108  		if (power_domain_info->sst_base)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  109  			tpmi_inst.valid_mask |= BIT(i);
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  110  	}
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  111  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  112  	if (copy_to_user(argp, &tpmi_inst, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  113  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  114  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  115  	return 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  116  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

