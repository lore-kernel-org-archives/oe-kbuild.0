Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04F7E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 01:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7ieQd4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700099669; x=1731635669;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=N83VZ/IhtChWxVXqOD/GhKICbhb1t8cnsUEqzkmMTCI=;
  b=C7ieQd4sDYAAcjRBOpof1bSOymOhM6zIVp5vZ/Zffb9e8CyLr1k3P/Uy
   kBjfqOjhDuAj7tHqoqe5HTXqDJHxCDdtuftvjgDB2FTBMWj82fZFIzKyb
   a3Jrgpy81IaB157jEZdFd99Md7aYHhXZKj51kptAjt6M2Sa+C2dVaj8KU
   pvd0L7ji1OYeTdWPbyb8D807mIdVGN6GhMD7Eucc0lL1TDBQlPnUgJcrK
   1pfs4PXymWsNyVv7bYELmdxnLRMZR5QqtAH6r4vmjtQ9ZT+g/FgaXSPCp
   WHH9EvNu4Atq9fp0gI9g5+eplq3FhwGzV3aOG0gUlG3dF2xMf26eSvXey
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4119379"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4119379"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:54:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835584928"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="835584928"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 17:54:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:54:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:54:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 17:54:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 17:54:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sot95YISG+UbsZ8bmJXBIbWsNVvExOyt5bNkSQHpl5x/uZ3lbHolsoes1SBXZvJuYlnIWRUnUqjxO5cY9HI1t/3IyJTN4Mpfyc0ifR9sYHAb3Pt/CO5Q8foOKZwM5e5V+Fc91auH4gVSEG4SAt/kesOhtO/aUd80P4DqRdASjdGus1mjBq9Knu9AMyjjh5OKdpYc42fXcbqelGGXRYOH3u4BuoEKs46JP1nhNDFU/8sc7+JuyHG6HhgoQg+bWg2c5P2PTgS4rNl60cl6V87pS7X+rrOg2dAcTjkLDlGS6caPaG7P2NUMLI+9ByQDLI2j30bdirFCqCeokNqlBIJl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V46HfqwtSRkqELSFrfwvvmQYyNTesgnq8SvedDKV78w=;
 b=ZvL3wjLs6GYwAfxW6VAW9LzCfYCCLiYyBothRR5u9npWEFJ15f2S91e1XCvd1CCdAia8A1Ozn1ARqpNWEGesr2K9wyZH8/YAUGISydDZ16qdMIkr7+mYOKe1nWq2W2fL0VmziJb4pjwL0jZyXSCFlDIu9fMtKX/k7LZRsE93Nf6MPzZdfF6rLcMzbQuJ4gLl2aA9zluBgxdKptSBCkuv3H+jzX4tjs4zkOd8tL0aR5Iwq9fuWy0ULwZFTbs7BAX2DsXQX1v/Jsg1y036widPcyaboDbK82DC7Zl9kDrsuvOFVWZFzSOygYSM2UcVe1SKn6CAy4NMGqRb8O+GdnRvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 01:54:18 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 01:54:18 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: include/asm-generic/unaligned.h:119:16: sparse: sparse: cast
 truncates bits from constant value (aa01a0 becomes a0)
Thread-Topic: include/asm-generic/unaligned.h:119:16: sparse: sparse: cast
 truncates bits from constant value (aa01a0 becomes a0)
