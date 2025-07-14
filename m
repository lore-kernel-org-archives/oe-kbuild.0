Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17261D9A70
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527755; cv=none; b=PjnEv88pAxy4ynw6AUUCHk4t53hHxDbAzohvTyJFjaGlantvREP4Y3tg5eqABBJ7Hh+bN2fiZLVrjR6sDovqYl/i/ejPAb1S1IBWiCNvIuMglIuPdLdjiCuv2mkrOHGR+5FHlir/uxZK6cX2ACEVzCgZxQH87PrANLLbr2a9dYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527755; c=relaxed/simple;
	bh=R9p7UV54O+YxuDqFB4foeUJ1VoBveKklzCE3WyracXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7ByGWvhWZGXdJ1A8JqKNogXwaxPVgu2UUwyOG8nBG/2ZNKunDq6ST9x3LgL9kORTm1COjhny8uPji8ie96HBQ2oJsFloCbDedH/1xR3iltjmDInGgbt0DEW0iD9amZ96BchZokFAQgSbw7nO2NXvmGTNNJPywCeDC0WgRCnjPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqActMjC; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqActMjC"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-40a4bf1eb0dso2187438b6e.3
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 14:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752527752; x=1753132552; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/nmQOAJsGsmgSqDUNufXUQtWakea13dbkLKk0nG1Kg=;
        b=QqActMjCvdgAQWZkd3rKp6eOE3pqyJwWinGrHemi8tMYwKy3/GPzRf/jqoTz05/3Mm
         aUO03VxiPcX0G6kHg4IrK9hpQn78XSqPpo9d7OOIxWH+QdI8gLVAjbdCRzUTbB0Tqc4L
         He10E5+9Zmx3k0s5/rZqOVMbwtBO2yoBqhdXtBSK0hKgHeHiNzuXKckaC3E7yBbRe+zA
         paNeTUV74AOcfQrtBizXAiZ3r75fR09+oRMKZCklaSZmXNzGLJTa85O8/rjASFVgWGwZ
         vEKjoehPqznc9dTAMeb1QyfHWi/zM0hE0qH2nnGC0iX73EINUk30DrGv9QRVweeoKoXg
         dJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752527752; x=1753132552;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/nmQOAJsGsmgSqDUNufXUQtWakea13dbkLKk0nG1Kg=;
        b=B9QZ/W+wk9uIeALU+WJn3TrX9d7Ygt/3Fc3RzyGJ0spzZjApfzQ6ZHK9vo7VsJ7/Bd
         TzO8RZqRuCNE5XZpZrmqEZmJ6tBnMrtEjm0AgbkMcq2C0WVNkxoTQzAhOReHF3eo67Ph
         BtYdOQKi8QuSJDeV6aArsf/bhOnZ21TXfZA/H3RXpE3r3rfWDy9O1G0nkskQIzIzf3q+
         jymZNe3FTv37iMZbq/ADo/3s3EuaMyKPT04KU9WdSMBkWN2+SW3PMETcOVKLjxlPItf3
         Kjzgd58BOOK8mUnW5jgq41v/3qRRWInBQI2vzGbFhkN3v4L+3AzVzscf93cy1gw4+1yV
         vswA==
X-Gm-Message-State: AOJu0Yyoo/SGvX35r9ioWzKINWsWNwc2fzxJUo+az7E3amN9/He8XdWC
	l2NecnLH8F0mvodYWrUXqjgauKPw9JlsZ8nnX2rHWuO+YArza1zi8/Hh1gY6YAdnEEl8g5vvC6H
	wJgmk
X-Gm-Gg: ASbGncsHk5tGgosfTcnljL8KmbcbqgnE1gnTY2qyvyPaBdZnTULoW4TG6Q6Zby7pCuq
	Cufjcp8+r57DfJ0sKBiTvCmQdJM7LWBXz7yGG5Q2Eh9pmlR2N2hF2l/Ru/q/so4JoLxXE7f5MCj
	vhpDXzBhtEhfpl33Pot8dsfQt+Nf6czN1UTsKxCFvBVusg/mJagcmvOHWI0VTeqIZRushbKGAZ/
	00nL53fA/kVewIKzYa95hFs6ZW4NG2/zNk9IlfCOlF6kAS0/3+Qz0IWVSFX86vTi8a6fMJ7h8Zi
	FIhhTkQr7QIUWwaF7HZO4bbX0TWtkowV3Y8jWvDayuBMHoPZWadIj92d0I18ems9re6sokc3QGC
	DrbCcJl9rx+0NoII0HKteb1JGDor4lA==
