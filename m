Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C45E8BFA
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 13:24:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31716932093so3053963f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690205049; x=1690809849;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CA2Bwy97T2fhBqq40mLEv8eNohqmMx5+HPF1kFPHpYM=;
        b=zr1O3GlzVn1jfmQ6P/XEg66EkgY8lU3DOCRWhrDrGefFO5IeJIw2hd3EPdDeplOBaT
         ByYQ21JF8TwpE2OsYGjaHndXX/m/Mw5Me5W+QR9EiLW4bvk6UGvQoDYPfAAssFBie5uh
         8SWC4GZBNghqIG4/0zhPmauEGJrU9UTzACqMuT9bsAMiQDKgiD+U6GQa31xuRNp/hDR5
         0nXVaQetRTnGZiVs9pXc3MkhapZ9M86bG9zHvA7mB8E8cwOOHsW3EIPiYj1rSeObs0SS
         GPTWHZBsrsP9eh3pm+i2r3gqW5iU9VHn5XOcJu6KPC60weICZmFquzv+yhhNgoqQG6BE
         cbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690205049; x=1690809849;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CA2Bwy97T2fhBqq40mLEv8eNohqmMx5+HPF1kFPHpYM=;
        b=XLVrRBJA6Spo8TTDaFauPQ4wptbpTZFk0EQbz8g9l3L4ne9ddi+RaDiKkxdmuPIkFW
         qpyjWsGUhYV4VXhoJa9skeZlbhzj482S7XxG5IrCfZC3/zMtm8PR72cL1gmz4Th2oNij
         hNI9gsK8dom4BHs6cVo7PiYHDuCCIDrD0XWnD1qSG6AnVcD/6FbCHc9toUG8LnfQYVnX
         ykH/6nF8s1muEJzOwZgmooj8CZqIm15cmGZEoactSRb2VqAhsFBQHWTQaXfnjgxjwehN
         /hh32McLJGWjhVMwcuaU8n4OokX2v9LUQnKewRAZ5a3WOH9pfE9EnpHaz4KhVw5aTyEr
         siSw==
X-Gm-Message-State: ABy/qLY2kZXImPzgJF6YE51eL3gz9mwlN99UWYxGgikb7RjJu+yBqPbM
	127G9ffoWkTmRCPtkLhN1R5rh/8DjKHSIvzyOXE=
X-Google-Smtp-Source: APBJJlHwsRqTm3O3w1kMvbNRz2f9JqNy/1VNZqxHsLOI60sLvkqG7vloQD4t+JkzPkGmB7TSP2nnOg==
X-Received: by 2002:adf:f28b:0:b0:317:1911:fd7a with SMTP id k11-20020adff28b000000b003171911fd7amr7022131wro.12.1690205048961;
        Mon, 24 Jul 2023 06:24:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r11-20020a056000014b00b0031437299fafsm12970021wrx.34.2023.07.24.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 06:24:08 -0700 (PDT)
Date: Mon, 24 Jul 2023 16:24:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ardb:acomp-zswap-cleanup 7/21] fs/ubifs/compress.c:222 compr_init()
 error: uninitialized symbol 'ret'.
Message-ID: <276b83c2-c037-4638-bc97-0e8aa502926a@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git acomp-zswap-cleanup
head:   d0a9c8530b6b8659bc8b126638f5d2c907cfe5ee
commit: 9bb0bd982a78fa5d1dadadad46171275df3fae80 [7/21] ubifs: Migrate to acomp compression API
config: parisc-randconfig-m031-20230723 (https://download.01.org/0day-ci/archive/20230724/202307242020.llXP1Sz6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242020.llXP1Sz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307242020.llXP1Sz6-lkp@intel.com/

smatch warnings:
fs/ubifs/compress.c:222 compr_init() error: uninitialized symbol 'ret'.

vim +/ret +222 fs/ubifs/compress.c

1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  205  static int __init compr_init(struct ubifs_compressor *compr)
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  206  {
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  207  	if (compr->capi_name) {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  208  		long ret;
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  209  
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  210  		compr->cc = crypto_alloc_acomp(compr->capi_name, 0,
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  211  					       CRYPTO_ALG_ASYNC);
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  212  		if (IS_ERR(compr->cc)) {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  213  			ret = PTR_ERR(compr->cc);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  214  		} else {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  215  			compr->req = acomp_request_alloc(compr->cc);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  216  			if (!compr->req) {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  217  				crypto_free_acomp(compr->cc);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  218  				ret = -ENOMEM;
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  219  			}
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  220  		}

ret is not initialized on the success path

9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  221  
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15 @222  		if (ret) {
235c362bd0f6afc Sheng Yong       2015-03-20  223  			pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  224  			       current->pid, compr->name, ret);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  225  			return ret;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  226  		}
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  227  	}
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  228  
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  229  	ubifs_compressors[compr->compr_type] = compr;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  230  	return 0;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  231  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

