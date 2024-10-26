Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D783E17C22E
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Oct 2024 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729929857; cv=none; b=hK7fiIqPthELPmZ1XoIPHrr2zwcIXiiPgT0WcX3r+MPfgNm15pysh5Ch+9Wo9Lu+yvNRrdTG6qHO6Ps1trof3qWTGaOO3eF05/eTVkRKA+rNIFrzNrdg8aTzSYIVActWW2K28iGcRciCxRLD0+eG5lhGjOexZMZy2gdqXdifjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729929857; c=relaxed/simple;
	bh=7DAM3QTQfqt4ZqsjC1sViPiWw7XtXvpBR1s9SbVm6iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XaNiBHM7kZDq1UUkivGwyTi2qP6H5iRc4UthW3rdDexnDwRVF//oROXt7WWHkWuU/9C68iOfPXGoO5FWMMnQpRE/DR/1iLbhpVCaO5Q3JpYqNuuT7iAXVolh3bq/cad1xSu1HNYY4RyOQ6dP0aDhhVeC8XYvta1P98Kj3ipoobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wV1bb0xE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wV1bb0xE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d447de11dso1918568f8f.1
        for <oe-kbuild@lists.linux.dev>; Sat, 26 Oct 2024 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729929852; x=1730534652; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9IP5Ks08Nx+8LsSEs3sWLm5/UYKOm82d+7qFjkOfBU=;
        b=wV1bb0xEq71tiIX1blvJn1riYc2hBs1HAP37Mx5vDwW46QyXwujXUj066m1GApcu/k
         thx0B5+7m5mfuLA6w9AabLY5wnnwBdepQTb+3o7K5smLEVRCFBQ6X1+oc/cD3Tk2tzkN
         EhtH6g10b4iq6o4QD8XDjz0ZKBmmczcElmZbNcuZ3k8A3mzebJ7kG8CG1k8q4d4eEZi1
         S/7X3/oQLB0YUFwI4N0/4rkVrTev3Q2evBYMVWWWdOv7jrzO0Sbsuixi4BdrSWMvwKJG
         t70HFT7rM03iXNw74odeQbptCDI3YmmIlaGwGzjFluBgz6CJr6Gyy+9JEMqvNJS06Edc
         0aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729929852; x=1730534652;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9IP5Ks08Nx+8LsSEs3sWLm5/UYKOm82d+7qFjkOfBU=;
        b=ekA99X5EASuOsgjW4QVc7Xt1qnr9epY92YniERMfwnE8SiK8nrn2eRnDTOxyPqk8iZ
         bij7K+XhELDuve5mLPh9u8wply1MGynBVwGOeCeeDZHvjizOU9ZiGFKM/W4qAWpjupkx
         CP5aBQvPwK+U6MCjeQz6h6TJ7i7tmD0olRK4my0eOPRE2s2xgUg4+c8X/rgMPJg7UPBi
         wVuWAd9tPjYoDt/BbQagQ+ntQ98KiyBoRHs47Itrua09msTsvsca547eQQYYcSSV9HEk
         HZS3C0u9BK4WTRrCUS/ZrFunsrB4KEakkGWJVxifOhtyHnL7QDMVgsIqWR+ohOs0PfRP
         ZcEw==
X-Gm-Message-State: AOJu0YysCAWJI883NRgirwVPL8SafY/hejDe2EMAFexyWqqXnVVZq4YN
	O3IXmexRTfV5gBtT2UhMwolVBIw/OlgtFwgaWa4TTNqnt4yV58DZwQNKuUjXLUxZYKKLv0VOGUg
	W
X-Google-Smtp-Source: AGHT+IFBtZYIqFDauCbN9jhSI1Fy+ciwsZmKin1yR+P7ykifdTlGgXbI8GS95lLbS0DDPAHQJO/nog==
X-Received: by 2002:adf:fe02:0:b0:368:3731:1613 with SMTP id ffacd0b85a97d-38061141c4cmr1389246f8f.13.1729929851968;
        Sat, 26 Oct 2024 01:04:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bd8sm3626473f8f.87.2024.10.26.01.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 01:04:11 -0700 (PDT)
Date: Sat, 26 Oct 2024 11:04:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Li Li <dualli@chromium.org>,
	dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com,
	surenb@google.com, arnd@arndb.de, masahiroy@kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, hridya@google.com, smoreland@google.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kernel-team@android.com
Subject: Re: [PATCH v3 1/1] report binder txn errors via generic netlink
Message-ID: <3673df95-81d5-4d71-9b1b-9b233cfb77c0@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021182821.1259487-3-dualli@chromium.org>

Hi Li,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Li/report-binder-txn-errors-via-generic-netlink/20241022-032903
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241021182821.1259487-3-dualli%40chromium.org
patch subject: [PATCH v3 1/1] report binder txn errors via generic netlink
config: x86_64-randconfig-161-20241024 (https://download.01.org/0day-ci/archive/20241026/202410260847.NDByoPQo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410260847.NDByoPQo-lkp@intel.com/

New smatch warnings:
drivers/android/binder.c:7204 init_binder_device() warn: '&binder_device->miscdev' from misc_register() not released on lines: 7204.

vim +7204 drivers/android/binder.c

ac4812c5ffbb88 Martijn Coenen    2017-02-03  7173  static int __init init_binder_device(const char *name)
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7174  {
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7175  	int ret;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7176  	struct binder_device *binder_device;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7177  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7178  	binder_device = kzalloc(sizeof(*binder_device), GFP_KERNEL);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7179  	if (!binder_device)
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7180  		return -ENOMEM;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7181  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7182  	binder_device->miscdev.fops = &binder_fops;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7183  	binder_device->miscdev.minor = MISC_DYNAMIC_MINOR;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7184  	binder_device->miscdev.name = name;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7185  
f0fe2c0f050d31 Christian Brauner 2020-03-03  7186  	refcount_set(&binder_device->ref, 1);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7187  	binder_device->context.binder_context_mgr_uid = INVALID_UID;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7188  	binder_device->context.name = name;
c44b1231ff1170 Todd Kjos         2017-06-29  7189  	mutex_init(&binder_device->context.context_mgr_node_lock);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7190  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7191  	ret = misc_register(&binder_device->miscdev);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7192  	if (ret < 0) {
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7193  		kfree(binder_device);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7194  		return ret;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7195  	}
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7196  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7197  	hlist_add_head(&binder_device->hlist, &binder_devices);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7198  
39854ac9458c74 Li Li             2024-10-21  7199  	binder_device->context.report_seq = (atomic_t)ATOMIC_INIT(0);
39854ac9458c74 Li Li             2024-10-21  7200  	ret = binder_genl_init(&binder_device->context.genl_family, name);
39854ac9458c74 Li Li             2024-10-21  7201  	if (ret < 0)

Needs a misc_unregister() as well to prevent a use after free.

39854ac9458c74 Li Li             2024-10-21  7202  		kfree(binder_device);
39854ac9458c74 Li Li             2024-10-21  7203  
ac4812c5ffbb88 Martijn Coenen    2017-02-03 @7204  	return ret;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7205  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

