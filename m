Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C2F145B07
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830423; cv=none; b=qEXspjmVupdnziSUuPvfCjCEVxKZifgT3ErdOg0q40Z/KzhPVtVNGnQ1/9K5vfSiquXYQRrwYoUtLnsiCBo/I97O2nCr9nTBRfM7iRUlGyep61vEFCGg+KY7kuoUC9pqR9o4/h2VL+JFmk2Mab1HWkk4KFvvMiLQEEdiMfx34Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830423; c=relaxed/simple;
	bh=MyCZfVQ/GkQz9qu6Qto35uYOC2S7azvjfcNuc7yzAhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=COqctBkvQIXnh2It1QLwTAa2HBT1ESuNwwu/5uca4VyArZZX62Z/AY0nN8zsOMiP2QBuuaeT97mq1dfLw8c4oEhzmoFIL5gAtsFTTyi6utuFQRD7AEKWdYVjBvHjiDHw0ESfpxQfNXRp3y2XCV5dUUDNocwJWh96zOc+3vYLKFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkuuYFIT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkuuYFIT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51addddbd4so694343766b.0
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830419; x=1713435219; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1p29brlO6Uk/Iprw1meY42OorKRcQ16DQ6T6t8baFI=;
        b=hkuuYFITMrfcjUcO/Ht7h+P17Xmh3e30O0rd4kgQ2BCwTHyvnE2uAJMJc5pbPe8VAT
         kf2KJB+HeaFC9W/OkfKiAmvxuaP3WJQVanVXPonFHrbgh1Di0EtCYYg/7tXyCnD49r+o
         fVl8Da/0ipS9UkaHfxMIcZNHb554uvPTOcB6ohA7rO41Rbvb4pH4YRmIx63Jwy96mVIk
         Bmau3hcaW+Ju4037CrsWlEfHXk3Lqc5RsQ0Ot2t6K5RAl6wHQeToSAkWC9VVvA43m1fv
         86dDD2Zcf7ScH0BfwcX2oeWz3p3pCKQdZrsTZ6xN00sS28epNJZavs1YjYbacSr3/JnT
         eFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830419; x=1713435219;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1p29brlO6Uk/Iprw1meY42OorKRcQ16DQ6T6t8baFI=;
        b=ig03Kq5PREPuP6P0LwpeANCgbdIdiB25VjpQdY1v39SfhScpgEAcSghgULNo2y1qyX
         jThIx7BTZAYtJN/GJXyzGbUKYC//US+omEF4ymEUZcyIpdzsHcnXLWI2I98ipITgYTyA
         LHpGbcGLot06OthwAwkKkytou0GGMcV7qJhlycjtuFXFKIU4GUi8BriPfmMv28fA3+AT
         W60IUB6GTQdYjF702EVr9jaIsJIxb9Pf28MYTScHveJZbwKSIY25duYRs3mW8YdEcrhT
         QT6I5v++RPfO7/MKT7uzHlxSduqi6sAcLiZPlf2I3KSXz3pnOJfT+x6dAKN1fmGsctaV
         z05A==
X-Gm-Message-State: AOJu0YzzcsBQ200bdee6em8PrJgeNB+gMMK76eTqtDbcbbU06gqTZ0h6
	6bOODe1SH7W4UHrJvTEgTizrXjWASX38vtWxBn4njJO5ud19IvlxqO61KkjgQ5RxXCwmGwGxQ0n
	i
X-Google-Smtp-Source: AGHT+IHwVbKSqhXJNpF+uiA/1igmE73k7emifJNnoCWPo+IcRZFMBArm3rjE0i00+NknT5bdJC5pcw==
X-Received: by 2002:a17:906:6716:b0:a51:e8cf:52a6 with SMTP id a22-20020a170906671600b00a51e8cf52a6mr2855538ejp.23.1712830418959;
        Thu, 11 Apr 2024 03:13:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bz2-20020a1709070aa200b00a51a9eccf2asm605439ejc.125.2024.04.11.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 03:13:38 -0700 (PDT)
Date: Thu, 11 Apr 2024 13:13:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 33/40] drivers/tty/mxser.c:513 mxser_set_baud()
 error: uninitialized symbol 'baud'.
Message-ID: <6af3331c-bb9f-4349-9030-78d07e2f1a6f@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a56ff0cb0fd0fd59f4a9a12091951ae80f866abb
commit: fb7c4d96c47896d2d8db670f34bb961a66ea869a [33/40] mxser: use timeout from uart_port
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110644.9Hya2zB1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404110644.9Hya2zB1-lkp@intel.com/

smatch warnings:
drivers/tty/mxser.c:513 mxser_set_baud() error: uninitialized symbol 'baud'.

vim +/baud +513 drivers/tty/mxser.c

ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  490  static int mxser_set_baud(struct mxser_port *info, struct ktermios *termios)
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  491  {
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  492) 	struct uart_port *uport = &info->uport;
104583b504da8a drivers/tty/mxser.c  Jiri Slaby        2017-09-12  493  	unsigned int quot = 0, baud;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  494  	unsigned char cval;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  495  	speed_t newspd = tty_termios_baud_rate(termios);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  496  
928f946426905d drivers/tty/mxser.c  Jiri Slaby        2021-06-18  497  	if (newspd > info->board->max_baud)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  498  		return -1;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  499  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  500  	if (newspd == 134) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  501  		quot = 2 * MXSER_BAUD_BASE / 269;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  502  		tty_termios_encode_baud_rate(termios, 134, 134);

baud is uninitialized here

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  503  	} else if (newspd) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  504  		quot = MXSER_BAUD_BASE / newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  505  		if (quot == 0)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  506  			quot = 1;
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  507  		baud = MXSER_BAUD_BASE / quot;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  508  		tty_termios_encode_baud_rate(termios, baud, baud);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  509  	} else {

baud not initialized here either

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  510  		quot = 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  511  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  512  
fb7c4d96c47896 drivers/tty/mxser.c  Jiri Slaby (SUSE  2022-11-15 @513) 	uart_update_timeout(uport, termios->c_cflag, baud);
                                                                                                                     ^^^^
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  514  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  515  	if (quot) {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  516  		info->MCR |= UART_MCR_DTR;
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  517) 		outb(info->MCR, uport->iobase + UART_MCR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  518  	} else {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  519  		info->MCR &= ~UART_MCR_DTR;
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  520) 		outb(info->MCR, uport->iobase + UART_MCR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  521  		return 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  522  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

