Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309277C;
	Wed, 15 Feb 2023 04:08:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l2so1136273wry.0;
        Tue, 14 Feb 2023 20:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbYV/tOuB/KDC+EnxXjUY1bm4sPegh904D5b8Vbt4oE=;
        b=g6LDaiZktRkvO1POArALxpSCljZ7PV6klnz500ptTGG2GPcc7e6PI2Cx83dpxsvq02
         IYWxN1pvuLgszkjDiFA2yEikPUugdfJwFsucW+gLLeOJuk/mWniBdS00o9D0rg9C0oLM
         /tjnQ7dy4MCg6rljYQ3JNbOB1zbPElPVcaPZOljfDpH+R54uGUu0e7aUP7mNR/RjSvOQ
         U7flTALd4oYNPzDEaCBbWceafiHBgK7ZJxo2kl5YE4Is+GpgUb+CTE223t/F6gyK9lUE
         jfMhLFkQdz85Ih9CvqCN2aTS7B093/I16lBG0ZR7QugDRN5Q18UUx/IB4M4wimWsKPR/
         meIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbYV/tOuB/KDC+EnxXjUY1bm4sPegh904D5b8Vbt4oE=;
        b=d8WXSVXIG/seQHStWIC9JCfkC1BOmwb1pjPkVZutOLbsInjchOHp1Ywdq9olHVZqtC
         mwLQ8KlnjMhUwqlx78HRPFdwb3xEIyIjzjzey1JuZprzUMAizYe3+YO8dqSinVSUhJys
         VvcEu9zgGQKlagp7phIi3bppkAVUSAHU31wl7Qw/f70W2BafPkY7JlHJi2YwRKXXNQDW
         OMDkOxRU5JQZz2ZyagKPBuBzKpvGXMiW4jccAyAIDqltYG4LIYveRqehXWKnVVcIzokQ
         G9xXLVBI2W3rTm3yVQlkhqQV+Kw0M+x0YX6yJy68GfwgZb9YHCWm/X0d66P9myedbTMy
         FKSA==
X-Gm-Message-State: AO0yUKWCUG4vnKJEqtuIWQg+gKL0Sw5/GHE7BquJztEMM7cqvQt2xBpX
	lnznb54YirultEJtl2p8HazXO3WUMEVmUA==
X-Google-Smtp-Source: AK7set/AsaJ/TWQSaZrLg0O9h+Ega8ySZdxRxwobeubJKG0BTChVzWUfd3+aUll0Oj+h79i3GsJ44A==
X-Received: by 2002:a05:6000:11c9:b0:2c4:b152:9ae with SMTP id i9-20020a05600011c900b002c4b15209aemr323989wrx.31.1676434082947;
        Tue, 14 Feb 2023 20:08:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm14277486wrr.69.2023.02.14.20.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 20:08:02 -0800 (PST)
Date: Wed, 15 Feb 2023 07:07:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12087/12724] drivers/net/phy/phy-c45.c:712
 genphy_c45_write_eee_adv() error: uninitialized symbol 'changed'.
Message-ID: <202302150232.q6idsV8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230215040759.EcEOTVHP2JjQnJvVgiPpdYoFcaSLHMYd9fdRDDYBZMc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 022c3f87f88e2d68e90be7687d981c9cb893a3b1 [12087/12724] net: phy: add genphy_c45_ethtool_get/set_eee() support
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150232.q6idsV8s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302150232.q6idsV8s-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy-c45.c:712 genphy_c45_write_eee_adv() error: uninitialized symbol 'changed'.

vim +/changed +712 drivers/net/phy/phy-c45.c

