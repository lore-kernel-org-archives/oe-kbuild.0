Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C11C701F
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435031; cv=none; b=RDyM+nmEMIqE38L75S2keKozy3tGqVOqt7QTOlKrq2UIDZqWG7ZaehzESmMujvX5wNzuV5AURH9PfdWsFN/hz8wMdXYMTIrnzoHwVH8Xc4LCdt3O4QOgtsu8AneiS74N/xNNZOTdk14jwK9jGMwUzx/ExMu3wh8HFVMNGkES/Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435031; c=relaxed/simple;
	bh=Cn+yNuLXa8lWVWpF6f/eF1X7MDE7Ri0IU5SGShQe0HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dHV7I77a4STcd2J3eA0n8Mih49s+eFfBQ89Y5194WAXvtzmiTjXv8McpXnbpdAgOXz8zprI7/+nVt3iYRczhO7peZ5VFvrICknK/XhG0U2is1gCB1aKGkrrE1Ggi1Qigde4O6HRFPsW1THTZdmP8reW9n1Aj6yJi84hU0Y4yCRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IK7IDSgr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IK7IDSgr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso23433775e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435027; x=1765039827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=;
        b=IK7IDSgrZMzVZ+EqSl2/FQNnXmrvvpigEnhk3V6dnQLpiK8FCejR1aKswuHgvxQLcI
         7rbqW19SyanJnbbwqm2jt7XYy/5IyUdUtXeXRLKniXD143kxQa6ZsJf7T9OiMlwvDoVk
         aJCt1wWEO+DveCA5HaOCI5NfiQG51rZgPi8GxNwGb2t4cvUro7JEL7X8R7Yd7l/4nAZD
         NpxT5j87t5DzaMNdvvUAry1JlYVmkt6g3eKcX29D4Wa7MmUfB7WMy6vsXONAOCEQWL3u
         gKjvZmAKj1Zu+gCBD7+YlHfr54Jwu60hyPfUUgfqP4e6fzmk4iEYunxEaZlRLX2eByYV
         nBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435027; x=1765039827;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=;
        b=H5lc++ZutCaBzf3AI8XQ91fqpBI+51LvYQrs0GImSmJnF7Ej+sbAg8RGSt/xYrCnqX
         NaBj4rESB2+cW3CyW8SU62c9ApXHc8Lar6dWbwRGuVWMceNOhXdn/yOZuhgx6bdL49mv
         oF8Q1pzk2dV9Cqd39m8sSk8kqZTP8OBXgYLWjCRRBskeuaQ3bFGHbsONgC67lboYKFJG
         ejP7H1jW0mZORaNRfWsE7bLyaLCQ4W7yJAd9b0vyH41WeGh8+UUDOa7Vc9x1sO96A7AN
         uvGJspm2VKU2UVomtqh+cvH9jQC07oJTaHAz83vKQKnQsDwI1LKteafg/n1oqqbbTi73
         orug==
X-Gm-Message-State: AOJu0Yzcy0nOiRsU6qgREeRXRcsgipLYMTVfDQmw7WLIBUQ603gkSitw
	jWOJouYGnXP2mKoqmGO/osEf695mPAQphh2dK7t8CVhHA8JtntSKCvrGQtzc/d/9hwSwpy5r3Ch
	/WJgE
X-Gm-Gg: ASbGncuCEbSps3NoImzT8N5ZsHvQX9i/MzVLEy6xhe+PK1Rp/+0sE5VldbSAti9c/UG
	NepQe+pFyOXuMprRkujpv8DAGfD4nNjUt/Y5hAozsx2iRdjSvm91ivzX0zuoxmFivR+r0lDLP/N
	R1gdSBCiy2bxysIY7y+JLQ9WCJ5b9rVOT2TdV03F4tvSjOj3KUIklz2D/6miCOp/ZVi1nTwByNh
	BmRjpD31+OMc5lGn5rjKVN0WiPdGzF92+HShBU70KlveGffMF3sSpMGkhseBAPN+xp6Pg/mcdS3
	NzV/HnlaFF49GxXXkM0SJrRIgytjfvfTby6g8PRuxpMgvndXaya/egfV9Qb2fJV5lO2RvI/b0//
	P/6Ir0Nor088YbUxM45AVZHaZCcLgLQ5y3KpX1myK2XQyRtXEhDuTOUAaAweWKZT/fEFQyEsUs8
	EbTHPX28HNDHzS29x7
