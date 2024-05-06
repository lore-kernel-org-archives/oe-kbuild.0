Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD51EB36
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714980138; cv=fail; b=tGRlvHhz9dyPnFQs9epn541vT3Mc3ti2uBnzw+whBxE/8gjlJAtY9rIbJr8USHXcmyc3hit8iM30kuOl/zG0gVvnzjkIbSghIKepH1JbFjM8ARkMjRfO9ikpfN4ffMHLzveAi/bzTeVhwDislU0oMSRdGIP3RuAlDRBi9XQjrUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714980138; c=relaxed/simple;
	bh=GG653H24hSlBmeKcNzXV+utUm11abKag+Gq0mh0noXc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BwkVtys8GmcEPhs6IMJcLUh6wTOtS9HE5QUATIurPZLnRCrR4QIRbDMNCEpgBiGLmsvCbXrQ9XuqTSq0ModvcEqIKBGJYD0OFt7mJEtRROl+r0qbd8IM2UFaWorssGoKkngf4nE1uGz+PLH5BhdIRmtFr3FYtGUHP6PD0M3vLDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzF6HZ/E; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzF6HZ/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714980136; x=1746516136;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GG653H24hSlBmeKcNzXV+utUm11abKag+Gq0mh0noXc=;
  b=UzF6HZ/E6K3itNYY+nrXPghA0SH1e4bwZ4nODAvfXrhoZZHT5lgyGobV
   Zgeb1S/Ds4cf67/K+/nIygRw0iu47Vqt2i4p8nyLPr7rspqyOVE1ABUPi
   jBBQti+er6Slq7/fKGnJeyd64EtM1cehFze+bdNkC4Pr6ixqsx2azKpYg
   XYtxWcbElAK9uatG6GUpC0wLbXtow0s0Uo7bAmTA057NRquXaN5IgjI1a
   naFpNg+Lxta4mUOu/dD2UJCjdwSVZQs6okXfWAVUrsdZNdpNi01kKYZUq
   kIP/N2PVKxLhUHirrQqQiw1iaTh+a4LUv3Lq4E/emi4HlDVhVUVw54Fzn
   g==;
X-CSE-ConnectionGUID: vOp93akARYydmiB9D+sXwg==
X-CSE-MsgGUID: sYqSGcZUR2CCGt+LO1igtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10554824"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10554824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 00:22:15 -0700
X-CSE-ConnectionGUID: E7LlQDf3SFyMSiZxhKi6Ow==
X-CSE-MsgGUID: tLt5yp5DQn+P+EHb/1O9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28081966"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 00:22:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:22:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:22:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:22:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy8Yn2EBaGSIljBEyi1JRNGUqwDwidYtCSa5Roy556RjpIk3aSSiK+ovhNMae7aKCqKFvI6R8FTwIYW5FnhA6tw+pXLxOIu/IfnAhAMaoTZgXjVciRxWrYOHSJBKVDY2yUTjM7HDTjRL/QB/CH/64UHkeRc8ritxbg4lN1NNuMGGoVTaL97dIgfwrYLMZD2VRrdhAmDlTUoQTBnA6JGxIlQI4tuiIkJ6MC5Y+2vgOgGIVdfe7x9BiD96iUr18CH2ANhFBhgjTXMbMwKsyNefVw19Q6xwP4rG6Mhy3AryvuWA+T3Re6Y7JTkT1rZ90zDstaSY1Fv85MAN7fqchBOUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR93mmTecvKzT3lQlsrsBC+tV77vxek5hWdRywbp7/k=;
 b=nx0v8IsKRvy7ayA5gF9S5QlAsZE2fQTXf6m88CICHKhz0KkMVpxCHU3w4yfr7staMEAU2qiHeNJuenheTdYF7DKBg8Ec9QeC5haEzRphAEaqVsBlkC8/yV0mEsh6TaOpcFJE2Q1MijNa6WjoZnNennpALJtUtBgIu7DDWXgGTl/DUwyNUb4eyX4UpLnzpGxV8B8F3rn/LcwzTZ4fH7U+lerDWu2Envg+c9TdfBOcy4qsZm2OAgSktJKi5My6Db/hGOSbFmVbWWpjuI+J9stnra2v+GSd/xshfrFFS9ziUeUL3kQR4afImhh/NMxdvfpgttM4IS/yL/4RBGbOu5wEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 07:22:03 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:22:03 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [agraf-2.6:kvm-kho-gmem-test 19/27] lib/kvm_util.c:202:46:
 warning: unused variable 'region'
