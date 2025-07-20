Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAEB221267
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Jul 2025 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753034965; cv=none; b=RQWRIypqtK4olHeFxoxAWBzbTya4hYGU1MGLtneyrXP66XM1vfQvRFg7Tvbdr9DeQi+b8+OC9y44NjIU45K/ayVUJi4ILRVdmiwNi7kKPPd60zmc5uUD1GzvdpAGLcSRBD4DMd823zqoPLq0vbWdR6D5+2kOz2Rvb86QI6EN16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753034965; c=relaxed/simple;
	bh=UgZW6E0tLXAqWBAe6bcg+nwvBZBAbFq/jebf70i9ZUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=p7jl6bmXhLYYSld2VS/vVYTsZkOzZ63gy3SDAQdZIhkiShTdG+Vi/+JqUwhtSbu/3ettxPmxbtZvh7YaiEV31UwUFngYv1pYkdKzzTcjIk/cmTyqUBsXxKvXr9USffMdNVIotxR9qxzFLf4zSLNqQ6dU9JrIdmVexz3WnGrAeJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIVNXeX9; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIVNXeX9"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73e64e87d49so2161914a34.2
        for <oe-kbuild@lists.linux.dev>; Sun, 20 Jul 2025 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753034962; x=1753639762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3oeyMWOovcd12lQ3ZXa1ZAZl9gHnEtbWVtsJw7zMa0=;
        b=qIVNXeX9E0NvEzKfrTPLH5sFjLlRYh1gfXXF26PO50ZRt/HSHxAhFCerQQs1teEJMQ
         hPDAtQxPMUvOQXqWEOeos9IdeMwp6MMjwcxSEJufPTn6fbLGSZViVPw4v+tH/Dd4LU6U
         OYIZpM4yExeNTCy2VqmwzoVpGZCkN4HvI2o+aqofiuthiWiP7JkM6BSe2V2xj9+SNTdD
         z2vuUX/bN6AXQ49B2POy711iVpHOs+7qfS1q41Dy0jM6htg5InupLTGN/AyYYCunXwqD
         jZa/jL8cy7JQQSb1BqQrt6X/VNfFSc7zyMgW0Z1wgCE8kS1gjJIuuAL8AXUr45fkYYQ1
         GUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753034962; x=1753639762;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3oeyMWOovcd12lQ3ZXa1ZAZl9gHnEtbWVtsJw7zMa0=;
        b=PDNSuzuh7ok9hmpoDyv34sa9lbw6u6t1x0UKmZzNa47qarERLIwSLcDzKaQqfuz1hi
         IFpMHPDPfhMZFTi2mw2G3mlVhkSeBAudRVY/Sj0e1bFB8OaBKhJCogzIYsVZBiToZt6P
         VcCDU06BhtaUNox1pOBRV/K5gaSqupCbQNypunLuoV0akseD4l6Rfox+NwN65OgDZrl3
         /YIOxcKUcqnm/QKTGb6HlpntCOKlGukAE/DqGERyF4WCQ3Z3A8fQr6Qwp/mOpBNOBiMi
         boG1VgSKpinIF3/L3YOb+WnlGum5S2FqLFlzd23faIr9KcMGfbwaT/qTxmKs6PXHgdWR
         /Ctw==
X-Gm-Message-State: AOJu0YyFAvNmE0bmdvSEE3ZD3f7+xWUb5+AcmX7FTP8W5o+J0QqeFP3O
	+UOrd+WMGz7wIBj1mcsgoZq0Hr/JmummyArp1D6Zg9hSu/glsqXX91ftnqXRKrnYtB1t1RPK38/
	GVfcVSsk=
