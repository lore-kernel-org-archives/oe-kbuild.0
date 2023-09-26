Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490320F6
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695707402; x=1727243402;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=czI35JSLDa48UJfm92SpjRInIHElnVA91LRR4FJPlpw=;
  b=WFCnjPDPZT2ydqEe84gokj31t+Kafss4S9Nfvo7L/LQvRTFZCUH8zXES
   es8GFC++7wp7P7bHxfVnz2V0YgaELnukUnBdnITPr5KOV2qie5dF/JWOI
   dJ8+9RUTnMawvOVxk5BYLje0/49bgBi4vnJsUCbgCqpnA9dcJxqjb48Xk
   t2WMTYx6ii9KRtGnc/I2Z1lkwQPIrJ6+hAAxjoY9yceavzTqGxgkU7pkN
   Xa8cJChQ8atUvwr7/842cT3D2yoCT3otSau1nyJoNn8Aw3QgjLu6E9KKw
   w+q3etWDGyXpUvHIsuR98XrloojObyxFixMYn3udc1NPSQmpKh8dgRIF8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371824645"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="371824645"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 22:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748698757"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="748698757"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Sep 2023 22:50:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 22:50:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 22:50:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 22:50:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 22:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQKDJCicm/EMjtIstur2E00xPFrBJm/9dePNUztrQo0b0c8OZCkwS4boFSx16dwN+JAuHyhs0n+JS1NRGMZyxdfI13wUdEBQ9O5AfR36nwj3MV40IlgVkfbg9E5LGnOHLuVrpLg/vT3FzTymZJAoCmTHClXYkd7TouHKdcylA/XJA4Vu8gXgM0Oculz6fXjkgblkxii1yFk/wT5c9rp2Gqp6Zmp+TyJ0PTKtzY9Z6VecWVePsqMDTt9XjB/AR/v+XBjxKivDZLkXalh89M/M0I0oz0Qdb0Lkk1r7GRLCRlha0NnZ8wv9a9L32GOJW3VOpu76JDti+c0spKrrm1JBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLVGFvtjm0nitoKB8Lx8Z1h0m+vTo/14AhhF/u5BJHg=;
 b=P5XsRrKzZebVtl43x66gK8SULJ+tqeE/QIzkrly2wyvQVc6m7dTCj9TE9iPuekmma89A6zRGeBg1kEua/Y7mcE2oZv1KaftFZ6mZ8boWJtPedbxGon0wFgcKCkl7yCXLH+QGTFZDdl5RnfE5aKDkuLZTQxG6LbvM/t4Uxg2L8wGBVk4TtqZ7Z93ClrFR7sF6zwfA9vwcIt1bSTU/VSDBA5QaHAudiEOMDevtpsghT+OeUoGw5mNjFb43BokgMCivKlOzmn/RXrHfL8G3EcSURkVQT8alhSoM0jLj4IWQz0NeZ+wEJUcLWmngPqt2whDAi3ZY20eTnMtNPvA32GXEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 26 Sep
 2023 05:49:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 05:49:58 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v4 13/18] EDAC/synopsys: Introduce System/SDRAM address
 translation interface
Thread-Topic: [PATCH v4 13/18] EDAC/synopsys: Introduce System/SDRAM address
 translation interface
