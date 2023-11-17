Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1C8CA48
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dT8sCcIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700210453; x=1731746453;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tQCBzudJngipvbgBXyZqUT4fvYQwbPjfNRUlveIQI9o=;
  b=dT8sCcIx5/QR1ade0+LVGcyfn+RyrXaw1xVa3ZHOSXey6mGvdf13ueog
   myH1kLqYtgd0+Omdh3vjQsrmGtu62XOP85OC82y7jhbMluvZCTJUzppf7
   /nzmDhLmPdyGnp0k70xO9AvLJqFFSbibGvBzhAM2lkcbj20XCFnZjYPn4
   Cb8P2g97x4IkOoRQkCylfjOUL/cwo9fo/hvXXJZ8sdLXnT8cftRcmWwAj
   hm+6Z0w9IW2QL5aMcRxujDya9KfamnzYHtDGrNufxzS9UrSDjsfiHLDe7
   FW4oCuuh8g/ylshNWoEHJIwjwd6dqqFEQA4I0LtCInrzX0WnPoxYTZ2PV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4347847"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4347847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 00:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1097040087"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1097040087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2023 00:40:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 00:40:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 00:40:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 00:40:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUN039I7yQ26xd234OI7ucQUSFBpluhBfISsLQ/qpJjTCTJLeyYx6facRDCKanyvTc9d4KAzo+Q9z4kKhjMS8njjgdvJBk39Qb8tgSFiwMqBzyXdcpi+HWiQHL7HkHf2ctyeji01Twr+FL4XvubwebCtBFtNZENSKwQPbM970kVCvbl8BDNcoHtPJobcZTHrushL7ucto5xiVLFuNPINN50gzOjNULrfsfhy9jGVEx09ejYCNZV32cnzWorD7LayVSEfFT0lKrYNg1F95LUWEd9NMk05swWoP2sMxx8i9L0uWgIvPhnZEUjfHeaInqdKYo69rq0Ct+9BO+omNHTuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqQtay4SRqFl3N5jrj0f78lSyXr1QWU0mojgFHU73fY=;
 b=dqR4crxmuxIlrVYF4+sGeMkCyD1rw/PjaBgLhog8gFYNLL3sSt0SjZEhvQzSbas7RX7o2FrXWFLb1sK8JTt4ji1UuYjPqxBfTvMfeAYbfLu7QiFZIpoxLT5D+bQII7auiQbkxtwqdY8xLLo2WKHJe6dOK8hasfL5nkQNLqjJvE3oyXnCGQPE+LMb4PDHJYtueImlCVpNEAjwemsJrKZEUWsEjVR44dt/gFQr5NLloYo+/E2wxgkDFevR57YTWh3CtFUGKONI3QEoAzo+AGfanLwL22bd9bRH8LtdBnf/cxIBIk982ZPXXWhKEvlFCDTLchec5IhwiyqjgL9hVnXsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:40:49 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 08:40:49 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Thread-Topic: kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Thread-Index: AQHaGI3HCqzgO6zV80mtwFd/z1FtMrB+MkiQ
