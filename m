Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A617CD;
	Fri, 23 Dec 2022 10:54:51 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso5120083wmb.1;
        Fri, 23 Dec 2022 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jU7Gwtk5CThFB9C7hQa4t1t5QkALQrwN/aMPEyEycHY=;
        b=NnbnBxMT3mzDcYwCScVuTk2JginRHks6gpOOxrgQ5NROHKkPSseanaXLzaMFp6B9RW
         pu+xCH1gKdBujbLQKObdxV2F+IlCd/jf8i0vDeJlyTaYcWY7LZZxe03dO13k0XAt2C21
         e5MiYlsqbENI937PmhzDwklDT4OKd+c4+22Y/rOswPQKI68nQQwEdyRUbAKCTteRGSxt
         3j0iDse75OPtwdSWuwqOhBEl6mPfQ2qFEUOkMsrLRitqyaCNx3D1jF9mD2qhsa9iVACO
         RdmyfQmPoQ8yYE4cJgAT+NcaWDE1NtIqzDe5kZbK4icgbDa9OShHDZPtLlSPHRBxCwPR
         vSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jU7Gwtk5CThFB9C7hQa4t1t5QkALQrwN/aMPEyEycHY=;
        b=PWT/akcbT46xzjNf6w6/lm53PXDMyyD9Qq3tHfRwK2ilRRMHeYV3vUTzEUi4/46jNr
         jzB8Kmv3Po/sZPjlnfq8IF3olFHJ0vZmSgh+5PilINUKj7uWMMtNm8foGfXBnlnKSRh6
         819GYcXg8vu36nFRyyF+IDCi2GWnjTMtIGiIwn/7A3kwYXknWT4EypvNx4mTW7/TQsVa
         0PUikeHH21YvSeYd9vld7+wvN8nYN0EXU6kMMjlyl12d2o0tc7eslftEJLJsF2tMXht2
         ysxsSOV86WUkJZJNs0gjoJ++H5P/3+Ym0DSdYeayD/+RLtl1YhAWRYSnRotf6o268rkS
         Sy3w==
X-Gm-Message-State: AFqh2kqpBD9XNqaJHB/jegPmb1iYI6EuiXGrbt+z636jvhq8eBNz3A4x
	jBJbObaqm+92Ns/9oU5Ak7QxuaF5/ltR8Q==
X-Google-Smtp-Source: AMrXdXtM/sYiCek0tFDZ1bpxTJeAEJkTBoHiCDsRzreP3WgShRJyCrh3oeueYOL/B5yXeRl7ux/UQA==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id ay24-20020a05600c1e1800b003d25e4e0701mr6740482wmb.31.1671792889828;
        Fri, 23 Dec 2022 02:54:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x15-20020a1c7c0f000000b003c6bbe910fdsm11322454wmc.9.2022.12.23.02.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 02:54:49 -0800 (PST)
Date: Fri, 23 Dec 2022 13:54:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Qingtao Cao <qingtao.cao.au@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace
 divide condition 'pin / 8' with 'pin >= 8'
Message-ID: <202212181140.EAWl7FKx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221223105437.TACd6N6MxYfPT45YfuxyaSliJhSnJ63xklH72-smZoc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9ff5644bcc04221bae56f922122f2b7f5d24d62
commit: 5134272f9f3f71d4e1f3aa15cb09321af49b3646 gpio: exar: access MPIO registers on cascaded chips
config: ia64-randconfig-m031-20221218
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'
drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'

vim +52 drivers/gpio/gpio-exar.c

696868d0a79c21 Bartosz Golaszewski 2020-09-30  47  static unsigned int
696868d0a79c21 Bartosz Golaszewski 2020-09-30  48  exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
696868d0a79c21 Bartosz Golaszewski 2020-09-30  49  {
5134272f9f3f71 Qingtao Cao         2022-09-02  50  	unsigned int pin = exar_gpio->first_pin + (offset % 16);
5134272f9f3f71 Qingtao Cao         2022-09-02  51  	unsigned int cascaded = offset / 16;
5134272f9f3f71 Qingtao Cao         2022-09-02 @52  	unsigned int addr = pin / 8 ? EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;

Why not change this to pin > 8 instead.  Comparisons are faster than
divide ops.  Way more readable too.

5134272f9f3f71 Qingtao Cao         2022-09-02  53  
5134272f9f3f71 Qingtao Cao         2022-09-02  54  	return addr + (cascaded ? exar_gpio->cascaded_offset : 0);
696868d0a79c21 Bartosz Golaszewski 2020-09-30  55  }
696868d0a79c21 Bartosz Golaszewski 2020-09-30  56  
696868d0a79c21 Bartosz Golaszewski 2020-09-30  57  static unsigned int
696868d0a79c21 Bartosz Golaszewski 2020-09-30  58  exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
696868d0a79c21 Bartosz Golaszewski 2020-09-30  59  {
5134272f9f3f71 Qingtao Cao         2022-09-02  60  	unsigned int pin = exar_gpio->first_pin + (offset % 16);
5134272f9f3f71 Qingtao Cao         2022-09-02  61  	unsigned int cascaded = offset / 16;
5134272f9f3f71 Qingtao Cao         2022-09-02 @62  	unsigned int addr = pin / 8 ? EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
5134272f9f3f71 Qingtao Cao         2022-09-02  63  
5134272f9f3f71 Qingtao Cao         2022-09-02  64  	return addr + (cascaded ? exar_gpio->cascaded_offset : 0);
696868d0a79c21 Bartosz Golaszewski 2020-09-30  65  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

