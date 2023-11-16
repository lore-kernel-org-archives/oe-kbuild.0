Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE02C2C0
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 05:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkG0CkTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700111558; x=1731647558;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=IUrciw/1POa739Zkh+R8fdDiS1PhCH4+RmVROV5M9Tg=;
  b=SkG0CkTLb4rTXfU/3r47g71eCwEJzzR+NxEnlN3TamN3shCnqKvSWVJ6
   DyxrJ68WkPcd9Xmn/N4H8VQQf3lm1vVx85diSQnTMGccpWZRdDDmn+NcO
   fRFwDYT/ZSd2CDNjM3tVNJTZwqo1+mEqYQFVL8LYFa9Xs0VP2cOh813Wm
   IOETa9KVSH/c1kvrZCCtCk3RUyLxg+MaTJGh+jDsHAGSXK846QyXQiO7v
   ZJh7YiC5LjgPVLMc5vH5l/+pIhYDxFmMeCpGyoDeEZCUeH11ZZ1u3Gys9
   mbUPIfl8YkeZvZfTpr/vKw13TfWNHASOAB9Lkjbw0q+zJYBSj1m/KlamP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4141204"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="4141204"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 21:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765197653"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="765197653"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 21:12:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 21:12:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 21:12:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 21:12:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 21:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hea3jqKQQl35FRHEiaRPokTfB58BOwT8PqzIFiNcZkh/z9mfjTiz0wAzvhOZ01fXK+6jgZwX9MgMNxoOagWuQmXQoHB1oSnLoStHlJd6dnE0Ja09eK4hnflMxGDvPMTX3agKjnhxbFTyeAKKQyru44Pytz0AIyFhcEBu24ymTQ9mMRMosgRYtIR0NSyrQZZZIzM13F0eQXt3WrkSVOaXLo2Cii3MXT5cCui5h7e1GCdxzyhUp7/I7cDQTkirhpGFIi8A2awv1TjDEJ6D3wWrdAqN04sEF6ebD/SuVLtBFOuNQr6Zmp1Absu7sNFpShySZLpoyFdASXOIZpjf9CAQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhowF6iQouNwn5k5aURkfMn6cRfcxpREmou5Giu3nuY=;
 b=mluRPsA93Ae0/I/nxLsxGy3RCDeITGuw5XQYIIsNlb6pha+vaE5aYMJSgAK/ZVn7Jsv1nluXBY48sciHQL9iJ0OqM2ACoiR98BqB0CeqD0pphnetRcG/H7Ku9c6WY5BepuzLMIgfA012UJVrRXHAsrBLoTSodEaYAckoxaPhEyO1/EK+dAUW5YtWTN5YUA03AuP1jSwUZgQ5w4vICktKu8kTourHWI7XRYafVROjyiKvov0MnwzbetYlkWoOHQTPJS3NAIoMPnFEKJ6nLh7iTsijTmsd6MF/iuiPTHVy9VRF3H/OJugLcAa15joE8zGJqNRcAtn/czPJO/4DT/SDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 05:12:34 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 05:12:34 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/tty/serial/uartlite.c:79: warning: Function parameter or
 member 'reg_ops' not described in 'uartlite_data'
Thread-Topic: drivers/tty/serial/uartlite.c:79: warning: Function parameter or
 member 'reg_ops' not described in 'uartlite_data'
