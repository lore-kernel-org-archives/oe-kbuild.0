Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D41FECDD
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521869; cv=none; b=cL+PFJmkBlrT9e5/BmwiwZcx61QGnSStKyJenIATQEdqK1J50gb/ojqsyTZ8CboVt8yMlTGyo0T6JLRL9fpiiASWvOp9cKkHMYzzm3SJtEdKeQooFESpg/8RN7fMtqj7k9GMGch/KDiThGN4Bc1hAEDfxoTZZwyPOy5k2EGEvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521869; c=relaxed/simple;
	bh=r3KO+ZBs4mN082/WzjFPu6+tKInahyanTvO0ZCUAo/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uqzd9maZPngGtkq2mIoXj1k0PJQb4JILoM/XabOHbHcxqrgNbHzv4+OI6dqzzSiEQPG61krsfq6J51eIY+giY/Z+qWmnzOch0xPbSmr90GA5B0a2KqvYPfLjeDrVRSAairKO98MbltqmTzksevlQ342cfG4Tjuv4Buhb19bNQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5mcdJ3G; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5mcdJ3G"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73e55e829fcso260909a34.1
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521866; x=1753126666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sP/J78YSZFnZNYcFRTT3/TqZZq4tSvgtl6O7DciL3GA=;
        b=t5mcdJ3Ggc2rjTncIev6/vfBxFMoWuHWm+810pfLnLjyRa6aOmxkJLnJ5GkWfXsvKG
         lVIva2SWGQb24JC+fTUeRHKuVI96bM+EjDoRNsGmEmFaPwo7tYQwiIrIClRwMASKHgPa
         5XSDR//ec/FRzoDOFknP7l8U+YGzRfSjsZ+k9S2ObOVebOCyv0qBirNInj31vJvX0TLv
         Fok+eO1rhHkH5+nVbdGlkH/PeDtu79gvKOg4bvH+jaL5yaRlhCod9kQFrzXSiUiqSV7U
         DP/a13S4kcH0xsYKZrJc1yYdKEfglbE4NcIjNoQjaQDpr8NbisTEMimoQ7RWx9td8cLH
         qa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521866; x=1753126666;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sP/J78YSZFnZNYcFRTT3/TqZZq4tSvgtl6O7DciL3GA=;
        b=Gvw0ax9ZpdEZ6FObJth3WFKD5KgLqQDWDx+Q+EJL6CZ/YinD9XNK1/YdJB2BfPYMnD
         gElBYF0tOeeNjz3PCdgYL9phAbWKwm1oaRzUil63+CYQcp5O5QSuo2ea0ahyy1vCsRz3
         +eVTjDjpWa+kPU8spt8FOenL/Om3FQ5tY33S4hg1IqdN4ZrWHDYpAI9B1u9r7geVLwOI
         CU+TsActBk6bK1dy3SUSF7a+k3/xt8wJ6xG0BtwkfYVxtCvCwolSFvxRBAGYQIfOsKvO
         dPLnpDzKT9jfuxMyIJvkrc/XCH6mDt4e0/7qAE6l1/ZK2CS8lvoU3sSdvi4+6JJ2NwCO
         ALCw==
X-Gm-Message-State: AOJu0YyN25f9apZ0iCpQaFSY8NM1RmZjIfTy4sQEJV/R9AUtHS44PctQ
	ErXm2ZQ2C1Zu/xN+n7rjP8PRiTdxgH0A28hSNLr9wozcqmH76HRjj0BjsxP7LzLDV7G+PzFPaMY
	dI/rd
X-Gm-Gg: ASbGnct4jtpJhmJEhlVfm/LeE2d/TxB70R0LKzXd1lwWJAvxQxWBh4cWMtJu1dqHSCH
	zpPT1sQSQbe5FGwymVsX9cfERfRiATAoS+Kyp3n8b5rp8mFTQF6yyxXf6PkyvePrfysDXT+c6Gz
	jmOFwOQAx4yELgbPoKt7/4huO9ZEZgb4Z/QQ3Hcfl6vBC+S19oV3d5zG+HEbgQXtM4+kSziOTle
	H6RXEavr9//9zml2yiR2+kW9ljDErRBYaHxjXGW3QuMphqVsKUgLdszV1g9jilkRDeuSF/ktgbk
	xI1Q6uIeuFJXKHC4e6zA6r1lPe3KmwVVJ7KanIlw+uqBZQoBr3hRLutPmSxWcjxASMKdHz8mQEK
	tSBzvEfe1gklHm7xK9lRr8IYgzUWYwg==
