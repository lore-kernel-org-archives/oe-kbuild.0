Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672568;
	b=lynLwjsGVnQNAZDa0A11ghRmJzX2JkdFCU0B++UfMNvErm176Jy/Id/vX4fgfUyGSnNP
	 hgyh0gbZBI691/gbxAQu1err7hwMgjuXutMHBi8AVPWNnFAhTVoEf0Zgu7TFqaZy7KBBr
	 Acth5oHFQ/y2gTwkVAg96iz0gZgVhE6eBdA6oC10QKSNmkB57c3ZlytNE/HASEKEV0sW1
	 gWhBL4V9+g8H57jNVBC2e3NU0qFh5ayRQuRvpdQ0ZAedyl+TyFetYFiO3h7WFDY6krqM+
	 q0IGkmIHXzyghimMZfQj9r2YoXUQgnPr5Ly5tnwv3qwz2jNWua9f9BavIHHkm2yrl9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=U2gCIt6Zdi/HC7EkK4V9lC6vrubY+ioEkE70QG4s7EI=;
	b=LxRWQ+noAlua7K4LTihTdAL3iM4Vgr18tR4wZkoHljvl6yF1mqftCs28ofg52aoxOLb9
	 n8Bk7RzgyNeZSVVM06GU7Cwk2s3PxcPefB1drcI3a39FliX0JmhLjN0s59xWsw++LzKGK
	 iIArGVP4xJNYGwMJsA+Rx8q22Y8hz1vYT6DygXisNjhjEnAhblNjL4Yc3A37Yt3xnAuh8
	 BIBSyIYwTTIqrgN1f8mljXi5M0ixEsyNkbhNQDVLsTzehYzcA4R2crgL3yMTl8t2PQM1s
	 CHNnC+T8FnJlQ5ZGB0s/4hRDDJn15BNg/vO1wyO+foq6IThjevcxCpRa7upsN8zjAng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqPUITBa;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62095606A31E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 05:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62095606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqPUITBa
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so65932595e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 21:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672567; x=1796277367; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2gCIt6Zdi/HC7EkK4V9lC6vrubY+ioEkE70QG4s7EI=;
        b=JqPUITBaTGTp/E7COOQW96h5pOg7P+BuDpWMLkrLO5Wr+s8s5NBs6nZhSi1vIP9lvk
         Z28tYxEjgePYbJvWaWTfef+WdO+8RETkAcZtLQLrlO7a1DnFAiBWOyPDEEIh1VSxByhp
         kjEeB2Za85jdPejdNiHQh1qJ/JzLmEQxzcAwvgxgwT6CfVRPdPmuUjfoC0ErLAy1ckeK
         4LLIb0p2mWCttKQUKwArgaMmuXtvYo36yuNUmt5R/LfzNukQzYzl17+MUdIEQCPLv14X
         SFUr/1WF7soKYbJ40ZLIphZ1G6DBHzgi0A4n7R9eYj9+nve4mrlcultOndU9n7LV+Yz+
         axFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672567; x=1796277367;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2gCIt6Zdi/HC7EkK4V9lC6vrubY+ioEkE70QG4s7EI=;
        b=fmSHnTjE8R05ikS2oshSyvBX1rJuTfRsIJr8xg/czz8ks04J66qIusHyut1IQ/laF/
         TAHLkGZKbgRHbk79+w1NAiFQBsNcuNhu3I5VuEc/nQKq5cUih0XnxaYgxJSbl9fJB9V2
         SNygT3XTq3pTkEZZZJfdA+Q+hxIbuhTTQc5qLoun8rrkRWqYqXyMSHrlE33MAMNeM/Ys
         zOYRMXY0YJBr0OXzGdGkfgO+2OkzeJM21zvXsuNMOreRF0UXMH1bWurSI0LXQBI306hU
         emOGFBRfknbqen4hZyeTQ4GNpVzD/9llfYYlXXVaI0CDmEQaMtW6ujMt3lexYBK8n+Ef
         2KUg==
X-Gm-Message-State: APuU4Z9hT7IKaL077AC6E/isOc8+nvbslQGKftWZnizXK3n2L0/vZjjZ
	LntxkGYksyKF6N3SnGt18aT1bXRJ3XO4Etjz2ylPtYZU8YBbYuHGzBPqltuT7SYbDCLdLg==