Thread-Index: AQHaGDDJ8rCc5QMSIE2RdvtiDpAYL7B8Zk/w
Date: Thu, 16 Nov 2023 05:12:34 +0000
Message-ID: <CY5PR11MB63923BA3628B72A17DB405BDFBB0A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311160932.xnCx3dv2-lkp@intel.com>
In-Reply-To: <202311160932.xnCx3dv2-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY8PR11MB7730:EE_
x-ms-office365-filtering-correlation-id: 88a96fc4-3739-49f8-a58f-08dbe662a465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7MLlNe0pYWyFTPRg8mCvk8wvKlZse6am3bgikuyoG3p4l2heQ+TZhm9TU3ztEmYR21RcdYBYg2VjP37eWT88J5e3pfqPKs7IJnAlVr0sOj38Gx6C8hgdgekKAZfjsuiENpXFaAoaj+Zm7gc3JNPO4RwChtveF/mBMlATPbPV4QGAs4wyUsxcgW5jpwhVHsRKEgef+xG8IphLQbh4eQD9utQvAoDdTz8+vzQkZ9GSptt8SMZ8pPgAnhLw2NTgyvQ0v8AE8ykEF+M4gelFJKRb1qEqttB4KmlB/AYRhr7a5ggXX2tg+5KRmwdBUm/DAorsQoDa5S98JQatsNUTc44KBiPnjhM4ICillCtmT/DUSl2faMbH3CdQ2okY0gOXXa6pd7HeWaCMRklPJvS6OiCnJ3wvLVj/oyKrPfW/pJbJgRtM55rjj87addeUOZlPHufrQ+U85uR3lEuu3+VQ9ItU+EZv+Zl8up1t/r1M9d592GBCvGxR9cXVBOo3vUU6ix17Qy8vvnOUD7vLBWi9b+HQDHQw6POByRQD7jzsugyqEZS1RMZVMQmR4Mpn4mZ3UjftTAhU2gLokoDUio3Y5cAbNs3+o9UsDpQOF8AiT0Be+OjNRIoDusFFhlfgvv+xKEfVe6CIQGmDEoNys3xkiQ/2qDQzcTcTdu7gwSbS2thRGKlb0phIQknzogF42DFX8dzY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230273577357003)(230173577357003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(33656002)(41300700001)(38100700002)(966005)(76116006)(66446008)(110136005)(478600001)(66946007)(86362001)(64756008)(316002)(66476007)(66556008)(82960400001)(122000001)(52536014)(5660300002)(9686003)(2906002)(53546011)(6506007)(71200400001)(7696005)(26005)(8936002)(8676002)(83380400001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qEbGKhtiirnmLZd73ZP98togTas4bLjCPNo8SKFnUDY7NNnvoHKqsO0zOkGY?=
 =?us-ascii?Q?GyB7CuJc6jrAVKeRArm7P/pledEz4MDFvUaOyQog7PFjSH7suszsib04keAI?=
 =?us-ascii?Q?aYl82YOgiIwW8Ht59zeaXt7q+BMfMQJ6ZSicL7QI6Q9DMYHMVY86/54zlKAV?=
 =?us-ascii?Q?S34Tzva98iQBUGRTHtwGbgfBbBY8LPw4u9zWaD1tWqnJKx8okruQHxpdIUJI?=
 =?us-ascii?Q?t30sh3T7IpX7v1iNHSU02u6HBvdUEEiNDcDO+/p6fO+dHC2r3gQJZXEXnmeW?=
 =?us-ascii?Q?ULhADt7grc/kaAMy52y7gKDhnFO/PIWvwg3iuJpddK31lginUVfJhETMI3Z1?=
 =?us-ascii?Q?9sFXxbvzrCXHBB6xlw3gy0bm6/xhueESFSaNfo+F3FtLG0Cr3Q4pKA0BebdY?=
 =?us-ascii?Q?YHd3enREt8uHZIzvYVenjy3hP8XE1Dbah+rUdDEnyw3b+g/zrqFH0JzzvFDW?=
 =?us-ascii?Q?AX10YomWuvGYKKGZLVt02OcMbtjN+2KmGeLdeDXFXTgrUqpiIllmvkXgZCv0?=
 =?us-ascii?Q?gJcxD4oTvqND8euTz6eoJuT1/0VmbhH5GnJA4HCLrhn11SlNYapQlkqjwafg?=
 =?us-ascii?Q?sLj6ytAC73Yl5uFRB2ZrZKSGu6jicWrhginTHqs+/8U/Aa8rfy8lVX/lpmas?=
 =?us-ascii?Q?neG+y/pdjUKXgFKJfXZDWrGxDndZfN+Qjw2mV7w8upqifOy7k/SR9HfwvPyA?=
 =?us-ascii?Q?Yi5yrIAJ1biZF32E6AycdGxwuFARuCWcLBiW4jDACCNor2j60Ho7u4DUuKhv?=
 =?us-ascii?Q?ofim6kbsu55SFnZvL2kXDX9gRadoGTlmgTRk2G6DReVtk0dhzP7UYVdRCl1N?=
 =?us-ascii?Q?uCZhzpsD4+QTgx2Xsq9VXu3eorlg42WXcL2qWtX0vR/FZ6oFgxsUDkLxriBy?=
 =?us-ascii?Q?O+DB/wrnSV5IoSEOp5bYndyMqIADOeMvGXVn1Q77jN6bOSPrwopZOOwApa64?=
 =?us-ascii?Q?AkthaIo55oPIJm5WJCcJ4JyQAd78JB+WrW5YnUXPS4rKJY9064RNLZkwIXuR?=
 =?us-ascii?Q?a0zPjhWs9oGsQsTnRUJj/CdI/YjXO25QFYEnT+5y5+XjNNdENNPbonkSWQkl?=
 =?us-ascii?Q?8WLoHnVatE/SZECW2EEH/0PDGjytAsoCBhkuVNUcGiVsHtR3e8XgWKrE8kP4?=
 =?us-ascii?Q?IwlSmtisyCxMotDGko87gHALLtC8WYk1ZHBbHNCDU3V208JdhubmRFlQ6TYF?=
 =?us-ascii?Q?X7w2DUtsNss8cxvb3+WrMHdtsgqaYFDoaOD1XYlON008/cy/sE4NVNc/GsWc?=
 =?us-ascii?Q?XWLpClLNd+We9uiirBTbnMr5kx6UDT4iinS0bwH2XZdwOMRUpDMjp7VYlKXg?=
 =?us-ascii?Q?9ZpxvG/Tv2v+zbucFRYawnbllxt9SQt1nhQTFcW7IUrYB6rooeI9bTCBNbiA?=
 =?us-ascii?Q?frIWGZWdPYkhAYXmjtfAthrQAAMiOTkHROZZe2YGfrN1DluiD2xIufMdbRZK?=
 =?us-ascii?Q?14ctrAau4/2Q94PMIZ2Q+I4qhNNqe05g4AlRW06CQrY+4fx0LtBGFz5KGf56?=
 =?us-ascii?Q?nK36SVTIcEyj/DerPMmBwLS911uti93tX2kisu71mSMGI/mrfgnS8t1HUpUU?=
 =?us-ascii?Q?ChjGMUOCsxapwX+cOqpJgKVM3w5gG5qxOgssJWCk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a96fc4-3739-49f8-a58f-08dbe662a465
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 05:12:34.2362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwxkrpLrbipPz+gqM6eOumhgh0zoAhR/5PmTZmgVjDZ5wvtOlOsfJeNOoJ4qFzeArizCKS2kj1KO+VGhfnWGow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-OriginatorOrg: intel.com

not_report

duplicate report, already reported at https://lore.kernel.org/r/20231106105=
9.NUeUar9b-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 09:56
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/tty/serial/uartlite.c:79: warning: Function parameter or m=
ember 'reg_ops' not described in 'uartlite_data'

::::::=20
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is lin=
us!"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sean Anderson <sean.anderson@seco.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: ea017f5853e9a6a11cfa9bdc61ba823a1ed54ee8 tty: serial: uartlite: Pre=
vent changing fixed parameters
date:   2 years, 2 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 2 months ago
config: x86_64-randconfig-a001-20230604 (https://download.01.org/0day-ci/ar=
chive/20231116/202311160932.xnCx3dv2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231116/202311160932.xnCx3dv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160932.xnCx3dv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member =
'reg_ops' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member =
'clk' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member =
'baud' not described in 'uartlite_data'
>> drivers/tty/serial/uartlite.c:79: warning: Function parameter or member =
'cflags' not described in 'uartlite_data'


vim +79 drivers/tty/serial/uartlite.c

deeb33e8fdd8347 Shubhrajyoti Datta 2018-08-06  66 =20
ea017f5853e9a6a Sean Anderson      2021-08-26  67  /**
ea017f5853e9a6a Sean Anderson      2021-08-26  68   * struct uartlite_data:=
 Driver private data
ea017f5853e9a6a Sean Anderson      2021-08-26  69   * reg_ops: Functions to=
 read/write registers
ea017f5853e9a6a Sean Anderson      2021-08-26  70   * clk: Our parent clock=
, if present
ea017f5853e9a6a Sean Anderson      2021-08-26  71   * baud: The baud rate c=
onfigured when this device was synthesized
ea017f5853e9a6a Sean Anderson      2021-08-26  72   * cflags: The cflags fo=
r parity and data bits
ea017f5853e9a6a Sean Anderson      2021-08-26  73   */
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21  74  struct uartlite_data {
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21  75  	const struct uartlite_r=
eg_ops *reg_ops;
14288befeb572b4 Shubhrajyoti Datta 2018-07-21  76  	struct clk *clk;
ea017f5853e9a6a Sean Anderson      2021-08-26  77  	unsigned int baud;
ea017f5853e9a6a Sean Anderson      2021-08-26  78  	tcflag_t cflags;
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21 @79  };
da7bf20e7758042 Shubhrajyoti Datta 2018-07-21  80 =20

:::::: The code at line 79 was first introduced by commit
:::::: da7bf20e7758042eb3931ff68fc96bdfaf94d881 tty: serial: uartlite: Add =
structure for private data

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

