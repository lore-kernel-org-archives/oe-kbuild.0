Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A4ECB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 01:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhkMEOxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701739757; x=1733275757;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XE5E2ba2y0zDcaxC0lKqso2te3/6XkvFrS1rFsLFlDg=;
  b=EhkMEOxspyHq4djQsDvb3w9KgfN+Yr2kzjCT1jbqdGsmetJSJLrba4fL
   wE106ywOCpHWuAYdf8TndCNafcVH7XSJnJpVG7LwhuJ4j3Qj3uS1S63EO
   MLvK10/wcHncjHrc8XMWgl4x39bu/2VV9roNuzFLL1h5YmDWpofSKBvOI
   J7AlgxBUnq/nj1kkkNr2WCjOcYs4LVYXppLC49F502s5UvkgngStolQ1Y
   CAXGffygWO6/bNODOVFu6jiurh3Nga4Urt8vDYyecpFbSSNHGJ11m8muR
   hzApVhyVI7CEaxe7lXOB6IfGs/JLbHZ5a1yP/LFHBETy6X98ZSdCzhX+G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393559717"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="393559717"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770732530"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="770732530"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2023 17:29:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:29:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:29:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:29:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9uJqZbU39eRWNtbph3S3YayC/8NAKjIszFZbsEDJ46ksTMQ6zKkgPA1EOY66dAPm4gQKdN0xuDPV/MI5zZ1hqJG1wvFEvYBwXScyeT4xBOi+WK/DWm1T2s5ImKH3E3vRRMQSX1F+h4n+T/BSjsygzVFIm6kVEVKQLIPpF9tf5bstLDcNb0SojR8aZqVlhy9oJ79Gs3OO+4TLBbHiWF40p77pgwTX9HBqJNIA3VUxgybWlQA9SM5PmpZkVl3oLWnGNmluSAfFRXWilAgEwD+bNYw+ya52sYBabvI3fNsJxYklpG27oRzkkDlhoFRqDYprI3YEoYaq9Z4/AiR80AWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipYzg4P/l6MpVftfaLj8P+PE65JgaylHpgBcO6MhCl0=;
 b=a3v5f4oz8AyWhsBPQ74T/DwWRWwYMJaGuZghEEeS97pPAN5p5q7w8JfWJ0OFvHFTMX9idEeoVsEqtm0vhcGxSz1XCD+Rm2Q7cYy0lW3t4rxcTucXrhrDA/M6sQffMj3VQ7rVV2rIJjV37t2/wVrBzpo1pOp8XvT5se8NVoUyVWTWbr3KTgJ2e2tbcsxSqPaUYaRjXgH/0nScdHEEsdn8kndvze5npzSoQBQcDGjOP12jjVubhMA0mZ+C4vPhIUQNsJDlCS/tHoN5rv9BYzlopyF5ursyqYgcASUf8nYqGeXdKhDlnZFbbUXJozMeR+bBC7UJX9d7lFuk2dbtBw6HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 01:29:12 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Tue, 5 Dec 2023
 01:29:12 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/scsi/aacraid/src.c:783:42: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Thread-Topic: drivers/scsi/aacraid/src.c:783:42: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Thread-Index: AQHaJrM2sQ/tcdjPgEK+n6J1wdhCGrCZ5zTQ
