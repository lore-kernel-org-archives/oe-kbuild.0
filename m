Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244A155A53
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714082902; cv=none; b=Y1uoUHzIBLFlj5h+NBfKCoH1iuW6//nPA24QZAHpgRNxXgfvJPoqRo4cvxqwhWkZy4idooTapYy14aSq+YEOlkmQGOGRtQZXdfwg5RhmSB34VPQPxTQ4dISRir/WYmcy+65eJUy5kjill0vxlp7divIbwPRjRyqbJp3o1P/0ZJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714082902; c=relaxed/simple;
	bh=RCF4sGADzbSDCV/PWCrkrVHm92ZuRQEAQEuswBTkXh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gS3F+S//5U05LjuX6ReMOp+yJAmZ26sx7leYeuOp13pgmoMHC2a8uAzVlVB2vwqUhWkZXeFwtjnUirrkC6/N8tIk4oelYL7V/6eNqBUo/UE8AqWsjVAkPvra6pU2iFvQ1Qhf3d99CdRH4hBd6qX0arbjzaQDoTg52/PIekBzDjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcEB7Ebb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcEB7Ebb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714082900; x=1745618900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCF4sGADzbSDCV/PWCrkrVHm92ZuRQEAQEuswBTkXh4=;
  b=DcEB7EbbaLsCm0WuB8nM+4LKszb8960LA+nJHHqqDZqrNagwWAbHSxF0
   5ZcwcYg+DdPXmP2Pn5fSrBMS4+XP693IOFJ++A7Jz99RLB224GvyXbEIi
   qQJvj+C3XCJDH2aLRvtBRrhqMMBA5/vaPg1xOnXfwY7G4EDLvI+MxRAqZ
   yL9SAu9lITlfTobBTLRh5azXenzqHMJGXrfIoAE+XG/bj2JMdHJksqh70
   JjDWzLmjaMQdMD2UJTXCMHHBLIEdjWCMNh793HbEFK9MCUA9/AYmZ5kU8
   tpgdVVJxTUCnGNO8Rc9BUTbsLd7vbfBL6a7bPmFQ3qG6K5crEqMqTXqwU
   Q==;
X-CSE-ConnectionGUID: JakIKTpoQ5WF0MyHQdyxGw==
X-CSE-MsgGUID: x8sggJsKSZGmNAqHSUOCEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13585658"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="13585658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 15:08:19 -0700
X-CSE-ConnectionGUID: XLSPLDwvTOyeLc00E8Jczw==
X-CSE-MsgGUID: /qt8z9LZS9m+tjp3BUCJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25185253"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2024 15:08:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s07GJ-0002vU-1T;
	Thu, 25 Apr 2024 22:08:15 +0000
Date: Fri, 26 Apr 2024 06:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v1 4/4] net: stmmac: use delays reported by the
 PHY driver to correct MAC propagation delay
