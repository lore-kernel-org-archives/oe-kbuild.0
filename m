Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5897813
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 05:48:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so13814325e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 22:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689918485; x=1690523285;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCeTB4WM/pt8WD+mQ9GMGSXARlfwN0bp+sUlEfBZ9K4=;
        b=biujymmCVqezxC27EiBBzYXIN5oU95W6+D1hcOAhHmhO0cf6u6gYJxdopCzzIty4k+
         CySOJBUc94S18RLgTxNhVO6OoHm/+lguSRl/aD4hRIjl7Xrig2RB4BSd2Pjah8UNvVqM
         iAI6x/EX6RmozBEPGHoELvPRpyWYyju8nHPqRvyiN53wjpKjKWTU+y0lcYa7a0WyDQ8Y
         5kHU16JhzWAXe1mjg1/aExF9mQu/RtUBNC7QZPPyxVxDoWZmrlPlIGs22CnFWhi14piz
         jlaB5+XMuyNXVewyWz0NevQFI9EiqKSMd3BF2LkBp1dim0FzPIgasfxOoQrVnYdUJE/g
         2FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689918485; x=1690523285;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCeTB4WM/pt8WD+mQ9GMGSXARlfwN0bp+sUlEfBZ9K4=;
        b=IVa8WV0YBfQaueOnW/uFZE/i4KyzZldSQhZuZK/olPTKXM08/4u2m6I3GWOkl+wocH
         2i/ALawAdlC0EF5Hadn/1i6wLMRIhZ639Ul8b+uXZ3HPhj+u3E19ouAsKLW0ZCSx7kbU
         rOqN4VpOsyLaPsUyrUg/iRmXFkUJigwSCkf1YD6lz+ULq7aIazns+knBt6WuG6u0dd59
         PY2oPiitBqCuDnLq5/AzYmxDSXO9mM9/bPT7mDqcf9wCImxN7dCibT3RYTD3ag0MUHrd
         dqce6MN8ciooP8EFT8e2GhlvR9OCSgGEzxrQmfck14vGOeMqKFv214Y13yEq9T28vuts
         dKlg==
X-Gm-Message-State: ABy/qLZAKQCTDg8371cY8SadOLcYscqqKP8+DRtHm8meXg2cf8hBA0AP
	tZmdFcbu5A1BCBgl1s5/dHh6fyHm280AVNwGqyM=
X-Google-Smtp-Source: APBJJlFWfZwIjZU6Q8aKC0H94OzMfm0NaC9oWbBE3+J65qfgvBGAiHVG/P6KFMfEoiscM41eOkf2hA==
X-Received: by 2002:adf:eb4e:0:b0:313:f5f8:b6d2 with SMTP id u14-20020adfeb4e000000b00313f5f8b6d2mr578491wrn.48.1689918485587;
        Thu, 20 Jul 2023 22:48:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u1-20020adfdb81000000b0030e5bd253aasm3174633wri.39.2023.07.20.22.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 22:48:03 -0700 (PDT)
Date: Fri, 21 Jul 2023 08:48:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn:
 variable dereferenced before check 'peer_device' (see line 587)
Message-ID: <73062d38-1008-4593-9d1a-ac673b99ae05@kadam.mountain>
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
head:   46670259519f4ee4ab378dc014798aabe77c5057
commit: 0d11f3cf279c5ad20a41f29242f170ba3c02f2da drbd: Pass a peer device to the resync and online verify functions
config: parisc-randconfig-m041-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210201.NF8Ro2N0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210201.NF8Ro2N0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307210201.NF8Ro2N0-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn: variable dereferenced before check 'peer_device' (see line 587)

vim +/peer_device +588 drivers/block/drbd/drbd_worker.c

0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  585  static int make_resync_request(struct drbd_peer_device *const peer_device, int cancel)
b411b3637fa71f Philipp Reisner      2009-09-25  586  {
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30 @587  	struct drbd_device *const device = peer_device->device;
                                                                                           ^^^^^^^^^^^^^
Unchecked dereference

44a4d551846b8c Lars Ellenberg       2013-11-22 @588  	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
                                                                                                   ^^^^^^^^^^^
This check is too late

b411b3637fa71f Philipp Reisner      2009-09-25  589  	unsigned long bit;
b411b3637fa71f Philipp Reisner      2009-09-25  590  	sector_t sector;
155bd9d1abd604 Christoph Hellwig    2020-09-25  591  	const sector_t capacity = get_capacity(device->vdisk);
1816a2b47afae8 Lars Ellenberg       2010-11-11  592  	int max_bio_size;
e65f440d474d7d Lars Ellenberg       2010-11-05  593  	int number, rollback_i, size;
506afb6248af57 Lars Ellenberg       2014-01-31  594  	int align, requeue = 0;
0f0601f4ea2f53 Lars Ellenberg       2010-08-11  595  	int i = 0;
92d94ae66aebda Philipp Reisner      2016-06-14  596  	int discard_granularity = 0;
b411b3637fa71f Philipp Reisner      2009-09-25  597  
b411b3637fa71f Philipp Reisner      2009-09-25  598  	if (unlikely(cancel))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