Thread-Topic: [agraf-2.6:kvm-kho-gmem-test 19/27] lib/kvm_util.c:202:46:
 warning: unused variable 'region'
Thread-Index: AQHanllQ91p7Dkc9mUqLtP5Km3vgeLGJz1sQ
Date: Mon, 6 May 2024 07:22:03 +0000
Message-ID: <SA1PR11MB83937A1FC42881058E2F2487FB1C2@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405050343.ZgfQxdbN-lkp@intel.com>
In-Reply-To: <202405050343.ZgfQxdbN-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|DS7PR11MB6270:EE_
x-ms-office365-filtering-correlation-id: 949f7f1a-e123-43f2-724b-08dc6d9d3a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?ypWBigcYlPeX6n5qovOZsYO3b+Hz2fTfLw3X2nYlOXan2uDroJhDgWUsng1+?=
 =?us-ascii?Q?4GQRIvYWQfzBUlg09T29AUyGSqyo1SLnkj23bYBhiVpalN5IBY+V+NuS4PQ2?=
 =?us-ascii?Q?sENx0W40YY3av6lwis/24x8ygtj0hhuQgIyl1RNNrG83VEDQZzYzioz4cSgy?=
 =?us-ascii?Q?aodDA+P5EGZVe0yRlC38spjK0TJeRSkl+HkR64t09jY3OEWHgPW4p91+deME?=
 =?us-ascii?Q?2whYI4fQ4TQNAs6KwnHIRyY+VI6Ax+8p5trPGFRx/6LaB83sxHyNjRpZ8YpF?=
 =?us-ascii?Q?5ZR9l1tno9BbNq+mCtjsaHZirFZs8AcRf9hi8r6gHHEEK34aJyEH8LESXhll?=
 =?us-ascii?Q?wVKfuVz2Ln8TTtKpF8w6zI8Z2u5CfGBEZqJyqjDs4UydB4YLcLBJlKkZuaxe?=
 =?us-ascii?Q?yD1zRJwm9/0Den7BcZS6WfHy6H2TK9l+EM+Z0ntlFQmwkz7B9PfIUa7TCS7I?=
 =?us-ascii?Q?bpZs/GvFKM+AYhJ9MXnVNGd+in0tUyxozwHD9Nhw9FAy3h/L9Hl64etllqza?=
 =?us-ascii?Q?39a71fmbj8BNbQYNoE5/2UcJq/TnslDtdY4HF3+OEk+zFFMiJfYoal7lSdTR?=
 =?us-ascii?Q?6I1ECqKk62ALEuSQ3Azv8ARC/Bb4abi1ATUXCrnQtwmKBHX2E0rQImwk7M1k?=
 =?us-ascii?Q?Jb8joAvDzZ6dqt01VtawDPqJ/LD03jLdATmFBvqVx9272UsPvsOy5EMsSH6x?=
 =?us-ascii?Q?xhTFQw0i9rpf58DZaq02baHc67jTb1jGEA4zzAdXu/4ebiTbeS/pgSFYwGpq?=
 =?us-ascii?Q?WqbL/h8ud9gVhGKqhtQam6plpUOQPPYacUz7LsXu6ODAjYvD+n8NOhxOjaM2?=
 =?us-ascii?Q?fPWWl5LMpcdVK7qE307aPk/q4FPfC4sas6H+wNrkdIkpnsmraPyEKvI4FzLJ?=
 =?us-ascii?Q?dAtWGgA3ZOeJuF8ZhHqz9Zz1fmvJM6Zo4Vgr2xvRDuxvBnQf59QixIGLcejn?=
 =?us-ascii?Q?Uur1r7MCIwITvDW3g1ZKkSaC9YbIIcvyA9JTsSam1L1OQU/xNuA9l0QIOLQl?=
 =?us-ascii?Q?SwenUunt7Z/6t4FzuNSvzDO6KYciIADjSVBJUFLGiZgpwDKqkWt4vzyuSadV?=
 =?us-ascii?Q?cy+YEuN+9u6b2ZGEvT87e1NLzS/E34f59Zh0SaIKBgZoBPMsAYKWj90Hon28?=
 =?us-ascii?Q?wSfnLa50b3Hd09Tj6b9R7M90QumUe8B23+aArjR7C1zRuHneJQyIdxX3XAUH?=
 =?us-ascii?Q?aAboPvYz1d0wVKuJLr2VNnjVxNupUJ7HGpjad1DJn8+3zT4XdxQ57kzHs4SI?=
 =?us-ascii?Q?Dw4bwjc9klR+/C0MyfAHlaWm0L9hTArWInLdB/ohq4gS72ImtvE6RZokwRBQ?=
 =?us-ascii?Q?q58=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NuLBp3rjZ3gnJ+Lx/eo9kPAwrONMhVnbgqvoYrLRRie2CzJzUbMzdJa/GyIO?=
 =?us-ascii?Q?qF/D0dOqwNIsVqRgzD+a05PQ2QkM9fzRemFXblia8AoYmH8YZyRRiwSK0j8M?=
 =?us-ascii?Q?md4nlcOtqJdqSYd8T/05/2dw66aKcfVTXDrb2MIKJ43V58X2XbyTYb1FYBn7?=
 =?us-ascii?Q?JpmYHpR1YqeLjUmWvkqiPSrXP862nvi6enxBcBFIkcxXJpGcLtInS62244kr?=
 =?us-ascii?Q?iaGJM/vrMeT2tSdyrtjV/eEf8locy/e3bkCCv4B3Ij++tey+mgKUxfoVXqly?=
 =?us-ascii?Q?JcCvWmhL7Ymd4lSWMD4TEsvOgEh2NlCBYK5ZeqttlMQaZDOd//sayhUr5y4o?=
 =?us-ascii?Q?M3kcT1OeSr/Xrtq6p0cXKEHZaBGHJ1e9X2LSYOIoKgKZgFfSbvGsgaLKewNq?=
 =?us-ascii?Q?4p+UT9C2TqB19KyXVznjDqogwrNXr9JurY54z+RFdS97RmQFWWjCBSUsD4b1?=
 =?us-ascii?Q?VOK+15yszorlo/YxPZkAFxvhXW6pR3NGxbGZuk6OVJ66KbUvdjA280jI2DoK?=
 =?us-ascii?Q?p6jnNIfSIAOkDgo6b75tYmHKK+mwIyxda039k3DPZKErq8WTFuewHsQ/RVEJ?=
 =?us-ascii?Q?L9dHnJsSRGOAktjj52LhzXaOdcvpXCAzahJiitLA+E6ddz0C5he/m+zk3bmD?=
 =?us-ascii?Q?alkShfh0EY630G/qFWru8lJtJ7uqZYWZPLnW+0N7maIMdgQ/o1ItKh46KI7Q?=
 =?us-ascii?Q?R87j1eDIkRvfXD/M2Q+XkevOgsGpqke0Ov3PrsizoznHI1/doy1hCuLaYAU9?=
 =?us-ascii?Q?WCyfZ6DiWBMdnxpVWFaLSW8fhwkQaUakW376vjMYpXmvWbt4UGHJB3X6Q32s?=
 =?us-ascii?Q?S7YY6jiK+3H38sLZP77loPNMmPSR2gDnamwHUey/SX4otA32Ejai5CGGmtAk?=
 =?us-ascii?Q?Sb39TSSgaqEJg+0nsZYlA5ZXO+HH3XFJHjpg3Xu4frNCzGl6MbC9+6HYfeh0?=
 =?us-ascii?Q?aX7GzMLNU6TdhLaq8DGHAX2RqR+fD8+Sew/+B7BDBRUfOv7VQ1uTvUgOMu+6?=
 =?us-ascii?Q?/G0rG3Lsif2mKlRHWigY8K1ubnYSRdMB89N8wWupfU8sJAtLY76BgxrfGv+r?=
 =?us-ascii?Q?aduyriTZJdEzMJVz7g1P2Bh3rdi2go2hJ22oTogmNQXLAsPnbM+MK+k38Tfm?=
 =?us-ascii?Q?ViEuK4PnMQxqpCloi7IhKqaQjSqNrmivIHpKLFZ7tTkiDuOsfDBaCUEBvivN?=
 =?us-ascii?Q?l6wRMFGvD1NosH9k6u1UglQ1VaW4/Q0WToVmlniK/J7DuzIcruvnD3DteYvC?=
 =?us-ascii?Q?cjdXn499foBsh92xkd4hDWxRLCUd6lanHZ2+x+kB9CqyVgUIMVRp5YdnIGrW?=
 =?us-ascii?Q?Qw+HXDnaIH30ZZxxA95UqGv4t4XyW7Og+ulT/NRHKPst2ttl6aUSWyiixrFx?=
 =?us-ascii?Q?HKkt/wMTy1jZ3zEx73rhByGMsIOGuvAl9hEGO9/gwJm3Ot8LgOjDLyPZ560K?=
 =?us-ascii?Q?RKksAVcXTXKW86GpyoXifFOc6DCHh0BxDo88ze8mw9oqtuEUjik/DiqrPSm0?=
 =?us-ascii?Q?i5byFEUoB9n+tSeyx2dy0E0BrwZXsvTmDr/AlyJrWDOBtV+iXZMINDVjlQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949f7f1a-e123-43f2-724b-08dc6d9d3a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 07:22:03.2494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BO1cXx24kmna6JAz69NDOvS4VKxtYRtCTYNnWe36rsJm1FaBvd2SYxhufZKgDQSTiVfMzqWIoINdUwkY/R8FqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
