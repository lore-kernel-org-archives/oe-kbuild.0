Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8E4402
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuY+QXIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699837418; x=1731373418;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mlFS/HmcbFLFqOfKXLCXsRNsLlKBFUUyzRGqYFfVdIY=;
  b=QuY+QXIznnFCIABItGHfiSQfZAbO/NwD2JcPq0fyBiJIz/2CMPX5Zbco
   h/UyE6afkoV8wL0pw20++TVC4UbzSeYTv+useq/6Z24S8s7NHZAPovL1f
   Hfl+f8QnZElvKht+cpc7+KFjLHqIf6D2n5xhrNeEWVVdPldL8C6GwksQZ
   zq+EaG/Uob6qgQJzkCUFIFMSJ6a+0+Lk8C18+85p/OniJjh6Xc71C5ptW
   GVB0CIemkVuZo79klzdDqBJMADu1RUfuc6qwb5C+JSZfToCXb34syUsG1
   lEnhXe5AgqtChwVbEC25r0kO7yyJoT72puDGD2AqCLLIFcPfg3P6ROqbX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421460220"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="421460220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 17:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767769145"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="767769145"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 17:03:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:03:33 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:03:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 17:03:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 17:03:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpVpQRg7tJVSPzuTDQqXenkTCGaCqOoX2Y07qckD1DUAiaEdFF4J3l0Amxj1yKrBMJ2SC9NJI401U/TzkPGFTGUAwpjSFAFu1pQ9wdD/Tbu72EwKmYLXo7w/B17I1hj2SFwjxHG/rTWJ77baeXaEMTUjhdSBUP2LmxuqOD1f7fRYS8E5z0fTZjeMxLjde7QsEJXbKSkxiq3Se5YgTjbSkmp1u6Ujd7Utvz+USYm4vmAH4cDjPyruFxY+d9wIIAqEUn0en+55Irv0EVKZIuC3W+8oNGEZsyfhfKGwqsVbb+zc7mF9dmFtsZMyzFp37tQHh6CvB0VuzLDl/KJb+0FtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtxPfnNZrSjXIJzVPx4mlfsIpLDkHhCL8yn0wS8XGKo=;
 b=XNLmQHZwcUC4mxavVtcFpP3USzggslmuZEk1aFTETYHV+m75JDenmW9P/tOyHen1M9sVNrGNkqir8BzKmL8u9tJwT+6D9nQKJUv0Myb69APKM3iwbb25GFyhv+m7VvLqBr4NigH7v/6vtb8IwirAbtASOMxHkbFx5+IOiznme40e9WEkpKKYJai+qWwJFxQpByBwyGb8mv0XGJf0RgBMmz/ztaQHcs/85jxldKgU/5XUYm9Utvf4q1vuPztOr4hbFHV7AqPniYe4EZC4uDwWwyARDyeYBgJobUSJ4FaxlqxhDrk97TPy1vDGvnff0NqMYAEYre1PMy2HCAk9nIBFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26; Mon, 13 Nov
 2023 01:03:30 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 01:03:30 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/hwspinlock/hwspinlock_core.c:180: warning: Function
 parameter or member 'to' not described in '__hwspin_lock_timeout'
Thread-Topic: drivers/hwspinlock/hwspinlock_core.c:180: warning: Function
 parameter or member 'to' not described in '__hwspin_lock_timeout'
