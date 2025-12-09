Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656E29B8DB
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765268053; cv=none; b=WEjeciIdv2DL0CRp4dsd0uGgeQCh+budDNRCJjE7AhjO9Y8H8pZi8JayNFkc8vyNLb4NZmY1wOVEgE0SvlT6RPfS59mmfADBDNghK1fZjFSqmNpEOXg0poWNU30X77/l2Q9pMt9yQEjYxHxvmfiZM2XdiIGHBhsWn1NXel0Nv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765268053; c=relaxed/simple;
	bh=WiBPEAcucmMl3ncW6dEf8nzkpRo6LI+EWrYOZiB5vQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RS5kpQaPJIPeg67iu6ddqx7OduYgO7QtCka9vBjRSfjiQq0HxaHsZGIdFsb0+5DwL2bltl5Q+gzN7Uk+oPuxeHD2kwBMrCuEpTaVqNIrVuNVUAob9/3UD6KV5Lv1KIzKY3VutTfZ8eP5Wv8JOvHx3WLiQQiZMNcgJQOcIGuecRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yB8edlKD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yB8edlKD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so67368095e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 09 Dec 2025 00:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765268050; x=1765872850; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2wg2FYVkjXh5aCmoBNtOWAaU71M7u5F8AD88H/8BDxU=;
        b=yB8edlKDNz8roUXdGXAXCFkk1Wfpp/yQkWASJEAbzvnTjLOpxC6ie7yhgqVWUU2Tio
         jcjF5Yb2xaPCax0DBH9cSrHjASJb9bTwZCZurur7/sxIdAaU+NzKi1R2VMsER02XssJA
         GD4fSzxwsnUKC6V72IPjbwQ4Q0F9kXIfOZXmaY4I6qycKp7zlnf2HLIzPP2GduCkHgKX
         I1O18KquPHxha+NcAwcvn+Dj/Eg+G+gcF4P0uTF1RPOwrP9h7NdZtgSiMOSmjxHhQCwW
         23XfQxGCbLdFS66Hxbd0hJf1BnqY2NpyedRvlYGxyK0VzTQXAQCepjMgxUZUXC9fvPG/
         ebTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765268050; x=1765872850;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wg2FYVkjXh5aCmoBNtOWAaU71M7u5F8AD88H/8BDxU=;
        b=o03qDN+35dvv5mO+t82kgqhRusPm2XPUC6RYOoB8rNzuB3gEA0v1INLL52K3JW0hc8
         1g1jPsLQYOlZMewfZctsLABe62UmGRTrUY8H6pk7z5kAOgK0U1kRnqG+VV4sh9i7xTSS
         Z6goEtxhskDOHoMZXoP9sdvpQtGD1US8p5P6ctxzcKnQLgfKd4NzuNEXjax9Zbe/4220
         DehewdSUESLKgbWH5hmYSqzGqJNMwCo4FK2yWvGORP0Ow01LSo8+m8hXsXF1vU6Dvhy4
         KENo9Sy3Ye2Z9Jj18scdySqItGKq4xf62hjE+Af3/TxYe804bAbz16PThiY01y0s6X2j
         EznA==
X-Gm-Message-State: AOJu0YxTPXv5/E15lOIqkhzv6YaRh9ecliypznrgnMNAZYiPX6homYJM
	jonQjGWpC+4wBAsVqmCZ2sp0/fcPZ8FsU5aIzxea+8INWQLR/95KbrXtwI3dJwS22jFbJyCQa82
	hLUYN
X-Gm-Gg: ASbGncvg1LmC7KfVHGdQIqufeasYngMUXxsjXNhu4HdxoFXylfGb5EM5p9ayEPf68uU
	fjVfrjuMJsTx/Aw4XEkZrciJjetr+BMxh5IReqvD5tm4elI73fEXPrjrNTBqFSrDoO7bPS3+x3W
	9+z5rqoBgEJwPACT7jmoAwklZWmYtB7NmmbhwmLSxabZ/eHiGoU/mOAw+H2+eGSKLznDj51m2pp
	HEqe5R8eVS0r4s6ZsuhIw02MSQlAh4SIQhbxmVP+Eio2xvQzgLt5m38up1wy2b0jTdqXGLY9d4p
	x+UCgpQ8ng75NHa5nTF0kHGabnXltikpYt0zTOswm9cxPje+3bjY0l8+CERYxiwS/M8pOuyANsS
	JK5xHxK3Ah20g/pFfDN9d0rJ6pRKjVTEGOKlp7JIAWMSLyi2WkOvwEYc5dO6MoJ/eoaykRTi92c
	ooyQJzY69eoFCBNIP+