X-OriginatorOrg: intel.com

not_report

informal patch

XXX make fdbox work

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, May 5, 2024 03:28
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [agraf-2.6:kvm-kho-gmem-test 19/27] lib/kvm_util.c:202:46: warning=
: unused variable 'region'

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: kvm-ppc@vger.kernel.org
TO: Alexander Graf <graf@amazon.com>

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: ea39f95803e6da8a46791922be3724b49bea2c7a [19/27] XXX make fdbox wor=
k
:::::: branch date: 35 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240505/202405050343.ZgfQxdbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405050343.ZgfQxdbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/kvm_util.c: In function 'vm_open':
>> lib/kvm_util.c:202:46: warning: unused variable 'region' [-Wunused-varia=
ble]
     202 |                 struct userspace_mem_region *region;
         |                                              ^~~~~~
>> lib/kvm_util.c:201:36: warning: unused variable 'node' [-Wunused-variabl=
e]
     201 |                 struct hlist_node *node;
         |                                    ^~~~
>> lib/kvm_util.c:200:21: warning: unused variable 'ctr' [-Wunused-variable=
]
     200 |                 int ctr;
         |                     ^~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-typ=
e-not-at-end' may have been intended to silence earlier diagnostics


vim +/region +202 tools/testing/selftests/kvm/lib/kvm_util.c