Date: Fri, 17 Nov 2023 08:40:49 +0000
Message-ID: <CY5PR11MB63927BC23D9248C89BAC2C82FBB7A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311162049.FrgwcH0n-lkp@intel.com>
In-Reply-To: <202311162049.FrgwcH0n-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB8166:EE_
x-ms-office365-filtering-correlation-id: 2ef1c9ac-42e5-4111-3315-08dbe748e667
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SNVoYDCw5h/wj6c6wIhv/i93HSmSOstLwNN4Hk02cT7TgeuCgGnTWhEgIb8GtgLORdZ0MAQbpeT+apJb4kqiK9rHdPIiPUpZK/y13RdsGlhLX4o3y7/oZAHH7k2F4yEEMWio4K0qHKi0OjHBoqyxnQyg4FmpfvjTpXnw4p7fO8tpt81ORA0ALWeLudZPNG6+p40bkAeJXfoYnLImJMDeKTC2/6WfEnHRUjEItgcvZ930i2xNVZOWYrslGHnsKsEt6Fn4f4h2xTYD4t00I6CqTOPZRXW9I3qmnwoRQdPDBPBkqL4dZ8Qc0/E5gQyanTwoJ0mn6BR3v49HY3ywYMvqCJ1TPSY+wHMxcIFxy+rZmwbZ4u+LL3eb7y41jQJNa/YsJJWUxzVpE34/czh6s1WSOlj5kMBnUOec13aaVp1qQM/9qsg1rbjdSeFN9pAYLZtY9evzwkIL5LOM4hRFGJ/jMBK6/RQVaYKTJGxuKn419OFHOOR37nLP0nhJ4yLnsdhUtid7K+iCTTrDHvvaIJiI++IZCQZU7BNtPirUbFqv203z5pap+AN3vrQjQ5FnYPa3LvY9fy3cNOAdRdutu1Xy1GyxlmrO/9an89jeNMxIb2E4cwkNA5D/C3QuBhatmj43IIhV8k3YKVBUiiqtgK0AsqYox26EFgp9zCb4YX95u4cbW5tA5dUu4SBw8MmN5S8c
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(52536014)(8676002)(8936002)(86362001)(5660300002)(316002)(64756008)(66446008)(66476007)(66556008)(4001150100001)(7696005)(6506007)(71200400001)(33656002)(478600001)(41300700001)(966005)(38100700002)(9686003)(55016003)(53546011)(38070700009)(26005)(82960400001)(122000001)(66946007)(30864003)(2906002)(110136005)(76116006)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jchluJF8fE4FuAMQu2/zgy8TKti4RV58qZczp04uVN4GD3U4eSpYBhBU/i74?=
 =?us-ascii?Q?Pl8DlqlEoYbWx32OQKLucp9eDzRwJg2smQlKp72IGdT2Zyjo+QYxoSvVPZ6Y?=
 =?us-ascii?Q?vXAPWlch8dBjBNoBKgPDBBECGEiBiTOLwDqIAA53JW015ywEOdlhLQDXKb5Z?=
 =?us-ascii?Q?evdI1+usH/gQE4+B/ZA2qP5D6IxUChszsgKBvhdsfZuEA5GZG5TLMwVbjdpG?=
 =?us-ascii?Q?hMFKmxDP43YDy9aF7rxBp3tigcJEEblLmr3PshHM5PlYUh63muXjxa16yXJu?=
 =?us-ascii?Q?O9qQqREmuTdjbYn9exIfJUJk7n3bRdVUjgKxKwrvD6X4iCTkCFXgY/G6/gcs?=
 =?us-ascii?Q?CY64DvUhPdpCOZ+oXMVF0Tr9grBmS5beZb6bHKK1OegYLW0GmvEGfZT6JQEg?=
 =?us-ascii?Q?kBmQcsfrnrUQcH4KV01Q9jSuAXADnpJiBmQLb1JeJZIcHuEhbsIkRuCZzrqw?=
 =?us-ascii?Q?1yrlhQgv1WUbNbbpHQrBfrvYGPYPfbqpZbFvHLe5hz4fxaRI7+tUmQn5dPVn?=
 =?us-ascii?Q?mJA5PPV7laTCKGun5wC4Ng+GfSwwbF9kS0uGHW6GZRgcF57jE7v+t7OrYE/b?=
 =?us-ascii?Q?qYQrNyHNU+wxyl9Ga+VBLTsIa7Ta5W4R5hQ5N1PM1MXms11It2kmmg6FfQxB?=
 =?us-ascii?Q?g8EWWYdBERyuT7AES3omF6chnzSnrUL6Fu59BlILtLtnqv/pSnVMu9xw3EYQ?=
 =?us-ascii?Q?2tCDCtdB7y06r+eSkmJEzWYKgHCmw9ppRH2kr9yajLF1QWkgQvVp4ECh7epr?=
 =?us-ascii?Q?VSPv3HvqpFoTJqaF25+WdMt/Qo7oaRLs51S0zoEHoiosqf1rHevj2XmiOf17?=
 =?us-ascii?Q?mTocV+MfvlDhiBOR6ZlLeB0D+pDuoqBenjSW+Jdvx3SBro4XGK7pY3chRJGK?=
 =?us-ascii?Q?SlgQBX1TAlF5NtM/eNkrr1gJkSDA0qRT1TakgHguLzSE9LbVCMWteCm62lYM?=
 =?us-ascii?Q?uds9rrmINXa7W3qLouk945+kz5bGdPg0QvqlDMmWhnJj3gg4OT7ztBHbRsdy?=
 =?us-ascii?Q?REBuJukJCZ8gxov4s49GeMmQAolvZP7KQkpyRhTZLZfKdkCezgXM7oygnNx7?=
 =?us-ascii?Q?DXZQgPFCSQ2UQb3S1GYAqUhLCy9XQd1YDZa6UwLJVANApXJNtpzMbmgmsoTQ?=
 =?us-ascii?Q?5XdUGbFQLfYDWWVWdV+6CsP6AjHKTZVM59lVZdtiqtSyu8mdQbvbxQUMu/QZ?=
 =?us-ascii?Q?6imBTp27hV/KNNp0ddXWDhSw25TxuqBxGv8fgbTx6zwDQ/GD05Hq1o7jxHwo?=
 =?us-ascii?Q?yzAekCF9ggm0lQRvYCF25sXEYS3yFhDeSYVvKknsCmX5mZSinuS1yxQkFJVp?=
 =?us-ascii?Q?hSh0Oqmeqs10IayQOfpT2Tyc5wID3usD/5ujImZt8jgjyN3iuOxYpMiMk2pq?=
 =?us-ascii?Q?BA2iTkmjRenxt4xu0ygpEO12Hwd4qAxdGsDt8uNyoB5IBhkB9qc4f8BLMaUB?=
 =?us-ascii?Q?rb2BDpw/BgUmsFJEqQ2HcEhVW3WzdWxubRYnPgtarvN/pNCKJPaxgBgQrNiM?=
 =?us-ascii?Q?LPWqGMm7gHgse9oCdrvGISTkah7jKo8mQOx56lVs4MpAQHaVNUSSA95cGnXu?=
 =?us-ascii?Q?hB27EiStp8g4VrElZBzGFzi0NlzXj2JR+cT0ULj5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef1c9ac-42e5-4111-3315-08dbe748e667
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 08:40:49.1862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V1Yff2ANqsi582qUUScRqgn+Ih6oNqEMaq44lPoO0YVcJKOBXDQYiOBTFuM+ubiqFNiGlfWTUm/DjJvtfd97vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
X-OriginatorOrg: intel.com