X-Google-Smtp-Source: AGHT+IEGfnb47BXL7kWT0jK9JS/OOmv6K3jMn7E9kJktQltZ1yjZ9wYvRbNvP+vsFqiJo5afmlDv5A==
X-Received: by 2002:a05:600c:4446:b0:477:b0b9:3131 with SMTP id 5b1f17b1804b1-47939df7d12mr107620625e9.8.1765268049577;
        Tue, 09 Dec 2025 00:14:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d632cebsm27773675e9.7.2025.12.09.00.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:14:09 -0800 (PST)
Date: Tue, 9 Dec 2025 11:14:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nilesh Javali <njavali@marvell.com>,
	martin.petersen@oracle.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-scsi@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
	agurumurthy@marvell.com, sdeodhar@marvell.com, emilne@redhat.com,
	jmeneghi@redhat.com
Subject: Re: [PATCH v2 07/12] qla2xxx: Delay module unload while fabric scan
 in progress
Message-ID: <202512090414.07Waorz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204151751.2321801-8-njavali@marvell.com>
Message-ID: <20251209081405.gkY49W-XfOqJe8RKnKDRRH18kBGKSeRhXNbFrGuBvsY@z>

Hi Nilesh,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/qla2xxx-Add-Speed-in-SFP-print-information/20251204-233117
base:   e6965188f84a7883e6a0d3448e86b0cf29b24dfc
patch link:    https://lore.kernel.org/r/20251204151751.2321801-8-njavali%40marvell.com
patch subject: [PATCH v2 07/12] qla2xxx: Delay module unload while fabric scan in progress
config: x86_64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090414.07Waorz0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512090414.07Waorz0-lkp@intel.com/

New smatch warnings:
drivers/scsi/qla2xxx/qla_os.c:1187 qla2x00_wait_for_hba_ready() warn: if statement not indented
drivers/scsi/qla2xxx/qla_os.c:1189 qla2x00_wait_for_hba_ready() warn: inconsistent indenting

Old smatch warnings:
drivers/scsi/qla2xxx/qla_os.c:4249 qla2x00_mem_alloc() warn: missing unwind goto?

vim +1187 drivers/scsi/qla2xxx/qla_os.c

638a1a01d36a14 Sawan Chandak    2014-04-11  1176  static void
638a1a01d36a14 Sawan Chandak    2014-04-11  1177  qla2x00_wait_for_hba_ready(scsi_qla_host_t *vha)
86fbee86e94c7e Lalit Chandivade 2010-05-04  1178  {
86fbee86e94c7e Lalit Chandivade 2010-05-04  1179  	struct qla_hw_data *ha = vha->hw;
783e0dc4f66ade Sawan Chandak    2016-07-06  1180  	scsi_qla_host_t *base_vha = pci_get_drvdata(ha->pdev);
86fbee86e94c7e Lalit Chandivade 2010-05-04  1181  
1d48390117c7df Dan Carpenter    2016-08-03  1182  	while ((qla2x00_reset_active(vha) || ha->dpc_active ||
9d35894d338abc Sawan Chandak    2014-09-25  1183  		ha->flags.mbox_busy) ||
9d35894d338abc Sawan Chandak    2014-09-25  1184  	       test_bit(FX00_RESET_RECOVERY, &vha->dpc_flags) ||
cedcf9d7bcbe3a Anil Gurumurthy  2025-12-04  1185  	       test_bit(FX00_TARGET_SCAN, &vha->dpc_flags) ||
cedcf9d7bcbe3a Anil Gurumurthy  2025-12-04  1186  		(vha->scan.scan_flags & SF_SCANNING)) {
783e0dc4f66ade Sawan Chandak    2016-07-06 @1187  			if (test_bit(UNLOADING, &base_vha->dpc_flags))

This if statement is indented too far.

783e0dc4f66ade Sawan Chandak    2016-07-06  1188  			break;
86fbee86e94c7e Lalit Chandivade 2010-05-04 @1189  		msleep(1000);
86fbee86e94c7e Lalit Chandivade 2010-05-04  1190  	}
783e0dc4f66ade Sawan Chandak    2016-07-06  1191  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