X-Google-Smtp-Source: AGHT+IG6ZqKKW6X2cjYwVUocRluB9GL2PUhiSHkNNDoLEWvTb/N2hJ64XycDmKqkYQ2LQqZ6pvxt9g==
X-Received: by 2002:a05:6808:1183:b0:40a:5839:71c5 with SMTP id 5614622812f47-41537566f52mr9653313b6e.8.1752527752279;
        Mon, 14 Jul 2025 14:15:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141c58febcsm1629365b6e.41.2025.07.14.14.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:15:51 -0700 (PDT)
Date: Tue, 15 Jul 2025 00:15:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [broonie-ci:v2_20250711_ckeepax_update_sdca_kconfig 12/13]
 sound/soc/sdca/sdca_interrupts.c:278 sdca_irq_request() error: buffer
 overflow 'info->irqs' 31 <= 31
Message-ID: <a96e0a94-a71c-4067-a264-9c98ecf1c9e8@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250711_ckeepax_update_sdca_kconfig
head:   5030abcb0aa3304bf91497844ffa9607a2d4ad5d
commit: 6894e49b7b62cdb0edbcaaa23ea0218edb3b02dd [12/13] ASoC: SDCA: Kconfig/Makefile fixups
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150415.M1tCgi3p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507150415.M1tCgi3p-lkp@intel.com/

smatch warnings:
sound/soc/sdca/sdca_interrupts.c:278 sdca_irq_request() error: buffer overflow 'info->irqs' 31 <= 31
sound/soc/sdca/sdca_interrupts.c:387 sdca_irq_populate() error: uninitialized symbol 'name'.

vim +278 sound/soc/sdca/sdca_interrupts.c

b126394d9ec6f9 Maciej Strozek 2025-06-24  259  int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
b126394d9ec6f9 Maciej Strozek 2025-06-24  260  		     int sdca_irq, const char *name, irq_handler_t handler,
b126394d9ec6f9 Maciej Strozek 2025-06-24  261  		     void *data)
b126394d9ec6f9 Maciej Strozek 2025-06-24  262  {
b126394d9ec6f9 Maciej Strozek 2025-06-24  263  	int ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  264  
b126394d9ec6f9 Maciej Strozek 2025-06-24  265  	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {

Off by one.  > vs >=.

b126394d9ec6f9 Maciej Strozek 2025-06-24  266  		dev_err(dev, "bad irq request: %d\n", sdca_irq);
b126394d9ec6f9 Maciej Strozek 2025-06-24  267  		return -EINVAL;
b126394d9ec6f9 Maciej Strozek 2025-06-24  268  	}
b126394d9ec6f9 Maciej Strozek 2025-06-24  269  
b126394d9ec6f9 Maciej Strozek 2025-06-24  270  	guard(mutex)(&info->irq_lock);
b126394d9ec6f9 Maciej Strozek 2025-06-24  271  
b126394d9ec6f9 Maciej Strozek 2025-06-24  272  	ret = sdca_irq_request_locked(dev, info, sdca_irq, name, handler, data);
b126394d9ec6f9 Maciej Strozek 2025-06-24  273  	if (ret) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  274  		dev_err(dev, "failed to request irq %s: %d\n", name, ret);
b126394d9ec6f9 Maciej Strozek 2025-06-24  275  		return ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  276  	}
b126394d9ec6f9 Maciej Strozek 2025-06-24  277  
b126394d9ec6f9 Maciej Strozek 2025-06-24 @278  	info->irqs[sdca_irq].externally_requested = true;
                                                ^^^^^^^^^^^^^^^^^^^^


b126394d9ec6f9 Maciej Strozek 2025-06-24  279  
b126394d9ec6f9 Maciej Strozek 2025-06-24  280  	return 0;
b126394d9ec6f9 Maciej Strozek 2025-06-24  281  }

[ snip ]