X-Google-Smtp-Source: AGHT+IGEoZUwPFD59KrJidNkG9F67yymewSdufIMxYqDAzd7rSdFYU/UTCa8BEI6YpP6tuO8Wx01SA==
X-Received: by 2002:a05:600c:46cc:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-477c0174856mr324752135e9.7.1764435026599;
        Sat, 29 Nov 2025 08:50:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791115caa7sm144049695e9.6.2025.11.29.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:50:26 -0800 (PST)
Date: Sat, 29 Nov 2025 19:50:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	FUKAUMI Naoki <naoki@radxa.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered
 on PCIe switches
Message-ID: <202511290255.uBLXDIG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127134318.3655052-2-cassel@kernel.org>
Message-ID: <20251129165022.Go1uLkvOuGeoXPKgo6MwKZTj8jUDkx5JKbEj5FGILO8@z>

Hi Niklas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/PCI-dwc-Make-Link-Up-IRQ-logic-handle-already-powered-on-PCIe-switches/20251127-214649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251127134318.3655052-2-cassel%40kernel.org
patch subject: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered on PCIe switches
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290255.uBLXDIG5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511290255.uBLXDIG5-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware-host.c:737 dw_pcie_host_init() warn: missing error code 'ret'

vim +/ret +737 drivers/pci/controller/dwc/pcie-designware-host.c

59fbab1ae40eb0 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  712  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  713  	ret = dw_pcie_setup_rc(pp);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  714  	if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  715  		goto err_remove_edma;
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  716  
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  717  	if (!dw_pcie_link_up(pci)) {
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  718  		ret = dw_pcie_start_link(pci);
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  719  		if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  720  			goto err_remove_edma;
da56a1bfbab551 drivers/pci/controller/dwc/pcie-designware-host.c Ajay Agarwal              2023-04-12  721  	}
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  722  
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  723  	/*
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  724  	 * Note: Skip the link up delay only when a Link Up IRQ is present.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  725  	 * If there is no Link Up IRQ, we should not bypass the delay
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  726  	 * because that would require users to manually rescan for devices.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  727  	 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  728  	if (!pp->use_linkup_irq) {
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  729  		/* Ignore errors, the link may come up later */
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  730  		dw_pcie_wait_for_link(pci);
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  731  
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  732  		/*
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  733  		 * For platforms with Link Up IRQ, initial scan will be done
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  734  		 * on first Link Up IRQ.
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  735  		 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  736  		if (dw_pcie_host_initial_scan(pp))
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24 @737  			goto err_stop_link;


	ret = dw_pcie_host_initial_scan(pp);
	if (ret)
		goto err_stop_link;

cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  738  	}
4fbfa17f9a0755 drivers/pci/controller/dwc/pcie-designware-host.c Shradha Todi              2025-02-21  739  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  740  	return 0;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  741  
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  742  err_stop_link:
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  743  	dw_pcie_stop_link(pci);
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  744  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  745  err_remove_edma:
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  746  	dw_pcie_edma_remove(pci);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  747  
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  748  err_free_msi:
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  749  	if (pp->has_msi_ctrl)
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  750  		dw_pcie_free_msi(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  751  
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  752  err_deinit_host:
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  753  	if (pp->ops->deinit)
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  754  		pp->ops->deinit(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  755  
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  756  err_free_ecam:
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  757  	if (pp->cfg)
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  758  		pci_ecam_free(pp->cfg);
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  759  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  760  	return ret;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  761  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

