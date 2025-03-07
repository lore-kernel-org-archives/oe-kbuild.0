Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687EC1A83E8
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741333425; cv=none; b=eNhUfQpymR/p2SApzokIgaso3crNOLOyqxkWfskuwGzRqkg3H/PejPVA0A2EkTphx+yigCRIPR0FWXVwQ+Ja+dwRX9DOFIHDi12qtCUBcw/8vRBV8Eb12h/91OkihCtQT+9HQCOKWfz152YtCnhMnXktuWWUcBLGOZgqB7O787o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741333425; c=relaxed/simple;
	bh=q9EjPrsiTkSrrCSkftDQ0XVhghk2mMj/z1pgIRJ8EFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IML1NJ+NI3C775TR5o0cMMuuqia4V5Tgfl7vS95fWd/9INihm1lBgBIb9cDDbLbBEnvvFwwQQoeDG16bqyTrsoxVBmmN5QHPG9N1ggcATdBLPV+zAMl4GPuw4wQ93JnCmVo1h8jJaaT7P/9eeNA9QD2h3itx+1kF8mhCE62nsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0eRRsCt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0eRRsCt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bcad638efso8885795e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Mar 2025 23:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741333421; x=1741938221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAiX7ZoQFnaQDtZJKG3FPxlAfD7LyYqjF8yJgV4SPk0=;
        b=s0eRRsCtTB4DVZN2I7FuUK5Lu0/Dy2tpJvEAPZ70iH1i0z7BkxEXwoNoYDqXqovLKj
         PtvYQMnDzwiCc3/8Il/9MAFrtgvdM7JHeJ37h+LYq11nGJ0w/sC+vdrDsy145RgwGSH/
         Xe+Isuqgh6lrlL5ZnTuFPdoyeGBoqIS1Xux3y7Vg1F9WszLLJVujJe6kskiOPyIeVXst
         J+Dr4UMr2AQaJ5d08k4ZwHN7d9bH1iELAeXxZMIZ0leNt3OJrP+DsikMtrwNqmhJok8R
         ocLtna3gFw8PCABDUSlNKQ+mmiEPCRDRWvzGhuWaoDWyKerlx1sVJRX9eOMSykyB4IY8
         VSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741333421; x=1741938221;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAiX7ZoQFnaQDtZJKG3FPxlAfD7LyYqjF8yJgV4SPk0=;
        b=kMOxKUpuIAe+B1sJqjSwRMZilODmi2edzToZl7PPkr3lJfVcwrig0rjq5r49jbGWIo
         CQpkqEjt3fmnzSb4SBqRWBVT5sWN9uvSoiLiQs7Ss8OcYS3t5dD/k6yVu9hWhw4+NKMU
         NYGlPXBvSHt2ER/VQVuW8CqE2gAo+l24XiKJtPjmZm5DLJOo97GHcCMSSy+0flqbHX9D
         lbfLSocpFrbXUl2vvF/7++npUcR0yCgLmIuhe+AfClbAC0NV53jb1YLhVfgDe+aEbijq
         k5vWw8VOfJ7MsgbELscm4N8ZfJc4wmSmZh0ct28aB/ri6Howvd2Gxm80/skHSH8cwEI1
         bEDQ==
X-Gm-Message-State: AOJu0Yzl85Sh9kUQ8IG8hUBdMOJNY/gCAj2LpYcu3AxylAwnVnjrYkXB
	5PE1fsnYNKyCtXjr847jNqZPlIvw5eOykoz++gbZ38/V29bMsxD4gBzsZWn0yYsxlpThoe8R/jp
	z
X-Gm-Gg: ASbGnctfvDd9Fz72xFR2bf8ndzXLL4fR3bta3WrfAOEoZHKSD3OAFFL7+LfS5NTx8lJ
	eii90ySj+FGud4oEbYZ67tDdGeLcefECuZYE1mSU57vkFp8pXrJz68gWJ+9P3W7BfvGH9XTNsgW
	4CdHGu/li5dnL4lOYw6IjXOopXFnKw3nm3syKzPEDv6DbPQG+OU/ruyP6IlCstklwonzzUKoxbl
	cr/afYubWMuXFkG3+IFBAAjLAdzbYycJl/nlIG4EOZF8+mvr1qssGgEJOLudmIVxZYjr5sOHfsI
	yOaVI0YjMRvmziNonDNTmAEEWSTMgdKL78iSp1gqyy4B8LUdEQ==
X-Google-Smtp-Source: AGHT+IFk6A8C/ZntqwxTrlUz2PFzjZZpFVU9KCl3S1emNKm9UtBgGjkFq3dnBk02LPS/zX7/WThaAQ==
X-Received: by 2002:a05:6000:381:b0:391:4ca:490 with SMTP id ffacd0b85a97d-39132d76e70mr1285143f8f.29.1741333420618;
        Thu, 06 Mar 2025 23:43:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd4352fa3sm72716925e9.30.2025.03.06.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:43:40 -0800 (PST)
Date: Fri, 7 Mar 2025 10:43:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, raoxu <raoxu@uniontech.com>,
	mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangyuli@uniontech.com,
	zhanjun@uniontech.com, Xu Rao <raoxu@uniontech.com>
Subject: Re: [PATCH] From: Xu Rao <raoxu@uniontech.com> Subject: [PATCH] usb:
 xhci: Add debugfs support for xHCI port bandwidth
Message-ID: <8318dbc1-1c15-4a11-abba-23f917e8b176@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303095837.16332-1-raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/From-Xu-Rao-raoxu-uniontech-com-Subject-PATCH-usb-xhci-Add-debugfs-support-for-xHCI-port-bandwidth/20250303-180107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250303095837.16332-1-raoxu%40uniontech.com
patch subject: [PATCH] From: Xu Rao <raoxu@uniontech.com> Subject: [PATCH] usb: xhci: Add debugfs support for xHCI port bandwidth
config: riscv-randconfig-r072-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071516.tj5UBRqT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503071516.tj5UBRqT-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci.c:3120 xhci_get_port_bandwidth() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/flags +3120 drivers/usb/host/xhci.c

01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3094  int xhci_get_port_bandwidth(struct xhci_hcd *xhci, u8 *bw_table)
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3095  {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3096  	unsigned int		num_ports;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3097  	unsigned int		i;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3098  	struct xhci_command	*cmd;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3099  	dma_addr_t		dma_handle;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3100  	void			*dma_buf;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3101  	int			ret;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3102  	unsigned long		flags;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3103  	struct device		*dev  = xhci_to_hcd(xhci)->self.sysdev;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3104  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3105  	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3106  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3107  	cmd = xhci_alloc_command(xhci, true, GFP_KERNEL);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3108  	if (!cmd)
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3109  		return -ENOMEM;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3110  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3111  	dma_buf = dma_alloc_coherent(dev, xhci->page_size, &dma_handle,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3112  					GFP_KERNEL);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3113  	if (!dma_buf) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3114  		xhci_free_command(xhci, cmd);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3115  		return -ENOMEM;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3116  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3117  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3118  	/* get xhci hub usb3 port bandwidth */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3119  	/* refer to xhci rev1_2 protocol 4.6.15*/
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03 @3120  	spin_unlock_irqrestore(&xhci->lock, flags);

This was supposed to be spin_lock_save().

01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3121  	ret = xhci_queue_get_rh_port_bw(xhci, cmd, dma_handle, USB_SPEED_SUPER,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3122  					0, false);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3123  	if (ret < 0) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3124  		spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3125  		goto out;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3126  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3127  	xhci_ring_cmd_db(xhci);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