Thread-Index: AQHZ7rK3JI9E0x28ZEiWX6rXrTs/RbAsnEkQ
Date: Tue, 26 Sep 2023 05:49:58 +0000
Message-ID: <CY5PR11MB639253D8A73AF9221D22BB6DFBC3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202309241453.RCKvoFI9-lkp@intel.com>
In-Reply-To: <202309241453.RCKvoFI9-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB8455:EE_
x-ms-office365-filtering-correlation-id: 1321a855-4e9a-46e3-46b5-08dbbe546b00
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sA5beU+IX3MXHPi/f09Xs/BJng2yd9MxILoMtxelpcDNfhVn938o1qGfQLjEWhngsv5qEVA2wp23Pe1R7HYfwDsowSBH/KTrhCIonQIJ/wTGDtwbP0gcngYcYRjujLRH/nGvwIZuIDDAssrLl7D0oi8+xP9ksnBF/8PJsjOW47RP3xhu1L1jT/1t3oCIm23cqtoRoNP1/bG/cWdBUCJeGEvmxo8QRU79vsX6GgzwgEFhABCyG0pFr/GBC1vx2jaI7rzTx0785NMKkCDSraptjjPCKAGqT9lEFDuNMbi9Kd2ten0mFk1C4mth3iYrOsTJlrj9macD2t799r/slcr0HUA3pRqtfqPGoar8omuc+1Rh0cjGyGGw0bNAlJkiCbApe6JirP0ELg++p232TR0LzvoN/CnaxodOBrvU0bD69tyEjJhwR6J5RtAIiMy1OJEdm+2TxiiGqZz+EU2Boo2dr+4ZCzOt/uA1HQh6l5rD9+K/L/zmAAjIn5QLkiU+igTE4PqqV8W96MiIzpV1hv5B62yUBVt3TepzZYlYwPaTYjQjEoYUi+ZK/vq2eyLAOHuZw/xMNMiEfjsIGuYyCKLA62eHPcMZhK20WExnX9+SaehW885bBqyLf3XGQAgkmszUAFjXqssReWjSsZG5rDKO3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(136003)(346002)(366004)(230922051799003)(186009)(1800799009)(451199024)(83380400001)(966005)(71200400001)(478600001)(86362001)(2906002)(9686003)(76116006)(26005)(82960400001)(7696005)(66476007)(33656002)(316002)(55016003)(66556008)(64756008)(6506007)(53546011)(110136005)(41300700001)(52536014)(66446008)(122000001)(66946007)(8936002)(5660300002)(38070700005)(38100700002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W6z8kwzEiBMhPnHM7+fwFaAd4VRFX+eEQzuvhhfC9hZ8itWKQ4bZsfU+4qjT?=
 =?us-ascii?Q?kesVeQUH4wvbCMhUrezx6TbY+JGUQ3YxIs2ZykkzR7EM0W1cYaSH7O+plqBv?=
 =?us-ascii?Q?42VtIINs0Pwdd5qKq7cSM3OcpukKYGjOCun3vRlZoICB96ZTTfzBQhE08Kh0?=
 =?us-ascii?Q?o+PLNNOxK6EVnWJqlXn+tUPt/Oo7yDfAkcDpdYInpKRSiuUvnOb6hxbvN63p?=
 =?us-ascii?Q?LmFzTtGISCHm87VzzjdlG028aZt3Gnl098Q9SzVMbBTlRh4g+s4ogSJN/8Rp?=
 =?us-ascii?Q?niI7YL7osDw4tgjOr9KrWdgLnv6+fvoM4ObgsITR83dbg8qfDBWCe3cXBQ4q?=
 =?us-ascii?Q?JTz4YpVjlX05i2qYMXFBz567N/iARtu/cXDt62Q/MhZGP+Lux6XtstQ6kJ4Q?=
 =?us-ascii?Q?zVM6mTJLCcv0NwR+J0q0QTgNMKA9jIfvP7heRTnqWQufET8JZSl+wK90kzWL?=
 =?us-ascii?Q?+uWke6IUMAvgpnLnaj/PCd6kh/CNmL/nhkbEOmz0+8+AMTxzkO+1B8QAICR7?=
 =?us-ascii?Q?cuWyQuytZp1N1btiAoL7EqjvJ/V79YX9blCseAfa2bN8XDfUyplbCUZ1Y8n1?=
 =?us-ascii?Q?JgslARTo1Yc6G8HvIb4IiVR0Oz6eb80/hwLidGjd9s10IOim2ELY6BQWBYev?=
 =?us-ascii?Q?KRjGknx18xEm4Jk1GvdswtKcDiGX9j5CnGnYZoVBLh4SS8zY+2y6hM6fhCRL?=
 =?us-ascii?Q?IjSz8Jx1hGO/qkUvueJJx90bH9kKGGIVAWAm4tVA2ySgcQ1JvQAGKOruU7rH?=
 =?us-ascii?Q?fekmcWe5khXi1yTM4MaTUExgXWp+EAnihxQFf+PPVU/phxhO4JP7r+UQoDjK?=
 =?us-ascii?Q?YbdXDSK4wcby6NnFolA9N+mGLoPCpm0b8DyKr6llVK00RZPwVnF62yxt+OXU?=
 =?us-ascii?Q?g/mDLlqu6zr+OPvt5E+TOr3e26GIPwNIXv405bamXTlwzVy2KL3B/LnNQQY3?=
 =?us-ascii?Q?3z5iBkclU7WUuZONcbE3FgncJoZeDNmhqt5utZi0hwBGkNCd0nMp+QF8eiTb?=
 =?us-ascii?Q?sepsMJq0FUw/nEyC+s/DJer/v5/5u6hHylQCEnmx/wzhKoW5OstU86bcaOn+?=
 =?us-ascii?Q?WmTRtip/+aSOn9DDqBVMV8sxGheCEU9PhQivCqzeLoSSBQzkjirovVrEIE10?=
 =?us-ascii?Q?sgBGT08Hljvh9fGTVBwEQ9JIvcIdh0hz/N9KWCY8gIf8ookRPj/toFD3hJAc?=
 =?us-ascii?Q?KM7EtETpQRILTNVnCXM+3UnTTpu9BV0a+hZbIxCl4OzasgFkJjNyaKY/DooX?=
 =?us-ascii?Q?3eTe+yMCu6FlH7FPsXKxukajKg0wfVwhB8FofGDHKR07pYnSvmXYz2R7SAAh?=
 =?us-ascii?Q?FP4WfmYgUDivpRysehDb0KEfwLx5ZtQWXsyf4AKWZoNGN8dKt6S88k5XqOuD?=
 =?us-ascii?Q?Ew526Cwzfd2coi39qSRkrvOSauuArlUZ/dZxvtvccM/bcaUIrkHfZBamDqZU?=
 =?us-ascii?Q?s9hFhOa0EAHshggo8mnxG7Hj5Ln4VfZIFVZ2S54Q9g4CUL8yUkkZF9eSylyN?=
 =?us-ascii?Q?Dq0FDif+s88pYEfXLtOxRPJhyz9DmxByWRXX6nCcO0WlzoIiXgx+BsnohTtj?=
 =?us-ascii?Q?MQNcCjLcjv1+A7BL3AAgCVe+uNGeMqBMR05KhsYk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1321a855-4e9a-46e3-46b5-08dbbe546b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 05:49:58.4323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWDZQRTsYB5Zsb8UdhncKKGaPuHPz9e1qbx11AOQygZ466ATTppsMFX4sKQCS19TAXNwRXXi6xfEY7aNnvcZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
X-OriginatorOrg: intel.com

not_report

This one is strange. Function snps_map_sys_to_sdram is defined at line 645 =
and used at line 1725 of drivers/edac/synopsys_edac.c
Not sure why it produces a " defined but not used" warning.

636 /**
 637  * snps_map_sys_to_sdram - Map System address to SDRAM address.
 638  * @priv:       DDR memory controller private instance data.
 639  * @sys:        System address (source).
 640  * @sdram:      SDRAM address (destination).
 641  *
 642  * Perform a full mapping of the system address (detected on the contr=
oller
 643  * ports) to the SDRAM address tuple row/column/bank/etc.
 644  */
 645 static void snps_map_sys_to_sdram(struct snps_edac_priv *priv,
 646                                   dma_addr_t sys, struct snps_sdram_ad=
dr *sdram)
 647 {
 648         u64 app, hif;
 649
 650         snps_map_sys_to_app(priv, sys, &app);
 651
 652         snps_map_app_to_hif(priv, app, &hif);
 653
 654         snps_map_hif_to_sdram(priv, hif, sdram);
 655 }

1713 /**
1714  * snps_data_poison_setup - Update poison registers.
1715  * @priv:               DDR memory controller private instance data.
1716  *
1717  * Update poison registers as per DDR mapping.
1718  * Return: none.
1719  */
1720 static void snps_data_poison_setup(struct snps_edac_priv *priv)
1721 {
1722         struct snps_sdram_addr sdram;
1723         u32 regval;
1724
1725         snps_map_sys_to_sdram(priv, priv->poison_addr, &sdram);   <--
1726
1727         regval =3D FIELD_PREP(ECC_POISON0_RANK_MASK, sdram.rank) |
1728                  FIELD_PREP(ECC_POISON0_COL_MASK, sdram.col);
1729         writel(regval, priv->baseaddr + ECC_POISON0_OFST);
1730
1731         regval =3D FIELD_PREP(ECC_POISON1_BANKGRP_MASK, sdram.bankgrp)=
 |
1732                  FIELD_PREP(ECC_POISON1_BANK_MASK, sdram.bank) |
1733                  FIELD_PREP(ECC_POISON1_ROW_MASK, sdram.row);
1734         writel(regval, priv->baseaddr + ECC_POISON1_OFST);
1735 }

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, September 24, 2023 14:44
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v4 13/18] EDAC/synopsys: Introduce System/SDRAM address=
 translation interface

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920192806.29960-14-fancer.lancer@gmail.com>
References: <20230920192806.29960-14-fancer.lancer@gmail.com>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Michal Simek <monstr@monstr.eu>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Tony Luck <tony.luck@intel.com>
TO: James Morse <james.morse@arm.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Robert Richter <rric@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-edac@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Serge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[cannot apply to xilinx-xlnx/master bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/EDAC-syn=
opsys-Convert-sysfs-nodes-to-debugfs-ones/20230921-035302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-fo=
r-next
patch link:    https://lore.kernel.org/r/20230920192806.29960-14-fancer.lan=
cer%40gmail.com
patch subject: [PATCH v4 13/18] EDAC/synopsys: Introduce System/SDRAM addre=
ss translation interface
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-003-20230924 (https://download.01.org/0day-ci/arch=
ive/20230924/202309241453.RCKvoFI9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230924/202309241453.RCKvoFI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309241453.RCKvoFI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:482:13: warning: 'snps_map_sys_to_sdram' de=
fined but not used [-Wunused-function]
     482 | static void snps_map_sys_to_sdram(struct snps_edac_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/snps_map_sys_to_sdram +482 drivers/edac/synopsys_edac.c

07abea90e8d373 Serge Semin 2023-09-20  472 =20
07abea90e8d373 Serge Semin 2023-09-20  473  /**
07abea90e8d373 Serge Semin 2023-09-20  474   * snps_map_sys_to_sdram - Map =
System address to SDRAM address.
07abea90e8d373 Serge Semin 2023-09-20  475   * @priv:	DDR memory controller=
 private instance data.
07abea90e8d373 Serge Semin 2023-09-20  476   * @sys:	System address (source=
).
07abea90e8d373 Serge Semin 2023-09-20  477   * @sdram:	SDRAM address (desti=
nation).
07abea90e8d373 Serge Semin 2023-09-20  478   *
07abea90e8d373 Serge Semin 2023-09-20  479   * Perform a full mapping of th=
e system address (detected on the controller
07abea90e8d373 Serge Semin 2023-09-20  480   * ports) to the SDRAM address =
tuple row/column/bank/etc.
07abea90e8d373 Serge Semin 2023-09-20  481   */
07abea90e8d373 Serge Semin 2023-09-20 @482  static void snps_map_sys_to_sdr=
am(struct snps_edac_priv *priv,
07abea90e8d373 Serge Semin 2023-09-20  483  				  dma_addr_t sys, struct sn=
ps_sdram_addr *sdram)
07abea90e8d373 Serge Semin 2023-09-20  484  {
07abea90e8d373 Serge Semin 2023-09-20  485  	u64 app, hif;
07abea90e8d373 Serge Semin 2023-09-20  486 =20
07abea90e8d373 Serge Semin 2023-09-20  487  	app =3D sys;
07abea90e8d373 Serge Semin 2023-09-20  488 =20
07abea90e8d373 Serge Semin 2023-09-20  489  	snps_map_app_to_hif(priv, app,=
 &hif);
07abea90e8d373 Serge Semin 2023-09-20  490 =20
07abea90e8d373 Serge Semin 2023-09-20  491  	snps_map_hif_to_sdram(priv, hi=
f, sdram);
07abea90e8d373 Serge Semin 2023-09-20  492  }
07abea90e8d373 Serge Semin 2023-09-20  493 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

