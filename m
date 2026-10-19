Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9A48FF77
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397856; cv=none; b=E6roSWeHSdPFgAU+CpJI6dZ0SfQ8V56sSP2wmqLto4KLI0PAMpyvZP/Ox40DuFZeA39zQeq7+B/QGnL9yDfXCEFbCFYv/6LMErqQCrDtai5qeapBI9sDZl3wpyXgHug2mB1MqGje4ZDVAe+qgCez+Vn4b7tJRDy/j7J3c+RuXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397856; c=relaxed/simple;
	bh=Gt8N0UB2KPF1e7vkq2yrNHlZ7lN/lCheiZswsOhLaPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQKZv71cmY9UkhsvNf6JMrWHphBvlho0Pa81QmL7oi/BX53XusVSYHOSJq/fnW6CbbxbHEOBokNMOsNddgc0WpeZMyfssjdAXRO+piMsMZpNqJZjcyaxGDTJPudziJEwJgO2r3LwlaxI/x1EPQ+n/57mcPq5pGRnvm4GjrxnL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtVmbry6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtVmbry6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1054606f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397853; x=1793002653; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vo36ty9zCEoV7zWlmQRq5FLQEFjKxu8JDIOaintjvOo=;
        b=TtVmbry61PuDnvdywYyT3e7u356uUvtOzdtyTMSy9+tZSgYAbB55WuFcTcu8jVrDtJ
         Ago+RfQqXRLDWsJ66+tP5ayS1eXSJoAq0A6NKe8RHtd/CYgJ+i/EJjZLo4WkbqVTCxnO
         7RwlDrrZk1nn1zXbk0iwkmi0HUcy9insB7WGKjUgnOauAjKSwf2z77Kj3ieu4ZAN9z6c
         fmIniwg2ouWeUrK2ueG0o3HqrWNSliJpPU8MBZWbSft2B3zMjIc7DUKCI+UCxCjok60y
         6z7hONQEpdKnz4NGrcoxmBcqzqCq0PBEXN44yDBfnY0Z1lknsixjkB9wrHz0z6fAiLnr
         PDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397853; x=1793002653;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vo36ty9zCEoV7zWlmQRq5FLQEFjKxu8JDIOaintjvOo=;
        b=asTQC4HZgG2+4wL2jxOhAyi/X/VbMABqXT555rL7l2YcC947WdZm0jplAPjaLuN+tW
         or8QZ8fotB6Eh9jTfh/696Fn0ymJqUcJ/vY+sf4thGXF8W5QNVGj0bpml7XyauHw/xw8
         g5g32uAJM5ilUfilLUzhCluB2gQg/fKc7BqBpgzPNLvAcABfSIDJ0wa985iygOAqWC61
         eLO4Z6AbFhnUYuqF56i6YLviQQEh8sdRH7EG6uwTxia4CylLhSww1uGWLcSPLBb4F97u
         Z63ticSjpt+Kb21Elmow9etXQ8p+uPadEmbFgwsevHTd3ULrVq3gxihr614VH61Akylm
         IW8w==
X-Gm-Message-State: AFq9FYIs3C7nUYTlJBKGIWSKsFNAVlg7b949licrdy7p5DZFnyEF/t5M
	bkI43Crk3KxczKaWu33N3WITTRRT021HF2vs5OiN/iooydlCaUSLXgAZJhlRgOPt6tzsASw9
