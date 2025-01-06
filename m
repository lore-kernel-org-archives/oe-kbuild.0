Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26831DB346
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736163775; cv=none; b=ViaY/vcpPka96Aw7wzxKYASxDHEkMz5S7JOQQimznZoaBSXeMrzIkrx1cVaxarJ3U6S8PCnP2W89ddlrr3yozgMSTyttGu6KS6vMsLPWlKMT/hacpdB+Fb+IJADLAl9+xc0sTPWnDukjfoTmA0NFI9B+RRz/CAQ0yIva3UM7h+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736163775; c=relaxed/simple;
	bh=qW4wObHyuTrT4Zir2rUK748yTIQfQRMYqu6TyI7Ae5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QCDbsdZ0o1oOLEOwW3FwWihG2xMBmOWxA/UP2qgb20icUgIVHfF22MeBhMYTiN3UumR69cOwUS4PKMsAtS0v8Aql8j4WxUCNLaHIvwccLRGc+bDHJ2pb1avXjqqb83SaQsTVYTEdyjgk7nm1Q0SfUv81MhEnoJAaqHYlxJiaXj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tljCNQ38; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tljCNQ38"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso149655085e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 03:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736163772; x=1736768572; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YG3GOy+g/NwAsJ5y2aA9Pj10HoYNeBxwmK3RuNDKnA=;
        b=tljCNQ38X2xzlJDsz6wkOmtIeNpyxnY8V1S+C+MU9CMJE/ZDFJ0KITPcZYq2zh+8sa
         vZ+gRgXHuSCBvALLw108PeWo6JZKseO9IN1f+lCJMcvQEmklBgBu1+TY6oXmCGcC13oY
         6cMPpABDuXaudkVt4TPzZJYjSpl04F9ASbqa94gQNuEAfsaMagytKqJEeZIdAecaR/bI
         5QiYjt+kRlmZZzheLInhesk1ZSkrNVJer/fFL4IzFWcPdsPjoIHK0C0aZLoTBuvfOkhC
         f2ghiNMzIcLaUZiOiMjcel3pZcOai8XFE1CDXtV0uHnxTv7lthxtKBksWpjAJd1mWQC5
         HW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736163772; x=1736768572;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YG3GOy+g/NwAsJ5y2aA9Pj10HoYNeBxwmK3RuNDKnA=;
        b=XWiUPQVpMEoTnkeVEmQe7d21FOLLiCHZe6Iyq9/CFsHwzFerwWBiFruPacPhPhhWKa
         MH2UzE6Ve5cr/5wpHt0yKlHNDk2ofRO29YTd2uJbPMZP1dplisvLAn5Iz6VJCioArDBC
         lAnJncN7L7iCTkSRJhcrrIYP4tyDCk/1y8CeQ5RvuEtSa61rIHy69wnFJLxyF9owwqEf
         FdqtBoRY38pHVgQYRQ8BRJ88kVO4IV+3o8VvIVxCJfqgvzQxnGSbcfBSdMm7nGqWGSn1
         GWcrfipxacBcv/hPkNIdt1W4gvsMjqq2yQ+/sIzejMJqTTMeYQTLUPBRepMXHEVM+dCX
         GEdA==
X-Gm-Message-State: AOJu0YxRDJFhHdj/wy6D1r8jhOy5GdyGhI2Lew7qaUOvJMw2CJoDLScp
	xpZljtbkRJ53CNEM5H23Gnz9EcUdE0gyOlT2KxGdyyeM+gRPnSomrad6COOUH07dCuRb2ETd2zZ
	X
X-Gm-Gg: ASbGncvbFU7Ba8oelAJ/gXt0/scGv+h7hKwfhD8JYzvCBbDXr/kW2FGJiq9fysfAbt8
	yDYXZl8neinihWtXY227l9Qt5Dz0SOaR6XTIkS3/1rqnArecD+sW3VIAKoR4V3WZpMq/GgBJJTQ
	2RBF65gQsJ2846pZytRjzdbvjT3L5RTE4zgLb6k3V3Rg11lcdddbuG8DPcdTnNEQO3aalumJ1AQ
	YsMtXMMpQjoGOGzG9PPXGKKGbGPtwftRlUXpUuXvSNlLy+eqHUg2r4fwwC1Ag==
X-Google-Smtp-Source: AGHT+IG58q8cr4ocVDcWdFjGoPg3w6C7BABpHxOy8yDsyEhI0WRiV8e3ntHXum0mHI3s5vxK/9Yb1w==
X-Received: by 2002:a5d:584f:0:b0:386:399a:7f17 with SMTP id ffacd0b85a97d-38a221f2ed2mr38603926f8f.24.1736163771738;
        Mon, 06 Jan 2025 03:42:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6abesm47655764f8f.90.2025.01.06.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:42:51 -0800 (PST)