b126394d9ec6f9 Maciej Strozek 2025-06-24  328  int sdca_irq_populate(struct sdca_function_data *function,
b126394d9ec6f9 Maciej Strozek 2025-06-24  329  		      struct snd_soc_component *component,
b126394d9ec6f9 Maciej Strozek 2025-06-24  330  		      struct sdca_interrupt_info *info)
b126394d9ec6f9 Maciej Strozek 2025-06-24  331  {
b126394d9ec6f9 Maciej Strozek 2025-06-24  332  	struct device *dev = component->dev;
b126394d9ec6f9 Maciej Strozek 2025-06-24  333  	int i, j;
b126394d9ec6f9 Maciej Strozek 2025-06-24  334  
b126394d9ec6f9 Maciej Strozek 2025-06-24  335  	guard(mutex)(&info->irq_lock);
b126394d9ec6f9 Maciej Strozek 2025-06-24  336  
b126394d9ec6f9 Maciej Strozek 2025-06-24  337  	for (i = 0; i < function->num_entities; i++) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  338  		struct sdca_entity *entity = &function->entities[i];
b126394d9ec6f9 Maciej Strozek 2025-06-24  339  
b126394d9ec6f9 Maciej Strozek 2025-06-24  340  		for (j = 0; j < entity->num_controls; j++) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  341  			struct sdca_control *control = &entity->controls[j];
b126394d9ec6f9 Maciej Strozek 2025-06-24  342  			int irq = control->interrupt_position;
b126394d9ec6f9 Maciej Strozek 2025-06-24  343  			struct sdca_interrupt *interrupt;
b9ab3b61824190 Charles Keepax 2025-06-24  344  			irq_handler_t handler;
b126394d9ec6f9 Maciej Strozek 2025-06-24  345  			const char *name;
b126394d9ec6f9 Maciej Strozek 2025-06-24  346  			int ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  347  
b126394d9ec6f9 Maciej Strozek 2025-06-24  348  			if (irq == SDCA_NO_INTERRUPT) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  349  				continue;
b126394d9ec6f9 Maciej Strozek 2025-06-24  350  			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  351  				dev_err(dev, "bad irq position: %d\n", irq);
b126394d9ec6f9 Maciej Strozek 2025-06-24  352  				return -EINVAL;
b126394d9ec6f9 Maciej Strozek 2025-06-24  353  			}
b126394d9ec6f9 Maciej Strozek 2025-06-24  354  
b126394d9ec6f9 Maciej Strozek 2025-06-24  355  			interrupt = &info->irqs[irq];
b126394d9ec6f9 Maciej Strozek 2025-06-24  356  
b126394d9ec6f9 Maciej Strozek 2025-06-24  357  			if (interrupt->externally_requested) {
b126394d9ec6f9 Maciej Strozek 2025-06-24  358  				dev_dbg(dev,
b126394d9ec6f9 Maciej Strozek 2025-06-24  359  					"skipping irq %d, externally requested\n",
b126394d9ec6f9 Maciej Strozek 2025-06-24  360  					irq);
b126394d9ec6f9 Maciej Strozek 2025-06-24  361  				continue;
b126394d9ec6f9 Maciej Strozek 2025-06-24  362  			}
b126394d9ec6f9 Maciej Strozek 2025-06-24  363  
b126394d9ec6f9 Maciej Strozek 2025-06-24  364  			ret = sdca_irq_data_populate(component, function, entity,
b126394d9ec6f9 Maciej Strozek 2025-06-24  365  						     control, interrupt);
b126394d9ec6f9 Maciej Strozek 2025-06-24  366  			if (ret)
b126394d9ec6f9 Maciej Strozek 2025-06-24  367  				return ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  368  
b9ab3b61824190 Charles Keepax 2025-06-24  369  			handler = base_handler;
b9ab3b61824190 Charles Keepax 2025-06-24  370  
b9ab3b61824190 Charles Keepax 2025-06-24  371  			switch (entity->type) {
b9ab3b61824190 Charles Keepax 2025-06-24  372  			case SDCA_ENTITY_TYPE_ENTITY_0:
b9ab3b61824190 Charles Keepax 2025-06-24  373  				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
b9ab3b61824190 Charles Keepax 2025-06-24  374  					handler = function_status_handler;
b9ab3b61824190 Charles Keepax 2025-06-24  375  				break;
b9ab3b61824190 Charles Keepax 2025-06-24  376  			case SDCA_ENTITY_TYPE_GE:
b9ab3b61824190 Charles Keepax 2025-06-24  377  				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
b9ab3b61824190 Charles Keepax 2025-06-24  378  					handler = detected_mode_handler;
b9ab3b61824190 Charles Keepax 2025-06-24  379  				break;
b9ab3b61824190 Charles Keepax 2025-06-24  380  			default:
b9ab3b61824190 Charles Keepax 2025-06-24  381  				break;
b9ab3b61824190 Charles Keepax 2025-06-24  382  			}
b9ab3b61824190 Charles Keepax 2025-06-24  383  
b126394d9ec6f9 Maciej Strozek 2025-06-24  384  			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
b9ab3b61824190 Charles Keepax 2025-06-24  385  						      handler, interrupt);
b126394d9ec6f9 Maciej Strozek 2025-06-24  386  			if (ret) {
b126394d9ec6f9 Maciej Strozek 2025-06-24 @387  				dev_err(dev, "failed to request irq %s: %d\n",
b126394d9ec6f9 Maciej Strozek 2025-06-24  388  					name, ret);

name is never initialized.

b126394d9ec6f9 Maciej Strozek 2025-06-24  389  				return ret;
b126394d9ec6f9 Maciej Strozek 2025-06-24  390  			}
b126394d9ec6f9 Maciej Strozek 2025-06-24  391  		}
b126394d9ec6f9 Maciej Strozek 2025-06-24  392  	}
b126394d9ec6f9 Maciej Strozek 2025-06-24  393  
b126394d9ec6f9 Maciej Strozek 2025-06-24  394  	return 0;
b126394d9ec6f9 Maciej Strozek 2025-06-24  395  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

