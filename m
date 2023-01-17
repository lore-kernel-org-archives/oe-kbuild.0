Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB433F1;
	Tue, 17 Jan 2023 20:30:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso335066wmb.0;
        Tue, 17 Jan 2023 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4AjmrbeLkRHl9VUwyGR8qAetWemt0qiCWTiRfwIoY0g=;
        b=ZxnZSWWVNS/IJBg+zqox+aaOnKaQzvheMFTpK3NxkVq1D7qs/gid+4UuTjbjJkuISr
         YadZM7pbfXUf9hO6QpoJLxdffPnAWQvFwtchHyBL8u9WSAYCIrYsMORVgFDhGd1EN+Fu
         /Dxj+67F6R5QJRmgZGoHIu7zClWs1Po/d+umcyY4D/adaE58onfTcEeTTA9ScHeidcJv
         U30yanjpmEmREdRtopDWn0gBdaHqXLTzSnZCJagJ8qFrGnxE8MyktQBJe0PWKkVoCp4i
         1a1oU+/9JRiE8KEtf48u5p0vXzgKRDopBSC8Om/whagLagFM9zeX8t9T1w2aqTkh5kjm
         W0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AjmrbeLkRHl9VUwyGR8qAetWemt0qiCWTiRfwIoY0g=;
        b=NlVo69eWKc2vlhX2epmkQA35E0RK2zt9+N/QNRlHPfeH/LQn90QnOJZ2EwFyLS+R+5
         nUfGLUQI/lB9KcHukVIB6wJhXA/ipTuJnbGdTROe5q4VXQckj1TtVz49lGQQzV0zc0x7
         Bx7hYhpfsvVobubJY5QJIRnAFT3APQehD89l0O5qwSmLmsydW2msUzPRyoeOLGZuncww
         laEMXsMlsLH0BHifY1WBaf7Wbn9EIeqZKeRJRXDAYiOskDJbGrYq+pKynHlJdO3NrAlp
         cIhRflEvYpmXKQ0eFUT3jRz52ojxOtfR28C7hPtnqfXh2DIQuDCiO+8gUEKeqfSe4X2N
         dgxQ==
X-Gm-Message-State: AFqh2kqmwsiY5N0kESSA3jb69046xwSzmVebtuLtyJEeu6FaDOan5DN+
	UEHQPGNe+wl+nJqnIBESahQo5thP83OPjw==
X-Google-Smtp-Source: AMrXdXsKCMb84vJQUWrxopvyY4qcAg1MqmN6wlig5WbPiP0IRwM6Ca8t6rATsygAPvHe81GmrBcDBQ==
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id az1-20020a05600c600100b003daf80a5e85mr4257919wmb.26.1673987446789;
        Tue, 17 Jan 2023 12:30:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c1d0e00b003da105437besm21934507wms.29.2023.01.17.12.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 12:30:46 -0800 (PST)
Date: Tue, 17 Jan 2023 23:30:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Pierluigi Passaro <pierluigi.passaro@gmail.com>, andrew@lunn.ch,
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, eran.m@variscite.com,
	nate.d@variscite.com, francesco.f@variscite.com,
	pierluigi.p@variscite.com
Subject: Re: [PATCH] net: mdio: force deassert MDIO reset signal
Message-ID: <202301180330.5rmOhXOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230115161006.16431-1-pierluigi.p@variscite.com>
Message-ID: <20230117203038.SJjjn9-W7SN6SsUIhqZNe__qjdEMbZQ57i-ba9fKIis@z>

Hi Pierluigi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierluigi-Passaro/net-mdio-force-deassert-MDIO-reset-signal/20230116-001044
patch link:    https://lore.kernel.org/r/20230115161006.16431-1-pierluigi.p%40variscite.com
patch subject: [PATCH] net: mdio: force deassert MDIO reset signal
config: xtensa-randconfig-m041-20230116
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/mdio/fwnode_mdio.c:144 fwnode_mdiobus_register_phy() warn: missing unwind goto?