X-Google-Smtp-Source: AGHT+IFErlbQA7v+YncKKuLD+GZLIWHCFOI/036UbG1GrAOyALCZ86WcXDhbFE3hQMC28zdAmyVLWQ==
X-Received: by 2002:a05:6830:7105:b0:72b:8aec:fbd4 with SMTP id 46e09a7af769-73cfc2b4cacmr10268075a34.3.1752521866082;
        Mon, 14 Jul 2025 12:37:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12a609esm1658573a34.53.2025.07.14.12.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:37:45 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:37:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, admiyo@os.amperecomputing.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Robert Moore <robert.moore@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Len Brown <lenb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH net-next v22 1/2] mailbox/pcc: support mailbox management
 of the shared buffer
Message-ID: <3806fc87-e574-46cf-98af-158c37f640e0@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710191209.737167-2-admiyo@os.amperecomputing.com>

Hi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/admiyo-os-amperecomputing-com/mailbox-pcc-support-mailbox-management-of-the-shared-buffer/20250711-031525
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250710191209.737167-2-admiyo%40os.amperecomputing.com
patch subject: [PATCH net-next v22 1/2] mailbox/pcc: support mailbox management of the shared buffer
config: x86_64-randconfig-161-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120609.Myazax08-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507120609.Myazax08-lkp@intel.com/

smatch warnings:
drivers/mailbox/pcc.c:498 pcc_send_data() error: uninitialized symbol 'ret'.

vim +/ret +498 drivers/mailbox/pcc.c

86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  490  static int pcc_send_data(struct mbox_chan *chan, void *data)
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  491  {
c45ded7e11352d Sudeep Holla       2021-09-17  492  	int ret;
bf18123e78f4d1 Sudeep Holla       2021-09-17  493  	struct pcc_chan_info *pchan = chan->con_priv;
e332edef98ddac Adam Young         2025-07-10  494  	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_hdr;
e332edef98ddac Adam Young         2025-07-10  495  
e332edef98ddac Adam Young         2025-07-10  496  	if (pchan->chan.rx_alloc)
e332edef98ddac Adam Young         2025-07-10  497  		ret = pcc_write_to_buffer(chan, data);

Hi Adam!  :)

ret is uninitialized on the else path.

e332edef98ddac Adam Young         2025-07-10 @498  	if (ret)
e332edef98ddac Adam Young         2025-07-10  499  		return ret;
8b0f57889843af Prakash, Prashanth 2016-02-17  500  
c45ded7e11352d Sudeep Holla       2021-09-17  501  	ret = pcc_chan_reg_read_modify_write(&pchan->cmd_update);
c45ded7e11352d Sudeep Holla       2021-09-17  502  	if (ret)
c45ded7e11352d Sudeep Holla       2021-09-17  503  		return ret;
c45ded7e11352d Sudeep Holla       2021-09-17  504  
e332edef98ddac Adam Young         2025-07-10  505  	pcc_hdr = pchan->chan.shmem;
e332edef98ddac Adam Young         2025-07-10  506  	if (ioread32(&pcc_hdr->flags) & PCC_CMD_COMPLETION_NOTIFY)
e332edef98ddac Adam Young         2025-07-10  507  		pchan->chan.irq_ack = true;
e332edef98ddac Adam Young         2025-07-10  508  
3db174e478cb0b Huisong Li         2023-08-01  509  	ret = pcc_chan_reg_read_modify_write(&pchan->db);
e332edef98ddac Adam Young         2025-07-10  510  
3db174e478cb0b Huisong Li         2023-08-01  511  	if (!ret && pchan->plat_irq > 0)
3db174e478cb0b Huisong Li         2023-08-01  512  		pchan->chan_in_use = true;
3db174e478cb0b Huisong Li         2023-08-01  513  
3db174e478cb0b Huisong Li         2023-08-01  514  	return ret;
86c22f8c9a3b71 Ashwin Chaugule    2014-11-12  515  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

