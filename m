Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409F10977
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 01:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b85yzLsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701308710; x=1732844710;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ay6++H4LAxuTo9NCaNS/9OImFxlF+fMvkEYfV23acQA=;
  b=b85yzLsb+46uxnR88bDPEX56FQjLdENF8qBRpsKWoY2d0AmO8L4CVqAX
   01oWuW7Bys3hKFVykTfUDV5i2cPfDS0Dof311p9Vi89FC/avAhJNPNJRZ
   qDR+z8hyuAcz/jXjrDduH4rd7CcEBaRC73SlJNSBi0ZM9musMH5qHhFwd
   ZQTDmbqLNDXr+h5JkvU2jZQMGJbScTTba3mXTOPjjyeZYgPzwWKJYwiG2
   hl/gxRFLQ4ASQa4lHV8mvt3fKz2tDt9bQMxa0eJh6/ODu4QKKkdbDLEPN
   41q7OZJlGURrO+oJ77e+yoqqys5PQW4CBQ8jYng9DxdpKwZdjuIzlqMaS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479453686"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="479453686"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 17:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="762516361"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="762516361"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Nov 2023 17:44:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:44:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:44:51 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:44:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TumZ01tBha3iTL5xakIJXsAxsRSuuCjzfuyUpKyS5jReC6Xz2PwIdcOD5YcEC4T8bRPBS0p/d5LONShCUVGoIIqOhaw3k5jeTeyc+AwbAZhxBEHrX8VMjo1RpEHvqwROIqcfHEEuU+Nq3KlRuOMTuT4UjucXWbUg8XTlD6cPg8B/8Aa+m58Vgl5HQhc4boYbk0fHQJlYxw8oxrYCAwQ6XN5JLiTdQzpB+Ccoi1ShDVfQWb+WT2whetGUXlyRCUJO2A47GDqZlw2Y3E4BLxOKv88KDiO3TCosmCnJ6AZ/CKsoqCa9Dc+U0MzS+5fVUNl0bvMkse3aPQjzzXX1Fbb06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU1tpRuSDBNe+FKDT1DaorjKlY3dgQxh0X2Abx7yr80=;
 b=bz7huQLlRDNpFtA9ahBTekwND/ZgUU3yvejygPsOqbtQcTD9YVC6ms+ibrHz9gmK5QLY9RBjuHis7Ej3d/bZ67b9ukkwSQ/zFZHS4l5XnkcZSlGPO0eJ/pw1zuvkHWFy5MuS2EiKQHkm44MRzTVuPFfDyb9HBUWglWY7zUNhFCPffSwuvBhFw/i5ueHdIbE7M0ZTKt/8DgZEyDJOm7DcaqsgUcpE7zFhrv+0/WRoMWXpUzYll54TRsTyGrS2rC/PsRUblrdy+LDWrHnBXkebr/vfbyu2bG/cpL5qVGIEKpGLtig7gu5KJh2Xrtf0okw8tK84v9yvgdV3lU3pSjW4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 01:44:48 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 01:44:48 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/power/suspend.c:92:54: sparse: sparse: incorrect type in
 argument 2 (different base types)
Thread-Topic: kernel/power/suspend.c:92:54: sparse: sparse: incorrect type in
 argument 2 (different base types)
