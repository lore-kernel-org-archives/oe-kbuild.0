Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC817F7
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 01:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650980; cv=fail; b=nifh0MKe5VnPE5wDrLqW4uHoPRuyLTK416QxPs73uwjXDWqtOl3Xkh+3/xGE5A/9l7AcshnfK63uKU8ziWrh4Xona/FxHATiZFqVzYLEL3UFSpnv1FqZCqQzRnFo+ONtStU0sawV1s6UVtAwqoKWpPQvSvvXWwAsOViUsUl09io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650980; c=relaxed/simple;
	bh=c5YRlOwaDLoHE60WHSUBtSlOTlykyM316VEyp2qMxDA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=du35Y5OFZR7wtGTCs/0SP7fddDBs+qQLJDUzdkxB371Z8syHcWfIiYWQuoc+WJj3HS7zCCAyH6jauRJ0y2pkj/fsBTOnk1E7huub7abgYpRoUsvQKyruy/eLrw9BcvN31xf7ev0HxBfmjvF0XSAV6s0aksSL+hBTRd9FgGenC5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtXQpzB6; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtXQpzB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715650978; x=1747186978;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=c5YRlOwaDLoHE60WHSUBtSlOTlykyM316VEyp2qMxDA=;
  b=BtXQpzB6dSkc7T7kTMKz1XHQuKfoJSBMKC3zk7fhEyvI+ROWFo0EIFVi
   d9X4N9ZmRvVGIFKR0FsfXoeCeh+9wxzu3liV7vMXvQbDR8/dsinFgze9x
   1qs7kI6T+VH7TqndWD5xEBCpHmXlnxcH5KedvE6oTFTN51QWvMgOm9poJ
   W3EObkYTt/DRLvRTZd1wK/DWDkpDrPDyHgis99ymsYbswqcznWukKEMI4
   U8t9lVOyC8KOqDax8g70K2yMhJh4W5xkZX0ZSClccfKuisPHXIfQwA2Fx
   4uc4nBvnv43fnXJRgW7K3ngU7kepbEqkeKnB0zAd0ZO5ZQLdjef5zaT3h
   g==;
X-CSE-ConnectionGUID: kdthd+p4TwGfCZhws2bA+w==
X-CSE-MsgGUID: /h069/O3Sd+DCr6ClVvNxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11555686"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11555686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:42:57 -0700
X-CSE-ConnectionGUID: lZScT1aiSE2um9eiWb5KFA==
X-CSE-MsgGUID: dumrOYkHR6+h0md8/bPRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30643411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 May 2024 18:42:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:42:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:42:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 18:42:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 18:42:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSWWeSEEmBhgi+uksYQUo+6LqZtM75uxr4wXDrYCf6lQD1D9ovgcnqApj5zkztNq3SY2YkXStO3eNZYvPNcwm8IjDeQEWrB6U/zR4+8j8aRNwm9LcNC2gvlfbnmZtem4S2utYLuMLTuR9UUhiFlSHJqwd1Nw4wf+kN9coQRkVlUtNiWnyB5ZxOcT1BJ4uIJdzLloKCbN6NMC6DuIZOaG313dslLP9KwLJZq+exJ8ReqlvMrZ2a9dYjkL4dkkVAq05RYNzs9qEtZFCtvxy7h3Pdsrs3isi1kJ8WQCkEfKkh8X/8fiyup33VTIc9oq3TrcHO70v4TpPiOdtSU1zvDtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxk7FJZ/Il/iIZXvbXIg2g5iJVxpDFPAhMqnmkJU01E=;
 b=dhDSfCm8+LMSSS/iMOYpVeuSp8zairD5xTObvpCow0VWSW4bdY7LB8KCg9IIDP0yteXJXIaSuoLTPKbyl7gFJbJUKRJx5H14PRZ5KaxckRYezzGqQXtgUFXbtFBiGg2CnQvLwWuNeTL7zouEmTgfkKm7OlBrz0gUt7M0XhtMhD79ET+odQd2fLcGDHbhOCuLjzrcbFo32W6lteamelbfT4lLa/n/beWGl8Kq7T4tu56RTqRM4sUF6lbSM1h80l2RUyYJKqPsKjZNDdNrzKJDkA9l6X+s1hFZwbGYkTSvIqGPFgPD5OAijodfC6Hk9ijDfcyky6Y7hz4oQQyT57sj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 01:42:20 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 01:42:19 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [linux-next:master 11868/12793] ./../kselftest_harness.h:54:15:
 error: static assertion failed: kselftest harness requires _GNU_SOURCE to be
 defined