Thread-Index: AQHaF+sTQHC9z4JGSUqolAZoBY3YlbB8LK6A
Date: Thu, 16 Nov 2023 01:54:18 +0000
Message-ID: <CY5PR11MB63925EB7BA61AADCF0F58482FBB0A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311160124.gAKUkd4c-lkp@intel.com>
In-Reply-To: <202311160124.gAKUkd4c-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|IA1PR11MB7318:EE_
x-ms-office365-filtering-correlation-id: eb7b3795-e110-40d2-3525-08dbe646f1ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZHNeGJpXf4TUgLx9pr4Y5B9NsV97LrkXCAp/yC4r/oSa9N2mpblXoQDl8RCP6k9GcX0ExkbcUKx/Pgj/hB43AxuMQ4IZwN9lmVIJIY2bQ8O72pS4y1VJdbYH52jp4XxPkPNsH4f3dBA07WdiJCZnXvM2VgxVDdaLq7TX5afg0m+/ApPVezmIsuCdNYSWufASTTipxqYZ1HYDlSx8/j5+miKsr+h88tXC8LfjYhUBRejxsK7nBkv0jlPk4QrfO3/78NlOUGS5l/eDScOGLA8uQO9wTtREgBgLYwgmDLXKYDrkITf1vIK4Ed63yMSupwmqkkutP5DKgtCuPwSlmN2Ujgbthj+mTYbIcEAlt4flCistw2g97CGiepMrmSrvrLMleu+Bh8payLxP8pjLIMIEwGaUQH3mJEy4X54bDblnBRWnF7+Valtuxb0rKEjFBsvVawpfe+hxeNPixrbPiSIFbgWURcmCzMUAFB42dwprOfIomf0z+J6irKjGQB33t7anQBBjVozBtYixHEV9In7fvqejgq3V4m64W4YabHiElL11Yv26TqfEgaD6wdAK6psrvoa4ofj6HgZi2NdhxAx0xY4TdiH+qh7MN5mGCvqeHYgoYP23Yd/6n24HX4hIzfMzoRPluP/7B3d25QPVZ1/6bCG0m6LpcE00QW9P0hU9zwROiIND95MXLpPtt35jOZEgBuSMUqrAotT3dqDZXvMTUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799009)(64100799003)(186009)(33656002)(2906002)(8676002)(52536014)(66946007)(66446008)(8936002)(66476007)(76116006)(66556008)(86362001)(5660300002)(316002)(38070700009)(110136005)(41300700001)(64756008)(6506007)(83380400001)(966005)(478600001)(122000001)(9686003)(71200400001)(53546011)(26005)(38100700002)(55016003)(82960400001)(7696005)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ApSgBURMglMAb8jcpBJmepSplvYxYIRDLlTHIyJhBwxFdwxuKrFBkZN5lqjq?=
 =?us-ascii?Q?LgY5tgnWjhfBRr8ZBVtky1MPnKfO534c4SdfjPDqIRROtugugJfgy577HCUl?=
 =?us-ascii?Q?r7MXiolova6tUQU8Apmg0mM3RqNH3sVOUQV3wOm4AsjKrhfV2lB2U4uEbZIJ?=
 =?us-ascii?Q?+EUMFvWEwf+bcMzC1aamQIOgvcXll1oBlJU4EDY+7gNMiyoR5uyQSatTwaJi?=
 =?us-ascii?Q?Cus30UgYJ3hV2spZovTSKt/HaGlaE57Tu+Wwq7aoRNFbVt5MqwwI24+6LSO6?=
 =?us-ascii?Q?jM8wV0eJMHYDZDYa7NrjwGLkIjL5lkN2ETqnluk3hMXNKG4h+Q4wxEV/gdME?=
 =?us-ascii?Q?L3GVLVpyIHeV21iw/QlFKsEYNj4cy792STmmk/ERt0a48KwUcM5MtJ248da8?=
 =?us-ascii?Q?ngXCweeOuWgTPxAs/Uk+3UwvtD2VJI9zZPvZnzA/uh4Av8nresOi6e42Iwot?=
 =?us-ascii?Q?++O+U7Ljfm31HJG1JTP/J+FiszDlNMhm+8Ynwe6z5lxclzuQMEgKCf54LSLT?=
 =?us-ascii?Q?tfvf/W9Kl7EK+ytngGRoMdOxw+/HUh0RroKTGqZY1uvWxfvIq5tI6qrgzRAt?=
 =?us-ascii?Q?eVT+LyN/9MsMltxwi2p7fJwYnobXt1YcuAl9Ky4N6+o0n+MFpXxk3Fn96dj2?=
 =?us-ascii?Q?fv6rCrNxhM9MiKVtMl23UxtbnYqtPCNUuDokG7Nd4NKeBdYUKso8iUfiEKl9?=
 =?us-ascii?Q?T08ujxcXseMa9jYrpb62cfHnM0Km8kNmloF5vyey3GKIjCBwebewDOnVBYBt?=
 =?us-ascii?Q?3RY556X19aKdlFc/gexpBNlpQ4a3bRyfKVFjwdbLGaPUy91lvN1/cI3f0tkP?=
 =?us-ascii?Q?QwdHbrOK+R1NSa+Ags9bwqw9R5e6+LMb2heCrJnV30ksGE78MJzs/duQz39i?=
 =?us-ascii?Q?lOpLXGMHNwUIj34DCJ9ExT90drQS3iBkt0GRcI8Y5v7Xz5/RMCHy+By+1J9K?=
 =?us-ascii?Q?U764ZlFTlr9P43FkeEdXQ36y3NFOOtQ71kHMuVERfw7RbPv6o9ZFaND89TI5?=
 =?us-ascii?Q?OLOg8FR+53HCfO5g/lcaGsvD1Z+Y1mdhXAUDwhI2YHCX9FpKOBZQvOAASd17?=
 =?us-ascii?Q?BxaarFb4exHtq5mdvBe1JXoo3xtG3WbWls4Fm2DWnnYuFd2fwwh1zUlWcjO4?=
 =?us-ascii?Q?9EhgN0shUZcl6sA+zsamwkY3vC10v35X812N2XBHPI3+e9xXaDxGujW2hXl5?=
 =?us-ascii?Q?58Q7OX+FONH678u85YIvcSYUbVJJJS4dc0DdM7kuSNJfryO037un5ls2tBJn?=
 =?us-ascii?Q?QcrFQ4qnzWLpxgtYtdsT9ahwh2Hl9LyvkosJa292N8R6b2wKbKxH16jf32VK?=
 =?us-ascii?Q?ao7/wyJsGc7Ix2+v1vXHrzVf9+lGBPcdlsdvdz9DTTgUAanoHSRqUCXj5+yN?=
 =?us-ascii?Q?nH0WeeB/x+SGZv/ZjNCI+Wx8buF2OuuqsS9NKezlA1QskuqWHItDEkRQT5pC?=
 =?us-ascii?Q?2cNJau9alA7XvG6D5qDnVEun+azMuDNAFe+LSXczMhIXykUP5Oc7dJVgSuUe?=
 =?us-ascii?Q?Iz2OiPEnJPQ/t0ZScWKZL2UNHZCyTS9vmk0P5zFDu2RfzJrpzYfannhoaIJW?=
 =?us-ascii?Q?d022yS2zYpcLDCK0lQ5YQTi9Au2Pi8uGCddIhKL/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7b3795-e110-40d2-3525-08dbe646f1ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 01:54:18.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bff3I51GYBe1Ih374QsSBjIS2juMvSOaSHpqIsIxT5VnC5sc5bQAdBMSvQ/QAFuw/VEzXGyuqSdp1zBY1Kr5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
