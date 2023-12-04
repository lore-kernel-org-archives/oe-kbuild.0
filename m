Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11BB15A4
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yaSzWmAp"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33338c47134so1491746f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 20:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701664812; x=1702269612; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7q5G2KknbcCBX38jRrjfi6bGriuiAOVeE6vCr3ghSGw=;
        b=yaSzWmAprtZLqjva2pFN9r7yhXvJCcuMdeZhcyIcPoCZhfWFLdvQCvbKPu/YVYmTNF
         6yOcZ8T2+edVOsWTnkJeDz7ZtJ/OH7vr0AiH1ZyDcVGUuF3pcQ5g1NfDdxvm8VD7vqZ/
         zfcZCdQwtfRyNk0pso+bq7ja15B/sJDs+qQhm1Km+fHVj8ZWpJrRXI12cOXdwz35a13E
         bjlKigUvIcQ391pPML1jW6xljepj6BK8Hd7gMytfacwKFXlXVGKHCSs/IhVPfC0WuiuG
         hrtXyQ0YNMS07lGTQO2drH7KTT90cjz0Km6cktoG2jZTGgGcTJ6Q5+r6yF+3QcbmwYqD
         F27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701664812; x=1702269612;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7q5G2KknbcCBX38jRrjfi6bGriuiAOVeE6vCr3ghSGw=;
        b=PJAlnwRnr2fbrGf6jig+rMusqy9aBC5acneO0nEWq5M+67H2npbmbt7ld5lzZJCXEv
         49pQAdREKZ2Q0NUOVvuEF//HLYraX1Bp5tLDcwDyR2sQeb8W2Tsvp1TiskuZYzyAw18O
         EyMl0edJk2PYDLs7fLI5UdyTr8EB4x0lSWH4X8PmWoLmi6wtE03f3TEkXTwVprkKoIwN
         2d/Yy+z1qWaxerq6mU/+P5Pr3mmV314WacY/h7KyiXsXjw09FcjIhGMm5+HYBFZB/WUP
         BNi0jEBREL61DAXYU+7d3Mswu2NINtXy76fqNymuoSywboghiU1RHRloK067VyxblyNe
         YMIQ==
X-Gm-Message-State: AOJu0YxFK/U+Q/ODeewFEW4N0Hc1qS64Alu6/D5efKKGGP/Dow/PbOzB
	4YHT5TFfz3qUb0fd27rhVFN6MFfr3eGUfHWn6I8=
X-Google-Smtp-Source: AGHT+IGIPkjX0Mimhpi7bOnIb6Uggha41uqwpjIgxyxM9rwGZZxxzeMtmpsZ8E/b0f+bDXZ1sm0UcQ==
X-Received: by 2002:a05:6000:4f0:b0:333:3f5d:63d2 with SMTP id cr16-20020a05600004f000b003333f5d63d2mr1265974wrb.3.1701664812619;
        Sun, 03 Dec 2023 20:40:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l13-20020adffe8d000000b0033342978c93sm3083094wrr.30.2023.12.03.20.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 20:40:12 -0800 (PST)
Date: Mon, 4 Dec 2023 07:40:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/dsa/mv88e6xxx/chip.c:245 mv88e6xxx_default_mdio_bus()
 warn: can 'mdio_bus' even be NULL?
Message-ID: <80166d2f-d877-4db8-ab55-d7d7243969b7@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: a3c53be55c955b7150cda17874c3fcb4eeb97a89 net: dsa: mv88e6xxx: Support multiple MDIO busses
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231203/202312030131.Vl3CGtDZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030131.Vl3CGtDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312030131.Vl3CGtDZ-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/mv88e6xxx/chip.c:245 mv88e6xxx_default_mdio_bus() warn: can 'mdio_bus' even be NULL?

vim +/mdio_bus +245 drivers/net/dsa/mv88e6xxx/chip.c

a3c53be55c955b Andrew Lunn 2017-01-24  239  static struct mii_bus *mv88e6xxx_default_mdio_bus(struct mv88e6xxx_chip *chip)
a3c53be55c955b Andrew Lunn 2017-01-24  240  {
a3c53be55c955b Andrew Lunn 2017-01-24  241  	struct mv88e6xxx_mdio_bus *mdio_bus;
a3c53be55c955b Andrew Lunn 2017-01-24  242  
a3c53be55c955b Andrew Lunn 2017-01-24  243  	mdio_bus = list_first_entry(&chip->mdios, struct mv88e6xxx_mdio_bus,
a3c53be55c955b Andrew Lunn 2017-01-24  244  				    list);
a3c53be55c955b Andrew Lunn 2017-01-24 @245  	if (!mdio_bus)

Why is kbuild-bot complaining about 7 year old code?  Anyway, the check
is wrong.  Was list_first_entry_or_null() intended?

a3c53be55c955b Andrew Lunn 2017-01-24  246  		return NULL;
a3c53be55c955b Andrew Lunn 2017-01-24  247  
a3c53be55c955b Andrew Lunn 2017-01-24  248  	return mdio_bus->bus;
a3c53be55c955b Andrew Lunn 2017-01-24  249  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