X-Gm-Gg: AYBFou39vQyPKfklZvylamYS1yrLErz3EZhufZTVG05mgpWSB0fOpx0zp4GVDzrOIbg
	QzFa+2P+MKMaq9lOdqm/uWBWn7Er2IsOBzg0LtoH2kN2eN1W5elWv5NSiI/ObkhiZlp2cEvo2mZ
	xUbsbBde2hQ6vAdliRnvvfBhhPNpnUgNKddduA/H3CbrWbLfYLJEAPwCA/Ufx4+VCJeGTxK3l/E
	Rru/2f8bUWyUwfivwiaQ9yzDizfqdOncOV3uyvgSPB+cvrwdpdj6cwEqWXOFCNFf70ftj6OIgNI
	ILAfbrWJyN2FDaccR7p5HrXFPwE9UaNrRm9Vk4kMo7YlNaLNxJaERgpSmBsT60oP7xIdqHDaSxr
	fyosMHV2aDGBvO0qKkgJ4G1Kn1AR9TyIMfeAgDVP6SrXjYrOnu07kP9/UR5LzG780w4QLFrWyE4
	jJPwTbtuOFn2q7seoTfDxbWsbq64t7BwwbTG2inz8qZpLrLq5r+KRNCBbJe47VCUdWZMU=
X-Received: by 2002:a05:6000:26ca:b0:48a:f318:ac03 with SMTP id ffacd0b85a97d-48e07f98fa0mr13856654f8f.25.1792397852653;
        Mon, 19 Oct 2026 01:17:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm18529901f8f.7.2026.10.19.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:17:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:17:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-7.4 37/72] sound/soc/soc-dapm.c:2893
 snd_soc_dapm_free_widget() warn: variable dereferenced before check
 'w->dapm' (see line 2891)
Message-ID: <atXSGFnmTZ77bCRS@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Sorry for sending this without a subject...  :(

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
head:   ba982c33278c1fc739c8c220f410d6539de9d9b9
commit: 568406bc832e7e9e333e2ab05aafd0b83ffb9610 [37/72] ASoC: soc-dapm: Remove widget from cache on removal
config: nios2-randconfig-r2202-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180339.A6POXeNa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610180339.A6POXeNa-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2893 snd_soc_dapm_free_widget() warn: variable dereferenced before check 'w->dapm' (see line 2891)

vim +2893 sound/soc/soc-dapm.c

b97e26980f6c13 Lars-Peter Clausen   2015-07-21  2870  void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
2b97eabc09f42d Richard Purdie       2006-10-06  2871  {
568406bc832e7e Amadeusz Sławiński   2026-10-14  2872  	struct snd_soc_dapm_context *d;
2b97eabc09f42d Richard Purdie       2006-10-06  2873  	struct snd_soc_dapm_path *p, *next_p;
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2874  	enum snd_soc_dapm_direction dir;
2b97eabc09f42d Richard Purdie       2006-10-06  2875  
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2876  	if (!w)
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2877  		return;
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2878  
2b97eabc09f42d Richard Purdie       2006-10-06  2879  	list_del(&w->list);
5c6679b5cb120f Thomas Hebb          2020-12-12  2880  	list_del(&w->dirty);
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2881  	/*
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2882  	 * remove source and sink paths associated to this widget.
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2883  	 * While removing the path, remove reference to it from both
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2884  	 * source and sink widgets so that path is removed only once.
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2885  	 */
af6d53db28e644 Kuninori Morimoto    2026-01-20  2886  	dapm_for_each_direction(dir) {
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2887  		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
8872293fc38c49 Lars-Peter Clausen   2013-06-14  2888  			dapm_free_path(p);
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2889  	}
8872293fc38c49 Lars-Peter Clausen   2013-06-14  2890  
8ad13cdc92f663 Trevor Wu            2023-05-26 @2891  	dapm_debugfs_free_widget(w);
                                                                                 ^
This dereferences "w->dapm"

8ad13cdc92f663 Trevor Wu            2023-05-26  2892  
568406bc832e7e Amadeusz Sławiński   2026-10-14 @2893  	if (w->dapm) {
                                                            ^^^^^^^
So this check is too late.

568406bc832e7e Amadeusz Sławiński   2026-10-14  2894  		if (w->dapm->card) {
568406bc832e7e Amadeusz Sławiński   2026-10-14  2895  			for_each_card_dapms(w->dapm->card, d) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