Thread-Topic: [linux-next:master 11868/12793] ./../kselftest_harness.h:54:15:
 error: static assertion failed: kselftest harness requires _GNU_SOURCE to be
 defined
Thread-Index: AQHapWNkqj+VcKp/LUqx6RfmK5Xqq7GV9Ndw
Date: Tue, 14 May 2024 01:42:19 +0000
Message-ID: <SA1PR11MB839392497B6AC52258E568B0FBE32@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405140209.ORIxFuOF-lkp@intel.com>
In-Reply-To: <202405140209.ORIxFuOF-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|IA1PR11MB6266:EE_
x-ms-office365-filtering-correlation-id: 98504730-70a9-46bf-6eae-08dc73b717fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Tif4FrFpYTgKVsVWJFHmTjHJVtKswYC3l5pK3doGAerT6DHggDDqAzrkbG?=
 =?iso-8859-1?Q?ObQVEgMG9tFCo6o2xYJ6nJelU7no0MDP857oxpyCMoyeyjD7tQgKo8JKDT?=
 =?iso-8859-1?Q?WL4Y0mIqLYVg5DH1kbbUQP27+HS1mcyjlKqcw1dKsq4+3uASmzaRAc4LEr?=
 =?iso-8859-1?Q?SDSpowH8mZZY/xJnRpOojRKdc0Hw25UHZUpt2555R/wSZBVGp43Nuibog8?=
 =?iso-8859-1?Q?9FYcWQCiUasLypMERSe7luKS7nSYbQm26IlCzbk4rzdR9vf8S1MOxZxJYD?=
 =?iso-8859-1?Q?ZqNrcy13C6iPyhowsNxalEfGdJ+rv3p41hFdQId88+3v2oTntDW2duDn8W?=
 =?iso-8859-1?Q?Pm0d6osrrQRBOgy+GZDrNsVmTYmyF5QzJ05mY2lAeey42Nn5bsNUEUBKH5?=
 =?iso-8859-1?Q?kfgQCUyXLDwpgYKJiexfOswCGZ/K0lFxFbuAxdky8MG+xut6Kqb4N3cDfB?=
 =?iso-8859-1?Q?PsQ4iBestt1oUSASsdOfMN0XKFnzSamHK0d+2o1e9PAc6tnttiXhz95I3s?=
 =?iso-8859-1?Q?9w92SWJs4i71RFIcRTOCEKTJEXk2azhdsq7ur/UGQe30Yqri4/kVRTlQVh?=
 =?iso-8859-1?Q?aFM/Rx/hE68bIIm5UXV8c13l5GnaSKvZ+tcVfgSSaS6xu5GTYaEGEt5gJg?=
 =?iso-8859-1?Q?YgEvHZokRywGVCSOjUKU9+hE3vwmpfx66LM2dhi7aE8L7HNPKhieiGp2qb?=
 =?iso-8859-1?Q?HVU8MNPeqU0rOIFnXZs2SDldMXMEjswipxfFIeK9H49ubOFCSXdd3f6jwu?=
 =?iso-8859-1?Q?3omArhFZHhfUkLmSPv7AzwsxCqfyZpj0+Ext8bsMytonKcpjNQMBaEpOXw?=
 =?iso-8859-1?Q?F/vg2o1pByqUeIwjMFbbpdbXW8HTsLhprXR8/KwMf3px8kO0Nhaz6/NuSE?=
 =?iso-8859-1?Q?0+48Xlsz9BvKrhNIml9XBx5yiuZ4RpnwxdGpUIoOflq/XkS6LFWAnQVdlR?=
 =?iso-8859-1?Q?hOMx3gd8UqnjdRB/R557qY0kR/ASXZDd+YvS0UfJ49CL7RG7nEn3pr4bNC?=
 =?iso-8859-1?Q?gMy9DEhxmVvPhrwJCohq3X3CmW9oaMYVswYiQ/0aIW6TPxYOVWa53Cqd6l?=
 =?iso-8859-1?Q?acPBFzpc3EBz380mAC2SSafZ1lXdS/Xxt4t80So9+zPmsIk6JvWIBeZfA3?=
 =?iso-8859-1?Q?HxPsACi+6UpTnP9fqEFNg5lqStpE8xoV0bhu5mAA/N0m1JjShQZ0J++gD9?=
 =?iso-8859-1?Q?S2/M3wtUfKtl5PedfqqR01LfpQXheuJc4f8Grk7p0QbbELsw6O/Kyc0vhN?=
 =?iso-8859-1?Q?NclIYFQJ7lPQRCgtc/8i2QeVftJWRxkMS3O6S4JLSpYdhJta8v5yYxJMH1?=
 =?iso-8859-1?Q?erM6XDkx6jZgVh02Fmi82jWm7HFtyVG7OZXNS274g41Ebjw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Vsd3onPj4muvw1XHE0qAC+jjwahT9PHnpfPZeuyooWipnHpSnE9BM47JYb?=
 =?iso-8859-1?Q?H+5mCe4f7frrRbxN5QJKovVvSdLNIYNVoyvZ3yYsSBvmsHTuJWN/6GMLy8?=
 =?iso-8859-1?Q?zbZemxY4rWgjiN4N+Fz8eBcRZOp3zJjr7aqKoIClw34jLstO4qbX8IGIII?=
 =?iso-8859-1?Q?rYrBtzKHO8O3LdEV+Pi5lM89VYEQXUc51/G6A1sgZuLLji/AK0ECdsMwJ4?=
 =?iso-8859-1?Q?PjhZZx40+CT7WpxbULg2uUM85J7RZr6wvYmeJwx8FYte8QOAiLrrl+pZuo?=
 =?iso-8859-1?Q?Qns6GKRZlbQGytGHNK7tfIEoj0t6VmlcRozrfZUMhZ3ak94kgIxZQ3/yBh?=
 =?iso-8859-1?Q?/2/q0/Z+YWPUmzevh5jnbw60ft4bq3CsRrUfokdc+JZBIHmcQ5PlxTB60S?=
 =?iso-8859-1?Q?rBWX9hKjF4zSKXANEZ6sbTI5hkYOB3WIWgQ91EACnIir9vr3/3It4tPj9/?=
 =?iso-8859-1?Q?6OLRqXTlJcdb0J6MhoEzEyjNWIKT4m1jWFQeLYH39ElX1H4tEdY1UlDiIk?=
 =?iso-8859-1?Q?Z7AdycfsoU56Z7JuGhVcU5z+RJSIv/4i8ZlFRDwEBr7gbTibGCszo02oZ2?=
 =?iso-8859-1?Q?nOOFmkK1Kse99LvoNqPRNwcUuWhJXZCkDy+Ee0NT0hKLnN1vJzx0Z76OVh?=
 =?iso-8859-1?Q?9Wt0aGDPwzIi0bOTVpZITgK9+KW3IPURnmuJXU6XhdHqfCBC9mSwwnwl70?=
 =?iso-8859-1?Q?97OBJpXZfix1J+Ht912YJiY4oBEX6VKjFNFfo8wHoKPVz1xRm9iJvCf5Ou?=
 =?iso-8859-1?Q?3zyvZm0h+DX662FyGnOYrezKgPiua4wGYfLrUldbRVQxsFGO+Ne3kLVJ7A?=
 =?iso-8859-1?Q?FYF0qovWVv1P/xrnO4TQxMvtkmImjQ/5J/sbr3sYaiZ1gY26dpLysSrRDY?=
 =?iso-8859-1?Q?HZEnSar5DtAmyc2cY0UtacA0VbkBiOfjRDJth801xxHd0IXWGOAGik4IQp?=
 =?iso-8859-1?Q?8yGUc5uDuM1LiN8xI2sowe/mPrIPskRkB/P4BZtDBiBiTQ61lPkYsiCICt?=
 =?iso-8859-1?Q?I//W4FByKlruMGJIRIapTKCStfSYyJzggn5TQPu0qxdjBb4H46MVst4p0z?=
 =?iso-8859-1?Q?W/bYZJNOuhQRbWA/GjVwClUeYw7xUFfjF8Iu8FL9l/DaRu+jfuJkLbeayi?=
 =?iso-8859-1?Q?6g3bLgkQ4f3tksgF2gY3UrCPi+sm+EqIdLNWvq0KBSXNHVzNOgddbwNWX6?=
 =?iso-8859-1?Q?sufcUKaYqatGr2nw1+h8qCBDDREVd1CSKuXJ4ZcaoMxDwDcEn/syXp9n4Z?=
 =?iso-8859-1?Q?kT2OCAxC3hnN9aN/KLLbuTbMr5Tn0ZFnwQiWKZonwOxWbHwHOThwmC8R1K?=
 =?iso-8859-1?Q?7NEzg4H8Pi46EQwcmRfA680gO6W2ZCQiVzGVuqnMxDfpD8WYJlZiW38Qve?=
 =?iso-8859-1?Q?xUrOCl/Hf5LiLNmPn3/Xn2AIdkE+rHqQZd9q2jwpc/3tjRGjK+hctu4boF?=
 =?iso-8859-1?Q?fcwE4YLhJzV4mbtief6kRSSZZ9DpG+37PM5r6IKfzQs9xudnaDYvFohs5I?=
 =?iso-8859-1?Q?89ygehyD6hOTqcFUIlhQmFS5ZX8iWgSt0vFjf9jcgFxkIQ2rpItcHy79cr?=
 =?iso-8859-1?Q?QL+Zc9Rx5CFpRihzyKEW4rOxgeg7Ts0I3JoyBgPm8sbCl7BIjM8f/yyk0G?=
 =?iso-8859-1?Q?mI9uImxQ1L/MrCpFUuL+6CFpZwlF1k9PCO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98504730-70a9-46bf-6eae-08dc73b717fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 01:42:19.7923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RG6RMQeGSgCgkhG9pklqyuv4ABREn7gjBRUtKVEktchLMc7PvKuUH66mxO6lqGVPTsHlETYWyg5ng4MqfqnUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202405130312.R5mxIDyQ-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, May 14, 2024 02:26
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [linux-next:master 11868/12793] ./../kselftest_harness.h:54:15: er=
ror: static assertion failed: kselftest harness requires _GNU_SOURCE to be =
defined

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 [11868/12793] selftests: C=
ompile kselftest headers with -D_GNU_SOURCE
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240514/202405140209.ORIxFuOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140209.ORIxFuOF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from test-pcmtest-driver.c:10:
>> ./../kselftest_harness.h:54:15: error: static assertion failed: kselftes=
t harness requires _GNU_SOURCE to be defined
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be d=
efined");
         |               ^
   1 error generated.