Thread-Index: AQHaIrE5xb6MmbeFx0ynuFIKGVGD2LCSGAxQ
Date: Thu, 30 Nov 2023 01:44:48 +0000
Message-ID: <CY5PR11MB6392D6A760DAC3448055E736FB82A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311291609.v7chEWfl-lkp@intel.com>
In-Reply-To: <202311291609.v7chEWfl-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|MW5PR11MB5785:EE_
x-ms-office365-filtering-correlation-id: 064ad75f-d415-4298-4d39-08dbf145f040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CSAA4g5prKNnKx8M8adJEGAzy65pEYSbR3zPqcgC1v1/Er2Owc7VJuL/72cy78StIFPC9mSbFw4V2YlREd8xfCvHzLj3HfPtfyBaRBwUJAZ9uHQc283p6SwVuLSQ5fXkstADJJyQJo0Fm3Qhz6jxDwH4DJGi1DnbLkUEuvrIUb5SFN5etcyxO0lR+8QGUMGEczqxOaCO6yHNvQ59WpcCxI7rHoI/Z4lgcowLgZ99gv78O1u9HK3KtCRdY/hG1nV1mtiT7HuG1zp6ctsqDC+9NrJ5jQjaXLIPzW4fQprmcGYvI66Jxxrv/h4ohSMW+Bvh4Hz12DXre/ayL+yHB+N9x6ZhGmLoNsLruSXqccjId5v1MSCXy9EGYzOZcsoK75huixjN9RH5K5uKbmVXffGInIl3qzYSTQf9IFnA0R7qwCVjGZw1AGlb3jTe38DP+hkdaf0kbZ/4o6fBCv/lievjtdTOkmKQSSn+/0Nn7419GWHAzLOa46LHU20CYPSL9RAvbEAXLjAaIfdlumNLeiU1duRQssKH0HFpLwQ9MT7WyDSLaXLYkVy7rQtwAaDZnDbbgvdQtzsTIS40x2mEe+MXmUFExgnDPzgsbg9VQfxIYZ9/xezTimj6zmjsiIZUx8Fa5VmUL5chy+7lBhyaWKBbJ0W2PeM23u6idwCrUwXqHWGTfRu2h2+Dxq7EsuoAq8v12cnLL12KH5PFLqFiaiYHRJKU2I4pWzITOwmEk/bkuwU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(53546011)(82960400001)(966005)(122000001)(76116006)(8936002)(66946007)(478600001)(41300700001)(66556008)(8676002)(7696005)(66446008)(64756008)(86362001)(38100700002)(6506007)(26005)(110136005)(316002)(33656002)(66476007)(83380400001)(71200400001)(9686003)(52536014)(202311291699003)(38070700009)(2906002)(15650500001)(4001150100001)(55016003)(30864003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XhH3JmCM5xR8zt4oCqMuntULUThwLQLAshw5zTCv56TcGZx2/HxmwyNORcMx?=
 =?us-ascii?Q?se1i9GjgabMSCpjG6RDt+SXomjElNAuUhZpPi5D7Z1kNC8cIRMYBxrXzEDdk?=
 =?us-ascii?Q?TCtmj5t2sEpGNIv7j+x7zUt+AfN2cr1CXKcLYYbnoS/O0FlavPAKlOCX+ccZ?=
 =?us-ascii?Q?6n6dSpnaoZJUWS9fJfZGY5OzTkCbcN4U0bAGDYptQnA9ZLgcL2YPXLUMYhch?=
 =?us-ascii?Q?NQgE6sj6qfywfJONe3uwDjCcQ/v+LwPdJq01S66hGGrZq7EKAxz94ocPf1zW?=
 =?us-ascii?Q?9SiGl0ZkmcE62stAOyiD7a/iTcRoqqiAWuFV1OxyXDCSPtyVj+I0zM7SPvLb?=
 =?us-ascii?Q?IkqheD1lt62KCm4+CHMOHsnwvj3rIMFWd/1cTNM4Xl/fGuOi7Hp6t4R3+5/o?=
 =?us-ascii?Q?rko5lmUaTdvbvY923gz7wzlHRTxnihMsrA+KNh9ZQk8irph8o32OywKt1K7f?=
 =?us-ascii?Q?3DuRk0XVxNFAK07K9K1fcuS8jK2nxwSop9+H8X55r03e4dsL9cMEFLypM5PV?=
 =?us-ascii?Q?H0F5ajSBOqcIO9nopn3bKuVu4aKOojk5dz36t7TGRdqakXzK9qJZFjua23Xr?=
 =?us-ascii?Q?3k775M8IZfHBj7hrJ26jmQLvIOmgXa2qWSsZygndQHbk1D2V0po03gIm/Dk1?=
 =?us-ascii?Q?NBsNpRokrqZ6L70P++Gh/rGFUWGulybpI2rvrAKZi1SYZALmO3eoybqbItE+?=
 =?us-ascii?Q?1NmHFMWyb7Yj1VnPMHJOFAW/0xyL8JXJbM8h7bJ8jZCbgSClBbQFWP/OxMFs?=
 =?us-ascii?Q?k5N9cWU7Tyiq4lw0EyF47qBh6OLl9vn0+d6cI83Kb+uKhAa/lfWTtGJcXkN2?=
 =?us-ascii?Q?1TVKCpslPEHrYCFKIYltC9yfU+0JQx8uJ4gyS3Dr/K7OHulnEWGNCyJqb2pD?=
 =?us-ascii?Q?yGJuKFEb/ynO+WAY7ycB4iCq8SGIkPDH47J51fFC3k4qu/I+bZlnwsXcVd7z?=
 =?us-ascii?Q?KwRbSSQocS9k3IGE4vzo91dMdS0vDko0phAz+lVlK2eBnWCw+GTZPulLjghi?=
 =?us-ascii?Q?TjRArjd24eRsllASGC0rStJ3hgQ2HtrnoMVoFFFbE2SCy+pNjTber1//mEOn?=
 =?us-ascii?Q?0U2bBI5HzTwtBJAVdUx7Tb4fI8G670U45tnazalxruhwhG3+T7bXs7Bel8WH?=
 =?us-ascii?Q?oVyJWysLG09vbwS/k92JQ5yyQ2qsNBltPwfq9lvYf24KQV+ORskD5WclxlO9?=
 =?us-ascii?Q?PEbFR1d8AjSFGzYNXbeAl4N8VkI7ccBhMBUXOoWSPyntQ/BI0NCMAb6qCxbf?=
 =?us-ascii?Q?rEqpLslzMgHck0dgSEOUFSgsZBnWbGnKdpRuY1D2Kn4Ty7pr1GQX3nAstJGp?=
 =?us-ascii?Q?v/9SHyjyLAZUaW0h2LA12m8P9vlk9dLXZFM5bXsMhfNKgPlboQrH7UIRFWTE?=
 =?us-ascii?Q?SPmHF8AqFcVDRBG3njI54z6wcs4/czJehzHCV/ps8Y/uA1TBt3ERZFjCD9nn?=
 =?us-ascii?Q?lbFFWF5351W9jEpjmUQrzUegjDsoajsOTdb0SBGnZ0b5ngAok8fAR6gY34F2?=
 =?us-ascii?Q?nW0xlgooYgPLtZim3Egk48yZum6VTrQH9UVKslJnckwidksO0wmrY2cqW+Tw?=
 =?us-ascii?Q?7sq8P0GsWggkWPRildhHZ0RGXI8Qigd9EKoPrPOT?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 064ad75f-d415-4298-4d39-08dbf145f040
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 01:44:48.8367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEkTW4GiEffF7vfvdCMe0bQC8EClSOX+kTfudqfh3urA76ku7XTrf9P5dGbfwq5ZzNcTdCNpE9Qy2Af9vXH8ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
X-OriginatorOrg: intel.com

not_report

only kconfig change:

$ git show --stat c1f048a6bd7d7cb42e9bfd79eff85b33894997fe
arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, November 29, 2023 18:44
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/power/suspend.c:92:54: sparse: sparse: incorrect type in ar=
gument 2 (different base types)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Song Shuai <songshuaishuai@tinylab.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: c1f048a6bd7d7cb42e9bfd79eff85b33894997fe riscv: Enable ARCH_SUSPEND=
_POSSIBLE for s2idle
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: riscv-buildonly-randconfig-r006-20230429 (https://download.01.org/0=
day-ci/archive/20231129/202311291609.v7chEWfl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291609.v=
7chEWfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311291609.v7chEWfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> kernel/power/suspend.c:92:54: sparse: sparse: incorrect type in argument=
 2 (different base types) @@     expected int val @@     got restricted sus=
pend_state_t [usertype] @@
   kernel/power/suspend.c:92:54: sparse:     expected int val
   kernel/power/suspend.c:92:54: sparse:     got restricted suspend_state_t=
 [usertype]
   kernel/power/suspend.c:117:54: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] @@
   kernel/power/suspend.c:117:54: sparse:     expected int val
   kernel/power/suspend.c:117:54: sparse:     got restricted suspend_state_=
t [usertype]
>> kernel/power/suspend.c:178:19: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:178:47: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:179:19: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:179:51: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:184:26: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:184:65: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:191:42: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:191:51: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:192:38: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:193:51: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:191:72: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:215:34: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:215:73: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:216:27: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:216:59: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:221:34: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:221:69: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:222:21: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:222:42: sparse: sparse: restricted suspend_state_=
t degrades to integer
>> kernel/power/suspend.c:445:33: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] state @@
   kernel/power/suspend.c:445:33: sparse:     expected int val
   kernel/power/suspend.c:445:33: sparse:     got restricted suspend_state_=
