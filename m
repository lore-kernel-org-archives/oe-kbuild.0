Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC83016C688
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952966; cv=none; b=bdWkEA8fJPace6A5DNTqcRKQv5jWsmYCetkGAYK5aQNsU+nI3X9UcfAPpUdDul1VOLwywkSGbYty8kay/jXSD163+OTzr/jBiSS96mpH1mIq6+grYVfUziTzVbDZB8mazS053+CrZwr1fAmkvlnK8MzoXQM5M+IaxLAFUL3DByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952966; c=relaxed/simple;
	bh=NH3ylXNGLSIMC/oRVBcD5/gB+Ar9gTmcj8mpeoFRSd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SNVLW0YRShC3NE0yLOC+CW6zi1Ixb8tE9GoWkWZVTwthjGFQyNm2RF5CL69TbSXg8P8IA+vF6X7arp7WiMo2hmxANE78XmelX+S4VF2wpaHsDW9Zo9kN8WHEAHZ4KCj25pKoNT8/lsLESp7/p2tKecMWjknFOE7nuCurLOBHkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qS8LNWHE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qS8LNWHE"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f51660223so86580466b.0
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718952962; x=1719557762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QM25iSV6b/cpz3jsOy311CfCTtPU7qo9cxLPbw8s8M=;
        b=qS8LNWHE0zN52xUpw56Ju1imlQA26YuGu0CN7ilrZtkjV/u/zS/5iS/Pjt2tOaYJxE
         u3TG34HbiXPi9hIOQlOM76DpsPCAgwg/QKWZgITRMftxZiwefFJTRTHNbmgOOQmZ7IMs
         g5X4IKDVjd57V3EjqjUmRSRK9tv22eEvGEFuE6nZQSAxQXJB06L45LQtD1ZsTfrZLz0G
         e+hcZBbIR5bUjL/iocPydRYtJ1bFH6nEtTbn+FKPs28LDI6/oyFFMXe2JldG+a60jVdq
         Xv/0GL0/W1VHAExvHnlIFCM0i0N2PluqExBIIPU4dfSET8wbQfIipV/mARrU59XIQCdz
         GftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718952962; x=1719557762;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QM25iSV6b/cpz3jsOy311CfCTtPU7qo9cxLPbw8s8M=;
        b=cKc7ZYWhrdb8PayrcWyqQFVCWR/TO9qzKDwLyQW7jwvk2rqinnZqFRDOUmaS2l6sfe
         M2IbzyfQOifPqUE9JOzA/i9I1z80Qy7fOXC74ZYLDOVwW8uRDL4licekMhYLWcdxv+Zl
         AXk7Mued/0AB3sv0zA2/XJ+xQwKWiwlAT8IsitGDyux9R9EjuiERODFEDHsOKhIb8dbh
         RSpO1UrAoKG6UO8NrHVK4dklq8QRDvh7+CBS5oNBjkQpK3Wth/6jHkAgAoFZBcOEyzZ+
         gnJq2On9h7YJxGFfZlqewEpvsREpF2VLWALe7gdcbOy+LCLpP/HqsPgNP9L00o92Z/0O
         /4aQ==
X-Gm-Message-State: AOJu0YyWgVlUKXcF2wcIryaxI2fUo8unSwF3hn0YKXj/KSn/JcbIgb5g
	ijTBY/9L0y/gmzJ1XWgUscUIudVDvE+ZBbmhp38tPw+wVyersWvRU+BLfwEIpMfaNSBZku1Lxiq
	7
X-Google-Smtp-Source: AGHT+IEb9Kw7v2f9ae5w+aFM9k6CKZh0sAVlev/5KNdvVFuaZI2MEfVROx2OxQKfjsNffXNhDPznJw==
X-Received: by 2002:a50:96cf:0:b0:57c:5874:4f5c with SMTP id 4fb4d7f45d1cf-57d07ea857fmr6189880a12.32.1718952962307;
        Thu, 20 Jun 2024 23:56:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30474546sm522021a12.50.2024.06.20.23.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:56:01 -0700 (PDT)
Date: Fri, 21 Jun 2024 09:55:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Danielle Ratson <danieller@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v6 9/9] ethtool: Add ability to flash
 transceiver modules' firmware
Message-ID: <7a33c661-55d3-4420-821e-267ddc95bd56@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619121727.3643161-10-danieller@nvidia.com>

Hi Danielle,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Danielle-Ratson/ethtool-Add-ethtool-operation-to-write-to-a-transceiver-module-EEPROM/20240619-202527
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240619121727.3643161-10-danieller%40nvidia.com
patch subject: [PATCH net-next v6 9/9] ethtool: Add ability to flash transceiver modules' firmware
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240621/202406211244.fPBtKk4s-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406211244.fPBtKk4s-lkp@intel.com/

New smatch warnings:
net/ethtool/module.c:208 module_flash_fw_work_list_add() warn: inconsistent returns '&module_fw_flash_work_list_lock'.

vim +208 net/ethtool/module.c

d55d0c47876a6d Danielle Ratson 2024-06-19  191  static int
d55d0c47876a6d Danielle Ratson 2024-06-19  192  module_flash_fw_work_list_add(struct ethtool_module_fw_flash *module_fw,
d55d0c47876a6d Danielle Ratson 2024-06-19  193  			      struct genl_info *info)
d55d0c47876a6d Danielle Ratson 2024-06-19  194  {
d55d0c47876a6d Danielle Ratson 2024-06-19  195  	struct ethtool_module_fw_flash *work;
d55d0c47876a6d Danielle Ratson 2024-06-19  196  
d55d0c47876a6d Danielle Ratson 2024-06-19  197  	/* First, check if already registered. */
d55d0c47876a6d Danielle Ratson 2024-06-19  198  	spin_lock(&module_fw_flash_work_list_lock);
d55d0c47876a6d Danielle Ratson 2024-06-19  199  	list_for_each_entry(work, &module_fw_flash_work_list, list) {
d55d0c47876a6d Danielle Ratson 2024-06-19  200  		if (work->fw_update.ntf_params.portid == info->snd_portid &&
d55d0c47876a6d Danielle Ratson 2024-06-19  201  		    work->fw_update.dev == module_fw->fw_update.dev)

	spin_unlock(&module_fw_flash_work_list_lock);

d55d0c47876a6d Danielle Ratson 2024-06-19  202  			return -EALREADY;
d55d0c47876a6d Danielle Ratson 2024-06-19  203  	}
d55d0c47876a6d Danielle Ratson 2024-06-19  204  
d55d0c47876a6d Danielle Ratson 2024-06-19  205  	list_add_tail(&module_fw->list, &module_fw_flash_work_list);
d55d0c47876a6d Danielle Ratson 2024-06-19  206  	spin_unlock(&module_fw_flash_work_list_lock);
d55d0c47876a6d Danielle Ratson 2024-06-19  207  
d55d0c47876a6d Danielle Ratson 2024-06-19 @208  	return 0;
d55d0c47876a6d Danielle Ratson 2024-06-19  209  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