Message-ID: <202404260527.mBIbJOvC-lkp@intel.com>
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
In-Reply-To: <20240417164316.1755299-5-o.rempel@pengutronix.de>
References: <20240417164316.1755299-5-o.rempel@pengutronix.de>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Jose Abreu <joabreu@synopsys.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: Arun Ramadoss <arun.ramadoss@microchip.com>
TO: Richard Cochran <richardcochran@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: kernel@pengutronix.de
CC: linux-kernel@vger.kernel.org
CC: UNGLinuxDriver@microchip.com
CC: linux-stm32@st-md-mailman.stormreply.com

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-phy-Add-TimeSync-delay-query-support-to-PHYlib-API/20240418-004607
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240417164316.1755299-5-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v1 4/4] net: stmmac: use delays reported by the PHY driver to correct MAC propagation delay
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20240426 (https://download.01.org/0day-ci/archive/20240426/202404260527.mBIbJOvC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404260527.mBIbJOvC-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1110 stmmac_mac_link_up() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3801 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3801.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3801 stmmac_request_irq_multi_msi() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3801.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3801 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ce_irq' from request_irq() not released on lines: 3801.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3801 stmmac_request_irq_multi_msi() warn: 'priv->sfty_irq' from request_irq() not released on lines: 3801.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3801 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ue_irq' from request_irq() not released on lines: 3801.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3801 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3801.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3867 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3867.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3867 stmmac_request_irq_single() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3867.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3867 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3867.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5651 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5663 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5689 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

vim +/ERR_PTR +1110 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09   986  
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09   987  static void stmmac_mac_link_up(struct phylink_config *config,
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09   988  			       struct phy_device *phy,
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09   989  			       unsigned int mode, phy_interface_t interface,
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09   990  			       int speed, int duplex,
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09   991  			       bool tx_pause, bool rx_pause)
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14   992  {
74371272f97fd1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11   993  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
a3a57bf07de23f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Heiner Kallweit            2022-08-24   994  	u32 old_ctrl, ctrl;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14   995  
efe92571bfc30f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Bartosz Golaszewski        2023-07-10   996  	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
efe92571bfc30f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Bartosz Golaszewski        2023-07-10   997  	    priv->plat->serdes_powerup)
a46e9010124256 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Revanth Kumar Uppala       2022-12-01   998  		priv->plat->serdes_powerup(priv->dev, priv->plat->bsp_priv);
a46e9010124256 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Revanth Kumar Uppala       2022-12-01   999  
a3a57bf07de23f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Heiner Kallweit            2022-08-24  1000  	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
a3a57bf07de23f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Heiner Kallweit            2022-08-24  1001  	ctrl = old_ctrl & ~priv->hw->link.speed_mask;
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1002  
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09  1003  	if (interface == PHY_INTERFACE_MODE_USXGMII) {
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09  1004  		switch (speed) {
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1005  		case SPEED_10000:
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1006  			ctrl |= priv->hw->link.xgmii.speed10000;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1007  			break;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1008  		case SPEED_5000:
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1009  			ctrl |= priv->hw->link.xgmii.speed5000;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1010  			break;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1011  		case SPEED_2500:
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1012  			ctrl |= priv->hw->link.xgmii.speed2500;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1013  			break;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1014  		default:
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1015  			return;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1016  		}
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1017  	} else if (interface == PHY_INTERFACE_MODE_XLGMII) {
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1018  		switch (speed) {
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1019  		case SPEED_100000:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1020  			ctrl |= priv->hw->link.xlgmii.speed100000;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1021  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1022  		case SPEED_50000:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1023  			ctrl |= priv->hw->link.xlgmii.speed50000;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1024  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1025  		case SPEED_40000:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1026  			ctrl |= priv->hw->link.xlgmii.speed40000;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1027  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1028  		case SPEED_25000:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1029  			ctrl |= priv->hw->link.xlgmii.speed25000;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1030  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1031  		case SPEED_10000:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1032  			ctrl |= priv->hw->link.xgmii.speed10000;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1033  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1034  		case SPEED_2500:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1035  			ctrl |= priv->hw->link.speed2500;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1036  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1037  		case SPEED_1000:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1038  			ctrl |= priv->hw->link.speed1000;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1039  			break;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1040  		default:
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1041  			return;
8a880936e9025e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-17  1042  		}
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1043  	} else {
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09  1044  		switch (speed) {
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1045  		case SPEED_2500:
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1046  			ctrl |= priv->hw->link.speed2500;
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1047  			break;
afbe17a3ad38e1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-05-24  1048  		case SPEED_1000:
ca84dfb9ab7084 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-05-24  1049  			ctrl |= priv->hw->link.speed1000;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14  1050  			break;
afbe17a3ad38e1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-05-24  1051  		case SPEED_100:
ca84dfb9ab7084 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-05-24  1052  			ctrl |= priv->hw->link.speed100;
9beae261baab3f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-02-15  1053  			break;
afbe17a3ad38e1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-05-24  1054  		case SPEED_10:
ca84dfb9ab7084 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin             2017-05-24  1055  			ctrl |= priv->hw->link.speed10;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14  1056  			break;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14  1057  		default:
74371272f97fd1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1058  			return;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14  1059  		}
5b0d7d7da64b42 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1060  	}
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1061  
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09  1062  	priv->speed = speed;
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1063  
74371272f97fd1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1064  	if (priv->plat->fix_mac_speed)
1fc04a0b973392 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Shenwei Wang               2023-08-07  1065  		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro         2009-10-14  1066  
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09  1067  	if (!duplex)
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1068  		ctrl &= ~priv->hw->link.duplex;
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1069  	else
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1070  		ctrl |= priv->hw->link.duplex;
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1071  
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1072  	/* Flow Control operation */
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1073  	if (rx_pause && tx_pause)
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1074  		priv->flow_ctrl = FLOW_AUTO;
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1075  	else if (rx_pause && !tx_pause)
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1076  		priv->flow_ctrl = FLOW_RX;
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1077  	else if (!rx_pause && tx_pause)
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1078  		priv->flow_ctrl = FLOW_TX;
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1079  	else
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1080  		priv->flow_ctrl = FLOW_OFF;
cc3d2b5fc0d6f8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Goh, Wei Sheng             2022-11-23  1081  
46f69ded988d23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2020-03-09  1082  	stmmac_mac_flow_ctrl(priv, duplex);
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1083  
a3a57bf07de23f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Heiner Kallweit            2022-08-24  1084  	if (ctrl != old_ctrl)
ad01b7d480a4a1 drivers/net/stmmac/stmmac_main.c                  Giuseppe CAVALLARO         2010-08-23  1085  		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1086  
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1087  	stmmac_mac_set(priv, priv->ioaddr, true);
5b1117704d4c59 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-28  1088  	if (phy && priv->dma_cap.eee) {
54aa39a513dbf2 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Andrey Konovalov           2023-01-27  1089  		priv->eee_active =
743dd1db85f40b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Bartosz Golaszewski        2023-07-10  1090  			phy_init_eee(phy, !(priv->plat->flags &
743dd1db85f40b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Bartosz Golaszewski        2023-07-10  1091  				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
74371272f97fd1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1092  		priv->eee_enabled = stmmac_eee_init(priv);
388e201d41fa1e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Vineetha G. Jaya Kumaran   2020-10-01  1093  		priv->tx_lpi_enabled = priv->eee_enabled;
74371272f97fd1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1094  		stmmac_set_eee_pls(priv, priv->hw, true);
74371272f97fd1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1095  	}
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong             2021-03-24  1096  
63c173ff7aa3b5 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Mohammad Athari Bin Ismail 2021-03-26  1097  	if (priv->dma_cap.fpesel)
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong             2021-03-24  1098  		stmmac_fpe_link_state_handle(priv, true);
26cfb838aa002a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Johannes Zink              2023-08-01  1099  
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1100  	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY) {
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1101  		int ret = 0;
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1102  
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1103  		if (phy)
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1104  			ret = phy_get_timesync_data_path_delays(phy,
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1105  								&priv->phy_tx_delay_ns,
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1106  								&priv->phy_rx_delay_ns);
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1107  		if (!phy || ret) {
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1108  			if (ret != -EOPNOTSUPP)
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1109  				netdev_err(priv->dev, "Failed to get PHY delay: %pe\n",
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17 @1110  					   ERR_PTR(ret));
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1111  			priv->phy_tx_delay_ns = 0;
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1112  			priv->phy_rx_delay_ns = 0;
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1113  		}
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1114  
26cfb838aa002a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Johannes Zink              2023-08-01  1115  		stmmac_hwtstamp_correct_latency(priv, priv);
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1116  	}
aa187184434368 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Oleksij Rempel             2024-04-17  1117  }
9ad372fc5aaf12 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu                 2019-06-11  1118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