Thread-Index: AQHaFPJjiR9jIK3WZkms5FT5SfeWdrB3cE6g
Date: Mon, 13 Nov 2023 01:03:29 +0000
Message-ID: <CY5PR11MB63926A7EA983C13934B9A37CFBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311120622.zCLkxQeD-lkp@intel.com>
In-Reply-To: <202311120622.zCLkxQeD-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA3PR11MB7415:EE_
x-ms-office365-filtering-correlation-id: 14d60203-9044-4df9-1ff2-08dbe3e459ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LRg/QV4K3DAoI2Ya50lpmxOCW2zf+Jt0FL6RVK5eF9IL1NJyQVtKCP77NFJmKhrFqo+BHI2agZzL0EZmF/1lxC/GqET9m0OqgeGbTLWXfu4IHg1IeTKXlx7vM9jF8ZQbMQOhQiSDkvp1XoBaEjaCBcHQfB42c/w6ztrquRa6QPJyW60OsfkL+svfOC39XjpvP/hlX7J/jKTRQagZpoFpfXR0OHPxocYD/qtYNMTEfxcnx3tbtm8c5QFRJPWIkn0NHoim9t4+b7R+BcTIeCMHrEI/rqvMDh/uLMdyfVYNK0/9jGjbubHZQ9TejqV3UNUu8AtnZ9RsKBl0x3JqKhk5TQrNHmnmEVoRPATOg27YxxijWMxKx+z6mvSB+Wu3USFDX1VhjMdEHLSoPkgKpG109aPB2Yl3qbup6Kx/H5SO9Sjsh26eeKU9fjKlqIDVCA67wn0J81KW5eJz6Fr2hwREAwT7EOegjrILe8w12qpdHM+pfxJRrKX8y2Ziyg8vnBRXb9Se8CSSoWj6YWoYYvQt7H+ALupKdYI1ILZ9uZoZHo82WpK7sQURBCp+oZ7nY/BT1vsBpzmgteFgEe7VEES1PHDEHWcYAQ1eJLOf1xUJFAbNPKIspy42qdaiXPZBBQBN7B1qDzgsmksMMq9rGbAC8BUkc+Rkk8ECSPLh36inEMqizwVJP+0gcwepSnmsUkSf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799009)(8676002)(8936002)(52536014)(71200400001)(38070700009)(26005)(2906002)(5660300002)(86362001)(82960400001)(30864003)(7696005)(6506007)(53546011)(55016003)(33656002)(966005)(122000001)(478600001)(41300700001)(38100700002)(83380400001)(316002)(9686003)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L3I+G4M+R3JG5gOXG4eXc7boagaoJQdo5e64QgIMWsv69k75DTbE4HtJZ6MD?=
 =?us-ascii?Q?pH3M6MwUf+rK8zq2c9nGddIfRXRo9qNpr5xvpZ9PYgf2aLR39W1Q5tDMUoAg?=
 =?us-ascii?Q?0zD7UHkBSO8UNVYiNzh3N2UC1Gje0PvywiXOs+dnqESQIlAcnWP1A+A6Ufyc?=
 =?us-ascii?Q?muMOxFfqJVUddUMup2SDAjOQ0iJdnyEjny/6YY3glvYz+cz7sJ7//NPYo6Lg?=
 =?us-ascii?Q?UBVlW/ZWqnhquzPnx9LLNkXhmOeeiT74UCZ9MjVPmn1yjRfHSkm30k/sFoJ0?=
 =?us-ascii?Q?kqxNW7oRNUUHVNfxlRP5UCA8eKvfWqEmeeQfeT70307CpEzSb6bSQj2OXbZR?=
 =?us-ascii?Q?dXih5luBgjOYO0wXOtaszZ+4PS0MOMR7gGpZRHk+uFjSxTDP+4TXODLM06VN?=
 =?us-ascii?Q?/sShEtLPJgNQOzdoXYOXJlr3KyhCvzlCCN5lcIFP5FYEwpglKCeEN9UqxYmf?=
 =?us-ascii?Q?4voQtMdFA3VIaJ3reoMDoRC8rQFQOgHu8k4u+GuHZdElGdAyS6/SoBWJNeBI?=
 =?us-ascii?Q?llcK4MUODcHyczQey9As3WbTU9+EDAUjlbGxP2rCLL+SdY0jlkU0R8OWhWBY?=
 =?us-ascii?Q?EJXFrVpxB8qMWsTGzIMN9/X7eMsvz7oVO/If4teagjc6hRwJI4as9AqOgPh4?=
 =?us-ascii?Q?Qn390h2C5c+IS6hI2iJCzMaHhc6Y8lnrxrJlC+tqTRuNipOJvXyJsfJwLmSH?=
 =?us-ascii?Q?OSRlhoonNafQ5euikbAWBOFxDTvp4yEzugf874FR3CiStoBX+y0ukxmXrrfN?=
 =?us-ascii?Q?4mLE0Y+COUFvt+vUEUxpP956shU3niYAkagA4kCGNsEJu5GMiWv4p0SbvWgp?=
 =?us-ascii?Q?ey/LRKz4MO2Fb+M+wJi4u5YMYh8VzXZyQe0eRwWpcICost1wUnKZ8XaSs34v?=
 =?us-ascii?Q?NDkOWPM8UpW9oJRzg2ftlZi3bZiDbRcV9LkoIqJw5zS2rMkz577zUrwq6QlY?=
 =?us-ascii?Q?ZJo2BnpnvjqUbrliq5mmwCVu07X/IQOwXKSnwAxx2cJA3arOTQ+G1zqSdBAL?=
 =?us-ascii?Q?+GrCo79IML5pKd4aAqBgZN6d114oiD+5w/suSeSk5qA0nqelXV2T6Um0eXo1?=
 =?us-ascii?Q?ydRf648ZOV+J6Zn4bWPCeSkh7z79U5LiLpIPo0Hb13Li5PK/cc9SX1tmdqu1?=
 =?us-ascii?Q?whk5Dot0aI1vPJIT6cL1zKQ3ZKVnZIO4J6EAqVMspWjJFrG22yPuu4T4UlAo?=
 =?us-ascii?Q?EwTxCMXQdIVnI1K1y/U1hrjavkB9IXdmuJr0ZMj239DWfyNzclp4MeE+vi5S?=
 =?us-ascii?Q?3grt8zvDVNeOz6jinYZ/xzjDQuHdBMIp20XyiDPwqvZfuXQ4P1Umvvk4Ox/b?=
 =?us-ascii?Q?Qt2orKNyrVpqBrcW6nQkzubwTMEC9dYPuGfEcMVvdUpYQXCSENVRWTNWnH9W?=
 =?us-ascii?Q?/LbIGYAC15eouUYoTNgWaO4I1lkZ7d7scCQZx7nxAYrJOq4j6nRN0I+b2xwW?=
 =?us-ascii?Q?CWw/qEH5jVcvuYLt3Cr8aryBfC5tUAAB7wNuaydZVOak7jpkRIDg+R0MYKwp?=
 =?us-ascii?Q?cuxISu6840K8V4IOrL3lrMzHDZi7fY968plk6zCE9/WOT60yZzFAPYbMWi8R?=
 =?us-ascii?Q?mw2ZVJrBvQAnyIxx1ixf7GA3CLUXzi9J1UB5hSX6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d60203-9044-4df9-1ff2-08dbe3e459ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 01:03:29.9368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wT/qadxUKaUecGFzTKk5f3UtWiLfHmxI15mIXU6WUFgbMCFv7BZQxcgtqnYu4ycE78d/iefklfFJFyeifoK6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
