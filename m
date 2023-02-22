Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3727F7460;
	Wed, 22 Feb 2023 14:18:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k37so2838716wms.0;
        Wed, 22 Feb 2023 06:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9AYv4MZ0PVdleCTLJmIdfXhLpHP301LVOycmvvAP8k=;
        b=MEZmwJwuozbgU2BGHEe6dTjKLaFjN2r0XVnwx90M1y0zW1HAbrl2S5ba/42kntuO5W
         FCOD3KcgaT7O/cKD3iymSEmo+42I0qpvzrv9oXrWZ+oyp1sa59hHKtydyN8RX8BLoIEq
         KqsfxbtvGIy1aF5AShWqaXdcwD4cCdQiTBV6CpFXXxKsGcWot5wBqMFtsSR6Je61wUGt
         Cct+Jxr4Pc3kQ+haKOXeS6hKijXyUmqIZNDg27K9MZ/46HRXicMlo7NtCpE1b84zeUor
         YwwTYN/qOPj+jitlxNBArAdZ2PBIRt7iC8mfl4wQgWWSn8wTz6GL++i2NWVcADmQgTrL
         U8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9AYv4MZ0PVdleCTLJmIdfXhLpHP301LVOycmvvAP8k=;
        b=J9rteN2M/o6Oy2KGkGlhlN14vGTHFctfRX4XZkCEGmvRH3jdy2yhLysEzyPJ0okWSE
         oMohNcvkRD88bLpJwCFSUxi9cwRU8j92ppl6xOu5BSD6ymgzhP2RbVdxdWh/pH4/NMWu
         ZrsyBxD8/7QdyKOyqOfN2AnIwzClv4bNArfv8iwZV9EDxVm6PYWFeeFzhOCVs6rsbqkn
         +lFvpd918emU2RTOtUP3/9EsexscjEScr4Lz2cLPuBO21bVLFvP0ABXKXE/Nq2DbJ3F+
         C5sGKsbzfzNmvYiB5sK4FFp3Ap11AsFDStH2uB0mh21W/fPqs2wHURxrw1lWcrT3Of77
         Mtiw==
X-Gm-Message-State: AO0yUKXC6aKyRdZClLAoegT1rornBpmUmJlItfWxF6RQf8Dbewk+NtJl
	uuNwZRZELThgJ1Xnur7L2smorTrAFOGAsA==
X-Google-Smtp-Source: AK7set+CmRx93TMsiUA4vCV6SODXbE8jzm5WDn5sIGkpTrZ+gi3QeUMO7ui5hmhh8w0HklpUx/VN1A==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id i48-20020a05600c4b3000b003e2147fac1amr4335527wmp.21.1677075497154;
        Wed, 22 Feb 2023 06:18:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c5526234d2sm7025740wru.8.2023.02.22.06.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:18:16 -0800 (PST)
Date: Wed, 22 Feb 2023 17:18:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Geetha sowjanya <gakula@marvell.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:29
 rvu_mcs_set_lmac_bmap() error: uninitialized symbol 'lmac_bmap'.
Message-ID: <202302191621.sVquZwLz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230222141813.PGHPKV4yyOET7u_jhGZW0fgn5P_GLKwJJ3l_DHFZiWQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: ca7f49ff884677f97858c3934806e0e666425af0 octeontx2-af: cn10k: Introduce driver for macsec block.
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191621.sVquZwLz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191621.sVquZwLz-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:29 rvu_mcs_set_lmac_bmap() error: uninitialized symbol 'lmac_bmap'.

vim +/lmac_bmap +29 drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c

ca7f49ff884677 Geetha sowjanya 2022-10-01  16  static void rvu_mcs_set_lmac_bmap(struct rvu *rvu)
ca7f49ff884677 Geetha sowjanya 2022-10-01  17  {
ca7f49ff884677 Geetha sowjanya 2022-10-01  18  	struct mcs *mcs = mcs_get_pdata(0);
ca7f49ff884677 Geetha sowjanya 2022-10-01  19  	unsigned long lmac_bmap;
ca7f49ff884677 Geetha sowjanya 2022-10-01  20  	int cgx, lmac, port;
ca7f49ff884677 Geetha sowjanya 2022-10-01  21  
ca7f49ff884677 Geetha sowjanya 2022-10-01  22  	for (port = 0; port < mcs->hw->lmac_cnt; port++) {
ca7f49ff884677 Geetha sowjanya 2022-10-01  23  		cgx = port / rvu->hw->lmac_per_cgx;
ca7f49ff884677 Geetha sowjanya 2022-10-01  24  		lmac = port % rvu->hw->lmac_per_cgx;
ca7f49ff884677 Geetha sowjanya 2022-10-01  25  		if (!is_lmac_valid(rvu_cgx_pdata(cgx, rvu), lmac))
ca7f49ff884677 Geetha sowjanya 2022-10-01  26  			continue;
ca7f49ff884677 Geetha sowjanya 2022-10-01  27  		set_bit(port, &lmac_bmap);

This doesn't work.  lmac_bmap needs to be initialized to zero.

ca7f49ff884677 Geetha sowjanya 2022-10-01  28  	}
ca7f49ff884677 Geetha sowjanya 2022-10-01 @29  	mcs->hw->lmac_bmap = lmac_bmap;
ca7f49ff884677 Geetha sowjanya 2022-10-01  30  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