022c3f87f88e2d Oleksij Rempel 2023-02-11  669  int genphy_c45_write_eee_adv(struct phy_device *phydev, unsigned long *adv)
022c3f87f88e2d Oleksij Rempel 2023-02-11  670  {
022c3f87f88e2d Oleksij Rempel 2023-02-11  671  	int val, changed;

changed needs to be initialized to false.

022c3f87f88e2d Oleksij Rempel 2023-02-11  672  
022c3f87f88e2d Oleksij Rempel 2023-02-11  673  	if (linkmode_intersects(phydev->supported, PHY_EEE_CAP1_FEATURES)) {
022c3f87f88e2d Oleksij Rempel 2023-02-11  674  		val = linkmode_to_mii_eee_cap1_t(adv);
022c3f87f88e2d Oleksij Rempel 2023-02-11  675  
022c3f87f88e2d Oleksij Rempel 2023-02-11  676  		/* In eee_broken_modes are stored MDIO_AN_EEE_ADV specific raw
022c3f87f88e2d Oleksij Rempel 2023-02-11  677  		 * register values.
022c3f87f88e2d Oleksij Rempel 2023-02-11  678  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  679  		val &= ~phydev->eee_broken_modes;
022c3f87f88e2d Oleksij Rempel 2023-02-11  680  
022c3f87f88e2d Oleksij Rempel 2023-02-11  681  		/* IEEE 802.3-2018 45.2.7.13 EEE advertisement 1
022c3f87f88e2d Oleksij Rempel 2023-02-11  682  		 * (Register 7.60)
022c3f87f88e2d Oleksij Rempel 2023-02-11  683  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  684  		val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
022c3f87f88e2d Oleksij Rempel 2023-02-11  685  					     MDIO_AN_EEE_ADV,
022c3f87f88e2d Oleksij Rempel 2023-02-11  686  					     MDIO_EEE_100TX | MDIO_EEE_1000T |
022c3f87f88e2d Oleksij Rempel 2023-02-11  687  					     MDIO_EEE_10GT | MDIO_EEE_1000KX |
022c3f87f88e2d Oleksij Rempel 2023-02-11  688  					     MDIO_EEE_10GKX4 | MDIO_EEE_10GKR,
022c3f87f88e2d Oleksij Rempel 2023-02-11  689  					     val);
022c3f87f88e2d Oleksij Rempel 2023-02-11  690  		if (val < 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  691  			return val;
022c3f87f88e2d Oleksij Rempel 2023-02-11  692  		if (val > 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  693  			changed = 1;
022c3f87f88e2d Oleksij Rempel 2023-02-11  694  	}
022c3f87f88e2d Oleksij Rempel 2023-02-11  695  
022c3f87f88e2d Oleksij Rempel 2023-02-11  696  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT,
022c3f87f88e2d Oleksij Rempel 2023-02-11  697  			      phydev->supported_eee)) {
022c3f87f88e2d Oleksij Rempel 2023-02-11  698  		val = linkmode_adv_to_mii_10base_t1_t(adv);
022c3f87f88e2d Oleksij Rempel 2023-02-11  699  		/* IEEE 802.3cg-2019 45.2.7.25 10BASE-T1 AN control register
022c3f87f88e2d Oleksij Rempel 2023-02-11  700  		 * (Register 7.526)
022c3f87f88e2d Oleksij Rempel 2023-02-11  701  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  702  		val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
022c3f87f88e2d Oleksij Rempel 2023-02-11  703  					     MDIO_AN_10BT1_AN_CTRL,
022c3f87f88e2d Oleksij Rempel 2023-02-11  704  					     MDIO_AN_10BT1_AN_CTRL_ADV_EEE_T1L,
022c3f87f88e2d Oleksij Rempel 2023-02-11  705  					     val);
022c3f87f88e2d Oleksij Rempel 2023-02-11  706  		if (val < 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  707  			return val;
022c3f87f88e2d Oleksij Rempel 2023-02-11  708  		if (val > 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  709  			changed = 1;
022c3f87f88e2d Oleksij Rempel 2023-02-11  710  	}
022c3f87f88e2d Oleksij Rempel 2023-02-11  711  
022c3f87f88e2d Oleksij Rempel 2023-02-11 @712  	return changed;
022c3f87f88e2d Oleksij Rempel 2023-02-11  713  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