X-Gm-Gg: AZFdTZcDTAwBTk+HcGzrYzDoimAsb3i2TguLjqkuRc5wsYfl1LcGK4GlDxz8Ze0ZxiA
	KWU1FunXpGmwMg7X3Qg+HLDKHhl2EXMwqUXZ7J8eYqNZf45xZJEIo2RuhabFqlluVaTHWzpiI0N
	6zULA48m7G2JopjEj5u2VPi17HvDW+fDygqMy3W8j7DlA+LxilCm03DivfA7gIG+ryztsFe+dAk
	VH+WKetwV5g8pm9SvtvnUBK8fEj8+IvWuA9viRxzea80R7G3C9bCUfxmbmvx4FSrcBh9rN14ri/
	HREqFNtPNlf9CIpkiWWU2dVvILIcwtC8WLc3IN1HEUXUzFMTO0+IPqTrKTlMDvzH+oQu0yV1plJ
	K8t4w1oOoysUPci+RGoDgNQmhxDHnMBreMPt2KqH+cBjaNNXE2WT6J3ICVKwYIIKkG7H5j4+fWE
	iuS3cpJh0f37bNZ8qYNCYUynJ2fowQvArJKAqwil5hKyHbtrOeqdGnrfp98gMYofVhzpTqvL6Ri
	dTEzwIvHNde0XEN8Y8Y2D02N/0s/aXnMiOOk/4EglacIDTZtvBnYKKsln6jvcepkJbuFv4LeYUo
	ycKnC/mo7x6vtNhV00xPjr8fYF9Ee/po8oxTIfGW333lC7FTFXg8n06geAb7usSWUbzvHzo6xat
	cYFKd4SNiqAGZm9fWoCjDMUo2lS5tIQCqAJsTvTolEFap2b95o/BT6nSn9DaMUtqTyc0=
X-Received: by 2002:a05:600c:8906:b0:4bb:a60e:a316 with SMTP id 5b1f17b1804b1-4bba60ea355mr62162175e9.12.1795672566416;
        Wed, 25 Nov 2026 21:56:06 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm565134715e9.5.2026.11.25.21.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:56:05 -0800 (PST)
Date: Thu, 26 Nov 2026 08:56:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yaohan Li <shunsheng1218@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines:
 444.
Message-ID: <20261125184601.R647t8Sj-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261126055601.ucXZLn75UiOinpz81KZyir3yGw6UBfl7LySfml7itPE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5
head:   d23ba232a8fefe909aeb9366e3905a95a429ebfc
commit: d23ba232a8fefe909aeb9366e3905a95a429ebfc [6/6] regulator: qcom-labibb: stop the recovery workers on teardown
config: openrisc-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125184601.R647t8Sj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261125184601.R647t8Sj-lkp@intel.com/

smatch warnings:
drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq() warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.

vim +444 drivers/regulator/qcom-labibb-regulator.c