X-Gm-Gg: ASbGnctG98Ubh2d9nwDx1F0wyIR9gIauvg0ztkQhR1ssP69JAfMARw0jOlL9FXv/Seq
	apI4sI0DUgqWClp6oGfrM6Sqw5iRME5BVQzUixljsGPuU5WvwQVMKGxCtDMymiQ93y5slTM8sha
	Hi1ZA3U81KJKWe9wkbwW/KXm6E1oqlfOTMyQnjxxXr+YeUUcs58CDyvM01qbY+VH7nsMwPLhhls
	6Td/DzObmtyzPiDduZKvcnkMDD+8zaiTqt9ygKP+rqDL5+u8TEKnqSH2e1N6SRNrdNyb+NQ1BAI
	jLU0XlZCiQwa09pG8Sikc/aL2LOXamRzlQmr1GwQG/y/pL/y8eaItIQfOkIPTIS9P1P2/ivUhjo
	8PeRVOJIwjPY=
X-Google-Smtp-Source: AGHT+IHHMh2QyThIYM4S4Cqp/W3F21cycCG2+rVI38EbTeuflkBmq2oUSER3ansMmmQBq36/pIa9XQ==
X-Received: by 2002:a05:6830:6484:b0:73e:9ee1:3d63 with SMTP id 46e09a7af769-73e9ee144b3mr2213384a34.9.1753034962320;
        Sun, 20 Jul 2025 11:09:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8a7edab2sm1927659a34.40.2025.07.20.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:09:21 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:09:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Abid Ali <dev.nuvorolabs@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abid Ali <dev.nuvorolabs@gmail.com>
Subject: Re: [PATCH] net: phy: Fix premature resume by a PHY driver
Message-ID: <47495a5b-a3e5-44da-993d-5a7d3c19bd5c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-phy_resume-v1-1-9c6b59580bee@gmail.com>

Hi Abid,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Abid-Ali/net-phy-Fix-premature-resume-by-a-PHY-driver/20250718-234858
base:   347e9f5043c89695b01e66b3ed111755afcf1911
patch link:    https://lore.kernel.org/r/20250718-phy_resume-v1-1-9c6b59580bee%40gmail.com
patch subject: [PATCH] net: phy: Fix premature resume by a PHY driver
config: sparc-randconfig-r071-20250719 (https://download.01.org/0day-ci/archive/20250720/202507200229.iOChX4Rp-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507200229.iOChX4Rp-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_device.c:1852 __phy_resume() error: we previously assumed 'phydrv->resume' could be null (see line 1849)

vim +1852 drivers/net/phy/phy_device.c

9c2c2e62df3fa3 Andrew Lunn           2018-02-27  1842  int __phy_resume(struct phy_device *phydev)
481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1843  {
0bd199fd9c19aa Russell King (Oracle  2024-02-02  1844) 	const struct phy_driver *phydrv = phydev->drv;
8a8f8281e7e7a8 Heiner Kallweit       2020-03-26  1845  	int ret;
481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1846  
e6e918d4eb93f4 Heiner Kallweit       2021-01-06  1847  	lockdep_assert_held(&phydev->lock);
f5e64032a799d4 Russell King          2017-12-12  1848  
9421d84b1b3e16 Abid Ali              2025-07-18 @1849  	if (!phydrv || !phydrv->resume && phydev->suspended)
                                                                       ^^^^^^^^^^^^^^^
This checks for if the resume pointer is NULL, but if the resume is
NULL but suspend is also NULL.  I'm surprised that the compiler allows
us to write that comparison without adding parenthesis.  I thought that
it would complain about && having higher precedence.

8a8f8281e7e7a8 Heiner Kallweit       2020-03-26  1850  		return 0;
8a477a6fb6a336 Florian Fainelli      2015-01-26  1851  
8a8f8281e7e7a8 Heiner Kallweit       2020-03-26 @1852  	ret = phydrv->resume(phydev);
                                                              ^^^^^^^^^^^^^^
Then this will crash.

8a8f8281e7e7a8 Heiner Kallweit       2020-03-26  1853  	if (!ret)
8a477a6fb6a336 Florian Fainelli      2015-01-26  1854  		phydev->suspended = false;
8a477a6fb6a336 Florian Fainelli      2015-01-26  1855  
8a477a6fb6a336 Florian Fainelli      2015-01-26  1856  	return ret;
481b5d938b4a60 Sebastian Hesselbarth 2013-12-13  1857  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