X-OriginatorOrg: intel.com

not_report

This commit only changes Kconfig file. The warning is from kernel-doc. No r=
elation between them.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, November 12, 2023 06:56
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/hwspinlock/hwspinlock_core.c:180: warning: Function parame=
ter or member 'to' not described in '__hwspin_lock_timeout'

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Legoll <vincent.legoll@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 35fc8a07d7f921333311662590765af5645fd3e4 Make HWSPINLOCK a menuconf=
ig to ease disabling
date:   6 years ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-r035-20230822 (https://download.01.org/0day-ci/ar=
chive/20231112/202311120622.zCLkxQeD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231112/202311120622.zCLkxQeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120622.zCLkxQeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwspinlock/hwspinlock_core.c:180: warning: Function parameter or=
 member 'to' not described in '__hwspin_lock_timeout'
>> drivers/hwspinlock/hwspinlock_core.c:180: warning: Excess function param=
eter 'timeout' description in '__hwspin_lock_timeout'
>> drivers/hwspinlock/hwspinlock_core.c:274: warning: Excess function param=
eter 'bank' description in 'of_hwspin_lock_simple_xlate'
>> drivers/hwspinlock/hwspinlock_core.c:487: warning: Function parameter or=
 member 'hwlock' not described in '__hwspin_lock_request'


vim +180 drivers/hwspinlock/hwspinlock_core.c

bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  150 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  151  /**
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  152   * __hwspin_lock_timeout() -=
 lock an hwspinlock with timeout limit
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  153   * @hwlock: the hwspinlock t=
o be locked
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  154   * @timeout: timeout value i=
n msecs
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  155   * @mode: mode which control=
s whether local interrupts are disabled or not
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  156   * @flags: a pointer to wher=
e the caller's interrupt state will be saved at (if
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  157   *         requested)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  158   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  159   * This function locks the g=
iven @hwlock. If the @hwlock
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  160   * is already taken, the fun=
ction will busy loop waiting for it to
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  161   * be released, but give up =
after @timeout msecs have elapsed.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  162   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  163   * Upon a successful return =
from this function, preemption is disabled
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  164   * (and possibly local inter=
rupts, too), so the caller must not sleep,
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  165   * and is advised to release=
 the hwspinlock as soon as possible.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  166   * This is required in order=
 to minimize remote cores polling on the
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  167   * hardware interconnect.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  168   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  169   * The user decides whether =
local interrupts are disabled or not, and if yes,
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  170   * whether he wants their pr=
evious state to be saved. It is up to the user
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  171   * to choose the appropriate=
 @mode of operation, exactly the same way users
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  172   * should decide between spi=
n_lock, spin_lock_irq and spin_lock_irqsave.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  173   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  174   * Returns 0 when the @hwloc=
k was successfully taken, and an appropriate
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  175   * error code otherwise (mos=
t notably -ETIMEDOUT if the @hwlock is still
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  176   * busy after @timeout msecs=
). The function will never sleep.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  177   */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  178  int __hwspin_lock_timeout(st=
ruct hwspinlock *hwlock, unsigned int to,
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  179  					int mode, unsigned long=
 *flags)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17 @180  {
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  181  	int ret;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  182  	unsigned long expire;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  183 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  184  	expire =3D msecs_to_jiffies=
(to) + jiffies;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  185 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  186  	for (;;) {
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  187  		/* Try to take the hwspinl=
ock */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  188  		ret =3D __hwspin_trylock(h=
wlock, mode, flags);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  189  		if (ret !=3D -EBUSY)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  190  			break;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  191 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  192  		/*
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  193  		 * The lock is already tak=
en, let's check if the user wants
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  194  		 * us to try again
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  195  		 */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  196  		if (time_is_before_eq_jiff=
ies(expire))
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  197  			return -ETIMEDOUT;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  198 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  199  		/*
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  200  		 * Allow platform-specific=
 relax handlers to prevent
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  201  		 * hogging the interconnec=
t (no sleeping, though)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  202  		 */
300bab9770e2bd Ohad Ben-Cohen 2011-09-06  203  		if (hwlock->bank->ops->rel=
ax)
300bab9770e2bd Ohad Ben-Cohen 2011-09-06  204  			hwlock->bank->ops->relax(=
hwlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  205  	}
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  206 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  207  	return ret;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  208  }
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  209  EXPORT_SYMBOL_GPL(__hwspin_l=
ock_timeout);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  210 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  211  /**
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  212   * __hwspin_unlock() - unloc=
k a specific hwspinlock
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  213   * @hwlock: a previously-acq=
uired hwspinlock which we want to unlock
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  214   * @mode: controls whether l=
ocal interrupts needs to be restored or not
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  215   * @flags: previous caller's=
 interrupt state to restore (if requested)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  216   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  217   * This function will unlock=
 a specific hwspinlock, enable preemption and
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  218   * (possibly) enable interru=
pts or restore their previous state.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  219   * @hwlock must be already l=
ocked before calling this function: it is a bug
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  220   * to call unlock on a @hwlo=
ck that is already unlocked.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  221   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  222   * The user decides whether =
local interrupts should be enabled or not, and
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  223   * if yes, whether he wants =
their previous state to be restored. It is up
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  224   * to the user to choose the=
 appropriate @mode of operation, exactly the
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  225   * same way users decide bet=
ween spin_unlock, spin_unlock_irq and
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  226   * spin_unlock_irqrestore.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  227   *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  228   * The function will never s=
leep.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  229   */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  230  void __hwspin_unlock(struct =
hwspinlock *hwlock, int mode, unsigned long *flags)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  231  {
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  232  	BUG_ON(!hwlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  233  	BUG_ON(!flags && mode =3D=
=3D HWLOCK_IRQSTATE);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  234 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  235  	/*
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  236  	 * We must make sure that m=
emory operations (both reads and writes),
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  237  	 * done before unlocking th=
e hwspinlock, will not be reordered
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  238  	 * after the lock is releas=
ed.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  239  	 *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  240  	 * That's the purpose of th=
is explicit memory barrier.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  241  	 *
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  242  	 * Note: the memory barrier=
 induced by the spin_unlock below is too
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  243  	 * late; the other core is =
going to access memory soon after it will
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  244  	 * take the hwspinlock, and=
 by then we want to be sure our memory
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  245  	 * operations are already o=
bservable.
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  246  	 */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  247  	mb();
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  248 =20
300bab9770e2bd Ohad Ben-Cohen 2011-09-06  249  	hwlock->bank->ops->unlock(h=
wlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  250 =20
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  251  	/* Undo the spin_trylock{_i=
rq, _irqsave} called while locking */
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  252  	if (mode =3D=3D HWLOCK_IRQS=
TATE)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  253  		spin_unlock_irqrestore(&hw=
lock->lock, *flags);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  254  	else if (mode =3D=3D HWLOCK=
_IRQ)
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  255  		spin_unlock_irq(&hwlock->l=
ock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  256  	else
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  257  		spin_unlock(&hwlock->lock)=
;
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  258  }
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  259  EXPORT_SYMBOL_GPL(__hwspin_u=
nlock);
bd9a4c7df256ce Ohad Ben-Cohen 2011-02-17  260 =20
fb7737e949e31d Suman Anna     2015-03-04  261  /**
fb7737e949e31d Suman Anna     2015-03-04  262   * of_hwspin_lock_simple_xla=
te - translate hwlock_spec to return a lock id
fb7737e949e31d Suman Anna     2015-03-04  263   * @bank: the hwspinlock dev=
ice bank
fb7737e949e31d Suman Anna     2015-03-04  264   * @hwlock_spec: hwlock spec=
ifier as found in the device tree
fb7737e949e31d Suman Anna     2015-03-04  265   *
fb7737e949e31d Suman Anna     2015-03-04  266   * This is a simple translat=
ion function, suitable for hwspinlock platform
fb7737e949e31d Suman Anna     2015-03-04  267   * drivers that only has a l=
ock specifier length of 1.
fb7737e949e31d Suman Anna     2015-03-04  268   *
fb7737e949e31d Suman Anna     2015-03-04  269   * Returns a relative index =
of the lock within a specified bank on success,
fb7737e949e31d Suman Anna     2015-03-04  270   * or -EINVAL on invalid spe=
cifier cell count.
fb7737e949e31d Suman Anna     2015-03-04  271   */
fb7737e949e31d Suman Anna     2015-03-04  272  static inline int
fb7737e949e31d Suman Anna     2015-03-04  273  of_hwspin_lock_simple_xlate(=
const struct of_phandle_args *hwlock_spec)
fb7737e949e31d Suman Anna     2015-03-04 @274  {
fb7737e949e31d Suman Anna     2015-03-04  275  	if (WARN_ON(hwlock_spec->ar=
gs_count !=3D 1))
fb7737e949e31d Suman Anna     2015-03-04  276  		return -EINVAL;
fb7737e949e31d Suman Anna     2015-03-04  277 =20
fb7737e949e31d Suman Anna     2015-03-04  278  	return hwlock_spec->args[0]=
;
fb7737e949e31d Suman Anna     2015-03-04  279  }
fb7737e949e31d Suman Anna     2015-03-04  280 =20

:::::: The code at line 180 was first introduced by commit
:::::: bd9a4c7df256cee4e9f6a4b56baa3b89d63f0f1e drivers: hwspinlock: add fr=
amework

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

