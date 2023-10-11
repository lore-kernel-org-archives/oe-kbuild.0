Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2641D199A9
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AqmTfJ3l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4066692ad35so60949475e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 00:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697008902; x=1697613702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6onyuTNL+RmJpgqn0wTHaZliIp2waNtNht1K7VeUBDc=;
        b=AqmTfJ3l93VduI4eLQI1eKj/6iLv7PbdMlykrjC+VJ55PLL5dZ0qNch/eV0OvJku8I
         lohCLjcxcnty3+aGh5ldGV+m8fpH+aEgCPHxSDs+ZrE6rXVlSTwsJ6Qak2slg1E+7qpN
         Ne/gDdYmeTL5S+S/O27k8xiywAhO+mioEC95HsaIN6thHAzO9/S7JdwBwmlLxl5bOoLj
         jJq3UasCiYrqIwdAqxe4XchczOgymDylbc3B39BlC8QI18u3Cu5r0AO5A5pd3mJSPP7/
         YaXvK0Gy3vSiahzAMXINJI7a5BjePKYki2hYpcsbsUGb/YB9qyWZ4yvxwF6fEdrSwlJU
         yPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697008902; x=1697613702;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6onyuTNL+RmJpgqn0wTHaZliIp2waNtNht1K7VeUBDc=;
        b=Q+zkEf2Jc2NPYo+JkJGO/B29IInIMXW5EGG3LWiGAGkVNkSnA7LDsA8toAWAq95Vpe
         QJNOBmP/yc09w6OUgCImZ2gPTUTG962aPpjZHjIiyL1wQhdw/UC1UY4x9utjUPtZocZa
         IzCtj3QB5i+J0Gkwl6wh9wpynTJGOVqh6A9TS1glBV2BdmApl7w8qe45+vlm5+G3EHa1
         mreUuk1MGqCwV2pvfg7j1ucE/WHRxgxWSkXYCL+4ZLl5fBb/E6UKdOmUTKrRPzanQi9q
         ZQwV1hKzoO5zuTAtkig2Mpr/jT0luHtm3m77JqAeXsowmy8TEdtTddSgzPdHlL+/s9sJ
         M/Wg==
X-Gm-Message-State: AOJu0YwL8tLGAf9xSHHdEeowarON4LkD9G9sTLqJ30d+OOxmXCplUisa
	k9Ln3DLcn9LzS5m9VfXlnmlafP/NPE3j77oIOwo=
X-Google-Smtp-Source: AGHT+IFi0HEIhpJot2aVjlAGP6vgnDPZnWhdXDPHCNl3BwzmCQdWMI2BF5LqMTM581Ttl410ZQHQjw==
X-Received: by 2002:a05:600c:22ce:b0:405:34e4:14e3 with SMTP id 14-20020a05600c22ce00b0040534e414e3mr16991755wmg.3.1697008902152;
        Wed, 11 Oct 2023 00:21:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c230b00b004053a6b8c41sm15869740wmo.12.2023.10.11.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:21:41 -0700 (PDT)
Date: Wed, 11 Oct 2023 10:21:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn:
 variable dereferenced before check 'peer_device' (see line 587)
Message-ID: <fa10fbf8-d852-45bb-a631-d8dcb6697e16@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: 0d11f3cf279c5ad20a41f29242f170ba3c02f2da drbd: Pass a peer device to the resync and online verify functions
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231011/202310111418.3EglIsGN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111418.3EglIsGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310111418.3EglIsGN-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn: variable dereferenced before check 'peer_device' (see line 587)

vim +/peer_device +588 drivers/block/drbd/drbd_worker.c

0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  585  static int make_resync_request(struct drbd_peer_device *const peer_device, int cancel)
b411b3637fa71f Philipp Reisner      2009-09-25  586  {
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30 @587  	struct drbd_device *const device = peer_device->device;
                                                                                           ^^^^^^^^^^^^^^^^^^^^
Dereference

44a4d551846b8c Lars Ellenberg       2013-11-22 @588  	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
                                                                                                   ^^^^^^^^^^^
Previously we assumed this could be NULL

b411b3637fa71f Philipp Reisner      2009-09-25  589  	unsigned long bit;
b411b3637fa71f Philipp Reisner      2009-09-25  590  	sector_t sector;
155bd9d1abd604 Christoph Hellwig    2020-09-25  591  	const sector_t capacity = get_capacity(device->vdisk);
1816a2b47afae8 Lars Ellenberg       2010-11-11  592  	int max_bio_size;
e65f440d474d7d Lars Ellenberg       2010-11-05  593  	int number, rollback_i, size;
506afb6248af57 Lars Ellenberg       2014-01-31  594  	int align, requeue = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

