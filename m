Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC166277023
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520109; cv=none; b=frRivQMVMQSbHNGxYTdpZzvobOB9MN/sSiakCVVOJxFfAqDUO3CdvPItNmhbZGBURooHl1kobCefoM3kQywY5rYAO79U/ktQKqraTifueZqSGGpjVcjv0r+oQ3lDQyQYHJFfwJHeplcMtKT/Ec5Ql/0tVvH+JYVzVudWiGzI3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520109; c=relaxed/simple;
	bh=VRc50o1TNkXkiKCdb7sYh/BGwOy7+sjpbKW7SRTKiiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NXsOLFYwgU3F4swXLDgLZ0CbSmroyWEuqrShhAsUwe32D+zygrfB58AcHwSrff7SBODasUQQ/TRJmrTPxLTGAvDsmzyv6bKKQmw7qEgHyLCfWQ/wsIKaSJYXLpmZTqJCsuDnFZR7MxrBmD3NxcBYwNLY1YcUdPumsTBkayj4oBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gGvIfRXI; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gGvIfRXI"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ef493de975so2629337fac.1
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520106; x=1753124906; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=;
        b=gGvIfRXI7vQ3bG4osaWYMhSiuROV3LWsFO0kFfecdZdXdG91k/MkpTXUDtYs9httnL
         KOFdPIrfXTs49vhlRfcLxTMBq3zEkB+YJz2Z2RwytKw3Ku9TKu0AXwcW712UMB3WkycX
         3NpJqfsFV85+X0cC9IQcYlXoKJEHFCVgBsL7s5AhTkv+sKp4YU2po5MDLfBB5DdZwzzX
         K+vpy4KEfZ5hul6HYt9/DWd29dvaSfVXCebUwLROxJkVLiJeKioTJhOSnoTZoraIaJB8
         9jZlymD1YOMSVfUu1vbCY7Kw0KadDEQuIoQn6aAZmM6MZQ5UeJ4X6eOFDxv3XesFpIFk
         6GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520106; x=1753124906;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=;
        b=El+sY5Yy/ynxVZu2qnhSrWQpPdCtL1XSlucOXk5AbjCUyKWjnJRTR0/tPInqQpC9OH
         4lE1EP3fn6oohESqPfe5zZBV2yRVvoBpWhYu4VjEXs1peuBhy+q6Fc+0TqByDsGUAFT0
         IXmI9l7fF27clPzUWjRL1Wgy1Tl3FMTJUHLX0WXTaFu4Nvs3IeKp3kTmSFluidK+HbcU
         chvXgoymlNmDVsRs2umBNpTPhkPcRV+ikKkBx6VRw82TUq8QnNkTlj6WjEbiOKOhEhF7
         JkkxvbKuxJEJF72RcBea8UjINkys5SgKWYj/Zgdam3kVpeek1EWeAvB8Ie/zXSoR2rGK
         880Q==
X-Gm-Message-State: AOJu0YyqTF++kbtssKq+wMkLnRpZAgnKIkCEhIYuHUtWx+ViIKVYXnSU
	Xq2LIzbxqioxapie2HJbbsaSii62V4BcvFKQhzHAJiiD9Mfad4ks9ladm4zkDK1LAwDXbkzq3ij
	Ce2uT
X-Gm-Gg: ASbGncvXIYyBeQ0VmRl9O3nsb+LUIetdBAbLDxr6mFPGYuQYFxF2T8/EfH4bPyLeW/9
	sWuuJeqgotPJj6nCLt2JDppzzrnJ7p3YMJlu3npjbMq8N5gf/Awn5jP1dgr7MlHqUHZjYKMdMrJ
	kNrj/pFB76wgOasXhBp/K8ILLI5Y6wzSCysN9skjDyHJrQ64RSf0/R4MjM0dHu3r4Etz1prIMyq
	6FMUbfjKANdtuBi1btPaII49ogsSQoRWLdBt/ScDUbv6H92CkprXkFH8lPrc0/EdCrSDJhVOFcR
	zTsRlOF6rKsOAQ4fyrgqEvpvcoOoIP6gwiJhfGUSiCdWvxjabl6SxM0QwIAQgFQRFIcxvLcmf9/
	HjCsW2AjW/3ZUmx//zz7dvFSMfB+IWA==
X-Google-Smtp-Source: AGHT+IEzO8bUgBmoo1uzE8f4f/z4iMC9jmOc9/Xzy7X6HZpF2LbcgnghTbE4rOCIVgXQl6Q0I/xJmw==
X-Received: by 2002:a05:6871:5d06:b0:2d5:b914:fe2d with SMTP id 586e51a60fabf-2ff270892c7mr10030939fac.33.1752520106283;
        Mon, 14 Jul 2025 12:08:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116dd664sm2036650fac.42.2025.07.14.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:08:25 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <13e48447-37fb-49d8-8c6a-ce5d198506ae@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630143315.250879-5-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250630-224035
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250630143315.250879-5-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports representation
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061812.0aBYBa9l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507061812.0aBYBa9l-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_port.c:130 phy_port_get_type() warn: bitwise AND condition is false here

vim +130 drivers/net/phy/phy_port.c

055cbf51317b1e Maxime Chevallier 2025-06-30  122  /**
055cbf51317b1e Maxime Chevallier 2025-06-30  123   * phy_port_get_type() - get the PORT_* attribut for that port.
055cbf51317b1e Maxime Chevallier 2025-06-30  124   * @port: The port we want the information from
055cbf51317b1e Maxime Chevallier 2025-06-30  125   *
055cbf51317b1e Maxime Chevallier 2025-06-30  126   * Returns: A PORT_XXX value.
055cbf51317b1e Maxime Chevallier 2025-06-30  127   */
055cbf51317b1e Maxime Chevallier 2025-06-30  128  int phy_port_get_type(struct phy_port *port)
055cbf51317b1e Maxime Chevallier 2025-06-30  129  {
055cbf51317b1e Maxime Chevallier 2025-06-30 @130  	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^
I think BIT(ETHTOOL_LINK_MEDIUM_BASET) was intended.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

