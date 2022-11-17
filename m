Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE53EB06;
	Thu, 17 Nov 2022 04:12:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v1so1308123wrt.11;
        Wed, 16 Nov 2022 20:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gM3PtvPAdYS2cL7GwLPhGFEGDIfhNGK5xW1YKSqAlqI=;
        b=i7enR9MnStHWDiFeKdWX5LPhsTsRCxiq4GaJlWfecj34xt3cMfTeP5VYwZDz6BN8Go
         zSiJFITJaa8RhwWFtQbjfwImn4uf4edOeMNSxLLCSf1EtIL4u35IqKUBrTFIo0HbgjJj
         p3HKVQCzMGWvF4CtF4c3CIWbYkQ0oySnBoxQWk9ZxHEkcFJxPhS1M4x93CDzXFEVhLDG
         E0IDec710zT71gTUlNXEJtC21QZ/Kc1MPeTw8rfEY4tgiP88EEcnq1kxDl73Xkc19tqy
         MZsOGkrFHml4Z7oJevYDpGdpPyip1H8o9zhTT9dLDs9EcOUbH2k+3NCtNufvFbPPQRPL
         p9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM3PtvPAdYS2cL7GwLPhGFEGDIfhNGK5xW1YKSqAlqI=;
        b=IMf/fAJc/B+wicYUyiS1TThY+CfJDvjTPHiWVbsHXEgp0yFuYCpAlV+uR54xbdZIfp
         Gzz+dAxLApe6ZbW7x8XEzC3d8u8GLvyWdLayZ/UUYFM23YfJi3kvPxTL6vSEiuPUdj23
         7BCLjAgJPigUlR6Kf18FV55sh7SPD2wo8GWO1IlkH2y0JyyKGo3qkm00hvIsf0S21sd6
         ZMIzEEQq22HVU/DMI0dZvcsxmeNWJHcMAAQd56tDScKOrJocJZIj50orlJgFCRZiK2GG
         2mIOWrtIs4glVxqe7//XfINU11cb/frqQBEpAmfd24kjwJoy+lwFBn/eMOzIeK+izSUM
         WYwQ==
X-Gm-Message-State: ANoB5pmZWKzKrs5lVFx6Y/kHTklvhyN+SbC7PTu+FNW42VKHXQGmPenp
	zt3jHlvgkEA7KArYiILi6fsZG7RlPbq+9g==
X-Google-Smtp-Source: AA0mqf5mLvMwgquR9ICuNaOBwEssOw9+IVyuu28bZWGtGGVsZmBYcoFOd5y45nQljfNsNCS87F7iLg==
X-Received: by 2002:adf:d84c:0:b0:236:6f1a:955 with SMTP id k12-20020adfd84c000000b002366f1a0955mr283056wrl.111.1668658346920;
        Wed, 16 Nov 2022 20:12:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d54cb000000b002415dd45320sm16479931wrv.112.2022.11.16.20.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 20:12:26 -0800 (PST)
Date: Thu, 17 Nov 2022 07:12:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Liu Peibao <liupeibao@loongson.cn>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, chenhuacai@loongson.cn,
	lvjianmin@loongson.cn, zhuyinbo@loongson.cn, liupeibao@loongson.cn,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: loongson: add skip-scan property for child DT
 node
Message-ID: <202211160131.oycRMuJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103090040.836-1-liupeibao@loongson.cn>
Message-ID: <20221117041224.PvjxGMDTbr08USoqrpgPkL_GRxJJpfK05oci0aa2VIE@z>

Hi Liu,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Peibao/PCI-loongson-add-skip-scan-property-for-child-DT-node/20221103-170125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
patch link:    https://lore.kernel.org/r/20221103090040.836-1-liupeibao%40loongson.cn
patch subject: [PATCH 1/2] PCI: loongson: add skip-scan property for child DT node
config: loongarch-randconfig-m041-20221114
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/pci/controller/pci-loongson.c:257 setup_masklist() error: not allocating enough for = 'entry' 24 vs 8

vim +/entry +257 drivers/pci/controller/pci-loongson.c

f93e71fb8e65ba Liu Peibao  2022-11-03  242  static int setup_masklist(struct loongson_pci *priv)
f93e71fb8e65ba Liu Peibao  2022-11-03  243  {
f93e71fb8e65ba Liu Peibao  2022-11-03  244  	struct device *dev = &priv->pdev->dev;
f93e71fb8e65ba Liu Peibao  2022-11-03  245  	struct device_node *dn, *parent = dev->of_node;
f93e71fb8e65ba Liu Peibao  2022-11-03  246  	struct mask_entry *entry;
f93e71fb8e65ba Liu Peibao  2022-11-03  247  	int devfn;
f93e71fb8e65ba Liu Peibao  2022-11-03  248  
f93e71fb8e65ba Liu Peibao  2022-11-03  249  	INIT_LIST_HEAD(&priv->masklist);
f93e71fb8e65ba Liu Peibao  2022-11-03  250  
f93e71fb8e65ba Liu Peibao  2022-11-03  251  	for_each_child_of_node(parent, dn) {
f93e71fb8e65ba Liu Peibao  2022-11-03  252  		if (of_property_read_bool(dn, "skip-scan")) {
f93e71fb8e65ba Liu Peibao  2022-11-03  253  			devfn = of_pci_get_devfn(dn);
f93e71fb8e65ba Liu Peibao  2022-11-03  254  			if (devfn < 0)
f93e71fb8e65ba Liu Peibao  2022-11-03  255  				continue;
f93e71fb8e65ba Liu Peibao  2022-11-03  256  
f93e71fb8e65ba Liu Peibao  2022-11-03 @257  			entry = devm_kzalloc(dev, sizeof(entry), GFP_KERNEL);
                                                                                          ^^^^^^^^^^^^^
Should be sizeof(*entry)

f93e71fb8e65ba Liu Peibao  2022-11-03  258  			if (!entry)
f93e71fb8e65ba Liu Peibao  2022-11-03  259  				return -ENOMEM;
f93e71fb8e65ba Liu Peibao  2022-11-03  260  
f93e71fb8e65ba Liu Peibao  2022-11-03  261  			entry->devfn = devfn;
f93e71fb8e65ba Liu Peibao  2022-11-03  262  			list_add_tail(&entry->entry, &priv->masklist);
f93e71fb8e65ba Liu Peibao  2022-11-03  263  		}
f93e71fb8e65ba Liu Peibao  2022-11-03  264  	}
f93e71fb8e65ba Liu Peibao  2022-11-03  265  
f93e71fb8e65ba Liu Peibao  2022-11-03  266  	return 0;
f93e71fb8e65ba Liu Peibao  2022-11-03  267  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

