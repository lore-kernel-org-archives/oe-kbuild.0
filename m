Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64324FBFF
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHw2Igay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700209335; x=1731745335;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=G4EDbeNBr+J0OF8AP0N3MMyKcR2D4/nhuYPWbZ3VtPc=;
  b=KHw2Igay/R4wT0vzV6hogOia0M057DB8sVPaLrOnsw7bM44zVV8gLFuN
   7JopoKq+yG0G2R+kpuLQqbZf3VGt35KY9QZdzlTcVyEuXkraAsy6z4ky0
   +0qZhKWS1CObV5PTdCG8jOGZP+EOnMlpJbDKl9a7szrGrJLqRep27JSE0
   UBE6ZvDu0V1tzZyVav/duViTxgqpD3Y09nPS2eF0g/e6pJG2lll50/9fW
   D9XBpUZcSVdILPp/Ru9UVsANfeeNXMXjk9OqzA8TCFTtKddyeXYtqL5vo
   t0z3gbj2lF1F7kLy32wbqLs0y/w6+UG+nilcp9ZAQsdUGrA/QwlU2gDhv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376308154"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="376308154"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 00:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="759102312"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="759102312"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2023 00:22:14 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 00:22:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 00:22:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 00:22:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCI63d4vSr1wViSpzQRjvle8g9KtBi6f/chxL2MBWzKA6AOFjyDWqSra3eGMe6th/KhfD+P+VsWIJOHPy0LUl6iiOUbHKlEMNvTUGkCpoZEknaecWecyjuNFz0JuP9aRjjihYEUt6lw6VZJevUo4Zxpg3Lum0Q85WmoScT1fx1ZG+JDFX4Ijw1+MM+sAV7gQCQvWPTlhIhLA1Uvb+ETfmrcUS71TTRJWYv3wzXACxOvjC6KpOUO1JzXBEmRO/XS0uFPnmNge5lHDive47VDz7yEzJPnP5jmrybHaU4SeXu0jkqtbmlYLNS7BkzfTUJ93aIPQh/hw2bHLGQ5QbO+mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkkkCqqOnjyIB5xWZoxSO0L3l0+rb0I1MwWJ64AyzGM=;
 b=Jdt7LSJfjvJFkmxMt9Mx6m3Ml2y3ipve44TPMN8qrlzXJhSZilzYxyxZFMRJvgpZEqjCT3Cje9bykyeT7ygyNkBEng878hg8ZX0mtzUEfXU2vGozNsD5DH2BRmmN517NJAfNDay9xX8K3o5uvRCzitq8iwI3jj+cOSPmy/XDNjFzrBbyccU0Y6nP73r3sgVpG29L+aghskJYkRh9ZT5VA5jEi1hTHz6wOedZO9XBnLoDZpgg+WyLWsFQASE0XpEwPht6rJ1Zlzm0wI7VJCsauCVzRmVEB/jeXoyAYqAgteUgsCA/09hw5uKaQNpwRZwaeOee6OaJNuHIZ0PF2a2LYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL1PR11MB5527.namprd11.prod.outlook.com (2603:10b6:208:317::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:22:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 08:22:11 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Thread-Topic: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Thread-Index: AQHaGFLnvJ/geg0wdkmTMZ5Ao362rLB+LY/Q
Date: Fri, 17 Nov 2023 08:22:10 +0000
Message-ID: <CY5PR11MB63927C1B75D42E7D359E3340FBB7A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311161334.K9mAPyUO-lkp@intel.com>
In-Reply-To: <202311161334.K9mAPyUO-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|BL1PR11MB5527:EE_
x-ms-office365-filtering-correlation-id: 7d370ff4-d065-46be-fbbf-08dbe7464be9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ymJ/wcxssOYhUjrBATAM2jzPUQili/eVDNWJIImtlX8BxtdWzsr4MvlXIpzp73NhA5sNKJiBvYrCMulRrfscptt/QoLSNQa2V+mqwqhbmDOgy7tJM08ir2xvF3xUWS4G0CPWA99tIv6zqHq141dVUtxherWDfkucWG6nMu2jXkD/cIPeyHmJkRIMJcewGO3MGeggPXSM6hVrRG4H6JQLgcpMaBlaQR7RvFiS7yPtJTIrjV3zztJzI0yGW6nRFfVXI9+ZrsSHMmPU1oaJgNODe3vzhOIEAlCWdFY/rqrructbDAtFBQknLfUCGvk/0xaVPlARpchBMBV17Z1zI12njzkgZvQ/iZdpfXxyOXzn5LXpnN+i849wi4aLlPaJyPb8itGHsW0N4jmeYRCkARJT0+o6Q8GwGPExrsM/81ynxd9igRXu/E+fUhbGCh9KPacf3Yx6L473iLMKfPKGP4+hINwDGz9dKPyITWGkJNTCeB9m3Vei9tZdvJC0qTg/pM2055cU1XJQ+X9RQpjY7jlGS2/n4T14HQFFqU+3NkfLc7MtMMdC7H3l3ee3eLG7BmaDRS+fyf64bczs64NCt9fTk7Qcbajbw/g3hFSRIhbbi4lzVj4Vpu3e88uIE+fgMshRm1Qtls3AKPdnH07QsJ8F0FjbjxMLpFOiGvb53Z9h6dFBgkKnTHOluyFJ2POoKL+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82960400001)(9686003)(122000001)(6506007)(7696005)(53546011)(83380400001)(966005)(55016003)(478600001)(71200400001)(41300700001)(38100700002)(26005)(110136005)(64756008)(66946007)(86362001)(76116006)(66446008)(66476007)(316002)(66556008)(5660300002)(33656002)(38070700009)(8936002)(8676002)(2906002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sSnfeeREot+yrH1/Z6s04GeVmQiDyfa4qH481ggrB3jUVzHgFin3h3QuPpa+?=
 =?us-ascii?Q?Ye3ky1chfhJlMrpamAhdXtn1UOw00w9ZHhjvss3jeSee+CPCl+gpz77Hbrz4?=
 =?us-ascii?Q?YX7WaSzSgAATlKsm0xujDXvNWNS0GDGp++WScaxXF6hG1hauaE27TYplU4Sd?=
 =?us-ascii?Q?gcA3qnksqjTscU7eDygqu+hVtaNVoTDGuelXtpfKsmSV4YXTw7eN3IkGBN63?=
 =?us-ascii?Q?p1bWOfbJKD+EQqyxK/y2foU+82wawBYs6u57MmVD7UhjUcS7ZlDF64BJfjZi?=
 =?us-ascii?Q?wcRV1/Wf/DJ6OREtWEAymtDznoZ0Ykpwi8D7dTncBSfVxsWNs33+9RPbNVA4?=
 =?us-ascii?Q?5R74x9YxEpJap3oeV5HWpd8q3Pq2maZjnNhp7cDGmNa2NvttWXwVGFxW03Q/?=
 =?us-ascii?Q?i9PM5zobaV724hTacIuoqM8r/cpepD4LfTdxb4QflY/UzKhes/u2WjV7BjEd?=
 =?us-ascii?Q?ckehF476jibG33m5NmRhrH7BDYmstiTv6oKtLuonaEwYTE0/G3rMuHxjiLWT?=
 =?us-ascii?Q?RbgvC6PCrLqdO4peAo8smKlvqeRGBwh2g13HFiXlKiULRFGNK4vjEzMNQcG9?=
 =?us-ascii?Q?pn9CqxsiE7sJGMmOwL6g1nRmhnYy5sprFk8tO7G6ovbbXqT/7GrXkxMsmmve?=
 =?us-ascii?Q?o7fMGbe/kXORQVXtWMdy2/FcEe2UJOMooYbPo1AWUiKCvuxY4VKefRLo/Rfs?=
 =?us-ascii?Q?eQygfM/BtLkFSPYsLC1YdzrfuwMM1UVfsN5CxSas2WTAeP7zLQxuBCzTMVA8?=
 =?us-ascii?Q?hy7GNeCQJPwL/yHhq42ocOjspz8lhynpWML+rp8ow+ZuF8ZtyC/GozuEmSNO?=
 =?us-ascii?Q?dwGm9mTU1mEgI/9RI/6W340t9b5tV70M+xgmgLZ3ENiKAis6x629fkBJ4dEG?=
 =?us-ascii?Q?nYpVebF/X1sm+dsY4Wp6c9Ud8SKXTZSBZEEY3YDOSQnuuIScU54E+sKr8Q1N?=
 =?us-ascii?Q?ulgZC+AaTyCz+aFRv56+w7YR5Ct/6HDWXbkU4MGOL4nyLFttRTLjAoWoB6oG?=
 =?us-ascii?Q?Qax5d6v+6JEt6SQThp1AD1a444TylNGOUAR/T8UuOtBoXmG3YCriTijYnzcO?=
 =?us-ascii?Q?qxfURbxN/eiYtOGQa6g1z+Bzwb53PLu5EXETPOkesVwfa//1cpEhY9eE2Ia9?=
 =?us-ascii?Q?eYt8GIz4Glof96TwJgbsjsfvG7wQayF1EZtSC+N9HUPmr+inlI3sMByf3Lno?=
 =?us-ascii?Q?0fjbWjxVBjazEcSX3XeDQcl4tQZiw264kRh9GR1CDhqcwDETP6DCDp2Xf/qn?=
 =?us-ascii?Q?3chC9CMAYYtGngKE3pHu+dy29qumFlsIFKF1dQ5vbqvXnlyPjwRAI3fTZ0nj?=
 =?us-ascii?Q?Pg3MiudckuZSi8Jis1VqbALiPi/Onm+9Xs+RnKpE8fL5t0x+RKG356LGEljR?=
 =?us-ascii?Q?ljvUNFaMKXzVoYKN0x6gDIB+lp5QaLvAANrPSbamFWTt0Ng3AlTTgoU7Ti+5?=
 =?us-ascii?Q?Bl7OvVM5fOICFQPL/evWwIO9Gz/lv8LGhSEwZnHFcivWFOtDqeALUbOcTaS1?=
 =?us-ascii?Q?aYVaoeBG4R1HCbG1rBkRyyTj8KYn5i92MpVRxuED18CXnI1VUenEAh9nyKGk?=
 =?us-ascii?Q?9IJ9HPdKwyYj93zLQhM20JTI2WxmgMmCcWlX1QbP?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d370ff4-d065-46be-fbbf-08dbe7464be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 08:22:10.9937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+jCa9LwAh624YVaiz7fRvgtcoxPk41Tus/jCZ7kjcPIlAN0gshC78M5YUtp+NllRbxjYXtOwbhZx4+ME1U7cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5527
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202311161318.pH043qET-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 14:04
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive=
_uart_pm_ops' was not declared. Should it be static?

::::::=20
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is lin=
us!"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Hu <nick.hu@sifive.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Ben Dooks <ben.dooks@codethink.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 8a6498f2b94333f1793bc912b11830655f975470 serial: sifive: Add suspen=
d and resume operations
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/ar=
chive/20231116/202311161334.K9mAPyUO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231116/202311161334.K9mAPyUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161334.K9mAPyUO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive_uart_=
pm_ops' was not declared. Should it be static?

vim +/sifive_uart_pm_ops +1036 drivers/tty/serial/sifive.c

8a6498f2b94333 Nick Hu 2023-08-15  1035 =20
8a6498f2b94333 Nick Hu 2023-08-15 @1036  DEFINE_SIMPLE_DEV_PM_OPS(sifive_ua=
rt_pm_ops, sifive_serial_suspend,
8a6498f2b94333 Nick Hu 2023-08-15  1037  			 sifive_serial_resume);
8a6498f2b94333 Nick Hu 2023-08-15  1038 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