ea39f95803e6da Alexander Graf      2024-03-15  191 =20
ccc82ba6bea451 Sean Christopherson 2022-02-14  192  static void vm_open(str=
uct kvm_vm *vm)
fa3899add1056f Paolo Bonzini       2018-07-26  193  {
ccc82ba6bea451 Sean Christopherson 2022-02-14  194  	vm->kvm_fd =3D _open_k=
vm_dev_path_or_exit(O_RDWR);
fa3899add1056f Paolo Bonzini       2018-07-26  195 =20
7ed397d107d461 Sean Christopherson 2022-05-27  196  	TEST_REQUIRE(kvm_has_c=
ap(KVM_CAP_IMMEDIATE_EXIT));
c68c21ca929771 Paolo Bonzini       2019-04-11  197 =20
ea39f95803e6da Alexander Graf      2024-03-15  198  	/* XXX HACK! */
ea39f95803e6da Alexander Graf      2024-03-15  199  	if (old_vmfd) {
ea39f95803e6da Alexander Graf      2024-03-15  200  		int ctr;
ea39f95803e6da Alexander Graf      2024-03-15  201  		struct hlist_node *no=
de;
ea39f95803e6da Alexander Graf      2024-03-15 @202  		struct userspace_mem_=
region *region;
ea39f95803e6da Alexander Graf      2024-03-15  203 =20
ea39f95803e6da Alexander Graf      2024-03-15  204  		/* Recover old VM fd =
*/
ea39f95803e6da Alexander Graf      2024-03-15  205  		vm->fd =3D old_vmfd;
ea39f95803e6da Alexander Graf      2024-03-15  206  	} else
fcba483e824628 Sean Christopherson 2022-06-01  207  		vm->fd =3D __kvm_ioct=
l(vm->kvm_fd, KVM_CREATE_VM, (void *)vm->type);
f9725f89dc5027 Sean Christopherson 2022-02-15  208  	TEST_ASSERT(vm->fd >=
=3D 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm->fd));
fa3899add1056f Paolo Bonzini       2018-07-26  209  }
fa3899add1056f Paolo Bonzini       2018-07-26  210 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