d23ba232a8fefe9 Yaohan Li 2026-11-18  393  static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
d23ba232a8fefe9 Yaohan Li 2026-11-18  394  {
d23ba232a8fefe9 Yaohan Li 2026-11-18  395  	u32 irq_flags = IRQF_ONESHOT;
d23ba232a8fefe9 Yaohan Li 2026-11-18  396  	int ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  397  
d23ba232a8fefe9 Yaohan Li 2026-11-18  398  	lockdep_assert_held(&vreg->ocp_lock);
d23ba232a8fefe9 Yaohan Li 2026-11-18  399  
d23ba232a8fefe9 Yaohan Li 2026-11-18  400  	if (vreg->shutting_down)
d23ba232a8fefe9 Yaohan Li 2026-11-18  401  		return -ESHUTDOWN;
d23ba232a8fefe9 Yaohan Li 2026-11-18  402  
d23ba232a8fefe9 Yaohan Li 2026-11-18  403  	if (!vreg->ocp_requested)
d23ba232a8fefe9 Yaohan Li 2026-11-18  404  		return 0;
d23ba232a8fefe9 Yaohan Li 2026-11-18  405  
d23ba232a8fefe9 Yaohan Li 2026-11-18  406  	if (!vreg->ocp_irq_done) {
d23ba232a8fefe9 Yaohan Li 2026-11-18  407  		/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
d23ba232a8fefe9 Yaohan Li 2026-11-18  408  		switch (vreg->type) {
d23ba232a8fefe9 Yaohan Li 2026-11-18  409  		case QCOM_LAB_TYPE:
d23ba232a8fefe9 Yaohan Li 2026-11-18  410  			irq_flags |= IRQF_TRIGGER_LOW;
d23ba232a8fefe9 Yaohan Li 2026-11-18  411  			break;
d23ba232a8fefe9 Yaohan Li 2026-11-18  412  		case QCOM_IBB_TYPE:
d23ba232a8fefe9 Yaohan Li 2026-11-18  413  			irq_flags |= IRQF_TRIGGER_HIGH;
d23ba232a8fefe9 Yaohan Li 2026-11-18  414  			break;
d23ba232a8fefe9 Yaohan Li 2026-11-18  415  		default:
d23ba232a8fefe9 Yaohan Li 2026-11-18  416  			return -EINVAL;
d23ba232a8fefe9 Yaohan Li 2026-11-18  417  		}
d23ba232a8fefe9 Yaohan Li 2026-11-18  418  
d23ba232a8fefe9 Yaohan Li 2026-11-18  419  		/*
d23ba232a8fefe9 Yaohan Li 2026-11-18  420  		 * The interrupt is owned and released by the cleanup
d23ba232a8fefe9 Yaohan Li 2026-11-18  421  		 * action, so its name has to outlive the interrupt:
d23ba232a8fefe9 Yaohan Li 2026-11-18  422  		 * devres would release a name allocated here before the
d23ba232a8fefe9 Yaohan Li 2026-11-18  423  		 * action runs, while vreg->desc.name is owned by the
d23ba232a8fefe9 Yaohan Li 2026-11-18  424  		 * driver data.
d23ba232a8fefe9 Yaohan Li 2026-11-18  425  		 */
d23ba232a8fefe9 Yaohan Li 2026-11-18  426  		ret = request_threaded_irq(vreg->ocp_irq, NULL,
d23ba232a8fefe9 Yaohan Li 2026-11-18  427  					   qcom_labibb_ocp_isr, irq_flags,
d23ba232a8fefe9 Yaohan Li 2026-11-18  428  					   vreg->desc.name, vreg);
d23ba232a8fefe9 Yaohan Li 2026-11-18  429  		if (ret)
d23ba232a8fefe9 Yaohan Li 2026-11-18  430  			return ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  431  
d23ba232a8fefe9 Yaohan Li 2026-11-18  432  		vreg->ocp_irq_done = true;
d23ba232a8fefe9 Yaohan Li 2026-11-18  433  	}
d23ba232a8fefe9 Yaohan Li 2026-11-18  434  
d23ba232a8fefe9 Yaohan Li 2026-11-18  435  	/*
d23ba232a8fefe9 Yaohan Li 2026-11-18  436  	 * Enable the hardware source only once a handler exists, and turn
d23ba232a8fefe9 Yaohan Li 2026-11-18  437  	 * it back off if that failed, so that a later attempt can retry
d23ba232a8fefe9 Yaohan Li 2026-11-18  438  	 * without leaving the source enabled on its own.
d23ba232a8fefe9 Yaohan Li 2026-11-18  439  	 */
d23ba232a8fefe9 Yaohan Li 2026-11-18  440  	ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
d23ba232a8fefe9 Yaohan Li 2026-11-18  441  	if (ret)
d23ba232a8fefe9 Yaohan Li 2026-11-18  442  		qcom_labibb_ocp_hw_disable(vreg->rdev);

Ideally qcom_labibb_ocp_hw_enable() would clean up after its ownself on
failure...

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

Also request_threaded_irq() needs cleanup.

d23ba232a8fefe9 Yaohan Li 2026-11-18  443  
d23ba232a8fefe9 Yaohan Li 2026-11-18 @444  	return ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  445  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