Date: Tue, 5 Dec 2023 01:29:11 +0000
Message-ID: <CY5PR11MB6392CF5D7A09156B2AA31230FB85A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312042140.4QBHZJ9j-lkp@intel.com>
In-Reply-To: <202312042140.4QBHZJ9j-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SN7PR11MB7637:EE_
x-ms-office365-filtering-correlation-id: 0c314f37-dc19-49da-db10-08dbf53195e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VPYSJmOW3Dy1Z47JKMg1GHLPzNLFk5Sx+5jPxCYU/oTrgonq144h4wBivGA9WbrKc3Xd+xOLZ8DWHlcM/UqlqIi9e+Tv6XI5r5cPh+ysnm+HPvmrs3z0ngq6t+3AbF1SJzM0RlQDOQcPCkVZJVJWlptb6cRSD3E4NIEeXq2BbzxZzwH2kteIn6vcPztlvOz4KglBO2jhcVA0HRM15XOUCBAMHL/ttmTzmVqu80Gm4ZGYsk0K/nenNCGaJ+zPUTaknl2HQxeQ6aj3/k1/neD9Gyy27WlY43rOW5/P9MIIIbWTm+wwNNuGV10jHIyTj7iWfrJJX5fS2FvO69pXGGRYUAt/1VrqRJPACnnh2dewCBwJRxVd0Taa1jWqpd1StIMSmiJBye743ywZdXbh/ljDMigu+Wt29pppiTCV363ArEBWi/SFdKrImzMt2nmakiErgkDC4VFnCgX0xplWTccnK2ND660GtqeBr2EtdeIqC8iFQWblLU93/YDYT33pGLJwyXGU2WLrVHRTT/eKGBpqNm9WA6MhDppe4r5UnrW2lCElTI+1FZLcA6DBQn9ZG0gFdBgfUzLXjpyxsCCdHJgBVFOXfjm7TqAIe4z5cd/sqqBPtPcAUYugiRxSt1sYInqNdkbGj0b5XwcntaC6xST6hLGOCroQn2bpdNgglJWUaFpMs2VeMlQn6Vn6+rD5gavr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(55016003)(33656002)(38070700009)(122000001)(5660300002)(2906002)(83380400001)(82960400001)(71200400001)(53546011)(26005)(6506007)(7696005)(9686003)(76116006)(478600001)(110136005)(966005)(41300700001)(66946007)(64756008)(66556008)(52536014)(8936002)(86362001)(66476007)(8676002)(66446008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lrq3T3rBqOzOuy5VpnVBhibV6ELAIgwTaOFccsNkn9rG2O9pWRrOnfxtsZgU?=
 =?us-ascii?Q?U03SMuOgr7FnZi9EZwWHv9hcx35Vg2j9JgjEei7JQG0DcH1caiMdNfipoBtH?=
 =?us-ascii?Q?UpT2TFd0mhL+LcbqJMzaATUlNIZ6qKuuy3QmxZOCoxe6wfMQD0Zfny1yCpaT?=
 =?us-ascii?Q?qMwUElv8KLGVX1kHCWDar/DP+Ig5KKzvt9DyCqbWqBsmx07RfI4+ix3tsyTZ?=
 =?us-ascii?Q?o3hyPOSZDjh1ofHSqy8Ui0eioAkdKwoI5rNHrSW0G12bg1qb4SmIZu5OwsB2?=
 =?us-ascii?Q?ygMfaDwBFI69Jb+mEo9rgnmp673MwM36d7YkFAfdYDC5ObWGWgND7S61n3PF?=
 =?us-ascii?Q?ceVQ6PL7YlbEofJktS6RAS3ECOglvZEF4dgDYHdYEtGcGhOyjqKvSAr+2bu5?=
 =?us-ascii?Q?uzGSGNd9M4hvRbqmjjGRZydC995Z4KioT0qnMDCpX4YFWv63efzmVFfRmzLE?=
 =?us-ascii?Q?t9mjnWeAevkmTBekChVRVu60kz6xzlybWeDHvV78drAhchvFIwFJHJ8X3NJ9?=
 =?us-ascii?Q?bOioKie4ctowOX8vA277MyBI9F0/rEPBaLYGwklH+x8mJ+OTck/PjrdzVxP1?=
 =?us-ascii?Q?Sr+7EFq6RyDfcKQX1EgflgmTLfznrqD+8zPjCusbAYaTupt2VU5TW/zoSzy3?=
 =?us-ascii?Q?hOh17a0UDVVP+ETtC+hDIbhyRox8xyHJstjTL8/Gifz7A5wy/nxbjAxeFeBm?=
 =?us-ascii?Q?+YVq/ZaCQLrAB4Jgv0FwSfdMKR09dNTtPgSUsH3YRozIs44dZrluV7fz7xXu?=
 =?us-ascii?Q?Jewfu66XFJGwCJN7JyKxaDvqZrfb758FSaGReG3qbGlaNBtB6zfSsTpzPYuw?=
 =?us-ascii?Q?uUAY1Dg+q9YFBfq0WgA9jo1FBz/RDyCqeHzolAf5WfPNEaIWFatmOse5H6PY?=
 =?us-ascii?Q?IqyB0NqpOjZcQD55fE7cqDiAd/GbYpxzKyJWnD+VjY762bfKvBRc892m53cG?=
 =?us-ascii?Q?E72FnIoWW1f8iRisyUVBKoRJoTR768kop/m26ezTpN0SVmUYgVsw65XwAgQu?=
 =?us-ascii?Q?EIXboi5w0rpRpge1A2Cq45en+Auizqa5jsv3C3cupr/pSyFfDGBHeKJb6KUb?=
 =?us-ascii?Q?fNhHTAUnsulDCMkOnkZUZc4Yc6AzmPzjoTv9dGOKgULo/VWKKiiP+TFHTxcO?=
 =?us-ascii?Q?tfC/KSM6zTJ7HAAioUCT1+EHsF8GzeLX/gv6YYM/c5W2UGnNunH53JpHGylc?=
 =?us-ascii?Q?jpCiWY+DyEBvxs8b7jeU0+92rcFuciMFBP5AwdINUykxSvfUimJJrkWZvqqg?=
 =?us-ascii?Q?YAEll2e2LaSWBsS6A/VKWbBwrRXDpL/P4yWWUv4ut9bnR5ncWTk20e1rnrLB?=
 =?us-ascii?Q?7q2eV+ZsNl1YYP1Igp9ML2h3faaQSBuEhyuCBYFOTIqV+0xkHy6zLTgqol/X?=
 =?us-ascii?Q?NIIHu9xOVuXxdlfrw7zTvwKuRiabBnUcotiM/qEkKE5HMXV736snDcaPa7/o?=
 =?us-ascii?Q?6yeE5NWw3vNe+4ed1jgX884ZxFqe7KNxuF27Ztn2RcV7KIZY6iZ4oFqZ1/sG?=
 =?us-ascii?Q?70AO6rhMYv9AVJXr3b2ivgxUDmMSGOF5Oyd7c5NCKysjqgK6/9DEcBST4ZOv?=
 =?us-ascii?Q?zqYmMnq5wks/xnrGTPdarBDXDE4fCpir8xqhtt4s?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c314f37-dc19-49da-db10-08dbf53195e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 01:29:11.9293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5XUmXOv6HxhVswyxwZFXznRZTbI5AIdYftu2I0GbF7ZgMoCFughqzPotX8OgLxpirkiRlq035rho9WgCI94jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
X-OriginatorOrg: intel.com

not_report

only kconfig change:

arch/mips/Kconfig         | 8 ++++++--
 arch/mips/generic/Kconfig | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, December 4, 2023 21:08
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/scsi/aacraid/src.c:783:42: sparse: sparse: incorrect type =
in argument 1 (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GE=
NERIC_KERNEL symbol
date:   3 years, 3 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 3 years, 3 months ago
config: mips-randconfig-r132-20231116 (https://download.01.org/0day-ci/arch=
ive/20231204/202312042140.4QBHZJ9j-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312042140.4=
QBHZJ9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312042140.4QBHZJ9j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/aacraid/src.c:146:34: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/aacraid/src.c:146:34: sparse: sparse: cast to restricted __=
le32
   drivers/scsi/aacraid/src.c:503:54: sparse: sparse: restricted __le16 deg=
rades to integer
   drivers/scsi/aacraid/src.c:524:57: sparse: sparse: bad assignment (+=3D)=
 to restricted __le32
   drivers/scsi/aacraid/src.c:531:57: sparse: sparse: bad assignment (+=3D)=
 to restricted __le32
   drivers/scsi/aacraid/src.c:539:49: sparse: sparse: bad assignment (+=3D)=
 to restricted __le32
   drivers/scsi/aacraid/src.c:542:55: sparse: sparse: bad assignment (+=3D)=
 to restricted __le32
   drivers/scsi/aacraid/src.c:783:23: sparse: sparse: cast removes address =
space '__iomem' of expression
>> drivers/scsi/aacraid/src.c:783:42: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got char * @@
   drivers/scsi/aacraid/src.c:783:42: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   drivers/scsi/aacraid/src.c:783:42: sparse:     got char *
   drivers/scsi/aacraid/src.c:785:23: sparse: sparse: cast removes address =
space '__iomem' of expression
>> drivers/scsi/aacraid/src.c:785:42: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void volatile [noderef] =
__iomem *mem @@     got char * @@
   drivers/scsi/aacraid/src.c:785:42: sparse:     expected void volatile [n=
oderef] __iomem *mem
   drivers/scsi/aacraid/src.c:785:42: sparse:     got char *

vim +783 drivers/scsi/aacraid/src.c

3136432956501f Raghava Aditya Renukunta 2017-02-02  777 =20
3136432956501f Raghava Aditya Renukunta 2017-02-02  778  static void aac_se=
nd_hardware_soft_reset(struct aac_dev *dev)
3136432956501f Raghava Aditya Renukunta 2017-02-02  779  {
3136432956501f Raghava Aditya Renukunta 2017-02-02  780  	u_int32_t val;
3136432956501f Raghava Aditya Renukunta 2017-02-02  781 =20
a5799d74d965c8 Raghava Aditya Renukunta 2018-02-07  782  	aac_clear_omr(dev=
);
3136432956501f Raghava Aditya Renukunta 2017-02-02 @783  	val =3D readl(((c=
har *)(dev->base) + IBW_SWR_OFFSET));
3136432956501f Raghava Aditya Renukunta 2017-02-02  784  	val |=3D 0x01;
3136432956501f Raghava Aditya Renukunta 2017-02-02 @785  	writel(val, ((cha=
r *)(dev->base) + IBW_SWR_OFFSET));
3136432956501f Raghava Aditya Renukunta 2017-02-02  786  	msleep_interrupti=
ble(20000);
3136432956501f Raghava Aditya Renukunta 2017-02-02  787  }
3136432956501f Raghava Aditya Renukunta 2017-02-02  788 =20

:::::: The code at line 783 was first introduced by commit
:::::: 3136432956501f071891c3d4b6194feb2df924a5 scsi: aacraid: Added new IW=
BR reset

:::::: TO: Raghava Aditya Renukunta <RaghavaAditya.Renukunta@microsemi.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