X-OriginatorOrg: intel.com

not_report

Looks like this is a case that sparse cannot handle very well. The sparse w=
arnings exactly show the function works well.

The function wishes to put a const into a 3 bytes low endian room, so it is=
 expected to truncate the bits in each step of assignment.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 01:41
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: include/asm-generic/unaligned.h:119:16: sparse: sparse: cast trunc=
ates bits from constant value (aa01a0 becomes a0)

::::::=20
:::::: Manual check reason: "fbc 66603243f5283f7f28c795f09e7c2167233df0bd a=
nd parent 86a7d13c9afaa6a223a0ef3234a75e4135e1f0bf have different kconfig"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 66603243f5283f7f28c795f09e7c2167233df0bd Input: add driver for Hyni=
tron cstxxx touchscreens
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/ar=
chive/20231116/202311160124.gAKUkd4c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231116/202311160124.gAKUkd4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160124.gAKUkd4c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/input/touchscreen/hynitron_cstxxx.c: note: in included file (thr=
ough arch/x86/include/generated/asm/unaligned.h):
>> include/asm-generic/unaligned.h:119:16: sparse: sparse: cast truncates b=
its from constant value (aa01a0 becomes a0)
   include/asm-generic/unaligned.h:120:20: sparse: sparse: cast truncates b=
its from constant value (aa01 becomes 1)
>> include/asm-generic/unaligned.h:119:16: sparse: sparse: cast truncates b=
its from constant value (ab00d0 becomes d0)
   include/asm-generic/unaligned.h:120:20: sparse: sparse: cast truncates b=
its from constant value (ab00 becomes 0)

vim +119 include/asm-generic/unaligned.h

803f4e1eab7a89 Arnd Bergmann 2021-05-08  116 =20
803f4e1eab7a89 Arnd Bergmann 2021-05-08  117  static inline void __put_unal=
igned_le24(const u32 val, u8 *p)
803f4e1eab7a89 Arnd Bergmann 2021-05-08  118  {
803f4e1eab7a89 Arnd Bergmann 2021-05-08 @119  	*p++ =3D val;
803f4e1eab7a89 Arnd Bergmann 2021-05-08  120  	*p++ =3D val >> 8;
803f4e1eab7a89 Arnd Bergmann 2021-05-08  121  	*p++ =3D val >> 16;
803f4e1eab7a89 Arnd Bergmann 2021-05-08  122  }
803f4e1eab7a89 Arnd Bergmann 2021-05-08  123 =20

:::::: The code at line 119 was first introduced by commit
:::::: 803f4e1eab7a8938ba3a3c30dd4eb5e9eeef5e63 asm-generic: simplify asm/u=
naligned.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