t [usertype] state
   kernel/power/suspend.c:448:33: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] state @@
   kernel/power/suspend.c:448:33: sparse:     expected int val
   kernel/power/suspend.c:448:33: sparse:     got restricted suspend_state_=
t [usertype] state
   kernel/power/suspend.c:518:53: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] state @@
   kernel/power/suspend.c:518:53: sparse:     expected int val
   kernel/power/suspend.c:518:53: sparse:     got restricted suspend_state_=
t [usertype] state
   kernel/power/suspend.c:520:53: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] state @@
   kernel/power/suspend.c:520:53: sparse:     expected int val
   kernel/power/suspend.c:520:53: sparse:     got restricted suspend_state_=
t [usertype] state
   kernel/power/suspend.c:557:52: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] state @@
   kernel/power/suspend.c:557:52: sparse:     expected int val
   kernel/power/suspend.c:557:52: sparse:     got restricted suspend_state_=
t [usertype] state
   kernel/power/suspend.c:580:9: sparse: sparse: restricted suspend_state_t=
 degrades to integer
   kernel/power/suspend.c:580:9: sparse: sparse: restricted suspend_state_t=
 degrades to integer
   kernel/power/suspend.c:589:52: sparse: sparse: incorrect type in argumen=
t 2 (different base types) @@     expected int val @@     got restricted su=
spend_state_t [usertype] state @@
   kernel/power/suspend.c:589:52: sparse:     expected int val
   kernel/power/suspend.c:589:52: sparse:     got restricted suspend_state_=
