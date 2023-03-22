Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305F15BA
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679457500; x=1710993500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x97eE0YRjmxrHhPhz7uKvPq5eIjnB9IIlmN3TiOkp2c=;
  b=UI22IB6ANKDkYVnwjSL9U1If5s7TQNPShdn5JlwwIGzmuktRtgykS6kg
   1KXcanCqqr6pUF3DYPEqXyv+xac4XvE0dILyG7doewKPBnqzAftWY2Eyy
   bve4DMm/WH1U1g3JJUI91Rh6Y8vMbYTK+9g36zlsDdUCWGup60ogmeIvP
   xPGQEIPW5mrKb7TfmOUFhHt3Wbjkgoypi6OxO26hAqWbOhywAEvVYWUWw
   4vZDPP3dkMG7r7pe05tnNuAr27UV+/gwWXQbLb1DYT5ckCPzjRF01NIim
   7pt2KuQOHsvQ5swWmOnQTfKMNl0a/EInq+/NG9ThHt7IV70VcJEwbThWe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337846124"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="337846124"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770901496"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="770901496"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 20:58:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pepc7-000Cqa-0D;
	Wed, 22 Mar 2023 03:58:15 +0000
Date: Wed, 22 Mar 2023 11:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next] net: phy: micrel: Add support for PTP_PF_EXTTS
 for lan8841
Message-ID: <202303221128.KLPNcDLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230321115541.4187912-1-horatiu.vultur@microchip.com>
References: <20230321115541.4187912-1-horatiu.vultur@microchip.com>
TO: Horatiu Vultur <horatiu.vultur@microchip.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: andrew@lunn.ch
CC: hkallweit1@gmail.com
CC: linux@armlinux.org.uk
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: richardcochran@gmail.com
CC: Horatiu Vultur <horatiu.vultur@microchip.com>

Hi Horatiu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Horatiu-Vultur/net-phy-micrel-Add-support-for-PTP_PF_EXTTS-for-lan8841/20230321-195743
patch link:    https://lore.kernel.org/r/20230321115541.4187912-1-horatiu.vultur%40microchip.com
patch subject: [PATCH net-next] net: phy: micrel: Add support for PTP_PF_EXTTS for lan8841
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230322/202303221128.KLPNcDLt-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303221128.KLPNcDLt-lkp@intel.com/

New smatch warnings:
drivers/net/phy/micrel.c:3480 lan8841_gpio_process_cap() warn: impossible condition '(tmp < 0) => (0-u16max < 0)'

Old smatch warnings:
drivers/net/phy/micrel.c:1683 ksz9x31_cable_test_get_status() error: uninitialized symbol 'ret'.

vim +3480 drivers/net/phy/micrel.c

25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3466  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3467  static void lan8841_gpio_process_cap(struct kszphy_ptp_priv *ptp_priv)
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3468  {
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3469  	struct phy_device *phydev = ptp_priv->phydev;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3470  	struct ptp_clock_event ptp_event = {0};
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3471  	s32 sec, nsec;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3472  	int pin, ret;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3473  	u16 tmp;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3474  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3475  	pin = ptp_find_pin_unlocked(ptp_priv->ptp_clock, PTP_PF_EXTTS, 0);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3476  	if (pin == -1)
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3477  		return;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3478  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3479  	tmp = phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_CAP_STS);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21 @3480  	if (tmp < 0)
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3481  		return;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3482  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3483  	ret = phy_write_mmd(phydev, 2, LAN8841_PTP_GPIO_SEL,
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3484  			    LAN8841_PTP_GPIO_SEL_GPIO_SEL(pin));
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3485  	if (ret)
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3486  		return;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3487  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3488  	mutex_lock(&ptp_priv->ptp_lock);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3489  	if (tmp & BIT(pin)) {
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3490  		sec = phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_RE_LTC_SEC_HI_CAP);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3491  		sec <<= 16;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3492  		sec |= phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_RE_LTC_SEC_LO_CAP);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3493  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3494  		nsec = phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_RE_LTC_NS_HI_CAP) & 0x3fff;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3495  		nsec <<= 16;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3496  		nsec |= phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_RE_LTC_NS_LO_CAP);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3497  	} else {
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3498  		sec = phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_FE_LTC_SEC_HI_CAP);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3499  		sec <<= 16;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3500  		sec |= phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_FE_LTC_SEC_LO_CAP);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3501  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3502  		nsec = phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_FE_LTC_NS_HI_CAP) & 0x3fff;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3503  		nsec <<= 16;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3504  		nsec |= phy_read_mmd(phydev, 2, LAN8841_PTP_GPIO_FE_LTC_NS_LO_CAP);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3505  	}
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3506  	mutex_unlock(&ptp_priv->ptp_lock);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3507  	ret = phy_write_mmd(phydev, 2, LAN8841_PTP_GPIO_SEL, 0);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3508  	if (ret)
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3509  		return;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3510  
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3511  	ptp_event.index = 0;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3512  	ptp_event.timestamp = ktime_set(sec, nsec);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3513  	ptp_event.type = PTP_CLOCK_EXTTS;
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3514  	ptp_clock_event(ptp_priv->ptp_clock, &ptp_event);
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3515  }
25cbf94843ee0b7 Horatiu Vultur 2023-03-21  3516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
