Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284421362
	for <oe-kbuild@lists.linux.dev>; Sat,  4 May 2024 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714825125; cv=none; b=EyGTApTdi1uFAeMgeC9ssBdOjWNL4vjUaRDniCMvINty7uHKLhd+n/PcjkDr81gGPMjsR8nPDsjW70Dea5wdr4mKQIpmm54zkNUi9iNYXXX4BvvG2uwzrPZODH/Etp/ZG/8KttFxlZG1SylZDaXJlMgxoVhekM13m62cRyMkf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714825125; c=relaxed/simple;
	bh=KvX+tMQC35r8Zw36jjxi/3yW/6yDNWHuAjrkLFnobVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LvcDW5sAdCOpdixgsKoceFGiLCh48Y9I6qlrOwG30vxWq0QqxG97dlS2VVk2HHIcHaiFv0NOl3JvAqhWQipZLCSIqWmer7SLuNQ3/BLO4Y4e6mv8dYaQ8pJQAsrJVfO6Z0+d5OWghKO6v4y8VIDTTqxECb215o6CA/83h3uBHwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wO61j6al; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wO61j6al"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so6748861fa.2
        for <oe-kbuild@lists.linux.dev>; Sat, 04 May 2024 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714825121; x=1715429921; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z/7UJGubfMelKvbYDiZ/Mv2wY5bh+9xHKgfJKuvSMK4=;
        b=wO61j6al8fOkQpUAgMVtEr3ynhpgINdAcDNEH+3/mQY+oUQaY6WwKz4niuow114aXx
         vGvjvt/2vh0GJS6T/1OsJW26LussgudCYmg6ciE0mtNe9A53oQj7Mh5/rUv0oVDC4MBo
         RGWtmMkKtzqIZgsaxlu2M2rDbqGmY+cvufbfsq6fZjcS7M04y7T442FFUagsQs7C40mp
         jRDtM7mmeecO/9yAL1DbkgxB46dB6D/yYEYPKJr692gazg7CK7YvItaISQV9Zakw9oQ+
         hMrKSfWAqA1SGpMw1H/SisgW7ECo0mKyhY6G8mzwo3a5cwJK4cvaTiXzToNo9I+urzfm
         T+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825121; x=1715429921;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/7UJGubfMelKvbYDiZ/Mv2wY5bh+9xHKgfJKuvSMK4=;
        b=NIzp4yLyxiWw65n8JSWV+tdeKgCoQ+dfGKoC2l/otbUrWcQrIHgFXgt2CrisjiOyQC
         y9K7lkCj5lh3+B/sKQ/8K8UvBFnEl69VZ5EApGuVpChDNlpJFisSLvGBKldOdYAL064/
         0IW4v9UknVGWI0im7dATg+1fxXSYULFH53uOfwKOqAG+Gc5YG11GTZu3+CaMpznGfVdU
         CfcQ18Xd3sFR880UkSwjhDDmOJLKxcbAkqhhgP90YZnqtyIs7lFjztGJ2nvx/RKEabgx
         Cdb1KaLonA9poaMzjdS40/I1VwcFhR/G1AMaM9TK5+kFHponTAQe6OuYS/MdRBQ0+oiP
         g+2w==
X-Gm-Message-State: AOJu0YzlGJdOjvAANaDjnyprWA6QCn7vxRMJN1ByfgIuLvPZvAHgJil6
	KVrCJSCDmbhPfElrc4wtw7urgcKci+1LBJMnEaFg4j3FZrGEFlZ4ei83D090aY83OjuH3IdIgQU
	O
X-Google-Smtp-Source: AGHT+IEMl3/9+VdMxzxvYyxuTl4RsZq5GUNid+YtiRDPqktYL2gYS0YU1UFZkgLtuk9S3nLdXGTH9w==
X-Received: by 2002:a05:651c:201c:b0:2dd:c9fc:c472 with SMTP id s28-20020a05651c201c00b002ddc9fcc472mr3128640ljo.26.1714825121362;
        Sat, 04 May 2024 05:18:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y12-20020a5d614c000000b0034dd3849eeasm6105031wrt.106.2024.05.04.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:18:41 -0700 (PDT)
Date: Sat, 4 May 2024 15:18:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kamil =?iso-8859-1?Q?Hor=E1k?= - 2N <kamilh@axis.com>,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch,
	hkallweit1@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kamilh@axis.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] net: phy: bcm-phy-lib: Implement BroadR-Reach
 link modes
Message-ID: <586a9bc8-aa2a-4312-8936-a10f18e1f9ce@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503083719.899312-4-kamilh@axis.com>

Hi Kamil,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamil-Hor-k-2N/net-phy-bcm54811-New-link-mode-for-BroadR-Reach/20240503-164308
base:   net/main
patch link:    https://lore.kernel.org/r/20240503083719.899312-4-kamilh%40axis.com
patch subject: [PATCH v2 3/3] net: phy: bcm-phy-lib: Implement BroadR-Reach link modes
config: i386-randconfig-141-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041037.sjZak003-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405041037.sjZak003-lkp@intel.com/

smatch warnings:
drivers/net/phy/broadcom.c:627 bcm5481x_config_delay_swap() error: uninitialized symbol 'ret'.
drivers/net/phy/broadcom.c:1249 bcm_read_master_slave() error: uninitialized symbol 'cfg'.

vim +/ret +627 drivers/net/phy/broadcom.c

f1e9c8e593d6ea Kamil Horák - 2N 2024-05-03  611  static int bcm5481x_config_delay_swap(struct phy_device *phydev)
57bb7e222804c6 Anton Vorontsov  2008-03-04  612  {
b14995ac2527b4 Jon Mason        2016-11-04  613  	struct device_node *np = phydev->mdio.dev.of_node;
57bb7e222804c6 Anton Vorontsov  2008-03-04  614  	int ret;
57bb7e222804c6 Anton Vorontsov  2008-03-04  615  
f1e9c8e593d6ea Kamil Horák - 2N 2024-05-03  616  	/* Set up the delay. */
042cb56478152b Tao Ren          2018-11-05  617  	bcm54xx_config_clock_delay(phydev);
57bb7e222804c6 Anton Vorontsov  2008-03-04  618  
b14995ac2527b4 Jon Mason        2016-11-04  619  	if (of_property_read_bool(np, "enet-phy-lane-swap")) {
b14995ac2527b4 Jon Mason        2016-11-04  620  		/* Lane Swap - Undocumented register...magic! */
b14995ac2527b4 Jon Mason        2016-11-04  621  		ret = bcm_phy_write_exp(phydev, MII_BCM54XX_EXP_SEL_ER + 0x9,
b14995ac2527b4 Jon Mason        2016-11-04  622  					0x11B);
b14995ac2527b4 Jon Mason        2016-11-04  623  		if (ret < 0)
b14995ac2527b4 Jon Mason        2016-11-04  624  			return ret;
b14995ac2527b4 Jon Mason        2016-11-04  625  	}

"ret" not initialized on else path.

b14995ac2527b4 Jon Mason        2016-11-04  626  
57bb7e222804c6 Anton Vorontsov  2008-03-04 @627  	return ret;

Also "return 0;" is always better.

57bb7e222804c6 Anton Vorontsov  2008-03-04  628  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