t [usertype] state
   kernel/power/suspend.c:590:9: sparse: sparse: restricted suspend_state_t=
 degrades to integer
   kernel/power/suspend.c:590:9: sparse: sparse: restricted suspend_state_t=
 degrades to integer
   kernel/power/suspend.c:615:13: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:615:22: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:615:39: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:615:48: sparse: sparse: restricted suspend_state_=
t degrades to integer
   kernel/power/suspend.c:618:9: sparse: sparse: restricted suspend_state_t=
 degrades to integer

vim +92 kernel/power/suspend.c

7e73c5ae6e7991 Zhang Rui                 2013-02-06   89 =20
f02f4f9d826590 Rafael J. Wysocki         2017-08-10   90  static void s2idl=
e_enter(void)
7e73c5ae6e7991 Zhang Rui                 2013-02-06   91  {
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  @92  	trace_suspend_re=
sume(TPS("machine_suspend"), PM_SUSPEND_TO_IDLE, true);
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12   93 =20
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25   94  	raw_spin_lock_ir=
q(&s2idle_lock);
3810631332465d Rafael J. Wysocki         2015-02-12   95  	if (pm_wakeup_pe=
nding())
3810631332465d Rafael J. Wysocki         2015-02-12   96  		goto out;
3810631332465d Rafael J. Wysocki         2015-02-12   97 =20
f02f4f9d826590 Rafael J. Wysocki         2017-08-10   98  	s2idle_state =3D=
 S2IDLE_STATE_ENTER;
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25   99  	raw_spin_unlock_=
irq(&s2idle_lock);
3810631332465d Rafael J. Wysocki         2015-02-12  100 =20
d2c8cce647f302 Sebastian Andrzej Siewior 2021-08-03  101  	cpus_read_lock()=
;
3810631332465d Rafael J. Wysocki         2015-02-12  102 =20
3810631332465d Rafael J. Wysocki         2015-02-12  103  	/* Push all the =
CPUs into the idle loop. */
3810631332465d Rafael J. Wysocki         2015-02-12  104  	wake_up_all_idle=
_cpus();
3810631332465d Rafael J. Wysocki         2015-02-12  105  	/* Make the curr=
ent CPU wait so it can enter the idle loop too. */
b3dae109fa89d6 Peter Zijlstra            2018-06-12  106  	swait_event_excl=
usive(s2idle_wait_head,
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  107  		    s2idle_stat=
e =3D=3D S2IDLE_STATE_WAKE);
3810631332465d Rafael J. Wysocki         2015-02-12  108 =20
d2c8cce647f302 Sebastian Andrzej Siewior 2021-08-03  109  	cpus_read_unlock=
();
3810631332465d Rafael J. Wysocki         2015-02-12  110 =20
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  111  	raw_spin_lock_ir=
q(&s2idle_lock);
3810631332465d Rafael J. Wysocki         2015-02-12  112 =20
3810631332465d Rafael J. Wysocki         2015-02-12  113   out:
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  114  	s2idle_state =3D=
 S2IDLE_STATE_NONE;
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  115  	raw_spin_unlock_=
irq(&s2idle_lock);
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  116 =20
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  117  	trace_suspend_re=
sume(TPS("machine_suspend"), PM_SUSPEND_TO_IDLE, false);
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  118  }
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  119 =20
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  120  static void s2idl=
e_loop(void)
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  121  {
56b991849009f5 Rafael J. Wysocki         2019-07-15  122  	pm_pr_dbg("suspe=
nd-to-idle\n");
9a3ebe3523cc82 Rafael J. Wysocki         2017-07-21  123 =20
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  124  	/*
56b991849009f5 Rafael J. Wysocki         2019-07-15  125  	 * Suspend-to-id=
le equals:
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  126  	 * frozen proces=
ses + suspended devices + idle processors.
56b991849009f5 Rafael J. Wysocki         2019-07-15  127  	 * Thus s2idle_e=
nter() should be called right after all devices have
56b991849009f5 Rafael J. Wysocki         2019-07-15  128  	 * been suspende=
d.
87cbde8d9081b9 Rafael J. Wysocki         2017-09-28  129  	 *
56b991849009f5 Rafael J. Wysocki         2019-07-15  130  	 * Wakeups durin=
g the noirq suspend of devices may be spurious, so try
56b991849009f5 Rafael J. Wysocki         2019-07-15  131  	 * to avoid them=
 upfront.
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  132  	 */
56b991849009f5 Rafael J. Wysocki         2019-07-15  133  	for (;;) {
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  134  		if (s2idle_ops =
&& s2idle_ops->wake) {
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  135  			if (s2idle_ops=
->wake())
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  136  				break;
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  137  		} else if (pm_w=
akeup_pending()) {
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  138  			break;
e3728b50cd9be7 Rafael J. Wysocki         2020-02-11  139  		}
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  140 =20
811d59fdf56a17 Mario Limonciello         2022-08-29  141  		if (s2idle_ops =
&& s2idle_ops->check)
811d59fdf56a17 Mario Limonciello         2022-08-29  142  			s2idle_ops->ch=
eck();
811d59fdf56a17 Mario Limonciello         2022-08-29  143 =20
56b991849009f5 Rafael J. Wysocki         2019-07-15  144  		s2idle_enter();
8e6bcd9f7eac47 Rafael J. Wysocki         2017-07-21  145  	}
33e4f80ee69b51 Rafael J. Wysocki         2017-06-12  146 =20
8d8b2441db9647 Rafael J. Wysocki         2017-07-19  147  	pm_pr_dbg("resum=
e from suspend-to-idle\n");
7e73c5ae6e7991 Zhang Rui                 2013-02-06  148  }
7e73c5ae6e7991 Zhang Rui                 2013-02-06  149 =20
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  150  void s2idle_wake(=
void)
7e73c5ae6e7991 Zhang Rui                 2013-02-06  151  {
3810631332465d Rafael J. Wysocki         2015-02-12  152  	unsigned long fl=
ags;
3810631332465d Rafael J. Wysocki         2015-02-12  153 =20
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  154  	raw_spin_lock_ir=
qsave(&s2idle_lock, flags);
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  155  	if (s2idle_state=
 > S2IDLE_STATE_NONE) {
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  156  		s2idle_state =
=3D S2IDLE_STATE_WAKE;
b3dae109fa89d6 Peter Zijlstra            2018-06-12  157  		swake_up_one(&s=
2idle_wait_head);
7e73c5ae6e7991 Zhang Rui                 2013-02-06  158  	}
62fc00a6611a00 Sebastian Andrzej Siewior 2018-05-25  159  	raw_spin_unlock_=
irqrestore(&s2idle_lock, flags);
3810631332465d Rafael J. Wysocki         2015-02-12  160  }
f02f4f9d826590 Rafael J. Wysocki         2017-08-10  161  EXPORT_SYMBOL_GPL=
(s2idle_wake);
7e73c5ae6e7991 Zhang Rui                 2013-02-06  162 =20
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  163  static bool valid=
_state(suspend_state_t state)
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  164  {
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  165  	/*
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  166  	 * The PM_SUSPEN=
D_STANDBY and PM_SUSPEND_MEM states require low-level
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  167  	 * support and n=
eed to be valid to the low-level implementation.
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  168  	 *
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  169  	 * No ->valid() =
or ->enter() callback implies that none are valid.
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  170  	 */
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  171  	return suspend_o=
ps && suspend_ops->valid && suspend_ops->valid(state) &&
9f6abfcd67aae5 Rafael J. Wysocki         2021-10-22  172  		suspend_ops->en=
ter;
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  173  }
43e8317b0bba1d Rafael J. Wysocki         2014-05-26  174 =20
fa7fd6fa38e36d Sudeep Holla              2016-08-19  175  void __init pm_st=
ates_init(void)
fa7fd6fa38e36d Sudeep Holla              2016-08-19  176  {
c1bfc598181bf0 Rafael J. Wysocki         2021-10-19  177  	/* "mem" and "fr=
eeze" are always present in /sys/power/state. */
c1bfc598181bf0 Rafael J. Wysocki         2021-10-19 @178  	pm_states[PM_SUS=
PEND_MEM] =3D pm_labels[PM_SUSPEND_MEM];
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  179  	pm_states[PM_SUS=
PEND_TO_IDLE] =3D pm_labels[PM_SUSPEND_TO_IDLE];
fa7fd6fa38e36d Sudeep Holla              2016-08-19  180  	/*
406e79385f3223 Rafael J. Wysocki         2016-11-21  181  	 * Suspend-to-id=
le should be supported even without any suspend_ops,
406e79385f3223 Rafael J. Wysocki         2016-11-21  182  	 * initialize me=
m_sleep_states[] accordingly here.
fa7fd6fa38e36d Sudeep Holla              2016-08-19  183  	 */
690cbb90a709c1 Rafael J. Wysocki         2017-08-10  184  	mem_sleep_states=
[PM_SUSPEND_TO_IDLE] =3D mem_sleep_labels[PM_SUSPEND_TO_IDLE];
fa7fd6fa38e36d Sudeep Holla              2016-08-19  185  }
fa7fd6fa38e36d Sudeep Holla              2016-08-19  186 =20
406e79385f3223 Rafael J. Wysocki         2016-11-21  187  static int __init=
 mem_sleep_default_setup(char *str)
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  188  {
406e79385f3223 Rafael J. Wysocki         2016-11-21  189  	suspend_state_t =
state;
406e79385f3223 Rafael J. Wysocki         2016-11-21  190 =20
690cbb90a709c1 Rafael J. Wysocki         2017-08-10 @191  	for (state =3D P=
M_SUSPEND_TO_IDLE; state <=3D PM_SUSPEND_MEM; state++)
406e79385f3223 Rafael J. Wysocki         2016-11-21  192  		if (mem_sleep_l=
abels[state] &&
406e79385f3223 Rafael J. Wysocki         2016-11-21  193  		    !strcmp(str=
, mem_sleep_labels[state])) {
406e79385f3223 Rafael J. Wysocki         2016-11-21  194  			mem_sleep_defa=
ult =3D state;
406e79385f3223 Rafael J. Wysocki         2016-11-21  195  			break;
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  196  		}
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  197 =20
406e79385f3223 Rafael J. Wysocki         2016-11-21  198  	return 1;
406e79385f3223 Rafael J. Wysocki         2016-11-21  199  }
406e79385f3223 Rafael J. Wysocki         2016-11-21  200  __setup("mem_slee=
p_default=3D", mem_sleep_default_setup);
0399d4db3edf5c Rafael J. Wysocki         2014-05-26  201 =20

:::::: The code at line 92 was first introduced by commit
:::::: 690cbb90a709c1b9389c6cb8e1978e77553ce0fb PM / s2idle: Rename PM_SUSP=
END_FREEZE to PM_SUSPEND_TO_IDLE

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

