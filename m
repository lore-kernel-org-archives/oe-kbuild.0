Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F2EF9E1
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bg8lLr0m"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-332e42469f0so63294f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 22:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700719829; x=1701324629; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhvG/cBSfaRPoasqLeuPzQWIXK6FL28oMwCUuCagJt0=;
        b=bg8lLr0mbSQGKn4lQElHiV+QLWN6p1iubqaauWUrF6D0PDuDoy/etO2RUDoNhtN+3w
         zjo4eg//NeF0O7y3dqotRiFJx7VFMWFZ8XFgKTIHY7yo+5I7b1EXpwT4iHPPXTSd8z59
         ddhwk805ECVoj4HRMNrab8snw+Lr67xbTSkTxf52AOefr677T9u6L0kAtG1l9DJhsDME
         pPKwfvrO8Fl4YSNHDKtHZgP3C4fJZCsQbUfD5y/x1PZ67jI0SaWkwv6ttAk/08s6mXrU
         OUDehe8DOyAayTIZp2npYeYVw5wqKiADjiijv1YV6so8kjtaus0eyEoaiDLwJaghcV9B
         fvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700719829; x=1701324629;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhvG/cBSfaRPoasqLeuPzQWIXK6FL28oMwCUuCagJt0=;
        b=kJOYw4sCkGNiU170+sR+cQ6QW4NfljCqhSyv5XCtm/a6w8dQJR71fKhoSoDQqbHKYP
         qdA/AQQI1uR0GcdkcxKY8SpqnDeTU5PyXwMshrZo+SkvtKI/fBSQwO6MaWzulkhgx1lT
         e5wiH2P1Q7eYmbg03uXDdG91f21W02gJJkpCE/u0TAP3h8kVOddGAHGk39cy398Z76td
         EsjHt+FpueO/coMcnG44bCG0liH/ajwOcUS9Z+et1WsdBiJWh8Im4iuUNORE+QeYgYXh
         lOtRtJf55fkjE8bwtz94g6SKRAKubGqNsxqyJThSMK402O6Ki2FNMzskZCozWIyM+NUH
         clcg==
X-Gm-Message-State: AOJu0YzArfto5G6LA+z/F2Pk3gt4KwSwqL8sHPim+yJgYxTtcF+8lt8u
	azxMmtuSkCmUNri3y0Cw1fu1pfA+55fHr3ZagvyX59eW
X-Google-Smtp-Source: AGHT+IG5E0J+F3kI7IYUeGWwGwjyH+HM0RRgSN6O6Q9IxonmzR/N7zH+77peiECJsn59NOfrikGrWA==
X-Received: by 2002:a5d:5987:0:b0:332:c585:400d with SMTP id n7-20020a5d5987000000b00332c585400dmr2890916wri.10.1700719828609;
        Wed, 22 Nov 2023 22:10:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x12-20020adff64c000000b0032dcb08bf94sm602993wrp.60.2023.11.22.22.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 22:10:28 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Nov 2023 09:10:25 +0300
To: oe-kbuild@lists.linux.dev, Umang Jain <umang.jain@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:507
 vchiq_ioc_await_completion() warn: inconsistent indenting
Message-ID: <a4901693-b034-4a63-b97d-a6c2d9ddcb29@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b6de136b5f0158c60844f85286a593cb70fb364
commit: 1d8915cf889932e085880f4bdbf7ae0f3d8605e5 staging: vc04: Convert vchiq_log_error() to use dynamic debug
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231123/202311230705.w4DPJjm0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230705.w4DPJjm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311230705.w4DPJjm0-lkp@intel.com/

smatch warnings:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:507 vchiq_ioc_await_completion() warn: inconsistent indenting

vim +507 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

f05916281fd75db Ojaswin Mujoo   2021-07-21  496  		header = completion->header;
f05916281fd75db Ojaswin Mujoo   2021-07-21  497  		if (header) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  498  			void __user *msgbuf;
f05916281fd75db Ojaswin Mujoo   2021-07-21  499  			int msglen;
f05916281fd75db Ojaswin Mujoo   2021-07-21  500  
f05916281fd75db Ojaswin Mujoo   2021-07-21  501  			msglen = header->size + sizeof(struct vchiq_header);
f05916281fd75db Ojaswin Mujoo   2021-07-21  502  			/* This must be a VCHIQ-style service */
f05916281fd75db Ojaswin Mujoo   2021-07-21  503  			if (args->msgbufsize < msglen) {
1d8915cf889932e Umang Jain      2023-10-24  504  				vchiq_log_error(service->state->dev, VCHIQ_ARM,
f05916281fd75db Ojaswin Mujoo   2021-07-21  505  						"header %pK: msgbufsize %x < msglen %x",
f05916281fd75db Ojaswin Mujoo   2021-07-21  506  						header, args->msgbufsize, msglen);
f05916281fd75db Ojaswin Mujoo   2021-07-21 @507  						WARN(1, "invalid message size\n");

WARN() is indented too far.

f05916281fd75db Ojaswin Mujoo   2021-07-21  508  				if (ret == 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  509  					ret = -EMSGSIZE;
f05916281fd75db Ojaswin Mujoo   2021-07-21  510  				break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  511  			}
f05916281fd75db Ojaswin Mujoo   2021-07-21  512  			if (msgbufcount <= 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  513  				/* Stall here for lack of a buffer for the message. */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