--
   In file included from main.c:21:
>> ./../kselftest_harness.h:54:15: error: static assertion failed: kselftes=
t harness requires _GNU_SOURCE to be defined
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be d=
efined");
         |               ^
   tools/testing/selftests/../../../tools/include/linux/build_bug.h:78:50: =
note: expanded from macro 'static_assert'
      78 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                                  ^~~~
   tools/testing/selftests/../../../tools/include/linux/build_bug.h:79:56: =
note: expanded from macro '__static_assert'
      79 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg=
)
         |                                                        ^~~~
   1 error generated.


vim +54 tools/testing/selftests/alsa/./../kselftest_harness.h

c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  52 =20
e80068be21824e4 tools/testing/selftests/kselftest_harness.h    Kees Cook   =
   2020-06-22  53  #ifndef _GNU_SOURCE
daef47b89efd0b7 tools/testing/selftests/kselftest_harness.h    Edward Liaw =
   2024-05-07 @54  static_assert(0, "kselftest harness requires _GNU_SOURCE=
 to be defined");
e80068be21824e4 tools/testing/selftests/kselftest_harness.h    Kees Cook   =
   2020-06-22  55  #endif
369130b63178e0e tools/testing/selftests/kselftest_harness.h    Micka=EBl Sa=
la=FCn 2017-08-07  56  #include <asm/types.h>
65177e47d3035c0 tools/testing/selftests/kselftest_harness.h    Jakub Kicins=
ki 2023-01-25  57  #include <ctype.h>
369130b63178e0e tools/testing/selftests/kselftest_harness.h    Micka=EBl Sa=
la=FCn 2017-08-07  58  #include <errno.h>
369130b63178e0e tools/testing/selftests/kselftest_harness.h    Micka=EBl Sa=
la=FCn 2017-08-07  59  #include <stdbool.h>
b5bb6d3068eabb0 tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-12-10  60  #include <stdint.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  61  #include <stdio.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  62  #include <stdlib.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  63  #include <string.h>
0ef67a888375b0d tools/testing/selftests/kselftest_harness.h    Kees Cook   =
   2020-06-22  64  #include <sys/mman.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  65  #include <sys/types.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  66  #include <sys/wait.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  67  #include <unistd.h>
63e6b2a42342c32 tools/testing/selftests/kselftest_harness.h    Kees Cook   =
   2022-03-24  68  #include <setjmp.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook   =
   2015-06-16  69 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

