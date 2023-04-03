Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD6364;
	Mon,  3 Apr 2023 05:06:09 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-17aeb49429eso29514464fac.6;
        Sun, 02 Apr 2023 22:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680498369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX/pPDCTZCz+AG0nfBsPg6tJiCJhJ51X8Wk4oxrCHIg=;
        b=CMtL+I3C1ExYIZCjiqwv9rYd2NUb7Wn/BapXZ0gs5OfHUIem4aKiaKzoz7Ie0g12PO
         4OggyvA5s3hwJ3KVMPmiUAxfCtHFlug7OR7PZcw7JopUz7zAHCiYctpknLkN2RaySGHl
         DMAKL9rEBa4Z8tzlJsiMHFCjFQpTypF0xzgloG7I/TQL5ugKGTx/qZJgip6DTQjdywLe
         USwn1agUrRgysnnvqsY6r35wI58cXjRmttiBP/Yg4FtoHVdFM70KMLyB4yPUSoAQ43k7
         GGlNmMtkxEATPI4XPAhccbxSvJ5xJeKmvHUrJEe+8x/oZO2LmSTZEEPotoS+Y/5FRaVV
         ISMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680498369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TX/pPDCTZCz+AG0nfBsPg6tJiCJhJ51X8Wk4oxrCHIg=;
        b=vAhY1OlNvXBH/IazHRu+b+AZOSFPmjVEv1Y1OeS2PqSYI5drQ+7P+3jxDXFkicjIZO
         0re2jnOrxO4RjbqNOk9b2o+spjDV+g0VO8/qbmVifoZmmFHMwJHwaFn0VTS3W2Kof3Na
         VHEcmuCf5tE0GruKh6TbruHd8ms9fmay3cVZub/ZboOOMfnEGHKIV1nlf9OsIK7DUddF
         zIMp3vzfdGURxwgKjLCtSMZD7etn9D1CetFdbuLDAczNdch+jSTpMe0xSqDbZGT+YP6S
         PAEM0lmM2eQ09Cqauy+lwgUUCHJs6aviTYOf4v9IUavGQGFQwYsDwiUJ1flfQvsl4GhE
         CaRg==
X-Gm-Message-State: AAQBX9euxJeDadhVPC49RvLsGizJGn5VqPUbWx6qnXFrb4QgYuhDpjo1
	5lcbP/IDHyfEwuvIJghVUKBryjyG0oYMl8P0BNA=
X-Google-Smtp-Source: AKy350aItUVPylW6imR32DS1QMVxsj8sMTSt/fb5O6UU2IfSZizAMCu6CU5azwG7yYv9CKyUuj1P/Eiefv56mLkW5fs=
X-Received: by 2002:a05:687c:10b:b0:177:b393:4007 with SMTP id
 ym11-20020a05687c010b00b00177b3934007mr11125983oab.0.1680498368771; Sun, 02
 Apr 2023 22:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303231145121987818@zte.com.cn> <22081108-565d-4608-97f7-6e40ca3df2b6@kili.mountain>
In-Reply-To: <22081108-565d-4608-97f7-6e40ca3df2b6@kili.mountain>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 3 Apr 2023 07:05:56 +0200
Message-ID: <CAMhs-H9m=ZGREMo_upE3M48sQb-WpU3j2_b2xLyO2mDkezxC9g@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, ye.xingchen@zte.com.cn, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 6:41=E2=80=AFAM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> Hi,
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-co=
m-cn/PCI-mt7621-Use-dev_err_probe/20230323-114623
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
> patch link:    https://lore.kernel.org/r/202303231145121987818%40zte.com.=
cn

So, I already replied to this proposed patch clearly saying that this
makes the rest of the code unreachable, so it is a clear NAK.
Why is this applied to the intel-lab-lkp tree? Just to be able to test
the changes?

Thanks,
    Sergio Paracuellos

> patch subject: [PATCH] PCI: mt7621: Use dev_err_probe()
> config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/ar=
chive/20230401/202304010325.2OPFvIm3-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202304010325.2OPFvIm3-lkp@intel.com/
>
> smatch warnings:
> drivers/pci/controller/pcie-mt7621.c:224 mt7621_pcie_parse_port() warn: p=
assing zero to 'PTR_ERR'
> drivers/pci/controller/pcie-mt7621.c:227 mt7621_pcie_parse_port() warn: i=
gnoring unreachable code.
>
> vim +/PTR_ERR +224 drivers/pci/controller/pcie-mt7621.c
>
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  198  static int mt7621_pcie_parse_port(struct mt7621_pcie *pci=
e,
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  199                                 struct device_node *node,
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  200                                 int slot)
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  201  {
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  202       struct mt7621_pcie_port *port;
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  203       struct device *dev =3D pcie->dev;
> fab6710e4c51f4 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-04-13  204       struct platform_device *pdev =3D to_platform_device(=
dev);
> 61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2019-01-04  205       char name[10];
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  206       int err;
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  207
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  208       port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL=
);
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  209       if (!port)
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  210               return -ENOMEM;
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  211
> 108b2f2a972454 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-11-23  212       port->base =3D devm_platform_ioremap_resource(pdev, =
slot + 1);
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  213       if (IS_ERR(port->base))
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  214               return PTR_ERR(port->base);
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  215
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  216       port->clk =3D devm_get_clk_from_child(dev, node, NUL=
L);
> cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-05-05  217       if (IS_ERR(port->clk)) {
> cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-05-05  218               dev_err(dev, "failed to get pcie%d clock\n",=
 slot);
> cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-05-05  219               return PTR_ERR(port->clk);
> cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-05-05  220       }
> cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-05-05  221
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  222       port->pcie_rst =3D of_reset_control_get_exclusive(no=
de, NULL);
> 9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen       =
 2023-03-23  223
> 9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen       =
 2023-03-23 @224       return dev_err_probe(dev, PTR_ERR(port->pcie_rst),
>                                                                          =
                                                 ^^^^^^^^^^^^^^^^^^^^^^^
>
> 9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen       =
 2023-03-23  225                            "failed to get pcie%d reset con=
trol\n", slot);
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  226
> 61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2019-01-04 @227       snprintf(name, sizeof(name), "pcie-phy%d", slot);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  228       port->phy =3D devm_of_phy_get(dev, node, name);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  229       if (IS_ERR(port->phy)) {
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  230               dev_err(dev, "failed to get pcie-phy%d\n", s=
lot);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  231               err =3D PTR_ERR(port->phy);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  232               goto remove_reset;
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  233       }
> 61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2019-01-04  234
> b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-03-13  235       port->gpio_rst =3D devm_gpiod_get_index_optional(dev=
, "reset", slot,
> b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-03-13  236                                                      GPIOD=
_OUT_LOW);
> 825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-03-20  237       if (IS_ERR(port->gpio_rst)) {
> 2bdd5238e756aa drivers/pci/controller/pcie-mt7621.c    Sergio Paracuellos=
 2021-09-22  238               dev_err(dev, "failed to get GPIO for PCIe%d\=
n", slot);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  239               err =3D PTR_ERR(port->gpio_rst);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  240               goto remove_reset;
> 825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-03-20  241       }
> b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2020-03-13  242
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  243       port->slot =3D slot;
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  244       port->pcie =3D pcie;
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  245
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  246       INIT_LIST_HEAD(&port->list);
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  247       list_add_tail(&port->list, &pcie->ports);
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  248
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  249       return 0;
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  250
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  251  remove_reset:
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  252       reset_control_put(port->pcie_rst);
> 2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2021-06-07  253       return err;
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  254  }
> ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos=
 2018-11-04  255
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>
