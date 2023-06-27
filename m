Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7D171CF
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 10:01:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so6069420e87.2
        for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687860081; x=1690452081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SCUY0Z05cMXhp1kkFMaE32gHxQv1w+PfecC34JG2EQ=;
        b=yqyH+S7krHcEBz2MT+tOUcAx8qhyOvz/R5xej4OfAXvRP7MbsNW8fsPlAsaYj5rpcQ
         oUsAM5gNLu+vecjaziYdZHIZkOUJJDJJJKc8QeXUeEHkY9ODTAOmMe0k3SqNAnwgNhcc
         8hsZZG6n2NrKSHGqy1YsD1S/JjMr/sPDX+VqhMtcNGEQ2I536A2CxCMv8lCz4MZdAcWg
         RNUr0bQlQdcjGae2SQHCxTLhwXf72Er8xRCoMxL/sMHk2Dfh0Vb6rJVkHEh44hee/ltp
         EmNrPLBicrX275Bqwga1ItcERgqPMec5bJ6SVPDwcv8TctFga+yR58AeXPhqyJoQZ5MZ
         Azyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687860081; x=1690452081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SCUY0Z05cMXhp1kkFMaE32gHxQv1w+PfecC34JG2EQ=;
        b=XAMW18fzXSa43giR2dMWy33z+IvoML+8nl6Tbe+D/tdijqlvsgVeEQGNXe7J4YQMay
         uGlTxKz0Id8qyvH6hg5i82mIqPDPzY+q4k/RiaYr8alglnGc6DJCDYVtTJLs+02D2/4P
         Y8EIkSyxuRIqnZ9eShP6Zaib5IJYod7g1D1+HPXtqmpkMp109kSW0/L+N4aV1dt1hDwv
         rR/0u5fYnIjZTHFnXTGAPOqn8ARgGcTbNFXEGI6BDvFwFqJGYJ9XHzPLpP2zBkl/8kMe
         FZbjHxczbZvUHgupzl8jgzW0BJIMszeCtwX417dNEDu7oQT6V6OXwNHso2+Vs2sfZLg4
         yD1Q==
X-Gm-Message-State: AC+VfDzIuxV+EH3N1f+rQ6DG5C2/93E1zMZQGObJ0k4RXTxolyMUuTD8
	LzwUrHojtFybjx2q9HdeNgp1Hg==
X-Google-Smtp-Source: ACHHUZ68qxnW7uxf9W2l9v5Vv+qrMipPbyF1x2KsFogxxtvsKWzdDn3QMda2V1lgSIzqlAJuGGN3SQ==
X-Received: by 2002:ac2:558e:0:b0:4fb:7d73:d097 with SMTP id v14-20020ac2558e000000b004fb7d73d097mr1474730lfg.39.1687860081304;
        Tue, 27 Jun 2023 03:01:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w10-20020a1cf60a000000b003f9bd9e3226sm10205737wmc.7.2023.06.27.03.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:01:18 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:01:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 22/24] Input: bcm-keypad - Simplify with
 dev_err_probe()
Message-ID: <8d3ff4b2-8f43-428a-9cb1-9f939f64636b@kadam.mountain>
References: <3b63bde3-797e-4d58-92a7-c77c953f17d6@kadam.mountain>
 <d5e3a542-3456-293e-8ea8-112eb8cff7cd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5e3a542-3456-293e-8ea8-112eb8cff7cd@kernel.org>

On Tue, Jun 27, 2023 at 10:57:49AM +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 15:05, Dan Carpenter wrote:
> > Hi Krzysztof,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/Input-gpio_keys_polled-Simplify-with-dev_err_probe/20230626-003156
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> > patch link:    https://lore.kernel.org/r/20230625162817.100397-23-krzysztof.kozlowski%40linaro.org
> > patch subject: [PATCH v4 22/24] Input: bcm-keypad - Simplify with dev_err_probe()
> > config: i386-randconfig-m021-20230625 (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202306261505.wTjCXRIO-lkp@intel.com/
> 
> Thanks. I run smatch on the patchset before sending and did not point it
> out. Nothing also after pulling latest master. I guess you run some
> unreleased version?

No, this is the kbuild bot.  It's using released code.  I tested it on
my system as well and it should work...  That warning is newish though
so maybe you're not using the latest Smatch?

$ ~/progs/smatch/release/smatch_scripts/kchecker drivers/input/keyboard/bcm-keypad.c
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/input/keyboard/bcm-keypad.o
  CHECK   drivers/input/keyboard/bcm-keypad.c
drivers/input/keyboard/bcm-keypad.c:370 bcm_kp_probe() warn: passing zero to 'dev_err_probe'

regards,
dan carpenter

