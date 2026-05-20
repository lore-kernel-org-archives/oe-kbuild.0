Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253603D9029
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277847; cv=none; b=loy//MsOcKtAoGi9pYVZ1K/upHUaLccCRJZexIqb+GntAfuXUsuSzTYHv5Ud1+/3c0azMaoWzsyaSBGAYZe2RIufRUmk0ByrWBREJdj2jhQwx+5FxK48q9Xk6zJV7AMdb+/qN19+Qx20OfSmjS8N52LWG9Bj72a2mbt5WpH6/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277847; c=relaxed/simple;
	bh=6l81oLk4syNZNuz76B+hNI8jiONBNIptDHBsrfSpoZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gLWw5pxeapkYyTK2MvC+qg/0LUusCqiqNUnz9d1YXlNod90lsxArqIIP0H66jgcszCEWieTFj8bWcMO84zUwRRwcFTVbJbm8KevoS3c4pwi2OjrIJDm4yXJ8tukoJXlu77aDMt+FHe2t2UqMWYhNGiPW9kyanGeu+X9aztScn1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGDoWSrG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGDoWSrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779277843; x=1810813843;
  h=date:from:to:cc:subject:message-id;
  bh=6l81oLk4syNZNuz76B+hNI8jiONBNIptDHBsrfSpoZ4=;
  b=mGDoWSrGh5FTZtQCYkJDgLCyVdshf9/pqR6rt8Z0wPuUSQB4xlWlghEQ
   C5V22u2T8x+llogpPb1FOm7xUcoq+03sdy+fY4RvmhdxF/mV5519T5YT1
   1qJlI2a663ZWZkGuNRR1VAGTVDXOVN1iNlisOz2oCSLxzan11ROK3tNoH
   E/C44BpzWX7cNA1Ovw/gBtUZX0rXO76tJXEOnpfbcXFx3KfMvPQa4TL47
   lRyrwRymjQqiwtgxHhqR41s/7BcMsqQbPCoTsTIV/TBl7WjDEZna+MWDd
   pJWCyA8p8z0Pr1aMDtwpjZAKxYcu2TPuKBjL0D/SQ+Syyusj8Nsuy8TgJ
   A==;
X-CSE-ConnectionGUID: kHUTxTfDRUKq/Fy6Qe/+rA==
X-CSE-MsgGUID: TtxR6zq3Tx6dAj5F4WVJVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80290827"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80290827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:50:41 -0700
X-CSE-ConnectionGUID: ft4jszZjQnKdMKjdSthFTQ==
X-CSE-MsgGUID: sX+jaRupQZ6dJufIC+Bwrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235721347"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2026 04:50:40 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPfR6-0000000036j-48IG;
	Wed, 20 May 2026 11:50:23 +0000
Date: Wed, 20 May 2026 19:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-sound:for-next 20/24]
 sound/soc/codecs/cs35l56-shared-test.c:681
 cs35l56_shared_test_case_base_init() warn: variable dereferenced before check
 'regmap_config' (see line 665)
Message-ID: <202605201958.A1xdeuzB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   4ad5b674ca5f0f0bb7db547acc2491fadcf8c51a
commit: a6f7c21accb5fca895ee0d490e395deecaddf12f [20/24] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
:::::: branch date: 19 hours ago
:::::: commit date: 22 hours ago
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

9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  650  
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
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  682  		ret = cs35l56_shared_test_case_regmap_init(test, regmap_config);
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  683  		if (ret)
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  684  			return ret;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  685  	}
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  686  
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  687  	return 0;
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  688  }
9bca0f05cea49ad1 Richard Fitzgerald 2026-02-05  689  

:::::: The code at line 681 was first introduced by commit
:::::: 9bca0f05cea49ad11b464672ccdf6efd6a814a45 ASoC: cs35l56-shared: KUnit tests for onchip speaker ID gpios

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
