Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED03DA7F7
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278398; cv=none; b=pFgSK7B3ZRsg9L+zsxCcYZ4M0onnqMupKmSsMqEIVzK+W0YxAc7fDeJDA/nrzX9cZ64R91QVUYQO2gLIDCyUkesz4m8kPkbTo/AHS1GC/0npyqS0wAfNTS5aYnb+Rq7c/kHpMfyLlXw5nvzuwDbGa/G54CWZbFqAYWlRnqQKIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278398; c=relaxed/simple;
	bh=D4OPKXNCI2mRzG0TnZ+CzdX2qzo0B7kxu4wIErrqL68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gW5HQbDw/nRKHheU3bqN69nQtnYkT8bik+Dh+2Of3fBWqlD/cB+GJ5C7R7AFBCdtokNtOZYT6k9A4UXO+1VLnKTaZb3yGlnrt+2NCYuErqynDtSwiE4obs2UpL3yBnh1Wi+05DFIlK/bbHzVVdimRVaieAaObBQsDtkqaNk74fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou04HTEn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou04HTEn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d73422431so3299281f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779278395; x=1779883195; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvywlcvTDBPY9Q8O/25hv62l6tvsLb0vc03TW80ZQ/M=;
        b=Ou04HTEnF73qPrRvBzIgq6ge9GEpf4yDnougezozOyhkhFI76oc3ApmE/3oKMSGchI
         fp9Ls40IJYoPy4PMPNSUpvTr0ArJU85sFZ+wWT+8Cq3jt7GiEu7Ir3O6s0INaXejInGe
         1So5h6EvfLwkOOI/XoB5fvi7q+HvMgUwZR+0BqwoNEXReLJ8ViKT53gPwYmAPEHXBvrj
         MNwvURq84uX51V8E428IT5JefJHCkJjV8/vXrTK6FCUKV2eY3euWDQMW5Q4McHNPLvcB
         Dkay/EBVzThgpYuGEncQ7NxiYswXrxePa5VkqEw/xw86WU4U9B1EC4f+MFYnVgdYdSQD
         GI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278395; x=1779883195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvywlcvTDBPY9Q8O/25hv62l6tvsLb0vc03TW80ZQ/M=;
        b=HSYaXeaDMlizRjURDO5UiGcBlDP/cKhGuLBWlBjUBF8lTmiOwNx7UvTZFhB51vIcvw
         360MDtKbuUgKBizVu174+/Rrfl4D319Q56T+iz77A1HU3otkP71tiJpMFKvjDk8qBKfX
         Rl00Hckt1tng4XI5UnoghVTFuWsuAUULsVJRsCBOEL1j14QkAKUZKhrtECrJJ63NCcRU
         kGaAaxcpKynrjJU9FqLOf32+HZqG0DUIf3h9ywMPkmh9+kRWup76qwOYL8wKR+vOWleF
         BDBfWFSye4DeNiovKooTPK77duEb2mk/B8VZGFNLWFfeGspq25RRUffmklOsuHmEwtlq
         /u5Q==
X-Gm-Message-State: AOJu0Yx3wEUa7nqCbUnHgsW2oZMvgA3nqv8STlzJDivcUwpIAkMeCDqO
	mFJ+znCDOe8X6VugCohtCHe3YFMU4LHvF4kuKkxvel0nWPVyk1MN9WHDUMe6oA==
X-Gm-Gg: Acq92OEsqzNuTOEvgVtYMMPEQWA7YCwpLRa1WCI4OvZgBnAyPEGqXyNCxLgcnwtD2Dj
	wW2yNVVJG4T6CVIJjT7rA8V5WoICrwPWSU+aFOD6HHG7lY3VrG6VC/hkYDaxEXX4oUfmP1MjbZK
	ErGBVvOwvQ0eh7x1X0MIZSL74w8XXsh+QD5lUUx4k83mVE5hI3RppolGc+lR6MU05YQuCIQ9Cpq
	Vo/tH0e43V0giMv5UifgL9rR/rfShLKgW41Rr+qIxZKqhHMqFTN3/jROxOXCNBbrhjvtSQ29wje
	LM24nMFjYyiEoi1xBQ33ycVf31rnuZZTBMPIr/qea72lNZCy0DMI99xsYUrUeDjGG+gZFuY1g+Z
	Blw4Jd5AoXzKqJWU9Iat2zz0PiZU+pgFZ1PR2Qygvv0ovf+Or26kMhOZDQLp6xmyFes/8bpLO6R
	2VwQ78G9ywTeNozcyiCWzS1ar9qgj0K3NhOQ==
X-Received: by 2002:a05:6000:22c5:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-45e5c60a30cmr39828626f8f.36.1779278394553;
        Wed, 20 May 2026 04:59:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm58034649f8f.10.2026.05.20.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:59:53 -0700 (PDT)
Date: Wed, 20 May 2026 14:59:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 20/24]
 sound/soc/codecs/cs35l56-shared-test.c:681
 cs35l56_shared_test_case_base_init() warn: variable dereferenced before
 check 'regmap_config' (see line 665)
Message-ID: <202605201958.A1xdeuzB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260520115950.f9Y1cpiMHtG7p530Rf4m4GnTkYqD3YqFtoTl-0vgKCQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   4ad5b674ca5f0f0bb7db547acc2491fadcf8c51a
commit: a6f7c21accb5fca895ee0d490e395deecaddf12f [20/24] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
config: microblaze-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201958.A1xdeuzB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605201958.A1xdeuzB-lkp@intel.com/

smatch warnings:
sound/soc/codecs/cs35l56-shared-test.c:681 cs35l56_shared_test_case_base_init() warn: variable dereferenced before check 'regmap_config' (see line 665)

vim +/regmap_config +681 sound/soc/codecs/cs35l56-shared-test.c

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  651  static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 rev,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  652  					      const struct regmap_config *regmap_config)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  653  {
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  654  	struct cs35l56_shared_test_priv *priv;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  655  	int ret;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  656  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  657  	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  658  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  659  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  660  	if (!priv)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  661  		return -ENOMEM;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  662  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  663  	test->priv = priv;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  664  	priv->test = test;
a6f7c21accb5fca8 Richard Fitzgerald 2026-05-19 @665  	priv->reg_offset = regmap_config->reg_base;
                                                                           ^^^^^^^^^^^^^^^^^^^^^^^
regmap_config is dereference here without checking.

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  666  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  667  	/* Create dummy amp driver dev */
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  668  	priv->amp_dev = faux_device_create("cs35l56_shared_test_drv", NULL, NULL);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  669  	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  670  	KUNIT_ASSERT_EQ(test, 0,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  671  			kunit_add_action_or_reset(test,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  672  						  faux_device_destroy_wrapper,
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  673  						  priv->amp_dev));
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  674  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  675  	priv->cs35l56_base = kunit_kzalloc(test, sizeof(*priv->cs35l56_base), GFP_KERNEL);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  676  	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_base);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  677  	priv->cs35l56_base->dev = &priv->amp_dev->dev;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  678  	priv->cs35l56_base->type = type;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  679  	priv->cs35l56_base->rev = rev;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  680  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05 @681  	if (regmap_config) {
                                                            ^^^^^^^^^^^^^
The old code assumed it could be NULL but probably it can't actually be
NULL?

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  682  		ret = cs35l56_shared_test_case_regmap_init(test, regmap_config);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  683  		if (ret)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  684  			return ret;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  685  	}
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  686  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  687  	return 0;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  688  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

