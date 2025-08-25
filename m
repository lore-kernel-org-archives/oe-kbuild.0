Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D328FFCB
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756107082; cv=none; b=dOSt3G3srNIpIOLLqBWMBYe0KWMun2bisZubUSiFJFP5PTVJCnzTq76HugepoG36217yrzrfhXsEJR9WO67OW6vPw85NSoVJ0a66P98GtunQFi5tLD3UlzK5yJusRfpaKDI+Q8eghv7TrK2blTPfIb2VZxMNmg3f8tzH+IWSVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756107082; c=relaxed/simple;
	bh=eDBLoiXmzkfu9v1SxnpdEzYEo37pSpcTHmzBEbb6LNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3Uw6jEEeGg1mNaC4MnGp4F8CrUwyY+Sttvg4T+lakLLO5i6WHwJWQc1lrST22fEKHHstjErusa5W0lirrCYiIYt9+jpS+42egb4ZuhGWR5hhpoxVg0PEzCDPw435zfKd75X31N4IWlR6bRFQzA5bPu006VubEnW/0q8y66vhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b1nT1Bp4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b1nT1Bp4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso22684795e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756107070; x=1756711870; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dA0B/Z+t0SDZNKhJ0t4Zd1ZeMJ/vd3BE1jNyaljxoLg=;
        b=b1nT1Bp4qwyzu9TtCh1ZOkILc596jNOq9vmtMuzJphP6TFVCAi2dRGdrjAGpjzf/95
         mZb3kw1qu16cRQyo1dpu84/y4uwZNXamKUT9LzWKf104e40pODEmzv7b7Di2PuHa5H8+
         KAvy+8sU1r3bRorH/0n7vGJFAT0eQ5JeROTM+5YKZ7IEnC+GmXSXHEjqDw3GoLH1klPs
         ei++ZlhLp2fzBrZ3HDRT5soA1fkLdb2gb6Gum63LdmcQyrTc+VdbSgGJB+U2p3LVxyw6
         KsR9uwFlFk+TS2acoy/k+X74vI52hEF2QInB7vcg8SY0b5C0+/gQZj5V+FiyWG4Va9+v
         385Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756107070; x=1756711870;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA0B/Z+t0SDZNKhJ0t4Zd1ZeMJ/vd3BE1jNyaljxoLg=;
        b=Mh7DBaQWq6ogVr52EbLvMSlPOReXfjNo02YMX+JEhJYi9f3xDKGmxZ+Mw4dsAUlwFY
         lqrR7cjPgTJwIyCLuWnRIc7/3O479My8Yow4et8F1w7gFCclO5rwxCtTawQ+8ygbzNR2
         a5KKQ4ESfZe9TCgX3Fs0ct7SX2RJIdhaDATfeoJlBRS/AjlbL3rIl71/G0Ria4T8BbnY
         2rLI8K2AQltMBgJfoYcNB5fgcmWlLSjJ33XqgLZbV9XMEOQkHOmvSYfYqxPWKLhl2q3L
         mLjW6+HuCAF3mWLnLGzvJFqD++Rb6a3yaj/yVlSGLMJbio1SPavaHWxBxMra6LAit53y
         Ryfg==
X-Gm-Message-State: AOJu0Yy0ZjcBLEC8WgAUn0UJHaOQRZFXoSa3vMlouiLqYeSxD5S0tjLf
	lIgkAZ7MBE16KJjI0HAjhUeQK3ArUJdcBSv8ZhTpZ6p9tAh+l8GCG0dNy2A3UecJC9OX6GMO1PU
	8m4JD
X-Gm-Gg: ASbGncvu03KTxo/jXovJ+7mPfhx9ay4elSKbyRpjjj+krZ72SaLiQV0tnXKjE5z+YkM
	dYMN6QSyb7Nb8ejT6X/L9lUXMP4WX/1YN5XyxS1VJxLXc2eM5zUODf7BphzII6lTsEm8PCm4rtC
	SyEucgJTSmktxKO+h23KUnCK8b3SHB6Dsq6h4D4s4QUD006ZjcenfECeOZQeI8VABTe0I0tcD/1
	6Rf3ehDWqnUwAfLpcmvd01Q3A425wcveRAk5X5r9tTLcGeP0iEDKZmjN1F3v9oK9UV6qzjHfYj1
	kcjZJRRajQFGWWVp6qFspkhEt7oZbtrlW/4uNX3hF729VNhxwLRrp38GBm0cmOl30xBswGhmUyc
	nhbeAoZ8PDUEOePbfp4WbD/nGW8M=
X-Google-Smtp-Source: AGHT+IGojlP1+8rsUw99TfqoNfzVAu8XJv38XLLNWdTJivfaVzBSz4xljXNXlocr3Uiwlv0dn6pwYw==
X-Received: by 2002:a05:600c:1987:b0:456:1904:27f3 with SMTP id 5b1f17b1804b1-45b517c2fb5mr88724605e9.18.1756107069869;
        Mon, 25 Aug 2025 00:31:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711abd15asm10434837f8f.56.2025.08.25.00.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:31:09 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:31:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Saeed Mahameed <saeedm@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Parav Pandit <parav@nvidia.com>, Feng Liu <feliu@nvidia.com>,
	William Tu <witu@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Subject: [linux-next:master 2381/4234]
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981
 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-95)'
Message-ID: <202508250221.IoqBZOXQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250825073106.l5vokxEV2OPrfT-mfrqC1efsdMUb5xjIGBs4iOGsYRw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: 1baf30426553efb3ac518b0e9d5c1c3f8ed7762a [2381/4234] net/mlx5: E-Switch, Set/Query hca cap via vhca id
config: x86_64-randconfig-r071-20250821 (https://download.01.org/0day-ci/archive/20250825/202508250221.IoqBZOXQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508250221.IoqBZOXQ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:981 mlx5_esw_vport_vhca_id() warn: signedness bug returning '(-95)'

vim +981 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

1baf30426553ef Saeed Mahameed 2025-06-16  978  static inline bool
                                                             ^^^
1baf30426553ef Saeed Mahameed 2025-06-16  979  mlx5_esw_vport_vhca_id(struct mlx5_eswitch *esw, u16 vportn, u16 *vhca_id)
1baf30426553ef Saeed Mahameed 2025-06-16  980  {
1baf30426553ef Saeed Mahameed 2025-06-16 @981  	return -EOPNOTSUPP;

s/-EOPNOTSUPP/false/

1baf30426553ef Saeed Mahameed 2025-06-16  982  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