not_report

This commit only changes Kconfig file. Not the cause of the sparse warnings=
.

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e14396a2ddcbf..86fdc8c556087 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -135,6 +135,7 @@ config LOONGARCH
        select HAVE_PERF_EVENTS
        select HAVE_PERF_REGS
        select HAVE_PERF_USER_STACK_DUMP
+       select HAVE_PREEMPT_DYNAMIC_KEY
        select HAVE_REGS_AND_STACK_ACCESS_API
        select HAVE_RETHOOK
        select HAVE_RSEQ

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 21:03
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces)

::::::=20
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 80c7889de7a8246e44a9632a2b7d15b41ab3fe41 LoongArch: Support PREEMPT=
_DYNAMIC with static keys
date:   8 days ago
:::::: branch date: 32 hours ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r112-20231116 (https://download.01.org/0day-ci=
/archive/20231116/202311162049.FrgwcH0n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311162049.F=
rgwcH0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311162049.FrgwcH0n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/tree.c: note: in included file:
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got unsigned=
 int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __p=
ercpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got unsigned=
 int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __p=
ercpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got unsigned=
 int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __p=
ercpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got unsigned=
 int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got unsigned int [noderef] __p=
ercpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got int [nod=
eref] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got int [nod=
eref] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got int [nod=
eref] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
>> kernel/rcu/tree_exp.h:808:17: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void *ptr @@     got int [nod=
eref] __percpu * @@
   kernel/rcu/tree_exp.h:808:17: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:808:17: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got unsigned =
int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __pe=
rcpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got unsigned =
int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __pe=
rcpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got unsigned =
int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __pe=
rcpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got unsigned =
int [noderef] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got unsigned int [noderef] __pe=
rcpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got int [node=
ref] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got int [node=
ref] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got int [node=
ref] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_exp.h:817:9: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void *ptr @@     got int [node=
ref] __percpu * @@
   kernel/rcu/tree_exp.h:817:9: sparse:     expected void *ptr
   kernel/rcu/tree_exp.h:817:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got unsign=
ed int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got unsigned int [noderef] _=
_percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:723:9: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *ptr @@     got int [n=
oderef] __percpu * @@
   kernel/rcu/tree_plugin.h:723:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:723:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got unsig=
ned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] =
__percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got unsig=
ned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] =
__percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got unsig=
ned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] =
__percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got unsig=
ned int [noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got unsigned int [noderef] =
__percpu *
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got int [=
noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu =
*
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got int [=
noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu =
*
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got int [=
noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu =
*
   kernel/rcu/tree_plugin.h:1262:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *ptr @@     got int [=
noderef] __percpu * @@
   kernel/rcu/tree_plugin.h:1262:9: sparse:     expected void *ptr
   kernel/rcu/tree_plugin.h:1262:9: sparse:     got int [noderef] __percpu =
*
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got unsigne=
d int [noderef] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got unsigned int [noderef] __=
percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *
   kernel/rcu/tree_nocb.h:1743:9: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *ptr @@     got int [no=
deref] __percpu * @@
   kernel/rcu/tree_nocb.h:1743:9: sparse:     expected void *ptr
   kernel/rcu/tree_nocb.h:1743:9: sparse:     got int [noderef] __percpu *

vim +808 kernel/rcu/tree_exp.h

45975c7d21a1c0 Paul E. McKenney 2018-07-02  794 =20
d87cda5094585b Paul E. McKenney 2019-01-11  795  /*
d87cda5094585b Paul E. McKenney 2019-01-11  796   * Scan the current list o=
f tasks blocked within RCU read-side critical
d87cda5094585b Paul E. McKenney 2019-01-11  797   * sections, printing out =
the tid of each that is blocking the current
d87cda5094585b Paul E. McKenney 2019-01-11  798   * expedited grace period.
d87cda5094585b Paul E. McKenney 2019-01-11  799   */
d87cda5094585b Paul E. McKenney 2019-01-11  800  static int rcu_print_task_=
exp_stall(struct rcu_node *rnp)
d87cda5094585b Paul E. McKenney 2019-01-11  801  {
314eeb43e5f228 Paul E. McKenney 2020-01-03  802  	unsigned long flags;
d87cda5094585b Paul E. McKenney 2019-01-11  803  	int ndetected =3D 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  804  	struct task_struct *t;
d87cda5094585b Paul E. McKenney 2019-01-11  805 =20
314eeb43e5f228 Paul E. McKenney 2020-01-03  806  	raw_spin_lock_irqsave_rcu=
_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  807  	if (!rnp->exp_tasks) {
3c1566bca3f834 Zqiang           2022-12-24 @808  		raw_spin_unlock_irqresto=
re_rcu_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  809  		return 0;
3c1566bca3f834 Zqiang           2022-12-24  810  	}
d87cda5094585b Paul E. McKenney 2019-01-11  811  	t =3D list_entry(rnp->exp=
_tasks->prev,
d87cda5094585b Paul E. McKenney 2019-01-11  812  		       struct task_struc=
t, rcu_node_entry);
d87cda5094585b Paul E. McKenney 2019-01-11  813  	list_for_each_entry_conti=
nue(t, &rnp->blkd_tasks, rcu_node_entry) {
d87cda5094585b Paul E. McKenney 2019-01-11  814  		pr_cont(" P%d", t->pid);
d87cda5094585b Paul E. McKenney 2019-01-11  815  		ndetected++;
d87cda5094585b Paul E. McKenney 2019-01-11  816  	}
314eeb43e5f228 Paul E. McKenney 2020-01-03  817  	raw_spin_unlock_irqrestor=
e_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  818  	return ndetected;
d87cda5094585b Paul E. McKenney 2019-01-11  819  }
d87cda5094585b Paul E. McKenney 2019-01-11  820 =20

:::::: The code at line 808 was first introduced by commit
:::::: 3c1566bca3f8349f12b75d0a2d5e4a20ad6262ec rcu: Protect rcu_print_task=
_exp_stall() ->exp_tasks access

:::::: TO: Zqiang <qiang1.zhang@intel.com>
:::::: CC: Joel Fernandes (Google) <joel@joelfernandes.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