Date: Mon, 6 Jan 2025 14:42:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ahmed Zaki <ahmed.zaki@intel.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	intel-wired-lan@lists.osuosl.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	davem@davemloft.net, michael.chan@broadcom.com, tariqt@nvidia.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	jdamato@fastly.com, shayd@nvidia.com, akpm@linux-foundation.org,
	Ahmed Zaki <ahmed.zaki@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH net-next v3 3/6] net: napi: add CPU
 affinity to napi_config
Message-ID: <e602748b-4376-433f-b864-066afa11daf5@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104004314.208259-4-ahmed.zaki@intel.com>

Hi Ahmed,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Zaki/net-move-ARFS-rmap-management-to-core/20250104-084501
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250104004314.208259-4-ahmed.zaki%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v3 3/6] net: napi: add CPU affinity to napi_config
config: i386-randconfig-141-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050625.nY1c97EX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501050625.nY1c97EX-lkp@intel.com/

smatch warnings:
net/core/dev.c:6835 napi_restore_config() warn: variable dereferenced before check 'n->config' (see line 6831)
net/core/dev.c:6855 napi_save_config() warn: variable dereferenced before check 'n->config' (see line 6850)

vim +6835 net/core/dev.c

86e25f40aa1e9e5 Joe Damato     2024-10-11  6829  static void napi_restore_config(struct napi_struct *n)
86e25f40aa1e9e5 Joe Damato     2024-10-11  6830  {
86e25f40aa1e9e5 Joe Damato     2024-10-11 @6831  	n->defer_hard_irqs = n->config->defer_hard_irqs;
86e25f40aa1e9e5 Joe Damato     2024-10-11  6832  	n->gro_flush_timeout = n->config->gro_flush_timeout;
5dc51ec86df6e22 Martin Karsten 2024-11-09  6833  	n->irq_suspend_timeout = n->config->irq_suspend_timeout;
                                                                                 ^^^^^^^^^
These lines all dereference n->config.

d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6834  
d6b43b8a2e5297b Ahmed Zaki     2025-01-03 @6835  	if (n->irq > 0 && n->config && n->dev->irq_affinity_auto)
                                                                          ^^^^^^^^^
This code assumes it can be NULL

d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6836  		irq_set_affinity(n->irq, &n->config->affinity_mask);
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6837  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6838  	/* a NAPI ID might be stored in the config, if so use it. if not, use
86e25f40aa1e9e5 Joe Damato     2024-10-11  6839  	 * napi_hash_add to generate one for us. It will be saved to the config
86e25f40aa1e9e5 Joe Damato     2024-10-11  6840  	 * in napi_disable.
86e25f40aa1e9e5 Joe Damato     2024-10-11  6841  	 */
86e25f40aa1e9e5 Joe Damato     2024-10-11  6842  	if (n->config->napi_id)
86e25f40aa1e9e5 Joe Damato     2024-10-11  6843  		napi_hash_add_with_id(n, n->config->napi_id);
86e25f40aa1e9e5 Joe Damato     2024-10-11  6844  	else
86e25f40aa1e9e5 Joe Damato     2024-10-11  6845  		napi_hash_add(n);
86e25f40aa1e9e5 Joe Damato     2024-10-11  6846  }
86e25f40aa1e9e5 Joe Damato     2024-10-11  6847  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6848  static void napi_save_config(struct napi_struct *n)
86e25f40aa1e9e5 Joe Damato     2024-10-11  6849  {
86e25f40aa1e9e5 Joe Damato     2024-10-11 @6850  	n->config->defer_hard_irqs = n->defer_hard_irqs;
86e25f40aa1e9e5 Joe Damato     2024-10-11  6851  	n->config->gro_flush_timeout = n->gro_flush_timeout;
5dc51ec86df6e22 Martin Karsten 2024-11-09  6852  	n->config->irq_suspend_timeout = n->irq_suspend_timeout;
86e25f40aa1e9e5 Joe Damato     2024-10-11  6853  	n->config->napi_id = n->napi_id;
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6854  
d6b43b8a2e5297b Ahmed Zaki     2025-01-03 @6855  	if (n->irq > 0 && n->config && n->dev->irq_affinity_auto)

Same

d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6856  		irq_set_affinity_notifier(n->irq, NULL);
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6857  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6858  	napi_hash_del(n);
86e25f40aa1e9e5 Joe Damato     2024-10-11  6859  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

