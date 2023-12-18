Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5263AC
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 02:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkWQBu8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702864940; x=1734400940;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=J1wNpBc/CxIOPrkJkEuZC474BPiNDxr8kIwuBHwBFRI=;
  b=kkWQBu8WMEM1QAuKXA56nord+L11OpdYnUVhKvYwefFjh/GrHeLzFCY3
   RubngJcMwn8ku4AC6IQ/4SleEgrDDMWdzUSNsEBDO+4q/uvp1yB5DWzgz
   xyVpH0llTFs31CyLJhRsmKnmnwcD/atgWYEVxGpA/RAFhL9+HQ5oEMhal
   dtf6bgjqzwdwnrPtsr8rlh90N0c9Pcjj5a5E3acS6KTNj0+yIpkuW43OH
   6w39dpXxtRI0UM2mYP9G+pCNUN+GoKMi3rjBXbrxTT+NKXs/k1115BoVc
   mbT+8QxUhaboItbRz3VIgvB1kh4BIq6dlgt4enSROA+rULhKVGKAEM7wL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="17000218"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="17000218"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 18:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845776778"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="845776778"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 18:02:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 18:02:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 18:02:18 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 18:02:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eknkqP+irZr3xmQnaN0ruHC5bg+hzf0+Euo5zxqwTHKdJ7Tzsr/dWlziD+1l+iAPnn5CnN1rqchfdRjlV4ehxIvFZoRb7pnZht0hpfTiLxjjo8Pte6DzApXJ26Dg2sQRHZ8ZsfqFPABTyP4p3EqK5cgNt0jJc0eYuDTnLoEsDcmy+c+zYg0FTP9obpeMilOkh+IQXcXfbfn2Kwbe0BoKDuZRRgt00STe7y5aCl+jke4Z8QvMfRT2qd8GErMrXPUwxVb9jJUR5S4s2IDdg1yyk/n5kPBBIt6djFIEzN6eLMLc5E+GnNoRWtwvPBYla3PcyeskXCD10hBYzf0wd/UIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCE8MQK0bg0LRue5YnDQ8GR5F+TbsVGzOj5vxi/r3Bg=;
 b=Z4TSwYMG5MRX8SwxoO3LAFVsAMayP/UMl8SO2kN3XKsi9giJ/cYJrlUh+DET6FvuabsuktRnj/QT0isZPxfdi8kf2ZjYvr6jg2xo1DzvT4P+j4QEgL0fwUkoANq42HR5hsjyNvNGfl1e3moDQAVNgOkNGm3qxYew0kR+Vp4jnfijKrmlAEjQJWPGaT73xUvPayfCublD6BahUTOVSRuD/cR222pWqg0idNa9sQvp+YB3MAI/+3GnpZRtj1unmhmC/8mPOMaQ5+iQAZAIgNAo8+jtobMOkJ7B6kZQiW3tYBChKDcUIZYmzvYPiPUvNRSUjwrRu7k/a5273cVQK1vUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 02:02:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 02:02:14 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: scripts/kernel-doc: sound/ac97/bus.c:192: warning: Function
 parameter or struct member 'drv' not described in
 'snd_ac97_codec_driver_register'
Thread-Topic: scripts/kernel-doc: sound/ac97/bus.c:192: warning: Function
 parameter or struct member 'drv' not described in
 'snd_ac97_codec_driver_register'