vim +144 drivers/net/mdio/fwnode_mdio.c

bc1bee3b87ee48 Calvin Johnson    2021-06-11  114  int fwnode_mdiobus_register_phy(struct mii_bus *bus,
bc1bee3b87ee48 Calvin Johnson    2021-06-11  115  				struct fwnode_handle *child, u32 addr)
bc1bee3b87ee48 Calvin Johnson    2021-06-11  116  {
bc1bee3b87ee48 Calvin Johnson    2021-06-11  117  	struct mii_timestamper *mii_ts = NULL;
5e82147de1cbd7 Oleksij Rempel    2022-10-03  118  	struct pse_control *psec = NULL;
bc1bee3b87ee48 Calvin Johnson    2021-06-11  119  	struct phy_device *phy;
bc1bee3b87ee48 Calvin Johnson    2021-06-11  120  	bool is_c45 = false;
bc1bee3b87ee48 Calvin Johnson    2021-06-11  121  	u32 phy_id;
bc1bee3b87ee48 Calvin Johnson    2021-06-11  122  	int rc;
3f08f04af6947d Pierluigi Passaro 2023-01-15  123  	int reset_deassert_delay = 0;
3f08f04af6947d Pierluigi Passaro 2023-01-15  124  	struct gpio_desc *reset_gpio;
bc1bee3b87ee48 Calvin Johnson    2021-06-11  125  
5e82147de1cbd7 Oleksij Rempel    2022-10-03  126  	psec = fwnode_find_pse_control(child);
5e82147de1cbd7 Oleksij Rempel    2022-10-03  127  	if (IS_ERR(psec))
5e82147de1cbd7 Oleksij Rempel    2022-10-03  128  		return PTR_ERR(psec);
5e82147de1cbd7 Oleksij Rempel    2022-10-03  129  
bc1bee3b87ee48 Calvin Johnson    2021-06-11  130  	mii_ts = fwnode_find_mii_timestamper(child);
5e82147de1cbd7 Oleksij Rempel    2022-10-03  131  	if (IS_ERR(mii_ts)) {
5e82147de1cbd7 Oleksij Rempel    2022-10-03  132  		rc = PTR_ERR(mii_ts);
5e82147de1cbd7 Oleksij Rempel    2022-10-03  133  		goto clean_pse;
                                                                ^^^^^^^^^^^^^^^

5e82147de1cbd7 Oleksij Rempel    2022-10-03  134  	}
bc1bee3b87ee48 Calvin Johnson    2021-06-11  135  
bc1bee3b87ee48 Calvin Johnson    2021-06-11  136  	rc = fwnode_property_match_string(child, "compatible",
bc1bee3b87ee48 Calvin Johnson    2021-06-11  137  					  "ethernet-phy-ieee802.3-c45");
bc1bee3b87ee48 Calvin Johnson    2021-06-11  138  	if (rc >= 0)
bc1bee3b87ee48 Calvin Johnson    2021-06-11  139  		is_c45 = true;
bc1bee3b87ee48 Calvin Johnson    2021-06-11  140  
3f08f04af6947d Pierluigi Passaro 2023-01-15  141  	reset_gpio = fwnode_gpiod_get_index(child, "reset", 0, GPIOD_OUT_LOW, "PHY reset");
3f08f04af6947d Pierluigi Passaro 2023-01-15  142  	if (reset_gpio == ERR_PTR(-EPROBE_DEFER)) {
3f08f04af6947d Pierluigi Passaro 2023-01-15  143  		dev_dbg(&bus->dev, "reset signal for PHY@%u not ready\n", addr);
3f08f04af6947d Pierluigi Passaro 2023-01-15 @144  		return -EPROBE_DEFER;
                                                                ^^^^^^^^^^^^^^^^^^^^
Looks like there needs to be some clean up done before the return.
(Sometimes the kbuild-bot doesn't include the whole function in these
emails. I'm not sure what the rules are.).

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

