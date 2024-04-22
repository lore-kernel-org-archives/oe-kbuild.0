Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC25028B
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713794176; cv=none; b=ERxEWcNRFnLh6vRL5zPQZ30YwfZ84q9cift6NqAPWy9L0iszB9Qma3mIgob6T3OfoWRMrn+HytLgtrRyV2hnMRZBuH7k3rG7Tvj3hd8ibHoS8znuu+l/aNKQDRbE9UFyCbgMljGkkTRXuvxQvesBvoJTd+Ephx/xU3jCPMg01Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713794176; c=relaxed/simple;
	bh=Vh1pj5fhfVrJFFlOR1BGxZnZ069XqIu/DBR6Np5cPlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcqm4XQs0SDHZZ9PTUurEZu0dz58qQdrsqQF1HTavx/MoFmKOhIaP5xFf/1xsRvoTh4nl8x9cOPnbCf03LQGaaoekOvMQyiJRg3Xlx2BRI0c72zwhAqP2wGjKinRVcuQl7LLwzT1eRgKAQcqs3YrvnmgPcx4S7owbU/m1rZyAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kjJAMJoc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kjJAMJoc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a55b78510bbso107081366b.0
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713794172; x=1714398972; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWYha69U8O0vj1gaHNNHueKVNmokcoK75llxQfmdaFU=;
        b=kjJAMJocuv5iaE7YkjrUp7HBmTH3Q1u/fU1oHGrq5PUiLhNcNE5SvDZG2/GSnSpP/X
         xDAnKIdWk78Tu6AYOoPlxnC7chh1lZVw0xN+wY/+PLwAqk+OFLy1UQTLBYvmLMX3WDMO
         E9rbSX8vUv7ML3qxn+sKrMAMKLl6W/1KqqCrZw8Qa3A9aDpKuhW+4tM3XOHCAezbrkmh
         pcoXJvm2zuKcveeGmcwab5GDlJjulMaLbNLH+RbtNzrn8hU0QzJeCQK7dKRCMKPuO9In
         XjnbSIccZYc/aXuBBr7G1XFFtOV6HK8k9EtOncoF1NaGBzqwA7mk0lGv8E9FDlFsS3cz
         yqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713794172; x=1714398972;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWYha69U8O0vj1gaHNNHueKVNmokcoK75llxQfmdaFU=;
        b=Z3S3jY7MwsBDDs0J+WJjN9K/gbPrVT/hvm+phM2Mey1eWv63zEWKqfIIGpro0xgPee
         Ceaw1XZtKg1Y+R3pzjXmsrErkFHoY7oOcfUUhqtyrNIo6plwMb9p8WGMl+UTjgJcqkxq
         tDd/ij+VuWqa+4Uu+Ha4ImKFPfTVFMQioS+f/vYVVjSQAC7L1keAx/MAY9zr3iN4T72T
         pZsn+7qIikTX+UIodlQ65A+WWLNIN/HSK8dirGc4aj0wIbyIshGHG97u8GaBWfcbyhKy
         +eJ9gmP5hVZFHv9h+gTJPb61oQgAykpwhYwC5o7JzNbanoX9UGuDhGFX+CRUwSrM3TxU
         v0jA==
X-Gm-Message-State: AOJu0YyVbq4EP0gXagYFtdl0YrH/C4J3LVEayOLJM6QC3xcp7yIjGmF+
	3A90nk9XKyhm81KpZHIRaO6dz8lmaf9njTcksXwAXxYJntYVfgOeGvOdrEp4P8D3qRmg48VVYJ6
	F
X-Google-Smtp-Source: AGHT+IGJifIh+wNoeac0bXd193me+njlXrmuO1b5G5i8S69jb0p0pSLBEH0SyMSAwOsssL4wthzOJA==
X-Received: by 2002:a17:906:2e92:b0:a55:8200:c466 with SMTP id o18-20020a1709062e9200b00a558200c466mr6170835eji.39.1713794172122;
        Mon, 22 Apr 2024 06:56:12 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qw17-20020a1709066a1100b00a55adf3e4cesm1951628ejc.15.2024.04.22.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:56:11 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:56:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 6954/7322] drivers/spmi/spmi-pmic-arb.c:1782
 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.
Message-ID: <a1b833a4-435a-411d-ba4e-b77f5ba9fd94@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f529a6d274b3b8c75899e949649d231298f30a32
commit: ee2098c0b512fb80b63119199938ea62a240ebc7 [6954/7322] spmi: pmic-arb: Add multi bus support
config: openrisc-randconfig-r071-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221945.jickYhnO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404221945.jickYhnO-lkp@intel.com/

New smatch warnings:
drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/spmi/spmi-pmic-arb.c:1724 spmi_pmic_arb_bus_init() warn: unsigned 'irq' is never less than zero.

vim +/ret +1782 drivers/spmi/spmi-pmic-arb.c

ee2098c0b512fb Abel Vesa 2024-04-17  1762  static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
ee2098c0b512fb Abel Vesa 2024-04-17  1763  					struct platform_device *pdev)
ee2098c0b512fb Abel Vesa 2024-04-17  1764  {
ee2098c0b512fb Abel Vesa 2024-04-17  1765  	struct device *dev = &pdev->dev;
ee2098c0b512fb Abel Vesa 2024-04-17  1766  	struct device_node *node = dev->of_node;
ee2098c0b512fb Abel Vesa 2024-04-17  1767  	struct device_node *child;
ee2098c0b512fb Abel Vesa 2024-04-17  1768  	int ret;
ee2098c0b512fb Abel Vesa 2024-04-17  1769  
ee2098c0b512fb Abel Vesa 2024-04-17  1770  	/* legacy mode doesn't provide child node for the bus */
ee2098c0b512fb Abel Vesa 2024-04-17  1771  	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
ee2098c0b512fb Abel Vesa 2024-04-17  1772  		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
ee2098c0b512fb Abel Vesa 2024-04-17  1773  
ee2098c0b512fb Abel Vesa 2024-04-17  1774  	for_each_available_child_of_node(node, child) {
ee2098c0b512fb Abel Vesa 2024-04-17  1775  		if (of_node_name_eq(child, "spmi")) {

Smatch is complaining that maybe spmi is never found.

ee2098c0b512fb Abel Vesa 2024-04-17  1776  			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
ee2098c0b512fb Abel Vesa 2024-04-17  1777  			if (ret)
ee2098c0b512fb Abel Vesa 2024-04-17  1778  				return ret;
ee2098c0b512fb Abel Vesa 2024-04-17  1779  		}
ee2098c0b512fb Abel Vesa 2024-04-17  1780  	}
ee2098c0b512fb Abel Vesa 2024-04-17  1781  
ee2098c0b512fb Abel Vesa 2024-04-17 @1782  	return ret;
ee2098c0b512fb Abel Vesa 2024-04-17  1783  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