Thread-Index: AQHaL9GeeI0Hp6GOe0eRZVcmXZ2aBbCuTHdg
Date: Mon, 18 Dec 2023 02:02:14 +0000
Message-ID: <CY5PR11MB639292F967056541C1AD2EEAFB90A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312161120.io5hNEzJ-lkp@intel.com>
In-Reply-To: <202312161120.io5hNEzJ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA2PR11MB5051:EE_
x-ms-office365-filtering-correlation-id: 82432246-d0ec-4baf-3b50-08dbff6d5adc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytt8C3o2WALeO9xsDq+Cog6iHPKD+9buXGGgUOsOepuoSbBkEYL1Em9gFeGJBrerHElZ3ndnj3DH14o7LfPm/lmFsH6Rg+t5W1gfrTLUCRYicrjHhEGFkRQ4sqfNc6JarhFn739A4soFi0wK+F1tJ34N9bMuKxlL6NU68oi5SGtaiyzWehxVRehQKD1AZ/1AmW5wJySWjhoePzk/GJetAYtTW7wSqPRqEPc5fkdPjnkh6oXc8q9p9IZShSDaxbn41ZGVX8e86Vwk1pTyJEdwlhNp1gjikPlxxmAmoU1/dUtaX89AqsCzKz72m30SuQ778UpHTyxUlepKxukOMSeHMbdJbz2XE85yO1BePNn1goGZ3AdrZC3fWDkjiBmTcQCyD3+oL9EJVY0dwjVG0VZUdOy5lKxaNVhwYfu7AzO275W3dcBOeHhfzL5GppBRahmV9bcAga0Z27TNNpT8iwwZgndZoxDoEjMbIGljnVHZr09s6eLi2QKgLQA9iJk1Duirw5vHC6dzzqCRedEKoLFcWTIHD1Rtdb4CvbGJ7lczAzQ9jpTQYk5usJry7vsw2qwmm4JqSxpW7FFDr6NmcIIFdqx8Gw530bW3ymMvUJ8NsXtXCpyFYVHe+5Xfop5hlzK1t8iJPewvj7AgjA3Hmw0K/Q91rRUZ6QWVUDw23DzeIUfGbcPKGVez+PPcUtC9AzOp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(55016003)(26005)(82960400001)(71200400001)(38100700002)(122000001)(33656002)(86362001)(38070700009)(83380400001)(52536014)(5660300002)(9686003)(53546011)(6506007)(7696005)(8676002)(8936002)(66556008)(76116006)(66946007)(316002)(66446008)(110136005)(64756008)(66476007)(966005)(2906002)(478600001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8/r94y1vds8viWmcFaiBkAURYzshcDareQ4fAx5iI/GRIqhYXOXttrniXkFv?=
 =?us-ascii?Q?cfa8Yg3vb+nlkgbdAo7ADKL44byTwqRHGDUZH75bssDyEBgvm+U8c4n5KMGX?=
 =?us-ascii?Q?wHLPG8H6rB2/BFTYFgeHqxpmIzp+20f0WPXouZvNM4B0cs8FjYmpMxQxm3ai?=
 =?us-ascii?Q?YI6vSALIc5K3GBoUQnRoDGkYqRJxdLewwJWBQ9CeGc8ne3XyX/61IoSlJl0t?=
 =?us-ascii?Q?JDQF56uA2R6JBPcSp3E5k4+vhL7u6ClnbRu4nPJwoTE9nqKqtCI69/pTDumK?=
 =?us-ascii?Q?mBt1X0XmMKVYotGy98WpnGR127tsRYty8Um+emYM55UGhfpcC5C7yDlm2nZp?=
 =?us-ascii?Q?yrOhCZKZ5dB6EB3L8MpZg8aPvlr+GLlTpbpJFvU9OspHIAzmmLzXbzDbNM4D?=
 =?us-ascii?Q?EeFQmt+ZrzTIrV5qf3EVJou/J4Gp1X9OteQeIbNdQT+9UM2oVr30gJsixyg+?=
 =?us-ascii?Q?hjnFa4at3//Wdlc6XM6Mif/03SFhbEB+CzKKiSnHoaH14xfuDzyEMO7HpiBu?=
 =?us-ascii?Q?y2T/yviEqj1aiISOb3ERIgJejav3wJrUGGqt9xY851MlAaX+rI7T0wjVXsru?=
 =?us-ascii?Q?v+lWE1gQfNQJbwZWmAteOOhlP0ddgSEGwEaq2GKeJR35r3JZTC0yWR4h0bhr?=
 =?us-ascii?Q?o4UWd315YxJ4oOy5MBZe7pP/yjeExuI0GGfke7aF6C2N3DU4liJo5QMwhrWH?=
 =?us-ascii?Q?0Zi4r8A4ZP5VC9ZadU5AA3McjB5Czk9XsEtOAKkJQfMItVYjX5HWbYDuZbKo?=
 =?us-ascii?Q?BvmfG4qyAFkGyGoxCcfivw8bmzvJRN3OxjgtXFt3KCmGtPlGImaUdUFw9nOy?=
 =?us-ascii?Q?BtXgHgJ7tySKNIK8fM8TPDKJB7AE+5cLSA7Cl4ZOQUDwJC1W2FqHT452Bb2v?=
 =?us-ascii?Q?wyaPGuPUQeW6G4sND8CGFOvwQ8LsVoPHEeWEM++mbL63MQnmY9FZxTpyam8E?=
 =?us-ascii?Q?m7iXHpyCjAKTdzts5bTZGmL4JDr3HR/CopTVz69n0gjgFk1eaGFeefQJQmvb?=
 =?us-ascii?Q?xqw0oSoEExFbdAd/TlOqgYyKu8JfOif9IV8vktzMpg61t13rb9VBIYXtsJR6?=
 =?us-ascii?Q?Ygb20/T+IStx1BcypkzQpB2GoWs/7wgdwaGj2goFdVygALkgOXjXjeSjUTvJ?=
 =?us-ascii?Q?TScc9jaNSezoPAdyLPsci/XkdY1CFPxFeGvF7QLb6ikpoiNzF5ef1UfoPA9E?=
 =?us-ascii?Q?u8t/r0Qy8GU2j1USak7uAeXxFhZMw7Cla7SvBN0yj6P8bpmV1PudNf5lPWAP?=
 =?us-ascii?Q?BbPFj5nRvcaYc8xollAdB4vovjRWMOpS4ovCc8QA5l/eY8n432fzqQzytpWO?=
 =?us-ascii?Q?vIGv3es/qvGJkaGcuN8Dd/+33ttBLLJVM4u+jbeFGsps5CuHZcNCfSfDegi7?=
 =?us-ascii?Q?vNl89sb7PpBz2WK/u/4P0+PU9ebvcTZOoJyqkM+/htAhjfWyQM9QvJo7N/LM?=
 =?us-ascii?Q?lCaJObiGwxy5cCGgsmc+VHPanSX7QUWS080H3HzEZjo6bIgvxgNUCi1y1a0s?=
 =?us-ascii?Q?0gNyKIx58xUBXtIww2Ogt50Iu/S1SgETJWSc8vBKQfNFExgboYXqcDstHWZ0?=
 =?us-ascii?Q?yrGIshUYn0wNVWQcnmrNdgaQpxXuUN2GLR/Bi42s?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 82432246-d0ec-4baf-3b50-08dbff6d5adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 02:02:14.3595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EUepW72GnUJDBFa8LALVKjENG5yvW3OEdUi9g9CJQ3yBXVOJHZiokqmYujXFfbfd+IP3+qp4ondfnZaS/b31Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
X-OriginatorOrg: intel.com

not_report

only kconfig change

sound/soc/pxa/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 16, 2023 11:39
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: scripts/kernel-doc: sound/ac97/bus.c:192: warning: Function parame=
ter or struct member 'drv' not described in 'snd_ac97_codec_driver_register=
'

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: 5eab9265759e2fb042aa452931c3d06ab7ab8dae ASoC: PXA: make SND_PXA2XX=
_SOC_AC97 user-selectable
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20231216=
/202312161120.io5hNEzJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231216/202312161120.io5hNEzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312161120.io5hNEzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: sound/ac97/bus.c:192: warning: Function parameter or=
 struct member 'drv' not described in 'snd_ac97_codec_driver_register'
>> scripts/kernel-doc: sound/ac97/bus.c:192: warning: Excess function param=
eter 'dev' description in 'snd_ac97_codec_driver_register'
>> scripts/kernel-doc: sound/ac97/bus.c:205: warning: Function parameter or=
 struct member 'drv' not described in 'snd_ac97_codec_driver_unregister'
>> scripts/kernel-doc: sound/ac97/bus.c:205: warning: Excess function param=
eter 'dev' description in 'snd_ac97_codec_driver_unregister'
>> scripts/kernel-doc: sound/ac97/bus.c:351: warning: Function parameter or=
 struct member 'codecs_pdata' not described in 'snd_ac97_controller_registe=
r'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

