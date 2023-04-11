Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE72F2D;
	Tue, 11 Apr 2023 08:21:28 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j1-20020a05600c1c0100b003f04da00d07so361944wms.1;
        Tue, 11 Apr 2023 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681201286; x=1683793286;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLr50RMsIDHguyM3rr5tFIBceDphhXuonk+H7GyFFm8=;
        b=qfZ+IZRFEywsCJDI+miVnTuR4P26yu38syNI7wIssrK0qm8/DzqCxqALazr+pu9dcX
         ra/WU5uxDodu6mc/K9lN/s33PVdl0U9zvMzLY3SMBiZjG9OQQfTqpFZXUdtAyjUiQeQd
         /2T17xKdquitLUK91nsIxD5eIor4LHT7VcbnAe11Hcu/zyFN3fuLSudOOcCXjjG0aFEO
         naywweuXfZHliKp4N1u5shkEgNAjeknO/9hkMea9TLSe7W53N710udh1S9dSYyRhYXpO
         t2z3j/73N+Inp4045oxEIdcwDEhKCb4UguYoXtufC9TouGvuOk1YyAnUAADH2rAreL9H
         4b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201286; x=1683793286;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLr50RMsIDHguyM3rr5tFIBceDphhXuonk+H7GyFFm8=;
        b=AJJzv36Q3ioVrqTmC0IqmQkdZM/2U1FQa/fxPDRCpQCsXnhjq6UxaziiI6hCBSgHUW
         dateeeu1D6lN7+kugG1Zegjly+84970HMvx0TpPpbDx2xHztGPfGFGCb4FBNInGCoX5v
         Z7ohmODOh/SzYxojNquHGGF0wSxNkWztx+s0JWkdHDXyBnunRDUxfccvRBLH34iWMJGz
         ewo3VG84uWBG9uXZFggqqGLoMoaKlJacj1Yj4NY+pEyO9FwGqf0zMBqj5r3D7s3n9wsO
         1YLsts0uDJ3LcCLKHTBU/4bykZBD80eurgUH28YmT16G0k07zcCJZzYW0x4fib1up5lo
         f7kA==
X-Gm-Message-State: AAQBX9eiMPM5uKtRv99FRISrAbE2B6tm6i+5qxZGQCyTtExLdVBN3lJs
	grYVIjGjr30xOWJanbmJUTJaiVuTOic=
X-Google-Smtp-Source: AKy350bYU2GaCxVYFn0H7UdmbMcQ3xgtIqSVkf77R+4E+DjGQQGZl8TPqbLRtpxRW4M8L08AllLVmw==
X-Received: by 2002:a7b:ce97:0:b0:3eb:399f:6b70 with SMTP id q23-20020a7bce97000000b003eb399f6b70mr6466594wmj.31.1681201284572;
        Tue, 11 Apr 2023 01:21:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcc8f000000b003ed4f6c6234sm16070930wma.23.2023.04.11.01.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:21:24 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:21:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Message-ID: <7351b44c-f577-4df3-a01e-e9b1039fa928@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-clock-Add-Renesas-versa3-clock-generator-bindings/20230404-171012
base:   1bd575707d704530a52d5dd320c29d79e9cff42d
patch link:    https://lore.kernel.org/r/20230404090823.148226-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
config: arc-randconfig-m031-20230405 (https://download.01.org/0day-ci/archive/20230408/202304081045.5aflIfGy-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304081045.5aflIfGy-lkp@intel.com/

smatch warnings:
drivers/clk/clk-versaclock3.c:546 vc3_clk_mux_determine_rate() warn: replace divide condition 'req->best_parent_rate / req->rate' with 'req->best_parent_rate >= req->rate'

vim +546 drivers/clk/clk-versaclock3.c

fe68e1ca2f2871 Biju Das 2023-04-04  538  static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
fe68e1ca2f2871 Biju Das 2023-04-04  539  				      struct clk_rate_request *req)
fe68e1ca2f2871 Biju Das 2023-04-04  540  {
fe68e1ca2f2871 Biju Das 2023-04-04  541  	int ret;
fe68e1ca2f2871 Biju Das 2023-04-04  542  	int frc;
fe68e1ca2f2871 Biju Das 2023-04-04  543  
fe68e1ca2f2871 Biju Das 2023-04-04  544  	ret = clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT);
fe68e1ca2f2871 Biju Das 2023-04-04  545  	if (ret) {
fe68e1ca2f2871 Biju Das 2023-04-04 @546  		if (req->best_parent_rate / req->rate) {
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
What is this testing?  In terms of micro optimizing, divide operations
are normally slow.  And >= is more readable.  But maybe this is
something which makes sense with more context...

fe68e1ca2f2871 Biju Das 2023-04-04  547  			frc = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
fe68e1ca2f2871 Biju Das 2023-04-04  548  						    req->rate);
fe68e1ca2f2871 Biju Das 2023-04-04  549  			req->rate *= frc;
fe68e1ca2f2871 Biju Das 2023-04-04  550  			return clk_mux_determine_rate_flags(hw, req,
fe68e1ca2f2871 Biju Das 2023-04-04  551  							    CLK_SET_RATE_PARENT);
fe68e1ca2f2871 Biju Das 2023-04-04  552  		}
fe68e1ca2f2871 Biju Das 2023-04-04  553  		ret = 0;
fe68e1ca2f2871 Biju Das 2023-04-04  554  	}
fe68e1ca2f2871 Biju Das 2023-04-04  555  
fe68e1ca2f2871 Biju Das 2023-04-04  556  	return ret;
fe68e1ca2f2871 Biju Das 2023-04-04  557  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

